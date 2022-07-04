Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73416C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ChaegLax5fYxPuiHHVI7HEwrCHO52Pi9xQDWQsdwaU=; b=axysSNNu+2Cf9h
	/7ynox463r0tJ3pYoHAFktFkMvYxSQitK0H0QI1e3xpRgCNHF5TAXayzk5rvi+vA0Vun2IsJePSE4
	Jz06qsLz/r4Ct72+noY5fC726kzWoWJ1k3R/g87vkwCRTb4VB54jGzrHs19kZaUa8Fh3rNXykTg5F
	pBCES2wlDZZvvyIw0yvd9+zHjQcW3RMZmsV6YoQprXPhF2mhOYga978xNb3eF0DwLBXIoLK9Rs9J2
	6SfB+8lnP48EH/sG4jdKr2D/U9mW3qnr5/Qvk/o1JwfV8H+HGd9YlkDAkzE9PBL1yitta/aaU30af
	0pkCvXL+CsMUUWfXlgog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8OSN-009r42-AE; Mon, 04 Jul 2022 15:57:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8OSK-009r31-49
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 15:57:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80DD360ECD;
	Mon,  4 Jul 2022 15:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B532FC3411E;
	Mon,  4 Jul 2022 15:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656950267;
	bh=U8MDGOj5FFXPmmfgfJbJQRYIZ1IcA2PZQe3iwee1+MU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CPXLe+X/cFRMSPP98YaMuV5SxF1tYOewYdWdS3Z9akQyKIiuD4X14jAUlYmYy5frl
	 Y3Ws72Q8d/WckikWAUlbJ4SVBIFZErMmfmvwiHM+lL+7cEj2qf8KKnZpo7iZRshfs9
	 ydGuO0wkShAk9EXR7u8hreywhMnhu4gYERfvl+9RBgJeQW2x3wqMKv/koJFrgLtYPW
	 9L8RLGgTfk+v0mVf59chXtXh3m3C62obqYBOE69XTK3mevWOZh4CJTSiWz0CgaQ1PH
	 0QpB/9GfQeG1V8c+T43I3bYMKInZIYCOoKKRWKDeb2h4h6zh6tEtW0Bop4R8sfvd0x
	 itszqJeo+sDgA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Thierry Reding <thierry.reding@gmail.com>, airlied@linux.ie, Eugeniy.Paltsev@synopsys.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, Liam Girdwood <lgirdwood@gmail.com>, daniel@ffwll.ch, palmer@dabbelt.com, palmer@rivosinc.com, conor@kernel.org, daniel.lezcano@linaro.org, vkoul@kernel.org, fancer.lancer@gmail.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, dillon.minfei@gmail.com, geert@linux-m68k.org, conor.dooley@microchip.com, niklas.cassel@wdc.com, alsa-devel@alsa-project.org, dmaengine@vger.kernel.org, paul.walmsley@sifive.com, damien.lemoal@opensource.wdc.com, joabreu@synopsys.com, aou@eecs.berkeley.edu, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
Subject: Re: (subset) [PATCH v4 00/14] Canaan devicetree fixes
Message-Id: <165695026144.481068.15330746749392879216.b4-ty@kernel.org>
Date: Mon, 04 Jul 2022 16:57:41 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_085748_258984_521D8766 
X-CRM114-Status: GOOD (  13.20  )
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

On Fri, 1 Jul 2022 20:22:46 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/14] ASoC: dt-bindings: convert designware-i2s to dt-schema
        commit: bc4c9d85179ca90679c8bb046cf7aad16fb88076

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
