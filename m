Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B156C25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rv6M966JzNYEUZ9Cs6uAZA8xQH5gcktoGBwiS5S3X5Y=; b=2Ddd0e2AQaciIC
	fp+rM/mfpWdFnhNprkEvBYxfsG4UaR9eg8c2C+Axax+ErEUmiByR0RgrcAOhZvIjWAFlUAJ4oFuqh
	gu99iyArM3AiQ5kJwJ2b20VsfcWO5V3ZgNA+FwgcufqpaNV0qDZBteaG8jGF1AJVvVH3VFXwvPwbX
	h/HXhidyYuMK4Oe1PGGxzn1XubzW0dePzch5aK5UwKAaAW+J5kHDt/oADke73ROkj7i14BHpSEOQz
	uaTXVi3fsIqZ/zjZ6AVzCO/0rXCjR9/5fXmU5A+H7uFeeR+fpau3lfBOx+mW7qEsZ/TD0vl4vgqIR
	/ihHN+RN/U9LYu/03YMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcS4-001A8q-B5; Mon, 15 Aug 2022 15:56:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcH1-0012Io-HN
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 15:45:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DB7161122;
	Mon, 15 Aug 2022 15:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26457C433D6;
	Mon, 15 Aug 2022 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660578301;
	bh=ND9SRzVyLLhRbgWIaa1lz9WPcq7yD16K64ajmGrbJF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q3Ct/LIQ9n8W5I3LZnT7OP3kODzsmElhd6JfZMIue56X8CfuiyzdFwcXVtGHHjGY0
	 1gMkZmSLTKCbhU402xkILhBE+g+6dz5OQRJztRz2YDA02HfnEpSiw3qM6/xrWTEMcl
	 mGfYfeFpMB88/SLu1xlh0RNop6ebCgZLo4sIwHi9u41tDmBoVkfNzJ+Y65efoenfse
	 jRjRZPEUybiGANyvTnKNScoV7bxAZRrJEiXKuBm7MPFWj4/pOtC0f1PtloIiOrhhCc
	 uDV3uAkbHhY1g3rkvvX0w7QmhSqjUEoHEf/qNUGV5ms3agZaVdbAuza8M4tELsZ9wc
	 dV1KONNlY+IHg==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org
In-Reply-To: <fb894ecec68e03fb7fc9353027c8b1a2610833d7.1659735153.git.christophe.jaillet@wanadoo.fr>
References: <fb894ecec68e03fb7fc9353027c8b1a2610833d7.1659735153.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] spi: microchip-core: Simplify some error message
Message-Id: <166057829988.697678.13235950902894348859.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 16:44:59 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_084503_945017_0C1CED2A 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, 5 Aug 2022 23:33:17 +0200, Christophe JAILLET wrote:
> dev_err_probe() already prints the error code in a human readable way, so
> there is no need to duplicate it as a numerical value at the end of the
> message.
> 
> Moreover, in the case of devm_clk_get() it would only display '0' because
> 'ret' is know to be 0 at this point.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: microchip-core: Simplify some error message
      commit: 7964e817d2311b37b86d6fbf588cd9fbe747b108

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
