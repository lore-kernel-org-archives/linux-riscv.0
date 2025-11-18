Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6201BCF2562
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 23:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNtiO5PZb+K2PT/Jdaj4q8rurqHINz+U3a8zbDxy90A=; b=DvGL7GUq+LQATY
	LAfB3+IALxCV+RecIl9EdHVXoNUiZCZ7ISERrG4fzot8dC0a/Y2i86TI5ighrapUKCffpw1N8M0fd
	vIjXAOyVHgS+aKzJPaEdZieQDEW/a+YY7adecR/UiGMu8VnmAkML4S3pKLTlA73Goqhn2wyhRaf9l
	z7zTPVsh4FYv2PRxfeWyQcQzU02sQ3qPjHhEvHeJxsQk86symKqdrOJbj1KBBUSwkJ8+6IHGckACB
	PfU14tBWazPtLmfiH3ru0+WM4irR6LuQualdoyC4007uw02OaMOD1xzUhiTmdYgbqn1kooTcBGFUt
	ZqLGaBI5MAQgH0KKAzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUul-00000001E11-1s1S;
	Tue, 18 Nov 2025 23:15:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUuk-00000001E0P-0PuU
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 23:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D4C96001A;
	Tue, 18 Nov 2025 23:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BF5C2BCB3;
	Tue, 18 Nov 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763507709;
	bh=gtZ9x9hNGJ2crNqrmM9FblaMEjzm9BUY+A4w2ICStuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N0uMIyykd1R+agxLk1XZPKIWnxJVYvcpclRwXiF+1xW0Lgni9jZk+ch5V23p0QuMp
	 kCHhrLUTlXIq6b1O/nTtr6l1FlUteFJAMvsb4QaAL268eyI+dzPrtN6o54b/cvsuS/
	 AxpaHVkmKwMOdfC1TLT/Dx9LxVtnFMDRfHrGRYwWfGBWygST4dJoFd+VXW53/90Eco
	 ZHToM59mJzj+kPSDut3PWtnO0RGUSHiCK7fvl089OTlESjFvZfVA4dw7ntg+XdgVF6
	 MEQA75wQjT6SgpwGhFF0oEYsf7PxWK7tjQ2WeYf2S6FDK8lhBKvqKjqivE1vmh/Fyc
	 nKndlYxd+yoXg==
From: Mark Brown <broonie@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20251117104044.291517-1-lukas.bulwahn@redhat.com>
References: <20251117104044.291517-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in RISC-V MICROCHIP
 SUPPORT
Message-Id: <176350770659.1411024.1566191077939342244.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 23:15:06 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-88d78
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

On Mon, 17 Nov 2025 11:40:44 +0100, Lukas Bulwahn wrote:
> Commit 71c814e98696 ("spi: microchip: rename driver file and internal
> identifiers") renames spi-microchip-core.c to spi-mpfs.c, but misses to
> adjust the file entry in RISC-V MICROCHIP SUPPORT.
> 
> Adjust the file entry after this renaming.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] MAINTAINERS: adjust file entry in RISC-V MICROCHIP SUPPORT
      commit: bd79452b39c21599e2cff42e9fbeb182656b6f6a

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
