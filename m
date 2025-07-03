Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC494C83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGQ0kuBzDsPCJFiGb8rvGLcoU3pwEE93vu72up0CuMM=; b=PqEh2brzpkdTD6
	R7UOSrAKzzZsNFLsyUNpdpgkSW0Pz4gF+AO7kySTAuMMl7GZI565gQ6m5+wA5BVuysrhJnlv927X6
	RixdiaLP7l7WBOxGYtgKYjEOglP76zW/43VDXxA8yvji7BGJBntj9cjbj4InaO+spZSzXS/UbfAIm
	sX+ZA2Zzv6wXlXkMDcEkjo8XZyHN+WOBiKm2pavOtg6k1l9Tio9vY/3Kkf1oY40wXGrw2dR3CsXxC
	FqTHY9pw9OJbI5cQ2I5iJa4j9zSUanH9TMVPA6r6N67CEooUtdg71jWQWb48H99dpmB6yVPaEGGiY
	7Y5VmLR0oJVWHcvsuuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNTX-0000000C5ae-0I3i;
	Thu, 03 Jul 2025 17:11:55 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKzv-0000000BgXQ-2kDY
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 14:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751553191; x=1783089191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QDQcYemNumpJkyuG0e7AEPmXkZuj/5OH8ZkCvxJeii4=;
  b=DqfrCahT/vy/EFboDIf2nC6GTeBkpYchz9EH6myKNiLIDjG8mvmplRgf
   hUZe7q+A4rKNwX9a4vMhMIuj1WWZdUXTx3RXUJQZy9TR+Y+L7X/TYKUyU
   /30rRSF2ON5htWa310y9CP+boaF091Ki51prVmz9691L78lFnts106fSR
   5SzIKa4gfSv2J70Flfn0E9ARuUEH1nZRmFZApcNJ0QlCxGOaHNC2ZNF1F
   Bhw7orSuuosmY94rQdVRAXuaF9aFKbGdQBw/XKT/zxJsou8Vtpb8QaN++
   veKofjDZxaRJ2q5kPEkTpLCAgt6nKNsQ9TbgPgtgi8KAfnVh1y39ZzsXZ
   A==;
X-CSE-ConnectionGUID: m5+OahmATE6u+gMQXZ5y3g==
X-CSE-MsgGUID: JmEe9kQHQHa8cAqqpbUsrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57691495"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="57691495"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:33:08 -0700
X-CSE-ConnectionGUID: rD2M51rKSdi1x5PzUhceIw==
X-CSE-MsgGUID: UEtkloWDSZmDsJUfFaYINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154958463"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:33:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uXKzi-0000000CED8-1unY;
	Thu, 03 Jul 2025 17:32:58 +0300
Date: Thu, 3 Jul 2025 17:32:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aGaUmpw1pVWNAmpb@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com>
 <aGUl_S9irfhlHmy2@smile.fi.intel.com>
 <aGZhWlxxQG0Z8awP@sunil-laptop>
 <aGaLiK0eW8Mc1YC3@smile.fi.intel.com>
 <CAK9=C2VjrOvcu=hEfxqw8R6Bwc1W5n9m_ksQ8vx02Lo8232wqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VjrOvcu=hEfxqw8R6Bwc1W5n9m_ksQ8vx02Lo8232wqQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_073311_704287_F7E0A3FE 
