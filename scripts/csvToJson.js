const fs = require('fs');
const csv = require('csv-parser');

const inputFilePath = '../output/saved/log.csv'; // Replace with the actual path to your CSV file
const outputFilePath = 'inventory.json'; // Replace with the desired path for the JSON output

const images = [];

fs.createReadStream(inputFilePath)
  .pipe(csv({ skipEmptyLines: true }))
  .on('data', (row) => {
    const image = {
      prompt: row.prompt,
      seed: parseInt(row.seed),
      width: parseInt(row.width),
      height: parseInt(row.height),
      sampler: row.sampler,
      cfgs: parseInt(row.cfgs),
      steps: parseInt(row.steps),
      filename: row.filename,
      negative_prompt: row.negative_prompt,
    };
    images.push(image);
  })
  .on('end', () => {
    const jsonData = JSON.stringify(images, null, 2);

    fs.writeFile(outputFilePath, jsonData, (err) => {
      if (err) {
        console.error('Error writing JSON file:', err);
      } else {
        console.log('JSON file has been written successfully.');
      }
    });
  });
