Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5CDC2D0CD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kuF2J5tNokxWBO5xJLaPKGrw112O+GlEsaETDWxZcA=; b=vhnlyJCYE60LCW
	aEeDyyULBmAwaBJ/Jrh1+HmA/Xk+DOcFLYQoSIwwJBAlcyN7ou4hgzj2QvqObNLrHlh/pGyNyxhWp
	fcjKVTeYfXxtvi37h5oJQ5MwBICjsSnM2KK/MYJxslay1udZch3Io8o7Veb+jvJ7FMgkpq17B4som
	8Wg3N+qvsyuThSNn9uaftbBrmHLWC0xNcvWc6wKB5osxVn4qE/Ozj6zQKBwMuPr1Tj5PIE7YecqS4
	NY8A+DWIZlQiF4+AkaBf+bXwb4jXR5h2cSKUG4SF+bL33VAb8pi+NyrRixQQjKABkl9KaWqMTxwBk
	IM5ymnRLqOfhKO5WCgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkNd-0000000G6Vi-0e6e;
	Wed, 21 May 2025 14:25:13 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkA8-0000000G3oL-1cW5
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 14:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747836677; x=1779372677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=apjPYqlsNolUKpGTQKj62mtZjwY4zQpEjSEbJumiJuY=;
  b=hPrNBiNAMwphEH5M0mwk3i8TA2RNCnsTmNFI7GEdCCTKt+TDu0Ig4n7C
   Bxjs+5yBYrHSSHv1Vl9ziAMJcv87xwXmF7f9HkWbDnqBK80KpIo/bCQTh
   4o052uehjhGGLnkJJHpMTEhA37r0NSeCigDCTWsfUn2O8j+LD7dOzCqfH
   /mi9r0muM9JaHYygE96CwANFZmrleWZqIirNXwPK4Gs37TPAQ290cdM0a
   9wpJNKQPt+4zx1a5wMnxkcF/gOpukdMcl1Hs+YPbo1VB7QGdFBz0pzALW
   GUlkrvvWJxbwQWwFX1iL+xZhaHQm5PLzSjH+GWQPn6Bdk+Z0YflgYX1XX
   A==;
X-CSE-ConnectionGUID: 3vXRZxC+QsaWAkTv76LZVQ==
X-CSE-MsgGUID: qcjLZKFLQM6vnjuQfADahw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60862280"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60862280"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:11:14 -0700
X-CSE-ConnectionGUID: 6U0vakLaRt+lIMk/VQo9uA==
X-CSE-MsgGUID: VAbYWIpDQzWHSTf1mcFaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144067842"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:11:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHk9w-00000003dxH-3Ck6;
	Wed, 21 May 2025 17:11:04 +0300
Date: Wed, 21 May 2025 17:11:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aC3e-IXYb68RoIyu@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com>
 <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
 <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_071116_495026_31D5A1EB 
X-CRM114-Status: GOOD (  13.33  )
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

T24gV2VkLCBNYXkgMjEsIDIwMjUgYXQgMDU6MDc6MDVQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAxMjoyMOKAr1BNIEFuZHkgU2hldmNoZW5rbwo+
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gT24gU3VuLCBN
YXkgMTEsIDIwMjUgYXQgMDc6MDk6MjlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKCi4uLgoK
PiA+ID4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4
L2JpdG9wcy5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+ID4gPiArI2luY2x1ZGUg
PGxpbnV4L2ludGVycnVwdC5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2lycWNoaXAuaD4KPiA+
ID4gKyNpbmNsdWRlIDxsaW51eC9tYWlsYm94X2NsaWVudC5oPgo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L21haWxib3gvcmlzY3YtcnBtaS1tZXNzYWdlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbXNpLmg+Cj4gPiA+ICsjaW5jbHVkZSA8
bGludXgvb2ZfaXJxLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcHJpbnRrLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgv
c21wLmg+Cj4gPgo+ID4gKyB0eXBlcy5oCj4gPgo+ID4gQWN0dWFsbHkgdGhpcyBvbmUgaXMgbW9z
dCBjbGVhbiwgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoZXMgd2hlcmUgdGhlIG5ldyBjb2RlCj4gPiBp
cyBpbnRyb2R1Y2VkIGhhcyBzZW1pLXJhbmRvbSBsaXN0IG9mIHRoZSBpbmNsdXNpb25zLCBwbGVh
c2UsIGZvbGxvdyB0aGUgSVdZVQo+ID4gcHJpbmNpcGxlLgo+IAo+IFN1cmUsIEkgd2lsbCBzaW1w
bGlmeSB0aGUgI2luY2x1ZGVzCgpPaCwgSVdZVSAoSW5jbHVkZSBXaGF0IFlvdSBVc2UpIGlzIG5v
dCBhYm91dCBzaW1wbGlmaWNhdGlvbi4gSXQncyBhYm91dApjb21wcmVoZW5zaW9uLiBJdCB1c3Vh
bGx5IG1lYW5zIHRoYXQgKm1vcmUqIGhlYWRlcnMgbmVlZCB0byBiZSBpbmNsdWRlZAphbmQgKm9u
bHkgc29tZSogb2YgdGhlIGV4aXN0aW5nIHdpbGwgYmUgZHJvcHBlZC4KCi0tIApXaXRoIEJlc3Qg
UmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