X-CRM114-Status: GOOD (  33.69  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMDMsIDIwMjUgYXQgMDc6NTY6NTJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIEp1bCAzLCAyMDI1IGF0IDc6MjTigK9QTSBBbmR5IFNoZXZjaGVua28KPiA8
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+IE9uIFRodSwgSnVs
IDAzLCAyMDI1IGF0IDA0OjI0OjE4UE0gKzA1MzAsIFN1bmlsIFYgTCB3cm90ZToKPiA+ID4gT24g
V2VkLCBKdWwgMDIsIDIwMjUgYXQgMDM6Mjg6NDVQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdy
b3RlOgo+ID4gPiA+IE9uIFdlZCwgSnVsIDAyLCAyMDI1IGF0IDEwOjQzOjQyQU0gKzA1MzAsIEFu
dXAgUGF0ZWwgd3JvdGU6CgouLi4KCj4gPiA+ID4gPiAtICAgICAgICAgaWYgKGRldl9vZl9ub2Rl
KGRldikpCj4gPiA+ID4gPiArICAgICAgICAgaWYgKGlzX29mX25vZGUoZndub2RlKSkgewo+ID4g
PiA+ID4gICAgICAgICAgICAgICAgICAgb2ZfbXNpX2NvbmZpZ3VyZShkZXYsIGRldl9vZl9ub2Rl
KGRldikpOwo+ID4gPiA+ID4gKyAgICAgICAgIH0gZWxzZSBpZiAoaXNfYWNwaV9kZXZpY2Vfbm9k
ZShmd25vZGUpKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICBtc2lfZG9tYWluID0gaXJx
X2ZpbmRfbWF0Y2hpbmdfZndub2RlKGltc2ljX2FjcGlfZ2V0X2Z3bm9kZShkZXYpLAo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBET01BSU5fQlVTX1BMQVRGT1JNX01TSSk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICBk
ZXZfc2V0X21zaV9kb21haW4oZGV2LCBtc2lfZG9tYWluKTsKPiA+ID4gPiA+ICsgICAgICAgICB9
Cj4gPiA+ID4KPiA+ID4gPiBBY3R1YWxseSB5b3UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoZSBpZi1l
bHNlLWlmIGlmIEkgYW0gbm90IG1pc3Rha2VuLgo+ID4gPiA+IFRoZSBPRiBkb2VzIGFsbW9zdCB0
aGUgc2FtZSBhcyBpdCdzIGRvbmUgaW4gdGhlIHNlY29uZCBicmFuY2ggZm9yIEFDUEkgY2FzZS4K
PiA+ID4gPiBIb3cgbWFueSBNU0kgcGFyZW50cyB0aGlzIG1heSBoYXZlPwo+ID4gPiA+Cj4gPiA+
IE9GIGFscmVhZHkgaGFzIGEgd2VsbCBkZWZpbmVkIGludGVyZmFjZSB0byBjb25maWd1cmUgdGhl
IE1TSSBkb21haW4uIFRoZQo+ID4gPiBtZWNoYW5pc21zIGV4aXN0aW5nIHRvZGF5IGFyZSBkaWZm
ZXJlbnQgZm9yIERUIHZzIEFDUEkgdG8gZmluZCBvdXQgdGhlCj4gPiA+IGZ3bm9kZSBvZiB0aGUg
TVNJIGNvbnRyb2xsZXIuIFNvLCBpdCBpcyBkb25lIGRpZmZlcmVudGx5Lgo+ID4KPiA+IEkgZG9u
J3Qgc2VlIGhvdy4gVGhlIG9ubHkgZGlmZmVyZW5jZSBJIHNlZSBpcyB0aGF0IE9GIGl0ZXJhdGVz
IG92ZXIgYWxsIGxpc3RlZAo+ID4gcGFyZW50cywgaWYgYW55LCBBQ1BJIHRyaWVzIG9ubHkgb25l
Lgo+ID4KPiA+IFNvLCBwZXJoYXBzIGl0J3MgYSB0aW1lIHRvIGhhdmUgYSBjb21tb24gQVBJIHNv
bWV3aGVyZSBmb3IgdGhpcyB0byBiZSBhZ25vc3RpYz8KPiA+IFNvbWV0aGluZyBsaWtlIGZ3bm9k
ZV9tc2lfY29uZmlndXJlKCkgaW4gc29tZXdoZXJlIG9mIElSUSBNU0kgY29yZT8KPiAKPiBUaGVy
ZSBpcyBhbiBpc3N1ZS9nYXAgaW4gdGhlIEREIGZyYW1ld29yayB3aGljaCBpcyBiZWluZyB3b3Jr
LWFyb3VuZAo+IGhlcmUuIFRoaXMgaXNzdWUgbWFuaWZlc3QgbW9zdGx5IGluIFJJU0MtViBsYW5k
IGJlY2F1c2UgaW4gUklTQy1WIGJvdGgKPiBNU0kgY29udHJvbGxlciBkcml2ZXIgYW5kIGRyaXZl
cnMgdXNpbmcgTVNJIGFyZSByZWd1bGFyIHBsYXRmb3JtIGRyaXZlcnMKPiB3aGlsZSB0aGUgcHJv
YmUgb3JkZXJpbmcgaXMgZW5zdXJlZCBieSBkZXZfbGluayBzdXBwb3J0IG9mIEREIGZyYW1ld29y
awo+IG9yIHRoZSBmcmFtZXdvcmtzIChsaWtlIEFDUEkpIGNyZWF0aW5nIHRoZSBkZXZpY2UuCj4g
Cj4gQXMtcGVyIHRoaXMgaXNzdWUsIHdoZW4gcGxhdGZvcm0gZGV2aWNlcyAoRFQgb3IgQUNQSSkg
YXJlIGNyZWF0ZWQgdGhlCj4gTVNJIGRvbWFpbiBpbnN0YW5jZSBpcyBub3QgYXZhaWxhYmxlIGFu
ZCBoZW5jZSBzZXQgdG8gTlVMTC4gVGhlIE1TSQo+IGRvbWFpbiBpbnN0YW5jZSBpcyBvbmx5IGF2
YWlsYWJsZSBhZnRlciBNU0kgY29udHJvbGxlciBkcml2ZXIgaXMgcHJvYmVkCj4gc28gY3VycmVu
dGx5IHdlIGV4cGxpY2l0bHkgZG8gb2ZfbXNpX2NvbmZpZ3VyZSgpIG9yIGRldl9zZXRfbXNpX2Rv
bWFpbigpCj4gaW4gdGhlIGRyaXZlciB1c2luZyBNU0kgYXMgYSB3b3JrLWFyb3VuZC4gQWRkaW5n
IGEgY29tbW9uCj4gZndub2RlX21zaV9jb25maWd1cmUoKSBpcyBvbmx5IGdvaW5nIHRvIGJlIGFu
IGltcHJvdmVtZW50IHRvIHRoZQo+IGV4aXN0aW5nIHdvcmstYXJvdW5kIHdoaWNoIHdlIHNob3Vs
ZCBub3QgaGF2ZSBpbiB0aGUgZmlyc3QgcGxhY2UKPiBoZW5jZSBub3QgdGhlIHJpZ2h0IGFwcHJv
YWNoIElNTy4KPiAKPiBJbiB0aGUgbG9uZyBydW4sIHdlIG5lZWQgYSBjbGVhbiBmaXggZm9yIHRo
ZSBhYm92ZSBpc3N1ZSBpbiB0aGUgREQKPiBmcmFtZXdvcmsgc3VjaCB0aGF0IHBsYXRmb3JtIGRy
aXZlcnMgdXNpbmcgTVNJIGRvbid0IGhhdmUgdG8gZXhwbGljaXRseQo+IGRvIG9mX21zaV9jb25m
aWd1cmUoKSBvciBkZXZfc2V0X21zaV9kb21haW4oKS4KCkkgc2VlLCB0aGFua3MgYSBsb3QgZm9y
IHRoaXMgZXhwbGFuYXRpb24uIENhbiB5b3UgYWRkIGEgc3VtbWFyeSBhcyBhIGNvbW1lbnQgb24K
dG9wIG9mIHRoZSBpZi1lbHNlLWlmIGluIGNhc2UgaXQncyBub3QgdGhlcmUgYWxyZWFkeT8KCi0t
IApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
