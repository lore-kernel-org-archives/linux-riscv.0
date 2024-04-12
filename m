Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B13C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 03:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6Exq+buX7aDQzzHFsND7sSLwh28bZ64kXySfpH8LCI=; b=zvMR2h/BuKgxz9
	0QFHLSVCpQewr9Cvkop2jNfQaYNrw4Vm5Al0M2iSzWn87/of0GjEzrX5q1LLXZJirF1lV3SPp+E8+
	JK+QIcLYUB7PZsbmTcdC1RsbPnf9lNbwrcBGcbRmXcMo542fBHJ327dqfYcqCw/hfo1pVSuFqGibd
	034BFb87obG2TZDaoqEbAimg7wIy82H+J9SVlOoCLJ7JrWX2tw9ooWXpscSLfKG+MlD2bihT2duqi
	8NL2bHrkTQeFD7/rMZwC6IBt5c9RQl2WaYOKHDpGgpPMEh66+qqvzHLzsWIHr9Jbt7ad8CPWrPT6E
	PkDYujY/LVPTnsDN79Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv79i-0000000Ezbt-33wD;
	Fri, 12 Apr 2024 03:00:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv79a-0000000EzaI-2io7
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 03:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1567CE2449;
	Fri, 12 Apr 2024 03:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10286C072AA;
	Fri, 12 Apr 2024 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712890836;
	bh=otq3wISb2ZRkd93ltkPOvNmjY7y7cS7tl665m79FoKY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BNRDc/hDZ3wcHawmkCwPuhGf+6T/StT1d6HS+sFlNc6VXru/JhG/ZTBMd/me86ZD1
	 4QcW+CCC/rpeIe85+4Nz1hMZoCyLQep+T+p2hdHG8E+WSGyjMNC3Fo7295pyumzuIQ
	 DzAcw6WPGtgnOPE264Jq5KlL0DC3ORdBaCVtFQPZudNUnrUha/UHLnm00UeCxqyerG
	 LlPiUIdqOTr8na9IxeTUSbWaK9BBnPsOJhCbBqFZ0Ikq0UQpd7Q+ah17+Y0ZU8XbaP
	 mhoKgCfUDB1V4NJFwOE5TleaUJ5Sm4kee4cr6UJB2zpJuiyWNsR4XfYVQ7pxi6usLP
	 F5yRansdJMVmQ==
Message-ID: <17e03db98ea960c58b1c012ee04bcbf6.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240411-euphemism-ended-706f23d4a5ca@wendy>
References: <20240110133128.286657-1-jeeheng.sia@starfivetech.com> <a83130157adf70f6f58f4d2e6b9d25db.sboyd@kernel.org> <20240411-euphemism-ended-706f23d4a5ca@wendy>
Subject: Re: [RFC v3 00/16] Basic clock and reset support for StarFive JH8100 RISC-V SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, aou@eecs.berkeley.edu, conor@kernel.org, emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, kernel@esmil.dk, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, xingyu.wu@starfivetech.com, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, leyfoon.tan@starfivetech.com
To: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 11 Apr 2024 20:00:33 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_200039_078218_D0953305 
X-CRM114-Status: GOOD (  21.22  )
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

Quoting Conor Dooley (2024-04-11 03:29:51)
> On Thu, Apr 11, 2024 at 12:40:09AM -0700, Stephen Boyd wrote:
> > Quoting Sia Jee Heng (2024-01-10 05:31:12)
> > > This patch series enabled basic clock & reset support for StarFive
> > > JH8100 SoC.
> > > 
> > > This patch series depends on the Initial device tree support for
> > > StarFive JH8100 SoC patch series which can be found at [1].
> > > 
> > > As it is recommended to refrain from merging fundamental patches like
> > > Device Tree, Clock & Reset, and PINCTRL tested on FPGA/Emulator, into the
> > > RISC-V Mainline, this patch series has been renamed to "RFC" patches. Yet,
> > > thanks to the reviewers who have reviewed the patches at [2]. The changes
> > > are captured below.
> > 
> > I don't think that's what should be happening. Instead, clk patches
> > should be sent to clk maintainers, reset patches to reset maintainers,
> > pinctrl patches to pinctrl maintainers, etc. The DTS can be sent later
> > when it's no longer an FPGA/Emulator? Right now I'm ignoring this series
> > because it's tagged as an RFC.
> 
> Since this comes back to something I said, what I didn't want to happen
> was a bunch of pinctrl/clock/reset dt-binding headers that getting merged
> (and therefore exported to other projects) and then have those change
> later on when the chip was taped out.

Ah ok.

> I don't really care if the drivers
> themselves get merged. If the JH8100 is being taped out soon (or already
> has been internally) and there's unlikely to be any changes, there's not
> really a reason to block the binding headers any more.
> 

The binding headers are sometimes required for the drivers, so the
driver can't be merged then.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
