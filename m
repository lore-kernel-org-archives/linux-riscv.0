Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88E0C3ABAF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcZiD4ksDVnCI//f4NdA89IGr6zmgfflpF1Cnrq6uLU=; b=vtVOMVnFExNE0A
	l0KOtAsG3GA4BscOzVu40uD+20JtVVNneKGZf17gROQUMCGeKNIAA4eNV2KY4TeAQtCU6PRKxVOOX
	SUBlt01HG3w+hx+nx+X+Qq0P92pUw+b8zFkLAhGNg5cnziprtNyGfCnjVRSNTwG0+z+EAWXQDAZJ/
	mz0P9KCPWoUGSVKdf1/pLcOGnKKxnGCCkbywYgbfs4R5WUHjaoxpJvO1On3HmamTI6nLNtuzmwbJf
	JcmU7KccElUGohachinBztX6MJw2xF0M/aUGNpLFoj3BU5i9xFB45XzVXgU04BTgufLlJCha9ZFxr
	anOYILJuTnWS3G5cqNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1w9-0000000C0BQ-2i8u;
	Wed, 30 Apr 2025 07:32:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1kg-0000000ByAA-3A7r
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 07:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B2855C402B;
	Wed, 30 Apr 2025 07:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A350C4CEE9;
	Wed, 30 Apr 2025 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745997665;
	bh=unOAuHHlLSDYswEV053BVvtCpbY1HBhf14HMlI/dclI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkrydZABVN2h5znRN4UMWCuCuzR39Wj/6N5lYPSOxVD7PLIr07qGDVz8B0ddsauDn
	 vfcrkOHyrCDAeShx323/3z12fMsEJYRLoD2ptrbyW3ehqtigC5WsVV1nhvntJ8jRLZ
	 Lh0YYIkTB1kdvTyvsUAoz0eeV5J5IPQKcejy2iqxEPEy5NKYq//DwhSkzhvnsHrDfy
	 pGPHAcAa1IkB0NKxjhTtXw/C5R/B0w3LU2AMcVAYguYI3IHs+ZzzSsvFqUCTlJMlqd
	 CaL/3ZH7gVg/ZWS+3AyTHReOJ2CTKlJw1+8FIlD/wpG8CkftZBTQv9KcSrHAkIy2ZS
	 Lr4N3qNmn2kXA==
Date: Wed, 30 Apr 2025 09:21:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
Message-ID: <20250430-vagabond-agile-yak-7afe68@kuoka>
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
 <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
 <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
 <4d0bf5b8e1dd00f4025b7643a746cd99010c08fc.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d0bf5b8e1dd00f4025b7643a746cd99010c08fc.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002106_842151_4CCD360E 
X-CRM114-Status: GOOD (  15.44  )
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMDU6MDA6MDRQTSBHTVQsIEljZW5vd3kgWmhlbmcgd3Jv
dGU6Cj4gPiA+ID4gPiArLyogdmlydHVhbCBwaW5zIGZvciBmb3JjaW5nIEdQSSAqLwo+ID4gPiA+
ID4gKyNkZWZpbmUgUEFEX0lOVEVSTkFMX0xPV8KgwqDCoMKgwqDCoMKgMjU0Cj4gPiA+ID4gPiAr
I2RlZmluZSBQQURfSU5URVJOQUxfSElHSMKgwqDCoMKgwqDCoDI1NQo+ID4gPiA+IAo+ID4gPiA+
IFdoeSB0aGlzIGNhbm5vdCBiZSAyMCBhbmQgMjE/IFRoZXNlIGFyZSBub3QgdmFsdWVzIGZvciBy
ZWdpc3RlcnMsCj4gPiA+ID4gYnV0Cj4gPiA+ID4gYWJzdHJhY3QgbnVtYmVycy4KPiA+ID4gCj4g
PiA+IFRoZSBudW1iZXIgbXVzdCBub3QgY29sbGlkZSB3aXRoIFNZUyBHUElPIHBhZHMgdG9vLgo+
ID4gCj4gPiBUaGVyZSBhcmUgbm8gU1lTIEdQSU8gcGFkcyBoZXJlLiBEbyB5b3UgdW5kZXJzdGFu
ZCB0aGF0IHRoaXMgaXMgbm90Cj4gPiB2YWx1ZSBmb3IgcmVnaXN0ZXJzPwo+IAo+IFllcyBJIHVu
ZGVyc3RhbmQuCj4gCj4gVGhlIHNpdHVhdGlvbiBpcyB0aGF0IEpINzExMCBoYXMgdHdvIHNpbWls
YXIgcGluIG11eCBjb250cm9sbGVycywgb25lCj4gU1lTR1BJTyBhbmQgb25lIEFPTkdQSU8uIERl
c3BpdGUgSSBsaXN0ZWQgdGhlIHZhbHVlcyBhZnRlciB0aGUgQU9OR1BJTwo+IHBhZCBsaXN0LCB0
aGVzZSB2YWx1ZXMgc2hvdWxkIGFwcGx5IHRvIFNZU0dQSU8gdG9vICh1bmxlc3MgeW91IHdhbnQg
dG8KPiBsZXQgdGhlbSBoYXZlIGRpZmZlcmVudCB2YWx1ZXMgZm9yIHRoZXNlIHR3byBwaW5tdXgg
Y29udHJvbGxlcnMpLCB3aGljaAo+IGlzIHRoZSBwYXJ0IHdpdGggY29tbWVudCAic3lzX2lvbXV4
IHBpbnMiLgoKSXQgaXMgZmluZSBmb3IgbWUgaW4gc3VjaCBjYXNlLgoKQWNrZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCkJlc3QgcmVn
YXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
