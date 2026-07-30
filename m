Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3687C55162
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLfi675eczlxanjCOrccZ8LSrhQWO3GZrUlwvE0QA1g=; b=qGunax3llVDv2k
	O27a+NOYt3m36eVPMlUblqXLrHoR6WRNfjNe3duNV+vUr50GCR/8ygQXmAgVycz9F+IBM9H81hD4+
	2q6W+A7KfLKSovfRYbaxYr4LU255Z1WjQnK4T7SQQZ2looX6VYNW7ZMbLEFVIj+090ukOBpRWjjJm
	0uf8GzsnwQZoCTKPqm7ZuL3qYRnYH4AfQ0Iz1QeRJ0MWDzhUmxqGJu+TEKR++vCYVT5hqQG8n2rh+
	o7fyNkjTteYFTjj+a/b9SiZ/S8Ed+LpHKaiO8/NBZ4JTPSuMuErsdjW0/LlS7zoOsprHUC3OSoflC
	hKcB/iS5a9fWVlLc56tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOxF-0000000ALnr-212S;
	Thu, 30 Jul 2026 11:29:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOxE-0000000ALna-04dc
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 11:29:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75D02600B0;
	Thu, 30 Jul 2026 11:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461031F000E9;
	Thu, 30 Jul 2026 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410975;
	bh=ReYAwfOvi7XoAWmb+MBrm0lABIXnkQqz384e0Z3fGqk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=AkfE1pesDiVbng8djmIMZ/lxp7mLUFWdjbtvznmNaqUwQ8XyLfv9oiYnb9HUrU3Xy
	 CnT3hSiRIAWQjQxdkKgAUfaPPfeXAgAfllZJn4dwn4c3Clx5tGAGdntqLm5KJ3Ombi
	 fCXdA9davtwmRIm9FpEmKnJLhJ0+c/pHFtdZK23E07Ka6+uAlClH6dvjRvDVp25Qhy
	 2Naj6tWe1++8N2pZJgAerF6v2K5iir4rSuGONK5gDXdELOirqPq+1IMMgxX8XPUnRm
	 BTLPUkMBWeTi8iQZpQna2dhexwga6pD0GvHl2SBppJawKay7PVjxWZOBNEK29RUA3o
	 4XTHt5IMISmlw==
Date: Thu, 30 Jul 2026 11:29:32 +0000
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Add Milk-V Jupiter board
 (M1)
Message-ID: <20260730112932-GKF77474@kernel.org>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-5-aurelien@aurel32.net>
 <20260730085424-GKK76518@kernel.org>
 <amsj0kK6LtnxRT_J@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amsj0kK6LtnxRT_J@aurel32.net>
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

Hi Aurelien,

On 12:13 Thu 30 Jul     , Aurelien Jarno wrote:
> Hi Yixun,
> 
> On 2026-07-30 08:54, Yixun Lan wrote:
> > Hi Aurelien, 
> > 
> > 
> > On 18:00 Wed 29 Jul     , Aurelien Jarno wrote:
> > > Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
> > > from the K1 only by its package, which provides improved cooling
> > > performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.
> > > 
> > > Add m1-opp.dtsi to define the 1.8 GHz operating point and the
> > > corresponding core voltage, based on the upstream kernel. Include it
> > > from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
> > > match the new operating point.
> > > 
> > While checking the schematics, the buck1,2 provide power supply both
> > for cpu core and AVDD09 domain - check schematics page 9/25 [1]
> > 
> > the R81 is NC, so buck1,2 is actually all power supply, raise voltage will
> > result high risk to damage the chip (overvoltage of AVDD09 domain), so
> 
> Yes, both buck1 and buck2 supply the CPU core. I only raised buck1 here, 
> because it's the only one controlled by the cpu scaling, but in practice 
> I believe that configuring the PMIC as Dual-Phase Mode couple the two 
> regulator at the hardware level and only the first one need to be set. 
> See my analysis there:
> https://lore.kernel.org/spacemit/178402025712.1568061.9223355686030414906.b4-ty@b4/T/#m828e80aaf454606baafbd43e3795089ba397145f
> 
Your anylsis is correct, and that's not the problem I'm talking about..

what I mean is that more than one cumsumers to buck12, where AVDD may not
be able to tolerate high voltage, even vendor can't guarantee to run stably,
vendor kernel enable 1.8GHz as turbo-mode which won't run for long duration.

https://github.com/spacemit-com/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_opp_table.dtsi#L20

 buck1,2 |--> CPU CORE
         |--> AVDD09 (DDR, AFEAP ..)

> But I can indeed raise both values for consistency.
> 
> > a safe strategy would to test if M1 able to run at 1.8G without voltage 
> > change (still at 1.05v)?
> 
> I'll try that, but my guess is that given the vendor kernel raises the 
> voltage to 1.116V, it is actually needed.
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
