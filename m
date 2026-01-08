Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E7D185C4
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30Wj35tk9COX6md99nrcbvOx0yfa4ebqpbDnpVoq4Xs=; b=ah1a1HAGRzaGkx
	nJjdzXVTmXJT2ZXezBKpD+jc7SKDh/IwXePSIbD2jNNeOxC+625deoOPT2C/9F3JpjNetpCUugUQe
	FZe0ULH/wJxSG2Qwkb2EYO1pgVUUCIe6q6y3dr3ommubO2gmRUH43Z9SzUIriIwp9/UhzdUwe+nLr
	mnoMugd3IFaESMaB4all8QKpdBsgioNdsCQvS3nuqawRzyP+6jxZQaVSrnhIoyhVemCX6AyNP6enw
	4zZ5LjXsAjZRmFP+jaEI4imgWf34ipqriAyI0peeMrv8MGtaZNhJGgoeqXxbmZ31j4NpHJpxY2kjQ
	pKlL0KTxVCplbAH98MKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnTU-0000000Gf9i-0TqA;
	Thu, 08 Jan 2026 10:42:40 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnTR-0000000Gf8i-3fNO
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 10:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767868958; x=1799404958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YE+fJOggtKeC8He6gvH0To9NXKv9XCHhGejA/xXHexk=;
  b=iOKfu/C8e++yH+m+agA6R1Ie72w1oegAQUdE66o7wlSs0nasYzbZgnNp
   EdBsTtkotfkiP88OUpvPKYAnuv2AVQbH3V4RZxq0mMGMJ98XUobYNduAP
   CByqU6gwyCF6SCKL9+RLb9vup4VcchnKl7JWeEnbhp2Yhw4ZQq2Rc40/L
   HSi7pob+nZcLK5cgwBOgPXzEw1UyyQu8aaFF3+ETzCcEaC/csfqKiqaiX
   IPvZ5//D/qsNypuE/z8uVkxpjyp8MjH3X3zq7PaxGNUAGz/fj+FRzQZox
   N0cKaXXfe/Sebq12ZzBHf1j0hY80TWsn0suzgM7CGjbb9/EsyZA4m7moF
   g==;
X-CSE-ConnectionGUID: DKZskxAQTumNPDM8XCcWKQ==
X-CSE-MsgGUID: xm7/M7UkRAyZRo1MLmYEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86833503"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="86833503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:42:36 -0800
X-CSE-ConnectionGUID: 1p9UCShzRuixjZqE82rezw==
X-CSE-MsgGUID: WUX+b205Tyq/v9Xv/z1m2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233883284"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:42:31 -0800
Date: Thu, 8 Jan 2026 12:42:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	kees@kernel.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, Jason@zx2c4.com,
	conor.dooley@microchip.com, samuel.holland@sifive.com,
	charlie@rivosinc.com, ajones@ventanamicro.com, nathan@kernel.org,
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/5] lib/string_kunit: add test case for strnlen
Message-ID: <aV-KFRDNicUdta3i@smile.fi.intel.com>
References: <20260107023517.46840-1-jiangfeng@kylinos.cn>
 <20260107023517.46840-3-jiangfeng@kylinos.cn>
 <CAHp75VfxT+K1QRc5ayZGc4joB9vFJrk7kjQ4gAgUHOT1boFbmA@mail.gmail.com>
 <b419c6db-0f3f-4666-8f7c-156f7eda2b5b@kylinos.cn>
 <aV9cQ2QMA-jwFNUO@smile.fi.intel.com>
 <e02320c8-eff2-44af-a66c-a3c7ca9ca0ea@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e02320c8-eff2-44af-a66c-a3c7ca9ca0ea@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_024237_922567_93D6120B 
X-CRM114-Status: GOOD (  18.87  )
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

