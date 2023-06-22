Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869C6EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6wp/wCUz3KFxEfVASu6n2UTMhZq6PTtruTIYBKxWijs=; b=a1ncDmuRqPJ18uh+GCTyJKVvEJ
	9sf7MkL4Wx70HcB9dOKMeLL/t0SiRxVbtYUOc5nvz3msLA7KfHgp9DXMEPpiAdZoRGXM2/02ibIUD
	ATG6ucUo72oS5gz/gOVO/u0ivzeWpIAM7uk740Ad7cu10DX9VyM414evEe4piN129g6xBvXcsolj3
	6zTJvpAQ71wH29FhhQglLqHZKg7MLk5QiIgueF7oM7yaz2VH56EisSqyx7konVDB/ICLFeZa2er9R
	Ms8B6bfy29oM5WEA2In2XCCmlzwJHx9/LA86I6paL9Thm57eGC5w9xPJeEZBFWzUJaU7y5vWVajof
	ruQKYxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLzj-00163r-2U;
	Thu, 22 Jun 2023 15:13:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLzg-00162U-1N
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 15:13:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-51452556acdso3491861a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687446781; x=1690038781;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWoBwn7kjOnWJ8cQ9OaXHQdl/aiQSmn14uD4PvCcxzE=;
        b=axk7hiernNQEvMLwxW/t+q32Dq3MztflbNUfqGg7S6uuw1pdYSv8doPGQ64t/whnp3
         uMr5j+8BIjchom/j29y9Sg2eiX8wGvZdnVgLCzDR4Y+OXsgP3id6WKhbVxma5hcEzB5c
         Mj9EuCPKAOpOr7losO/cP1Xbuz3lhqFSL22rr5jj2Iyl8XV4pzYzeR93fV9tQHh9nmOg
         vB7p6+Cbxc8WdFOVYePavlSSPfr9HUHsuRItTJvNJZnZf4HhBlPd38ZfAHbNfHnpvleY
         4jaO8Bm2Px9NCVkgGdb4C5PyuBeoPGW5a2n/zWajMiDxFjqFLmnxVfmoYUEWdSlmkNbE
         50Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446781; x=1690038781;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWoBwn7kjOnWJ8cQ9OaXHQdl/aiQSmn14uD4PvCcxzE=;
        b=gH2xRaXM8DQNTN98XpXUpodJJrUQMajXTKkzN7mORd1zfzPzEI07lM+AysCSC4k8Kq
         lzVtRN25ulBIHAGRvdNXlNKeR3Nj9tHIqe1RpIVn1ohyZu/l93pJj6Ego5SydgHcKJVh
         lHa8pdpnZh0UKgyivFuF0d5Ot9jr1Vfhau3d5akzgMyFEmKHUVNRk1j9+eP8PgVdVIAi
         kkCBWrjb3UyZiy9Y10ue+gl3SFRhZjIymtzMpxwvjvFM55N5lrm3yDr/VK0rHYCg3rb5
         FNVWrhH/FvT8rd14YQLUJiXS4ew/RpA7/FfYMv9FU5Utep/hJZPPwWV1G2PWz7ETBk1Q
         S+7A==
X-Gm-Message-State: AC+VfDy60/2PznUHfkYVwfguKH4PqqCOTlPUeDmAuxxo8fkz034Dhdaw
	vvUXNCDTmjw568r4BJh2niTvMA==
X-Google-Smtp-Source: ACHHUZ5Euxbr2zsl3BHypE18SGhVZ6f/GRnCEfjFokRyYC8Tkc1YmWl2e6vmy6euSiXkRS8u6rgLcg==
X-Received: by 2002:a05:6a20:8f0f:b0:ff:f3d9:1ada with SMTP id b15-20020a056a208f0f00b000fff3d91adamr15056171pzk.60.1687446781174;
        Thu, 22 Jun 2023 08:13:01 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a3-20020a62bd03000000b00669c99d05fasm4044964pff.150.2023.06.22.08.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:13:00 -0700 (PDT)
Date: Thu, 22 Jun 2023 08:13:00 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 08:12:01 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: Pre-allocate PGD entries vmalloc/modules area
In-Reply-To: <20230529180023.289904-1-bjorn@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
  linux-mm@kvack.org, linux@rivosinc.com, alexghiti@rivosinc.com, joro@8bytes.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org
