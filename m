Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D533CC83F0A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YhFQ6in90j8Meo/zO4AnKBCatYGuHTcoQ9kNtbyh3s=; b=YifxHrcwSrEtqC
	sImIwMPlcPyRPAd3+q/soGU7WcG2Ars10AyK5apRvBN2PBBLi/DLIP3rpTqBjoMp+Yg2e4l71QflR
	oITUodtAzLeCVncowjzUzNEN6mM5vsj7lzAlIcfyIDPNk8ADk+PaIyCAjsOnbSz9Oe3y4k/xsvwAe
	PO8zrqO50Ttmp5xcEn/lQlG/6AMVZzVTbrIKGGZy/lkbzHinkXE8JEcJXqLU+9uzc5QF1+v5yM/P3
	MSDeeglyZcIaVB+ejQle+DF4psk8MTzqUR6HdjGJs2ZXcV5h0ChKamh/FGMwCX1agrL67S2llhuEs
	NaLs4gPoCGE1EEweazcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZG-00000009AJM-0BHV;
	Wed, 02 Jul 2025 17:48:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0lm-000000092eI-23rQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Jul 2025 16:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PnvPP6CoX4CKz6AhzJIXkrtnBfHN5YSuhM+uTZa128Y=; b=OyoxS1kzpZc7lJYThahG2lQNS+
	sW/2SaIx6p1b9TJMRhLgh09Kip1iZaHkGo3uP3boH8t2i5j9Nk/H65jLWWI/34p8VAwZuM2hENA2H
	M6EazGypQ49oLysLPWFRJtRoVWk6yePsxssHMKaFxHF69S/xaTWW+tFZpge9FxIH6de9zEohLew+F
	F3gRO/SYsgNmVEH+DWaM3sIjAr0Tjh+ri7UBAVc4BfLUloEovsOLiLTPFcGF/z44crpqox/pPGMcY
	MAAxDAKHUJ1FNSiKM7dCovK+HhsqSL79MZokcL7sfIgr1HAlSElCb5N7YWqFPAGO3Q0FcOF6s8kFU
	yLCsIlWA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0lj-00000007VFI-2ElK
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 16:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 570A04626E
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 16:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A70C4CEF4
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751475421;
	bh=5fLW9lHTWD1y79pwK2fgk5Kd5I6KUd1GhgRK6nF2tYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sER/DzSxLf1cACrNLDFA83rnzm9Yg3EebdeAqx58yqiK8+c7PkNjE0vxNUv2apS/G
	 2lPoZLTxhECQi7CmUZVgv9T2HSwj4c6gAz7aiFKwatOMMAq170Kl/dnj2QMDTvgkXa
	 BMLZKktwQ08bMScdmxxW5+l+gJh08yituY7oCuLzPMFFq1Iyq0xoCp9qX/ONjpn743
	 6I2Z0/hpHrNDR+lGUkdTrAb6leaLc2wHgTZOC8TwbwfoRfW3IAJi3wzK2/FbZvcfcG
	 8gDWJ8Y/LgDObJsEmBXM+irkNgcmrhBhjMXdPgXbga2ePnNfe/Wfn8UK3KS7FpTeyH
	 GtemJkj0F817g==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60d63174f05so1063474eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 09:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7lZ/YDtDRZdu7gL96JO2RmGK8AjFh9F21unvPKAzCBax3fMpWOux2BZRr0TJU7HJp3OFRwyA5XCMajQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwZTId8shc3MeJytzK2/zAxfauTyiwWh6ke4cMSkE5lfeMtI6B
	Sty/AWtkLzIiFgLjVREmIm0Fe+ugk73I4GdMl6Wn4FaxEHUWU6Mu17qBaEXh6jmUTwmjlhNwzgl
	0g6huno5ZVp7e2+GE4XrRg00ZSNIcnE4=
X-Google-Smtp-Source: AGHT+IH9qNtwc3BZ2zcpxgSNEE28TzTLjJ7V6ei87dF1FcJIxoWDLz53sAGHsJJOhX0RJfWm/FheCXyuy0fLYb8IODw=
X-Received: by 2002:a05:6808:1706:b0:40a:52cf:8870 with SMTP id
 5614622812f47-40bfde82cbcmr15178b6e.26.1751475420246; Wed, 02 Jul 2025
 09:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com> <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com> <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
 <aGVK7NxRdDIGRzNR@sunil-laptop>
