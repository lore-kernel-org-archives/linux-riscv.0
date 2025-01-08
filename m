Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9CFE77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJd1hUaur+BqkRPdlWbijpTzKfTQppDrp3Bha+qncFI=; b=yYvqeRcIBURrM+
	dojjEJd4ELLdnCXyb8kNes46T+kYGz6hDu4EIPuG9YE25GCNQfIUbp7Rj1aTNvsZUtzo+rKTflMUi
	UU4MKWI2EJIuk7flUhK8tox0Be11HrTDmeUvS1WxFGlcFnGwAv+50qsUKXF4ogNHO2IHpcO5aRCnt
	HwzjwdVlIwhnUF3OGMJpE2cSV78p95KfGlAJjMElCofuLBvBRA1u6nBmZ2AkWGgBj717iN36ywzAe
	Orm/sv9dZCkAISkr41OCvglq5PpH5Tao+S87McUB4rW3ECHiZCCisZDuITHUaxe5CAu6Qnk5OJLma
	EXaqcmrY4CKMsewxvn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVdJU-00000009rY1-2JtW;
	Wed, 08 Jan 2025 21:10:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVdJR-00000009rWr-13Be
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 21:10:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso186291f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 13:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1736370598; x=1736975398; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo3JCIHzeaUFwKuziaH+GtfOr8z8ugw2AVRwTDWsU5k=;
        b=A1Z1bLmVQ/m+0XYbLAYXOQITSgOLjbb634Er62PX7OJ9TN+TtriMjcr33u+UXR9K99
         XX3U7PizAT7vN5RC2jrSEyWZIdDs4jP0dyJOpAARqoMOxw3y+9JCB6s74Fs9QJzeZpq2
         TBoghPzosR1HQ1YbVbW1t06ekbDIWNCRdTEaCoix6pVDbqzSCVtKGWzzUFB1/bBsHvN+
         0MTilbljMGqN4K6xanisubO4B4mJZK+M0Pnwov3+Ydlv+2NY6HJvm8g0keecBnIZyKRA
         ERHNzyDDesTWVTfCcU5//K8uQ1dpU7uIFq10tuY1J3EblxZCNAWooAuCJAGojHDsAJzK
         TYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736370598; x=1736975398;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lo3JCIHzeaUFwKuziaH+GtfOr8z8ugw2AVRwTDWsU5k=;
        b=BEscCYz5T6U8irFvIv3R/BKlWz6pNsXwS8sadjv3CGC8LSLfQFeFf4VQRdNANNCMPp
         UH2105VNt8pFb3zxCL7nB/X/rY9mG086s8BUJ+lY3ZETmoVOt/35X9R2N3IDlSd9sDCx
         24NyTFATMQASwFlQvYacHwz/Qb6edvfMHsbpUSg8tzx2B6C9gtRvUdD4O1ALuf1NXEKX
         Lnqmc5DW/UTqjE9ujlHfb6CqIRLHZMbNnwiUvsvWFjdviHHDGHT5yct3KvSu9EL7QkFs
         eTVUGojHIxjVlZs1SWgVieBNQuxcdfsBCf7bcCgs8bph1O6lTRsMt4z2CuIy2R8RPQ99
         09zA==
X-Forwarded-Encrypted: i=1; AJvYcCVfw6CvE/XEHemaNJFdbnQJbANZqxcR4yOyJJjqwe9BB+wQHrgCIfin3bF8HtWT8N2oePJzy0BNxeRdLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuvqhXCCiCnsejm7p7iDFjiA8WXPlV9uhOzFg4e+1tsxkfD2Jr
	TMZuhWG/MEqSOvtMzIzlwY1lL2GGnPUpBiEMT15H1Xo0G8DHKnQTx5PiIuwGW2U=
X-Gm-Gg: ASbGncvzHZuakgzJXqrIV9D+bj6Uo/DpHCxVMgAd0cpRDqnPMFo2FojpchiHPOfWBK7
	65F9RMNB6KtiWh2f6NvJ4JlFrFfHkdMgx6oT6AVqEiLvquV/cFBngIktaphML0VUGbix0QIOSG7
	5y+3FNTP1qzYUE047XjhAg/0Jky5Ro7oIvzbntyS4KG7/axyueMi82oXOfTdx+nYCqaHwI9uvTP
	D5zdjUVaJxnyvOQMM9Ceoy6hknQe+XxeF14saBPA7cwcngv+3cmkj0Un1Ly+JWwx/T/Dw==
