Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CA8C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F666Pc14b9Aew0ZdsVb1sylyWyJ51rBupcL4QeQL4jg=; b=XGhpCK9EY7BSsg
	U2/gfFF4Q5ix/KlEqzuIcWysCfMVpf7YhVFMpWSEJUIHfaJPObqrynCYOPOXgahlQ3Zd3eRG7AczL
	50jlPaYos2J8ryBbk0307Xf6UgQH56TUC+zNzhfwf7uH9RAFm0lRWLnCzckRiPm5S9Xyv3+3xP2kc
	IiBqF4IHhxed3OB0JLjEVJ8aq1xJ2snb92o2e8H6bbVSONWxORzzrhDcQ81W7xBk5oVU+1DPh231c
	EIPAaJ1/MtmCLo3Ln+x8rqbF++vzmh3AqiQZqZXyEWthma4tuiasjyHjRmsfJ+e8f8crPOk+Sja6C
	Lc8b7XOeqxI/UcRWMQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlTG-0000000GCRq-2YJL;
	Tue, 30 Jan 2024 10:36:02 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlTD-0000000GCQh-3DFD
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:36:00 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-602cf7dfeb1so36175607b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610958; x=1707215758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN4By9g1R8VONEj0WkCZM2w34ceTM0wwvtPvj+64KfA=;
        b=bRxBZh5xLjC1k+Yq9l/yZTlG/BxMwn3d+I1hEiTQ/ogc0TDMSBcx1ixTERLTYkDydW
         zvSZY0WBM9kv6n1TeFCc1zMHhvZonAGm/I6zDrZxrqW/WU/N0+xYPczeEA4qAuBMDpia
         ALm9ddXVOvTJUprNNxkyGrF3mEQPy0ViiMzrqEdeeIkmQ6975FZRtTA8OEznh05GHans
         Nz8bZKftSAlAMcSwVk2WyBbT5vMRYquCIWS8dhbf0ca5rT/+o7RPJBJBN0+41RnrOxbQ
         kcPXn3aP9WCFhgDhTCdzanahGoBpQTlUhpkyXM+DyJdYqHatq2m7+XqYZRAjfC4DKVNT
         vRDw==
X-Gm-Message-State: AOJu0YzQFrhMdsu6/LPc9HmRq44cFaJ2GyX3WUEECe3P6FpKfh2/zafX
	iUS0jlg1aHu2tAnJPS6BTp7etINUFaJ4fRrJh+cyG+090YGCD3iTz/jqnJVlOso=
X-Google-Smtp-Source: AGHT+IE1ozR5qi/v5FGKsha2zcebgCAxllR8fh+szbnoJtVtmMaeEgxfP7+UZ6fx1IxGCd1ac/xggQ==
X-Received: by 2002:a81:af06:0:b0:5ff:96a1:c5db with SMTP id n6-20020a81af06000000b005ff96a1c5dbmr5804353ywh.12.1706610957979;
        Tue, 30 Jan 2024 02:35:57 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id d142-20020a0ddb94000000b005e7d8d6e446sm3152940ywe.93.2024.01.30.02.35.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 02:35:57 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-602cf7dfeb1so36175427b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:35:57 -0800 (PST)
X-Received: by 2002:a81:bd50:0:b0:602:9dd4:d717 with SMTP id
 n16-20020a81bd50000000b006029dd4d717mr5032538ywk.49.1706610957362; Tue, 30
 Jan 2024 02:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129135556.63466-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129135556.63466-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 11:35:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbPooCMqyKjTh+uJgAqh=az0+DOQAJYKQ7cuBrxyV1-w@mail.gmail.com>
Message-ID: <CAMuHMdWbPooCMqyKjTh+uJgAqh=az0+DOQAJYKQ7cuBrxyV1-w@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] pinctrl: renesas: rzg2l: Improve code for readability
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_023559_827827_DEB14881 
X-CRM114-Status: GOOD (  18.45  )
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

