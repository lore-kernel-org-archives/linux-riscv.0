Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993C2C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tApixSBaDrkgPknY4xanAIFaZgH3iy8azyqR+X4iCeo=; b=eKyv/sFjRjAflb
	pofkLeMkXJrRfEU9efaF/SAU3rwnjUQF1Hdc1OT9HK1ro4Oc3g/vSEf9YcjYMZjmQi7+UDc3KQ+bA
	qNBqGqLKWNth4nHhzhdoqWbCmy7foT0STPllhwrVItLbtdCTGVf4EQl5ahcps5ySowJqBWwA9UITE
	BEwc7DUYwwcEGazaQqwugRhSqN2j3g59yHDV8dFFF3j3zd3lXz03qsi7/iFdzjQEnWqmTkpCQoOPq
	od9aUYERT3YtVLY671J9iYiConSuiIRkBJhT0H43t+dA3T9V34Ue5srsmVBmsrio3Qt5Gl3hbFwZz
	8ZGn2Vt0hvx1CJ9S+lBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOifA-000000056Jz-2Hxk;
	Mon, 09 Jun 2025 20:00:08 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiYz-000000055SO-12wt
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 19:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749498826; x=1781034826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z61vb05yKjlD/LY/gFG3tUG593iO/oPz3v/J5LDaeyk=;
  b=Hxka7Vcw2Fk0vdXcImUmaWKSCqTTUUnVzPbMAkex/DcuSrMAu2p14Zkg
   tfcjFNa8KFhdpwLbH2+9fz4JgBI2V0NHTDJYAeQKQg4AJ7z8cVyeoAmUs
   w7QINbLT4D40nfq+drBKVVvhoYMviBphpfu/xMnD/3IAKVM2FRIpnDd5r
   BOYzx8+dM6urSOhSrVrrzNyK6OjuuswYyqJGeFAyD9oN25THAS63M/XtS
   Po9SPV+uB+3Xa0Cs4ckN97eFdZBhdW30kBYzBxp+7qxo1wDa10kukWLPl
   mwAdkB5s4OTdmBKAolzqtKWqkEDi1Q9orjoNqp6IllA0JHAhDEhptn+fY
   w==;
X-CSE-ConnectionGUID: fzkCOyF8RDiz12yJtxPGRA==
X-CSE-MsgGUID: E0F0o9uxShOI6S3nNd9pFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69035408"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="69035408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:53:45 -0700
X-CSE-ConnectionGUID: 86ZvYcmhTumsX1SJHoxbCA==
X-CSE-MsgGUID: J/583IboSVW9+nxntMhqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169789539"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:53:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOiYp-000000059Ff-0Jqe;
	Mon, 09 Jun 2025 22:53:35 +0300
Date: Mon, 9 Jun 2025 22:53:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 06/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aEc7vogHjBKP1anJ@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-7-apatel@ventanamicro.com>
 <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
 <CAK9=C2XbNeZRp9h4FevVBm-NdPH3w5t=C1NhAn5WQAkNLK9d_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XbNeZRp9h4FevVBm-NdPH3w5t=C1NhAn5WQAkNLK9d_A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_125345_339117_63DA9095 
X-CRM114-Status: GOOD (  13.20  )
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

T24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDI6NDA6MzJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCA1OjEx4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBTdW4sIE1h
eSAyNSwgMjAyNSBhdCAwMjoxNjo1M1BNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgoKLi4uCgo+
ID4gPiAgc3RydWN0IG1ib3hfY2hhbiAqbWJveF9yZXF1ZXN0X2NoYW5uZWwoc3RydWN0IG1ib3hf
Y2xpZW50ICpjbCwgaW50IGluZGV4KQo+ID4gPiAgewo+ID4gPiArICAgICBzdHJ1Y3QgZndub2Rl
X3JlZmVyZW5jZV9hcmdzIGZ3c3BlYzsKPiA+Cj4gPiArIHByb3BlcnR5LmggKGlmIG5vdCBkb25l
IHlldCkKPiAKPiBUaGlzIG5lZWRzIGZ3bm9kZS5oCgpObywgaXQgbmVlZHMgcHJvcGVydHkuaC4g
UGxlYXNlLCByZWFkIHRoZSBub3RlIGF0IHRoZSB0b3Agb2YgZndub2RlLmggd2h5LgoKLi4uCgo+
ID4gPiAtICAgICBpbnQgcmV0Owo+ID4gPiArICAgICBpbnQgaSwgcmV0Owo+ID4KPiA+IFdoeSBp
cyAnaScgc2lnbmVkPwo+IAo+IE5vIHBhcnRpY3VsYXIgcmVhc29uIGJlY2F1c2UgJ2knIGlzIG5v
dCBiZWluZyBhc3NpZ25lZCBhIG5lZ2F0aXZlCj4+ICB2YWx1ZSBzbyBib3RoIHNpZ25lZCBhbmQg
dW5zaWduZWQgd2lsbCB3b3JrIGZpbmUuCgpCZXNpZGVzLCBzcGxpdHRpbmcgd2lsbCBtYWtlIGl0
IGVhc2llciB0byBjaGVjayBhbmQgd29yayBvbiBhcyBiZWluZyBsZXNzCmludHJ1c2l2ZSBjaGFu
Z2UuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
