Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849E9C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1U4TJnmonbjetzULXWehxG1jBgOPu4YbHzZ8y+Or3BU=; b=tIf76HG7sZ2kHT
	Dmwu+V5J2JEqeOJnpq84OXEkNFk8nh5fqtem+lNxdUqdIwQPnyJQv7JDqnXEo44ikvKYriSPH7tDV
	qv/99LbSYen0GO7YepbDG3Ka6JLvhMaMe/vOWA25hSRnX45ZaqHToZzMBoi30vCoE7T2E7owKSfD8
	Oq9K9Jxiyp5uyIGErF0Z3zYvLZX47zb1DHGTEfPtQ/9pyvHM0T1lcXsoaj0Iq+j36zI0QANho0H3e
	cLntW6141NRY9wB5sdFRBeYLcl+xG3vSR9ptyaZu5iA66AAVkv3yjA91N/HxZ/fxbUadVFkygBT+Y
	vmIZoXAj9NBwzQlVszQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kTa-0045D4-2M;
	Thu, 01 Jun 2023 15:44:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kTY-0045Bb-1J
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 15:44:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00DB1646B1;
	Thu,  1 Jun 2023 15:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6938C4339B;
	Thu,  1 Jun 2023 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685634271;
	bh=Xzrs4uQvpV2FbJzVvZTm9OPYbe9DmKt40BV1GwUulo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a8b5RwP/q2MckI42aUURkKKBNPr1cp0rArsl9eEeIj04CsfD7J1MYS5ghGdweHnOC
	 37WtY0LFF33r66tagsiC/2OmM25chJn+in1U7f2gnXLK0L+MweBs0FHaprQCXrncJx
	 5sHVNeFanq/4CcxnNWotITt/eJc6RSZRTDkWsz6bu1aOrRtvvs6ZvCcoKEwKIdRqGl
	 K6Dann5V9W8hogqZcDjyDKyIPRZce860bTKqmeZAAPx/GY6wlMRTlI0gxL+1ycqiLo
	 5VvPlfOUfWtZiIbkJTgemcyNpT9fC9JDbghU4mX7vXYYY3A5RaGLg7R6thgbw2EQwh
	 DX/4cb7QVf0Zg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20230526145402.450-1-walker.chen@starfivetech.com>
References: <20230526145402.450-1-walker.chen@starfivetech.com>
Subject: Re: (subset) [PATCH v5 0/3] Add TDM audio on StarFive JH7110
Message-Id: <168563426847.132600.7350104738221381081.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 16:44:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_084432_489611_5DA052E8 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, 26 May 2023 22:53:59 +0800, Walker Chen wrote:
> This patchset adds TDM audio driver for the StarFive JH7110 SoC. The
> first patch adds device tree binding for TDM module. The second patch
> adds tdm driver support for JH7110 SoC. The last patch adds device tree
> node and pins configuration of tdm to JH7110 dts.
> 
> The series has been tested on the VisionFive 2 board by plugging an
> audio expansion board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Add TDM controller bindings for StarFive JH7110
      commit: d9afe0d36cc27dcacbcecf02fe803a30d544698c
[2/3] ASoC: starfive: Add JH7110 TDM driver
      commit: fd4762b6b5cfa27bf44f5d624ce74b7dce4a479c

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
