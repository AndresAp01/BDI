import re
import pymssql
from fastapi import FastAPI, Form, Request
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
 
app = FastAPI()
templates = Jinja2Templates(directory="templates")
