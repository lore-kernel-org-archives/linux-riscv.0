Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A1AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruQux+9g0q/L9tNdY1L9Gnrgn18txZiBTU8FcaoQ2SA=; b=N3e6sOfBOMenlA
	jKaOxWX643qEB8UTZqy/De++lH6PFC/UhAC2ftYJNSDriBcEBLUMkeaX5Qg8i2vTmUfwwRfpEaitD
	APtzBzqTxQDXMBwFLdqM1FgxO/94vOkpQaZj/F94MXT8mzx7A6XnTw2bgYCIfepVRt46NPaqOK2VP
	vUqwTNe3Gx1iG8tGuXyil1R8pRJwFsLExjYWQU6QgWcU6GJ+6cbffUWxQIzWVuRZzVZJ7ulj07xSe
	UuDoMZIZ9n1+EgdmDKEsOddYjfh7ag2pLoGnD54seOd950nqYmxvSAi44qq7NLQEZIRKfzQ7CVCCG
	2U+DvOv8qbzRbGc8T0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlVL-0000000GDk3-2RM5;
	Tue, 30 Jan 2024 10:38:11 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlUS-0000000GD73-0Ejs
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:37:17 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ff7ec8772dso39741427b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611034; x=1707215834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19lEWnW+fTM5E0eE3+Mc9J8ZaYPIteOuYV4JI4QwkRc=;
        b=ltnvFltVwxrmaHsDUMoKQKv2bdamirLw4Ld491+wjcY2zHYx5QO0AVP32QCHl52EmU
         rTCoIGOFC/hDVgA0g0RjwJpnWx+/gQDhZoxnd8jnuaOoBZdnjdCkHM+ZhB9KeWgwvoYo
         U9fSZ7+mQlaOeWNv3tri7zDcxH8s0zWcxzSbX4iNqyQkSSs5CxRRLfyULpLYjBG1/ofo
         AeB9bxby1TfXuniDYvq2KfBPI/vcKHjSEEekTomAeaAThTkDs7zAyJHNIMo7I77memXS
         AmILm9OyEQu6snLCuVoS2Bm1jMw9U4omgaGwmVJ/MTzFFO381MxX5/zFj94ADL4hjwu9
         regw==
X-Gm-Message-State: AOJu0YxtVF90mfxZzjybnlkuiP4ANaRM6BoA9g/+wTAUoZw5dxtpFE94
	RGCFJA1MvBzDXfRPR55E5y+/83F+YRpvd4lVE8Gnldh/RrO0dKLcDoRBICi4eUo=
X-Google-Smtp-Source: AGHT+IHkKf7YGckaDgs1SgwWfpWgj7OSX++EMPfhPBP5dYoXL5yBbUTOv5DF2GmncX178oYCXS/+8Q==
X-Received: by 2002:a0d:df0f:0:b0:5ff:48fc:94f8 with SMTP id i15-20020a0ddf0f000000b005ff48fc94f8mr6284396ywe.39.1706611034328;
        Tue, 30 Jan 2024 02:37:14 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id q131-20020a819989000000b00600392410ffsm3148548ywg.73.2024.01.30.02.37.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 02:37:14 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-603e086c05bso17087267b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:37:14 -0800 (PST)
X-Received: by 2002:a05:690c:3508:b0:5ed:a4e8:510 with SMTP id
 fq8-20020a05690c350800b005eda4e80510mr7143838ywb.14.1706611033979; Tue, 30
 Jan 2024 02:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129135556.63466-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129135556.63466-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 11:37:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9XEPQGxtVVT46H8QskFOAcYYjE3qve21EaBcTCpRAMg@mail.gmail.com>
Message-ID: <CAMuHMdX9XEPQGxtVVT46H8QskFOAcYYjE3qve21EaBcTCpRAMg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing
 port pins P19 to P28
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
X-CRM114-CacheID: sfid-20240130_023716_215328_C2A44521 
X-CRM114-Status: GOOD (  17.60  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMjo1NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFkZCB0aGUgbWlzc2luZyBwb3J0IHBp
bnMgUDE5IHRvIFAyOCBmb3IgUlovRml2ZSBTb0MuIFRoZXNlIGFkZGl0aW9uYWwKPiBwaW5zIHBy
b3ZpZGUgZXhwYW5kZWQgY2FwYWJpbGl0aWVzIGFuZCBhcmUgZXhjbHVzaXZlIHRvIHRoZSBSWi9G
aXZlIFNvQy4KPgo+IENvdXBsZSBvZiBwb3J0IHBpbnMgaGF2ZSBkaWZmZXJlbnQgY29uZmlndXJh
dGlvbiBhbmQgYXJlIG5vdCBpZGVudGljYWwgZm9yCj4gdGhlIGNvbXBsZXRlIHBvcnQgc28gaW50
cm9kdWNlIHN0cnVjdCByemcybF92YXJpYWJsZV9waW5fY2ZnIHRvIGhhbmRsZQo+IHN1Y2ggY2Fz
ZXMgYW5kIGludHJvZHVjZSB0aGUgUElOX0NGR19WQVJJQUJMRSBtYWNyby4gVGhlIGFjdHVhbCBw
aW4gY29uZmlnCj4gaXMgdGhlbiBhc3NpZ25lZCBpbiByemcybF9waW5jdHJsX2dldF92YXJpYWJs
ZV9waW5fY2ZnKCkuCj4KPiBBZGQgYW4gYWRkaXRpb25hbCBjaGVjayBpbiByemcybF9ncGlvX2dl
dF9ncGlvaW50KCkgdG8gb25seSBhbGxvdyBHUElPIHBpbnMKPiB3aGljaCBzdXBwb3J0IGludGVy
cnVwdCBmYWNpbGl0eS4KPgo+IFdoaWxlIGF0IGRlZmluZSBSWkcyTF9HUElPX1BPUlRfUEFDSygp
IHVzaW5nIFJaRzJMX0dQSU9fUE9SVF9TUEFSU0VfUEFDSygpLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoK
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
CmkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLXBpbmN0cmwgZm9yIHY2LjkuCgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
