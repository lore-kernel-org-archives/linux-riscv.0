Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A693C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMBCsc8LSnHkyV/PMVO8jn4WAJO7jaF3+wz8aiGu94o=; b=kMRoPQvwUzGtNy
	/Z7IhE4toSZZZJXiCB+P/0p+dWEv700ae9NCdKDng5e63U5B3A2eitYqHfRAlbBV5OPQqfqTBy44x
	KDY87HSqNyz4AEUTiGpxtQDYtsl/UYE4ir7nr463F9uMugoPVHiodrVR9+QNvbxscPKQbwDMt+fZQ
	goOoNcR8hyi5HpargMWSRTECy2n4bHDunlrNS/KbA5Juv33jhXRvVAboIiEcOVTquMzYj3GhhySa7
	fzKMBlolNnRvxPRWTQI+EVhxTZUeJ57OaTjWgrhaqXvvd3qqiAqX+gi94JUtkGPGGTKYBNYV2gTQV
	50MJkn64nrBOQLAIwjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9vC-00000001mah-2Jhx;
	Mon, 01 Jul 2024 05:49:50 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9v9-00000001mZc-0zYx
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 05:49:48 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3d55e2e032dso1641086b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2024 22:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719812986; x=1720417786; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4s/WBvVl/dst1lHjWFZpMEMdrWEWEKJym4uGaWtNax0=;
        b=E6gQMdWAUHS81Tzi5xj1Wt73Eyp6qbOvLLMzb6qKqWe1hXF4ZMV7nquXay1iqfafgF
         pB+e5e6VLL6yAsrp/OsAeJYZAnNfgsLKiyuZlH3BmqEuIb9Hanpf9AOEdRASvNFf371H
         VQgAN5Z7f9ZG/YKKjAAsL7fKyhpMTbGV4LHEyPhh2GpC6FHJgeWuuAKdG9jEgLkA5gCX
         0OxYrWfEK5L+axL81/jinZu1tmET1xPTwY3HLDjL71KOwJeHDZC6dk84KEI9zPAP7KPk
         HMC8/DFV5TXlYUFsPgN+IOHhGVRuVMoL9tRR81fUFq7Gn3Wwa8RrdCeqLKzmSPPFw6yp
         u1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719812986; x=1720417786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4s/WBvVl/dst1lHjWFZpMEMdrWEWEKJym4uGaWtNax0=;
        b=XpnpeY+wPzNm8znP7q6tfcpbKwfo/uEQ521cmmAG/0GVlANcUmHzZsJRSlE+Fo5pti
         twns93MZbY+kC7MXUS/6UjS9BVST9DHjj5n/elFy4+f8G+4J8ftSSDnw2r4SmKrw5z7D
         WTx6Tz9SfZqTkhFtdrMylXYyZNtCJhaoYYvDmp2zSba38i1BVtO8U3T0q17A6Fo9W+T+
         mtklxD7thXBx7ab5Nu6ulj6MZF+Egybc0eavHtKRPg2c/mpWP0eNFeGDLeTbHwmmWNHR
         NlXDCF9Rhd7h4DXMw7oL1PkL6lyOD5P/HFnTygpX6fjcz+GAKw5HCDfjgtAJOA8F/tU6
         AZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWrlyCJBMafRxZuABiVr1c6TgbCliv4Rav/2HW8ZWushgB9ZnbyZvZXwYWb3oqf4f4BldVi0bfOb+Y2t3R1rDDX8nrhWS6bxAzgr+tQKRD7
X-Gm-Message-State: AOJu0YwIL7Ig27OYhjDdv4Ui6zr2L2WC6SFa6wBgdsixzQ3/nSQO4S7O
	RiJCUHpOKDjuppV95ZqE4+qSGkwHoJbQ6xRcr1uDFOTZ+JyMiqauLdeFQd4OBLE=
X-Google-Smtp-Source: AGHT+IFkbfzSyeGbbMoYBWXleU/NPIjZpuMJZvhBR4F8gn5oN8vBjv/YM3Be+WxqxSc8Jn7yn+W2+w==
X-Received: by 2002:a05:6808:1706:b0:3d6:32d2:2c15 with SMTP id 5614622812f47-3d6b5686a2dmr6011108b6e.59.1719812985837;
        Sun, 30 Jun 2024 22:49:45 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb48ab1sm1228661b6e.54.2024.06.30.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 22:49:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 11:19:35 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com,
	sudeep.holla@arm.com, tiantao6@huawei.com
