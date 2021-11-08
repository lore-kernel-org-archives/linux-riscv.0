Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535B3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AE06120D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16AE06120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ds97yMTgje5zwFV6kMUKkty/GUWEgM0zuwLR5AzOp0I=; b=rt5NaIQRJRb244
	CRvZ6OMH5eFo217uIFJVu30Dqdpa4vBf0FBnzFRAnBm6z5Rrt0T0g80EFYcvKBPUu9fYP3Ge5vbuw
	Xy9iNAljjBRkuCvMo9JNVlvf1nIQRS1/fN0kyFJm+lRAequp3/QKTk2V5h2Z+FE10NpS+moFCyrWO
	FGsZGe2NWwyRdL1KhEHZ1yb0LtUV9185i5IRUTSEefblL8tzzmRo46aiwQUPnKARs/RxDOORr2izv
	rJTcY78aMDLJilpzPUwXpGRmL1ATQ2MUeY6kRvsE9UlTIDry4D2dqBQ5NIEISLoib968l6hSyeYfb
	mfEhTXqnLRji4MFQkUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk125-00Fsxz-Rz; Mon, 08 Nov 2021 09:33:41 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk119-00Fsdg-1l
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 09:32:44 +0000
Received: by mail-ua1-f48.google.com with SMTP id e2so30156467uax.7
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 01:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZmZfs7D5IbUVgEtSSm6IrADV7ReOJphsMresBSdiIH0=;
 b=7X9RSlhdMalfVSJKMx0mxNSZp1PoTLKEekMSNpAV6DVJhnWRWKvBmt2+vuwzNvq8B5
 zT1XTw/AFr94stcqLVuv9S6F3lr3QkKI0QYfs6xRYV5u65Si8OqTF+/mgnG/YKLF9DFs
 ncoMMRu1EScManWe1cLKMcNHei35KZQND1UZpKBe9jvHL18SeBcs6iiFATjiUPFG9aHz
 S0V/Xj07KrlhMIa1GwPNfbaEGAIYFbIhnk+xpmH2ZeeJ7ILDBD7XHwyksg6lREow1tL3
 u278yf4idDSDBpDrux/Kz0orY+XsD3mm26uYtGQymnrLbZ3pryYUNwuOm4YXA7EjTonl
 eFzg==
X-Gm-Message-State: AOAM531web22g5xkDtKGtV0ELBOU+qfwMGbPfMnStIh/sxKgoWhlcmzj
 eEZOV5a9QYeD1jfsdPWlPkRsyoYDrbsDng==
X-Google-Smtp-Source: ABdhPJziPX+pdXtocaz5wF8DeYO/QpPw1sFGkoWbsUJrzuCjcIwdYu+EfZuj+UJCP/21v8ZymMZsOw==
X-Received: by 2002:a67:3310:: with SMTP id z16mr34949981vsz.5.1636363961518; 
 Mon, 08 Nov 2021 01:32:41 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id k185sm3030920vsc.21.2021.11.08.01.32.41
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:32:41 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id b3so30236746uam.1
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 01:32:41 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr90132886uaj.89.1636363570925; 
 Mon, 08 Nov 2021 01:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-9-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-9-kernel@esmil.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 10:25:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWieSa-VKMov3qhT6UVe15huNW-z2hQgPLSKVDzvU-wYQ@mail.gmail.com>
Message-ID: <CAMuHMdWieSa-VKMov3qhT6UVe15huNW-z2hQgPLSKVDzvU-wYQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_013243_123108_028D4FF6 
X-CRM114-Status: GOOD (  17.88  )
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

On Tue, Nov 2, 2021 at 5:11 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add bindings for the reset controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
