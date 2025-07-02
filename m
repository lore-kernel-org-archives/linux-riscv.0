Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17F4C83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQmQCjspscVefGUxaIa6Ly2CP9/1nC5mTbSZZpymNiA=; b=QRsfGBIFqQxla2
	znP/052CS1OEcWRaQZyDUb/ZdjfB+9TaRjZF1ilnjUI9bB51d9NGWlT2TlZQYaS/9+dnS7xGC/pmW
	mWhlGz54U2yBwQR4U/2eQ2qLRfzij7Kr3J0Vgc0D2tC/G8NWr0JctLSbp6pwOD/vyMXFR8y1ePMji
	NpCEmUrtN9L4yKdNyfzRbG2Ji9pDTRZ+UzwIyoBjIAe5+lKvrjoOnLXBM1ybTnruF4kUuuvpngSIq
	ClPqB9YZ5MvQhEvowVnvoCygC8R25/MIJI5DlAi9nksosQqmwdf7OZoiz8Fx2Aas7d7kvWepwKkUm
	s/krxXO+wkQOY7umTgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxrm-00000008WpX-0aaB;
	Wed, 02 Jul 2025 13:51:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwkY-00000008L8w-41fJ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5259E5C6CBF
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 12:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D6C4CEF0
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751459982;
	bh=RXfGdpMxEW2mvf3XGFHZjd8a9jo+IHTngUjPMRBX77E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/eKRVFZCRbBbtovWvZH4KxhDC/eufK748/Q9/d2OpPmfuN6s0ESLnb5xlSq0ahFe
	 9PWb2kCrl79vNKt6brA5YaNYfYr2/5GrH6Nj6oWAmfq3IatjkgF/iqyGkVoYbc97MD
	 eFeVHg4clwOecBcip/WC2GggM6PI4O24+u3KLTuAD8vlmGEIBCrlnDSRF1dycGEoaw
	 vy8d1zG4CsgBtmmEYAK93ULhEW/nOT0Eq12kL3gYNrXY+w2kJf9wG52eB5TeHIfKEq
	 /odi82LETxPI+RVMUBMdW7Zyj2YP8fGjGThNPfq76mVJbn/7/vuQgEqNUoXLIvZvjG
	 5RTXP5EWC/UkQ==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40a7322f081so1045765b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 05:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC/B0XlbFQs5cWeJTwLApigrYF0uM0cfoJzHPjnBC+L6toEBOzl/vQ2NsbJxk9bucFAChCwX8iZVPDbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhgU2KjSrwcg/c24Yxl+wCmgqcemPsBQV3x8icOnRy34RPOFfk
	CKdwk9npOQp1OYiRUGzW9/Ip2+f2C3gw3WV9TXiQS9R7+hrm2t50fjjByLrYwyf1hHH4EdmJUPm
	Gpp2DRiHL2M0a+RgyWUq2dlBcSp8UQw4=
X-Google-Smtp-Source: AGHT+IGW25OfeA+0PsSXYDwv8m1B6RMZiKJW4YrXLQ0ampAUyQxrE9UfHC02pfBOxDa9YiBqQVbM3vLvBrJdVfo07lk=
X-Received: by 2002:a05:6808:1383:b0:406:5a47:a081 with SMTP id
 5614622812f47-40b8875166amr2066248b6e.13.1751459981281; Wed, 02 Jul 2025
 05:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com> <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
In-Reply-To: <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 14:39:30 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
X-Gm-Features: Ac12FXypBdgduXgh2Soy9Mv3gI1-zeaGzzf1uZj9CeuqmyjyihvOhvxvz4Yj7ag
Message-ID: <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_053943_084490_B986106B 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCAxOjM44oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIw
MjUgYXQgMTI6MjA6NTVQTSArMDIwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBX
ZWQsIEp1bCAyLCAyMDI1IGF0IDc6MTbigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1p
Y3JvLmNvbT4gd3JvdGU6Cj4KPiAuLi4KPgo+ID4gPiAgc3RhdGljIGludCBhY3BpX2Z3bm9kZV9n
ZXRfcmVmZXJlbmNlX2FyZ3MoY29uc3Qgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
cHJvcG5hbWUsIGNvbnN0IGNoYXIgKm5hcmdzX3Byb3AsCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBhcmdzX2NvdW50LCB1bnNpZ25l
ZCBpbnQgaW5kZXgsCj4KPiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfZGF0
YSAqZGF0YTsKPiA+ID4gICAgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqcmVmX2Z3bm9kZTsK
PiA+ID4gICAgICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZTsKPiA+ID4gKyAgICAgICB1
bnNpZ25lZCBpbnQgbmFyZ3NfY291bnQ7Cj4gPiA+ICAgICAgICAgaW50IHJldCwgaWR4ID0gMDsK
Pgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBuYXJnc19jb3VudCA9IGFjcGlfZndub2Rl
X2dldF9hcmdzX2NvdW50KGRldmljZSwgbmFyZ3NfcHJvcCk7Cj4gPgo+ID4gSSB0aGluayBpdCBz
aG91bGQgd29yayB0aGUgc2FtZSB3YXkgYXMgaXQgdXNlZCB0byBmb3IgdGhlIGNhbGxlcnMgdGhh
dAo+ID4gcGFzcyBhcmdzX2NvdW50LCBzbyBtYXliZQo+ID4KPiA+IGlmICghYXJnc19jb3VudCkK
PiA+ICAgICAgICAgYXJnc19jb3VudCA9IGFjcGlfZndub2RlX2dldF9hcmdzX2NvdW50KGRldmlj
ZSwgbmFyZ3NfcHJvcCk7Cj4KPiBCdXQgdGhpcyBpcyBkaWZmZXJlbnQgdmFyaWFibGUuCgpPZiBj
b3Vyc2UgaXQgaXMgZGlmZmVyZW50LiAgSXQgaXMgYW4gYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5j
ZV9hcmdzKCkgcGFyYW1ldGVyLgoKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZWxlbWVu
dCsrOwo+ID4gPiAtCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGFjcGlfZ2V0
X3JlZl9hcmdzKGlkeCA9PSBpbmRleCA/IGFyZ3MgOiBOVUxMLAo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2Z3bm9kZV9oYW5kbGUoZGV2
aWNlKSwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmVsZW1lbnQsIGVuZCwgYXJnc19jb3VudCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZlbGVtZW50LCBlbmQsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50ID8gbmFy
Z3NfY291bnQgOiBhcmdzX2NvdW50KTsKPiA+Cj4gPiBBbmQgdGhpcyBjaGFuZ2Ugd291bGQgbm90
IGJlIG5lY2Vzc2FyeT8KPgo+IFRoaXMgaXMgbm90IHRoZSBzYW1lIGNoZWNrIGFzIHByb3Bvc2Vk
IGFib3ZlLgoKTm8sIGl0IGlzIG5vdC4KCkl0IGp1c3QgbWFrZXMgdGhlIGZ1bmN0aW9uIHdvcmsg
dGhlIHNhbWUgd2F5IGl0IGRpZCBiZWZvcmUgdGhlIGNoYW5nZQpmb3IgdGhlIGNhbGxlcnMgd2hv
IHBhc3NlZCBub3plcm8gYXJnc19jb3VudCBhbmQgc28gdGhleSBtaWdodCBiZQpmb3JnaXZlbiBl
eHBlY3RpbmcgdGhhdCBpdCB3b3VsZCBiZSB0YWtlbiBpbnRvIGFjY291bnQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
