Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC05AD5B16F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbJL7bgJ/itdckNZHVTkfjMICPy1q9IuirMas6HRI88=; b=OBBeFEwr69vXdZ
	FvhoT6hW0fifA2uX6y5ZtJr/15Zu6s5AQIIHGZs74/z/mAd71ndJeUGfJGba1yywfcH9xZLMNaZjA
	LGYe9GCjZV1zfrPtcD0ekQaS7pxGpZ3bMxnn/d9yYJbCao1JMJGGJMv3dpmRVGUbJqv4LS34Xxe4k
	58XUwyohYe/IiXz80ulwfz+9Jmysw1fENuh9Rb9HKW7CgdQ4JSdmI3hcTViQbo7LoS1k2lXnj52AI
	QZbxaeR35fFJC+qWm5Hxg1SVZcG/Aky31uYpy0RPR5Xs3uVdFod17T9s/WLiYdK2aAQVlyNvi2od7
	guH2dSs+3wP2+ubK3D8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV976-00000003jJY-1Jyw;
	Mon, 15 Dec 2025 13:59:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV975-00000003jIV-0cf4
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 13:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 533DD60158;
	Mon, 15 Dec 2025 13:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60CDC4CEFB;
	Mon, 15 Dec 2025 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807186;
	bh=KOAvoqG7RnTWQZeujmBk7U/h4REQ9si9oHsscWJ0Z1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Se0Bz+j9E6Ig2JOTIrffmOVI26Cnyw2L6LpypgVoJlNUoPwpzTfglr1p3QLdiyEuX
	 iM0A3hf/cQcXntvR1aZP6Go7c5NjXUgtc6NWSrDU8+UVH54LuQOn+mQYdcUD8WACbL
	 TE+dod2OnSiKfWq3FeZ+ztrKGn+4yMArEbyj8flv2orfJcyDKGDqgZaBHKyiP7T9Gr
	 f44lBwS59EabRFjINjFb2wanSS26c8/cRLKEO0Mms2q0GrZoXLVuLDj4y/VsQnIaBq
	 lzouUHQDKs1j2sENAe8fv0Fh6G3khRj5w3Re7bClr0MLDjoYx4mUoy4WJaHzyIe+ja
	 K39NApFPNubhQ==
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <eb35f168517cc402ef7e78f26da02863e2f45c03.1765612110.git.christophe.jaillet@wanadoo.fr>
References: <eb35f168517cc402ef7e78f26da02863e2f45c03.1765612110.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] spi: mpfs: Fix an error handling path in
 mpfs_spi_probe()
Message-Id: <176580718430.161463.4850754049730233485.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:59:44 +0900
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

On Sat, 13 Dec 2025 08:48:51 +0100, Christophe JAILLET wrote:
> mpfs_spi_init() calls mpfs_spi_enable_ints(), so mpfs_spi_disable_ints()
> should be called if an error occurs after calling mpfs_spi_init(), as
> already done in the remove function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mpfs: Fix an error handling path in mpfs_spi_probe()
      commit: a8a313612af7a55083ba5720f14f1835319debee

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
