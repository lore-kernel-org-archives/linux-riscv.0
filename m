Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4683BC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y80UBB1oU+V6HMQ3Pnv4WcpfVZg7Ww3/ZmkjJHVKyoo=; b=CBdr+1PrMN2Gd0
	a/PHx9QGxTIho5DBsp8bg+s4R3FI0z59s/dD+CdY2/jNGIvGpNNXZTZ7p7M1UjCdHlMAA0y/zYi2P
	DJ7TLgWFNARzPsPRV6jGHde7Ie998t6tx50OS1D12W1GNtV9ZSHwOy4T6fERJiaHIk74y+VCJFa5v
	3lqn1MwsLGKLawnhkPuzk4kFLfutgPd2jLDpVLpYDsg8oweFpHg6OE4/Qx2E1DuRxhXQVKBQ2fOx9
	aSw35fqo3FYW51j3HfkmMRS1LdONVmDsSyIXn1KzV9gErTYn54naat85o/RSo6Zt0FHOl2G1YbkVf
	4AeEWxpdsTlnDXWVlQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxSZ-00000008Rf0-09B7;
	Wed, 02 Jul 2025 13:25:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxJt-00000008Pua-3HJG
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6670A461FC
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 13:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E59AC113CF
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462173;
	bh=GdEMIMP/ZD2NlQMB7UwdH4vkioz/Fr9+gYnj68JSXJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K8gk/D1N97NJRGD8yl+gE3NWFQ+5KuP9HYW2FqRyQ/4JTJEPBM8X/N982uJJ6EzMR
	 VsYVfyeUXgaaFLZYStMMQjnubPBkNAnDKUWGWHn9cVf2eQkAeknknYNqnZUPYNNYRs
	 WIkGwK8fpIZ7R1NHzL//sWRtHihvtdClFEPPnuAPf1PqwWK6XtQu0SVtpUo8vmDLWG
	 kS62HZt1jSyObot7BUj2ILorYHb7/RMCH9MqByKhQSIF2WGVnxDTl94yP52JgglKFz
	 jfA1dqr6x0/RSi7JDqTzDdcqvlJ+u7ExRK1D37Ec/MFkGavGNzb/QLw/eIQtNa7dYY
	 xECWnyEfd/wNQ==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-60eefb805a4so729764eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 06:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1XI6MkUqMpbYVR3CZr1FGzyho+mxdfO7U3408mUj6CQa//wvK9IKlB5YkTszlfa7I0ScnRPPJKlyLHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKPLuSbSXQRoxsiLel+LcbnFAjTgJWq+9xgQC5/KYGmXSez8FM
	jEMC62u+OTxaV+mcUAesEnBp9/YI7cLcd6HMFCtvVRdYjht0i+Sl8LigDlChRlE4p8A55H0mt8f
	Iw7sMDDy0yxb2IfR9HS+oicEqdOB4oFw=
X-Google-Smtp-Source: AGHT+IExuMqttOKIUYDi+vcXqSuKCbKvlhqQnT1REYwcx9EA5ftg4W7ZWLLFZPOL0rfqf8a4k8cL0HPmiaY5KvT1aRo=
X-Received: by 2002:a05:6820:1e0d:b0:611:af6f:ee77 with SMTP id
 006d021491bc7-612010dfe12mr1692210eaf.8.1751462172310; Wed, 02 Jul 2025
 06:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com> <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com> <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
 <aGUsg121lenWHL-w@smile.fi.intel.com>
