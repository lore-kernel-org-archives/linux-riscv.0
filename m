Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03025C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzPoBimnyFSkA84ubIIw5Ok5zbbk/ySAvCGmglGdox8=; b=eHsCJx7SNnO8bX
	D2EBDahSlEJ7ZRin/aRLdLWUJ+iItg0bPUPvANtsFRpR1ktU6VjkacwNKklczL3XroxF8pd9HqRFG
	2+ODfkDdUJisn5AMmeAcU7s+J+PLCMQ0NHWLe3d1SNs6IE50PGSjLHXR2Y/vPbm7YdtCtRVuJcOng
	JC7FAZoPMmCmii8lFdqK+nXveyZxII/LlMFk91E8uaxnLutpJRFAnJ8RuU0KCs+AAwXhBglRjiGxp
	n3Z5Np0uridIAFIFQSrxG+Fm1IUHTBYjSwStLmNTkq0X5VNmKNeKqWTkAGkiYZcQm2PP5P/+lzapH
	3oPxKq7PnfkJaEhUkaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbqZ-007ZEX-31;
	Tue, 02 Jan 2024 10:18:07 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbqX-007ZDj-26
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 10:18:07 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5f00bef973aso24299177b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 02:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704190682; x=1704795482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5DxLXP6EyqotRgw2MuRFibbW2LOWQylrBdAXWNwj0E=;
        b=nZKfwLCnZ8+AhDPzZsokM72P1b/FMU9e3rZYb0eYlvvOLIDx2z0/uHC3wxXUnSSduJ
         7TqqFNif7LDw7I6PVxiAEyL/tQ6GzdjIiP9sihyKq9jaM+xIcVQz1MLYnp2SmQFZYQ69
         yqOVISaPJKcBTil19QBatsllZHykjPdvQpROgfQ3KzdZpeWfaP8Td+X9OC92DM6jgJJB
         ZIFSiE/hmN7oodq09KnEU8WUCUavwovTPymBfE5lgYlaTXyaFWi8vrQ0UJhPHwDgEgGx
         O4z8TUrcjMzUh+XZIyrN2vKJafqc1Ci2N6cRwUMMnROnaOnW1nkQwdv+9eJBynugGlxl
         +wDg==
X-Gm-Message-State: AOJu0YxY+E7cJ0Q5aKRxl55OxaOLcTTUExhGDy5WQUWGAiwRYD5zubWN
	iLdipr1r8HhNqL4YBVfuvmhIN6W++qfodA==
X-Google-Smtp-Source: AGHT+IHang2yL3VpyUspf4Hj7oTROfVPCvfto2P5S9C/QYX5KgIIr1924hZDAfbr62wVg/XEAZuf7Q==
X-Received: by 2002:a81:ac57:0:b0:5ea:3844:7c97 with SMTP id z23-20020a81ac57000000b005ea38447c97mr9816119ywj.54.1704190682174;
        Tue, 02 Jan 2024 02:18:02 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id a128-20020a0df186000000b005c5a08c5c15sm11989563ywf.136.2024.01.02.02.18.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:18:01 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5eefd0da5c0so35964607b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 02:18:01 -0800 (PST)
X-Received: by 2002:a0d:c383:0:b0:5d8:e267:78e5 with SMTP id
 f125-20020a0dc383000000b005d8e26778e5mr12357254ywd.61.1704190681747; Tue, 02
 Jan 2024 02:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com> <CA+V-a8tTWf8Kx-Ex=DPsSR2ZWHC29N_pAoEZN1sR5Nqobf139A@mail.gmail.com>
In-Reply-To: <CA+V-a8tTWf8Kx-Ex=DPsSR2ZWHC29N_pAoEZN1sR5Nqobf139A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2024 11:17:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXosvV=EuRtL69r6=UT0SO8Aq-XjWwJMJQpWAhT2z+ffA@mail.gmail.com>
Message-ID: <CAMuHMdXosvV=EuRtL69r6=UT0SO8Aq-XjWwJMJQpWAhT2z+ffA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_021805_693677_684E7834 
X-CRM114-Status: GOOD (  38.88  )
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

