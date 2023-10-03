Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DCE75452
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2Y16ng40YOjDU9IBJHBH2MgfDgwpW6QayIRJDKeieY=; b=Chqt6+3rfD7nR2
	5sdTRIF+2DCKWOr02zr3QDTHwl2cBclfm8V0s+awK9mTzseb5lGlvdTo1fez2h8MEU3FWhVuVbP/E
	y6Ylz3xaIIctAXroOU97JaeqT2Bej/sXZFzjA/502kVcTNUdyYItUI15rf71HvJ/xyhjabCOHuMgY
	a7C2actyUjZD2vcd3h1cdmP4ItYZvLWYBNfWF3/FIJr65nhUxBhWSeNBGDQREpFLfKepUU0FrTcho
	ufFj4mottfUllSlr60fN1Ow/LF6v1/rI9vFVaB7BVP4CPIkfqzGX+IiN9cQC2R0dP/4DORvPxDqcv
	siuwoy2TIBQaKuPcUzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneRe-00EbnD-2E;
	Tue, 03 Oct 2023 12:24:10 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneRb-00EbmT-0I
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:24:08 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59c268676a9so10583807b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335844; x=1696940644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbgVutEnkgEx27MAC0tB+cw33CIkZ02T6S63P3EhqRg=;
        b=KuCAEFpDTXOQCJ1Vi+ChCESrGsFd5P0yD0on1PVxgWMlzxtHF2rN6oe64KUfniEYNt
         pDPrQxu1wbmkNlS5GsJqFl+WbJH08X+5To+8F4cT7CEZSuL/oXacOOcDHhqnidqfPJiZ
         i+tnZoghwA8MMrTwD3xtfbP1YBOyIkCagQODTG7Z2LMCM+5PLOlNZPBOYmO9Pl9hE3Bm
         +9PBtalE/WM//FGZXDEPfGMBa+T9FifKZlxH7IYXNyOP6AJSHjtWSJJLj5pKLAZpiAFX
         7zsAztQBwVlXuhRl7qVphiVsSBXJy/Ynfy8IRmElb9/M/GMybq4O6qSCyjcT5HwhhF0a
         yPpg==
X-Gm-Message-State: AOJu0Yzho59Dp1v15e/X5yKR94zcfY2BZIXLJiLpCqFggxcvD/leNgH8
	nLjrpfO6zJPEwgvOxPUfnLGG4/hy99CTqw==
X-Google-Smtp-Source: AGHT+IGG/XjBx62wKlU04wxjh3wIC2ZdrN9iDa1zwpHjjbQld5Nx7swEQeGMZCnkSHI3LyDR1PCjzA==
X-Received: by 2002:a81:c20f:0:b0:59a:ef7f:5c67 with SMTP id z15-20020a81c20f000000b0059aef7f5c67mr14642796ywc.31.1696335844156;
        Tue, 03 Oct 2023 05:24:04 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id o19-20020a81de53000000b005925765aa30sm331827ywl.135.2023.10.03.05.24.03
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:24:03 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59bc956b029so10346147b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:24:03 -0700 (PDT)
X-Received: by 2002:a81:5b02:0:b0:59b:2be2:3560 with SMTP id
 p2-20020a815b02000000b0059b2be23560mr13292322ywb.48.1696335843190; Tue, 03
 Oct 2023 05:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230929000704.53217-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230929000704.53217-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Oct 2023 14:23:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWizNPWTdAkBTbmaDbPWNT9w14r2=oBhMeq_DNBdcuQjQ@mail.gmail.com>
Message-ID: <CAMuHMdWizNPWTdAkBTbmaDbPWNT9w14r2=oBhMeq_DNBdcuQjQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: dts: renesas: r9a07g043f: Add L2 cache node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_052407_152830_E08DCE03 
X-CRM114-Status: GOOD (  14.52  )
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

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMjowN+KAr0FNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFkZCBMMiBjYWNoZSBub2RlIGZvciBS
Wi9GaXZlIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgppLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNh
cy1kZXZlbCBmb3IgdjYuNy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