X-Google-Smtp-Source: AGHT+IHy6wrVklWqdRFvNxI7BI7z3mAZOGyzxhkml/LFj2PQwykJDd3EJzJMrpOuFg2hziQqqjQ/dQ==
X-Received: by 2002:a05:6000:2a3:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38a8735649cmr4123579f8f.48.1736370598444;
        Wed, 08 Jan 2025 13:09:58 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2311b3c8sm50854142f8f.25.2025.01.08.13.09.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2025 13:09:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH] raid6: Add RISC-V SIMD syndrome and recovery
 calculations
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250108-worsening-hacksaw-c1e970f1c4e3@spud>
Date: Wed, 8 Jan 2025 21:09:46 +0000
Cc: Chunyan Zhang <zhang.lyra@gmail.com>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>,
 linux-riscv@lists.infradead.org,
 linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <E0E58901-5DCF-46A2-9B96-8FFEF9C0EB64@jrtc27.com>
References: <20241220114023.667347-1-zhangchunyan@iscas.ac.cn>
 <20241220-chaste-mundane-5514462147b6@spud>
 <CAAfSe-tT7f3to0CPyF-DK09E+NNwN+tRpmuNwtTqbe3=_y3sFg@mail.gmail.com>
 <20241223-bunch-deceased-33c10c5b3dc4@spud>
 <CAAfSe-sPBHY_AUCksMj2qxHi2PchWpkV4JH0DzXF56Kvpwm0bg@mail.gmail.com>
 <20250108-worsening-hacksaw-c1e970f1c4e3@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_131001_320793_85051196 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gOCBKYW4gMjAyNSwgYXQgMTg6NTcsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gT24gTW9uLCBEZWMgMjMsIDIwMjQgYXQgMTA6MTY6NDZBTSArMDgwMCwgQ2h1
