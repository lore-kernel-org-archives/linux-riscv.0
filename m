Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCAC00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SV6Kzeatx2ZXMYX2HmjSIvQSKWDVZKkI9yzpiQvWW4=; b=tu2zZYaxu8jY4s
	FwPF2cuxIlUz82Zq5CbIDVMK04o3TdgXg2MzzD439J8bANeUtodlNch4YNZyIsa9j+k5YbmwOmR/N
	MXktinmKJorXWFUvNfe3cRtmJ822XMw4xJVQwrivvX1VEh+xnEw1HVQla2lmecQtKKw2XROqDrzxL
	4p9wIAzSD8t/xKPnOhuD5X6dg4VJZbySg6VUL66COMHO7MKzbRGbS4hgD18kmkcoXohsFHh+EtI40
	mTaivJhZ9v8GW2G6oXBoJWeWqmSVJh3mT+9HOJKnRr4QxFs3mUUc1luOJiJUNNFoPrQWATZWQq0Rv
	RGJliOGmhdInnq3eoNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDDm-0000000GS5F-1Oof;
	Fri, 12 Apr 2024 09:29:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDDZ-0000000GS1C-0fee
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 09:29:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58A07339;
	Fri, 12 Apr 2024 02:29:37 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA2F23F64C;
	Fri, 12 Apr 2024 02:29:06 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:29:04 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
Message-ID: <Zhj-4C7xlklG1m5B@bogus>
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
 <ZhetojJewygmTf6N@bogus>
 <CAEEQ3wkfHvH4jXNO5NRDf0Fc3xUkY64hp7BDBmgNVdcsmYy-kA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkfHvH4jXNO5NRDf0Fc3xUkY64hp7BDBmgNVdcsmYy-kA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_022910_730247_09B6CB3C 
X-CRM114-Status: GOOD (  12.52  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMTA6MTA6MDVBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdWRlZXAsCj4gCj4gT24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgNTozMOKAr1BNIFN1
ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwg
QXByIDA3LCAyMDI0IGF0IDA4OjM4OjI4UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+
IFdoZW4gdGhlIHR5cGUgYW5kIGxldmVsIGluZm9ybWF0aW9uIG9mIHRoaXNfbGVhZiBjYW5ub3Qg
YmUgb2J0YWluZWQKPiA+ID4gZnJvbSBhcmNoLCBjYWNoZWluZm8gaXMgY29tcGxldGVseSBmaWxs
ZWQgaW4gd2l0aCB0aGUgY29udGVudCBvZiBQUFRULgo+ID4gPgo+ID4KPiA+IFdoaWNoIHBsYXRm
b3JtIGlzIHRoaXMgPyBJcyB0aGlzIGFybTY0IGJhc2VkIG9yIHNvbWV0aGluZyBlbHNlIGxpa2Ug
UklTQy1WCj4gPiBiYXNlZCA/IFRoYXQgd291bGQgaGVscCB0byB1bmRlcnN0YW5kIHNvbWUgY29u
dGV4dCBoZXJlLgo+ID4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UsIFJJU0MtViBjdXJy
ZW50bHkgaGFzIHRoaXMgcmVxdWlyZW1lbnQuCj4gUGxlYXNlIHNlZTogaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjQwNDA3MTIzODI5LjM2
NDc0LTItY3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20vCj4gCgpJdCB3b3VsZCBiZSBoZWxwZnVsIGZv
ciB0aGUgcmV2aWV3IGlmIHlvdSBoYXZlIHN1Y2ggaW5mb3JtYXRpb24gaW4gdGhlCmNvbW1pdCBt
ZXNzYWdlLgoKLS0KUmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
