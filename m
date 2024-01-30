Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8941AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpaWdbDJBEBFZX1aDupFIC8Gt8Zd9b5bQtEYcNil7yQ=; b=M3Sbw0mDjTeaRk
	EE8g/fU4u4eHed4DBGkzhfMiCXPy35SoPidZRAEUbbSsMJxQpBAm7kSeDyx+dPrclOlu2YpmKzXbv
	nU30JcK6dzCrHnwmS+6WsG559ojq+MlQHHJoyh/D3VqSbwkg42BbxSZ5i3jEdohraLnDnY/O5M89D
	tgzxHE3m7ko6UFiemWoet46wuZWvzZWfg5dIQkO9u1Og7JBoQbxEics7GR2f/GU6UrHP7Rz203SC5
	2slFXyhUHDw+n7QRd0foN5ihk+e61t1BzTL+D/YE6yfw2M++CkbMwe7HXDlT5ErVbEcrzYa4rR3uO
	A7qs3rd3kAHV8Kbwv80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmK4-0000000GRkk-3M8a;
	Tue, 30 Jan 2024 11:30:36 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmK2-0000000GRjD-2Cme
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:30:35 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-602cf7dfeb1so36594117b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706614233; x=1707219033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jUIV76EfqiSCLTOlQ3xpsNr/TvqMGBmwC/ORazdxeY=;
        b=gFYCDgVV53narQEs8gFF2zMj3sZHFbV7DWUmLcf6D0XsttJ+7aaoJN3NADOKhnNdeE
         Mgc/FhlFb29T/5CFHd0DdAM+3MRO4VSNtpzn+6rGbjnVisVAXxrzlUAuP1SPW5xdobZA
         UKoFCiMNgD6DKPZdnVtRUYD4WGDlVcZdBgd8SweyXbR8y60RU00b8/A8Kv/T9rAhF6ij
         hmcyxJkyi03ySFESRhaMInFFMaJoYOKgoGI/5+kW3aOg7dLejS/KSBztQ2RXajN5H/Bi
         UoBobl/aFzPvGZGAtG9HENbJf5mpjuY4BkvZG5LXKCdlhk+xj8EA7jEty0F9Bd9tUivL
         jfGg==
X-Gm-Message-State: AOJu0Yw/Pzh4nC4rP+be0z/K9O4OtrtTKJNcc7mNXDczO/JUsFVboX8H
	PqSLoad/bl6+ObCXREp8cTbUNaRl8FX7354cLexJXnxGN15IS7H1cpUsqDFXbiE=
X-Google-Smtp-Source: AGHT+IGsgjKTc7tFfATqScEDvWRg5j+y3D3l7VVunXm1xgx7B4kpvLF8rr7AiQAiOd2ODAoSdjh7kA==
X-Received: by 2002:a81:5304:0:b0:5ff:63ae:4f56 with SMTP id h4-20020a815304000000b005ff63ae4f56mr4027328ywb.17.1706614233072;
        Tue, 30 Jan 2024 03:30:33 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id t16-20020a818310000000b005ff9b0ab578sm3149540ywf.117.2024.01.30.03.30.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:30:32 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-602ab446cd8so37759887b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:30:32 -0800 (PST)
X-Received: by 2002:a81:af21:0:b0:600:2710:1e51 with SMTP id
 n33-20020a81af21000000b0060027101e51mr5585278ywh.13.1706614232794; Tue, 30
 Jan 2024 03:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129151618.90922-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129151618.90922-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 12:30:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAuvR55NZtq-0N32kh-W9X5V30mA4bzkqER=kGdsb_eA@mail.gmail.com>
Message-ID: <CAMuHMdXAuvR55NZtq-0N32kh-W9X5V30mA4bzkqER=kGdsb_eA@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: dts: renesas: rzfive-smarc-som: Drop deleting
 interrupt properties from ETH0/1 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_033034_601595_C955E831 
X-CRM114-Status: GOOD (  14.65  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxNuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IE5vdyB0aGF0IHdlIGhhdmUgZW5hYmxl
ZCBJUlFDIHN1cHBvcnQgZm9yIFJaL0ZpdmUgU29DIHN3aXRjaCB0byBpbnRlcnJ1cHQKPiBtb2Rl
IGZvciBldGhlcm5ldDAvMSBQSFlzIGluc3RlYWQgb2YgcG9sbGluZyBtb2RlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
