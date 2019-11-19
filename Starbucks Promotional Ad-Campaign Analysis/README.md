# Tacobell Promotion Strategy and Sales Forecasting

Tacobell being one of the major chains of fast food restaurants in the US with numerous stores. One of the main reasons why this company can achieve that feat is by focusing on customer experience relentlessly.

The greatest convenience given to its customers was the introduction of Tacobell App. The Tacobell App enables customers to receive promotion offers which emphasize on maximizing customers’ benefit in purchasing their items in Tacobell.

The challenge in giving promotion to the customers is that each customer has a different preference regarding the offers they receive. Should they receive an offer they don’t like, they will most likely not attempt to complete the offer although all offers benefit them. Also, how this will directly or indirectly impact the sales of Tacobell. With the advance of Artificial Intelligence (AI) and Machine Learning (ML), it has become possible for Tacobell to address this problem


#### Web Application Link: https://tacobell.herokuapp.com/

#### Clat Document : https://tinyurl.com/info7374-team5-finalproj-clat

#### Proposal Document : https://tinyurl.com/info7374-team5-finalproj-pro

This casestudy focuses on learning the sales and promotions data from Starbucks  

#### Use Cases :
 1. Sales Forecasting
 2. Uplift Modeling
 3. Offer Recommendation

#### Dataset 

Datasets for each use case is uploaded on Google BigQuery and synced to Jupyter notebooks and flask application:

**Important columns for Sales Data**
Order_ID, Customer_ID, Customer_Name, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Quantity, Sale

**Important columns for Promotion Data**
- portfolio.json - containing offer ids and meta data about each offer (id, offer_type, difficulty, reward, duration, channels)
- profile.json - demographic data for each customer (age, became_member_on, gender, id, income)
- transcript.json - records for transactions, offers received, offers viewed, and offers completed (event, customer id, time, value)


#### Python Notebooks

We have one module for each case for manual implementation of predictive models for use cases.

1.  *Tacobell Flask Application* - This app contains EDA on sales and promotion data along with the recommendation engine, sales forceast, and optimization of revenue response. The app is deployed on Heroku.

    *Learn how to create flask application* - http://jonathansoma.com/tutorials/webapps/intro-to-flask/
    
    *Steps to deploy application on Heroku* - https://medium.com/the-andela-way/deploying-a-python-flask-app-to-heroku-41250bda27d0
     
2.  *Sales Forecasting without offer.ipynb* - Future sales are forecasted based on Order Date without considering any promotions

    *Post Promotional Offer Sales Forecasting.ipynb* - Sales forecast with a what if analysis of applying promotions

3.  *Tacobell Offer Recommendation_v1.ipynb* - This notebook contains data understanding, preprocessing, transforming, and ML models for predicting age and gender and recommendation engine.

4.  *Daily_data_all.ipynb* - This notebook generates daily_data_rolling.csv, which is the daily time series summary of user transactional behavior.

5.  *Uplift_models_comparison.ipynb* - This notebook compares to check how the 4 promotion uplift strategies perform so that the best promotion uplift strategy(Treatment Dummy Approach) can be applied to our final Offer models

6. *Offer_0.ipynb/ ... /Offer_9.ipynb* - This is a notebook for each of the 10 promotion strategies catered to each offer type.
 
 
#### Test_case Validation:

We evaluate the strategy's performance by calculating the Net Incremental Revenue (NIR) of the promotional strategy. This will estimate the amount of additional profits for Tacobell should the strategy be implemented.

The baseline strategy will be to send the offer to everyone in the dataset, which is identical to the approach used in the original experiment. The uplift model will be the machine-learning based promotion strategy implemented for this project. Our objective will be to improve on the baseline results.

The readme file in the test folder contains further details.

*We can see that the predicted NIR are much better than the baseline strategy NIR , thus our model is giving better predictions for which customers to target for the given offers, and thus the model is valid* 

