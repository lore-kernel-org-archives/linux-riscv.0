Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957FBC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03SWQjrq7gdE915eN5GfRuPiLePrv/NtF21nzpgMx6g=; b=xII306GsPWdwKj
	G888nYbEkwNwXFNjI+uX3L+y4UQussF22IY2j3LvMRKrYKFUmsIrn7WLgkB7vHwslRYl//QaY8qPf
	NWBqRtAeVxO8BR7PsCHYGf7OWtes2SRLqhrRsxld1cfHFs6hHJn5V7WF0VqOUnfIJHGRS3MLdJm9w
	BEWQu9W3mgUycTxhVoKtlWp+ean1wT4dM+SRb/WEI+/Tv0+Ojg6BYV7XSiya/ZgVSZs7ccrJxv/Hm
	h1ynceKYZyoSrPM1n+QFidg0GFaTcju2eGqNxbdbtI+yl2GVAAulzeAYai565jV0ere0bjPtXfq0b
	WWtN0xLzGFhG1Tn0LMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ntm-0028oM-IK; Thu, 16 Jun 2022 11:42:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ntj-0028nH-OL
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 11:42:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66E76B823A5;
	Thu, 16 Jun 2022 11:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EACC34114;
	Thu, 16 Jun 2022 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655379769;
	bh=Q132C26WTc5ClYHcIA2UoeqKRa/NHeLBCM471XhFPec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FnR2r1UJqwxQXcdxUb8MVwDT8BxaySA5P+5tE109aZ3c0iVyIKy3xPYFR2JvHsMtk
	 hhrS/dXJ6YNKhFceFnEctzUY999h31ZXajyU/BpI4MH8kRpLWGxIE83PrwAs1ND0qd
	 wiM0l7eNWTeJtmXs0zlSuR4l84D3T8d7vxq3KR/5GVJWRltPNvdYnRuzBXl+wgnf9m
	 iRz5NgUvNT94PX6/vq+L9puZNGFwYG/wMfDugLjC2vrVShg3Gsol9Ulw91ocrV2agQ
	 Y8WFx/c78wOTx7O04fGW5c3ApIU/leWXHDqz6HiqncAwzCAFm+98gxBuR+2FRh7OGU
	 P6on9EHTqXcEw==
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, dan.carpenter@oracle.com, daire.mcnamara@microchip.com, lewis.hanly@microchip.com, linux-kernel@vger.kernel.org
In-Reply-To: <20220615142028.2991915-1-conor.dooley@microchip.com>
References: <20220615142028.2991915-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v2] spi: microchip-core: fix passing zero to PTR_ERR warning
Message-Id: <165537976740.874420.15190272235131912340.b4-ty@kernel.org>
Date: Thu, 16 Jun 2022 12:42:47 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_044251_980563_B6CBD2E4 
X-CRM114-Status: GOOD (  12.98  )
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

On Wed, 15 Jun 2022 15:20:29 +0100, Conor Dooley wrote:
> It is possible that the error case for devm_clk_get() returns NULL,
> in which case zero will be passed to PTR_ERR() as shown by the Smatch
> static checker warning:
> drivers/spi/spi-microchip-core.c:557 mchp_corespi_probe()
> warn: passing zero to 'PTR_ERR'
> 
> Remove the NULL check and carry on with a dummy clock in case of an
> error. To avoid a potential div zero, abort calculating clkgen if
> clk_get_rate(spi->clk) is zero.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: microchip-core: fix passing zero to PTR_ERR warning
      commit: 2081ad1467469b649fc9f9226b235977a7bf9402

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
