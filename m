Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8081C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PumlTqDuG/9B4vHDlTeu7iSUde6slm/wZHCpxwBhB5M=; b=IcDWhd7UvlVt/i
	Lo5RXQda+b2hFtp0J513GRgXdVEnOS1r7Qnzbsbpc9/VMgF1oK2QeG2VGo0c2JUFTwQ6W0Rylp90z
	YBcnoBWbrZtXp2z8YNloZnkoMEt03uHHrlOAo8D3rQii/I9jWxDm1WjSxeOAa/W8P/4lu0ciod9/N
	dcKXHCUP3yQVmZUoLm//juXWIyKnMtz7ZMwNFDvXFav5+C+9+rX/+6aJJN5nkEaiL7xS3cyRhSdsJ
	JscCCOJMaBdvJukBy7zKancJv3HrCr7LML3Mpk/FeHMJZ1fYGp5o+bTIBq/scppeJlRKyGV//J3Cc
	vM4Wa3jMknPKvLYNp7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUQB-00000000e9j-2Gcf;
	Thu, 13 Aug 2026 12:20:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUQA-00000000e9b-2BXK
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 12:20:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF60E40551;
	Thu, 13 Aug 2026 12:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7581F000E9;
	Thu, 13 Aug 2026 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623629;
	bh=j79Qv2kin7snMq51u+mksCtLNTIh6v/403FJtOsIOxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LliF5Im7g4i0LBPkEuB0ArAle1L3Wvcr3GtKvLVyY4iHgSJYmF6nF/wKfNZqGS/KF
	 VgkzFypGexMUbm7twuHFfxkeENfqUF8VB0OMo1yDP88AAJpjeH38X1IqkB/G/9aNj4
	 4FULUnknnAedjA/5gud1Iv4qTlv3A+H1/Vx1ExB9RXlU21I3An0Mu37mFmtrukYB3s
	 EK5qLKi1xc31OeLuBxrDX+PKZC7+K3pvD8evoCY4IKtztUxffbaozekI7pDG/Ugsfa
	 T2xhVpM8sOniC3et1kUMaF1UjYZwdRozu9EmbqanEC4YvOn8LdX2M5Yq9m7AjyVMV/
	 A7Gt7pckzpdvQ==
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Goko Mell <goku.sonxin626@gmail.com>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260805064348.44283-1-phucduc.bui@gmail.com>
References: <20260805064348.44283-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI
 streams
Message-Id: <178656041255.521321.7252255564384020860.b4-ty@b4>
Date: Wed, 12 Aug 2026 19:46:52 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WMCbSYBvbFSAqJCoiPswlpF/qTICQkeiWenI/Fv71Cg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfbaJ4xXTgaAU8344lNnzLHvdYVkrGGb5f1eyH
 s5VgiGWywqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan22iQAKCRAk1otyXVSH
 0HqpB/44WA3YXP8HUVRPmnUU+CaKSAAsNSpCeGaKrWokoYw14GfslOin9QfaxnVtK2nvQGb8hEe
 BgVlCQcdGLimIF370fcNVOBnoe/zyrX5mfwTkIe9kXCe2BnmkYQa07Q+nlzGK30knIoYvaX/59r
 8m8q/BX1DvkY6l1J9OrglwNOwfiR2oJTfULl/m2mirlq34G3WT9/bSdJni9TJLyxnsjntGFwTiC
 XUsHYmIAQRS5XB4A2MPjazuNyqibaDiFHAwbX9Pm21HviIfswR5142VE2Xy43R+J6HC+Ci6G99+
 xHTZeysYX5BilSm+3r1IeZ425sl0E9nxc+EhrJXYYFjl+s2S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Wed, 05 Aug 2026 13:43:48 +0700, phucduc.bui@gmail.com wrote:
> ASoC: spacemit: advertise only DMA-backed DAI streams

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: spacemit: advertise only DMA-backed DAI streams
      https://git.kernel.org/broonie/sound/c/0a91bb72980e

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
