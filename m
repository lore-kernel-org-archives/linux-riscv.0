Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A461C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9l9OqVEzixCsyNRXJ+5ylW+v7gU3NNwXUUwSS/mR7o=; b=tLiJOx0vI0gkhE
	UivYjtZBuMOy1AOTKvryrHItIB6iLxGuY1jUtrzANxLSQ9Jt7IXOtNoJavwn6xmO0GhXG9gwHJMCB
	XLnmCzdZvK6+u8Qqd/t3rgJoZ7WV9JOKcmcVcxI9fb0qW0Y0J7+niyTsmieC4K7myjFtRq1eKzFEH
	HeI/T4PaCHYAsNq1HE/mAgcjgItua2BnvgUkE2mmu9VshvHkC7Rfad3GyqeKvmXrh4SqRglSZo3Ds
	qbQ6eguNuKMkORRU2g0M0krxvR+S5uYju/wjqZzlvO1dgVym2t1W8Ar3XG1JR7U/IGh450gRSCtMG
	g8k/jVGWuA0/Gy0f7xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4OY-000000087GZ-03Ag;
	Wed, 29 Jul 2026 13:32:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4OW-000000087GF-49zI
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:32:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C724600BC;
	Wed, 29 Jul 2026 13:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A271F00A3D;
	Wed, 29 Jul 2026 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331943;
	bh=f3O03q8g4zY3UkiuqFzkFOLvkkuY7KoV7rgZS+bJHG0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=hYqI90r3Pj4axo/IkXm4UdGkdF/0ickGExddREMrxm7OlQ+37epBduCM//XKLqwWk
	 EIPK43P7LivY4I/bXRO0rN28k+jxRNgAdOmIrcIK4JTzElC/EEPzfyZKmQQWAGH7Fl
	 TmS25fepzui0nEEM0zT+Ywl+/sqo+P+ZwKwhDDi8LfSF99ru4Z8SSMTKIrxD0ojrLg
	 9xyBFLDbvQr6qAUk457ci+3X+psX9yrD1kx+Mo2kWh1sLDo38Y6xy48kMPRUIIVVBD
	 EgLkxvTyPIwctOULLnLe8oVfPJ60OJuaOtjgM1Ws6WtOJHNQvk/lIeGmuUAiVuQzcn
	 Bn+OpOMOoZzgA==
From: Mark Brown <broonie@kernel.org>
To: dlan@kernel.org, elder@riscstar.com, guodong@riscstar.com, 
 linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <cover.1784527556.git.xiaopei01@kylinos.cn>
References: <cover.1784527556.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH 0/2] fix and cleanup in spi-spacemit-k1
Message-Id: <178526212208.13644.13743864400074628954.b4-ty@b4>
Date: Tue, 28 Jul 2026 19:08:42 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sYO3OQMt/+Stif8+cNPvSfMwor9ljLrebznuS3yEydo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagDlvAGIROrYOOVdq9xw2Bu9XpOSqAvBUu3xE
 nSvFgs/iIuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA5QAKCRAk1otyXVSH
 0JloB/9mrloYBsxFc3DmMt2jQDXe/kbgXHKA62LBppIHoKvnp5kQrALUQw4TJ38655Db3Jl0BPe
 aiGoPaCdkFaxpR4VzRDXPX44p1ujH7F+7ql+5tz+/KjFKO1bWH6xFn7UpouVDOFWRpKnah5hy8Z
 55PnHDs23MXAvG+OX453G3d4BnDwPftT4/TPoig7QJjPGSeunBRR8Q4qeYNsrgdopqDCGhR8DBD
 liUzmnCgdMz1MMHGzuu+nqZbrr4dQdHK0LJ99GdCGR04lQp0t6JMUbY7ioMvmheZ6QguefkeF3D
 xDgU8XA4lCw2TzFUcWEAMcR6LPQ63OFp0XQ6v1QxfdhCu59H
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

On Mon, 20 Jul 2026 14:08:42 +0800, Pei Xiao wrote:
> fix and cleanup in spi-spacemit-k1
> 
> 1.fix TX DMA descriptor on RX prep failure
> 2. drop redundant dev_err_probe() around irq
> 
> Pei Xiao (2):
>   spi: spacemit: fix dangling TX DMA descriptor on RX prep failure
>   spi: spacemit: drop redundant dev_err_probe() around irq helpers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/2] spi: spacemit: fix dangling TX DMA descriptor on RX prep failure
      https://git.kernel.org/broonie/spi/c/8955fbad8aad
[2/2] spi: spacemit: drop redundant dev_err_probe() around irq helpers
      https://git.kernel.org/broonie/spi/c/79052a6a6f5b

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
