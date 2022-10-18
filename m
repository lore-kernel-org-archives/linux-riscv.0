Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A809FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pwYUGkrvrnWoAYVlC9ftgOZ2dA99u0gO+mhE0H0zSQ=; b=bKByRLQG9qqfAS
	vzDDk5eyUDcuNZfwLpbq9Li4jwwnkSSmZDK+96PCdezR6C5b+uYu5xVSN5+BVxeAh7tbdAIFVFvP5
	3mMkOZ0tbr8LRhgzmw7zqJEQxxss7qhtMEHj3fIasESaV2xq9Fj6zhsoLrsr9i3Swb8R/XGn96M2X
	hnxXCEeKSWxPXLmucHnS3Cw+MIVn3eaB79exyJhxcYaPdGFevuMbSFqxMJ0yT1CDJax2eV8D9AtQf
	TAs4M3+e6cV8jt7X/0qTof3orz9tvTE/GOw5NahDWsy0ASgot7a5+c6NdYkD1mqaOmAmTTDqc2inO
	LyziZkEelTAwWiWHcERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oklyf-006hcU-Ua; Tue, 18 Oct 2022 12:45:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oklyN-006hRe-3d
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 12:45:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79D7961368;
	Tue, 18 Oct 2022 12:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70209C433D6;
	Tue, 18 Oct 2022 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666097129;
	bh=jRFoqeAs6PqQmn5JQefnF9EBH8A3Cf2rw0GlfDexcGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kj+uLC+hQU4DVsfHXBbIlMfuFkLYVPTE5S5ePWMyvZReNHoicUZnVcBDjjN35Jjmw
	 UVN5/he5xgCYX75CRcRSY7QwxqcYsE46sFtg2RUQUekAebPA9OMSaLPW1Hb1TgzDxh
	 DpJoVPGB6gm3rI40AW8knO/iHC/Qb80zoKkyPcbg9ZJfbOErDbFci6aOfFEDM7hDeJ
	 F/6Uc2ZaFo/oKPFPk2+0brvtSEcEjZ+2gGQ+PaSMiE4MMmaERaOmKLdK/b/gp7+rDW
	 7OcNgD4mwVgq/HqiIYeLlUuTQiX5sxFLEw01HhgIUhneX3X1AOkh3HS5gPCwSeGJqK
	 JLcOlMSDjtF0Q==
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-riscv@lists.infradead.org, daire.mcnamara@microchip.com
In-Reply-To: <20221017092141.9789-1-jiapeng.chong@linux.alibaba.com>
References: <20221017092141.9789-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] spi: microchip-core: Remove the unused function mchp_corespi_enable()
Message-Id: <166609712817.385867.3776854548759783028.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 13:45:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_054531_213188_EEAF9A91 
X-CRM114-Status: GOOD (  11.89  )
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

On Mon, 17 Oct 2022 17:21:41 +0800, Jiapeng Chong wrote:
> The function mchp_corespi_enable() is defined in the spi-microchip-core.c
> file, but not called elsewhere, so delete this unused function.
> 
> drivers/spi/spi-microchip-core.c:122:20: warning: unused function 'mchp_corespi_enable'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: microchip-core: Remove the unused function mchp_corespi_enable()
      commit: 8f4b3d2f653937956fdc68b665c621dfa3cf2fa7

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
