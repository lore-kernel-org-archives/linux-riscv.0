Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F8DC5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 20:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2pFNiL43EBd3b0V4G4AvRislTbtXdsqHK1l3pVwBXM=; b=Zcc7KoWElUNE4M
	UBEtFyquo2oVwBlgqTaOELp/ehsfjVZ5OzNDMxesq8GJfxGrX1tO2Hsc27zhYyrgbLQMvQXdue2Qu
	71+hiy5SBN/O6iHHJaCu1uMXhBdU77eQ0Kkz3vT934sd8CvV1rOCyHONz0DTwlJzWbJ+YKCQLtS1n
	bmC4B9yArH498OdnHxU1E1NEoqezwwAZKsdjiooGrMbFipRWa0VpYpV4u1xUxvdA6Emp+OVq9ZtH+
	GjRmDRvtoNDqQ+nq7n0w3/OFBwoAXHkcK50RYKgvahBG5x6O+HwFN6OeUkuHcXI4gXExQ1jOxHcOR
	3AyanB+jJPgTFhALiL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOikA-0000000572w-17pZ;
	Mon, 09 Jun 2025 20:05:18 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOijS-000000056xo-3gOK
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 20:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749499475; x=1781035475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yUuvb828aWvLH8lzzQnIsJ5D980USIpuviHfRjTllQ0=;
  b=XJqCxF2i4yOqJ+Sp79NNTRL+meiLk1U8Qigndz7/0WIwTNOTLjQyfPVh
   /9hz0dQ3o4Ujc4UEGOdvzfKGCA9Ew6M6GKJAoN+p0x9bV0pkERAiOY4ZX
   3vIHZUY5QXgc4z+kYBP6TM/DTM3qnRd1SIm/VlK12QeYrqOWs5Y532AFf
   h4rg+FGvRQx21mCaeKpFq1tLHJWfI8G3EZdmFcKv2eQOoN/d6V4ZCW8eJ
   v7e/OQDmiaBVegpDgMavdaLLu6hpMXUaSOfM5Owv1gzyCU73iawoQsOwQ
   njks8u7g0ldywYUuzhtAGhhU+RqVcboCjheLaqtdSrhmaGLtYQlLc8I1J
   g==;
X-CSE-ConnectionGUID: qQ3WoRuHTCSqdYJKNEPJpQ==
X-CSE-MsgGUID: olE3ZGADQFyghGMHCSx4zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62626248"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62626248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:04:34 -0700
X-CSE-ConnectionGUID: MxTEgy0kRCSr/efLPe7Dlw==
X-CSE-MsgGUID: pSrDO/9FQgO05dfgzHptsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151489909"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:04:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOijI-000000059OT-2Hi4;
	Mon, 09 Jun 2025 23:04:24 +0300
Date: Mon, 9 Jun 2025 23:04:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aEc-SHvL187xdj-m@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
 <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_130434_954846_74E8EE77 
