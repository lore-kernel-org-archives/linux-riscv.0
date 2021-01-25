Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFDCC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 08:47:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7086F22D04
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 08:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7086F22D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6E0jlbv2yDjq7r76u+WQxRqz0qqlTQB3HfKASRIJYtk=; b=BzmFqvqukMjJEZ9iiWG7eRmqU
	MOHWHnfKK988LwfXqCItmqqXFIHd86utUHgV3b4nTl10ChEhEmm6ac1RT+nHxbHhosKR/3pACsN6c
	1f+bB5p0zQT0FIZZ36izQG8e9PSZo4+nvjEeQ6sCxXkGKh32dzkv+wxy3yS17dZ4QIZ5feC/t4+/M
	bZvmqs0d4x56+KcGQkac1GF2XtnCmypkEKNOH1Ww1b1O+gqVkLFKb2B1WyHM8uRTDm6q53KjdE5q9
	qmrVS+YrekoNc41jdPMBEX9lpX+5zlociHoHrqgBP1P2TcZ2P2v/hFLUKMn2MB68ZwdyPK5sK9lAt
	EUaJlK6EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xXH-0004Qo-2H; Mon, 25 Jan 2021 08:47:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xXE-0004Pk-Me
 for linux-riscv@lists.infradead.org; Mon, 25 Jan 2021 08:47:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id q7so11336765wre.13
 for <linux-riscv@lists.infradead.org>; Mon, 25 Jan 2021 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=L7zRLOa9/A/iQHZsxRUBd/9JtCVTjujkb4lDAg3Vr/k=;
 b=j8lsVt/e7FhY4i8Y9QQP5WgESMMeZIAWgIRZOLbW5E07ES6H7jUpfiUfE7QeFdOHa0
 ItxEt6o9YKKMy3BhwIB0kW5uFBrz/fttbgTjb5/bYkaxbsKPoXZYv85PowEdLtmYOJXO
 i/PT6SeXKYMF+Xf1vaPSeJvXcG1SyerAO2+sjQwoqfcw+B57A9ZPTvFxr+yfdII4Q3JH
 LPvpoiB8VArMarTPiLhj5CQ52Af3IVk9MO8X3HRDqdYdCu/sKjayNFtGTFQ5szcsHlk9
 UTauyFktDFvfyhx70AZGyAt8Je7Pu3nB5ZjYaZz4WomeXp7iBUH3uUNY3A/ZYZAC1n1O
 TQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L7zRLOa9/A/iQHZsxRUBd/9JtCVTjujkb4lDAg3Vr/k=;
 b=CrcCA4yMio8Z2MFl2dv79rtydFIV8xZM9+k8TsO+2+ckZ5ykSc2HJtUPP2Zw0jgWlH
 FMxnE+taPJqwwP0YFQEoIkmGWCFuUaTOY90p5AnyKDnRG+9527315ysNH0qBmumSyN0W
 kfTwa0rq6NFEuzw9fiTrx0lXvYSnYemVLCpjoHpicgnjSVCWMH2DwiYifPogvXBGYkuC
 hCAruEfX4Odo+HDGRLxKkRSDw2i8SIH1kBoBll+hr5EUYKeNGSAlOKuT7HS0/fmYK7HZ
 3nhkJNq8LuKMnNzRxXzT3YktSGk15OJLxOs61PMYyqKsgdKZ0wtlja9wHRGCCCbOIsqh
 cRzg==
X-Gm-Message-State: AOAM533CuprkwW8BQ0ZHRdf8t05NRfUcN68FA/odQZJBcjyUhG1AW/sV
 nDHrpE0RMjqM/NPwxf0x1G87bQ==
X-Google-Smtp-Source: ABdhPJwvAT5QrVlgVRVXIetqyDdGS4/PFt4ktrvS4hgcS34u7NUByd/Pzsn94Nh20vlcxbXW4hhjMA==
X-Received: by 2002:adf:f009:: with SMTP id j9mr1074570wro.35.1611564461410;
 Mon, 25 Jan 2021 00:47:41 -0800 (PST)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id i6sm13827473wrs.71.2021.01.25.00.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 00:47:40 -0800 (PST)
Date: Mon, 25 Jan 2021 08:47:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const
 variable 'prci_clk_fu540' where it's used
Message-ID: <20210125084739.GW4903@dell>
References: <20210120093040.1719407-7-lee.jones@linaro.org>
 <mhng-d13d3ca6-2ec1-4c56-a4a8-56faafe5569c@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d13d3ca6-2ec1-4c56-a4a8-56faafe5569c@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_034744_744699_366F3D0C 
