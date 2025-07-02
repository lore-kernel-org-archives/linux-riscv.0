Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8E5C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NT6x9fexzLUAcppwtLERyzsFbraRMhSUbcmnm7VBkqw=; b=Hx7aQPWneila7J
	hLMpmCptfd7kn84WshKfDBk6Rn8HJEALHCmSnWcZ86mG8KbYkouvCSpTx4n6lH1IoyhC+5+dl39+/
	ZUNsXdOMGPNmuDoxrbduA7mNDFUl2hVtIJZd8tvxa5x99HxHzdifGD/DX8TGBnxvrPztHq3UEjcJN
	YFHoiZb96aKhfCuT/g4e8SYuDVbzv1/oF4eiUh2UEms33MkH73nOqUDBd9+7OSVHierT7kmWLlFlh
	QUE86jjwdW0EVwmcuxLRsoZFxLb6T0RABnsPiJ1ASenPuT/ABxQsj3h3nf1lJMx19CM7qdy+BNHLJ
	g22pAyeajzQk8ABFyOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy6H-00000008ZZL-2Hrv;
	Wed, 02 Jul 2025 14:06:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWx1M-00000008NRA-3Ry4
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Jul 2025 12:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q9DYzp0L6H5ExQxYi8Nrspzh1pluzAgU9TTqpo7nuEc=; b=adsM+JLqrLeDCaD4EKxmfB2mtn
	y6Ocums/X25NxvOhfrEmAf4c18TUhZKH5SBCXuFlaJfKrNpRqltmIp8JK5NPWDUjl99Fe8Kks1KjE
	1dGIiaRsjKrV57hXwQUWBG4CdOH5CUoEbvdQl2yEjMOONQoQ/wR9ypBXYQc4DzzduIZ7HzMHxJHCn
	cQkDPwvQ+GXCU8jzx3aEcEx1MX4UEesWQkzs6VwgOKMOYCjSg04Gpc2TPS0RhMMpxVyB5MSH/TvWi
	rU69Z20dUQaGrTXr8X+BgeMyiz96EhvPcWqW7Nc55ybjZw+NiqgU3cEWjhzQl7zzh65oMRHwOdo2R
	Y7xsNyJg==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWx1J-00000007NgJ-2Iy0
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751461021; x=1782997021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=87AuNJuW+2yV1B9Zb2+kKYqb3dCQ3S9+ENTr/v9ygw8=;
  b=bAcNUXU8c0UutSDtZHPpxEgghE8Ivk5mzeNJebRBmmTyXlAapkXRMDTV
   CWKyBsYrozzFEhf6i9GKR+bEPn5yIV9dAsmE0EsxOveb9sbaE8YSwMlc5
   lgN8yD+qpsCnvrkHDlakUi8i5A6sTxLDMM+x7PIUhBQy1A6ETw7KHGvo6
   4X0/pjYbJ3b0ty90M4oxVBhVGp1wftVM0G+6XOP1chD4MkjnaKiKxol/V
   55vAsmMwAwBl8edSMMdiASTmo2pi1CDjME1chtFDlWp1875fC/qLF6kkw
   p+BUXMBmOu1x1P2zVXLquz4egZVM+xbSZBG67mTnSG6qyRTRfnwuiVPrU
   w==;
X-CSE-ConnectionGUID: cn9wKZ75TuG2HwNelWrDbg==
X-CSE-MsgGUID: h3s99CI7SaqnGsfRvGODbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79193527"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79193527"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:56:46 -0700
X-CSE-ConnectionGUID: k5aMYtXJR2qEFNakZQpjgw==
X-CSE-MsgGUID: aq3oM6NuTeeQ7eQWflv3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158331640"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:56:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWx0t-0000000BvFQ-3atU;
	Wed, 02 Jul 2025 15:56:35 +0300
Date: Wed, 2 Jul 2025 15:56:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGUsg121lenWHL-w@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
 <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
 <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_135701_985192_6DCB0E87 
