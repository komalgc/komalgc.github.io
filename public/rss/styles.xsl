<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="/rss/channel/title" /></title>
        <style>
          /* Base Styles */
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            transition: background-color 0.3s, color 0.3s;
          }
          h1, h2 {
            color: #007acc;
          }
          .post {
            margin-bottom: 20px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
          }
          .date {
            color: #555;
            font-size: 0.9em;
          }

          /* Light Mode Styles */
          .light-mode {
            background-color: #f9f9f9;
            color: #333;
          }
          .light-mode h1, .light-mode h2 {
            color: #007acc;
          }
          .light-mode .post {
            border-bottom: 1px solid #ccc;
          }
          .light-mode .date {
            color: #555;
          }
          .light-mode a {
            color: #007acc;
          }

          /* Dark Mode Styles */
          .dark-mode {
            background-color: #424242;
            color: #ddd;
          }
          .dark-mode h1, .dark-mode h2 {
            color: #4da8da;
          }
          .dark-mode .post {
            border-bottom: 1px solid #555;
          }
          .dark-mode .date {
            color: #bbb;
          }
          .dark-mode a {
            color: #ffffff; /* URL color in dark mode */
          }
          .dark-mode #nightText {
            color: #ffffff; /* Night mode text in white */
          }

          /* Toggle Button Styles */
          #darkToggle {
            position: absolute; /* Position the button */
            top: 20px;          /* Align at the top with padding */
            right: 20px;        /* Align to the right side */
            display: flex;
            align-items: center;
            font-family: Arial, sans-serif;
            font-size: 1em;
            font-weight: medium;
            cursor: pointer;
            color: #333;
          }
          #darkToggle .horizon {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 24px;
            height: 24px;
            overflow: hidden;
          }
          #darkToggle .horizon svg {
            width: 24px;
            height: 24px;
            transition: transform 0.7s ease;
          }
          #sun {
            display: block;
          }
          #moon {
            display: none;
          }
          .dark-mode #sun {
            display: none;
          }
          .dark-mode #moon {
            display: block;
          }
          #dayText,
          #nightText {
            margin-left: 8px; /* Add space between icon and text */
          }
          #nightText {
            display: none;
          }
          .dark-mode #dayText {
            display: none;
          }
          .dark-mode #nightText {
            display: inline-block;
          }
          .dark-mode #darkToggle svg {
            stroke: #ffffff;
          }

        </style>
        <script>
          function toggleMode() {
            document.body.classList.toggle('dark-mode');
            document.body.classList.toggle('light-mode');
          }
          document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("darkToggle").addEventListener("click", toggleMode);
          });
        </script>
      </head>
      <body class="light-mode">
        
        <!-- Toggle Button -->
        <div
          id="darkToggle"
          class="relative flex items-center pl-6 ml-4 font-medium tracking-wide cursor-pointer text-neutral-800 group dark:text-white"
        >
          <div
            class="absolute left-0 flex items-center justify-center w-6 h-6 overflow-hidden border-b border-transparent horizon group-hover:border-neutral-600"
          >
            <svg
              class="absolute w-6 h-6 transition duration-700 transform ease"
              id="sun"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"
              ></path>
            </svg>
            <svg
              class="absolute hidden w-6 h-6 transition duration-700 transform ease"
              id="moon"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
              ></path>
            </svg>
          </div>
          <span class="hidden sm:inline-block">
            
          </span>
        </div>

        <h1><xsl:value-of select="/rss/channel/title" /></h1>
        <p><xsl:value-of select="/rss/channel/description" /></p>

        <xsl:for-each select="/rss/channel/item">
          <div class="post">
            <h2><a href="{link}"><xsl:value-of select="title" /></a></h2>

            <p class="date"><xsl:value-of select="pubDate" /></p>

            <p><xsl:value-of select="description" /></p>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>