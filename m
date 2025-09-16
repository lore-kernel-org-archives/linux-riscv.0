Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DDACAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 21:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhAYIiePBeL/nGBJgHU/Ts7/Iupbc7unxi7MRrY1Wzo=; b=FRZY7fd6HhBTdD
	cmQfq8oyxtObZ7nIrseWXFZunnvNwhb/SVdDTEK/XFqKvAM1azH8hn+UAch3Bhf3Rf6xuueMhix9h
	T48oaN9grpZ9JgANx8sZg1OeaGsMkyprKxQapwb1jH/JLWR4tTzUZH2lqxQ8zBWGGbeHqnNogvRwV
	uV2c+x517DtJen9G3fFb7y1/6aAlq0MvGLAFJmkdDxGaLCmF7CGV2FcCSIRAeKAy/vzUbSNX3y/GC
	9UoLApTB8Q4IzUNnu32G/ZIYBn2/Cfk0bl/XzaburvFC2tWNMFZPOAy6WCSdyapcUTbF7WRPgflaW
	radBBtdLRmj98DgvZuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydcx-00000009IPA-3Hca;
	Tue, 16 Sep 2025 21:54:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydcv-00000009IOQ-0ESG
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 21:54:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7226141707;
	Tue, 16 Sep 2025 21:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61614C4CEF9;
	Tue, 16 Sep 2025 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758059656;
	bh=uD2qX1Uel1p/YrCYZ0w2oIREUJEihLSaGL7baU3SX04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p1auR8Pt42Tym0qXlywjGsGpI7yOQUKBihw+ZbyLwgwqRAcacfgBwNuNLc4IpdXkB
	 j//1lYuA63R42y7IpOA3LzEJhiOVRxeijucpj8mpDLBqBRmEflGhUZQwrQ+hamHwzO
	 LBPqBYA2gNOACgVcGrhRZ20m32MvlhFAIis83zXBz6nzuaqglL/TUD3q5lea0tY3AQ
	 OUEPZs4Gazbn5xpjYCQm7oVQyrkPNE/ZdbxeZYwSjJu+SnFJUduaSRhfoFtDusmlmt
	 zLUszYZeaxYao3yCC/7bl1Wa7I2TVFXYI6mvpPuFFM86yyUNRhcnKzrahsoAD9MejF
	 J2vy1PjVIKDqA==
From: Mark Brown <broonie@kernel.org>
To: lee@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Alex Elder <elder@riscstar.com>
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-Id: <175805965212.251163.14858159964329617503.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 22:54:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_145417_117489_57267EF8 
X-CRM114-Status: GOOD (  11.28  )
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

On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
> converters and 12 LDOs.  It contains a load switch, ADC channels,
> GPIOs, a real-time clock, and a watchdog timer.
> 
> This series introduces a multifunction driver for the P1 PMIC as
> well as drivers for its regulators and RTC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/7] regulator: spacemit: support SpacemiT P1 regulators
      commit: 8b84d712ad849172f6bbcad57534b284d942b0b5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
