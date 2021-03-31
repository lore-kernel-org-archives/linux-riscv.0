Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E266C433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 00:25:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE755619A7
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 00:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE755619A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YwXYbrK62fOnHxmvpWm79EjjTbJZZoiuZUg0x9B7eXM=; b=F3zcEOvGWR7A+YWMRaKvsaA7o
	lguglup7Taj2Bxqoc01S0+XWcZDJ3kfWR6UvtedwlUgjC0pdnP6kxbWG6ZxSUQQuw/aqkMbv8iBG2
	gd+FwXf7i7pqxs3e5/k0JqHVrGHPG0v8JVMShs5t+nPFBDtpTM5ibW6FzrsXZGL3slUdmc1HZpnZ/
	lSNddfDWq88r/yCb4YpNYJ0Mbcpl3VbUmAHCZkM6toe0zgzTPnOSDV6ns1+d5j9r4jKw+crtM0ZHV
	fmjM23wzfXsX3TFh/y+zr+bkOOtfUprXhnRyHNdNQshouLGRXnJ4ybSujxhzLIFNNPFcXhWo6cbBh
	UzFKhzeqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lROf4-005ATz-QE; Wed, 31 Mar 2021 00:24:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lROeq-005ASk-SW
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 00:24:32 +0000
Received: by mail-pf1-x431.google.com with SMTP id j25so13306519pfe.2
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 17:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=t8GisNUKhAXhRRmhb5Tmd7cSosC0ChQ5VE6Rcal6IVk=;
 b=urdw3ivXzWShCpZ72V3nD7ok9QIvHP0ke8jFdQ6gOdSvymUjIs2/ErLZOItEsi3Exq
 Zs/3q45bKVnrvrbSLkghBP8hFtj6qVeMzz3QGjNAbe8vYCKmt67b0HU/a1rimNbVG/bG
 9i5i5OG5X0jCsbYssTZKB2kEzfUjkj/Tz2IgeJP/MkJhFphCczFN6i17moOy/H7qOQ3e
 aI+4KGsS3P5GrnDzdy7q9IblINvwNF1BiXXQaD5XzCxZULPiIcfhxzp7xxrMM0HeWyVS
 JANPccHlgxQi8ZyQM3ouLqwjeOC7ke9gUVjz5HNCEAVRcxOfa39fRx9hzMCTKz9mMlld
 ffdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=t8GisNUKhAXhRRmhb5Tmd7cSosC0ChQ5VE6Rcal6IVk=;
 b=fNUd5cAK0SVH+s6nALluNdhp559qp2jCsb+iMbM9Ngi/cJSJ3B5dh3pT1MGp9MRz/F
 AxOVRRin3eqbjEbWBFQ3aOuFVZPW8rXEJ1YGFrRo9P+PYM1legtqlkodw/ufKKz9gOGh
 kncMPHJul6lEGL+x4s32vJ6CpPEh0vp7OuER2/R5no2hxSJXORe++fOvCFjqwA5Fvjyd
 ap8foyUE9DV7CBkMAAntKk/ENpPJ278OvIejpeo3+aSf4vF4jBNym0NOznRZcok/05in
 K8rui79mKSVDHeKrkXOzYnwGpqdgBS/sSyRU0fGny6TMGmNV43UdO6NPInJsvjLEkOWG
 dB+A==
X-Gm-Message-State: AOAM530NVk0LL0ip+QTPei1cXD/lnNWP+9FJQyhuxrKDy2kZbFmfz+9Z
 4jJ3KEwLMTg18H2lcuKlSfLKKQ==
X-Google-Smtp-Source: ABdhPJzu1TA+qlBzM73yS6GhrKUJdqQ2kl7j2QOiV7JjAougt35JjgWoZLN67F4hgX4tR8a+GoQsxw==
X-Received: by 2002:aa7:9687:0:b029:22e:e5ce:95b6 with SMTP id
 f7-20020aa796870000b029022ee5ce95b6mr502259pfk.53.1617150266450; 
 Tue, 30 Mar 2021 17:24:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p25sm169258pfe.100.2021.03.30.17.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 17:24:25 -0700 (PDT)
Date: Tue, 30 Mar 2021 17:24:25 -0700 (PDT)
X-Google-Original-Date: Tue, 30 Mar 2021 17:06:40 PDT (-0700)
Subject: Re: [PATCH v2 2/6] clk: sifive: Use reset-simple in prci driver for
 PCIe driver
In-Reply-To: <CAHCEehL63aJQPA3DdRCa3pZHWX3DH9ktgKbo1+nD=KWxADsogA@mail.gmail.com>
CC: sboyd@kernel.org, alex.dewar90@gmail.com, aou@eecs.berkeley.edu,
 bhelgaas@google.com, devicetree@vger.kernel.org, erik.danie@sifive.com,
 hayashi.kunihiko@socionext.com, helgaas@kernel.org, hes@sifive.com,
 jh80.chung@samsung.com, 
 khilman@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.pieralisi@arm.com, 
 mturquette@baylibre.com, p.zabel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 robh+dt@kernel.org, vidyas@nvidia.com, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-78a4de2c-8723-4b35-b64e-2e1866ad6743@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_012429_558042_DD63BC1A 
X-CRM114-Status: GOOD (  16.63  )
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

