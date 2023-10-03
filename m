Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13483E75457
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IROLQFGg/34orbgYUpOWk9yeCBxVwdv1jn9Wz00pQw=; b=na3fupL+q8t0oU
	X/is+AU37NNf0lhsuGeljyuRVF4BMttw+7xl0v9JCIQVcEFtQftV9iGQlAWYaWPuJ6qU/Tfo+czMk
	jf0dszs/XLCuQYVU5/HoYB1M0oJ1uoMkhtViTHG2NCR3PqN4D7HmlBW6J64untaRGt5qGD8BM1lf/
	Uj7MVEep3GPn0b+btHpsGo5szE976XzahJF70APIxR0KT1Gb1WFysfR06YqUHaJhkluXcCtf5gKZn
	AuDi+5EjyrlhltdYFVfgLB+7DX4L65dTkz8BERIzIrxSeqnhQF6p+552UKoYLW45U2ZMZewpZgssA
	3RwJiEsy12cERCvcHhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnebe-00Ecfm-2E;
	Tue, 03 Oct 2023 12:34:30 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnebc-00EcfP-1h
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:34:29 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59f6e6b206fso10486797b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696336466; x=1696941266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DyBs7OjE8jGf/jQcbBbdy03j+SsN0IPwt3J55hhRj0=;
        b=M3xyXB8j1/Q0VfhkMZmBeFByydma4cinxtg0+lTeTWTHhaoUlWZ2x0cbGDKDqxi0cy
         w0Vrcjh01RnUjiTpYoFpTQ0Zc/Oi4NIt7zVoKLNq6KzE1JJl9IyqaiK0ka3IlVbAloU1
         u5tJ61Bq6raOK9AZLi9I/TLr+dkfae75zrECPv0V+7t/SlW8uheajB4OFO+o4HtQZPKp
         wb91yansJxC4Dc2KnbUUcshUH/d/OK/eQIEMgQuYsehPBJ68s103BDw7XPpgijmDMB9Y
         0NeqcSllvENaIUuUTyTTiYOSxuCSYPRpYV1SUk7dtZC+DIJckFYA53B42yZ4WslGZHvO
         jQXg==
X-Gm-Message-State: AOJu0YwtuwbWP/9d7Tipz6LuSuesw3ZLdQ6ZWtWiG5Gcr3SD2q7idLuO
	g23+BMD/II2qc97c3E9/Y//DedEk/jCVEw==
X-Google-Smtp-Source: AGHT+IE5EfDXmCQkMf9ZFNUjXRvok4u4XHHS3dAQ/C73RP1L8lZHinfklGaumJJ+qBt2edxUG2kyZQ==
X-Received: by 2002:a0d:ca08:0:b0:58c:9651:8f with SMTP id m8-20020a0dca08000000b0058c9651008fmr14147801ywd.10.1696336466587;
        Tue, 03 Oct 2023 05:34:26 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id g187-20020a8152c4000000b0059f67a72276sm350096ywb.17.2023.10.03.05.34.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:34:26 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59f6041395dso10603697b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:34:26 -0700 (PDT)
X-Received: by 2002:a25:c791:0:b0:d81:6e88:7cb3 with SMTP id
 w139-20020a25c791000000b00d816e887cb3mr13683713ybe.47.1696336465884; Tue, 03
 Oct 2023 05:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230929000704.53217-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230929000704.53217-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Oct 2023 14:34:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdWzK_MRz+NeZ_mx=NcH9_EF-B0At=YsOfOABLV3B9tg@mail.gmail.com>
Message-ID: <CAMuHMdVdWzK_MRz+NeZ_mx=NcH9_EF-B0At=YsOfOABLV3B9tg@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required
 for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_053428_562847_65DF9FED 
X-CRM114-Status: GOOD (  18.96  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMjowN+KAr0FNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEVuYWJsZSB0
aGUgY29uZmlncyByZXF1aXJlZCBieSB0aGUgYmVsb3cgSVAgYmxvY2tzIHdoaWNoIGFyZQo+IHBy
ZXNlbnQgb24gUlovRml2ZSBTb0M6Cj4gKiBBREMKPiAqIENBTkZECj4gKiBETUFDCj4gKiBlTU1D
L1NESEkKPiAqIE9TVE0KPiAqIFJBVkIgKCsgTWljcmVsIFBIWSkKPiAqIFJJSUMKPiAqIFJTUEkK
PiAqIFNTSSAoU291bmQrV004OTc4IGNvZGVjKQo+ICogVGhlcm1hbAo+ICogVVNCIChQSFkvUkVT
RVQvT1RHKQo+Cj4gQWxvbmcgd2l0aCB0aGUgYWJvdmUgc29tZSBjb3JlIGNvbmZpZ3MgYXJlIGVu
YWJsZWQgdG9vLAo+IC0+IENQVSBmcmVxdWVuY3kgc2NhbGluZyBhcyBSWi9GaXZlIGRvZXMgc3Vw
cG9ydCB0aGlzLgo+IC0+IE1URCBpcyBlbmFibGVkIGFzIFJTUEkgY2FuIGJlIGNvbm5lY3RlZCB0
byBmbGFzaCBjaGlwcwo+IC0+IEVuYWJsZWQgSTJDIGNoYXJkZXYgc28gdGhhdCBpdCBlbmFibGVz
IHVzZXJzcGFjZSB0byByZWFkL3dyaXRlCj4gICAgaTJjIGRldmljZXMgKHNpbWlsYXIgdG8gYXJt
NjQpCj4gLT4gVGhlcm1hbCBjb25maWdzIGFzIFJaL0ZpdmUgU29DIGRvZXMgaGF2ZSB0aGVybWFs
IHVuaXQKPiAtPiBHUElPIHJlZ3VsYXRvciBhcyB3ZSBtaWdodCBoYXZlIElQIGJsb2NrcyBmb3Ig
d2hpY2ggdm9sdGFnZQo+ICAgIGxldmVscyBhcmUgY29udHJvbGxlZCBieSBHUElPcwo+IC0+IE9U
RyBjb25maWdzIGFzIFJaL0ZpdmUgVVNCIGNhbiBzdXBwb3J0IGhvc3QvZnVuY3Rpb24KPiAtPiBH
YWRnZXQgY29uZmlncyBzbyB0aGF0IHdlIGNhbiB0ZXN0IFVTQiBmdW5jdGlvbiAoYXMgZG9uZSBp
biBhcm02NAo+ICAgIGFsbCB0aGUgZ2FkZ2V0IGNvbmZpZ3MgYXJlIGVuYWJsZWQpCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4KCkFzIEkgZXhwZWN0IHRoaXMgdG8gZ28gaW4gdGhyb3VnaCB0aGUgUklTQy1W
IHRyZWUsIEkgd2lsbCBsZXQgdGhlClJJU0MtViBwZW9wbGUgaGFuZGxlIGFueSBkaXNjdXNzaW9u
IGFib3V0IG1vcmUgb3B0aW9ucyB0aGF0IHNob3VsZCBiZQptYWRlIG1vZHVsYXIgaW5zdGVhZCBv
ZiBidWlsdGluLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
