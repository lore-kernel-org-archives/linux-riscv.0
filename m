Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbHF/GgJ4xKmtbkZ2WlQzwnkbUfvZ+RqUTl99TY/DUA=; b=Tmb/bvYVAFJZzF
	MvFBmlxxTjuxbxgcq6nX7NxmQT1s3R7JaefLCtmlM5Cqe6gznp3RhxpxIMQWS93fBPgSjjzLGA0W+
	qrlbGBPxYPsNXafPKDdLaA2kkSBWcqm7Hhtt6TPxpw0KoNqACPpMREa77TTxv1cJuB2WBi5KS7pgn
	Zu8DKcUIUrwDXPpfraTItFN4lCNTpuXI7+fiD3I/0Z+9+LqlGW4cMkFNzzb97s4bQdQmFboOPneVn
	idnUHanqrYy3lfXA8OjIp9mqmfQ5hMyJfToHVULq4iYEkpxIlSk1U+bOvPgJeqEh7FEnAzJKADO0L
	qJD4ZYSbt9iJ+qLrPmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxow-004ngC-6m; Thu, 29 Sep 2022 17:59:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxor-004ne5-TE
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 17:59:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40D26B8261D;
	Thu, 29 Sep 2022 17:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8C7C433D6;
	Thu, 29 Sep 2022 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664474370;
	bh=q9pUnXr+y7ypf+y9MFvS031N4YM5aIIn48LYK2fF6ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsesspPuNjiQpeaUs5Gl0Pc5mZrqIZrRFwrqNTM2SlBclmeg4Dh2fzkdW1q4jmPhF
	 dxWFzIvSoedHnZWGkpgjQHbM7jplc2ug/MXFq9CvXRCd8wgeynb9Mu1Sx19iyWdqNr
	 0bFP/QFI2R/jpoK0exdhgZ9PNLWtJ5n6JLMgevAMSthuiVBuGG3SwVI6oi31mLn38w
	 R0HwVpqYrP2eOs+eDNR344/s+xva+gSzcDPdUi02DGu8B1DCNcc+8gdj5XxchMTY2y
	 ZQa9FyasbW40mQ5ZZiIY6gHZHyrY1nNF7ziFOLnytHsqAxH8ozyhxp8XSyu+A8ktER
	 x4xt4YUxj4OkQ==
Date: Thu, 29 Sep 2022 18:59:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/30] Basic StarFive JH7110 RISC-V SoC support
Message-ID: <YzXc/FSbDpkElK0O@spud>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <4ddabe3a-9f55-2a6a-c1c1-ccc3fc74e98a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ddabe3a-9f55-2a6a-c1c1-ccc3fc74e98a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_105934_238894_0C3B2459 
X-CRM114-Status: GOOD (  14.67  )
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

On Thu, Sep 29, 2022 at 04:45:26PM +0200, Krzysztof Kozlowski wrote:
> On 29/09/2022 16:31, Hal Feng wrote:
> 
> > This series is also available at 
> > https://github.com/hal-feng/linux/commits/visionfive2-minimal
> > 
> > [1] https://www.cnx-software.com/2022/08/23/starfive-visionfive-2-quad-core-risc-v-sbc-linux/
> > [2] https://wiki.rvspace.org/
> > 
> > Emil Renner Berthing (17):
> >   dt-bindings: riscv: Add StarFive JH7110 bindings
> >   dt-bindings: timer: Add StarFive JH7110 clint
> >   dt-bindings: interrupt-controller: Add StarFive JH7110 plic
> >   dt-bindings: sifive-l2-cache: Support StarFive JH71x0 SoCs
> >   soc: sifive: l2 cache: Convert to platform driver
> >   soc: sifive: l2 cache: Add StarFive JH71x0 support
> >   reset: starfive: jh7100: Use 32bit I/O on 32bit registers
> >   dt-bindings: reset: Add StarFive JH7110 reset definitions
> >   clk: starfive: Factor out common clock driver code
> >   dt-bindings: clock: Add StarFive JH7110 system clock definitions
> >   dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
> >   clk: starfive: Add StarFive JH7110 system clock driver
> >   dt-bindings: clock: Add StarFive JH7110 always-on definitions
> >   dt-bindings: clock: Add starfive,jh7110-clkgen-aon bindings
> >   clk: starfive: Add StarFive JH7110 always-on clock driver
> >   RISC-V: Add initial StarFive JH7110 device tree
> >   RISC-V: Add StarFive JH7110 VisionFive2 board device tree
> 
> Where is the rest of patches? Lists got only 5 of them. Anyway this is a
> bit too big patchset. Split per subsystem.

They seem to be coming in over time in dribs and drabs. I assume it is
not a mailing list problem given how many lists are CCed on the mail and
the fact that they have different providers.

For v2 (or multiple v2s) please fix up your process so that this gets
sent normally and not a couple of patches every hour.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