SGkgUHJhYmhha2FyLAoKT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMjo1NuKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFzIHRoZSBS
Wi9HMkwgcGluY3RybCBkcml2ZXIgaXMgZXh0ZW5zaXZlbHkgdXRpbGl6ZWQgYnkgbnVtZXJvdXMg
U29DcyBhbmQKPiBoYXMgZXhwZXJpZW5jZWQgc3Vic3RhbnRpYWwgZ3Jvd3RoLCBlbmhhbmNlIGNv
ZGUgcmVhZGFiaWxpdHkgYnkKPiBpbmNvcnBvcmF0aW5nIEZJRUxEX1BSRVBfQ09OU1QvRklFTERf
R0VUIG1hY3JvcyB3aGVyZXZlciBuZWNlc3NhcnkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJh
Ymhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpSZXZpZXdl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KaS5lLiB3
aWxsIHF1ZXVlIGluIHJlbmVzYXMtcGluY3RybCBmb3IgdjYuOS4KCj4gLS0tIGEvZHJpdmVycy9w
aW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3Jl
bmVzYXMvcGluY3RybC1yemcybC5jCgo+IEBAIC05MCwxNCArOTMsMTggQEAKPiAgICogKGIgKiA4
KSBhbmQgZiBpcyB0aGUgcGluIGNvbmZpZ3VyYXRpb24gY2FwYWJpbGl0aWVzIHN1cHBvcnRlZC4K
PiAgICovCj4gICNkZWZpbmUgUlpHMkxfU0lOR0xFX1BJTiAgICAgICAgICAgICAgIEJJVCgzMSkK
PiArI2RlZmluZSBSWkcyTF9TSU5HTEVfUElOX0lOREVYX01BU0sgICAgR0VOTUFTSygzMCwgMjQp
Cj4gKyNkZWZpbmUgUlpHMkxfU0lOR0xFX1BJTl9CSVRTX01BU0sgICAgIEdFTk1BU0soMjIsIDIw
KQo+ICsKPiAgI2RlZmluZSBSWkcyTF9TSU5HTEVfUElOX1BBQ0socCwgYiwgZikgKFJaRzJMX1NJ
TkdMRV9QSU4gfCBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
KHApIDw8IDI0KSB8ICgoYikgPDwgMjApIHwgKGYpKQo+IC0jZGVmaW5lIFJaRzJMX1NJTkdMRV9Q
SU5fR0VUX0JJVCh4KSAgICAoKCh4KSAmIEdFTk1BU0soMjIsIDIwKSkgPj4gMjApCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQX0NPTlNUKFJaRzJM
X1NJTkdMRV9QSU5fSU5ERVhfTUFTSywgKHApKSB8IFwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEZJRUxEX1BSRVBfQ09OU1QoUlpHMkxfU0lOR0xFX1BJTl9CSVRT
X01BU0ssIChiKSkgfCBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBGSUVMRF9QUkVQX0NPTlNUKFBJTl9DRkdfTUFTSywgKGYpKSkKPgo+IC0jZGVmaW5lIFJaRzJM
X1BJTl9DRkdfVE9fQ0FQUyhjZmcpICAgICAgICAgICAgICgoY2ZnKSAmIEdFTk1BU0soMTksIDAp
KQo+ICsjZGVmaW5lIFJaRzJMX1BJTl9DRkdfVE9fQ0FQUyhjZmcpICAgICAgICAgICAgICgoY2Zn
KSAmIFBJTl9DRkdfTUFTSykKCkRvIHlvdSBtaW5kIGlmIEkgZHJvcCBSWkcyTF9QSU5fQ0ZHX1RP
X0NBUFMoKSBhbmQgcmVwbGFjZSBpdHMgdHdvCnVzZXJzIGJ5IEZJRUxEX0dFVChQSU5fQ0ZHX01B
U0ssICpwaW5fZGF0YSkgd2hpbGUgYXBwbHlpbmc/Cgo+ICAjZGVmaW5lIFJaRzJMX1BJTl9DRkdf
VE9fUE9SVF9PRkZTRVQoY2ZnKSAgICAgICgoY2ZnKSAmIFJaRzJMX1NJTkdMRV9QSU4gPyBcCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCgoY2ZnKSAm
IEdFTk1BU0soMzAsIDI0KSkgPj4gMjQpIDogXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICgoKGNmZykgJiBHRU5NQVNLKDI2LCAyMCkpID4+IDIwKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRklFTERf
R0VUKFJaRzJMX1NJTkdMRV9QSU5fSU5ERVhfTUFTSywgKGNmZykpIDogXAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9HRVQoUElOX0NGR19Q
SU5fUkVHX01BU0ssIChjZmcpKSkKPgo+ICAjZGVmaW5lIFAob2ZmKSAgICAgICAgICAgICAgICAg
KDB4MDAwMCArIChvZmYpKQo+ICAjZGVmaW5lIFBNKG9mZikgICAgICAgICAgICAgICAgICAgICAg
ICAoMHgwMTAwICsgKG9mZikgKiAyKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
