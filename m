Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E6D35668
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 03:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNNx9qfGvZuD9MlnbPFp0bo4v5dOjMqghviMD2mzotg=; b=BKYlRkkPa0wegO
	U2aToJ5VFYHN3F2TAHurr/V3YE5JUtYUjFu9X1hcdJ2zCeKjn5UeRoiuJZlpWa6cxiN4cDjR3Cn+p
	sJw7Cu8INSLVZO4MLvIiCmjBWUTgYNZL/MzUyixGFZw1X0pKZkPO+QEE1wo8I4flEugrfbwDZycRj
	rEk7tA3OErNtux7XUFioyHq7k5iTaf7RuJl7fr4F+IeDZ5PlMkNl21hxEdnPc48ZlFGtLOudA9Jit
	p7a6kpodPP2yzY1a/OG2fx0OgIKHGSmmKBTIHKejqkDXUdfhiV8WlmoIkNxxelbmsTMiqMoqWhwsN
	p4VvqvPzIhxm3KGExlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvp6-0000000FKrH-2DPu;
	Wed, 28 Jan 2026 03:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvp3-0000000FKqj-2AT5
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 03:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A21BA60007;
	Wed, 28 Jan 2026 03:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5376CC116D0;
	Wed, 28 Jan 2026 03:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569344;
	bh=vy/UE9A9BMbPd2nc8TS14tBcJbUev8wXdiGs01SglGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ITr7fV16/dcjWvaMnYJHFPWUa6ks7KJXURpOV+4G9nvrPCSamjRy0ts/tA4TKL/Bp
	 KtTlwni1Ksj9eIXqWl6NYgLyZQIJQEdB+Tq9ruLXFJ/efpQrttKRfl82dzQN3lHlyH
	 VVN4OfG5MUM5ODoaYxuSpWh315OmpVk/EnPaEcG/6sAQ2gV0eb19W4PeP0qv6oEOP7
	 CRTYhyHptiCbbTfk093j31WJkQRIPLkjcoT7K+lMMcUlW5iZEm82nrfCrr9SwE1lxG
	 qfh5XrJTlbkQhBkfVffJcJ+SGQbVMP1TNRLUscWR/e6dnYotxfKOiwe+O2lRuj6eCR
	 Gfi4U6SJABWVg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
Subject: Re: (subset) [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S
 controllers support
Message-Id: <176956934109.1515833.13689411651637089276.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:21 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
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

On Tue, 20 Jan 2026 23:06:02 +0400, Anton D. Stavinskii wrote:
> This patch series adds basic audio support for Sophgo CV1800B,
> as used on boards such as the Milk-V Duo.
> The series introduces the I2S controller driver,
> the DAC and ADC codec drivers, corresponding DT bindings,
> and DTS updates to wire the components together.
> 
> The implementation is based on vendor documentation
> and testing on real hardware.  This series relies on
> recent fixes in the DesignWare AXI DMA support;
> in particular, correct operation depends on
> the DMA changes discussed at:
> https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
> The current driver implementation supports a fixed audio configuration
> of 48 kHz sample rate and only I2S protocol which is used in codecs.
> The series has been tested on the Milk-V Duo 256M board using
> the Sophgo SG2002 SoC. The implementation is expected to also work on
> Milk-V Duo and Milk-V Module boards based on the SG2000 SoC,
> as the audio and DMA blocks are closely related.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller
      commit: ad50e1f63873e5d1f2f421bbd11387a0a1d0ca54
[2/6] ASoC: sophgo: add CV1800B I2S/TDM controller driver
      commit: ea0fb91c02c14748ae525dd547ede7b4a6535d09
[3/6] ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC codec
      commit: c294aafe474bbbd7a7476773f56f6191742a39e1
[4/6] ASoC: sophgo: add CV1800B internal ADC codec driver
      commit: 4cf8752a03e67b2927d137a47c4eca4d516b4838
[5/6] ASoC: sophgo: add CV1800B internal DAC codec driver
      commit: b3eb755e2db07d85c30e8ff4043ffb9a14b4ece7

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
