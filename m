Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D444C7113C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4kAlHl1ILHa5vR4X8mBzf+H26FCaFDgCpRi+B4eiwM=; b=R/QFG98iqTEdXR
	u77yye6EmDHecvjqn2ds0FsmemG4q3VJQX0FxjwpWCKmoloV3jpv25oIKO8qZT0gJ/bDtUxOgurq6
	xdUWzFaz6vBgH+mg6eOEg2gPGlaLPFISCDLvDhozfajFvCBNAi1krd+TQuKJsTqun+nFutwmpBbRb
	ezomvH6IBhBez7WaWKCBcQtOpco1radnCkIjzYogn1xzQbnGHhH+PY64uuiKS1JWARBfJySka+Yu3
	02/6bKmfrc2v6vTBGuQApAUcRYBQrULeNDHQSeCBWwkeUR+VHkuw/fDcqaRKcXT5hJ865CEy+S7zY
	vL6QowLomMtkiquSo5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwex-00000006Y4h-0h6N;
	Tue, 10 Jun 2025 10:56:51 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvhy-00000006Py2-1QM2
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 09:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549354; x=1781085354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4qI7m/FiLSi8MTV953n9ML6PMwZQ9rp4zePGb84alio=;
  b=m6N15wVCRrVgFH4ZiZAQ7XA/kqgb6gwq/z6SytuYWRzjS1Zgeel9xawU
   IrBCTgKsO4bz2DPlwUQ80y65tN0wmacwDpTBNVyi44U7i4KrzRFOBIKr1
   SpM4ZikoTtIvTAibInEYZIyyQiiATIg37WndfTlb5WguZ3H45PKydAOjJ
   M5bKFE6roKReK3Cxu+kxFOWqpa6LXjunBjMj18AJR1X0sMrNNKftgQqb/
   sHVIobSNLfXoo3+UOPSKP8NLXCk0sqL70G+J5W+Ra+va7JiMelA9CHoRk
   I6GqUGW5VSoEWe51g30fxJQJp0JIYXEeamkyCNLAUKCcNe7vKziIFJ2GY
   w==;
X-CSE-ConnectionGUID: Q9i4s+hkQLS1bYZ5iQ0JnQ==
X-CSE-MsgGUID: dT8tg4YIQlupx0XCwanqJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51639946"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51639946"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:55:49 -0700
X-CSE-ConnectionGUID: W+qxXQ1qRAqkZlXrBUzizg==
X-CSE-MsgGUID: bQSff4A1RU6QeO3HCG2aoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146698329"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:55:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOvhj-00000005JXP-0mpg;
	Tue, 10 Jun 2025 12:55:39 +0300
Date: Tue, 10 Jun 2025 12:55:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aEgBGup553Pki98e@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
 <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
 <aEc-SHvL187xdj-m@smile.fi.intel.com>
 <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_025554_457310_7D1EB363 
X-CRM114-Status: GOOD (  23.68  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMTA6MDU6MjdBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIEp1biAxMCwgMjAyNSBhdCAxOjM04oCvQU0gQW5keSBTaGV2Y2hlbmtvCj4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBNb24sIEp1
biAwOSwgMjAyNSBhdCAwNTo1OTo0MFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiBP
biBXZWQsIE1heSAyOCwgMjAyNSBhdCA0OjIz4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+IDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFN1biwg
TWF5IDI1LCAyMDI1IGF0IDAyOjE2OjU0UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6CgouLi4K
Cj4gPiA+ID4gPiArICAgICBpZiAobWJveC0+bXNpX2NvdW50KQo+ID4gPiA+Cj4gPiA+ID4gSXMg
dGhpcyBjaGVjayByZWFsbHkgbmVlZGVkPwo+ID4gPgo+ID4gPiBNU0lzIGFyZSBvcHRpb25hbCBm
b3IgdGhlIFNCSSBNUFhZIG1haWxib3ggc28gd2Ugc2hvdWxkIG9ubHkgdXNlCj4gPiA+IHBsYXRm
b3JtX2RldmljZV9tc2lfeHl6KCkgQVBJcyBvbmx5IHdoZW4gTVNJcyBhcmUgYXZhaWxhYmxlLgo+
ID4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNf
YWxsKG1ib3gtPmRldik7Cj4gPgo+ID4gSG1tLi4uIEkgYW0gbm90IHN1cmUgd2h5LiBEbyB5b3Ug
aGF2ZSBhbnkgT29wcyBvciB3YXJuaW5ncyBpZiB0aGUgY2hlY2sKPiA+IGlzIG5vdCB0aGVyZSBh
bmQgbm8gTVNJIHByb3ZpZGVkPwo+IAo+IFdlIGRvbid0IHNlZSBhbnkgb29wcyBvciB3YXJuaW5n
cy4gVGhpcyBjaGVjayBpcyB0byBhdm9pZCB1bm5lY2Vzc2FyeQo+IHdvcmsgKHN1Y2ggYXMgYWNx
dWlyaW5nIGxvY2ssIGNoZWNraW5nIGRlZmF1bHQgZG9tYWluLCBldGMpIGluIHRoZQo+IG1zaV9k
b21haW5fZnJlZV9pcnFzX2FsbCgpIGNhbGxlZCBieSBwbGF0Zm9ybV9kZXZpY2VfbXNpX2ZyZWVf
aXJxc19hbGwoKS4KPiAKPiBJIGRvbid0IG1pbmQgZHJvcHBpbmcgdGhlIGNoZWNrIHNvIEkgd2ls
bCB1cGRhdGUgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpQZXJoYXBzIHlvdSBjYW4gcmF0aGVyIGFk
ZCB0aGlzIGNoZWNrIGludG8gdGhlIGNhbGxlZT8gU2VlbXMgdG8gbWUgdGhhdAp5b3UgaGF2ZSBh
IGp1c3RpZmljYXRpb24gZm9yIGl0LiBVc3VhbCBwYXR0ZXJuIGluIHRoZSBrZXJuZWwgdGhhdCBm
cmVlaW5nCnJlc291cmNlcyBzaG91bGQgYmUgYXdhcmUgb2YgdGhlIE5VTEwgcG9pbnRlcnMgb3Ig
b3B0aW9uYWwgcmVzb3VyY2VzCnNvIHdlIG1heSBjYWxsIGl0IHVuY29uZGl0aW9uYWxseSBmcm9t
IHRoZSB1c2VyKHMpLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