In-Reply-To: <aGVK7NxRdDIGRzNR@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 18:56:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hTzrxqfejxSxqh9igiDp=8LkBw+FGSf9CJ7j3RyTJLBQ@mail.gmail.com>
X-Gm-Features: Ac12FXxz2sRU5vqvKRB8NuHZ48tg4u3JFhsyNnnrs4x6Kv_jRDKQqaFb0Fqjbyc
Message-ID: <CAJZ5v0hTzrxqfejxSxqh9igiDp=8LkBw+FGSf9CJ7j3RyTJLBQ@mail.gmail.com>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Anup Patel <apatel@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_175711_961818_39CEB904 
X-CRM114-Status: GOOD (  26.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA1OjA24oCvUE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMDI6Mzk6MzBQ
TSArMDIwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAyLCAyMDI1
IGF0IDE6MzjigK9QTSBBbmR5IFNoZXZjaGVua28KPiA+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIEp1bCAwMiwgMjAyNSBhdCAx
MjoyMDo1NVBNICswMjAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiBPbiBXZWQs
IEp1bCAyLCAyMDI1IGF0IDc6MTbigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IC4uLgo+ID4gPgo+ID4gPiA+ID4gIHN0YXRpYyBpbnQg
YWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxl
ICpmd25vZGUsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpwcm9wbmFtZSwgY29uc3QgY2hhciAqbmFyZ3NfcHJvcCwKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBhcmdzX2NvdW50LCB1bnNpZ25lZCBpbnQgaW5kZXgsCj4gPiA+Cj4gPiA+ID4gPiAgICAgICAg
IGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9kYXRhICpkYXRhOwo+ID4gPiA+ID4gICAgICAgICBz
dHJ1Y3QgZndub2RlX2hhbmRsZSAqcmVmX2Z3bm9kZTsKPiA+ID4gPiA+ICAgICAgICAgc3RydWN0
IGFjcGlfZGV2aWNlICpkZXZpY2U7Cj4gPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBuYXJn
c19jb3VudDsKPiA+ID4gPiA+ICAgICAgICAgaW50IHJldCwgaWR4ID0gMDsKPiA+ID4KPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0
X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9wKTsKPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsg
aXQgc2hvdWxkIHdvcmsgdGhlIHNhbWUgd2F5IGFzIGl0IHVzZWQgdG8gZm9yIHRoZSBjYWxsZXJz
IHRoYXQKPiA+ID4gPiBwYXNzIGFyZ3NfY291bnQsIHNvIG1heWJlCj4gPiA+ID4KPiA+ID4gPiBp
ZiAoIWFyZ3NfY291bnQpCj4gPiA+ID4gICAgICAgICBhcmdzX2NvdW50ID0gYWNwaV9md25vZGVf
Z2V0X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9wKTsKPiA+ID4KPiA+ID4gQnV0IHRoaXMg
aXMgZGlmZmVyZW50IHZhcmlhYmxlLgo+ID4KPiA+IE9mIGNvdXJzZSBpdCBpcyBkaWZmZXJlbnQu
ICBJdCBpcyBhbiBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBwYXJhbWV0ZXIuCj4g
Pgo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZWxlbWVudCsrOwo+ID4gPiA+ID4g
LQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gYWNwaV9nZXRfcmVmX2Fy
Z3MoaWR4ID09IGluZGV4ID8gYXJncyA6IE5VTEwsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2Z3bm9kZV9oYW5kbGUoZGV2aWNl
KSwKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZlbGVtZW50LCBlbmQsIGFyZ3NfY291bnQpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2Nv
dW50ID8gbmFyZ3NfY291bnQgOiBhcmdzX2NvdW50KTsKPiA+ID4gPgo+ID4gPiA+IEFuZCB0aGlz
IGNoYW5nZSB3b3VsZCBub3QgYmUgbmVjZXNzYXJ5Pwo+ID4gPgo+ID4gPiBUaGlzIGlzIG5vdCB0
aGUgc2FtZSBjaGVjayBhcyBwcm9wb3NlZCBhYm92ZS4KPiA+Cj4gPiBObywgaXQgaXMgbm90Lgo+
ID4KPiA+IEl0IGp1c3QgbWFrZXMgdGhlIGZ1bmN0aW9uIHdvcmsgdGhlIHNhbWUgd2F5IGl0IGRp
ZCBiZWZvcmUgdGhlIGNoYW5nZQo+ID4gZm9yIHRoZSBjYWxsZXJzIHdobyBwYXNzZWQgbm96ZXJv
IGFyZ3NfY291bnQgYW5kIHNvIHRoZXkgbWlnaHQgYmUKPiA+IGZvcmdpdmVuIGV4cGVjdGluZyB0
aGF0IGl0IHdvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPgo+IEJ1dCBpZiB3ZSBkbyBsaWtl
IHRoaXMsIHRoZSBleHBlY3RhdGlvbiBvZgo+IGZ3bm9kZV9wcm9wZXJ0eV9nZXRfcmVmZXJlbmNl
X2FyZ3MoKSB3aWxsIGRpZmZlciBmb3IgRFQgYW5kIEFDUEksIHJpZ2h0Pwo+IEkgbWVhbiBuYXJn
c19wcm9wIHNob3VsZCB0YWtlIGhpZ2hlciBwcmVjZWRlbmNlIHRoYW4gbmFyZ3MuCgpTbyB5b3Ug
YmFzaWNhbGx5IHdhbnQgYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKCkgdG8gdGFrZQpu
YXJnc19wcm9wIGludG8gYWNjb3VudCAod2hpY2ggY291bGQgYmUgZXhwbGFpbmVkIG11Y2ggY2xl
YW5lciBpbiB0aGUKcGF0Y2ggY2hhbmdlbG9ncykuCgpBbHNvLCB5b3VyIGNoYW5nZXMgZG9uJ3Qg
bW9kaWZ5IHRoZSBiZWhhdmlvciBvZgpfX2FjcGlfbm9kZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNl
KCkgQUZBSUNTLCBzbyB0aGlzIGlzIE9LLgoKTmV2ZXIgbWluZCB0aGVuLCBidXQgeW91IGNvdWxk
IHBhc3MgbmFyZ3NfcHJvcCBhbG9uZyB3aXRoIHRoZQphZGRpdGlvbmFsIGRldmljZSBwYXJhbWV0
ZXIgdG8gYWNwaV9nZXRfcmVmX2FyZ3MoKSBhbmQgbWFrZSB0aGF0CmZ1bmN0aW9uIG9idGFpbiB0
aGUgbmFyZ3NfcHJvcCB2YWx1ZS4gIEluIHRoZSBwYXRjaCwgeW91IG5lZWQgdG8gZ2V0CnRoZSBu
YXJnc19wcm9wIHZhbHVlIGJlZm9yZSBjYWxsaW5nIGl0IGFueXdheSBpbiBib3RoIHBsYWNlcyBp
biB3aGljaAppdCBpcyB1c2VkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
