Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF81CA0EC6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 23:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r57SATGsfjuZH9E/Rgpw2CwC+m7025akzI+iKsClLc=; b=wRVroTIbnJQdTa
	32Bp/p/sb1oY2fs0VnQa8iO4A+jgq5tTCdfFdk+9MgVKN+faofnXH88G85q1jL7TX8iyVqwjYuUeb
	x7vZAv9cv+Dg7RGoIYS2JG/+RatE2YqICsYd8s8JFqAvHHOXtfL4MIYEwXjhTkFyIOrqsPfQrHucB
	st6rETKWPSxGgLdw4V5F9Qf4p/X0oMN1vKJPWtxMIe9iaTZscvRG6K+KQflQRINkzQj1xgVajiMAu
	6FZi8KFUDZqM9nhC7h/2twc/4zztuYXEQPHZcyb9sZeU+IjetdyvsYKCMzJk857vcOuer3YWd4zNs
	0q+JEHBf7MjHcFalguPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqmK-001dlB-12;
	Mon, 11 Sep 2023 23:57:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqmH-001dkV-2R
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 23:57:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04683B80DAE;
	Mon, 11 Sep 2023 23:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894F1C433BD;
	Mon, 11 Sep 2023 23:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476629;
	bh=1thFA0r6QTXaMMAvmq81qtjuV83w94AXlpxBRNKZhRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oMnK1bOOaNj/ZlVSiaPag3gDM+dMhWPhyFJ3bLpueNd177LZxpcuKcd3t+Konaz03
	 CjqH1fsLDcS7KQY8EICXGiJTA+xHr/IQP2qdc7yxS2QktlSfAKBdZZiLh0wQCJrNca
	 sztsB9hMt3cKLSNr1bHETEO8hZBxJev4BjiKf/qZw+sEGzKrLhPU1nVG1V3JnoN5M5
	 IMj2qi+guOloCkSp9Mb+FPGLQGW3syQRgD1P+8fKjdbRc49rlwUUFbEw1qdnREBZDB
	 XpVU9T8yPhhDyfoaSjWK7V0s+WaINtYrC46O4d4u9Gm4uOmN3ntbWVo5/pum3TKPW1
	 ngwlTE+/ivReg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Walker Chen <walker.chen@starfivetech.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Hal Feng <hal.feng@starfivetech.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230814080618.10036-1-hal.feng@starfivetech.com>
References: <20230814080618.10036-1-hal.feng@starfivetech.com>
Subject: Re: (subset) [PATCH v3 0/3] Add PWM-DAC audio support for StarFive
 JH7110 RISC-V SoC
Message-Id: <169447662623.2387538.17830103471127363678.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:06 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_165713_933526_057590C0 
X-CRM114-Status: GOOD (  16.63  )
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

On Mon, 14 Aug 2023 16:06:15 +0800, Hal Feng wrote:
> This patchset adds PWM-DAC audio support for the StarFive JH7110 SoC.
> The PWM-DAC module does not require a hardware codec, but a dummy codec is
> needed for the driver. The dummy spdif codec driver, which is already
> upstream, is compatible with the one which JH7110 PWM-DAC needed. So we
> use it as the dummy codec driver for the JH7110 PWM-DAC module.
> 
> The third patch depends on tag next-20230809 in linux-next branch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
      commit: 748c482d032ef8a607cbf696c6d31afd25293bcb
[2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
      commit: d1802d59ab533f5d5fdfa3483c11ca77c5b21fdd

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
