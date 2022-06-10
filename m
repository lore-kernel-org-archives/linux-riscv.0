Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62BDC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQ5htzH8OLFw4FbEMAlX3yPc0BbMFLBqS57eAamqZmA=; b=LjUMsER2DaMIyj
	WBwGL0zZ3km1x+dOO2KtcHhYDHG/Qkjmhq+j8q/zzzCQetzRvRIv2ou546mtSpNC44aD/g4Nvssz6
	H1YVkLS7Lfc8kPqcIG4RNg0GclD3jbC+eP+W3B6jNpfBDjeLbcTs7FTJECwV5gugt5OaWi4263dkL
	o9z7cywZFGaZTpWM3p1KfaXYBZ4ceM46K9xM0k/g/J+MFgCAW3k3HN/7UnIOuZiyhoptnpV8jkPma
	stivu0By40GAACqXWKAWL3aEl8rTcfSL+LCSZxVob52FhjOaaKq2JbsSCt1o1VSqPC78clAC2Ohli
	EL5XstngW31B0y/PQOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzh2a-008rEv-IE; Fri, 10 Jun 2022 15:59:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzh2R-008rCC-4f
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 15:59:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C02862001;
	Fri, 10 Jun 2022 15:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EDAC34114;
	Fri, 10 Jun 2022 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654876745;
	bh=weHwEH66EfvWXGzmQ2x8i+st3SEIh5/RpAWf9mVLZQ0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=sMbDWHBiiz3Ej/nBekjJ9tueu0XtORdZTiDD95KoABp3TZeDZxcze7Wy0a4Efl45R
	 Qnv36yQF3jODmIHIvCVqYnMO+MSKj1NA0Bp7hOCTYXpdsTrX/eHwcUk94rhkTWBdtu
	 Hd0VDON3pbTBpX3jeUt1XPzLpFbeLK4bhPJIRXf0Kpj5qLwZCgoyagpiSuo+MPoyR8
	 HwjENOLAPs79bxe01RyFZKl5U4PUFuet6h5ZIupSXh/FaPbocKhZrp6cSbzzylxZtf
	 MIpnAiDkbkDM01MbM99mHpuOiNW9u83Zh5mdzlTW/l8eR+ZNjAdB5SUZxulpj0kKHh
	 9Jmf/G+0+LKpg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, andy.chiu@sifive.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, palmer@dabbelt.com
In-Reply-To: <20220610074459.3261383-1-andy.chiu@sifive.com>
References: <20220610074459.3261383-1-andy.chiu@sifive.com>
Subject: Re: [PATCH next 0/1] Add simple PM operations to sifive-spi
Message-Id: <165487674459.1756526.5750583671148030437.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:59:04 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_085907_257338_13E50F2A 
X-CRM114-Status: GOOD (  14.47  )
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

On Fri, 10 Jun 2022 15:44:58 +0800, Andy Chiu wrote:
> The patch has been tested on Unmatched using pm_test. The Unmatched board
> uses SD over SPI and it was tested by initiating S2RAM cycles for all
> devices while reading/writing files at the same time. We found no dropped
> connection to the card or corrupted filesystem during test cycles.
> 
> Andy Chiu (1):
>   spi: sifive: add PM callbacks to support suspend/resume
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: sifive: add PM callbacks to support suspend/resume
      commit: a1f0161eadbd7941c09b5f4c6a210c390d2b86d6

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
