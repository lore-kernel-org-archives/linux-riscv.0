Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F3DC54FB3
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RV7QNZDIdSqRxvWZ3Pg9Kzq+6uf1F/j3DGyHrpe2es=; b=4vjlvhUpdc94QX
	iCV2KdB4osU+n5xnhemKKxuQLwtU24Szehz0apIIP+UE6I8U/M4EKOLqgVEeeYsdVGSYpYvtd6QDf
	lAKB7eQgUcsGrQhdQNulUZdbQ07xWSIua9CBPOPXVhIXJENWAwG+RdP64fYStxuTb8rR9HNczeg2J
	NwzAQFaZpPDO+idXVzF2XhgcxI7WN2ECzfigrFsJ9UBmAAjodrkCbZRdHCSrNMjEL1wbtxqrdLEqs
	AS4vVnlnQzRutWAdXGDljWSaVTLcsFTu7J6nh7OnJpjts+IxnN0S2byZ1paL11o6Ogvel2+VlK5E1
	9ZX4xykSJOaKrOxS0vYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7K-00000004Whf-1LDk;
	Fri, 23 May 2025 17:23:34 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVMc-00000004Q5o-0xdi
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 16:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748018118; x=1779554118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+ql4+wMFVHmoFncJ5POu6pIQVoJkYP5u9JwCC9Ndcww=;
  b=TBeSr3STRgYKS0HzRu5TvDZJ4otGrZvi74rlidLtbuk6uhfIZzZr8IfK
   MEuy2KpHJsCEFZsWIjMdmvqBrZbcu4jc0CTleK3GbYlt+AohIz8dZ2Rvk
   kxZ931mTjI2MbMie6UggNv9Ecr0SC0ce0CrQqsc7Ey87gYx3ukGIjLuVF
   k1KKp1fHal+NX08uwh2ucUs+shtWvrjZUHTJvKoUHJS4osM2frrSrwGd2
   6GORRDlMEl3q0oSJyit0S9da5Zj4JluuVlCc63ZEeJDs4qlvOiiL2tPQ6
   9FmpzG+t6GCz1R204QFUflEEErfLPdn0Sq8JwhKbghkx+gYbHiNHUeHod
   Q==;
X-CSE-ConnectionGUID: 2h4KeLdbQ7uYn/rOYy0kLg==
X-CSE-MsgGUID: Sc2J2hZqTsigAlCPX4pJYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49334837"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="49334837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:35:15 -0700
X-CSE-ConnectionGUID: 1kq2cXoyS26GB4c60n4EDA==
X-CSE-MsgGUID: 8eOGJ7T/QkyBOIEo4kD2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="141706401"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:35:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uIVMP-000000006UP-2OH6;
	Fri, 23 May 2025 19:35:05 +0300
Date: Fri, 23 May 2025 19:35:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aDCjua9KiI96Q8Ht@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com>
 <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
 <CA+Oz1=aLgFSc+RG4=5B0ejUDRrjUh1xNYmHjJQd0sRUwjMBGiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Oz1=aLgFSc+RG4=5B0ejUDRrjUh1xNYmHjJQd0sRUwjMBGiw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_093518_282049_3441A173 
X-CRM114-Status: GOOD (  25.81  )
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

