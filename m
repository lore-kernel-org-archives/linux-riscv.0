Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46F610F9943
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utHeEpYVKgWy2edLKQ/Ia0MJiWmubjlzu0psWSDvmwk=; b=EZDJSok1YTvsa7
	BNgUXg8g7dh6pD3L8ZcHyQSuA9TYQ1zPlEY4bEKUi8gfFLDNp6hJkIz2K2KX2P1mGusFF6MTUuCSp
	8T2Q4frjL8ImB95REM9ygb91kVft44j2QFZYWKbcooYwbT8XLftnRLYEAAlP4inxRvCaOIR9TTqaS
	JI7hpfSkDRPU2DRhYA431eO5siR4VDABNvxdd4Si1BBTPTnYl7kxSCzAfXylz5qeqGys3Ww0LLb7A
	X8tmohc6KI6AGPf7V8Z5O9ic85+xjJRCB3dKaYRNmvUo/diCmbPbad+WnwiS58koHY3J1hgIa2tY9
	cVdkCOjb5spXiAJdTpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAU5w-000000090Yo-36z4;
	Wed, 08 Apr 2026 14:41:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAU5u-000000090YU-0vuX
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 14:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775659285; x=1807195285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3T+JHyGfVwewUEtO+BmwWAF3/3Pl1UDeVVWWEw1pLOU=;
  b=IWswLy5MWn6apfQCGVL5aK4XcZtmsLsSKpkqQQkjctPxMmk1TFEX6zML
   QkNAD6pmkxo14YJYC0T03v9MAtGzn5/GvYvDb8MaKN1d1bPPsPeK93cBz
   cd2P6Di2vaA9iB34dLXcaJMScEgMWhgKI0dR2DrftFQ6mgyYnZhXf09au
   aMydVzK+i6MIqGY8G/lJmjeJjyhpTt3fWJFkv4mzXOQczP+qL4VceiRe3
   UF+c2x8FVXUfxKZq6q1RB6nbP5dTA0e5RUdUJ2mT4//dww1Sm+p3tB3sb
   7qpMLQOqbRM45by7c6bFj8Ny3XJrU7vRQ5YcxRpGIFmp8ETPo+76uvFlW
   A==;
X-CSE-ConnectionGUID: tvDUhzONQY++97klloXO2Q==
X-CSE-MsgGUID: YucbOrxUQxmKRdRniYGJAA==
X-IronPort-AV: E=Sophos;i="6.23,167,1770620400"; 
   d="scan'208";a="223088503"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:41:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 8 Apr 2026 07:40:53 -0700
Received: from bby-cbu-swbuild03.eng.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58 via Frontend Transport; Wed, 8 Apr 2026 07:40:52 -0700
Date: Wed, 8 Apr 2026 07:40:51 -0700
From: Charles Perry <charles.perry@microchip.com>
To: Nick Hu <nick.hu@sifive.com>
CC: Charles Perry <charles.perry@microchip.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
References: <20250321083507.25298-1-nick.hu@sifive.com>
 <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
 <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_074126_632519_49D3DDB7 
X-CRM114-Status: GOOD (  19.98  )
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

T24gV2VkLCBBcHIgMDgsIDIwMjYgYXQgMDI6MTU6MTlQTSArMDgwMCwgTmljayBIdSB3cm90ZToK
PiBPbiBGcmksIE1hciAyNywgMjAyNiBhdCA0OjU24oCvQU0gQ2hhcmxlcyBQZXJyeQo+IDxjaGFy
bGVzLnBlcnJ5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTWFyIDIxLCAy
MDI1IGF0IDA0OjM1OjA2UE0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiA+IEFkZCBjb21wYXRp
YmxlIHN0cmluZyBhbmQgcHJvcGVydHkgZm9yIHRoZSBTaUZpdmUgQ0xJTlQgdjIuIFRoZSBTaUZp
dmUKPiA+ID4gQ0xJTlQgdjIgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIFNpRml2ZSBDTElOVCB2
MCBkdWUgdG8gZGlmZmVyZW5jZXMKPiA+ID4gaW4gdGhlaXIgY29udHJvbCBtZXRob2RzLgo+ID4K
PiA+IEhlbGxvIE5pY2ssCj4gPgo+ID4gQ2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBp
cyB0aGlzIGRpZmZlcmVudCBjb250cm9sIG1ldGhvZD8gSSd2ZQo+ID4gZm91bmQgdGhhdCBib3Ro
IE9wZW5TQkkgWzFdIGFuZCBVLUJvb3QgWzJdIHVzZSB0aGUgc2FtZSBtYXRjaCBkYXRhIGluIHRo
ZWlyCj4gPiBjbGludCBkcml2ZXIgd2hpY2ggd291bGQgaW5kaWNhdGUgdGhhdCB0aGV5IGFyZSBj
b21wYXRpYmxlLgo+ID4KPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpIZWxsbyBOaWNrLCBu
byB3b3JyaWVzLgoKPiBVbmxpa2UgdjAsIHYyIHJlcXVpcmVzIGEgd3JpdGUgdG8gdGhlIG10aW1l
IHJlZ2lzdGVyIHRvIGtpY2sgdGhlIHRpbWVyLgoKQSBraWNrIG9uY2UgYXQgdGhlIGJlZ2lubmlu
ZyBvciBldmVyeSB0aW1lIGEgbWFjaGluZSB0aW1lciBpbnRlcnJ1cHQgZmlyZXM/Cgo+IAo+ID4g
QWxzbywgZG8geW91IGtub3cgaWYgdGhlcmUncyBhbiBlYXN5IHdheSB0byB0ZWxsIGlmIGEgc2lm
aXZlIGNsaW50IGlzIGEgdjAKPiA+IG9yIHYyPwo+ID4KPiBzaWZpdmUsY2xpbnQyIGludHJvZHVj
ZXMgYWRkaXRpb25hbCBNTUlPIHJlZ2lzdGVycwoKSXMgdGhhdCB0aGUgaGlnaCByZXNvbHV0aW9u
IHRpbWVycyAoSFJUKSBtZW50aW9ubmVkIGluIHRoZSBkZXNjcmlwdGlvbj8KCkFuZCBsYXN0IHF1
ZXN0aW9uLCB3b3VsZCB5b3UgaGFwcGVuIHRvIGtub3cgaWYgc2lmaXZlIG1hZGUgYSBjbGludCB2
MSB0aGF0CmRvZXMgTk9UIHJlcXVpcmUgdGhlIG10aW1lIGtpY2sgYnV0IGRvZXMgaGF2ZSB0aGUg
SFJUPwoKSSdtIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoYXQgc2hvdWxkIGJlIHRoZSBjb21wYXRp
YmxlIGZvciBQSUM2NC1IUFNDLgpTb21lIGNvZGUgZnJvbSBhIHJlcG9zaXRvcnkgY2FsbGVkICJG
U0ZNIiB1c2VkICJzaWZpdmUsY2xpbnQxIiBmb3IgdGhlCmNvbXBhdGlibGUuIEknbSB3b25kZXJp
bmcgaWYgSSBzaG91bGQgYWRkIHRoZSBjbGludCB2MSB0byB0aGlzIGZpbGUuCgpUaGFua3MsCkNo
YXJsZXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
