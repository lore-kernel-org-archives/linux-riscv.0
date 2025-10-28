Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF3CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5aGi7OUqk61ukOuULAFxR6sBpAio0G+9JmurFgO57M=; b=eVneh5AdqJA6no
	XM7lN/Lp41LhX94LVWlExomap/eWitd0uv7PpQ140OGoo5C2ASfnhlhjEmveodTS0QDeKd7etHS7K
	mL5aw443PLWDk+FWvefVfvgu6XdeOHXa91l/Rx0f6s0uuPpy4qBi5U/LUjVd/CzdXzzBFGPAjx+Ql
	gDSAo2wi5EF+2W5F74JT/4Ccoubm/Wfh+jOYi6aPwbqxl9MkjyQkKxDJ1n9gKFGExMbYwjVy2vKBl
	xRYxns0dyAwPBujgPQt5rCW6DOu6nEKMhjqJE49jdOv0Nd9eTFDQtSenQS1svoyWszBd6ohfkp1xe
	y219tnBbOXpbLy9dLWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkfU-0000000G5eE-01PM;
	Tue, 28 Oct 2025 14:27:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkfR-0000000G5dK-3oAl
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 14:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F54E604CE;
	Tue, 28 Oct 2025 14:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F9CC4CEE7;
	Tue, 28 Oct 2025 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761661640;
	bh=Cn66l1Qv7QjpRmpmPqFbyHZ8IgZjug6npKZkYfw0VHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mHrQwhd+PzR/b3pxlQI+F1llOntM62cttQaXI3GvFNREK6BEo5W0yR3kJfGZK87XR
	 xosWHtAjqW8GVdplELPfzR5Qd6HzoirYUYX3twZbOEofe+PV91r2i/V48D+5CfMHHF
	 faVkvKQf//RTmjkThW55csDvGue8GPBa1xWx1K10SfHy7jaaNTNM8V6+eCiKkMnZqD
	 AeVXCts/ABgAYv+iah58sHhpx35uIxILzs3Ik9z99Viazd7FuNav9WI45Nmi8C55i/
	 3BtYV943DTZCXQHYuj/9uiMcdtoRC6qhZvyHAbPsE1/6e4BFGW7LYSXz3RaWFvse7a
	 DyXD/szXZHO6A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@gentoo.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
References: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
Subject: Re: [PATCH v2 0/2] ASoC: spacemit: fix build warning and error
Message-Id: <176166163771.85877.16889963338170505917.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 14:27:17 +0000
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

On Tue, 28 Oct 2025 09:32:08 +0800, Troy Mitchell wrote:
> After the i2s patch for K1 was merged, two issues were identified:
> - Missing error handling for the init_dai() function [1],
>   which is required since the function allocates memory internally.
> - The Kconfig entry ignored the dependency chain of DMA_CMA [2].
> 
> This series fixes both issues.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: spacemit: add failure check for spacemit_i2s_init_dai()
      commit: f034c16a4663eaf3198dc18b201ba50533fb5b81
[2/2] ASoC: spacemit: use `depends on` instead of `select`
      (no commit info)

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
