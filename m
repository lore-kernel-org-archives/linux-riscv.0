Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A9C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL1XPp+7drVxVvB/b21NhSzQdLpY0ntKeoNQph5CtBU=; b=wBc0zGhzS1ZPrY
	fDSxJmyKOR7CeYNcRILS9snLEZr4fQVx7+0hJrxMD46tvvsKk4BdbRKw2Rfr0IYNAVqZih/9/zC6I
	9EbW4HHllaBysDixvqLyJRqK/Qo38zYAmLdSjruXpuxou9w+/wjkDOTtXifgKxkXyVnM4u8b83R3X
	vVPfh8lTaifJ/vYMqzl9Nwq9leWHkfX0Am4F/NJ62zdGj92GUL/16ndPRwu1zDWa+Co8HlZ5QQDE6
	dv7fWcijh9tRPW6kkkmz48VDTxzfurAo6am+dT/zTaV8CMLmyil84NtTabqUST0ajby9kopDrUGJw
	x6Y4M9UcVVTbSkGNDrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5LS-005w4p-La; Fri, 18 Nov 2022 17:40:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5LP-005w3E-P5
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:40:05 +0000
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8A1083F481
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668793200;
	bh=khOfblgst9enibwZtKIhuBZJXCqSZWcWc7io0Y3ec00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=olZjLMxAc51Aox6TZBLfpCFWqbM8pNpWvvfUPm/BCzMOsK97Q25YQDIA447NAEIjJ
	 w2yCT2mCUjDnTBop/e1WhF7QQLIDZ6bmmkrjw4rMfUc6uN+nHPtyDajkrV1pso7DBi
	 U67CwuvIWXOjpVO6P7BTSRziYJtPfnhgYDouh0M7gMrz4cdqQm1EqOh/qiISPn+XtH
	 TuGO0aIPTJAHIBTuLmtU5zPcSz8Oi3S5vWZjmngvqHXOC9ySedKTBLQeBxwG1JyERF
	 5d8yPwM4E04hIHOrig/mexeshcFvzL/1X0XYqrcmJNnnMKRsLnYSj+qiy1hKdvUYWU
	 y16em6niJcLHA==
Received: by mail-yb1-f199.google.com with SMTP id y82-20020a253255000000b006e7a04f3824so4262311yby.19
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khOfblgst9enibwZtKIhuBZJXCqSZWcWc7io0Y3ec00=;
        b=nIqs2JLVS/HhDXZcsGzDH7U3wc5yvyW/1tmcB2Kc/YhwoMIwAoWrPRxqCX9FDhj+16
         3OctpqN+QLoSlZV7ZMSFn17qp8AUSocWcAxlDgE9hxwbfql2KOVAlo6tn0ujpqGDXSGq
         0JWsNKdgkAdO88Quzs2cuWUkl4Vh3UEvxWxXujrZKHMreDED0nJ3JhRob8XoXt5MPaQf
         Df81s1V2ITK9Frx8Mu1xpwFaidF88chJ9Qv5QH8gT9dBmk/vqwFl8kY3TKOCuYe8H16/
         y7xGf0hwP+n/YtsHPlsvswXKRSGfTt+ogcLdK+4SxNnM9gENe5z4n28L1fvwzP5sO7ZM
         SvjQ==
X-Gm-Message-State: ANoB5pmIa6MDL/A6exDSlMI5nMX+qnWS8QLC2pkNFijr5n9r2DQIT3Se
	XzOYG3qwb4FEcpydZT1rkdYQvWvre0/xRDOI88QA5b6ZFpK+QICSQISo/1jtiH1TOZtGxrHOns/
	YBGrqvLZqIfF4tyTCIC24StEWxzLr0ZIpWITGPuKBTLx2ytYZ+iBoz4ZWUT+AFg==
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id r11-20020a819a0b000000b0037002d3c361mr7373261ywg.251.1668793199538;
        Fri, 18 Nov 2022 09:39:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jjAsNvhdPGGqZYsergcF++LvMbbQe3AgNyo2sdT6ZeT0o7tzyhO5uVsz3J8DtAGJMuP52P9lVuRXACQqXzlk=
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id
 r11-20020a819a0b000000b0037002d3c361mr7373226ywg.251.1668793199261; Fri, 18
 Nov 2022 09:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-7-hal.feng@starfivetech.com> <Y3d0GE7msiWGlRcd@spud>
In-Reply-To: <Y3d0GE7msiWGlRcd@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 18:39:43 +0100
Message-ID: <CAJM55Z_3m9w83D9J2y+MV8VLc+uU0Gwo8xpD=fnCGZSAGntu7Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
To: Conor Dooley <conor@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_094004_177452_457EA048 
X-CRM114-Status: GOOD (  25.66  )
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

On Fri, 18 Nov 2022 at 13:01, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Nov 18, 2022 at 09:17:12AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > Add initial device tree for the JH7110 RISC-V SoC by StarFive
> > Technology Ltd.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 437 +++++++++++++++++++++++
> >  1 file changed, 437 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > new file mode 100644
> > index 000000000000..c22e8f1d2640
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -0,0 +1,437 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>
> @Emil, I feel like I have to ask given the 2022 date, but should this
> stuff be attributed to your canonical address or is this fine?

Yeah, this is fine. I did this on my own time before I was actually
tasked with working on the JH7110 based boards.

> Other than that, a cursory check /looks/ fine, other than the:
>
> > +       gmac0_rgmii_rxin: gmac0_rgmii_rxin {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency = <0>;
> > +       };
>
> If you remove the clock-frequency = <0> bit, dtb validation will force
> people to set the value in jh7110-board.dts which I'd prefer to rely on
> than a comment.
>
> Glad to see you sorted out the clock/reset stuff too!
>
> Thanks,
> Conor.
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
