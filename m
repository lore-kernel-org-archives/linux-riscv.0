Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA29CC7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY6aHrmgLf4MEdVhKFvUENggRyqpM3Rsieoxpz8EEWM=; b=DV2+jFLdDLC+Mv
	eEY18/orWFBLHZnI4bY4Bdb0g23kZ8AsIMc0zoSaZ86t91jEnsIqMWDMToaecCCUAfXcYDj9Z+9Dg
	rOicOEx30pg63tiIkDndcaB8+Wpghsdy60IOrgvL2BsCsL7uZ2PBha/zfUR15kUxLpNuJhIY0BaBh
	RQHyebgTV+/yNuEamTLsiIsgz1f+/FOIQArWAkF8C6W0N6SwAFF0Gr59iV6vxrxTVQXNw+LIrGpKB
	FnqIIdnaIxuBzEFnnijS6nHCVWi3/8c6jpzb5owMLitFZzYBM4x5lkwrVy+z6ht4SkU4bcnQYw3CB
	yPJa40REMM+qt7TQqbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnTo-0000000Bu3k-1ewJ;
	Thu, 26 Jun 2025 14:21:32 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnHH-0000000BrdP-1Djz
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946915; x=1782482915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k/qMuy2UAwSKbsE7B3K84tsOzsawz6UhjEOsFcCgiuY=;
  b=kyXF2bcKAOdCQqlwd+oWi2eEK7VYDT1jzW1bultTA2Xyd0vSFrjrPrsy
   yBxu1+4bom5OeTJStsHgczZUzp8VVrDrHUFwYBrl059tAl5Dff7LZkxnO
   7+YoOApfuWpfL9y+bvDeu6vquK4ODiccJatf/6aWJGWAXqfZDbX5vL1pc
   JHmyO1NB7JR09H2662fsxDbEyvu+K/4VzOHikJwpfSF+i6bS1+Gb37t2c
   rfvUP3DSr/V1sG9A6+uXU33L2wD0MULJqBdLxzQzPpEzvKkO45ya50vNa
   yDBIlnuik9znd7QgGD6qbo53co0hCw8xJ/oHwQTftQKFYSBLsDnDL8Za9
   Q==;
X-CSE-ConnectionGUID: J407BFrATGiPon4I0Ak7RA==
X-CSE-MsgGUID: h2+4lsADTTCNjHMrH4d5mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53185503"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53185503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:08:34 -0700
X-CSE-ConnectionGUID: CB549Yq0TNqBqvYiSe3cwg==
X-CSE-MsgGUID: h/oV6ZAkT420la7/oEhi8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="158027243"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:08:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUnH6-0000000ACBt-2d9z;
	Thu, 26 Jun 2025 17:08:24 +0300
Date: Thu, 26 Jun 2025 17:08:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aF1UWNzWhheLNTky@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com>
 <aFkZJKnweqBi64b8@smile.fi.intel.com>
 <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070835_342821_813C7B2E 
