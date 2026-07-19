Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D4CC4452C
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fbf6RbHLgVal8bLXUrNVRYUaNRLiKMcQP+F5EzPuMw=; b=nFIN26DVqc+ea8
	LDpa4GYkX0XjRqTDvCBVJYhby5TnOmeEiMKrQoBCUssDvWzQVvBT5E/czNas1ziU8ZWYXxCGsLtoA
	iBlj4pwCa+mNwOrPnOhhdZTWxy2tuB5+qHLMHfTekGMj/jsT506uhryB+uRuwFd+Q7X8pAb0IKi9u
	d75ns7kxAmvR4/aQudJofgqW5uA6YdLgVlwvB/sgPfhbTAnZzoNKoqkpFAZdFs+7BapqoXoCdCy8o
	Vv/x7SU8U/mUhgaBhKsKdZrONX+QWevQUazsdOHxUK1WCGSIe8XBM3jpIzoYCX4b2fTiDVJK/6o0w
	WxE7DfCNyFNfaRdYV5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnui-00000006mNJ-3osA;
	Mon, 20 Jul 2026 13:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnuh-00000006mMb-0eBO
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 13:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D969043E69;
	Mon, 20 Jul 2026 13:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC141F000E9;
	Mon, 20 Jul 2026 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553606;
	bh=bB8LbbQ8ato4eUpI/pD/xOs6h3QBYChFQmgrhaxvC8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iK05cXzGHHMN+9KPEzYdSfXWKYItWmCHctLtMUa31qHmsjose29IsskHQDTahKwCm
	 yVQPLbdZJIrdzNpRhzeCuomzgjFBkFrz7MWsTGf3ndJngG9Kfh7hWGQowjdb1uXMEJ
	 Ij6gKgGGhm7pCLpaiW4F3SqS4rBbLStmx2LdEBLf5ydy9+iS0f1hGIU1TovVBMGSSo
	 n6MAOYF7YSdETFxFlMMJH7hL3csUE19ZjkuyPgNOW0mQAPDSmk1UwLi4PJtNQrQ7iP
	 c4iaOsAkoeawpz6JPQW3+JZKwTyVi8VD5a6kgqy6Y4HNqnRoF8klq0AVXOlrv27b/3
	 rGUcpiUYKws/w==
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>, Zhengyu He <hezhy472013@gmail.com>
Cc: wefu@redhat.com, linux-spi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Peixin Xie <peixin.xie@spacemit.com>
In-Reply-To: <20260715-k1-spi-tx-fifo-fix-v1-for-next-v1-1-02024223b08a@gmail.com>
References: <20260715-k1-spi-tx-fifo-fix-v1-for-next-v1-1-02024223b08a@gmail.com>
Subject: Re: [PATCH] spi: spacemit: Correct TX FIFO slot calculation
Message-Id: <178449558269.33801.416545162576183224.b4-ty@b4>
Date: Sun, 19 Jul 2026 22:13:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lNDsCrr6Zr1a04BpBZ3lfOtH7qJfNJwbYY0TuEgr1a8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiCEOyek79WHHGGiFXCeTAW8F77//b0UOazmO
 DXeim3CFjWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4ghAAKCRAk1otyXVSH
 0JB3B/sGiLFZW8tY8oSWfbgOEY5rtcyssZ6mdOCkSFUjCHdM71rqTs7M0hwMcXo8vjuE8zQFZF+
 oq8fxc6FoG+lRnqWwim6F7ZylZS6Y83MszA+46+HXz9dSQcno+l05zzRAaeJl0wPgX0LrFPmn5l
 F2EXDwTEu7GG4a/XOWSZ/mXX83arEsylSvh0yvRAh8BfV69LRD2SsOd2T3b81flqBRgVCKMDK/L
 CFofHiqSTYsHC1naZuHGyQPjYaGrUTZltAlQN04ZQ1nlqfoqAfbCk8KrIa72aHOLhOW6izjebAU
 hPx0DPv1WiL2REbIyRknW7e2yLITYb3C53w73w+gqDzy9Pmz
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

On Wed, 15 Jul 2026 20:52:15 +0800, Zhengyu He wrote:
> spi: spacemit: Correct TX FIFO slot calculation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: spacemit: Correct TX FIFO slot calculation
      https://git.kernel.org/broonie/spi/c/a88df1d92fcf

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
