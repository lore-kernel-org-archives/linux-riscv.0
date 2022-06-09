Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432AC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m79Q7FmdYtxhoiPYJYwsgqDjdVtLdA9kA4AQSP+tHiI=; b=QYl1pUPPef9iFH
	Qq1wCzSZGM8jf5axkSfprllEa7Dj7H5Qq+0JocycO0W2vRp+/xXQvD5zLmOmrk7BQbHaVj6cUxk4l
	m0AAK3Oj6vtGj8HWrRDO/9pNstmovfqButgSuL23KmSsg7np/9grEAWqOmhZaUUAYKKq0NqyrtkkY
	yDYK3s6mxSejg5b7kbrqGsNPegqq5orHubO5TdESlqcjP7NKbQ8U7QJbvajFKPJtjSB0noCNVqaBB
	ov+76FLiSnk6B8dn/KvHnTNEDes1Kmz3vhA5GLUxYe7uc/dsWqMXClOZfZwzs8elXxFbxQvUkQqPU
	8HBqxhXDfiUHkUAaiQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIul-002QJv-9K; Thu, 09 Jun 2022 14:13:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIuZ-002QFk-Bv
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 14:13:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D0D15B82DE8;
	Thu,  9 Jun 2022 14:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB52C341C0;
	Thu,  9 Jun 2022 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654784000;
	bh=fgW9SgIxOe3MEyVRhxoDRyRIWcYYtHacDWK0P92cUMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZjjbC/J3NCnWN8ZqPKE0f7wS0KjQMgU+ZIsmeVBQojNwNZtZKb20tQTiNWjEz8SO7
	 83S+6TbnE5iViQSPX+U9HoqvzZ/y8TMv+Hcvn9Zv+8yEEd8amNHM2E5xXrVvzSkk3R
	 dur1c2JgJdculRxJR4B4yQZLC/WjwkUzTLpKPRoGhWuIi8dy/mDxeroEy+flwClsbm
	 r1YTbncXcUP/xjqOtw6XwvV0pVy5629ym485/euNGP7Kg1QCLOsFojmEU1VPwyKlqj
	 0MgAAyMkP03AioQzFmYxqMU6Uci/aOFudGY+dQLK4UA/SI35j3UNHuq9LGZ+OQUuob
	 s66qzaZNDjw4Q==
From: Mark Brown <broonie@kernel.org>
To: yang.lee@linux.alibaba.com
Cc: abaci@linux.alibaba.com, lewis.hanly@microchip.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, linux-riscv@lists.infradead.org
In-Reply-To: <20220609055533.95866-2-yang.lee@linux.alibaba.com>
References: <20220609055533.95866-1-yang.lee@linux.alibaba.com> <20220609055533.95866-2-yang.lee@linux.alibaba.com>
Subject: Re: (subset) [PATCH -next 1/2] spi: Remove unnecessary print function dev_err()
Message-Id: <165478399889.1092145.5682711038335760840.b4-ty@kernel.org>
Date: Thu, 09 Jun 2022 15:13:18 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_071323_567139_C822333C 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, 9 Jun 2022 13:55:33 +0800, Yang Li wrote:
> The function platform_get_irq() never returns 0, and the print function
> dev_err() is redundant because platform_get_irq() already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./drivers/spi/spi-microchip-core.c:543:2-9: line 543 is redundant
> because platform_get_irq() already prints an error
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: fix platform_no_drv_owner.cocci warning
      commit: a4f26ba2608c9ff736a9ad1348aa8078f0b03f81

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
