Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EFFF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 04:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/IIZciWKza7pnPI5km8z+tkTLMsxM3fZCfZ52YjuTs=; b=aYile+xGYJXSc1
	62i65PlGOuLg9RxJAH+K9v0NepBTacptUjeKpDsjZU98Rqc/WmXxaao62wxU+cbBARJPT0akveBTD
	Sh5sjVFN7tXB0lzPEsNYBZ1P8fBzfka/4+UKJPVLGnp5q8M8dcjAifErLcUfKVsOMKg71qYdR3tWR
	Q0b6a8D58Ld3p6JFL2rD87yWOCHEWZJpuWxfamtUll2I05dmFcOwuFDk7c6Og8OvB2htHLpPqjkeC
	W/oDRtpTQTGOq4AgMK8MTeDznMiJ0gHeMrdjXfAj2p3ncMdC7c8YPwDg++DjWInCG0ke8b+guWcPc
	A5ResnAzOlBZSIi3Us6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwPE-00000002vHu-0ehL;
	Wed, 29 Apr 2026 04:20:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwPB-00000002vGi-0A27
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 04:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD59140DDB;
	Wed, 29 Apr 2026 04:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10462C2BCB4;
	Wed, 29 Apr 2026 04:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436408;
	bh=Y3TadPI+Uk+0lcra2ukxy7a1jSLDUZdGEsO0a8IaOuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KtLnoFDX/LmckW/QlstZ6bfDZxf1oto3yy2sVCHBbWDmtY9LuVjn+O7QtJcerlfZP
	 aVBxPB4fOZ/WzwQmcvhAkJjZgxhEC5cO3uDlLnvzCRIwcMAva7msvwDS6MflfjJ0FR
	 4AgqhJxlJ8qKZeHTxRH9k09GbMeDhqsh9OKxkbBHPUc+MQuhTYsLU/+NcUdnrngBK5
	 N5/qM9+E5Z0Z3wK0z6igY9Q9S/D1LqsKaw5+iE0dPovpGe48vtHhyt9Ko0nfyYSHPO
	 8MQl9RAUiBhHQEBaNOEMOcEQD4HJsSb3hZ8KwSq3SSUKUs1S+ZOLtL1z+mY4MxgqzG
	 r3k++/wyxliCw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
Subject: Re: (subset) [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring,
 and K3 SoC support
Message-Id: <177743049537.363516.3431185859758571339.b4-ty@b4>
Date: Wed, 29 Apr 2026 11:41:35 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y3TadPI+Uk+0lcra2ukxy7a1jSLDUZdGEsO0a8IaOuM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Yb0K+ucIi3HDtgy/2P9jyTHgZHvTNgpG3lfC
 rcwtX3nqkeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG9AAKCRAk1otyXVSH
 0HsGB/0SR87C+jiNlh2idBxBsVbfTMnM51S9G6GDqaJKpv/Q0igZROaqjIOgR+7rgwkxtu/APtK
 roW2rPY+7xkz8uYz9wQb+Y28UuChQFbDcPEcrgIzT6Y7uSxzg9kU0Z2N4MGmf5/uaHAPw81iyy/
 bYcX2K0Q6OTTGHeR+9xT3hqSupM8HaGMX0ZCHGi+D5h4dPoMWcRaiQ7297iT4x64WngNvviymse
 yi0pcZRFCp8/QCQ3ll3FugTOHRVdsLE83t0trkfDzgO2uidRU/D6qtbE5xawG8lmzZxbFB3MDoV
 fECtrWN6f3zAS/C+LisSWJobTUle1BCnFLz6FfkJY7GK8uWR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_212009_125724_B96D5E88 
X-CRM114-Status: GOOD (  11.46  )
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

On Wed, 29 Apr 2026 09:38:45 +0800, Troy Mitchell wrote:
> ASoC: spacemit: bug fixes, refactoring, and K3 SoC support
> 
> This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
> controller driver (sound/soc/spacemit/).
> 
> Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
>   - Fix RX DMA params not being set when TX is already running
>   - Move hw constraints from hw_params to startup where they belong
>   - Adjust FIFO trigger threshold to half FIFO size for better DMA
>     efficiency
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[2/7] ASoC: spacemit: move hw constraints from hw_params to startup
      https://git.kernel.org/broonie/sound/c/6b4afbaaa342
[3/7] ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size
      https://git.kernel.org/broonie/sound/c/03dcb5b68a96

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
