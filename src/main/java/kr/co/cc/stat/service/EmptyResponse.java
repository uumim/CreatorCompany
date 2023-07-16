/*
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */
/*
 * This code was generated by https://github.com/googleapis/google-api-java-client-services/
 * Modify at your own risk.
 */

package kr.co.cc.stat.service;
//package com.google.api.services.youtubeAnalytics.v2.model;
/**
 * Empty response.
 *
 * <p> This is the Java data model class that specifies how to parse/serialize into the JSON that is
 * transmitted over HTTP when working with the YouTube Analytics API. For a detailed explanation
 * see:
 * <a href="https://developers.google.com/api-client-library/java/google-http-java-client/json">https://developers.google.com/api-client-library/java/google-http-java-client/json</a>
 * </p>
 *
 * @author Google, Inc.
 */
@SuppressWarnings("javadoc")
public final class EmptyResponse extends com.google.api.client.json.GenericJson {

  /**
   * Apiary error details
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private Errors errors;

  /**
   * Apiary error details
   * @return value or {@code null} for none
   */
  public Errors getErrors() {
    return errors;
  }

  /**
   * Apiary error details
   * @param errors errors or {@code null} for none
   */
  public EmptyResponse setErrors(Errors errors) {
    this.errors = errors;
    return this;
  }

  @Override
  public EmptyResponse set(String fieldName, Object value) {
    return (EmptyResponse) super.set(fieldName, value);
  }

  @Override
  public EmptyResponse clone() {
    return (EmptyResponse) super.clone();
  }

}