T24gVGh1LCBKYW4gMDgsIDIwMjYgYXQgMDY6MDA6MjFQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90
ZToKPiBPbiAyMDI2LzEvOCAxNToyNiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gT24gVGh1
LCBKYW4gMDgsIDIwMjYgYXQgMDI6NTM6NThQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90ZToKPiA+
PiBPbiAyMDI2LzEvNyAxOTo1NiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4+PiBPbiBXZWQs
IEphbiA3LCAyMDI2IGF0IDQ6MzXigK9BTSBGZW5nIEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5j
bj4gd3JvdGU6CgouLi4KCj4gPj4+PiBBZGQgYSBLVW5pdCB0ZXN0IGZvciBzdHJubGVuKCkgdG8g
dmVyaWZ5IGNvcnJlY3RuZXNzIGFjcm9zcwo+ID4+Pj4gZGlmZmVyZW50IHN0cmluZyBsZW5ndGhz
IGFuZCBtZW1vcnkgYWxpZ25tZW50cy4KPiA+Pj4KPiA+Pj4gU2FtZSBjb21tZW50IGFzIHBlciBw
YXRjaCAxIChpdCB3b3VsZCBwcm9iYWJseSByZXF1aXJlIHRvIGNhbGwgZm9yCj4gPj4+IGFyY2hf
c3RybmxlbigpIG9yIHNvbWV0aGluZyBsaWtlIHRoaXMpLgo+ID4+Cj4gPj4gVGhhbmtzLCBtYWtl
cyBzZW5zZS4KPiA+Pgo+ID4+IEknbGwgYWRkIHRoZSBwZXJmb3JtYW5jZSBiZW5jaG1hcmtpbmcg
KHJhbmRvbSBmaWxsaW5nICsgdGltaW5nKSBpbiBWMi4KPiA+Pgo+ID4+IFNpbmNlIHN0cmluZyBm
dW5jdGlvbnMgYXJlIHR5cGljYWxseSBleHBvcnRlZCBkaXJlY3RseSBieSBlYWNoIGFyY2hpdGVj
dHVyZQo+ID4+IHdpdGhvdXQgYW4gYXJjaF8gcHJlZml4LCBJJ2xsIGludHJvZHVjZSBhIGdlbmVy
aWNfc3RybmxlbigpIChiYXNlZCBvbgo+ID4+IGxpYi9zdHJpbmcuYykgd2l0aGluIHRoZSB0ZXN0
IGZvciBjb21wYXJpc29uLgo+ID4gCj4gPiBQcm9iYWJseSB5b3Ugd2FudCB0byBtYWtlIHRoZSBl
eGlzdGluZyBvbmUgdG8gaGF2ZSB0aGF0IG5hbWUgYW5kIHVzZSBpdCBpbnNpZGUKPiA+IHRoZSB0
ZXN0IGFuZCBpbiB0aGUgZmFsbGJhY2sgd3JhcHBlci4gV2UgZG9uJ3Qgd2FudCB0byBoYXZlIGR1
cGxpY2F0ZSBjb2RlLCBpdAo+ID4gaXMgYmFkIGZyb20gbWFpbnRlbmFuY2UgcGVyc3BlY3RpdmUu
Cj4gCj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbnMhCj4gCj4gVG8gYXZvaWQgY29kZSBkdXBs
aWNhdGlvbiwgSSdsbCByZW5hbWUgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gaW4gbGliL3N0
cmluZy5jCj4gdG8gX19nZW5lcmljX3N0cm5sZW4oKSBhbmQga2VlcCB0aGUgb3JpZ2luYWwgc3Ry
bmxlbigpIGFzIGEgd3JhcHBlci4gVGhlbiBJJ2xsIHVzZQo+IHRoZSBnZW5lcmljIG9uZSBpbiB0
aGUgS1VuaXQgdGVzdCBmb3IgY29tcGFyaXNvbi4KPiAKPiBEb2VzIHRoaXMgYXBwcm9hY2ggbG9v
ayBnb29kIHRvIHlvdT8KClRvIG1lLCB5ZXMuIFRvIG90aGVycywgd2Ugd2lsbCBrbm93IGxhdGVy
IG9uIHdoZW4geW91IHNlbmQgYSBuZXcgdmVyc2lvbi4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywK
QW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
