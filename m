Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10E5C83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AprM5A6fd/K9U1gcRV8/mGeM//cA0woZL+PzJdlMjwI=; b=GvU7014W6sxrpb
	sbLpHAKeKEL+VhJXfLbFq+FCZrnYuGD/sDoRQHX5oXSnT2LGFYnJEHPV86soKQlxn91VW063PxeuH
	OS8o23SH+GB3YDj1axXJF4Z/TxfWIpRHTQZvQSZAyiDi4WgGHJ0KnVzREl/wf8/Z4sx0/YT/GraAh
	HFRBOa+kSunwQYHM66gZ9fRjoPhpqXpeUJ1GNO3pJCXN+LrKnfAE40teYLTJPkfRd+i1bf4NaaKeh
	G+zuOzylmUUnDb3I0URv3YU/IlY9dHWxyPqIjr5sl87hm5DxWJq4QDGAHGsgJj4o7LJZ0i1LypJPw
	2hkE3ypkxB/a1uGIhJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwVB-00000008IlX-3Kks;
	Wed, 02 Jul 2025 12:23:49 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvmy-000000089lt-3RNX
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751456288; x=1782992288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fJgjWVNnQ1JfN9I0fRmW4sxD0241ZFbaWN/2LUD+0dY=;
  b=V8uQ9CACu8GcU/Wgjo86wLMRsXUcKESGBqyPljaAw4jxx7xcN7h8OFKF
   5wgXzJVbz9Q72xWJ1Bq9RfcwpPOVoRsXOjpL8+jphIayFVwos2/2E5d6c
   NLrbk69RmX9IU0glDQ7T2nor1qm+SmWOO37aKuCju/o9MO+5JYWVcQ/m7
   sQu9zQEJyZ7IkNebJsfnPKCSm4QvDkno2ibN3v4DHv4NT2Ewyy81mdnR/
   AvcqK+jrlnWpjasfurY3vccZkNc5lLRoD4tSQ7qHuHCxWXRG+UQyPuWmj
   4+Im619FrGXDI/akQzQQo3RLhzdd9/bWuy48MH6oXC1pWB/HPbT6cVpXU
   Q==;
X-CSE-ConnectionGUID: xwOoDFAlQoOy5lVuIrms8g==
X-CSE-MsgGUID: LGyo4r3SRk+mcGlXH7iY5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79187059"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79187059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:38:08 -0700
X-CSE-ConnectionGUID: 13+ntn37QuGu/5SzJU2Mew==
X-CSE-MsgGUID: AkWC86+WQ3OMs/h2b6kHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159574298"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:38:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWvmo-0000000BuAB-07gn;
	Wed, 02 Jul 2025 14:37:58 +0300
Date: Wed, 2 Jul 2025 14:37:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
 <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043808_877991_BE118966 
X-CRM114-Status: GOOD (  18.13  )
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

