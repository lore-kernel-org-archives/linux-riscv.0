Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6B7C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHwIk/6sqXjie1UoVmH8TlrLFkxyxgIiFoAS7lwNjVE=; b=Di521gwTW203pk
	A/nP2oR9T63UG6T0oa2FAbzUShDd/NSwlYC/Nx4HMdVGN5TUBh30pIQg8rPHEQX6loE9lcEQOqEj6
	8vA02aTk8bNdShJyynYHqem8u0F29bhcbnwItxnyO3YJD/NFgBQ9r2ZPrFd+FoVV+v7E36s7oCtjt
	K8Hc6B2yrjopaSLrC4oozdUAvz20nHEfVQ79gBpo9Q+dZJQ9UzY6R/+VFz19XxDkPx7uzooky6FG+
	eXVjN2a5yE1fSAoT5r/dD5O2BV40GOaM5+LQAnyEpglMefsLjx8K6H82JciQAx0fSqiOfNT4/mCTO
	dL4UJ48Z4EAz5QhwGDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDV6-0000000GVep-0b5V;
	Fri, 12 Apr 2024 09:47:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDUs-0000000GVZ9-0udl
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 09:47:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC7FA339;
	Fri, 12 Apr 2024 02:47:27 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 529A53F64C;
	Fri, 12 Apr 2024 02:46:57 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:46:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
Message-ID: <ZhkDDnNvKiyStZZ2@bogus>
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
 <ZhetojJewygmTf6N@bogus>
 <CAEEQ3wkfHvH4jXNO5NRDf0Fc3xUkY64hp7BDBmgNVdcsmYy-kA@mail.gmail.com>
 <Zhj-4C7xlklG1m5B@bogus>
 <CAEEQ3wkO4WPaY+bPidg-fDqV5MrQwh8ESbSv-+q8Odhat9XDrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkO4WPaY+bPidg-fDqV5MrQwh8ESbSv-+q8Odhat9XDrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_024702_398573_C689AA7F 
X-CRM114-Status: GOOD (  18.37  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMDU6NDI6MjJQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdWRlZXAsCj4gCj4gT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNToyOeKAr1BNIFN1
ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
QXByIDEyLCAyMDI0IGF0IDEwOjEwOjA1QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+
IEhpIFN1ZGVlcCwKPiA+ID4KPiA+ID4gT24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgNTozMOKAr1BN
IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gT24gU3VuLCBBcHIgMDcsIDIwMjQgYXQgMDg6Mzg6MjhQTSArMDgwMCwgWXVuaHVpIEN1aSB3
cm90ZToKPiA+ID4gPiA+IFdoZW4gdGhlIHR5cGUgYW5kIGxldmVsIGluZm9ybWF0aW9uIG9mIHRo
aXNfbGVhZiBjYW5ub3QgYmUgb2J0YWluZWQKPiA+ID4gPiA+IGZyb20gYXJjaCwgY2FjaGVpbmZv
IGlzIGNvbXBsZXRlbHkgZmlsbGVkIGluIHdpdGggdGhlIGNvbnRlbnQgb2YgUFBUVC4KPiA+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBXaGljaCBwbGF0Zm9ybSBpcyB0aGlzID8gSXMgdGhpcyBhcm02
NCBiYXNlZCBvciBzb21ldGhpbmcgZWxzZSBsaWtlIFJJU0MtVgo+ID4gPiA+IGJhc2VkID8gVGhh
dCB3b3VsZCBoZWxwIHRvIHVuZGVyc3RhbmQgc29tZSBjb250ZXh0IGhlcmUuCj4gPiA+ID4KPiA+
ID4KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlLCBSSVNDLVYgY3VycmVudGx5IGhhcyB0
aGlzIHJlcXVpcmVtZW50Lgo+ID4gPiBQbGVhc2Ugc2VlOiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyNDA0MDcxMjM4MjkuMzY0NzQtMi1j
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbS8KPiA+ID4KPiA+Cj4gPiBJdCB3b3VsZCBiZSBoZWxwZnVs
IGZvciB0aGUgcmV2aWV3IGlmIHlvdSBoYXZlIHN1Y2ggaW5mb3JtYXRpb24gaW4gdGhlCj4gPiBj
b21taXQgbWVzc2FnZS4KPgo+IE9rYXksIEkgd2lsbCB1cGRhdGUgaXQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIGluIHYyLiBEbyB5b3UgaGF2ZSBzb21lCj4gY29tbWVudHMgb24gdGhlIGNvbnRlbnQg
b2YgdGhlIHBhdGNoPwo+CgpJIHdpbGwgdGFrZSBhIGxvb2sgYXQgdGhlIHBhdGNoIGxhdGVyIHRv
ZGF5IG9yIGVhcmx5IG5leHQgd2VlayBub3cgdGhhdApJIHVuZGVyc3RhbmQgdGhlIHJlcXVpcmVt
ZW50IGJldHRlci4gU29ycnkgZm9yIHRoZSBkZWxheS4KCi0tClJlZ2FyZHMsClN1ZGVlcAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