X-CRM114-Status: GOOD (  26.65  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDU6NTk6NDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCA0OjIz4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBTdW4sIE1h
eSAyNSwgMjAyNSBhdCAwMjoxNjo1NFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgoKLi4uCgo+
ID4gPiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+Cj4gPiBhc20vKiB1c3VhbGx5IGdvZXMgYWZ0
ZXIgZ2VuZXJpYyBsaW51eC8qIG9uZXMuIFdoeSBoZXJlPwo+IAo+IEkgYW0gbm90IGF3YXJlIG9m
IGFueSBzdWNoIGNvbnZlbnRpb24gYnV0IEkgd2lsbCB1cGRhdGUgYW55d2F5LgoKSXQncyBqdXN0
IGEgY29tbW9uIHNlbnNlLiBXZSBpbmNsdWRlIG1vc3QgZ2VuZXJpYyBmaXJzdCBhbmQgbW9zdCBj
dXN0b20gYXQKbGFzdC4KCi4uLgoKPiA+ID4gK3N0YXRpYyBpbnQgbXB4eV93cml0ZV9hdHRycyh1
MzIgY2hhbm5lbF9pZCwgdTMyIGJhc2VfYXR0cmlkLCB1MzIgYXR0cl9jb3VudCwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICB1MzIgKmF0dHJzX2J1ZikKPiA+ID4gK3sKPiA+ID4gKyAg
ICAgc3RydWN0IG1weHlfbG9jYWwgKm1weHkgPSB0aGlzX2NwdV9wdHIoJm1weHlfbG9jYWwpOwo+
ID4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0IHNyZXQ7Cj4gPiA+ICsgICAgIHUzMiBpOwo+ID4gPiAr
Cj4gPiA+ICsgICAgIGlmICghbXB4eS0+c2htZW1fYWN0aXZlKQo+ID4gPiArICAgICAgICAgICAg
IHJldHVybiAtRU5PREVWOwo+ID4gPiArICAgICBpZiAoIWF0dHJfY291bnQgfHwgIWF0dHJzX2J1
ZikKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gKwo+ID4gPiArICAg
ICBnZXRfY3B1KCk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IGF0dHJfY291
bnQ7IGkrKykKPiA+ID4gKyAgICAgICAgICAgICAoKF9fbGUzMiAqKW1weHktPnNobWVtKVtpXSA9
IGNwdV90b19sZTMyKGF0dHJzX2J1ZltpXSk7Cj4gPgo+ID4gRG9uJ3Qgd2UgaGF2ZSBoZWxwZXJz
IGZvciB0aGlzPyBUaGV5IGFyZSBzdWZmaXhlZCB3aXRoIF9hcnJheS4KPiA+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1LXJjNi9zb3VyY2UvaW5jbHVkZS9saW51eC9ieXRl
b3JkZXIvZ2VuZXJpYy5oI0wxNjgKPiA+IERvbid0IGZvcmdldCB0byBoYXZlIGFzbS9ieXRlb3Jk
ZXIuaCBiZWluZyBpbmNsdWRlZC4KPiA+Cj4gPiBEaXR0byBmb3IgdGhlIHNpbWlsYXIgY2FzZShz
KS4KPiAKPiBUaGUgY3B1X3RvX2xlMzJfYXJyYXkoKSBhbmQgbGUzMl90b19jcHVfYXJyYXkoKSBo
ZWxwZXJzIHVwZGF0ZSBkYXRhCj4gaW4tcGxhY2UgYnV0IG92ZXIgaGVyZSB3ZSBoYXZlIHNlcGFy
YXRlIHNvdXJjZSBhbmQgZGVzdGluYXRpb24uCgpGYWlyIGVub3VnaC4gUGVyaGFwcyBhZGQgc29t
ZXRoaW5nIGxpa2UgbWVtY3B5X3RvX2xlMzIoKSAvIG1lbWNweV9mcm9tX2xlMzIoKQpvciBhbGlr
ZSBmb3IgeW91ciBjYXNlPwoKPiA+ID4gKyAgICAgc3JldCA9IHNiaV9lY2FsbChTQklfRVhUX01Q
WFksIFNCSV9FWFRfTVBYWV9XUklURV9BVFRSUywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICBjaGFubmVsX2lkLCBiYXNlX2F0dHJpZCwgYXR0cl9jb3VudCwgMCwgMCwgMCk7Cj4gPiA+ICsK
PiA+ID4gKyAgICAgcHV0X2NwdSgpOwo+ID4gPiArICAgICByZXR1cm4gc2JpX2Vycl9tYXBfbGlu
dXhfZXJybm8oc3JldC5lcnJvcik7Cj4gPiA+ICt9CgouLi4KCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKG1jaGFuLT5ycG1pX2F0dHJzKSAvIHNpemVvZih1MzIpLAo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1MzIgKikmbWNoYW4tPnJwbWlfYXR0
cnMpOwo+ID4KPiA+IFdoeSBjYXN0aW5nPyBXaGF0IGFib3V0IGFsaWdubWVudD8KPiAKPiBUaGUg
UlBNSSBhdHRyaWJ1dGVzIChha2Egc3RydWN0IHNiaV9tcHh5X3JwbWlfY2hhbm5lbF9hdHRycykg
YXJlCj4gYSBjb2xsZWN0aW9uIG9mIHUzMiBhdHRyaWJ1dGVzIGhlbmNlIHdlIGNhbiBhbHNvIHRy
ZWF0IHJwbWlfYXR0cnMKPiBhcyBhIHUzMiBhcnJheS4gRnVydGhlciwgdGhlIHJwbWlfYXR0cnMg
aXMgWExFTiBhbGlnbmVkIHdpdGhpbiB0aGUKPiBzdHJ1Y3QgbXB4eV9tYm94X2NoYW5uZWwgc28g
bm8gYWxpZ25tZW50IGlzc3VlIHdpdGggdGhlIGNhc3RpbmcKPiBvbiBib3RoIFJWMzIgYW5kIFJW
NjQuCj4gCj4gSWYgd2Ugd2FudCB0byBhdm9pZCB0aGUgY2FzdGluZyB0aGVuIHdlIHdpbGwgaGF2
ZSB0byB1c2UgYSB0ZW1wb3JhcnkKPiB1MzIgYXJyYXkgcGx1cyBhZGRpdGlvbmFsIG1lbWNweSgp
LgoKT0suCgouLi4KCj4gPiA+ICsgICAgIGlmIChtYm94LT5tc2lfY291bnQpCj4gPgo+ID4gSXMg
dGhpcyBjaGVjayByZWFsbHkgbmVlZGVkPwo+IAo+IE1TSXMgYXJlIG9wdGlvbmFsIGZvciB0aGUg
U0JJIE1QWFkgbWFpbGJveCBzbyB3ZSBzaG91bGQgb25seSB1c2UKPiBwbGF0Zm9ybV9kZXZpY2Vf
bXNpX3h5eigpIEFQSXMgb25seSB3aGVuIE1TSXMgYXJlIGF2YWlsYWJsZS4KCj4gPiA+ICsgICAg
ICAgICAgICAgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNfYWxsKG1ib3gtPmRldik7CgpI
bW0uLi4gSSBhbSBub3Qgc3VyZSB3aHkuIERvIHlvdSBoYXZlIGFueSBPb3BzIG9yIHdhcm5pbmdz
IGlmIHRoZSBjaGVjawppcyBub3QgdGhlcmUgYW5kIG5vIE1TSSBwcm92aWRlZD8KCj4gPiA+ICt9
CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
