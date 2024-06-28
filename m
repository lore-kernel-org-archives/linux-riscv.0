Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14193C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+rYbdFM4cGp5MiQT8BMBuYPeQVgWTtrO0If5VcA0ac=; b=cO4hvsr9a11yOU
	N/OKos4RVuEnpciRLCZNicxT4LJlj0ZRI9IhexlW9QhqBvKxirMhwE4Ho+O2wEQZ10YKHvbUjQvMf
	q1xYetWLUdhnRBiDzGK61VnlnFfzYqEB488di3JdI0aQ2hCpcXKehRJaib4xwc+mZhgVSRD7cbT+c
	ygzOCR7CymRT5eKXP0bY0FPKW5PqRJIBy1vh/Sr8Sn48Jq5svwo825m3rHjXykjcwREwM16C2FVJo
	z0f+onsvZ723YGfTXAwNQWooFQHFD/3MV7tsra6u4EFnGDx6FYys5s+rxORop2Z8aK2Mrh76XY4t6
	cXa9lrLA8klkqCFlB60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7XK-0000000DBKS-0SIg;
	Fri, 28 Jun 2024 09:04:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7XG-0000000DBJp-2zl0
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719565490; x=1751101490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U3+DfGDqFokDiR/y2k4xxkXE0EkMHAg60CIsaw1oG54=;
  b=EUeG/RYjVToISGP5+HoM8MSSg3zu5kXQdNdS3wqeDuPH3a5dWUXdA50j
   KLyyJNh+IxaPt8AT8fo8fDcb7KSNfrx69v4Ug/MZ0ktsFTYntujvR/8Ne
   CYSAJ7carsXqU0x0+065bTxPFg1Ei26rBxtdwG+zz+w+Q+s8nc7+Rkwjx
   mFvNfK9gkwlzq3juq0SjnCo9WwYEFQWlQKHB2CLWkOjqoi4aKPIOGi8V7
   CQbabfqBXjamBRSGc8wGqe7ph1jRC3aSQR5mgZJnl9QBq+n/Gk/RE4C7i
   ViAg2xw7/NITJGWRStN5BBa/SCBnBvb5GTY3GmtMZ0sazVyHsTjHbD6Yq
   w==;
X-CSE-ConnectionGUID: wfCG7+eBT9GlpV5sQJBFkA==
X-CSE-MsgGUID: deir/aDGSFCkzcqL2B9BEA==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="196014078"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 02:04:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 02:04:38 -0700
Received: from daire-X570 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 28 Jun 2024 02:04:36 -0700
Date: Fri, 28 Jun 2024 10:04:36 +0100
From: Daire McNamara <daire.mcnamara@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: <linux-pci@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] PCI: microchip: support using either instance 1
 or 2
Message-ID: <Zn58pDsX5YZL/pTD@daire-X570>
References: <20240612-outfield-gummy-388a36d95100@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612-outfield-gummy-388a36d95100@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_020450_839551_ED3F1D87 
X-CRM114-Status: GOOD (  15.11  )
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

V2l0aCB0aGUgcHJvdmlzbyBvZiBmaXhpbmcgdGhlIGF4aV8vYXBiXyBuaXQKCkFja2VkLWJ5OiBE
YWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbT4KCk9uIFdlZCwgSnVu
IDEyLCAyMDI0IGF0IDExOjU3OjU0QU0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiBGcm9t
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IAo+IFRoZSBjdXJy
ZW50IGRyaXZlciBhbmQgYmluZGluZyBmb3IgUG9sYXJGaXJlIFNvQydzIFBDSSBjb250cm9sbGVy
IGFzc3VtZQo+IHRoYXQgdGhlIHJvb3QgcG9ydCBpbnN0YW5jZSBpbiB1c2UgaXMgaW5zdGFuY2Ug
MS4gVGhlIHNlY29uZCByZWcKPiBwcm9wZXJ0eSBjb25zdGl0dXRlcyB0aGUgcmVnaW9uIGVuY29t
cGFzc2luZyBib3RoICJjb250cm9sIiBhbmQgImJyaWRnZSIKPiByZWdpc3RlcnMgZm9yIGJvdGgg
aW5zdGFuY2VzLiBJbiB0aGUgZHJpdmVyLCBhIGZpeGVkIG9mZnNldCBpcyBhcHBsaWVkIHRvCj4g
ZmluZCB0aGUgYmFzZSBhZGRyZXNzZXMgZm9yIGluc3RhbmNlIDEncyAiY29udHJvbCIgYW5kICJi
cmlkZ2UiCj4gcmVnaXN0ZXJzLiBUaGUgQmVhZ2xlViBGaXJlIHVzZXMgcm9vdCBwb3J0IGluc3Rh
bmNlIDIsIHNvIHNvbWV0aGluZyBtdXN0Cj4gYmUgZG9uZSBzbyB0aGF0IHNvZnR3YXJlIGNhbiBk
aWZmZXJlbnRpYXRlLiBUaGlzIHNlcmllcyBzcGxpdHMgdGhlCj4gc2Vjb25kIHJlZyBwcm9wZXJ0
eSBpbiB0d28sIHdpdGggZGVkaWNhdGVkICJjb250cm9sIiBhbmQgImJyaWRnZSIKPiBlbnRyaWVz
IHNvIHRoYXQgZWl0aGVyIGluc3RhbmNlIGNhbiBiZSB1c2VkLgo+IAo+IENoZWVycywKPiBDb25v
ci4KPiAKPiB2MjoKPiAtIHRyeSB0aGUgbmV3IHJlZyBmb3JtYXQgYmVmb3JlIHRoZSBvbGQgb25l
IHRvIGF2b2lkIHdhcm5pbmdzIGluIHRoZQo+ICAgbmV3IGNhc2UKPiAtIHJld29yZCAkc3ViamVj
dCBmb3IgMi8yCj4gCj4gQ0M6IERhaXJlIE1jTmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2No
aXAuY29tPgo+IENDOiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPgo+
IENDOiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4KPiBDQzogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KPiBDQzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xl
LmNvbT4KPiBDQzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgo+IEND
OiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Cj4gQ0M6IGxpbnV4LXBjaUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDQzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPiBDQzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gCj4gQ29ub3IgRG9vbGV5ICgyKToKPiAgIGR0LWJpbmRpbmdzOiBQQ0k6IG1pY3JvY2hp
cCxwY2llLWhvc3Q6IGZpeCByZWcgcHJvcGVydGllcwo+ICAgUENJOiBtaWNyb2NoaXA6IHJld29y
ayByZWcgcmVnaW9uIGhhbmRpbmcgdG8gc3VwcG9ydCB1c2luZyBlaXRoZXIKPiAgICAgaW5zdGFu
Y2UgMSBvciAyCj4gCj4gIC4uLi9iaW5kaW5ncy9wY2kvbWljcm9jaGlwLHBjaWUtaG9zdC55YW1s
ICAgICB8ICAxMCArLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWljcm9jaGlwLWhv
c3QuYyAgfCAxNTUgKysrKysrKysrLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5z
ZXJ0aW9ucygrKSwgODYgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi40My4wCj4gCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