Subject: Re: [External] Re: [PATCH v6 3/3] RISC-V: Select ACPI PPTT drivers
Message-ID: <ZoJDb9PQX2oEISrI@sunil-laptop>
References: <20240617131425.7526-1-cuiyunhui@bytedance.com>
 <20240617131425.7526-3-cuiyunhui@bytedance.com>
 <CAEEQ3wnkQsfmLbyMrG_YBvWvhHJdSTg7dG5W_mxv_wxCjatgCA@mail.gmail.com>
 <ZnLY3mNxyv9QOmGn@sunil-laptop>
 <CAEEQ3wmarOoWWYrdpf7YNQdZG4rf_O4dHkeiO3W1cuavVh8TMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmarOoWWYrdpf7YNQdZG4rf_O4dHkeiO3W1cuavVh8TMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_224947_301277_950618BE 
X-CRM114-Status: GOOD (  17.04  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMDk6Mjg6MThBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdW5pbCwKPiAKPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCA5OjEx4oCvUE0gU3Vu
aWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
SnVuIDE5LCAyMDI0IGF0IDA3OjMyOjE4UE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+
IEhpIFN1bmlsLAo+ID4gPgo+ID4gPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCA5OjE04oCvUE0g
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gQWZ0ZXIgYWRkaW5nIEFDUEkgc3VwcG9ydCB0byBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXMoKSwg
UklTQy1WIGNhbiBidWlsZAo+ID4gPiA+IGNhY2hlaW5mbyB0aHJvdWdoIHRoZSBBQ1BJIFBQVFQg
dGFibGUsIHRodXMgZW5hYmxpbmcgdGhlIEFDUElfUFBUVAo+ID4gPiA+IGNvbmZpZ3VyYXRpb24u
Cj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogSmVyZW15IExpbnRvbiA8amVyZW15Lmxp
bnRvbkBhcm0uY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5o
b2xsYUBhcm0uY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9LY29uZmlnIHwg
MSArCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPiA+Cj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ID4gPiA+IGluZGV4IDlmMzhhNWVjYmVlMy4uMWI0YzMxMGE1OWZiIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ID4gPiA+IEBAIC0xMyw2ICsxMyw3IEBAIGNvbmZpZyAzMkJJVAo+ID4gPiA+ICBjb25maWcgUklT
Q1YKPiA+ID4gPiAgICAgICAgIGRlZl9ib29sIHkKPiA+ID4gPiAgICAgICAgIHNlbGVjdCBBQ1BJ
X0dFTkVSSUNfR1NJIGlmIEFDUEkKPiA+ID4gPiArICAgICAgIHNlbGVjdCBBQ1BJX1BQVFQgaWYg
QUNQSQo+ID4gPiA+ICAgICAgICAgc2VsZWN0IEFDUElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZIGlm
IEFDUEkKPiA+ID4gPiAgICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UCj4g
PiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OIGlmIEhV
R0VUTEJfUEFHRSAmJiBNSUdSQVRJT04KPiA+ID4gPiAtLQo+ID4gPiA+IDIuMjAuMQo+ID4gPiA+
Cj4gPiA+Cj4gPiA+IEdlbnRsZSBwaW5nLgo+ID4gPgo+ID4gQWN0dWFsbHksIG15IFJCIGlzIHN0
aWxsIHZhbGlkLiBBbnl3YXksIGhlcmUgYWdhaW4uCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IFN1bmls
IFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4KPiA+IFRoYW5rcywKPiA+IFN1bmls
Cj4gCj4gT2theSwgdGhhbmsgeW91LiBCVFcsIHdoZW4gd2lsbCB0aGlzIHBhdGNoc2V0IGJlIHBp
Y2tlZCB1cCB0byBsaW51eC1uZXh0Pwo+IApIaSBQYWxtZXIsCgpDYW4gdGhpcyBzZXJpZXMgYmUg
cGlja2VkIHVwIGZvciAtbmV4dD8gTG9va3MgbGlrZSBpdCBoYXMgZ290IHN1ZmZpY2llbnQKcmV2
aWV3cy4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
