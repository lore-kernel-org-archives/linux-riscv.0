Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC63DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV8EnO16SjRMPxn3YhFGsTf60RM4jjyqqy3nJo3icBA=; b=AM/sGhKRM9eM9V
	FI+wSRRm0X1/gnbJMekJu8MpPSd2iPy0zsupYOP0YGDMBD04KwT/IEFH4kZTr0glUWmXeAnh5huMB
	nIdd17XrZbw0OIjBHTUmg496HrCocE/WLy8V19Lk3NOAR6jCpN7+3/zs+rBWQjDWbJF+iGQrIl7Uu
	/3B8aKFLl0UeFPnBK4XV+pKhggq3H3trEg9lhnB3qmr185sltT5XiYoU9uVPMDE/1K4j6pqO+KqE3
	BNDmuoIDsFgFgC/n8F9lqF1jqwlyyAtAamTrLg4yyXmCMVZRDh/Wxd56VpyoUPo8NrF6lYdOtd53Z
	p2Sj29JdfiLel6aWEpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0nnp-004wl9-Qk; Mon, 13 Jun 2022 17:24:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0nnn-004wkH-6h
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 17:24:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA29460C95;
	Mon, 13 Jun 2022 17:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C642EC3411B;
	Mon, 13 Jun 2022 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655141074;
	bh=WhFcv1EH9geGyT4FKQyR7YpypEd1X5ddAYODqZhxQiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bIt6/NjQpUm9hagE+jYFaN7jaGYRwZVtDciGgAfNK3Qb5tIyrMdV294tUdE/kyVHJ
	 8OToqFezlHWN7qFpFkQakyQNvN/3Smhd2XmdBhb0cjaVOYDb0V/M5CWI/wvMfkcZMf
	 FF65AnHsL/A028n3Jv80EalHs0tm5N7qDfZRr+YelvlkJgO2WBng7pVWENehJe81do
	 IeNyWAiuaupY+7a/4CDMs5pp+45j2s9y58tZmd76r2MuwmSpV+Rm3iBCs35pW1ug1G
	 EEFqd0tjWeeF5lKGD0zmuf03BWdsiY+LpHuYSVgTeJ43Ge3g+4MQGyn6j8mPpDClEj
	 hIPO17I5vVapw==
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com, lewis.hanly@microchip.com, wupeng58@huawei.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, liwei391@huawei.com, linux-riscv@lists.infradead.org
In-Reply-To: <20220611021117.40494-1-wupeng58@huawei.com>
References: <20220611021117.40494-1-wupeng58@huawei.com>
Subject: Re: [PATCH] spi: micro: fix unreasonable clk_prepare_enable() on error in mchp_corespi_probe()
Message-Id: <165514107253.671611.10664601205751933959.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 18:24:32 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_102435_322984_1B266F50 
X-CRM114-Status: GOOD (  10.94  )
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

On Sat, 11 Jun 2022 02:11:17 +0000, Peng Wu wrote:
> Fix the unreasonable clk_prepare_enable() with clk_disable_unprepare()
> before return from mchp_corespi_probe() in the error handling case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: micro: fix unreasonable clk_prepare_enable() on error in mchp_corespi_probe()
      commit: 116679aef2f92d535ea8049ef2a610bc73f94660

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
