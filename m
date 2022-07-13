Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC2BC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAbtG9Kns79RKvF+8cstTihOl99GdvjYCIYlIwMDa60=; b=CqwNI/ufZe59JL
	2aZ4G0cgmYjwB2erY9LchEU9fQ1ad90OukBjO9ue9SQ3TytvXkKNh7PvmC4D+9CMw/3rWFmv71ngn
	m98U4MAX9o9SDjiFxI9wbCy1N0calLRggQjYGOAubRipfrZVMmjkGZ8/I52kSAG7gAjNwHaX7H9WZ
	0iA2vG/iZe03aBrMHRxIYJUOBm8PmuB8MtSXFEdgArgeGgWi48cYi5QXra2uG3N5htPSLepIzj7YN
	FmD1V6L08OQ9rCnr2V6tdX7baSMNvEsEaMJaeAYua4FNeUw8Jj5tNNFJLT5uFohY5e+NvzinnW8Rw
	+W8YCAgCvTKVdCkuG6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdDh-004O8w-JL; Wed, 13 Jul 2022 14:20:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdDe-004O3y-6k
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 14:20:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 36670B8200C;
	Wed, 13 Jul 2022 14:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76FFC341C0;
	Wed, 13 Jul 2022 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657721997;
	bh=gZlZ9XEUO5Tr8VlBA2Fy3TMHOnEzakxg3l035XJS0ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sXmw8e0T8l3/UhBWRTNHdZt1I2FAsDabkybIwxE8ZSVsvo3XpM7EVxvoGFoCuFFby
	 mrDnJv2plFpgTEqQUdMBC/GJad8zgFGmWr53rhHX/OhYSp8T8Z/KVSYBqRbyXlltvv
	 eMoB+bHhBaCksiIngXRQRhMY5UhMN7fTYIcuAe0vHexHuw5cURbWveLEJPqDQMvURH
	 TYBbaYkJTR10pWjb8KIuTqdaxuaoKSZ3yJICfmiN+h5C97EL3MR1vNrjhA077Ma8yo
	 FwRhDK5fBz4zyJJ4wtQx+wQ1a/DnFeUxmN7jiMgm1xLi01Hpffxeu8nc1GpI4sGCXX
	 SNwLEpeC8AOoQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, yangyingliang@huawei.com
Cc: daire.mcnamara@microchip.com, conor.dooley@microchip.com
In-Reply-To: <20220713025657.3524506-1-yangyingliang@huawei.com>
References: <20220713025657.3524506-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2 0/3] spi: microchip-core: fix and cleanups
Message-Id: <165772199640.105087.16657528468194823666.b4-ty@kernel.org>
Date: Wed, 13 Jul 2022 15:19:56 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_072002_482419_F67C8EAE 
X-CRM114-Status: GOOD (  11.47  )
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

On Wed, 13 Jul 2022 10:56:54 +0800, Yang Yingliang wrote:
> Patch #1 fix a UAF in mchp_corespi_remove().
> Patch #2 and #3 some cleanups to simpify code.
> 
> v1 -> v2:
>   add patch #3 to use dev_err_probe to simpify code.
> 
> Yang Yingliang (3):
>   spi: microchip-core: fix UAF in mchp_corespi_remove()
>   spi: microchip-core: switch to use devm_spi_alloc_master()
>   spi: microchip-core: switch to use dev_err_probe()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: microchip-core: fix UAF in mchp_corespi_remove()
      commit: e82c6d62a1f2347cde69c169fcf37e4d26f89b98
[2/3] spi: microchip-core: switch to use devm_spi_alloc_master()
      commit: 5d56d8974d1e5fa5d7d0761037377e03f6edcc66
[3/3] spi: microchip-core: switch to use dev_err_probe()
      commit: cdeaf3a99a02b6f8566bcaacc9c3501c6cceda74

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
