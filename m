Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0AAC83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfuC7lrMhKL6xWCfMz545KUv2165hZNBP20zqpbPDkA=; b=n5+OpgN3oRtEFQ
	ESwaNjehyZUIkMNMmonhDTQRxk1nl7BN7eW37Wu4H4Da3E9g4/XLm/3wppBKLP1c+RsqZYNRz6JD8
	mPv/bHvw0wfvNkhQyspkw7EE1j6ZIqLqIQ/6KhzNxjZBo72YcXYH42ZmTJavybFzjswUIS8CoqnTJ
	T5t3Qx4qeUTPcN9RvJpgjWEzf3drhsKYKhtu5q9/OWe8N76cy59yEtb4NiFNZ/lKaqKyZKQS/X1Va
	IhqWukfNtB+hbOOxsuRSgwlS8nd1uFSQccaJEryVIT0hwxIoiGH3WmZJmv2VgG8dZML+oC1KVRxoO
	D8VW6SQfyPgrCVVDN7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwVC-00000008ImL-2Oj0;
	Wed, 02 Jul 2025 12:23:50 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvoK-00000008A3T-1gGW
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751456372; x=1782992372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=v6saksW8Caqa3y5KRNV+vSZS7ie/jhuoui51AlwXf7k=;
  b=i12nkX6KePKsTzSyCbJg7mcAKzn4I7HwVXH1Q+pX2ZLor97N2rDK1JlI
   625fUfGZt5BeSReeNCoL8z3MxGb5deHdDUwtYRvJDBoBYTfrBcZIvEjtx
   cjxlQMPHDBTZHuEHmFPQMSh86SfcdWNRgwy5oxeens3O11QS5/OlSzYwL
   Aum2x7D9LPHaES6PEWKuRCtEZWx9VlpplJWlVNpCCywC6oW0llFj5ybpI
   pT5vfwp8RBGDkpqOQD4s05+yD/21+uJmCaHSRivHW/rD2oEcVLxlYh99H
   GzipJxDo9CSSe9tk60Ugt4caTj0/KiI0iDb5rYkU5F8tT45XXQs8kRVEh
   w==;
X-CSE-ConnectionGUID: cTrS06ECRUCjlElHCDnPrQ==
X-CSE-MsgGUID: mZwh9KgRSL6fLg7DoubctQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53839540"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53839540"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:39:30 -0700
X-CSE-ConnectionGUID: mlpi9m3FSByAEgGF4mUwsw==
X-CSE-MsgGUID: kJgdkV2/ROyIIrCgnKDzDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="184998772"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:39:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWvo8-0000000BuBI-3Jry;
	Wed, 02 Jul 2025 14:39:20 +0300
Date: Wed, 2 Jul 2025 14:39:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGUaaOQaya-SaasR@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
 <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043932_455895_2722D6BA 
X-CRM114-Status: GOOD (  23.99  )
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

T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMDI6Mzc6NThQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDAyLCAyMDI1IGF0IDEyOjIwOjU1UE0gKzAyMDAsIFJhZmFl
bCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE24oCvQU0g
QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgoKLi4uCgo+ID4gPiAg
c3RhdGljIGludCBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoY29uc3Qgc3RydWN0IGZ3
bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcG5hbWUsIGNvbnN0IGNoYXIgKm5hcmdzX3Byb3As
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBhcmdzX2NvdW50LCB1bnNpZ25lZCBpbnQgaW5kZXgsCj4gCj4gPiA+ICAgICAgICAgY29u
c3Qgc3RydWN0IGFjcGlfZGV2aWNlX2RhdGEgKmRhdGE7Cj4gPiA+ICAgICAgICAgc3RydWN0IGZ3
bm9kZV9oYW5kbGUgKnJlZl9md25vZGU7Cj4gPiA+ICAgICAgICAgc3RydWN0IGFjcGlfZGV2aWNl
ICpkZXZpY2U7Cj4gPiA+ICsgICAgICAgdW5zaWduZWQgaW50IG5hcmdzX2NvdW50Owo+ID4gPiAg
ICAgICAgIGludCByZXQsIGlkeCA9IDA7Cj4gCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IG5hcmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19w
cm9wKTsKPiA+IAo+ID4gSSB0aGluayBpdCBzaG91bGQgd29yayB0aGUgc2FtZSB3YXkgYXMgaXQg
dXNlZCB0byBmb3IgdGhlIGNhbGxlcnMgdGhhdAo+ID4gcGFzcyBhcmdzX2NvdW50LCBzbyBtYXli
ZQo+ID4gCj4gPiBpZiAoIWFyZ3NfY291bnQpCj4gPiAgICAgICAgIGFyZ3NfY291bnQgPSBhY3Bp
X2Z3bm9kZV9nZXRfYXJnc19jb3VudChkZXZpY2UsIG5hcmdzX3Byb3ApOwo+IAo+IEJ1dCB0aGlz
IGlzIGRpZmZlcmVudCB2YXJpYWJsZS4KPiAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ZWxlbWVudCsrOwo+ID4gPiAtCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGFj
cGlfZ2V0X3JlZl9hcmdzKGlkeCA9PSBpbmRleCA/IGFyZ3MgOiBOVUxMLAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2Z3bm9kZV9oYW5k
bGUoZGV2aWNlKSwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJmVsZW1lbnQsIGVuZCwgYXJnc19jb3VudCk7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZlbGVtZW50LCBlbmQsCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50
ID8gbmFyZ3NfY291bnQgOiBhcmdzX2NvdW50KTsKPiA+IAo+ID4gQW5kIHRoaXMgY2hhbmdlIHdv
dWxkIG5vdCBiZSBuZWNlc3Nhcnk/Cj4gCj4gVGhpcyBpcyBub3QgdGhlIHNhbWUgY2hlY2sgYXMg
cHJvcG9zZWQgYWJvdmUuCj4gQnV0IHRoaXMgY2FuIGJlIG1hZGUgc2hvcnRlciB3aXRoIEVsdmlz
IGluIHVzZToKPiAKPiAJCQkJCQkmZWxlbWVudCwgZW5kLCBuYXJnc19jb3VudCA/OiBhcmdzX2Nv
dW50KTsKPiAKPiA+IEFuZCBhbmFsb2dvdXNseSBiZWxvdy4KPiAKPiBBbmQgYmVsb3cuIEFuZCBp
biBjYXNlIGlmIHRoZXJlIGlzIGEgbmV3IHByb3Bvc2FsIHRvIGhhdmUKPiAKPiAJaWYgKCFuYXJn
c19jb3VudCkKCkkgbWVhbnQKCglpZiAoIW5hcmdzX3Byb3ApCgpoZXJlIG9mIGNvdXJzZS4KCj4g
CQlhcmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19w
cm9wKTsKPiAKPiB0aGF0IGlzIGV4YWN0bHkgd2hhdCBJIGFza2VkIHRvIGRyb3AgYXMgaXQncyBp
bmNsdWRlZCBpbiB0aGUKPiBhY3BpX2Z3bm9kZV9nZXRfYXJnc19jb3VudCgpIGFscmVhZHksIGku
ZS4gbm8gbmVlZCB0byBjaGVjayB0aGlzIGluCj4gdGhlIGNhbGxlciBhbmQgaW4gdGhlIGNhbGxl
ZS4KPiAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKCi0tIApXaXRoIEJlc3Qg
UmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