SGkgUHJhYmhha2FyLAoKT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6MDTigK9QTSBMYWQsIFBy
YWJoYWthcgo8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgRGVj
IDYsIDIwMjMgYXQgMToxM+KAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgMSwgMjAyMyBhdCAyOjE24oCvUE0gUHJhYmhh
a2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IEZyb206IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4K
PiA+ID4gQ3VycmVudGx5IHdlIGFzc3VtZSBhbGwgdGhlIHBvcnQgcGlucyBhcmUgc2VxdWVudGlh
bCBpZSBhbHdheXMgUFhfMCB0bwo+ID4gPiBQWF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24gUlov
Rml2ZSBTb0Mgd2UgaGF2ZSBhZGRpdGlvbmFsIHBpbnMgUDE5XzEgdG8KPiA+ID4gUDI4XzUgd2hp
Y2ggaGF2ZSBob2xlcyBpbiB0aGVtLCBmb3IgZXhhbXBsZSBvbmx5IG9uZSBwaW4gb24gcG9ydDE5
IGlzCj4gPiA+IGF2YWlsYWJsZSBhbmQgdGhhdCBpcyBQMTlfMSBhbmQgbm90IFAxOV8wLiBTbyB0
byBoYW5kbGUgc3VjaCBjYXNlcwo+ID4gPiBpbmNsdWRlIHBpbm1hcCBmb3IgZWFjaCBwb3J0IHdo
aWNoIHdvdWxkIGluZGljYXRlIHRoZSBwaW4gYXZhaWxhYmlsaXR5Cj4gPiA+IG9uIGVhY2ggcG9y
dC4gQXMgdGhlIHBpbmNvdW50IGNhbiBiZSBjYWxjdWxhdGVkIGJhc2VkIG9uIHBpbm1hcCBkcm9w
IHRoaXMKPiA+ID4gZnJvbSBSWkcyTF9HUElPX1BPUlRfUEFDSygpIG1hY3JvIGFuZCB1cGRhdGUg
UlpHMkxfR1BJT19QT1JUX0dFVF9QSU5DTlQoKQo+ID4gPiBtYWNyby4KPiA+ID4KPiA+ID4gUHJl
dmlvdXNseSB3ZSBoYWQgYSBtYXggb2YgNyBwaW5zIG9uIGVhY2ggcG9ydCBidXQgb24gUlovRml2
ZSBQb3J0LTIwCj4gPiA+IGhhcyA4IHBpbnMsIHNvIG1vdmUgdGhlIHNpbmdsZSBwaW4gY29uZmln
dXJhdGlvbiB0byBCSVQoNjMpLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhh
a2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPgo+ID4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQo+ID4KPiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yemcybC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3Bp
bmN0cmwtcnpnMmwuYwo+ID4gPiBAQCAtODAsMTUgKzgwLDE3IEBACj4gPiA+ICAgKiBuIGluZGlj
YXRlcyBudW1iZXIgb2YgcGlucyBpbiB0aGUgcG9ydCwgYSBpcyB0aGUgcmVnaXN0ZXIgaW5kZXgK
PiA+ID4gICAqIGFuZCBmIGlzIHBpbiBjb25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0
ZWQuCj4gPiA+ICAgKi8KPiA+ID4gLSNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwg
ZikgICgoKG4pIDw8IDI4KSB8ICgoYSkgPDwgMjApIHwgKGYpKQo+ID4gPiAtI2RlZmluZSBSWkcy
TF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSAgKCgoeCkgJiBHRU5NQVNLKDMwLCAyOCkpID4+IDI4
KQo+ID4gPiArI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfUEFDSyhuLCBhLCBmKSAgKCgobikgPiAw
ID8gKCh1NjQpKEdFTk1BU0tfVUxMKCgobikgLSAxICsgMjgpLCAyOCkpKSA6IDApIHwgXAo+ID4K
PiA+IFRoZSBtYXNrIGNyZWF0aW9uIGNhbiBiZSBzaW1wbGlmaWVkIHRvCj4gPgo+ID4gICAgICgo
MVVMTCA8PCAobikpIC0gMSkgPDwgMjgKPiA+Cj4gT0suCj4KPiA+IGJ1dCBzZWUgYmVsb3cuLi4K
PiA+Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKChhKSA8
PCAyMCkgfCAoZikpCj4gPiA+ICsjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9HRVRfUElOTUFQKHgp
ICAoKCh4KSAmIEdFTk1BU0tfVUxMKDM1LCAyOCkpID4+IDI4KQo+ID4gPiArI2RlZmluZSBSWkcy
TF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSAgKGh3ZWlnaHQ4KFJaRzJMX0dQSU9fUE9SVF9HRVRf
UElOTUFQKCh4KSkpKQo+ID4KPiA+IEkgdGhpbmsgd2UndmUgcmVhY2hlZCB0aGUgcG9pbnQgd2hl
cmUgaXQgd291bGQgYmUgZWFzaWVyIGZvciB0aGUKPiA+IGNhc3VhbCByZXZpZXdlciB0byAjZGVm
aW5lIFBJTl9DRkdfKl9NQVNLIGZvciBhbGwgZmllbGRzLCBhbmQgdXNlCj4gPiBGSUVMRF97UFJF
UCxHRVR9KCkgdG8gcGFjayByZXNwLiBleHRyYWN0IHZhbHVlcy4gIFRoYXQgd291bGQgYWxzbwo+
ID4gbWFrZSBpdCBtb3JlIG9idmlvdXMgd2hpY2ggYml0cyBhcmUgaW4gdXNlLCBhbmQgaG93IG1h
bnkgYml0cyBhcmUKPiA+IHN0aWxsIGF2YWlsYWJsZSBmb3IgZnV0dXJlIHVzZS4KPiA+Cj4gSWYg
SSB1c2UgdGhlIEZJRUxEX1BSRVAoKSBtYWNybyBsaWtlIGJlbG93IEkgZ2V0IGJ1aWxkIGlzc3Vl
cyBhcyBiZWxvdzoKPgo+ICNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BJTl9DTlRfTUFTSyAgICBH
RU5NQVNLKDMxLCAyOCkKPiAjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QSU5fUkVHX01BU0sgICAg
R0VOTUFTSygyNywgMjApCj4gI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfUElOX0NGR19NQVNLICAg
IEdFTk1BU0soMTksIDApCj4gI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfUEFDSyhuLCBhLCBmKQo+
IEZJRUxEX1BSRVAoUlpHMkxfR1BJT19QT1JUX1BJTl9DTlRfTUFTSywgbikgfCBcCj4gICAgICAg
ICAgICAgICAgICAgICBGSUVMRF9QUkVQKFJaRzJMX0dQSU9fUE9SVF9QSU5fUkVHX01BU0ssIGEp
IHwgXAo+ICAgICAgICAgICAgICAgICAgICAgRklFTERfUFJFUChSWkcyTF9HUElPX1BPUlRfUElO
X0NGR19NQVNLLCBmKQo+Cj4KPiBkcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJs
LmM6OTE6NDE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgo+IG1hY3JvICdGSUVMRF9QUkVQJwo+ICAg
IDkxIHwKPiBGSUVMRF9QUkVQKFJaRzJMX0dQSU9fUE9SVF9QSU5fQ0ZHX01BU0ssIGYpCj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+
IGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYzoxNDg2Ojk6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZgo+IG1hY3JvICdSWkcyTF9HUElPX1BPUlRfUEFDSycKPiAgMTQ4NiB8ICAg
ICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soNiwgMHgyYSwKPiBSWkczU19NUFhFRF9QSU5fRlVO
Q1MoQSkpLCAgICAgICAgICAgICAgICAgICAgICAgIC8qIFAxOCAqLwo+ICAgICAgIHwgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+Cj4gRG8geW91IGhhdmUgYW55IHBvaW50ZXJzPwoKWW91
IGxlZnQgb3V0IHRoZSBhY3R1YWwgZXJyb3IgOi0oCgppbmNsdWRlL2xpbnV4L2JpdGZpZWxkLmg6
MTEzOjk6IGVycm9yOiBicmFjZWQtZ3JvdXAgd2l0aGluIGV4cHJlc3Npb24KYWxsb3dlZCBvbmx5
IGluc2lkZSBhIGZ1bmN0aW9uCiAgMTEzIHwgICAgICAgICAoewogICAgICAgICBcCiAgICAgIHwg
ICAgICAgICBeCmRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYzo5MzozOTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mCm1hY3JvIOKAmEZJRUxEX1BSRVDigJkKICAgOTMgfCAjZGVm
aW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLKG4sIGEsIGYpCkZJRUxEX1BSRVAoUlpHMkxfR1BJT19Q
T1JUX1BJTl9DTlRfTUFTSywgbikgfCBcCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+CmRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwt
cnpnMmwuYzoxNTU1Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgptYWNybyDigJhSWkcyTF9HUElP
X1BPUlRfUEFDS+KAmQogMTU1NSB8ICAgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMiwgMHgx
MCwgUlpHMkxfTVBYRURfUElOX0ZVTkNTKSwKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+CgpVc2luZyBGSUVMRF9QUkVQX0NPTlNUKCkgaW5zdGVhZCBtYWtlcyBpdCBidWlsZC4K
Ci8qKgogKiBGSUVMRF9QUkVQX0NPTlNUKCkgLSBwcmVwYXJlIGEgY29uc3RhbnQgYml0ZmllbGQg
ZWxlbWVudAogKiBAX21hc2s6IHNoaWZ0ZWQgbWFzayBkZWZpbmluZyB0aGUgZmllbGQncyBsZW5n
dGggYW5kIHBvc2l0aW9uCiAqIEBfdmFsOiAgdmFsdWUgdG8gcHV0IGluIHRoZSBmaWVsZAogKgog
KiBGSUVMRF9QUkVQX0NPTlNUKCkgbWFza3MgYW5kIHNoaWZ0cyB1cCB0aGUgdmFsdWUuICBUaGUg
cmVzdWx0IHNob3VsZAogKiBiZSBjb21iaW5lZCB3aXRoIG90aGVyIGZpZWxkcyBvZiB0aGUgYml0
ZmllbGQgdXNpbmcgbG9naWNhbCBPUi4KICoKICogVW5saWtlIEZJRUxEX1BSRVAoKSB0aGlzIGlz
IGEgY29uc3RhbnQgZXhwcmVzc2lvbiBhbmQgY2FuIHRoZXJlZm9yZQogKiBiZSB1c2VkIGluIGlu
aXRpYWxpemVycy4gRXJyb3IgY2hlY2tpbmcgaXMgbGVzcyBjb21mb3J0YWJsZSBmb3IgdGhpcwog
KiB2ZXJzaW9uLCBhbmQgbm9uLWNvbnN0YW50IG1hc2tzIGNhbm5vdCBiZSB1c2VkLgogKi8KCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