X-CRM114-Status: GOOD (  40.89  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjYsIDIwMjUgYXQgMTI6MzI6MTRQTSArMDUzMCwgUmFodWwgUGF0aGFrIHdy
b3RlOgo+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDI6MzbigK9QTSBBbmR5IFNoZXZjaGVua28K
PiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+IE9uIFdlZCwg
SnVuIDE4LCAyMDI1IGF0IDA1OjQzOjQ0UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6CgouLi4K
Cj4gPiA+ICt1bmlvbiBycG1pX2Nsa19yYXRlcyB7Cj4gPiA+ICsgICAgIHU2NCBkaXNjcmV0ZVtS
UE1JX0NMS19ESVNDUkVURV9NQVhfTlVNX1JBVEVTXTsKPiA+ID4gKyAgICAgc3RydWN0IHsKPiA+
ID4gKyAgICAgICAgICAgICB1NjQgbWluOwo+ID4gPiArICAgICAgICAgICAgIHU2NCBtYXg7Cj4g
PiA+ICsgICAgICAgICAgICAgdTY0IHN0ZXA7Cj4gPiA+ICsgICAgIH0gbGluZWFyOwo+ID4KPiA+
IEhhdmUgeW91IGxvb2tlZCBhdCB0aGUgbGluZWFyX3JhbmdlLmg/IFdoeSBjYW4gaXQgbm90IGJl
IChyZS0pdXNlZCBoZXJlPwo+IAo+IEkgZGlkIHRoZSBmaXJzdCB0aW1lIG9ubHkgd2hlbiB5b3Ug
Y29tbWVudGVkLiBBbmQgaSBkb250IHNlZSBhbnkKPiBiZW5lZml0IGluIHRoYXQuCj4gbGluZWFy
X3JhbmdlIGhhcyBzbGlnaHRseSBkaWZmZXJlbnQgd2F5IHRvIGFjY2VzcyBhbnkgdmFsdWUgdXNp
bmcgYHNlbGAuCj4gSGVyZSB0aGlzIHVuaW9uIHJlcHJlc2VudHMgaG93IFJQTUkgcHJvdG9jb2wg
cmVwcmVzZW50cyB0aGUgcmF0ZXMgYW5kCj4gcmV1c2luZyBsaW5lYXJfcmFuZ2Ugd2lsbCBvbmx5
IGludHJvZHVjZSBjb252ZXJzaW9uIHRvIGFuZCBmcm8uCgpTdW1tYXJpemUgdGhpcyBpbiB0aGUg
Y29tbWVudCBvbiB0b3Agb2YgdGhlIHN0cnVjdCBkZWZpbml0aW9uIHNvIG9uZSB3aWxsIG5vdAph
dHRlbXB0IHRvIGNvbnZlcnQgdGhlIGRyaXZlciBpbiB0aGUgZnV0dXJlLgoKPiA+ID4gK307Cgou
Li4KCj4gPiA+ICtzdGF0aWMgdTMyIHJwbWlfY2xrX2dldF9udW1fY2xvY2tzKHN0cnVjdCBycG1p
X2Nsa19jb250ZXh0ICpjb250ZXh0KQo+ID4gPiArewo+ID4gPiArICAgICBzdHJ1Y3QgcnBtaV9n
ZXRfbnVtX2Nsb2Nrc19yeCByeDsKPiA+ID4gKyAgICAgc3RydWN0IHJwbWlfbWJveF9tZXNzYWdl
IG1zZzsKPiA+ID4gKyAgICAgaW50IHJldDsKPiA+ID4gKwo+ID4gPiArICAgICBycG1pX21ib3hf
aW5pdF9zZW5kX3dpdGhfcmVzcG9uc2UoJm1zZywgUlBNSV9DTEtfU1JWX0dFVF9OVU1fQ0xPQ0tT
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgMCwg
JnJ4LCBzaXplb2YocngpKTsKPiA+Cj4gPiAuLi5oZXJlCj4gPgo+ID4gPiArICAgICByZXQgPSBy
cG1pX21ib3hfc2VuZF9tZXNzYWdlKGNvbnRleHQtPmNoYW4sICZtc2cpOwo+ID4gPiArCj4gPgo+
ID4gVGhpcyBibGFuayBsaW5lIHNob3VsZCBiZSByYXRoZXIgXl5eCj4gCj4gU3VyZSwgSSB3aWxs
IHVwZGF0ZS4KPiAKPiA+Cj4gPiA+ICsgICAgIGlmIChyZXQgfHwgcnguc3RhdHVzKQo+ID4gPiAr
ICAgICAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+IFdoeSByeC5zdGF0dXMgY2FuJ3QgYmUgY2hl
Y2tlZCBiZWZvcmUgY2FsbGluZyB0byBhIHNlbmRpbmcgbWVzc2FnZT8KPiA+IFNvdW5kcyBsaWtl
IHRoZSBycG1pX21ib3hfaW5pdF9zZW5kX3dpdGhfcmVzcG9uc2UoKSBsaW5rcyByeCB0byBtc2cg
c29tZWhvdy4KPiA+IElmIHRoaXMgaXMgdGhlIGNhc2UsIHVzZSBtc2cgaGVyZSwgb3RoZXJ3aXNl
IG1vdmUgdGhlIGNoZWNrIHRvIGJlIGluIHRoZQo+ID4gY29ycmVjdCBwbGFjZS4KPiAKPiBZZXMs
IHRoZSBycG1pX21ib3hfaW5pdF9zZW5kX3dpdGhfcmVzcG9uc2UgaXMgYSBoZWxwZXIgZnVuY3Rp
b24gd2hpY2ggbGlua3MKPiB0aGUgcnggdG8gbXNnLiBJdCdzIGEgdmVyeSBzaW1wbGUgZnVuY3Rp
b24gd2hpY2ggb25seSBwZXJmb3JtcyBhc3NpZ25tZW50cy4KPiAKPiBVc2luZyBtc2cgaW5zdGVh
ZCBvZiByeCBkaXJlY3RseSB3aWxsIHJlcXVpcmUgYWRkaXRpb25hbCB0eXBlY2FzdGluZwo+IHdo
aWNoIHdpbGwgb25seSBjbHV0dGVyCj4gSSBjYW4gYWRkIGEgY29tbWVudCBpZiB0aGF0IGhlbHBz
IHdoZXJldmVyIHRoZSBycG1pX21ib3hfaW5pdF9zZW5kX3dpdGhfcmVzcG9uc2UKPiBpcyB1c2Vk
LgoKVGhpcyBpcyBiZXNpZGVzIGhhcmRlci10by1yZWFkIGNvZGUgaXMga2luZGEgb2YgbGF5ZXJp
bmcgdmlvbGF0aW9uLgpJZiB5b3UgYWZyYWlkIG9mIGEgY2FzdGluZywgYWRkIGEgaGVscGVyIHRv
IGNoZWNrIGZvciB0aGUgc3RhdHVzIGVycm9yLgpDb21tZW50IHdvbid0IGhlbHAgbXVjaCBhcyBt
YWtpbmcgY29kZSBiZXR0ZXIgdG8gYmVnaW4gd2l0aC4KCj4gPiBTZWVtcyB0aGUgc2FtZSBxdWVz
dGlvbiB0byB0aGUgYWxsIHNpbWlsYXIgY2hlY2tzIGluIHRoZSBjb2RlLgo+ID4KPiA+ID4gKyAg
ICAgcmV0dXJuIGxlMzJfdG9fY3B1KHJ4Lm51bV9jbG9ja3MpOwo+ID4gPiArfQoKLi4uCgo+ID4g
PiArICAgICBzdHJ1Y3QgcnBtaV9jbGtfY29udGV4dCAqY29udGV4dCA9IHJwbWlfY2xrLT5jb250
ZXh0Owo+ID4gPiArICAgICBzdHJ1Y3QgcnBtaV9jbGtfcmF0ZV9kaXNjcmV0ZSAqcmF0ZV9kaXNj
cmV0ZTsKPiA+ID4gKyAgICAgc3RydWN0IHJwbWlfY2xrX3JhdGVfbGluZWFyICpyYXRlX2xpbmVh
cjsKCj4gPiA+ICsgICAgIHN0cnVjdCBycG1pX2dldF9zdXBwX3JhdGVzX3J4ICpyeCBfX2ZyZWUo
a2ZyZWUpID0gTlVMTDsKClRoaXMgc2hvdWxkIGJlIGFzc2lnbmVkIHdoZXJlIGl0J3MgdXNlZC4g
TlVMTCBhc3NpZ25tZW50IGlzIG5vdCBlbmNvdXJhZ2VkLgoKPiA+ID4gKyAgICAgc3RydWN0IHJw
bWlfZ2V0X3N1cHBfcmF0ZXNfdHggdHg7Cj4gPiA+ICsgICAgIHN0cnVjdCBycG1pX21ib3hfbWVz
c2FnZSBtc2c7Cj4gPgo+ID4gPiArICAgICBzaXplX3QgY2xrX3JhdGVfaWR4ID0gMDsKPiA+Cj4g
PiBUaGlzIGtpbmQgb2YgYXNzaWdubWVudHMgaXMgaGFyZCB0byBtYWludGFpbiBhbmQgaXQncyBt
aXN0YWtlIHByb25lIGluIGNhc2UKPiA+IHNvbWUgYWRkaXRpb25hbCBjb2RlIGlzIGluamVjdGVk
IGluIHRoZSBmdXR1cmUgdGhhdCBtaWdodCByZXVzZSBpdC4KPiA+Cj4gSSBkb250IHVuZGVyc3Rh
bmQgd2hhdCBpcyB0aGUgcHJvYmxlbSB3aXRoIHRoaXMgYXNzaWdubWVudC4gSWYgYW55Cj4gY29k
ZSBhZGRlZCBpbiB0aGUgZnV0dXJlIHJldXNlIGl0IHRoZW4gaXQgaGFzIHRvIG1ha2Ugc3VyZSB0
aGF0Cj4gY2xrX3JhdGVfaWR4IGhhcyB0aGUgY29ycmVjdCBpbml0aWFsIHZhbHVlIGJlZm9yZSBh
bnkgZnVydGhlciByZWZlcmVuY2VzLgoKWWVzLCBpdCB3aWxsIGFkZCBhbiBhZGRpdGlvbmFsIGNo
dXJuIGFuZCByZXF1aXJlIG1vcmUgYnJhaW4gYWN0aXZpdHkgdG8KbWFpbnRhaW4gc3VjaCBhIGNv
ZGUuIEl0J3MgYSBnZW5lcmFsIHJlY29tbWVuZGF0aW9uIHRvIGFzc2lnbiB3aGVuIGl0J3MKYWN0
dWFsbHkgbmVlZGVkICh0aGVyZSBhcmUsIG9mIGNvdXJzZSwgZXhjZXB0aW9ucyBmb3Igc29tZSBz
bWFsbCBmdW5jdGlvbnMsCmJ1dCB0aGlzIG9uZSBpcyBub3QpLgoKPiA+ID4gKyAgICAgaW50IHJl
dCwgcmF0ZWlkeCwgajsKCi4uLgoKPiA+ID4gKyAgICAgY29udGV4dC0+Y2hhbiA9IG1ib3hfcmVx
dWVzdF9jaGFubmVsKCZjb250ZXh0LT5jbGllbnQsIDApOwo+ID4gPiArICAgICBpZiAoSVNfRVJS
KGNvbnRleHQtPmNoYW4pKQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNvbnRl
eHQtPmNoYW4pOwo+ID4KPiA+IEhlcmUgaXMgYW4gaW5jb3JyZWN0IG9yZGVyIG9mIHRoZSBmcmVl
aW5nIHJlc291cmNlcy4gQmVzaWRlcyB0aGF0LCB3cmFwcGluZwo+ID4gdGhlIG1ib3hfZnJlZV9j
aGFubmVsKCkgaW50byBtYW5hZ2VkIHJlc291cmNlcyByZWR1Y2VzIHRoaXMgY29kZSBieSBtb3Jl
Cj4gPiB0aGFuIDEwIExvQ3MhIEF0IGJhcmUgbWluaW11bSBpdCB3aWxsIGZpeCB0aGUgYnVnLAo+
IAo+IFVuZGVyc3Rvb2QuIFNvIHdlIGNhbiB1c2UgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0IHRv
IGxpbmsgYSByZWxlYXNlIGZ1bmN0aW9uCj4gd2l0aCB0aGUgY29udGV4dC0+Y2hhbi4gSXMgdGhp
cyB3aGF0IHlvdSBhcmUgc3VnZ2VzdGluZz8gVGhpcyB3aWxsIGFsc28gbWFrZQo+IHRoZSAucmVt
b3ZlIGNhbGxiYWNrIHJlZHVuZGFudCB3aGljaCBjYW4gYmUgcmVtb3ZlZC4KClllcy4KCi0tIApX
aXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
