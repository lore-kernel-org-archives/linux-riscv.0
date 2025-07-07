Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99852C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFGgNWQJIOzUCTJiJ/dMiybI4Hq61Xhk3H3FJ9ESkJY=; b=1QlSsz9AOloeew
	Ylsvo+aBz0ZZfIBO+n47vR1sCr2qJcMLA/yOAuGNrHETzTFFJeC7ayQaQG4z6Hq7EYe/VpE9AlMay
	2K+vjh3vYLu7lnydJbWwzwmxepgVGXsY8JzIPuf1i3Vg+nb0I+1mISCejfL89UyXqYf8HBk3HOg3L
	UfVqVHg4pUzsXMJV6778KqTSV/b8lSNV/Rb5QPS3b0md+eH4T3P0mo/suK7/LDGsP4+otoeCvKDtP
	PYtR09PVttQ+jZ3Hwgvj+ggstoTd2Oc4ZToS8dMNhuT5Vt49d43AzcYAm+QdXBgVJwiBIRk/oD7Wu
	hIU0QlzI69Sv9I9prcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYprg-00000003CSH-3hfJ;
	Mon, 07 Jul 2025 17:42:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp39-000000034It-414e
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 16:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37D72A541BD
	for <linux-riscv@lists.infradead.org>; Mon,  7 Jul 2025 16:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C474EC4CEF4
	for <linux-riscv@lists.infradead.org>; Mon,  7 Jul 2025 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751907038;
	bh=9a1wcjgGyuGBH9dz8iciM2zoxRYiXr1OThzA70moRAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QmFaFG9amTsKCMhZTdRsdRLBhzbA9RgaZYGw7TGX/1hNfeXtiwzqS577/OOcXfVOe
	 VJ5VDUIUOkUQZbjDJ1waqGZyhKQO7/oelpE8cgIMrOTdHs7WjpGKuTpTKNGek7XAvZ
	 wGdmbnZOA7lKx52GlkSCtztm4URBUMKpHvFuY1wt+ge9xmnS1+9Ay5d7vB1bpiTjUN
	 1ZE33gDJOzihdZqw6Q040WHZgWYvyDg7pcE6IfxlTwgOMseNl0z+NMPWZq7tkY4xBY
	 +QbM0DsXHkDFVXSYu09qZo5Zs4ofrP1/0B1w5uomHVQ8A7hyzi+xMMNUZiUPk4bpSp
	 a6ydhRgQPR7tA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-61208b86da2so784754eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 09:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNQhpmeRIfAh7ISJcUlrhCSJKSRRnXF7RaufVktmghMVKU62JBuIbHyX26d0WFgejiJf90cv5+dWgONw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZRUw7Q0KdKGbNq53MeNkPn/rlGzh8GW0bSZhK5gzRm9lp1g8J
	mPF+acqDUvgLVLZQr4ohshlU6coCv2RMJOVotZ78eZq9xrRKtDqZ4soLmib15KmME3pazP0CbhY
	oM0u94SQESI5DvPSJHl51U77NTL+NBiw=
X-Google-Smtp-Source: AGHT+IHNACN6r3MQBzl2AxnxkY7b3vwCCOzvxM4DbSJ5BWQkgWMplMg/AADsP0wxtsyFOxnDcsFDRO8teU3gGL28ZLg=
X-Received: by 2002:a05:6820:2901:b0:611:ab60:3003 with SMTP id
 006d021491bc7-613c02a087bmr171510eaf.8.1751907037895; Mon, 07 Jul 2025
 09:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com> <20250704070356.1683992-16-apatel@ventanamicro.com>