T24gVGh1LCBNYXkgMjIsIDIwMjUgYXQgMDY6NDQ6MDlQTSArMDUzMCwgUmFodWwgUGF0aGFrIHdy
b3RlOgo+IE9uIE1vbiwgTWF5IDEyLCAyMDI1IGF0IDEyOjM44oCvUE0gQW5keSBTaGV2Y2hlbmtv
Cj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBTdW4s
IE1heSAxMSwgMjAyNSBhdCAwNzowOToyNlBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgoKRmly
c3Qgb2YgYWxsLCByZW1vdmUgYWxsIHVubmVlZGVkIGNvbnRleHQgd2l0aCB3aGljaCB5b3UgYXJl
IGFncmVlLgpJIHNob3VsZCBub3QgY3Jhd2wgdGhyb3VnaCBkb3plbnMgb2YgbGluZXMgb2YgdGhl
IGVtYWlsIHRvIHNlZSB3aGF0CnlvdSB3YW50ZWQgdG8gZGlzY3Vzcy4gVGFrZSBpdCBhcyBldmVy
eWRheSBwcmFjdGljZSwgcGxlYXNlLgoKLi4uCgo+ID4gPiArICAgICAvKiBWYWxpZGF0ZSBSUE1J
IHNwZWNpZmljYXRpb24gdmVyc2lvbiAqLwo+ID4gPiArICAgICBycG1pX21ib3hfaW5pdF9nZXRf
YXR0cmlidXRlKCZtc2csIFJQTUlfTUJPWF9BVFRSX1NQRUNfVkVSU0lPTik7Cj4gPiA+ICsgICAg
IHJldCA9IHJwbWlfbWJveF9zZW5kX21lc3NhZ2UoY29udGV4dC0+Y2hhbiwgJm1zZyk7Cj4gPiA+
ICsgICAgIGlmIChyZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKGRldiwg
cmV0LCAiRmFpbGVkIHRvIGdldCBzcGVjIHZlcnNpb25cbiIpOwo+ID4gPiArICAgICAgICAgICAg
IGdvdG8gZmFpbF9mcmVlX2NoYW5uZWw7Cj4gPgo+ID4gVGhpcyBpcyBzaW1wbHkgd3JvbmcuIFlv
dSBzaG91bGQgbm90IGRvIGdvdG8gYmVmb3JlIGFueSBkZXZtXyooKSBjYWxscy4KPiA+IFRoZSBl
cnJvciBwYXRoIGFuZCAtPnJlbW92ZSgpLCBpZiBwcmVzZW50KSBpcyBicm9rZW4uIEZpeCBpdCBh
Y2NvcmRpbmdseS4KPiA+Cj4gPiBIZXJlIHNob3VsZCBiZQo+ID4KPiA+ICAgICAgICAgICAgICAg
ICByZXR1cm4gZGV2X2Vycl9wcm9iZSguLi4pOwo+ID4KPiA+IGl0J3MgeW91ciBob21ld29yayB0
byB1bmRlcnN0YW5kIGhvdyB0byBhY2hpZXZlIHRoYXQuIFBsZW50eSBvZiB0aGUgZXhhbXBsZXMg
aW4KPiA+IHRoZSBrZXJuZWwuCj4gCj4gU28gZmFyIEkgY291bGQgb25seSBmaW5kIGRyaXZlcnMg
d2l0aCAiZ290byB1c2VkIGJlZm9yZSBkZXZtXyoiIHBhdHRlcm4gdXNlZC4KCk9mIGNvdXJzZSwg
YmVjYXVzZSB0aGV5IGFyZSB3cm9uZyBhbmQgbW9zdCBvZiB0aGVtIG5lZWQgZml4aW5nLgooWWVz
LCB0aGVyZSBhcmUgc29tZSBleGNlcHRpb25hbCBjYXNlcywgYnV0IEkgZG9uJ3QgYmVsaWV2ZSBp
dCdzIG1hbnkpCgo+IENhbiB5b3UgcGxlYXNlIHBvaW50IG1lIHRvIHRoZSBleGFtcGxlIHdoaWNo
IGRvZXMgbm90IHVzZSBnb3RvIGJlZm9yZQo+IGRldm1fKiBhcGlzLgoKVG9ucyBvZiB0aGVtLCBh
bnkgd2hpY2ggc3RhcnRzIHdpdGggZGV2bV8qKCkgY2FsbCBpbiB0aGUgcHJvYmUsIG1vc3Qgb2Yg
dGhlCmRyaXZlcnMvaWlvLywgZm9yIGluc3RhbmNlLiBKdXN0IGEgcmFuZG9tIHBpY2sgaGVyZTog
ZHJpdmVycy9paW8vYWNjZWwvYm1hNDAwKi4KCihhbmQgRldJVyBpdCB3YXMgaW5kZWVkIHRoZSB2
ZXJ5IGZpcnN0IGRyaXZlciBJIHdhcyBsb29raW5nIGludG8gd2hpbGUgd3JpdGluZwogdGhpcyBl
bWFpbCkKCj4gQWxzbywgSSBjb3VsZG4ndCB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIHdoaWNoIG1h
eSBoYXBwZW4gYmVjYXVzZSBvZgo+IHRoaXMuIENhbiB5b3UgcGxlYXNlIGV4cGxhaW4/CgpkZXZt
XyooKSBkZWZlcnMgdGhlIHJlc291cmNlIGRlYWxsb2NhdGlvbiB0byB0aGUgZW5kIG9mIC0+cmVt
b3ZlKCkgYW5kIGVycm9yCnBhdGggaW4gLT5wcm9iZSgpLiBUaGlzIGJyZWFrcyB0aGUgc3ltbWV0
cnkgb2YgdGhlIGFsbG9jYXRpbmcgLyBkZWFsbG9jYXRpbmcKcmVzb3VyY2VzLiBBdCB3b3JzdCBj
YXNlIGl0IHdpbGwgYmUgYW4gT29wcyBvbiAtPnJlbW92ZSgpIG9yIHdoZW4gZXJyb3IgaGFwcGVu
cwpkdXJpbmcgdGhlIC0+cHJvYmUoKS4KCi4uLgoKTXkgZ29zaCwgdGhlIG9yaWdpbmFsIHRleHQg
d2FzIHF1b3RlZCB0d2ljZSEgTmV4dCB0aW1lIEkgd29uJ3QgZXZlbiBsb29rIGludG8KdGhlIGVt
YWlsIHJlcGx5IHdoaWNoIHdvbid0IGhhdmUgYSByZWR1Y2VkIGNvbnRleHQuCgotLSAKV2l0aCBC
ZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
