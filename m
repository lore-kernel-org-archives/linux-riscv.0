Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE7ACCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfgY78Kf6oSUe+F1LOh1CFzvCUj8yDnX/rCZWfnLM4k=; b=cetth0nEDYYInx
	ktn5sa2EQ1/BhQcf9vbKFZHigHn3QDAHRydWi4dxu9RdYJsVoETCP0WiH4JFiy8kdTQ44zt+n+Qnz
	+gAjiSN1NXsnmME5JJMRv9Z4E2Q4UFQFKqJGo0xoam4brEBwvZi6JkHiN8RhzdfVD9vak8DydrBnU
	2o8T8Pj4WBFMgWLKYbhI5+b2pNwP8GLj1lUwgROD6csRR4rl7Ae31ckOPSuH71o2cZqi7gcSyXayf
	D83iZ2cSnPnfwOh7aKlIUq8pSwJ4jKEZbzS+4YaeN5uSNpbtAPW2xRzCOEXHNkUk0Y9kCwT+gfaT+
	mXK2VQEODfZeFYSDZtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkfP-0000000G5d1-2u36;
	Tue, 28 Oct 2025 14:27:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkfO-0000000G5cv-39rj
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 14:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEAC860458;
	Tue, 28 Oct 2025 14:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1D0C4CEE7;
	Tue, 28 Oct 2025 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761661637;
	bh=ShczIjFONgRVfNlzBrQWzTLdiQoG+N1oAqDWcV7g6SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AieJl+W4lybtToMBXywZ25N0n1fx6kwTw9cEa3tZ40psF1iKhkQfTtIAXTnRvXztX
	 Zu9UvQ3Qv15njSTETDwh1gZxuit3CdwFL2nIrx122iNF4T9yftIOrRhWdNbb21vsWG
	 zH9rPsopSp27q846j194dy1i3mz9Hw3qglPCUwr4QF55ho1d1Ura+4E5cKfiSgM0AO
	 6UygGgRkoXBDHy0LH/4yja08jilBALDS3l1PJMuywkeJByog0sydxQo8XAvtru7M6A
	 B0PA8vMNdrMCZDmH+PkjZR/QjzPvp7ru4Es7OjHdZ6Gwd0wjJiqOJ/XVJjJnzaGa9G
	 rRqIq/p9i5x/g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
References: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
Subject: Re: [PATCH] ASoC: spacemit: add failure check for
 spacemit_i2s_init_dai()
Message-Id: <176166163539.85877.12634117063779900411.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 14:27:15 +0000
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

On Fri, 24 Oct 2025 21:11:01 +0800, Troy Mitchell wrote:
> Add error handling when memory allocation for dai fails in
> spacemit_i2s_init_dai() call.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: spacemit: add failure check for spacemit_i2s_init_dai()
      commit: f034c16a4663eaf3198dc18b201ba50533fb5b81

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
