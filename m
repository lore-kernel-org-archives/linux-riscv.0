Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82DDC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qPEtbMbYp62Xghso+/odL8gEZBM6i6yQ0xYpr7nK4xs=; b=W43nsSOHpiXv/psh8hDwuZhWvh
	LC5vvVz2gIZwHJN2TWAoZbzVoT2Jq21RFjCIJzZ6vhNDjMkOYPwd+iWNRkpm+jaP8FzPZC/P1PqWs
	Gv2tE8xrqtoUR+/Sl2at59g8OSqwAmpOZz0O5MQ+PfsfmoohVGoLZ208RxvErCg0Tdy+74rqejcJv
	C3vV8FdwX1zNB/kX0tok6Rbsyf+YYJJVFHS/Sq21jkyb2Xw8Ze5M1yqk3x8Ua8Z/CUJ4W2YMzcgQm
	5ivrctqInDaxLm2kHiGnup1a4S+OnEK5MebLp4f5ozZAcrqDFUZWHxypQ/FHWWJ4CSeKp+jtEUKAj
	mQv4P/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfdo-00000007UNs-064N;
	Fri, 22 Mar 2024 14:13:04 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfdk-00000007UKA-2evc
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 14:13:02 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2218da9620cso1178520fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711116770; x=1711721570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMwbsV2lr5D+n8eq4lwX8uN+1JbL7Okl9fmvTySMdOM=;
        b=XrKlpIQLdY8O3y217ji01oy1hwAci5Vvmtr25S0aII5ScCgCMIN+lsyvBB9iIioQN0
         N9bn99isbUeJj6QyRUwVj2E6GYrvaSB7W5euO50LtBpOAj2adxUY3z8ykHkrUJYVVHQN
         W8Xp0LlFyPp864qVOO0QbxMeY0FKvf6xwQMFTfIMKrd+zvY32HU1RYs/gXaLYA8ualAv
         mUOKmYEfvEqbI1BV/2TVacLrBO+zLZJ04psqpKZPx7AnWX4mZ94Y5AXCPYksllFKpKEq
         HkRU+lRynuo5CMDNhHxefpJB79QUPQ6JKMmCfO7wD/g3mw5ZhQs4tGATcaOp1w8LtAlx
         nJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116770; x=1711721570;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMwbsV2lr5D+n8eq4lwX8uN+1JbL7Okl9fmvTySMdOM=;
        b=N2P1HV1WO2bZiOOxuOMo1NRYcX/hImegNwSzonkiKIxVlpTXzpKNjq25W/aCWJXJaF
         vMDTGUs4Ni3UPSp/srbavfGD8wmwLOlYiMpRerKv/9H8T5N7oRW1TYV350azs9MX8rVu
         q1xMe5Vz8IdeqF3z59gnIdc29Qq9yIZZ6SNYnZgPoJckY9oaWOpvJ9zxITdT765/N9tr
         R36ZQjNesJ1ffUI8ZzvBz6P/L8lCxyyyDGeM9OZo7oksV00mcAgCBTV351z/jCnkkhi2
         02oAgt3qFem3nTM9Luzvi4WCDjn3tV4DGwpsV9++UTKsdom/E78awbx3P4jtlBmO3P5O
         sJcw==
X-Forwarded-Encrypted: i=1; AJvYcCU0H443+aFHIJAgdrYerW0R7T19mNrl25Sq0KpwULVS10qqkC/xfZ3PezqrxLyqW5IuDyknYegQVa7wuGdpVyfL54mTpcTMnbKBueBjbppo
X-Gm-Message-State: AOJu0YzqTHm6ixTDZi3tbo28SRoTkhsIZrJk5EsmR87svp/EY2QGOmtv
	a1UKr00PSYmEwg/RiS+8RPYKCe0aiixZKgbiHWEDqxgRJBxpDTWNfE7Sj+Xl98DeX2nqquQATr/
	W
