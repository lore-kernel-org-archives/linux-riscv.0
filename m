Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A67C6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27OW5gPVTnXMU841FBCsWEw5fckaIFIUBPVtzZ7gGRc=; b=sCVS6zwYU6iPTx
	Y+HPPlj3TyukHCH9UQWS+2cle+ZjzP4LjHkMZmmCWPlGGsFvIxCvg2Lxha+7UBDIHysg2sYxec6Le
	SbJDv4gdde0mcqdR5TE8igPONdFy1YO9SRrCU19ogOIN/p5XRVsY4wfA9rJjpA7asDTHETOvINJGL
	YgLLV1djLa8q3XhAEPOULDhg4t4ydhRXYYrlcRAtqBNNfl6Cc7Iv+8pKyFxjXSedviP6Ux1s7xL2P
	f7/5pGpLEe9NEOxGG5Yf55CeDf8UGum4C2l65IOUeJLlPUlpK/yd/KNwnU10vmJZ07RUotNMKHouE
	okZKud3aIIm8IbyPa2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9K5-006BL5-25;
	Fri, 31 Mar 2023 07:37:21 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9K2-006BKH-2U
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:37:19 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-544f7c176easo400183357b3.9
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 00:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMCPBKqa5X7qdxmutmPXldx9K7gy/4RLJ6RttIJMQZE=;
        b=gTh+s4wHtovfOYrQ43hAM3ijqT5JvbkfnZDq/Un1iY7REKgQQ1a5VOpkM1kBirfp3p
         Pw7XMbfrXqHZ74y9QzYRGhWmHtHxX9sFdY3hVKI74QuUa0XMCZIbR1R/1IkoJZTsbJTX
         /AvfoWWCs79xWIBUglQz5gp9uz9cwqeRiVr8IE03+QnIpLSu7zGnRQzZOtAXYWtwrmla
         TUPie66QI2141bC/u0bGF3/Q7Yg/QLK4vnsnSIghgwKcR12BGGiY/I/hIv7NZlyhQB/g
         WrA2gCr0aQr0RacoeOvV9C5pb3aQWU+t7Ed0Lwf8mycZhyLUeYpWD66uJcZkKbBM3AQm
         v0iw==
X-Gm-Message-State: AAQBX9cqsYhsyN5xXPt+pQfG0QaP6BtdZB+luH2LGFXn64DeztMfBwyn
	UsnrIgk8iwcBC7P1pH++jMgb87pHjAqhf9PH
X-Google-Smtp-Source: AKy350a2f0MnRMD18fsexdgST9DzwIteBKf7i1K0Yu1SppOr0jsqm8Im0wXyWvVX0K73s1Ff5W+wnQ==
X-Received: by 2002:a0d:e80d:0:b0:541:a219:2b61 with SMTP id r13-20020a0de80d000000b00541a2192b61mr22917578ywe.35.1680248236967;
        Fri, 31 Mar 2023 00:37:16 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 75-20020a810a4e000000b00545a0818481sm377178ywk.17.2023.03.31.00.37.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 00:37:15 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id p203so26395481ybb.13
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 00:37:15 -0700 (PDT)
X-Received: by 2002:a25:24c3:0:b0:a02:a3a6:78fa with SMTP id
 k186-20020a2524c3000000b00a02a3a678famr13492502ybk.12.1680248235245; Fri, 31
 Mar 2023 00:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230330204217.47666-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230330204217.47666-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Mar 2023 09:37:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWz=Vf1svs3TJrCSq8ED0rEy-NURQ++bUspo73zfct50A@mail.gmail.com>
Message-ID: <CAMuHMdWz=Vf1svs3TJrCSq8ED0rEy-NURQ++bUspo73zfct50A@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] soc: renesas: Kconfig: Select the required configs
 for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_003718_809403_F12012C1 
X-CRM114-Status: GOOD (  13.59  )
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

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMTA6NDLigK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBFeHBsaWNpdGx5IHNlbGVjdCB0aGUg
cmVxdWlyZWQgQ2FjaGUgbWFuYWdlbWVudCBhbmQgRXJyYXRhIGNvbmZpZ3MKPiByZXF1aXJlZCBm
b3IgdGhlIFJaL0ZpdmUgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+IFJldmlld2VkLWJ5OiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
