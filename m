Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6EDCD342C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 01:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf+N0szi4wsPOYjc/MHEk+R8YdwX+rR32VwSdLLY8lQ=; b=gCx0q2Vvp7JBk1
	JJ7novgnsIUWDIPuap0pK1Y0d5Fc3KwvG3F2VwGGPMgCt5F7WU1uZ5tY69vgfkIuJAAnpkKfJMFOb
	77B9imHOjy9HMt0l1pUwDqy2mDWYfZibG0T9aSaDho827gXAe3jglYEAH0vrdKHoNDNRETzRqZjGs
	zoKZLu6SvgstRrQGS8T/fFxwRytrxMyJnE/qVmiaDXQgVo2yRvjzhWzRo++6i+pVPhe3H02D7A7GK
	VUvoK5XGB2Rkr6ZELGU+562yqzDckGXT7fFVYQdLi73E8jMsnNvrGW6Ggv5DS9WGEy+TThmIWEXuN
	JNvsH3Y64ATz0bZ7i+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4HE-0000000EmZD-0S9i;
	Tue, 05 May 2026 01:08:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4HC-0000000EmYc-3k5a
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 01:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FABA60055;
	Tue,  5 May 2026 01:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2633AC2BCB8;
	Tue,  5 May 2026 01:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943321;
	bh=S4D4xiXgQHI7j63fa70zQ8ojrWnq9v7eBETq1Yu8RsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WDY++W8mVC9vDzjSia9MPrZ8yRH2MksICNrMhfUN5ZUjEftDW7lMoIqwFHxH9V+2m
	 9kIwycayyLY6BwPv98+Dc6Dz3tllH09GWeXt1QnFgkUUJiFbghR5T6goVbLqEMz17+
	 sj7yeDkkyIJR1Eftp+ke4Z+ZgJp6uphTxJ/hGNDLbKRTOgYpiInfU7x9OdeqmGaLwR
	 3ZGHGSfupAXPSApHkn3KADgjjkpHNO5YvzCmVdldacPRA4vPaA84N/A3AWnbqU4CYu
	 kqD4z6cOYsNyBdzOSLmWzPfxsw2V6JTlNH2MhoHfEBzSnmRt8UMfR7GoPV/cyV0LVM
	 nHudAlBVmq7Ng==
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Cyril Jean <cyril.jean@microchip.com>, 
 Valentina.FernandezAlanis@microchip.com, linux-riscv@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260430-levers-defiling-00406e391c5a@spud>
References: <20260430-levers-defiling-00406e391c5a@spud>
Subject: Re: [PATCH v3 0/3] microchip core-qspi gpio-cs fixes + cleanup
Message-Id: <177790098872.458539.9606470232934881996.b4-ty@b4>
Date: Mon, 04 May 2026 22:23:08 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S4D4xiXgQHI7j63fa70zQ8ojrWnq9v7eBETq1Yu8RsY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsyfzuLXf17Vz1pgfFPfZ+GmkGLb9FRWWUWZ5ynzNIODI
 pg3S2l1MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQAT0TjK/k/r9VtzVWcft6cb
 w67n57O17eE8Hiov7rS4LXO2xs26O8bGoo/W5Tfxrc6WabuoVemR9T13xzMnszkdr6InqnFFrHP
 T09+X08kfP/XbY3H96321Yjl1HP9meSnF32ivl7HhDAj1fpJqHS7n6vmJae+s/+UHHolNPMnmFl
 Mc2tguuG3ejK6XfQsff3r9WGKngP5Hz2cWgT67LohrSpte1GTgCgl9XFXb9OMJW+hstdIlSt+a/
 dpYzLdz3f9dJFzGeH/mea+vBnsarZeJlkvmT3vEMb2HvbpwUoTbom9llsrTfKeqyeeEvp9j6/7R
 8P9D/rt2F1Y1tdtPqd7A0h/FIN1812vZlGbR1BKD7f8A
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

On Thu, 30 Apr 2026 11:10:17 +0100, Conor Dooley wrote:
> microchip core-qspi gpio-cs fixes + cleanup
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey Mark,
> 
> v3 with the review comment about the core handing CS_HIGH dealt with.
> I noticed that in the same function there was a "raw" BIT(1), which I
> replaced with a macro that the patch was already adding for use in the
> setup function...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/3] spi: microchip-core-qspi: control built-in cs manually
      https://git.kernel.org/broonie/spi/c/7672749e1496
[2/3] spi: microchip-core-qspi: don't attempt to transmit during emulated read-only dual/quad operations
      https://git.kernel.org/broonie/spi/c/eb56deaabf12
[3/3] spi: microchip-core-qspi: remove some inline markings
      https://git.kernel.org/broonie/spi/c/0b2eb1f8473e

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
