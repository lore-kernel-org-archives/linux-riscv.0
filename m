Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE99C52D7D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2024 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KY+SR9XU3NWJF6uckVmKijY4PwIcacVAp9zLgDZCSnM=; b=wXn5gL1u6SfX7R
	5US4EKcgp8lP339+BuNHyLheiGggpeIczIfDiNXYdXVboF92hahmgssswb0hVP59q0NHpISqdxqGD
	yT+ML4rtYCv+ePhU6tCa+K5iNmPBFhA+9Fk1vG5r0stuufjKJQSkcrPXpmc9E1fYvZRZhIzizBNhc
	+Z/LPb2lHNHBKDtRvfN/j+9EzuKnfPEeVMLzgYzajdSY+teJ/7OMKouDvl1RVVdzZ1xLUYZWeMYnD
	eMoo3gykVNwB00Awmkk6CUZJab/8zgLYE77pWF+oL6uuAr8tHJrt2Y3OEnf458e3N6ifyr95mTK3l
	xdPls71NTqkD8X343lxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfE4e-0000000ErZS-0bxY;
	Sat, 17 Aug 2024 07:42:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfE4b-0000000ErYL-1Foe
	for linux-riscv@lists.infradead.org;
	Sat, 17 Aug 2024 07:42:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5bd13ea7604so3333394a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723880524; x=1724485324; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Scgmx1Gy14t/+J79KcdymAvZdzIGaTJBly1hyr+iYTA=;
        b=jlOwVyRzkDgjgOQtlgM6UiN3U06POPzdSXa+XcNJI+BYRwvo9jv2PsfyQklltjEih2
         KinS/1+ww30m598J/pS3k3x0gEH8aDyBW7IErYC3if0XDllOGrhhh+3/KRKG0uzNEOa4
         eXHLR3+0wRT9PN5jGuYZ2UcHWNMGqEjcWPt1ASx2aZFu4MOkZ9yGLRIgRfvCxWFMETE0
         FQv/t7SWo+RNUrfKJkU9bSmfgjXs0D9lSQzoYoHO0D9qLisfpXyDBEkEbbTeGWPcj5zg
         CqW0TKxWWeF2PKK9ZnHLher4Hs2QHEQMEm3L/y1MFI0fSf+HkmK/igV0wWJ6A1QDUw0H
         xqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723880524; x=1724485324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Scgmx1Gy14t/+J79KcdymAvZdzIGaTJBly1hyr+iYTA=;
        b=mvG8riZriJ4WfsiJzsQ/L2Zfb5L+7lONTrJfRpHkYL6a4vJ5Wei5tUknyA8g2lyH+1
         AMC+3C+Zg+yTExWi1u/41iL72wc7zFlIs3pM2oJ9BBdwLaVk/exY95XRw7Pz/ezbPCrk
         JXFildp24p1dskV0xAMzb9WdyXKbvKt2GanJCklvZ1pGjsjteAlHjoXy32D3yJIyUZoK
         CapMvWo0EFXpKNrFGg+PWhqWteFgvNN9LC5mq1QFRNrgI6RzGjjCsuBGv7RtoGL1ov67
         9pLe+yRCROE7xMmBqU+jBArEtFTN3qI7Amu5ehF4sk/vPgHV3MNDQaqsytaDxxGNL7wB
         FDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhXJfe03POy6K2PQ2Lxs+G/YKHlfpEwMQJemtHZaqNVLYzqkw/dGviuzIyGM5Pvo6M20UXHxq6Lnqsv7Qpwn/4Oefk7oHqg7VqBf9xx+bU
X-Gm-Message-State: AOJu0Yyo3W7vKjIB5rdqrSX5yFDroxFk2zBWetR08Y8Ixi3rwZC733nB
	2R8UxAFonZ+Xe7akJ8Kap3F4v86rJw2ZYAEQNG6TRjw4gf/PuN6QCio47yyO9w8=
X-Google-Smtp-Source: AGHT+IEyEY1ACb4tUAripTPSCmB0FUFFTAKoRc5xxNQCmxLh1aHgyMRfh2Kx1r4BMktxuhjgrrRvVw==
X-Received: by 2002:a05:6402:2710:b0:57c:c166:ba6 with SMTP id 4fb4d7f45d1cf-5beca5c5750mr2878547a12.19.1723880523014;
        Sat, 17 Aug 2024 00:42:03 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbde5cbdsm3166518a12.37.2024.08.17.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 00:42:02 -0700 (PDT)