X-CRM114-Status: GOOD (  18.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 Pragnesh.patel@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMiBKYW4gMjAyMSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cgo+IE9uIFdlZCwgMjAg
SmFuIDIwMjEgMDE6MzA6MjYgUFNUICgtMDgwMCksIGxlZS5qb25lc0BsaW5hcm8ub3JnIHdyb3Rl
Ogo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4g
PiAKPiA+ICBkcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oOjE2OjM1OiB3YXJuaW5nOiDi
gJhwcmNpX2Nsa19mdTU0MOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3Qt
dmFyaWFibGU9XQo+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmg6MTY6MzU6IHdh
cm5pbmc6IOKAmHByY2lfY2xrX2Z1NTQw4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1jb25zdC12YXJpYWJsZT1dCj4gPiAKPiA+IENjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1
ZXR0ZUBiYXlsaWJyZS5jb20+Cj4gPiBDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3Jn
Pgo+ID4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiA+IENj
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+ID4gQ2M6IFByYWduZXNoIFBh
dGVsIDxQcmFnbmVzaC5wYXRlbEBzaWZpdmUuY29tPgo+ID4gQ2M6IFpvbmcgTGkgPHpvbmcubGlA
c2lmaXZlLmNvbT4KPiA+IENjOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnCj4gPiBDYzogbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9m
dTU0MC1wcmNpLmggIHwgNSAtLS0tLQo+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJj
aS5jIHwgNSArKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQw
LXByY2kuaCBiL2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmgKPiA+IGluZGV4IGM4Mjcx
ZWZhN2JkYzcuLmMyMjA2NzdkYzAxMDggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9zaWZp
dmUvZnU1NDAtcHJjaS5oCj4gPiArKysgYi9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5o
Cj4gPiBAQCAtMTMsOSArMTMsNCBAQAo+ID4gCj4gPiAgZXh0ZXJuIHN0cnVjdCBfX3ByY2lfY2xv
Y2sgX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwW05VTV9DTE9DS19GVTU0MF07Cj4gPiAKPiA+IC1z
dGF0aWMgY29uc3Qgc3RydWN0IHByY2lfY2xrX2Rlc2MgcHJjaV9jbGtfZnU1NDAgPSB7Cj4gPiAt
CS5jbGtzID0gX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwLAo+ID4gLQkubnVtX2Nsa3MgPSBBUlJB
WV9TSVpFKF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCksCj4gPiAtfTsKPiA+IC0KPiA+ICAjZW5k
aWYgLyogX19TSUZJVkVfQ0xLX0ZVNTQwX1BSQ0lfSCAqLwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5jIGIvZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1w
cmNpLmMKPiA+IGluZGV4IGM3OGIwNDI3NTBlMjEuLjE0OTBiMDFjZTYyOTAgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2kuYwo+ID4gKysrIGIvZHJpdmVycy9j
bGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMKPiA+IEBAIC0xMiw2ICsxMiwxMSBAQAo+ID4gICNpbmNs
dWRlICJmdTU0MC1wcmNpLmgiCj4gPiAgI2luY2x1ZGUgImZ1NzQwLXByY2kuaCIKPiA+IAo+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgcHJjaV9jbGtfZGVzYyBwcmNpX2Nsa19mdTU0MCA9IHsKPiA+
ICsJLmNsa3MgPSBfX3ByY2lfaW5pdF9jbG9ja3NfZnU1NDAsCj4gPiArCS5udW1fY2xrcyA9IEFS
UkFZX1NJWkUoX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwKSwKPiA+ICt9Owo+ID4gKwo+ID4gIC8q
Cj4gPiAgICogUHJpdmF0ZSBmdW5jdGlvbnMKPiA+ICAgKi8KPiAKPiBUaGlzIGRvZXNuJ3QgbG9v
ayBsaWtlIG15IHNpZml2ZS1wcmNpLmMsIHNvIEknbSBhc3N1bWluZyBpdCdzIGFnYWluc3Qgb25l
IG9mCj4gdGhlIGNsb2NrIHRyZWVzIGFuZCB0aGVyZWZvciBzaG91bGQgZ28gaW4gb3ZlciB0aGVy
ZS4KClRoaXMgcGF0Y2ggaXMgYXBwbGllZCBhZ2FpbnN0IC1uZXh0LgoKPiBBY2tlZC1ieTogUGFs
bWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KClRoYW5rcyBQYWxtZXIuCgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
