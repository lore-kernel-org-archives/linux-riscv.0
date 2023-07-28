Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A13FEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 20:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwJJnP7ry1YfaN8Iym/4CimEF6Wcv/8ru3bZQB2lkeo=; b=4p9iYSA+UPpgM2
	vIp3kn2GafZGO6gMUpm4TTioDk9HfU2UurrSNHNnybC3e2Y/xPjbl3xFovPe8sjS9KXeDeVyVAs6z
	jQx9a3wzmW7Z07jUb93MD9kAxbYesahS9tpOkIGvvlbmSsgCutrt1pFsYWzDP8wd1JWykYOrgN07S
	N4JRfMDSOavJQ2Br4kPjnrdx7tzGQjsQEClzlq0ZiGdHw/6DcD2K1zdx0SeygYjc/RHQj5HK4tGhA
	GB4cKaD0S4Ww/nisMz3DsEU4QUP4jCGs872xGYvzfplv5nk61NekjmhroiS9FXX1ywymgTIIZZcCg
	P3SZtesyLKslqC2U3Ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPTj9-004vP8-0m;
	Fri, 28 Jul 2023 20:06:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPTiz-004vNL-37
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 20:06:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AAD2621F0;
	Fri, 28 Jul 2023 20:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A2DC433C7;
	Fri, 28 Jul 2023 20:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690574755;
	bh=py0omZqtWccXsrf8j+lto97C93J9zBJrNhqqVxtPVZ4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rZ8QC/PzAunJKjKpc6WD5MJNL+eKN488pPoz0VtyJiVV7hjBAbYEYL27psyZ5AeZk
	 d9w+HDLcskzdR1BVAu3MCeehK7h9BOM/2gs10axZpMhGInc2nlPiLDuIBU4JSxCuX7
	 hxbsJq+cYrkk/Ev9tbXNikypgPlG0/XgE65lgQvMZ47xF0PEUICeJJPCTxrYSHqxGo
	 9shkLinNJzgzXthKlis4vJQ4c8FvQsb/BBGDxmfUsrEFJkqe9nh37rmkxHZn35ogMF
	 oJtsbXxSPK73bgdiwSIA+N17WKQkcpefpQRkV7yCut09IbfUl7e4GE33VkugVBmOHu
	 K6KFp1mBmOYpg==
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 Chen Jiahao <chenjiahao16@huawei.com>
In-Reply-To: <20230728075729.3451867-1-chenjiahao16@huawei.com>
References: <20230728075729.3451867-1-chenjiahao16@huawei.com>
Subject: Re: [PATCH -next v2] spi: microchip-core: Clean up redundant
 dev_err_probe()
Message-Id: <169057475433.253217.4192656130835572334.b4-ty@kernel.org>
Date: Fri, 28 Jul 2023 21:05:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_130616_319805_4B2EEA53 
X-CRM114-Status: GOOD (  11.83  )
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

On Fri, 28 Jul 2023 15:57:29 +0800, Chen Jiahao wrote:
> Refering to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
> 
> Furthermore, platform_get_irq() will never return irq equals 0,
> removing spi->irq == 0 checking to clean it up.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: microchip-core: Clean up redundant dev_err_probe()
      commit: 71ee2a4f95e205bd33e79c7bd4bece3885e0e366

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
