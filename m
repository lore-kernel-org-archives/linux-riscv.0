Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4C3C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9wS+AYQKtJe8YIGcNlPrXvtJV1W7CrpsU2X/JE7UoU=; b=HCdjP9zh68S0Ra
	DJ6P3YkG7iGQMvdjqdct9nxmKTwlkXS8jJbEv2tNdv3HL+Pw348x1LOto18n/ZYsu41TJiTAW/S8J
	oMQgr8rf2kGIodFfRQhHy3G8D+JTvilyyMJwupmYxQAXdUoYCnqvAdVzbTCYu5AKUJmrFgOG85CkQ
	+6quZn22xU06YTM8U5daw+da2/n9KtX0j5vUuZhNMsyRiK6hA5no7erH3Cm3OGxfhxztuv+o2XMF2
	LDw0YqN6MgO3S0Ko2TZRWgXUDcGd1LiutFAg+cUMfo7iGZURkyy9vxFbaB/yW3VrObw6rn9BttMKB
	8WY4AulKswq38d7EThTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUGd-00000009kj3-2fAZ;
	Mon, 12 May 2025 14:36:31 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETw5-00000009gl6-0v6P
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 14:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747059317; x=1778595317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dfONP3e4U/F57uoCSRBd9jnVS+K1EGl3ODa9VLH9Bw8=;
  b=hkpfli22xJTI32JMpZ7aR6y/53tNgKrVLkClYxrMdwIEtXlEwLCD6zAZ
   X8ZHbrVLGmNxIkCthk6apDPEXXpX45TWKIaebQ+H8TPx+/pRfvbIq/PC1
   oyPcvFdtBokSjYm4tBVhHxjCHhhTFZXyCH2oJHCfQLd3nUPIQGkX/UXx3
   HUJUqiyv1mJsI/tHgjalQxXzt4wcHnNH5eQfYsfhE8MdYBjv9cW5q7vyF
   tObbXg1pxrNbUY0h1bwNSRD2IgAFmKLAg3OtiO5XoXF32awTjNR0Xq8v/
   nCDfbx8atVae/NTgAV/ndPYqF6ls4iiqoYTqbklRfIzv/f1BTjWkw7b6w
   w==;
X-CSE-ConnectionGUID: MX4UHYr+RjKfVpZuzwiT6g==
X-CSE-MsgGUID: E/C9s5BOSQa93bFPpX1o+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60201654"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="60201654"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:15:13 -0700
X-CSE-ConnectionGUID: pf3t37W5TEeqZTmIlLtlPg==
X-CSE-MsgGUID: jA0dgYZaQvCt5C0vvV/qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142324184"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:15:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uETvr-00000000vxo-21U5;
	Mon, 12 May 2025 17:15:03 +0300
Date: Mon, 12 May 2025 17:15:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aCICZxMT6Y7k7Kz1@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com>
 <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
 <CA+Oz1=ZXJOrXT28V+MVSmvh-4ddnwZ8hJAFzB6tmNbcohLMT=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Oz1=ZXJOrXT28V+MVSmvh-4ddnwZ8hJAFzB6tmNbcohLMT=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_071517_272197_3395204D 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, rahul@summations.net, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMDM6Mjg6MzdQTSArMDUzMCwgUmFodWwgUGF0aGFrIHdy
b3RlOgo+IE9uIE1vbiwgTWF5IDEyLCAyMDI1IGF0IDEyOjM44oCvUE0gQW5keSBTaGV2Y2hlbmtv
Cj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBTdW4s
IE1heSAxMSwgMjAyNSBhdCAwNzowOToyNlBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgoKLi4u
Cgo+ID4gPiArc3RydWN0IHJwbWlfZ2V0X3N1cHBfcmF0ZXNfcnggewo+ID4gPiArICAgICB1MzIg
c3RhdHVzOwo+ID4gPiArICAgICB1MzIgZmxhZ3M7Cj4gPiA+ICsgICAgIHUzMiByZW1haW5pbmc7
Cj4gPiA+ICsgICAgIHUzMiByZXR1cm5lZDsKPiA+ID4gKyAgICAgdTMyIHJhdGVzW107Cj4gPiA+
ICt9Owo+ID4KPiA+IElzIGl0IEFCST8gKEkgbWVhbiBpZiB0aGlzIGlzIGludGVyZmFjZSB3aXRo
IHNvbWUga2luZCBvZiBGVykKPiA+IElmIHNvLCBVc2UgcHJvcGVyIGVuZGlhbmVzcyBhd2FyZSB0
eXBlcy4gU2FtZSBRIGZvciBhbGwgZGF0YQo+ID4gdHlwZXMgZGVmaW5lZCBpbiB0aGlzIGRyaXZl
ci4KPiAKPiBTdXJlLgo+IAo+IEl0J3MgdGhlIG1lc3NhZ2UgZm9ybWF0IGRlZmluZWQgYnkgdGhl
IFJJU0MtViBSUE1JIHNwZWMuCgpTbywgdXNlIHRoZSBlbmRpYW5lc3MgYXMgcHJvdmlkZWQuIE9y
IGlzIGl0IGFsd2F5cyBuYXRpdmUgZW5kaWFuZXNzPwoKLi4uCgo+ID4gPiArICAgICBkZXZtX2tm
cmVlKGNvbnRleHQtPmRldiwgcngpOwo+ID4KPiA+IFdoeT8hIFRoaXMgaXMgYSByZWQgZmxhZyB0
byBwb2ludCB0aGF0IGhlcmUgaXMgbWlzdW5kZXJzdGFuZGluZyBvciBhYnVzZSBvZgo+ID4gbWFu
YWdlZCByZXNvdXJjZXMgYXBwcm9hY2guIEVpdGhlciB1c2UgX19GcmVlKCkgZnJvbSBjbGVhbnVw
Lmggb3IgZG9uJ3QgY2FsbAo+ID4gZGV2bV9rZnJlZSgpLiBUaGUgbGF0dGVyIG11c3QgaGF2ZSBh
IHZlcnkgZ29vZCBqdXN0aWZpY2F0aW9uIHRvIGV4cGxhaW4gd2h5Lgo+IAo+IFllYWgsIEkgdGhp
bmsgaXQncyBiZXR0ZXIgdG8gdXNlIGt6YWxsb2MgZm9yIHRoaXMgY2FzZSBhbmQgdGhlbiBmcmVl
IGl0LgoKSW5zdGVhZCBvZiBmcmVlaW5nIGl0IGV4cGxpY2l0bHkgY29uc2lkZXIgdXNpbmcgY2xl
YW51cC5oLCBpLmUuIF9fZnJlZSgpLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZj
aGVua28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