T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMTI6MjA6NTVQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE24oCvQU0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgoKLi4uCgo+ID4gIHN0YXRpYyBpbnQgYWNw
aV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICpm
d25vZGUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpwcm9wbmFtZSwgY29uc3QgY2hhciAqbmFyZ3NfcHJvcCwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBhcmdzX2NvdW50LCB1
bnNpZ25lZCBpbnQgaW5kZXgsCgo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2Vf
ZGF0YSAqZGF0YTsKPiA+ICAgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKnJlZl9md25vZGU7
Cj4gPiAgICAgICAgIHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlOwo+ID4gKyAgICAgICB1bnNp
Z25lZCBpbnQgbmFyZ3NfY291bnQ7Cj4gPiAgICAgICAgIGludCByZXQsIGlkeCA9IDA7Cgo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgbmFyZ3NfY291bnQgPSBhY3BpX2Z3bm9kZV9nZXRfYXJn
c19jb3VudChkZXZpY2UsIG5hcmdzX3Byb3ApOwo+IAo+IEkgdGhpbmsgaXQgc2hvdWxkIHdvcmsg
dGhlIHNhbWUgd2F5IGFzIGl0IHVzZWQgdG8gZm9yIHRoZSBjYWxsZXJzIHRoYXQKPiBwYXNzIGFy
Z3NfY291bnQsIHNvIG1heWJlCj4gCj4gaWYgKCFhcmdzX2NvdW50KQo+ICAgICAgICAgYXJnc19j
b3VudCA9IGFjcGlfZndub2RlX2dldF9hcmdzX2NvdW50KGRldmljZSwgbmFyZ3NfcHJvcCk7CgpC
dXQgdGhpcyBpcyBkaWZmZXJlbnQgdmFyaWFibGUuCgo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgZWxlbWVudCsrOwo+ID4gLQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gYWNw
aV9nZXRfcmVmX2FyZ3MoaWR4ID09IGluZGV4ID8gYXJncyA6IE5VTEwsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2Z3bm9kZV9oYW5kbGUo
ZGV2aWNlKSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZlbGVtZW50LCBlbmQsIGFyZ3NfY291bnQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50ID8gbmFyZ3Nf
Y291bnQgOiBhcmdzX2NvdW50KTsKPiAKPiBBbmQgdGhpcyBjaGFuZ2Ugd291bGQgbm90IGJlIG5l
Y2Vzc2FyeT8KClRoaXMgaXMgbm90IHRoZSBzYW1lIGNoZWNrIGFzIHByb3Bvc2VkIGFib3ZlLgpC
dXQgdGhpcyBjYW4gYmUgbWFkZSBzaG9ydGVyIHdpdGggRWx2aXMgaW4gdXNlOgoKCQkJCQkJJmVs
ZW1lbnQsIGVuZCwgbmFyZ3NfY291bnQgPzogYXJnc19jb3VudCk7Cgo+IEFuZCBhbmFsb2dvdXNs
eSBiZWxvdy4KCkFuZCBiZWxvdy4gQW5kIGluIGNhc2UgaWYgdGhlcmUgaXMgYSBuZXcgcHJvcG9z
YWwgdG8gaGF2ZQoKCWlmICghbmFyZ3NfY291bnQpCgkJYXJnc19jb3VudCA9IGFjcGlfZndub2Rl
X2dldF9hcmdzX2NvdW50KGRldmljZSwgbmFyZ3NfcHJvcCk7Cgp0aGF0IGlzIGV4YWN0bHkgd2hh
dCBJIGFza2VkIHRvIGRyb3AgYXMgaXQncyBpbmNsdWRlZCBpbiB0aGUKYWNwaV9md25vZGVfZ2V0
X2FyZ3NfY291bnQoKSBhbHJlYWR5LCBpLmUuIG5vIG5lZWQgdG8gY2hlY2sgdGhpcyBpbgp0aGUg
Y2FsbGVyIGFuZCBpbiB0aGUgY2FsbGVlLgoKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChyZXQgPCAwKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
OwoKLi4uCgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFyZWZfZndub2RlKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2UgPSB0b19hY3BpX2RldmljZV9ub2RlKHJlZl9m
d25vZGUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbmFyZ3NfY291bnQgPSBhY3BpX2Z3
bm9kZV9nZXRfYXJnc19jb3VudChkZXZpY2UsIG5hcmdzX3Byb3ApOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgZWxlbWVudCsrOwo+ID4gLQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0ID0gYWNwaV9nZXRfcmVmX2FyZ3MoaWR4ID09IGluZGV4ID8gYXJncyA6IE5VTEwsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWZfZndub2Rl
LCAmZWxlbWVudCwgZW5kLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYXJnc19jb3VudCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBuYXJnc19jb3VudCA/IG5hcmdzX2NvdW50IDogYXJnc19jb3Vu
dCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKCi0tIApXaXRoIEJlc3QgUmVnYXJk
cywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