bnlhbiBaaGFuZyB3cm90ZToKPj4gT24gTW9uLCAyMyBEZWMgMjAyNCBhdCAwOTozNSwgQ29ub3Ig
RG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+IAo+Pj4gT24gTW9uLCBEZWMgMjMs
IDIwMjQgYXQgMDk6MTY6MzhBTSArMDgwMCwgQ2h1bnlhbiBaaGFuZyB3cm90ZToKPj4+PiBIaSBD
b25vciwKPj4+PiAKPj4+PiBPbiBTYXQsIDIxIERlYyAyMDI0IGF0IDA2OjUyLCBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+PiAKPj4+Pj4gT24gRnJpLCBEZWMgMjAs
IDIwMjQgYXQgMDc6NDA6MjNQTSArMDgwMCwgQ2h1bnlhbiBaaGFuZyB3cm90ZToKPj4+Pj4+IFRo
ZSBhc3NlbWJseSBpcyBvcmlnaW5hbGx5IGJhc2VkIG9uIHRoZSBBUk0gTkVPTiBhbmQgaW50LnVj
LCBidXQgdXNlcwo+Pj4+Pj4gUklTQy1WIHZlY3RvciBpbnN0cnVjdGlvbnMgdG8gaW1wbGVtZW50
IHRoZSBSQUlENiBzeW5kcm9tZSBhbmQKPj4+Pj4+IHJlY292ZXJ5IGNhbGN1bGF0aW9ucy4KPj4+
Pj4+IAo+Pj4+Pj4gVGhlIGZ1bmN0aW9ucyBhcmUgdGVzdGVkIG9uIFFFTVUuCj4+Pj4+PiAKPj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IENodW55YW4gWmhhbmcgPHpoYW5nY2h1bnlhbkBpc2Nhcy5hYy5j
bj4KPj4+Pj4+IC0tLQo+Pj4+Pj4gaW5jbHVkZS9saW51eC9yYWlkL3BxLmggfCAgIDQgKwo+Pj4+
Pj4gbGliL3JhaWQ2L01ha2VmaWxlICAgICAgfCAgIDMgKwo+Pj4+Pj4gbGliL3JhaWQ2L2FsZ29z
LmMgICAgICAgfCAgIDggKwo+Pj4+Pj4gbGliL3JhaWQ2L3JlY292X3J2di5jICAgfCAyMjkgKysr
KysrKysrKysrKwo+Pj4+Pj4gbGliL3JhaWQ2L3J2di5jICAgICAgICAgfCA3MTUgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gNSBmaWxlcyBjaGFuZ2VkLCA5
NTkgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9yYWlkNi9yZWNv
dl9ydnYuYwo+Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9yYWlkNi9ydnYuYwo+Pj4+Pj4g
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9yYWlkL3BxLmggYi9pbmNsdWRlL2xp
bnV4L3JhaWQvcHEuaAo+Pj4+Pj4gaW5kZXggOTgwMzBhY2NmNjQxLi40YzIxZjA2YzY2MmEgMTAw
NjQ0Cj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3JhaWQvcHEuaAo+Pj4+Pj4gKysrIGIvaW5j
bHVkZS9saW51eC9yYWlkL3BxLmgKPj4+Pj4+IEBAIC0xMDgsNiArMTA4LDkgQEAgZXh0ZXJuIGNv
bnN0IHN0cnVjdCByYWlkNl9jYWxscyByYWlkNl92cGVybXhvcjQ7Cj4+Pj4+PiBleHRlcm4gY29u
c3Qgc3RydWN0IHJhaWQ2X2NhbGxzIHJhaWQ2X3ZwZXJteG9yODsKPj4+Pj4+IGV4dGVybiBjb25z
dCBzdHJ1Y3QgcmFpZDZfY2FsbHMgcmFpZDZfbHN4Owo+Pj4+Pj4gZXh0ZXJuIGNvbnN0IHN0cnVj
dCByYWlkNl9jYWxscyByYWlkNl9sYXN4Owo+Pj4+Pj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgcmFp
ZDZfY2FsbHMgcmFpZDZfcnZ2eDE7Cj4+Pj4+PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCByYWlkNl9j
YWxscyByYWlkNl9ydnZ4MjsKPj4+Pj4+ICtleHRlcm4gY29uc3Qgc3RydWN0IHJhaWQ2X2NhbGxz
IHJhaWQ2X3J2dng0Owo+Pj4+Pj4gCj4+Pj4+PiBzdHJ1Y3QgcmFpZDZfcmVjb3ZfY2FsbHMgewo+
Pj4+Pj4gICAgICB2b2lkICgqZGF0YTIpKGludCwgc2l6ZV90LCBpbnQsIGludCwgdm9pZCAqKik7
Cj4+Pj4+PiBAQCAtMTI1LDYgKzEyOCw3IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3QgcmFpZDZfcmVj
b3ZfY2FsbHMgcmFpZDZfcmVjb3ZfczM5MHhjOwo+Pj4+Pj4gZXh0ZXJuIGNvbnN0IHN0cnVjdCBy
YWlkNl9yZWNvdl9jYWxscyByYWlkNl9yZWNvdl9uZW9uOwo+Pj4+Pj4gZXh0ZXJuIGNvbnN0IHN0
cnVjdCByYWlkNl9yZWNvdl9jYWxscyByYWlkNl9yZWNvdl9sc3g7Cj4+Pj4+PiBleHRlcm4gY29u
c3Qgc3RydWN0IHJhaWQ2X3JlY292X2NhbGxzIHJhaWQ2X3JlY292X2xhc3g7Cj4+Pj4+PiArZXh0
ZXJuIGNvbnN0IHN0cnVjdCByYWlkNl9yZWNvdl9jYWxscyByYWlkNl9yZWNvdl9ydnY7Cj4+Pj4+
PiAKPj4+Pj4+IGV4dGVybiBjb25zdCBzdHJ1Y3QgcmFpZDZfY2FsbHMgcmFpZDZfbmVvbngxOwo+
Pj4+Pj4gZXh0ZXJuIGNvbnN0IHN0cnVjdCByYWlkNl9jYWxscyByYWlkNl9uZW9ueDI7Cj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvbGliL3JhaWQ2L01ha2VmaWxlIGIvbGliL3JhaWQ2L01ha2VmaWxlCj4+
Pj4+PiBpbmRleCAyOTEyN2RkMDVkNjMuLmU2MmZiN2NkNzczZSAxMDA2NDQKPj4+Pj4+IC0tLSBh
L2xpYi9yYWlkNi9NYWtlZmlsZQo+Pj4+Pj4gKysrIGIvbGliL3JhaWQ2L01ha2VmaWxlCj4+Pj4+
PiBAQCAtMTAsNiArMTAsOSBAQCByYWlkNl9wcS0kKENPTkZJR19BTFRJVkVDKSArPSBhbHRpdmVj
MS5vIGFsdGl2ZWMyLm8gYWx0aXZlYzQubyBhbHRpdmVjOC5vIFwKPj4+Pj4+IHJhaWQ2X3BxLSQo
Q09ORklHX0tFUk5FTF9NT0RFX05FT04pICs9IG5lb24ubyBuZW9uMS5vIG5lb24yLm8gbmVvbjQu
byBuZW9uOC5vIHJlY292X25lb24ubyByZWNvdl9uZW9uX2lubmVyLm8KPj4+Pj4+IHJhaWQ2X3Bx
LSQoQ09ORklHX1MzOTApICs9IHMzOTB2eDgubyByZWNvdl9zMzkweGMubwo+Pj4+Pj4gcmFpZDZf
cHEtJChDT05GSUdfTE9PTkdBUkNIKSArPSBsb29uZ2FyY2hfc2ltZC5vIHJlY292X2xvb25nYXJj
aF9zaW1kLm8KPj4+Pj4+ICtyYWlkNl9wcS0kKENPTkZJR19SSVNDVl9JU0FfVikgKz0gcnZ2Lm8g
cmVjb3ZfcnZ2Lm8KPj4+Pj4+ICtDRkxBR1NfcnZ2Lm8gKz0gLW1hcmNoPXJ2NjRnY3YKPj4+Pj4+
ICtDRkxBR1NfcmVjb3ZfcnZ2Lm8gKz0gLW1hcmNoPXJ2NjRnY3YKPj4+Pj4gCj4+Pj4+IEknbSBj
dXJpb3VzIC0gd2h5IGRvIHlvdSBuZWVkIHRoaXMgd2hlbiB5b3UncmUgdXNpbmcgLm9wdGlvbiBh
cmNoLCt2Cj4+Pj4+IGJlbG93Pwo+Pj4+IAo+Pj4+IENvbXBpbGVyIHdvdWxkIGNvbXBsYWluIHRo
ZSBlcnJvcnMgbGlrZSBiZWxvdyB3aXRob3V0IHRoaXMgZmxhZzoKPj4+PiAKPj4+PiBFcnJvcjog
dW5yZWNvZ25pemVkIG9wY29kZSBgdmxlOC52IHYwLChhMyknLCBleHRlbnNpb24gYHYnIG9yIGB6
dmU2NHgnCj4+Pj4gb3IgYHp2ZTMyeCcgcmVxdWlyZWQKPj4+IAo+Pj4gUmlnaHQsIGJ1dCB0aGUg
cmVhc29uIGZvciB1c2luZyAub3B0aW9uIGFyY2gsK3YgZWxzZXdoZXJlIGluIHRoZSBrZXJuZWwK
Pj4+IGlzIGJlY2F1c2Ugd2UgZG9uJ3Qgd2FudCB0aGUgY29tcGlsZXIgdG8gZ2VuZXJhdGUgdmVj
dG9yIGNvZGUgYXQgYWxsLAo+Pj4gYW5kIHRoZSBkaXJlY3RpdmUgbGV0cyB0aGUgYXNzZW1ibGVy
IGhhbmRsZSB0aGUgdmVjdG9yIGluc3RydWN0aW9ucy4gSWYKPj4+IEkgcmVjYWxsIGNvcnJlY3Rs
eSwgdGhlIGVycm9yIHlvdSBwYXN0ZWQgYWJvdmUgaXMgZnJvbSB0aGUgYXNzZW1ibGVyLAo+PiAK
Pj4gWWVzLCBpdCBpcyBmcm9tIHRoZSBhc3NlbWJsZXIuCj4+IAo+Pj4gbm90IHRoZSBjb21waWxl
ci4gWW91IHNob3VsZCBiZSBhYmxlIHRvIGp1c3Qgc2V0IEFGTEFHUywgZ2l2ZW4gdGhhdCBhbGwK
Pj4gCj4+IEl0IGNvbXBsYWlucyB0aGUgc2FtZSBlcnJvcnMgYWZ0ZXIgc2ltcGx5IHJlcGxhY2lu
ZyBDRkxBR1Mgd2l0aCBBRkxBR1MKPj4gaGVyZS4gV2hhdCBhbSBJIG1pc3Npbmc/Cj4+IAo+IAo+
IEkgZG9uJ3Qga25vdyB3aGF0IHlvdSdyZSBtaXNzaW5nIHVuZm9ydHVuYXRlbHksIHNvcnJ5LgoK
Lm9wdGlvbiBwdXNoIHNob3VsZCBiZSBwYWlyZWQgd2l0aCAub3B0aW9uIHBvcCB3aXRoaW4gdGhl
IHNhbWUgaW5saW5lCmFzbSBzdGF0ZW1lbnQuIFlvdSBjYW5ub3QgZ2VuZXJhbGx5IHNwbGl0IHRo
ZW0gdXAsIGFzIHRoZSBjb21waWxlciB3aWxsCm5vdCBndWFyYW50ZWUgdGhhdCB0aGUgaW5saW5l
IGFzbSBzdGF0ZW1lbnRzIGFwcGVhciBpbiB0aGF0IG9yZGVyCnRleHR1YWxseSwgc2luY2UgaXQg
bWF5IHJlb3JkZXIgYmxvY2tzLCBhbmQgbWF5IGV2ZW4gY2xvbmUgb3IgZGVsZXRlCnRoZW0uIFBs
dXMgaW4gc29tZSBjYXNlcyB5b3UgY291bGQgZW5kIHVwIGFmZmVjdGluZyB0aGUgY29tcGlsZXLi
gJlzIG93bgpnZW5lcmF0ZWQgY29kZSwgYWx0aG91Z2ggdGhhdCBzaG91bGRu4oCZdCBtYXR0ZXIg
aGVyZS4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
