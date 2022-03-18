Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CFDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiYAnvA6Qi7UbMbkcH7APrxx8J8gsRHLxbmSyZ6CUCY=; b=TirG9cIWR1CNUD
	gFfIBknuGdXIWD/uL0T2bNo92e0qd+NKLkwBvTBk89Xl1hjA2vemdBgOMc/ZXt9JwDa0N9kPkCaLf
	xayO8LCHhHnbBQrxzBZdsQO3SFbhumQul9qSO1/0268hX19jTAXaJ92qCYNVFKSNtok0GK95BpnoZ
	M6KxXTUXZxGDrjHg8DoRbFC9R5q0rgrDmm8Ob7yDcX1UdGuZMGjrbhQCcxENLJXZOYlqssIJCDo6Y
	EiJbyxQzmvtxC/xmcVUzAMsOYaotPZ1WyIR6tD3LD4M4ivZoIhQBVkygMjCauHHevlhWcRRr0/Fk/
	6CuiuIzZR+ZYJxzSM9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV878-000plN-UM; Fri, 18 Mar 2022 08:37:38 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV86e-000pdE-Og; Fri, 18 Mar 2022 08:37:10 +0000
Received: by mail-qk1-f169.google.com with SMTP id v15so6261733qkg.8;
 Fri, 18 Mar 2022 01:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaaWAx7vW0Ep0uWBl4c9esdINjzMdVYjy0G5NfgIiGQ=;
 b=TZ3QTps1zklYOwxnPDyVpThtqNoqxlEUPpolfiaOYxydlrsoMYV23+AOLllxEy76gt
 UhXqMWQm5+55xesqS9vSqo+b4/AYps9TJHIi4R6Zl8+nPRYoWCfufwZIYym3pALMWDr2
 rdyB+pYTRI//mEq/gn5i0OH1Fk0B1dER8z4aIlOpyBdlPIk0a7gH47mAgCNY18Y88mvz
 wjTBCmuB1pZLgan8M7n1MHyKu57YnpZY3Z2034ufQEYyqLVCF40x6KuZ78eZ96e67KQa
 5TEho+HdQMXdX24o6D59KZuqEUeR5nbg6clutSLHgoeWZNtXpvN/qUDltundo+TkVaQ2
 xN4A==
X-Gm-Message-State: AOAM530pAx2T6EB0bhKjeT5NSIaykoYatgIUy+aB4vxvFdnHnGcNwg1I
 TdayV1RA5ptlNz/jpl1E+yHzFVBesX2/Dgx/
X-Google-Smtp-Source: ABdhPJw5MLu1bQssg6iYg4kfgt6sf3bc76HsYGDuCn9iMCBK/cKCZRTkKwt2bDk5Jd2kJLx59bS9ZA==
X-Received: by 2002:a05:620a:5e:b0:67d:323c:a1fc with SMTP id
 t30-20020a05620a005e00b0067d323ca1fcmr5077515qkt.675.1647592625932; 
 Fri, 18 Mar 2022 01:37:05 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 v5-20020a05622a144500b002e1c7d027b1sm5319698qtx.66.2022.03.18.01.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 01:37:05 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j2so14750333ybu.0;
 Fri, 18 Mar 2022 01:37:05 -0700 (PDT)
X-Received: by 2002:a25:4fc4:0:b0:633:25c8:7d9 with SMTP id
 d187-20020a254fc4000000b0063325c807d9mr9310864ybb.506.1647592615316; Fri, 18
 Mar 2022 01:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-15-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317115705.450427-15-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Mar 2022 09:36:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-oDgiUNhW1hX6n6z3hQhVY7v6WQa9PjnF3wnEC7NTHg@mail.gmail.com>
Message-ID: <CAMuHMdV-oDgiUNhW1hX6n6z3hQhVY7v6WQa9PjnF3wnEC7NTHg@mail.gmail.com>
Subject: Re: [PATCH 16/18] dt-bindings: irqchip: renesas: include generic
 schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, 
 Krzysztof Halasa <khalasa@piap.pl>, Michael Walle <michael@walle.cc>, 
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, 
 Bert Vermeulen <bert@biot.com>, John Crispin <john@phrozen.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, 
 Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-actions@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-oxnas@groups.io
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_013708_857850_B89DEC20 
X-CRM114-Status: GOOD (  15.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 17, 2022 at 12:58 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
