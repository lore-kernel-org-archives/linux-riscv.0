Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B200C55822
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTLvxsIir5urYJfTYLgkd4T8n61kC/tJ+apxP5h7JbI=; b=AWJNd4w0o3a7vO
	oXOyd58FPHrOxYRqSPa9O1Kc19/GqE7DWLJP9jbQmTzKbtr3gXat5gGEOSSpZ9cVKvnGqxxdqtI+2
	YRfzMFW6Rh9MrZ5QXgm2AJC2+QjXBEZTftJsUq9/6kmT76xpZfk3ep1YwTSbZn8ibKgThCcvHqPQE
	GENpscfbZB+6t75bI3s7UtpTRdwDBP4ljswzZnL2waXQcpxf+FMLolpgwa9KpFBDnz6Ru1q+xTFZ3
	AY6YfPXkM8KFj1w2S7zbw9x9Gh5c0n2narvEtRrmvk/+wOz/MUnt944LqXt72IuLhnWq1NwgLiBqx
	ZKVhVByGT276DyhJA5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyeb-00000000SOk-2pB0;
	Mon, 03 Aug 2026 19:48:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyea-00000000SO7-1avf
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 19:48:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93E2D60A9C;
	Mon,  3 Aug 2026 19:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B291F000E9;
	Mon,  3 Aug 2026 19:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786531;
	bh=gRKD3Yms4UmL1R70kEb/16Lt+YdAmM6DsCMChqeyD+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rpl0512/f7uVlPUuE9zwt2MLYmXdRZX1KjLmHF7w6wrNt747+ktKc5ZMnwSLWIL0k
	 rVOei68WDTk69drAr7I9KlM7DMduTh0Pnb9bLBD9V5RwjL4KY4z+yhOyj+7rCopQM7
	 5BD/cj2zIhO4RAJgYSRZfSIaFpxkZL1EWjHDvgnRp3glcyz9p8P3qy3K0kL9bSgety
	 V+/HFoplEgMI0SvDikV/eYpWA2cYo5XKnwFrnm4jOmQ4TOC8KxYPOPwSXs6ELVAbG9
	 dpR1UUn8+xDngp5TECnbjtLeMSO/zwhCB+D+bNtm2mBDvVrRGNeJU0qD37V4v61VSZ
	 NQO41DE6voEHw==
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Goko Mell <goku.sonxin626@gmail.com>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: spacemit: Drop redundant error
 messages
Message-Id: <178578223883.255647.15164633437477017509.b4-ty@b4>
Date: Mon, 03 Aug 2026 19:37:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BMU8m3G0CzQ7r/UHgsjtaV7XbVgRF26RkLmkRPIw7Ps=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcPCfrOivxgmMibuM26PL4ZckDkgUboZa7X5qP
 6ItXy4E4y2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanDwnwAKCRAk1otyXVSH
 0EpfB/9KYDAOOEThhQgaerB9e2bpfLq1GQLe2mXmP49OGUBL2wJvbhyA8Yrd8SUneG5qqdmk1qI
 pl1tRDu8T8z2CWPZjXfHQ/Ahc+Rk5GPFAyD8v2CRglNEGB9WfjDLgAP+85TWBGynlxEF9j9PA5H
 ZN6j66rag14ZDQz9yr2lLo/N+rm7VCAVhcYNrH0mW8htfFo0YVM8tjgV3pW27bh8vOh4r/h+VdK
 +QDYrujg2jeRvcgVzCPkmcb0l9iK8P1Fbf3GPq7DAkA2IppqHIxKsmu8nXiCXRfllzCoKOGSJyD
 nsTcFkIxPSotXtOqlbKbtBiKVSvcUReRaGVMkbpu9LaFQK1m
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

On Fri, 31 Jul 2026 17:15:38 +0700, phucduc.bui@gmail.com wrote:
> ASoC: spacemit: Drop redundant error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: spacemit: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/a6604d9fb216

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
