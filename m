Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CA7C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S67ZX34vFfIsWPWdxDrGNYylJwmEcjreg3IgUe5v+AM=; b=g/DXhyafs6hpos
	3E0NKXeRNoHx3/dsLF5yuIKErHDGREkoX2o2c93ahY/xi+Ho2WfK+aQAdkKGmU0mdTtmlRIdXQITO
	d6TSPM4ZGIUxWrInuvJmZcjSWajTFCA1XJP16t4p1QutWSA1m/FtTstXxlR24OKz/OYBV/4M2LcHq
	Mx1IXotwax0hvLLjDxhdaDYCwKCPF4nWB/dNUFtbWRxEuVE3G/3EC0ge6bVbgeYAKlATESqEi0+nj
	Tryhls+qsbK5/ifYTW98OcYeQUMujCF9GnpGKwOp0oxuSZOBdIscUrKwKrluQDdL0jnKbQol2BG2z
	9/Ejg0qlDV/Bevo3e3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwL-00000009HxI-1Twa;
	Wed, 11 Jun 2025 08:36:09 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGle-00000009GFC-1P0T
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749630306; x=1781166306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q+9KzBFgMxlH3wVoWy5ulc7FYJUMsWouhRYi24kW+mE=;
  b=mVQLCABHrc7u1flu4PkcihCfxLbrrtvhqx2HUbvaBPHYElHTd7XYGgSw
   QvF+uoZ3/vDTwl2DBCd78MblyqmJZ8RK3FHWiCOnecRZtA4dU0NuoUyXH
   arCP83rLrB7c5A9MPY3mSY/eMNsqps7EMQXrDfCWlV58YbmEt6nNTjF/R
   Ye3fryF0Awc5DZP66BchEWgNJ68pjmAkwJEkQGOUpwnyW7Po6OaYQeQzf
   cxolN9zTJ0NiOaNHkDtHV+fmwaubEwq4aEQeK95AZ/8Osxuev3grwKcvC
   3R6wbCGAVfTlVnwhkD7P/gf/TK1RUes86O80zO50zBy422vbnhD+ADJ8Q
   Q==;
X-CSE-ConnectionGUID: WywRtaNSRi6QbE/+RqmItQ==
X-CSE-MsgGUID: 6lR1sN5UT5+gr8j8EwoQ+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="54393247"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="54393247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:25:06 -0700
X-CSE-ConnectionGUID: kcHoIWDfS5qiqKqUef/d9A==
X-CSE-MsgGUID: CGqt+bAeQ2m89Ini1HA5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178036550"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:22:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGj2-00000005aES-435h;
	Wed, 11 Jun 2025 11:22:24 +0300
Date: Wed, 11 Jun 2025 11:22:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aEk8wNtMT6azM_30@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-14-apatel@ventanamicro.com>
 <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
 <CAK9=C2VYCSkMV5zoyVEKHTY30Y0KpUr_M8FELm37M8=WYi+4HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VYCSkMV5zoyVEKHTY30Y0KpUr_M8FELm37M8=WYi+4HQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012506_398280_0EF3A784 
X-CRM114-Status: GOOD (  12.70  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMDQ6MzM6NDZQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCA1OjAz4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBTdW4sIE1h
eSAyNSwgMjAyNSBhdCAwMjoxNzowMFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgoKLi4uCgo+
ID4gPiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4KPiA+IFBlcmhhcHMgSSBtaXNzZWQg
c29tZXRoaW5nLCBidXQgZGV2bV9remFsbG9jKCkgaXMgaW4gZGV2aWNlL2RldnJlcy5oLiBEbyB5
b3UKPiA+IG5lZWQgaXQgZm9yIHNvbWV0aGluZyBlbHNlPwo+IAo+IGRldl9nZXRfbXNpX2RvbWFp
bigpIGlzIHBhcnQgb2YgbGludXgvZGV2aWNlLmggaGVuY2UgaXQgc2hvdWxkCj4gYmUgaW5jbHVk
ZWQuCgpBaCwgdGhhdCdzIHdoYXQgSSBtaXNzZWQuIFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0LgoK
LS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