Date: Sat, 17 Aug 2024 09:42:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240817-c1d2345fcc50ade60ce09449@orel>
References: <20240816124957.130017-2-ajones@ventanamicro.com>
 <CAL_Jsq+0fXJarCjLA1ZYOiHbM_qn3dtG00Xz+Z8qGCg8Wu=dgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+0fXJarCjLA1ZYOiHbM_qn3dtG00Xz+Z8qGCg8Wu=dgA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_004205_373622_4E1E88EB 
X-CRM114-Status: GOOD (  33.11  )
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

T24gRnJpLCBBdWcgMTYsIDIwMjQgYXQgMDI6MTg6NDFQTSBHTVQsIFJvYiBIZXJyaW5nIHdyb3Rl
Ogo+IE9uIEZyaSwgQXVnIDE2LCAyMDI0IGF0IDY6NTDigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBBbiAnbXNpLXBhcmVudCcgcHJvcGVy
dHkgd2l0aCBhIHNpbmdsZSBlbnRyeSBhbmQgbm8gYWNjb21wYW55aW5nCj4gPiAnI21zaS1jZWxs
cycgcHJvcGVydHkgaXMgY29uc2lkZXJlZCB0aGUgbGVnYWN5IGRlZmluaXRpb24gYXMgb3Bwb3Nl
ZAo+ID4gdG8gaXRzIGRlZmluaXRpb24gYWZ0ZXIgYmVpbmcgZXhwYW5kZWQgd2l0aCBjb21taXQg
MTI2YjE2ZTJhZDk4Cj4gPiAoIkRvY3M6IGR0OiBhZGQgZ2VuZXJpYyBNU0kgYmluZGluZ3MiKS4g
SG93ZXZlciwgdGhlIGxlZ2FjeQo+ID4gZGVmaW5pdGlvbiBpcyBjb21wbGV0ZWx5IGNvbXBhdGli
bGUgd2l0aCB0aGUgY3VycmVudCBkZWZpbml0aW9uIGFuZCwKPiA+IHNpbmNlIG9mX3BoYW5kbGVf
aXRlcmF0b3JfbmV4dCgpIHRvbGVyYXRlcyBtaXNzaW5nIGFuZCBwcmVzZW50LWJ1dC0KPiA+IHpl
cm8gKmNlbGxzIHByb3BlcnRpZXMgc2luY2UgY29tbWl0IGU0MmVlNjEwMTdmNSAoIm9mOiBMZXQK
PiA+IG9mX2Zvcl9lYWNoX3BoYW5kbGUgZmFsbGJhY2sgdG8gbm9uLW5lZ2F0aXZlIGNlbGxfY291
bnQiKSwgdGhlcmUncyBubwo+ID4gbmVlZCBhbnltb3JlIHRvIHNwZWNpYWwgY2FzZSB0aGUgbGVn
YWN5IGRlZmluaXRpb24gaW4KPiA+IG9mX21zaV9nZXRfZG9tYWluKCkuCj4gPgo+ID4gSW5kZWVk
LCBzcGVjaWFsIGNhc2luZyBoYXMgdHVybmVkIG91dCB0byBiZSBoYXJtZnVsLCBiZWNhdXNlLCBh
cyBvZgo+ID4gY29tbWl0IDdjMDI1MjM4YjQ3YSAoImR0LWJpbmRpbmdzOiBpcnFjaGlwOiBEZXNj
cmliZSB0aGUgSU1YIE1VIGJsb2NrCj4gPiBhcyBhIE1TSSBjb250cm9sbGVyIiksIE1TSSBjb250
cm9sbGVyIERUIGJpbmRpbmdzIGhhdmUgc3RhcnRlZAo+ID4gc3BlY2lmeWluZyAnI21zaS1jZWxs
cycgYXMgYSByZXF1aXJlZCBwcm9wZXJ0eSAoZXZlbiB3aGVuIHRoZSB2YWx1ZQo+ID4gbXVzdCBi
ZSB6ZXJvKSBhcyBhbiBlZmZvcnQgdG8gbWFrZSB0aGUgYmluZGluZ3MgbW9yZSBleHBsaWNpdC4g
QnV0LAo+ID4gc2luY2UgdGhlIHNwZWNpYWwgY2FzaW5nIG9mICdtc2ktcGFyZW50JyBvbmx5IHVz
ZXMgdGhlIGV4aXN0ZW5jZSBvZgo+ID4gJyNtc2ktY2VsbHMnIGZvciBpdHMgaGV1cmlzdGljLCBh
bmQgbm90IHdoZXRoZXIgb3Igbm90IGl0J3MgYWxzbwo+ID4gbm9uemVybywgdGhlIGxlZ2FjeSBw
YXRoIGlzIG5vdCB0YWtlbi4gRnVydGhlcm1vcmUsIHRoZSBwYXRoIHRvCj4gPiBzdXBwb3J0IHRo
ZSBuZXcsIGJyb2FkZXIgZGVmaW5pdGlvbiBpc24ndCB0YWtlbiBlaXRoZXIgc2luY2UgdGhhdAo+
ID4gcGF0aCBoYXMgYmVlbiByZXN0cmljdGVkIHRvIHRoZSBwbGF0Zm9ybS1tc2kgYnVzLgo+ID4K
PiA+IEJ1dCwgbmVpdGhlciB0aGUgZGVmaW5pdGlvbiBvZiAnbXNpLXBhcmVudCcgbm9yIHRoZSBk
ZWZpbml0aW9uIG9mCj4gPiAnI21zaS1jZWxscycgaXMgcGxhdGZvcm0tbXNpLXNwZWNpZmljICh0
aGUgcGxhdGZvcm0tbXNpIGJ1cyB3YXMganVzdAo+ID4gdGhlIGZpcnN0IGJ1cyB0aGF0IG5lZWRl
ZCAnI21zaS1jZWxscycpLCBzbyByZW1vdmUgYm90aCB0aGUgc3BlY2lhbAo+ID4gY2FzaW5nIGFu
ZCB0aGUgcmVzdHJpY3Rpb24uIFRoZSBjb2RlIHJlbW92YWwgYWxzbyByZXF1aXJlcyBjaGFuZ2lu
Zwo+ID4gdG8gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX29wdGlvbmFsX2FyZ3MoKSBpbiBvcmRlciB0
byBlbnN1cmUgdGhlCj4gPiBsZWdhY3kgKGJ1dCBjb21wYXRpYmxlKSB1c2Ugb2YgJ21zaS1wYXJl
bnQnIHJlbWFpbnMgc3VwcG9ydGVkLiBUaGlzCj4gPiBub3Qgb25seSBzaW1wbGlmaWVzIHRoZSBj
b2RlIGJ1dCBhbHNvIHJlc29sdmVzIGFuIGlzc3VlIHdpdGggUENJCj4gPiBkZXZpY2VzIGZpbmRp
bmcgdGhlaXIgTVNJIGNvbnRyb2xsZXJzIG9uIHJpc2N2LCBhcyB0aGUgcmlzY3YsaW1zaWNzCj4g
PiBiaW5kaW5nIHJlcXVpcmVzICcjbXNpLWNlbGxzPTwwPicuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gdjI6
Cj4gPiAgLSBzd2l0Y2ggdG8gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX29wdGlvbmFsX2FyZ3MoKSB0
byBlbnN1cmUgdGhlCj4gPiAgICBhYnNlbmNlIG9mICNtc2ktY2VsbHMgbWVhbnMgY291bnQ9MAo+
ID4KPiA+ICBkcml2ZXJzL29mL2lycS5jIHwgMzcgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyNiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9pcnEuYyBiL2RyaXZlcnMv
b2YvaXJxLmMKPiA+IGluZGV4IGM5NDIwM2NlNjViYi4uNjkwZGY0YjcxYWI5IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9vZi9pcnEuYwo+ID4gKysrIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4gQEAg
LTcwOSw4ICs3MDksNyBAQCBzdHJ1Y3QgaXJxX2RvbWFpbiAqb2ZfbXNpX21hcF9nZXRfZGV2aWNl
X2RvbWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBpZCwKPiA+ICAgKiBAbnA6IGRldmljZSBu
b2RlIGZvciBAZGV2Cj4gPiAgICogQHRva2VuOiBidXMgdHlwZSBmb3IgdGhpcyBkb21haW4KPiA+
ICAgKgo+ID4gLSAqIFBhcnNlIHRoZSBtc2ktcGFyZW50IHByb3BlcnR5IChib3RoIHRoZSBzaW1w
bGUgYW5kIHRoZSBjb21wbGV4Cj4gPiAtICogdmVyc2lvbnMpLCBhbmQgcmV0dXJucyB0aGUgY29y
cmVzcG9uZGluZyBNU0kgZG9tYWluLgo+ID4gKyAqIFBhcnNlIHRoZSBtc2ktcGFyZW50IHByb3Bl
cnR5IGFuZCByZXR1cm5zIHRoZSBjb3JyZXNwb25kaW5nIE1TSSBkb21haW4uCj4gPiAgICoKPiA+
ICAgKiBSZXR1cm5zOiB0aGUgTVNJIGRvbWFpbiBmb3IgdGhpcyBkZXZpY2UgKG9yIE5VTEwgb24g
ZmFpbHVyZSkuCj4gPiAgICovCj4gPiBAQCAtNzE4LDMzICs3MTcsMTkgQEAgc3RydWN0IGlycV9k
b21haW4gKm9mX21zaV9nZXRfZG9tYWluKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaXJxX2RvbWFpbl9idXNf
dG9rZW4gdG9rZW4pCj4gPiAgewo+ID4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm1zaV9u
cDsKPiA+ICsgICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwo+ID4gICAgICAgICBz
dHJ1Y3QgaXJxX2RvbWFpbiAqZDsKPiA+ICsgICAgICAgaW50IGluZGV4ID0gMDsKPiA+Cj4gPiAt
ICAgICAgIC8qIENoZWNrIGZvciBhIHNpbmdsZSBtc2ktcGFyZW50IHByb3BlcnR5ICovCj4gPiAt
ICAgICAgIG1zaV9ucCA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJtc2ktcGFyZW50IiwgMCk7Cj4g
PiAtICAgICAgIGlmIChtc2lfbnAgJiYgIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChtc2lfbnAsICIj
bXNpLWNlbGxzIikpIHsKPiA+IC0gICAgICAgICAgICAgICBkID0gaXJxX2ZpbmRfbWF0Y2hpbmdf
aG9zdChtc2lfbnAsIHRva2VuKTsKPiA+IC0gICAgICAgICAgICAgICBpZiAoIWQpCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChtc2lfbnApOwo+ID4gLSAgICAgICAgICAg
ICAgIHJldHVybiBkOwo+ID4gLSAgICAgICB9Cj4gPiAtCj4gPiAtICAgICAgIGlmICh0b2tlbiA9
PSBET01BSU5fQlVTX1BMQVRGT1JNX01TSSkgewo+ID4gLSAgICAgICAgICAgICAgIC8qIENoZWNr
IGZvciB0aGUgY29tcGxleCBtc2ktcGFyZW50IHZlcnNpb24gKi8KPiA+IC0gICAgICAgICAgICAg
ICBzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIGFyZ3M7Cj4gPiAtICAgICAgICAgICAgICAgaW50IGlu
ZGV4ID0gMDsKPiA+ICsgICAgICAgd2hpbGUgKCFvZl9wYXJzZV9waGFuZGxlX3dpdGhfb3B0aW9u
YWxfYXJncyhucCwgIm1zaS1wYXJlbnQiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICIjbXNpLWNlbGxzIiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmRleCwgJmFyZ3MpKSB7Cj4g
Cj4gSSBndWVzcyB5b3UganVzdCBtYWludGFpbmVkIGVzc2VudGlhbGx5IHdoYXQgd2FzIGhlcmUs
IGJ1dAo+IG9mX2Zvcl9lYWNoX3BoYW5kbGUoKSBzaG91bGQgd29yayBoZXJlLiBJdCdzIGEgYml0
IG1vcmUgZWZmaWNpZW50IHRvbwo+IGJlY2F1c2Ugb2ZfcGFyc2VfcGhhbmRsZV93aXRoX29wdGlv
bmFsX2FyZ3MoKSBpcyBpbXBsZW1lbnRlZCB1c2luZwo+IG9mX2Zvcl9lYWNoX3BoYW5kbGUoKS4K
ClRoYW5rcywgUm9iLiBJIGp1c3Qgc2VudCB2My4KCmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
