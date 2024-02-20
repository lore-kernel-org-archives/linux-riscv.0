Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87856C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hnr5472Z/QpsDuU1MI47o/6bn99TX9sui8hhHGCgJiY=; b=nU+474gNC7ZCmm
	kOybcCiTtsv/RSHFpaR3gDjzJHSc3rqMN4tT+hpynIzKUdwu8albHccoMAqoQL5FObti2Bfka7LjT
	XzUj4qqEeKx0bZ5L/UB7A2bah+zAz5J/X/SvhQc4CXaBY0K9CscMpROuc8XTndR/P50QeUE59WS54
	leh1piX9HeiuqU8H8FiSbnc5wZYzZ4vSzx3zZjuTBcirnmxeEJiUZYNPF0KPbz7LO4dTuphCVGgi9
	jx/kqTMmKqLzWtHG+9ArthStjD3uXnsJ4z3N9XJqnbVB7ue9Q+O6Ii7vrqoE6pPrhHfSQemCGr52t
	GpUYtXqti8YiYfReHAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVqo-0000000Fy8x-1ee4;
	Tue, 20 Feb 2024 19:32:22 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVql-0000000Fy7r-3Vjn
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 19:32:21 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso4419269276.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 11:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708457536; x=1709062336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8GTO+lAF2fk+HfBG0cHdMNOcQxsEjyIPCBMHPyZPUI=;
        b=HPU8B7iCYits16ZGiHMLDNYzxNfFBp5NiHUXDKSUxLO67CIDH50aUF3S4RBQaxcs8L
         Ve/TS9uLQJC/BGCaOiiURj0sv6HMVGAnrIZbbcKrlNJHyD0NDRVbsW7ACaduFLAi7fgN
         1e7y71QmEMN1z/SbjoMLLw530ZH4Jqqm/TZsasY5q17tW4gI1e+Wh1h3f3tINgEtZgjA
         uE0IDDuE1RqtBXq06XDHz+JRz3UT3hSMQ0g1oFMmGQ7ApgKNH/6xk6GHYwSx7bTkMIDS
         vyfcVhaXi7YrdLCeejoWkEA2oJQ0zWiHheuUlAeT1x9CCHrxRq7FJosWHapyp7OzrW1R
         U1bw==
X-Forwarded-Encrypted: i=1; AJvYcCVTKi9yW7Dft9bAeKjum3mbYVr1J0Rta+IJuRDHmdKRYLV06Q2ud9Zk9Nnk2sBtxrGAMtqOVPMfBNDGYjIy4MC1tWLL4ktXyJgfaFyGHZ3a
X-Gm-Message-State: AOJu0YwKQ6jY4IgCtvspts+XZHGysPQh7tokGMa7kxmrWtyABZ+f+gRe
	/j810xED2/McuFC1IxJ+CW+VzqqrnPnX0VGYDTNcPhQrwulNnUz9DmnJRoILDIo=
X-Google-Smtp-Source: AGHT+IHv6WJmPffVGNLm5NW66rhvtVMWZr29WjcPvEA77WKMrmA+M7IXUFYnyrfhjDqJ48RW6tDH9Q==
X-Received: by 2002:a25:b04d:0:b0:dcc:aa1f:af3c with SMTP id e13-20020a25b04d000000b00dccaa1faf3cmr12934423ybj.40.1708457535598;
        Tue, 20 Feb 2024 11:32:15 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id t15-20020a25ba0f000000b00dc6f4c19d93sm2022949ybg.7.2024.02.20.11.32.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 11:32:14 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6085b652fc8so14529637b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 11:32:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQfFikB/Wwy6dFNabcfD/9gyAinlgm14a1MFg40ePoQ5pNSSSE5QVz8FLj2Q7yAffw0DY+O1Ar5gvP+Cz3qTyO+Yj4Okur+9UveOa0dOv5
X-Received: by 2002:a81:9817:0:b0:607:87cd:9394 with SMTP id
 p23-20020a819817000000b0060787cd9394mr12513129ywg.11.1708457534400; Tue, 20
 Feb 2024 11:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 20:32:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+WRJLLH4zUvAnsfNtgUxsNGe1bCKLu+98BC6K0d6Rgg@mail.gmail.com>
Message-ID: <CAMuHMdU+WRJLLH4zUvAnsfNtgUxsNGe1bCKLu+98BC6K0d6Rgg@mail.gmail.com>
Subject: Re: [PATCH 07/17] clk: renesas: rzg2l: Extend power domain support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_113219_893634_BCD8E6D4 
X-CRM114-Status: GOOD (  13.16  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNh
cy9yemcybC1jcGcuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMKCj4g
K3N0YXRpYyBzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKgo+ICtyemcybF9jcGdfcG1fZG9tYWlu
X3hsYXRlKHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKnNwZWMsIHZvaWQgKmRhdGEpCgpBcyBvZiBj
b21taXQgNGQwODI0NjA4YTYzNmI2NCAoInBtZG9tYWluOiBjb3JlOiBjb25zdGlmeSBvZl9waGFu
ZGxlX2FyZ3MKaW4geGxhdGUiKSBpbiBuZXh0LTIwMjQwMjE1IGFuZCBsYXRlciB0aGUgZmlyc3Qg
cGFyYW1ldGVyIG5lZWRzIHRvCmJlIGNvbnN0LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