X-Google-Smtp-Source: AGHT+IF67p/WhASEEUOaMLQ7DminN+c4zr/4NoTc7CLi/rZc+sVKHX93JtQeh2Zc4uFIFtVUaKoXtg==
X-Received: by 2002:a05:6a21:920a:b0:1a3:7b9a:4dd6 with SMTP id tl10-20020a056a21920a00b001a37b9a4dd6mr2763771pzb.54.1711116379234;
        Fri, 22 Mar 2024 07:06:19 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x8-20020a056a000bc800b006ea918dab9csm94982pfu.157.2024.03.22.07.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 07:06:18 -0700 (PDT)
Date: Fri, 22 Mar 2024 07:06:18 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Mar 2024 07:06:16 PDT (-0700)
Subject: Re: [PATCH v3 1/3] riscv: mm: Use hint address in mmap if available
In-Reply-To: <ZbxTNjQPFKBatMq+@ghost>
CC: cyy@cyyself.name, alexghiti@rivosinc.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, shuah@kernel.org, corbet@lwn.net, linux-mm@kvack.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
  linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-5d9bb6c0-9f40-44b2-b9dc-3823cf6dbdef@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_071300_805026_E5483327 
X-CRM114-Status: GOOD (  43.19  )
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

T24gVGh1LCAwMSBGZWIgMjAyNCAxODoyODowNiBQU1QgKC0wODAwKSwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFdlZCwgSmFuIDMxLCAyMDI0IGF0IDExOjU5OjQzUE0gKzA4MDAsIFlhbmd5
dSBDaGVuIHdyb3RlOgo+PiBPbiBXZWQsIDIwMjQtMDEtMzEgYXQgMjI6NDEgKzA4MDAsIFlhbmd5
dSBDaGVuIHdyb3RlOgo+PiA+IE9uIFR1ZSwgMjAyNC0wMS0zMCBhdCAxNzowNyAtMDgwMCwgQ2hh
cmxpZSBKZW5raW5zIHdyb3RlOgo+PiA+ID4gT24gcmlzY3YgaXQgaXMgZ3VhcmFudGVlZCB0aGF0
IHRoZSBhZGRyZXNzIHJldHVybmVkIGJ5IG1tYXAgaXMgbGVzcwo+PiA+ID4gdGhhbgo+PiA+ID4g
dGhlIGhpbnQgYWRkcmVzcy4gQWxsb3cgbW1hcCB0byByZXR1cm4gYW4gYWRkcmVzcyBhbGwgdGhl
IHdheSB1cCB0bwo+PiA+ID4gYWRkciwgaWYgcHJvdmlkZWQsIHJhdGhlciB0aGFuIGp1c3QgdXAg
dG8gdGhlIGxvd2VyIGFkZHJlc3Mgc3BhY2UuCj4+ID4gPiAKPj4gPiA+IFRoaXMgcHJvdmlkZXMg
YSBwZXJmb3JtYW5jZSBiZW5lZml0IGFzIHdlbGwsIGFsbG93aW5nIG1tYXAgdG8gZXhpdAo+PiA+
ID4gYWZ0ZXIKPj4gPiA+IGNoZWNraW5nIHRoYXQgdGhlIGFkZHJlc3MgaXMgaW4gcmFuZ2UgcmF0
aGVyIHRoYW4gc2VhcmNoaW5nIGZvciBhCj4+ID4gPiB2YWxpZAo+PiA+ID4gYWRkcmVzcy4KPj4g
PiA+IAo+PiA+ID4gSXQgaXMgcG9zc2libGUgdG8gcHJvdmlkZSBhbiBhZGRyZXNzIHRoYXQgdXNl
cyBhdCBtb3N0IHRoZSBzYW1lCj4+ID4gPiBudW1iZXIKPj4gPiA+IG9mIGJpdHMsIGhvd2V2ZXIg
aXQgaXMgc2lnbmlmaWNhbnRseSBtb3JlIGNvbXB1dGF0aW9uYWxseSBleHBlbnNpdmUKPj4gPiA+
IHRvCj4+ID4gPiBwcm92aWRlIHRoYXQgbnVtYmVyIHJhdGhlciB0aGFuIHNldHRpbmcgdGhlIG1h
eCB0byBiZSB0aGUgaGludAo+PiA+ID4gYWRkcmVzcy4KPj4gPiA+IFRoZXJlIGlzIHRoZSBpbnN0
cnVjdGlvbiBjbHovY2x6dyBpbiBaYmIgdGhhdCByZXR1cm5zIHRoZSBoaWdoZXN0Cj4+ID4gPiBz
ZXQKPj4gPiA+IGJpdAo+PiA+ID4gd2hpY2ggY291bGQgYmUgdXNlZCB0byBwZXJmb3JtYW50bHkg
aW1wbGVtZW50IHRoaXMsIGJ1dCBpdCB3b3VsZAo+PiA+ID4gc3RpbGwKPj4gPiA+IGJlIHNsb3dl
ciB0aGFuIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBBdCB3b3JzdCBjYXNlLCBoYWxmIG9m
Cj4+ID4gPiB0aGUKPj4gPiA+IGFkZHJlc3Mgd291bGQgbm90IGJlIGFibGUgdG8gYmUgYWxsb2Nh
dGVkIHdoZW4gYSBoaW50IGFkZHJlc3MgaXMKPj4gPiA+IHByb3ZpZGVkLgo+PiA+ID4gCj4+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
PiA+ID4gLS0tCj4+ID4gPiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggfCAy
NyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+PiA+ID4gLQo+PiA+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4+ID4gPiAKPj4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4+ID4gPiBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPj4gPiA+IGluZGV4IGYxOWY4NjFjZGE1
NC4uOGVjZTdhOGYwZTE4IDEwMDY0NAo+PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaAo+PiA+ID4gQEAgLTE0LDIyICsxNCwxNiBAQAo+PiA+ID4gwqAKPj4gPiA+IMKgI2luY2x1
ZGUgPGFzbS9wdHJhY2UuaD4KPj4gPiA+IMKgCj4+ID4gPiAtI2lmZGVmIENPTkZJR182NEJJVAo+
PiA+ID4gLSNkZWZpbmUgREVGQVVMVF9NQVBfV0lORE9XCShVTCgxKSA8PCAoTU1BUF9WQV9CSVRT
IC0gMSkpCj4+ID4gPiAtI2RlZmluZSBTVEFDS19UT1BfTUFYCQlUQVNLX1NJWkVfNjQKPj4gPiA+
IC0KPj4gPiA+IMKgI2RlZmluZSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKQkJ
CVwKPj4gPiA+IMKgKHsJCQkJCQkJCVwKPj4gPiA+IMKgCXVuc2lnbmVkIGxvbmcKPj4gPiA+IG1t
YXBfZW5kOwkJCQkJXAo+PiA+ID4gwqAJdHlwZW9mKGFkZHIpIF9hZGRyID0gKGFkZHIpOwkJCQlc
Cj4+ID4gPiAtCWlmICgoX2FkZHIpID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkg
JiYKPj4gPiA+IGlzX2NvbXBhdF90YXNrKCkpKSBcCj4+ID4gPiArCWlmICgoX2FkZHIpID09IDAg
fHwJCQkJCVwKPj4gPiA+ICsJwqDCoMKgIChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmIGlz
X2NvbXBhdF90YXNrKCkpIHx8CVwKPj4gPiA+ICsJwqDCoMKgICgoX2FkZHIgKyBsZW4pID4gQklU
KFZBX0JJVFMgLQo+PiA+ID4gMSkpKQkJCVwKPj4gPiA+IMKgCQltbWFwX2VuZCA9IFNUQUNLX1RP
UF9NQVg7CQkJXAo+PiA+ID4gLQllbHNlIGlmICgoX2FkZHIpID49IFZBX1VTRVJfU1Y1NykJCQlc
Cj4+ID4gPiAtCQltbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVg7CQkJXAo+PiA+ID4gLQllbHNlIGlm
ICgoKChfYWRkcikgPj0gVkFfVVNFUl9TVjQ4KSkgJiYgKFZBX0JJVFMgPj0KPj4gPiA+IFZBX0JJ
VFNfU1Y0OCkpIFwKPj4gPiA+IC0JCW1tYXBfZW5kID0gVkFfVVNFUl9TVjQ4OwkJCVwKPj4gPiA+
IMKgCWVsc2UJCQkJCQkJXAo+PiA+ID4gLQkJbW1hcF9lbmQgPSBWQV9VU0VSX1NWMzk7CQkJXAo+
PiA+ID4gKwkJbW1hcF9lbmQgPSAoX2FkZHIgKyBsZW4pOwkJCVwKPj4gPiA+IMKgCW1tYXBfZW5k
OwkJCQkJCVwKPj4gPiA+IMKgfSkKPj4gPiA+IMKgCj4+ID4gPiBAQCAtMzksMTcgKzMzLDE4IEBA
Cj4+ID4gPiDCoAl0eXBlb2YoYWRkcikgX2FkZHIgPSAoYWRkcik7CQkJCVwKPj4gPiA+IMKgCXR5
cGVvZihiYXNlKSBfYmFzZSA9IChiYXNlKTsJCQkJXAo+PiA+ID4gwqAJdW5zaWduZWQgbG9uZyBy
bmRfZ2FwID0gREVGQVVMVF9NQVBfV0lORE9XIC0gKF9iYXNlKTsJXAo+PiA+ID4gLQlpZiAoKF9h
ZGRyKSA9PSAwIHx8IChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmCj4+ID4gPiBpc19jb21w
YXRfdGFzaygpKSkgXAo+PiA+ID4gKwlpZiAoKF9hZGRyKSA9PSAwIHx8CQkJCQlcCj4+ID4gPiAr
CcKgwqDCoCAoSVNfRU5BQkxFRChDT05GSUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSB8
fAlcCj4+ID4gPiArCcKgwqDCoCAoKF9hZGRyICsgbGVuKSA+IEJJVChWQV9CSVRTIC0KPj4gPiA+
IDEpKSkJCQlcCj4+ID4gPiDCoAkJbW1hcF9iYXNlID0gKF9iYXNlKTsJCQkJXAo+PiA+ID4gLQll
bHNlIGlmICgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICYmIChWQV9CSVRTID49Cj4+ID4gPiBW
QV9CSVRTX1NWNTcpKSBcCj4+ID4gPiAtCQltbWFwX2Jhc2UgPSBWQV9VU0VSX1NWNTcgLSBybmRf
Z2FwOwkJXAo+PiA+ID4gLQllbHNlIGlmICgoKChfYWRkcikgPj0gVkFfVVNFUl9TVjQ4KSkgJiYg
KFZBX0JJVFMgPj0KPj4gPiA+IFZBX0JJVFNfU1Y0OCkpIFwKPj4gPiA+IC0JCW1tYXBfYmFzZSA9
IFZBX1VTRVJfU1Y0OCAtIHJuZF9nYXA7CQlcCj4+ID4gPiDCoAllbHNlCQkJCQkJCVwKPj4gPiA+
IC0JCW1tYXBfYmFzZSA9IFZBX1VTRVJfU1YzOSAtIHJuZF9nYXA7CQlcCj4+ID4gPiArCQltbWFw
X2Jhc2UgPSAoX2FkZHIgKyBsZW4pIC0gcm5kX2dhcDsJCVwKPj4gPiA+IMKgCW1tYXBfYmFzZTsJ
CQkJCQlcCj4+ID4gPiDCoH0pCj4+ID4gPiDCoAo+PiA+ID4gKyNpZmRlZiBDT05GSUdfNjRCSVQK
Pj4gPiA+ICsjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVwkoVUwoMSkgPDwgKE1NQVBfVkFfQklU
UyAtIDEpKQo+PiA+ID4gKyNkZWZpbmUgU1RBQ0tfVE9QX01BWAkJVEFTS19TSVpFXzY0Cj4+ID4g
PiDCoCNlbHNlCj4+ID4gPiDCoCNkZWZpbmUgREVGQVVMVF9NQVBfV0lORE9XCVRBU0tfU0laRQo+
PiA+ID4gwqAjZGVmaW5lIFNUQUNLX1RPUF9NQVgJCVRBU0tfU0laRQo+PiA+ID4gCj4+ID4gCj4+
ID4gSSBoYXZlIGNhcmVmdWxseSB0ZXN0ZWQgeW91ciBwYXRjaCBvbiBxZW11IHdpdGggc3Y1Ny4g
QSBidWcgdGhhdAo+PiA+IG5lZWRzCj4+ID4gdG8gYmUgc29sdmVkIGlzIHRoYXQgbW1hcCB3aXRo
IHRoZSBzYW1lIGhpbnQgYWRkcmVzcyB3aXRob3V0Cj4+ID4gTUFQX0ZJWEVECj4+ID4gc2V0IHdp
bGwgZmFpbCB0aGUgc2Vjb25kIHRpbWUuCj4+ID4gCj4+ID4gVXNlcnNwYWNlIGNvZGUgdG8gcmVw
cm9kdWNlIHRoZSBidWc6Cj4+ID4gCj4+ID4gI2luY2x1ZGUgPHN5cy9tbWFuLmg+Cj4+ID4gI2lu
Y2x1ZGUgPHN0ZGlvLmg+Cj4+ID4gI2luY2x1ZGUgPHN0ZGludC5oPgo+PiA+IAo+PiA+IHZvaWQg
dGVzdChjaGFyICphZGRyKSB7Cj4+ID4gwqDCoMKgIGNoYXIgKnJlcyA9IG1tYXAoYWRkciwgNDA5
NiwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPj4gPiBNQVBfQU5PTllNT1VTCj4+ID4gPiBNQVBf
UFJJVkFURSwgLTEsIDApOwo+PiA+IMKgwqDCoCBwcmludGYoImhpbnQgJXAgZ290ICVwLlxuIiwg
YWRkciwgcmVzKTsKPj4gPiB9Cj4+ID4gCj4+ID4gaW50IG1haW4gKHZvaWQpIHsKPj4gPiDCoMKg
wqAgdGVzdCgxPDwzMCk7Cj4+ID4gwqDCoMKgIHRlc3QoMTw8MzApOwo+PiA+IMKgwqDCoCB0ZXN0
KDE8PDMwKTsKPj4gPiDCoMKgwqAgcmV0dXJuIDA7Cj4+ID4gfQo+PiA+IAo+PiA+IG91dHB1dDoK
Pj4gPiAKPj4gPiBoaW50IDB4NDAwMDAwMDAgZ290IDB4NDAwMDAwMDAuCj4+ID4gaGludCAweDQw
MDAwMDAwIGdvdCAweGZmZmZmZmZmZmZmZmZmZmYuCj4+ID4gaGludCAweDQwMDAwMDAwIGdvdCAw
eGZmZmZmZmZmZmZmZmZmZmYuCj4+ID4gCj4+ID4gb3V0cHV0IG9uIHg4NjoKPj4gPiAKPj4gPiBo
aW50IDB4NDAwMDAwMDAgZ290IDB4NDAwMDAwMDAuCj4+ID4gaGludCAweDQwMDAwMDAwIGdvdCAw
eDdmOTE3MTM2MzAwMC4KPj4gPiBoaW50IDB4NDAwMDAwMDAgZ290IDB4N2Y5MTcxMzYyMDAwLgo+
PiA+IAo+PiA+IEl0IG1heSBuZWVkIHRvIGltcGxlbWVudCBhIHNwZWNpYWwgYXJjaF9nZXRfdW5t
YXBwZWRfYXJlYSBhbmQKPj4gPiBhcmNoX2dldF91bm1hcHBlZF9hcmVhX3RvcGRvd24gZnVuY3Rp
b24uCj4+ID4gCj4+IAo+PiBUaGlzIGlzIGJlY2F1c2UgaGludCBhZGRyZXNzIDwgcm5kX2dhcC4g
SSBoYXZlIHRyaWVkIHRvIGxldCBtbWFwX2Jhc2UgPQo+PiBtaW4oKF9hZGRyICsgbGVuKSwgKGJh
c2UpICsgVEFTS19TSVpFIC0gREVGQVVMVF9NQVBfV0lORE9XKS4gSG93ZXZlciBpdAo+PiBkb2Vz
IG5vdCB3b3JrIGZvciBib3R0b20tdXAgd2hpbGUgdWxpbWl0IC1zIGlzIHVubGltaXRlZC4gWW91
IHNhaWQgdGhpcwo+PiBiZWhhdmlvciBpcyBleHBlY3RlZCBmcm9tIHBhdGNoIHYyIHJldmlldy7C
oEhvd2V2ZXIgaXQgYnJpbmdzIGEgbmV3Cj4+IHJlZ3Jlc3Npb24gZXZlbiBvbiBzdjM5IHN5c3Rl
bXMuCj4+IAo+PiBJIHN0aWxsIGRvbid0IGtub3cgdGhlIHJlYXNvbiB3aHkgdXNlIGFkZHIrbGVu
IGFzIHRoZSB1cHBlci1ib3VuZC4gSQo+PiB0aGluayBzb2x1dGlvbiBsaWtlIHg4Ni9hcm02NC9w
b3dlcnBjIHByb3ZpZGUgdHdvIGFkZHJlc3Mgc3BhY2Ugc3dpdGNoCj4+IGJhc2VkIG9uIHdoZXRo
ZXIgaGludCBhZGRyZXNzIGFib3ZlIHRoZSBkZWZhdWx0IG1hcCB3aW5kb3cgaXMgZW5vdWdoLgo+
PiAKPgo+IFllcCB0aGlzIGlzIGV4cGVjdGVkLiBJdCBpcyB1cCB0byB0aGUgbWFpbnRhaW5lcnMg
dG8gZGVjaWRlLgoKU29ycnkgSSBmb3Jnb3QgdG8gcmVwbHkgdG8gdGhpcywgSSBoYWQgYSBidWZm
ZXIgc2l0dGluZyBhcm91bmQgc29tZXdoZXJlIApidXQgSSBtdXN0IGhhdmUgbG9zdCBpdC4KCkkg
dGhpbmsgQ2hhcmxpZSdzIGFwcHJvYWNoIGlzIHRoZSByaWdodCB3YXkgdG8gZ28uICBQdXR0aW5n
IG15IHVzZXJzcGFjZSAKaGF0IG9uLCBJJ2QgbXVjaCByYXRoZXIgaGF2ZSBteSBhbGxvY2F0aW9u
cyBmYWlsIHJhdGhlciB0aGFuIHNpbGVudGx5IAppZ25vcmUgdGhlIGhpbnQgd2hlbiB0aGVyZSdz
IG1lbW9yeSBwcmVzc3VyZS4KCklmIHRoZXJlJ3Mgc29tZSByZWFsIHVzZSBjYXNlIHRoYXQgbmVl
ZHMgdGhlc2UgbG93IGhpbnRzIHRvIGJlIHNpbGVudGx5IAppZ25vcmVkIHVuZGVyIFZBIHByZXNz
dXJlIHRoZW4gd2UgY2FuIHRyeSBhbmQgZmlndXJlIHNvbWV0aGluZyBvdXQgdGhhdCAKbWFrZXMg
dGhvc2UgYXBwbGljYXRpb25zIHdvcmsuCgo+Cj4gLSBDaGFybGllCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