Message-ID: <mhng-fc6025e7-ff1b-46e2-86a5-f74a3db74bd2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_081308_465083_C3FE259A 
X-CRM114-Status: GOOD (  35.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyOSBNYXkgMjAyMyAxMTowMDoyMyBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBU
aGUgUklTQy1WIHBvcnQgcmVxdWlyZXMgdGhhdCBrZXJuZWwgUEdEIGVudHJpZXMgYXJlIHRvIGJl
Cj4gc3luY2hyb25pemVkIGJldHdlZW4gTU1zLiBUaGlzIGlzIGRvbmUgdmlhIHRoZSB2bWFsbG9j
X2ZhdWx0KCkKPiBmdW5jdGlvbiwgdGhhdCBzaW1wbHkgY29waWVzIHRoZSBQR0QgZW50cmllcyBm
cm9tIGluaXRfbW0gdG8gdGhlCj4gZmF1bHRpbmcgb25lLgo+Cj4gSGlzdG9yaWNhbGx5LCBmYXVs
dGluZyBpbiBQR0QgZW50cmllcyBoYXZlIGJlZW4gYSBzb3VyY2UgZm9yIGJvdGggYnVncwo+IFsx
XSwgYW5kIHBvb3IgcGVyZm9ybWFuY2UuCj4KPiBPbmUgd2F5IHRvIGdldCByaWQgb2Ygdm1hbGxv
YyBmYXVsdHMgaXMgYnkgcHJlLWFsbG9jYXRpbmcgdGhlIFBHRAo+IGVudHJpZXMuIFByZS1hbGxv
Y2F0aW5nIHRoZSBlbnRyaWVzIHBvdGllbnRpYWxseSB3YXN0ZXMgNjQgKiA0SyAoNjUgb24KPiBT
VjM5KS4gVGhlIHByZS1hbGxvY2F0aW9uIGZ1bmN0aW9uIGlzIHB1bGxlZCBmcm9tIErDtnJnIFLD
tmRlbCdzIHg4Ngo+IHdvcmssIHdpdGggdGhlIGFkZGl0aW9uIG9mIDMtbGV2ZWwgcGFnZSB0YWJs
ZXMgKFBNRCBhbGxvY2F0aW9ucykuCj4KPiBUaGUgcG1kX2FsbG9jKCkgZnVuY3Rpb24gbmVlZHMg
dGhlIHB0bG9jayBjYWNoZSB0byBiZSBpbml0aWFsaXplZAo+ICh3aGVuIHNwbGl0IHBhZ2UgbG9j
a3MgaXMgZW5hYmxlZCksIHNvIHRoZSBwcmUtYWxsb2NhdGlvbiBpcyBkb25lIGluIGEKPiBSSVND
LVYgc3BlY2lmaWMgcGd0YWJsZV9jYWNoZV9pbml0KCkgaW1wbGVtZW50YXRpb24uCj4KPiBQcmUt
YWxsb2NhdGUgdGhlIGtlcm5lbCBQR0QgZW50cmllcyBmb3IgdGhlIHZtYWxsb2MvbW9kdWxlcyBh
cmVhLCBidXQKPiBvbmx5IGZvciA2NGIgcGxhdGZvcm1zLgo+Cj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIwMDUwODE0NDA0My4xMzg5My0xLWpvcm9AOGJ5dGVzLm9yZy8g
IyBbMV0KPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyB8IDIwICsrKy0tLS0tLS0tLS0tLQo+ICBh
cmNoL3Jpc2N2L21tL2luaXQuYyAgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9y
aXNjdi9tbS9mYXVsdC5jCj4gaW5kZXggODY4NWY4NWE3NDc0Li42YjBiNWU1MTdlMTIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9mYXVs
dC5jCj4gQEAgLTIzMCwzMiArMjMwLDIwIEBAIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCj4gIAkJcmV0dXJuOwo+Cj4gIAkvKgo+IC0JICogRmF1bHQtaW4ga2Vy
bmVsLXNwYWNlIHZpcnR1YWwgbWVtb3J5IG9uLWRlbWFuZC4KPiAtCSAqIFRoZSAncmVmZXJlbmNl
JyBwYWdlIHRhYmxlIGlzIGluaXRfbW0ucGdkLgo+ICsJICogRmF1bHQtaW4ga2VybmVsLXNwYWNl
IHZpcnR1YWwgbWVtb3J5IG9uLWRlbWFuZCwgZm9yIDMyLWJpdAo+ICsJICogYXJjaGl0ZWN0dXJl
cy4gIFRoZSAncmVmZXJlbmNlJyBwYWdlIHRhYmxlIGlzIGluaXRfbW0ucGdkLgoKVGhhdCB3b3Jk
aW5nIHNlZW1zIGEgbGl0dGxlIG9kZCB0byBtZTogSSB0aGluayBFbmdsaXNoIGFsbG93cyBmb3Ig
dGhlc2UgCiJhZGQgc29tZXRoaW5nIGFmdGVyIHRoZSBjb21tYSB0byBjaGFuZ2UgdGhlIG1lYW5p
bmcgb2YgYSBzZW50ZW5jZSIgCnRoaW5ncywgYnV0IHRoZXkncmUga2luZCBvZiBjb21wbGljYXRl
ZC4gIE1heWJlIGl0J3MgZWFzaWVyIHRvIGp1c3QgZmxpcCAKdGhlIG9yZGVyPwoKVGhhdCBzYWlk
LCBpdCdzIHZlcnkgZWFybHkgc28gbWF5YmUgaXQncyBmaW5lLi4uCgo+ICAJICoKPiAgCSAqIE5P
VEUhIFdlIE1VU1QgTk9UIHRha2UgYW55IGxvY2tzIGZvciB0aGlzIGNhc2UuIFdlIG1heQo+ICAJ
ICogYmUgaW4gYW4gaW50ZXJydXB0IG9yIGEgY3JpdGljYWwgcmVnaW9uLCBhbmQgc2hvdWxkCj4g
IAkgKiBvbmx5IGNvcHkgdGhlIGluZm9ybWF0aW9uIGZyb20gdGhlIG1hc3RlciBwYWdlIHRhYmxl
LAo+ICAJICogbm90aGluZyBtb3JlLgo+ICAJICovCj4gLQlpZiAodW5saWtlbHkoKGFkZHIgPj0g
Vk1BTExPQ19TVEFSVCkgJiYgKGFkZHIgPCBWTUFMTE9DX0VORCkpKSB7Cj4gKwlpZiAoIUlTX0VO
QUJMRUQoQ09ORklHXzY0QklUKSAmJgo+ICsJICAgIHVubGlrZWx5KGFkZHIgPj0gVk1BTExPQ19T
VEFSVCAmJiBhZGRyIDwgVk1BTExPQ19FTkQpKSB7Cj4gIAkJdm1hbGxvY19mYXVsdChyZWdzLCBj
b2RlLCBhZGRyKTsKPiAgCQlyZXR1cm47Cj4gIAl9Cj4KPiAtI2lmZGVmIENPTkZJR182NEJJVAo+
IC0JLyoKPiAtCSAqIE1vZHVsZXMgaW4gNjRiaXQga2VybmVscyBsaWUgaW4gdGhlaXIgb3duIHZp
cnR1YWwgcmVnaW9uIHdoaWNoIGlzIG5vdAo+IC0JICogaW4gdGhlIHZtYWxsb2MgcmVnaW9uLCBi
dXQgZGVhbGluZyB3aXRoIHBhZ2UgZmF1bHRzIGluIHRoaXMgcmVnaW9uCj4gLQkgKiBvciB0aGUg
dm1hbGxvYyByZWdpb24gYW1vdW50cyB0byBkb2luZyB0aGUgc2FtZSB0aGluZzogY2hlY2tpbmcg
dGhhdAo+IC0JICogdGhlIG1hcHBpbmcgZXhpc3RzIGluIGluaXRfbW0ucGdkIGFuZCB1cGRhdGlu
ZyB1c2VyIHBhZ2UgdGFibGUsIHNvCj4gLQkgKiBqdXN0IHVzZSB2bWFsbG9jX2ZhdWx0Lgo+IC0J
ICovCj4gLQlpZiAodW5saWtlbHkoYWRkciA+PSBNT0RVTEVTX1ZBRERSICYmIGFkZHIgPCBNT0RV
TEVTX0VORCkpIHsKPiAtCQl2bWFsbG9jX2ZhdWx0KHJlZ3MsIGNvZGUsIGFkZHIpOwo+IC0JCXJl
dHVybjsKPiAtCX0KPiAtI2VuZGlmCj4gIAkvKiBFbmFibGUgaW50ZXJydXB0cyBpZiB0aGV5IHdl
cmUgZW5hYmxlZCBpbiB0aGUgcGFyZW50IGNvbnRleHQuICovCj4gIAlpZiAoIXJlZ3NfaXJxc19k
aXNhYmxlZChyZWdzKSkKPiAgCQlsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCA3NDdlNWIx
ZWYwMmQuLjM4YmQ0ZGQ5NTI3NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+
ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTEzNjMsMyArMTM2Myw2MSBAQCBpbnQg
X19tZW1pbml0IHZtZW1tYXBfcG9wdWxhdGUodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQsIGludCBub2RlLAo+ICAJcmV0dXJuIHZtZW1tYXBfcG9wdWxhdGVfYmFzZXBhZ2Vz
KHN0YXJ0LCBlbmQsIG5vZGUsIE5VTEwpOwo+ICB9Cj4gICNlbmRpZgo+ICsKPiArI2lmZGVmIENP
TkZJR182NEJJVAo+ICsvKgo+ICsgKiBQcmUtYWxsb2NhdGVzIHBhZ2UtdGFibGUgcGFnZXMgZm9y
IGEgc3BlY2lmaWMgYXJlYSBpbiB0aGUga2VybmVsCj4gKyAqIHBhZ2UtdGFibGUuIE9ubHkgdGhl
IGxldmVsIHdoaWNoIG5lZWRzIHRvIGJlIHN5bmNocm9uaXplZCBiZXR3ZWVuCj4gKyAqIGFsbCBw
YWdlLXRhYmxlcyBpcyBhbGxvY2F0ZWQgYmVjYXVzZSB0aGUgc3luY2hyb25pemF0aW9uIGNhbiBi
ZQo+ICsgKiBleHBlbnNpdmUuCj4gKyAqLwo+ICtzdGF0aWMgdm9pZCBfX2luaXQgcHJlYWxsb2Nh
dGVfcGdkX3BhZ2VzX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5k
LAo+ICsJCQkJCSAgICAgICBjb25zdCBjaGFyICphcmVhKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25n
IGFkZHI7Cj4gKwljb25zdCBjaGFyICpsdmw7Cj4gKwo+ICsJZm9yIChhZGRyID0gc3RhcnQ7IGFk
ZHIgPCBlbmQgJiYgYWRkciA+PSBzdGFydDsgYWRkciA9IEFMSUdOKGFkZHIgKyAxLCBQR0RJUl9T
SVpFKSkgewo+ICsJCXBnZF90ICpwZ2QgPSBwZ2Rfb2Zmc2V0X2soYWRkcik7Cj4gKwkJcDRkX3Qg
KnA0ZDsKPiArCQlwdWRfdCAqcHVkOwo+ICsJCXBtZF90ICpwbWQ7Cj4gKwo+ICsJCWx2bCA9ICJw
NGQiOwo+ICsJCXA0ZCA9IHA0ZF9hbGxvYygmaW5pdF9tbSwgcGdkLCBhZGRyKTsKPiArCQlpZiAo
IXA0ZCkKPiArCQkJZ290byBmYWlsZWQ7Cj4gKwo+ICsJCWlmIChwZ3RhYmxlX2w1X2VuYWJsZWQp
Cj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlsdmwgPSAicHVkIjsKPiArCQlwdWQgPSBwdWRfYWxs
b2MoJmluaXRfbW0sIHA0ZCwgYWRkcik7Cj4gKwkJaWYgKCFwdWQpCj4gKwkJCWdvdG8gZmFpbGVk
Owo+ICsKPiArCQlpZiAocGd0YWJsZV9sNF9lbmFibGVkKQo+ICsJCQljb250aW51ZTsKPiArCj4g
KwkJbHZsID0gInBtZCI7Cj4gKwkJcG1kID0gcG1kX2FsbG9jKCZpbml0X21tLCBwdWQsIGFkZHIp
Owo+ICsJCWlmICghcG1kKQo+ICsJCQlnb3RvIGZhaWxlZDsKPiArCX0KPiArCXJldHVybjsKPiAr
Cj4gK2ZhaWxlZDoKPiArCS8qCj4gKwkgKiBUaGUgcGFnZXMgaGF2ZSB0byBiZSB0aGVyZSBub3cg
b3IgdGhleSB3aWxsIGJlIG1pc3NpbmcgaW4KPiArCSAqIHByb2Nlc3MgcGFnZS10YWJsZXMgbGF0
ZXIuCj4gKwkgKi8KPiArCXBhbmljKCJGYWlsZWQgdG8gcHJlLWFsbG9jYXRlICVzIHBhZ2VzIGZv
ciAlcyBhcmVhXG4iLCBsdmwsIGFyZWEpOwo+ICt9Cj4gKwo+ICt2b2lkIF9faW5pdCBwZ3RhYmxl
X2NhY2hlX2luaXQodm9pZCkKPiArewo+ICsJcHJlYWxsb2NhdGVfcGdkX3BhZ2VzX3JhbmdlKFZN
QUxMT0NfU1RBUlQsIFZNQUxMT0NfRU5ELCAidm1hbGxvYyIpOwo+ICsJaWYgKElTX0VOQUJMRUQo
Q09ORklHX01PRFVMRVMpKQo+ICsJCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShNT0RVTEVT
X1ZBRERSLCBNT0RVTEVTX0VORCwgImJwZi9tb2R1bGVzIik7Cj4gK30KPiArI2VuZGlmCj4KPiBi
YXNlLWNvbW1pdDogYWM5YTc4NjgxYjkyMTg3NzUxODc2M2JhMGU4OTIwMjI1NDM0OWQxYgoKUmV2
aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgoKYXNpZGUgZnJv
bSB0aGUgYnVpbGQgaXNzdWUsIHdoaWNoIHNlZW1zIHByZXR0eSBzdHJhaWdodC1mb3J3YXJkLiAg
SSdtIApnb2luZyB0byBkcm9wIHRoaXMgZnJvbSBwYXRjaHdvcmsuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