X-CRM114-Status: GOOD (  23.17  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMDI6Mzk6MzBQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCAxOjM44oCvUE0gQW5keSBTaGV2Y2hl
bmtvCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBX
ZWQsIEp1bCAwMiwgMjAyNSBhdCAxMjoyMDo1NVBNICswMjAwLCBSYWZhZWwgSi4gV3lzb2NraSB3
cm90ZToKPiA+ID4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE24oCvQU0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgoKLi4uCgo+ID4gPiA+ICBzdGF0aWMgaW50
IGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2VfYXJncyhjb25zdCBzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqZndub2RlLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGNoYXIgKnByb3BuYW1lLCBjb25zdCBjaGFyICpuYXJnc19wcm9wLAo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBh
cmdzX2NvdW50LCB1bnNpZ25lZCBpbnQgaW5kZXgsCj4gPgo+ID4gPiA+ICAgICAgICAgY29uc3Qg
c3RydWN0IGFjcGlfZGV2aWNlX2RhdGEgKmRhdGE7Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqcmVmX2Z3bm9kZTsKPiA+ID4gPiAgICAgICAgIHN0cnVjdCBhY3BpX2Rldmlj
ZSAqZGV2aWNlOwo+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgaW50IG5hcmdzX2NvdW50Owo+ID4g
PiA+ICAgICAgICAgaW50IHJldCwgaWR4ID0gMDsKPiA+Cj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbmFyZ3NfY291bnQgPSBhY3BpX2Z3bm9kZV9nZXRfYXJnc19jb3VudChkZXZpY2Us
IG5hcmdzX3Byb3ApOwo+ID4gPgo+ID4gPiBJIHRoaW5rIGl0IHNob3VsZCB3b3JrIHRoZSBzYW1l
IHdheSBhcyBpdCB1c2VkIHRvIGZvciB0aGUgY2FsbGVycyB0aGF0Cj4gPiA+IHBhc3MgYXJnc19j
b3VudCwgc28gbWF5YmUKPiA+ID4KPiA+ID4gaWYgKCFhcmdzX2NvdW50KQo+ID4gPiAgICAgICAg
IGFyZ3NfY291bnQgPSBhY3BpX2Z3bm9kZV9nZXRfYXJnc19jb3VudChkZXZpY2UsIG5hcmdzX3By
b3ApOwo+ID4KPiA+IEJ1dCB0aGlzIGlzIGRpZmZlcmVudCB2YXJpYWJsZS4KPiAKPiBPZiBjb3Vy
c2UgaXQgaXMgZGlmZmVyZW50LiAgSXQgaXMgYW4gYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9h
cmdzKCkgcGFyYW1ldGVyLgo+IAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGVsZW1l
bnQrKzsKPiA+ID4gPiAtCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gYWNw
aV9nZXRfcmVmX2FyZ3MoaWR4ID09IGluZGV4ID8gYXJncyA6IE5VTEwsCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWNwaV9md25vZGVfaGFu
ZGxlKGRldmljZSksCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwgYXJnc19jb3VudCk7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwKPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuYXJn
c19jb3VudCA/IG5hcmdzX2NvdW50IDogYXJnc19jb3VudCk7Cj4gPiA+Cj4gPiA+IEFuZCB0aGlz
IGNoYW5nZSB3b3VsZCBub3QgYmUgbmVjZXNzYXJ5Pwo+ID4KPiA+IFRoaXMgaXMgbm90IHRoZSBz
YW1lIGNoZWNrIGFzIHByb3Bvc2VkIGFib3ZlLgo+IAo+IE5vLCBpdCBpcyBub3QuCj4gCj4gSXQg
anVzdCBtYWtlcyB0aGUgZnVuY3Rpb24gd29yayB0aGUgc2FtZSB3YXkgaXQgZGlkIGJlZm9yZSB0
aGUgY2hhbmdlCj4gZm9yIHRoZSBjYWxsZXJzIHdobyBwYXNzZWQgbm96ZXJvIGFyZ3NfY291bnQg
YW5kIHNvIHRoZXkgbWlnaHQgYmUKPiBmb3JnaXZlbiBleHBlY3RpbmcgdGhhdCBpdCB3b3VsZCBi
ZSB0YWtlbiBpbnRvIGFjY291bnQuCgpJIHNlZSB5b3VyIHBvaW50IG5vdy4gQnV0IGRvIHdlIGhh
dmUgc3VjaCBhIHVzZXI/IEkgZHVubm8uCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hl
dmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