In-Reply-To: <20250704070356.1683992-16-apatel@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 7 Jul 2025 18:50:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i0n3twH8qPR04bX5uRzXXSmKhB72WfFEAuG+nbMOJcFw@mail.gmail.com>
X-Gm-Features: Ac12FXzt6T3E94Z3HOk5kB7YG-fbGgkcx6q0up1mrENTBphzopL9rtBmotWtHfA
Message-ID: <CAJZ5v0i0n3twH8qPR04bX5uRzXXSmKhB72WfFEAuG+nbMOJcFw@mail.gmail.com>
Subject: Re: [PATCH v8 15/24] ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095040_123077_A6A51B6A 
X-CRM114-Status: GOOD (  28.93  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCA5OjA34oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRnJvbTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+Cj4KPiBDdXJyZW50bHksIEFDUEkgZG9lcyBub3Qgc3VwcG9ydCB0aGUgdXNlIG9m
IGEgbmFyZ3NfcHJvcCAoZS5nLiwKPiBhc3NvY2lhdGVkIHdpdGggYSByZWZlcmVuY2UgaW4gZndu
b2RlX3Byb3BlcnR5X2dldF9yZWZlcmVuY2VfYXJncygpLgo+IEluc3RlYWQsIEFDUEkgZXhwZWN0
cyB0aGUgbnVtYmVyIG9mIGFyZ3VtZW50cyAobmFyZ3MpIHRvIGJlIGV4cGxpY2l0bHkKPiBwYXNz
ZWQgb3Iga25vd24uCj4KPiBUaGlzIGJlaGF2aW9yIGRpdmVyZ2VzIGZyb20gT3BlbiBGaXJtd2Fy
ZSAoT0YpLCB3aGljaCBhbGxvd3MgdGhlIHVzZSBvZgo+IGEgIyotY2VsbHMgcHJvcGVydHkgaW4g
dGhlIHJlZmVyZW5jZWQgbm9kZSB0byBkZXRlcm1pbmUgdGhlIG51bWJlciBvZgo+IGFyZ3VtZW50
cy4gU2luY2UgZndub2RlX3Byb3BlcnR5X2dldF9yZWZlcmVuY2VfYXJncygpIGlzIGEgY29tbW9u
Cj4gaW50ZXJmYWNlIHVzZWQgYWNyb3NzIGJvdGggT0YgYW5kIEFDUEkgZmlybXdhcmUgcGFyYWRp
Z21zLCBpdCBpcwo+IGRlc2lyYWJsZSB0byBoYXZlIGEgdW5pZmllZCBjYWxsaW5nIGNvbnZlbnRp
b24gdGhhdCB3b3JrcyBzZWFtbGVzc2x5IGZvcgo+IGJvdGguCj4KPiBBZGQgdGhlIHN1cHBvcnQg
Zm9yIEFDUEkgdG8gcGFyc2UgYSBuYXJnc19wcm9wIGZyb20gdGhlIHJlZmVyZW5jZWQKPiBmd25v
ZGUsIGFsaWduaW5nIGl0cyBiZWhhdmlvciB3aXRoIHRoZSBPRiBiYWNrZW5kLiBUaGlzIGFsbG93
cyBkcml2ZXJzCj4gYW5kIHN1YnN5c3RlbXMgdXNpbmcgZndub2RlX3Byb3BlcnR5X2dldF9yZWZl
cmVuY2VfYXJncygpIHRvIHdvcmsgaW4gYQo+IGZpcm13YXJlLWFnbm9zdGljIHdheSB3aXRob3V0
IGhhdmluZyB0byBoYXJkY29kZSBvciBzcGVjaWFsLWNhc2UKPiBhcmd1bWVudCBjb3VudHMgZm9y
IEFDUEkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNv
bT4KCkxHVE0gbm93LCBzbwoKQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53
eXNvY2tpQGludGVsLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvYWNwaS9wcm9wZXJ0eS5jIHwgMjkg
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgZHJpdmVycy9iYXNlL3Byb3BlcnR5LmMg
fCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3Byb3BlcnR5LmMgYi9kcml2ZXJzL2Fj
cGkvcHJvcGVydHkuYwo+IGluZGV4IGQ0ODYzNzQ2ZmIxMS4uZTkyNDAyZGVlZTc3IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvYWNwaS9wcm9wZXJ0eS5jCj4gKysrIGIvZHJpdmVycy9hY3BpL3Byb3Bl
cnR5LmMKPiBAQCAtODA0LDEzICs4MDQsMzUgQEAgYWNwaV9md25vZGVfZ2V0X25hbWVkX2NoaWxk
X25vZGUoY29uc3Qgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPiAgICAgICAgIHJldHVy
biBOVUxMOwo+ICB9Cj4KPiArc3RhdGljIHVuc2lnbmVkIGludCBhY3BpX2Z3bm9kZV9nZXRfYXJn
c19jb3VudChzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFyZ3NfcHJvcCkKPiAr
ewo+ICsgICAgICAgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2RhdGEgKmRhdGE7Cj4gKyAgICAg
ICBjb25zdCB1bmlvbiBhY3BpX29iamVjdCAqb2JqOwo+ICsgICAgICAgaW50IHJldDsKPiArCj4g
KyAgICAgICBkYXRhID0gYWNwaV9kZXZpY2VfZGF0YV9vZl9ub2RlKGZ3bm9kZSk7Cj4gKyAgICAg
ICBpZiAoIWRhdGEpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIHJl
dCA9IGFjcGlfZGF0YV9nZXRfcHJvcGVydHkoZGF0YSwgbmFyZ3NfcHJvcCwgQUNQSV9UWVBFX0lO
VEVHRVIsICZvYmopOwo+ICsgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gKwo+ICsgICAgICAgcmV0dXJuIG9iai0+aW50ZWdlci52YWx1ZTsKPiArfQo+ICsKPiAg
c3RhdGljIGludCBhY3BpX2dldF9yZWZfYXJncyhzdHJ1Y3QgZndub2RlX3JlZmVyZW5jZV9hcmdz
ICphcmdzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5k
bGUgKnJlZl9md25vZGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFy
ICpuYXJnc19wcm9wLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5pb24g
YWNwaV9vYmplY3QgKiplbGVtZW50LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgdW5pb24gYWNwaV9vYmplY3QgKmVuZCwgc2l6ZV90IG51bV9hcmdzKQo+ICB7Cj4gICAgICAg
ICB1MzIgbmFyZ3MgPSAwLCBpOwo+Cj4gKyAgICAgICBpZiAobmFyZ3NfcHJvcCkKPiArICAgICAg
ICAgICAgICAgbnVtX2FyZ3MgPSBhY3BpX2Z3bm9kZV9nZXRfYXJnc19jb3VudChyZWZfZndub2Rl
LCBuYXJnc19wcm9wKTsKPiArCj4gICAgICAgICAvKgo+ICAgICAgICAgICogQXNzdW1lIHRoZSBm
b2xsb3dpbmcgaW50ZWdlciBlbGVtZW50cyBhcmUgYWxsIGFyZ3MuIFN0b3AgY291bnRpbmcgb24K
PiAgICAgICAgICAqIHRoZSBmaXJzdCByZWZlcmVuY2UgKHBvc3NpYmx5IHJlcHJlc2VudGVkIGFz
IGEgc3RyaW5nKSBvciBlbmQgb2YgdGhlCj4gQEAgLTk2MSwxMCArOTgzLDEwIEBAIHN0YXRpYyBp
bnQgYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFu
ZGxlICpmd25vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVsZW1lbnQrKzsKPiAtCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gYWNwaV9nZXRfcmVmX2FyZ3MoaWR4ID09IGluZGV4ID8g
YXJncyA6IE5VTEwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYWNwaV9md25vZGVfaGFuZGxlKGRldmljZSksCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwgYXJnc19jb3VudCk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmFyZ3NfcHJv
cCwgJmVsZW1lbnQsIGVuZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhcmdzX2NvdW50KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiBA
QCAtOTc5LDkgKzEwMDEsOCBAQCBzdGF0aWMgaW50IGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2Vf
YXJncyhjb25zdCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBlbGVtZW50Kys7Cj4gLQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGFjcGlf
Z2V0X3JlZl9hcmdzKGlkeCA9PSBpbmRleCA/IGFyZ3MgOiBOVUxMLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZl9md25vZGUsICZlbGVtZW50LCBl
bmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVm
X2Z3bm9kZSwgbmFyZ3NfcHJvcCwgJmVsZW1lbnQsIGVuZCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmdzX2NvdW50KTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmV0IDwgMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wcm9wZXJ0eS5jIGIvZHJp
dmVycy9iYXNlL3Byb3BlcnR5LmMKPiBpbmRleCBmNjI2ZDViYmU4MDYuLjZhNjM4NjA1NzlkZCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jhc2UvcHJvcGVydHkuYwo+ICsrKyBiL2RyaXZlcnMvYmFz
ZS9wcm9wZXJ0eS5jCj4gQEAgLTU3OCw3ICs1NzgsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChmd25v
ZGVfcHJvcGVydHlfbWF0Y2hfcHJvcGVydHlfc3RyaW5nKTsKPiAgICogQHByb3A6ICAgICAgVGhl
IG5hbWUgb2YgdGhlIHByb3BlcnR5Cj4gICAqIEBuYXJnc19wcm9wOiAgICAgICAgVGhlIG5hbWUg
b2YgdGhlIHByb3BlcnR5IHRlbGxpbmcgdGhlIG51bWJlciBvZgo+ICAgKiAgICAgICAgICAgICBh
cmd1bWVudHMgaW4gdGhlIHJlZmVycmVkIG5vZGUuIE5VTEwgaWYgQG5hcmdzIGlzIGtub3duLAo+
IC0gKiAgICAgICAgICAgICBvdGhlcndpc2UgQG5hcmdzIGlzIGlnbm9yZWQuIE9ubHkgcmVsZXZh
bnQgb24gT0YuCj4gKyAqICAgICAgICAgICAgIG90aGVyd2lzZSBAbmFyZ3MgaXMgaWdub3JlZC4K
PiAgICogQG5hcmdzOiAgICAgTnVtYmVyIG9mIGFyZ3VtZW50cy4gSWdub3JlZCBpZiBAbmFyZ3Nf
cHJvcCBpcyBub24tTlVMTC4KPiAgICogQGluZGV4OiAgICAgSW5kZXggb2YgdGhlIHJlZmVyZW5j
ZSwgZnJvbSB6ZXJvIG9ud2FyZHMuCj4gICAqIEBhcmdzOiAgICAgIFJlc3VsdCBzdHJ1Y3R1cmUg
d2l0aCByZWZlcmVuY2UgYW5kIGludGVnZXIgYXJndW1lbnRzLgo+IC0tCj4gMi40My4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