In-Reply-To: <aGUsg121lenWHL-w@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 15:16:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ja5eUiAn7Ht5+-7-b40JtzsCqmztN9WdtLY=kJ7vbtQw@mail.gmail.com>
X-Gm-Features: Ac12FXwc4zqpJNNErqBqjCI2hKLQ3Xi8ekft38n4p6qLhM2Gh3XrHd9uynY6pvk
Message-ID: <CAJZ5v0ja5eUiAn7Ht5+-7-b40JtzsCqmztN9WdtLY=kJ7vbtQw@mail.gmail.com>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_061613_857476_469D9254 
X-CRM114-Status: GOOD (  23.98  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCAyOjU24oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIw
MjUgYXQgMDI6Mzk6MzBQTSArMDIwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBX
ZWQsIEp1bCAyLCAyMDI1IGF0IDE6MzjigK9QTSBBbmR5IFNoZXZjaGVua28KPiA+IDxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAwMiwg
MjAyNSBhdCAxMjoyMDo1NVBNICswMjAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4g
PiBPbiBXZWQsIEp1bCAyLCAyMDI1IGF0IDc6MTbigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAuLi4KPgo+ID4gPiA+ID4gIHN0YXRpYyBpbnQgYWNw
aV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICpm
d25vZGUsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpwcm9wbmFtZSwgY29uc3QgY2hhciAqbmFyZ3NfcHJvcCwKPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBh
cmdzX2NvdW50LCB1bnNpZ25lZCBpbnQgaW5kZXgsCj4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIGNv
bnN0IHN0cnVjdCBhY3BpX2RldmljZV9kYXRhICpkYXRhOwo+ID4gPiA+ID4gICAgICAgICBzdHJ1
Y3QgZndub2RlX2hhbmRsZSAqcmVmX2Z3bm9kZTsKPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IGFj
cGlfZGV2aWNlICpkZXZpY2U7Cj4gPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBuYXJnc19j
b3VudDsKPiA+ID4gPiA+ICAgICAgICAgaW50IHJldCwgaWR4ID0gMDsKPiA+ID4KPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0X2Fy
Z3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9wKTsKPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgaXQg
c2hvdWxkIHdvcmsgdGhlIHNhbWUgd2F5IGFzIGl0IHVzZWQgdG8gZm9yIHRoZSBjYWxsZXJzIHRo
YXQKPiA+ID4gPiBwYXNzIGFyZ3NfY291bnQsIHNvIG1heWJlCj4gPiA+ID4KPiA+ID4gPiBpZiAo
IWFyZ3NfY291bnQpCj4gPiA+ID4gICAgICAgICBhcmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0
X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9wKTsKPiA+ID4KPiA+ID4gQnV0IHRoaXMgaXMg
ZGlmZmVyZW50IHZhcmlhYmxlLgo+ID4KPiA+IE9mIGNvdXJzZSBpdCBpcyBkaWZmZXJlbnQuICBJ
dCBpcyBhbiBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBwYXJhbWV0ZXIuCj4gPgo+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZWxlbWVudCsrOwo+ID4gPiA+ID4gLQo+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gYWNwaV9nZXRfcmVmX2FyZ3Mo
aWR4ID09IGluZGV4ID8gYXJncyA6IE5VTEwsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2Z3bm9kZV9oYW5kbGUoZGV2aWNlKSwK
PiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZlbGVtZW50LCBlbmQsIGFyZ3NfY291bnQpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50
ID8gbmFyZ3NfY291bnQgOiBhcmdzX2NvdW50KTsKPiA+ID4gPgo+ID4gPiA+IEFuZCB0aGlzIGNo
YW5nZSB3b3VsZCBub3QgYmUgbmVjZXNzYXJ5Pwo+ID4gPgo+ID4gPiBUaGlzIGlzIG5vdCB0aGUg
c2FtZSBjaGVjayBhcyBwcm9wb3NlZCBhYm92ZS4KPiA+Cj4gPiBObywgaXQgaXMgbm90Lgo+ID4K
PiA+IEl0IGp1c3QgbWFrZXMgdGhlIGZ1bmN0aW9uIHdvcmsgdGhlIHNhbWUgd2F5IGl0IGRpZCBi
ZWZvcmUgdGhlIGNoYW5nZQo+ID4gZm9yIHRoZSBjYWxsZXJzIHdobyBwYXNzZWQgbm96ZXJvIGFy
Z3NfY291bnQgYW5kIHNvIHRoZXkgbWlnaHQgYmUKPiA+IGZvcmdpdmVuIGV4cGVjdGluZyB0aGF0
IGl0IHdvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPgo+IEkgc2VlIHlvdXIgcG9pbnQgbm93
LiBCdXQgZG8gd2UgaGF2ZSBzdWNoIGEgdXNlcj8gSSBkdW5uby4KCldlbGwsIF9fYWNwaV9ub2Rl
X2dldF9wcm9wZXJ0eV9yZWZlcmVuY2UoKSBnZXRzIGNhbGxlZCBpbiBhIGNvdXBsZSBvZiBwbGFj
ZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