T24gTW9uLCAyOSBNYXIgMjAyMSAyMDozNjoxMiBQRFQgKC0wNzAwKSwgZ3JlZW50aW1lLmh1QHNp
Zml2ZS5jb20gd3JvdGU6Cj4gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiDmlrwgMjAy
MeW5tDPmnIgzMOaXpSDpgLHkuowg5LiK5Y2IMzoxNOWvq+mBk++8mgo+Pgo+PiBRdW90aW5nIEdy
ZWVudGltZSBIdSAoMjAyMS0wMy0xNyAyMzowODowOSkKPj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZXNldC9LY29uZmlnIGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4+ID4gaW5kZXggNzFhYjc1
YTQ2NDkxLi5mMDk0ZGY5M2Q5MTEgMTAwNjQ0Cj4+ID4gLS0tIGEvZHJpdmVycy9yZXNldC9LY29u
ZmlnCj4+ID4gKysrIGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4+ID4gQEAgLTE3Myw3ICsxNzMs
NyBAQCBjb25maWcgUkVTRVRfU0NNSQo+PiA+Cj4+ID4gIGNvbmZpZyBSRVNFVF9TSU1QTEUKPj4g
PiAgICAgICAgIGJvb2wgIlNpbXBsZSBSZXNldCBDb250cm9sbGVyIERyaXZlciIgaWYgQ09NUElM
RV9URVNUCj4+ID4gLSAgICAgICBkZWZhdWx0IEFSQ0hfQUdJTEVYIHx8IEFSQ0hfQVNQRUVEIHx8
IEFSQ0hfQklUTUFJTiB8fCBBUkNIX1JFQUxURUsgfHwgQVJDSF9TVE0zMiB8fCBBUkNIX1NUUkFU
SVgxMCB8fCBBUkNIX1NVTlhJIHx8IEFSQ0hfWlggfHwgQVJDCj4+ID4gKyAgICAgICBkZWZhdWx0
IEFSQ0hfQUdJTEVYIHx8IEFSQ0hfQVNQRUVEIHx8IEFSQ0hfQklUTUFJTiB8fCBBUkNIX1JFQUxU
RUsgfHwgQVJDSF9TVE0zMiB8fCBBUkNIX1NUUkFUSVgxMCB8fCBBUkNIX1NVTlhJIHx8IEFSQ0hf
WlggfHwgQVJDIHx8IFJJU0NWCj4+Cj4+IFRoaXMgY29uZmxpY3RzLiBDYW4gdGhpcyBkZWZhdWx0
IGJlIHBhcnQgb2YgdGhlIHJpc2N2IGRlZmNvbmZpZyBpbnN0ZWFkPwo+Pgo+Cj4gTWF5YmUgSSBz
aG91bGQgcmVtb3ZlIHRoaXMgc2luY2UgaXQgaGFzIGJlZW4gc2VsZWN0ZWQgYnkgQ0xLX1NJRklW
RV9QUkNJPwo+Cj4gIGNvbmZpZyBDTEtfU0lGSVZFX1BSQ0kKPiAgICAgICAgIGJvb2wgIlBSQ0kg
ZHJpdmVyIGZvciBTaUZpdmUgU29DcyIKPiArICAgICAgIHNlbGVjdCBSRVNFVF9DT05UUk9MTEVS
Cj4gKyAgICAgICBzZWxlY3QgUkVTRVRfU0lNUExFCgpZYSwgdGhhdCdzIGJldHRlci4gIElJUkMg
SSBzdWdnZXN0ZWQgc29tZXRoaW5nIHNpbWlsYXIgaW4gc29tZSBvdGhlciAKdmVyc2lvbiwgYnV0
IEkgbWlnaHQgaGF2ZSBub3QgYWN0dWFsbHkgc2VudCB0aGUgbWFpbC4KCj4KPj4gPiAgICAgICAg
IGhlbHAKPj4gPiAgICAgICAgICAgVGhpcyBlbmFibGVzIGEgc2ltcGxlIHJlc2V0IGNvbnRyb2xs
ZXIgZHJpdmVyIGZvciByZXNldCBsaW5lcyB0aGF0Cj4+ID4gICAgICAgICAgIHRoYXQgY2FuIGJl
IGFzc2VydGVkIGFuZCBkZWFzc2VydGVkIGJ5IHRvZ2dsaW5nIGJpdHMgaW4gYSBjb250aWd1b3Vz
LAo+PiA+IEBAIC0xODcsNiArMTg3LDcgQEAgY29uZmlnIFJFU0VUX1NJTVBMRQo+PiA+ICAgICAg
ICAgICAgLSBSQ0MgcmVzZXQgY29udHJvbGxlciBpbiBTVE0zMiBNQ1VzCj4+ID4gICAgICAgICAg
ICAtIEFsbHdpbm5lciBTb0NzCj4+ID4gICAgICAgICAgICAtIFpURSdzIHp4Mjk2NyBmYW1pbHkK
Pj4gPiArICAgICAgICAgIC0gU2lGaXZlIEZVNzQwIFNvQ3MKPj4gPgo+PiA+ICBjb25maWcgUkVT
RVRfU1RNMzJNUDE1Nwo+PiA+ICAgICAgICAgYm9vbCAiU1RNMzJNUDE1NyBSZXNldCBEcml2ZXIi
IGlmIENPTVBJTEVfVEVTVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
