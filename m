Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32061C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+2asrwQj6Wz5s1chApdmad+/Udpqphz93SO9Pkgwfo=; b=PkbML0AWF50gA5
	szUP7jOTt9knxZEgOFj/Wj20cfhq77N49IrIrrRVS+n5ZjRFWQYQGa+PV/xlqGoOntBLSDb8xATkH
	cyK/9d6H6LMiIiROlO4FLV+6u2csMtUCkrxh4ESLuk1rW71Rz2VqKhmED3hum15cRaaxSG6gtvj1H
	tVgZo3wIbdrK4nLwaYqloZlMq+Xu6uatevc3ZS9XFP1VcHEwczveR1jlTVNIuW2ktmjJs5m0OJXp5
	GVa3CsV3ydDcV0Urh6gC/od2R6oYbK74h+HIWhDIaaq+d2B/mVRuviQhHr5lGMXgNg8PfTz2jT5DF
	RJBPKor+rvbCtjlhJ6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o154f-009Jws-Ha; Tue, 14 Jun 2022 11:51:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o154d-009Jvu-4c
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 11:51:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95EDDB81769;
	Tue, 14 Jun 2022 11:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40B0C3411B;
	Tue, 14 Jun 2022 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655207464;
	bh=U5tf7D/ZsG6cScTwHNdYzzDqh2YZNCvrjVSqDQlRGv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B9nd1YaSd62i8nYu83WdU1JHozmtnHj35NbOYpqs+LaozTlC5VnXK/GREic93wtfp
	 IFgcnvVytFZr07lcANaS9UC8MloAczK50s7iTMf0ac+S0iNMvliHGI3nZK0wgYfhze
	 wwZDGlGff4aC5de8g+CHu+TliN7F/TCqR2HUZg5Z+X4sy70qO7SaG/Ay+M0kQyjPuN
	 QYGrttG2pRisArkFZcRoy/+y6/ZTzb+3/f6XKUewPKrTAMgVVusuRvPULOLJ19/RF7
	 WIJnJVzoKbcWbEJ8lzz7m7v7Qlzqvj989TOGuBmdRLT0YHrtIi/HVruiNr9aFS9Cw7
	 Ti2zstXVbM9dA==
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, lewis.hanly@microchip.com, daire.mcnamara@microchip.com, linux-kernel@vger.kernel.org, yang.lee@linux.alibaba.com
In-Reply-To: <20220614065809.1969177-1-conor.dooley@microchip.com>
References: <20220614065809.1969177-1-conor.dooley@microchip.com>
Subject: Re: [PATCH] spi: microchip-core: fix potentially incorrect return from probe
Message-Id: <165520746259.620958.8052145626827236977.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 12:51:02 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_045107_361447_6665D5B7 
X-CRM114-Status: GOOD (  11.10  )
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

On Tue, 14 Jun 2022 07:58:10 +0100, Conor Dooley wrote:
> If platform_get_irqi() returns 0, the error case will be triggered but
> probe() will return 0 rather than an error. Ape the other drivers using
> this pattern and return -ENXIO.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: microchip-core: fix potentially incorrect return from probe
      commit: d38dc01a4e68133e11ae74af7585d2c4bbd5803d

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
