Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81879C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 05:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxVNq9Air3VIK5IZOvzdmcDWhP3DuhDG9kZLb4PuUl4=; b=F637tlRVffO/sq
	ICzGHpzts4vOXIDSv2LaeGiA/lAY8yl8yvx7uq2YVESi54/NoMec3EgEWYCnAUlEGuNDUQS5x3UMt
	vujnMJJgkuwxBk7OdKEY6uerGe2lDJwVvuDBZiivBWvDw06GCB6Kyhz2eVF4PWCzQyguL51jyggCP
	eNg3yinHvmaiGU+UNsqj8QQmuO7BRoFVnYJKVpuv5DASX4STbY84yUWOp5QBJ7QnbPP8lx6zFPWTT
	CcrgjloimYaQJ25pLUAGmrJ/THRaJq3cNSnZe+wgrd8hcysgHcmUqQDP3bTNgs/jwsZ9D2rZd89Do
	wcFUsxxTXU6A8rbLad7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCuxi-00AlRZ-14;
	Tue, 12 Dec 2023 05:05:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCuxe-00AlQw-2V
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 05:05:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CD196166E;
	Tue, 12 Dec 2023 05:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CC0C433C8;
	Tue, 12 Dec 2023 05:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702357535;
	bh=6JkIk+zKrh2X9NAaqlazkFZaKG6WIrBp/Ny5YCmwqKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kd6xo4qcDip9YPf15fjNs2e+6tzBlYqsaUmvWs5bwFT3Rhjm2SQDmQorVY5Zt+0/3
	 eu1+jAeW/FxTTq1EB4fN0zG1QvL1Lp//Jc2xUgjlCfd3115QlDKiptuK1cGlg5dJI9
	 tx0qngz6kAtzS5Q6kAORUFCajAhVjY1vzm2HapXJQ7tMSXszgPo1yjMYHBJs6ah++M
	 rAerlBUzuSv1yAStIofLk44K6/erJxKBgza8AG+3YkEGi1Am+CgsbnFA210gGieVNV
	 YjX2BA6+yzfqKeSOGGNNIousJ3ZAMwYW9loiWamPPjJ4dp/XIyFcw3/NuV80RjWb2f
	 BG9kSYBTwMSnQ==
Date: Tue, 12 Dec 2023 12:53:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 0/4] RISC-V: Add MMC support for TH1520 boards
Message-ID: <ZXfnLx9qBUKtyqkq@xhacker>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_210538_922513_E654D48F 
X-CRM114-Status: GOOD (  35.06  )
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

On Wed, Dec 06, 2023 at 12:09:20AM -0800, Drew Fustini wrote:
> This series enables the MMC controller in the T-Head TH1520 SoC and
> enables the eMMC and microSD on both the BeagleV Ahead and the Sipeed
> LicheePi 4A.
> 
> The drivers/mmc/host patches from v6 were applied by Ulf and are already
> in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 was
> only a defconfig patch and three device tree patches. This v8 is a
> followup to change the dwcmshc node names to match the documentation.
> 
> Jisheng - can you apply the dts patches to your for-next tree?
> 
> I tested with the riscv defconfig on the Ahead [4] and LPi4a [5]. I only
> tested eMMC and microSD and plan to enable SDIO WiFi in the future.

Thank Drew, for this patch series:

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

I asked Conor's help to take T-HEAD SoC dts patches.
> 
> References:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=49f23745b064cdb6270402403ef58125d78ba183
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aff35fbc7830510ef7cbcf8e32a041a55de3dc51
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af076680db846ed54b00b9a763473d1043446993
> [4] https://gist.github.com/pdp7/881342620ec1509685f23a387e2fc8d7
> [5] https://gist.github.com/pdp7/97017ad88d83fccac18eba69bff817b7
> 
> Changes in PATCH v8:
> - change dwcmshc node labels to match TH1520 System Reference Manual:
>   emmc, sdio0, sdio1
> 
> Changes in PATCH v7:
> //lore.kernel.org/r/20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com
> - fix sorting of DT properties in the mmc nodes
> 
> Changes in PATCH v6:
> https://lore.kernel.org/linux-riscv/20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com/
> - set the mmc nodes to disabled in the th1520.dtsi
> 
> Changes in PATCH v5:
> https://lore.kernel.org/r/20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com
> - fix logic in th1520_sdhci_set_phy() to correctly check that both
>   MMC_CAP2_NO_SD and MMC_CAP2_NO_SDIO are set in host->mmc->caps2
> - add Acked-by's from Adrian
> 
> Changes in PATCH v4:
> https://lore.kernel.org/linux-riscv/20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com/
> - set DWCMSHC_CARD_IS_EMMC when (MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO)
>   as checking MMC_CAP_NONREMOVABLE is not sufficient
> - change prefix of phy functions from th1520 to dwcmshc as they are not
>   th1520 specific
> - remove unneeded check of priv in dwcmshc_phy_1_8v_init()
> - remove unneeded check of auto-tuning in th1520_execute_tuning()
> - fix order of new nodes in th1520-beaglev-ahead.dts: move sdhci_clk
>   before uart_sclk, move mmc0 and mmc1 before uart0
> - fix comment typos pointed out by Adrian
> - add trailers that I missed from v2
> 
> Changes in PATCH v3:
> https://lore.kernel.org/r/20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com
> - always call th1520_sdhci_set_phy() in th1520_set_uhs_signaling()
>   and not only when timing is MMC_TIMING_MMC_HS400. This allows the
>   microSD slot to work as th1520_phy_3_3v_init() is called from
>   th1520_sdhci_set_phy().
> - add mmc1 node for mmc controller connected to the microSD slot
> - add enable mmc1 and add properties for microSD on the Ahead and LPi4A
> 
> Changes in PATCH v2:
> https://lore.kernel.org/r/20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com
> - make use of BIT(), GENMASK(), FIELD_PREP(), FIELD_GET()
> - add EXPORT_SYMBOL_GPL(__sdhci_execute_tuning)
> - call th1520_phy_1_8v_init() when FLAG_IO_FIXED_1V8 is set
> - set DWCMSHC_CARD_IS_EMMC when mmc caps contains MMC_CAP_NONREMOVABLE
> - remove manipulation of AT_CTRL_AT_EN from th1520_set_uhs_signaling()
> - remove unneccessary cycle of enabling and disabling AT_CTRL_AT_EN in
>   th1520_execute_tuning()
> - remove th1520_phy_1_8v_init_no_pull()
> - remove th1520_phy_3_3v_init_no_pull()
> - remove FLAG_PULL_UP_EN from priv->flags
> - remove thead,phy-pull-up device tree property
> 
> Changes in PACH v1:
> https://lore.kernel.org/all/20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com/
> - ADMA mode now works correctly due to a patch from Jisheng on the list
>   ("riscv: dts: thead: set dma-noncoherent to soc bus") and this commit
>   from Icenowy that is now merged: 8eb8fe67e2c8 ("riscv: errata: fix
>   T-Head dcache.cva encoding").
> - Expose __sdhci_execute_tuning from sdhci.c so that it can be called
>   from th1520_execute_tuning()
> - Refactor the define macros for all the PHY related registers to make
>   it easier to understand the bit fields that the code is manipulating
> - Replace magic numbers in the PHY register writes with proper defines
> - Replace non_removable in dwcmshc_priv with check of mmc_host.caps
> - Drop dt prop "thead,io-fixed-1v8" and instead check for existing
>   properties: "mmc-ddr-1_8v", "mmc-hs200-1_8v", or "mmc-hs400-1_8v"
> - Rename dt prop from "thead,pull-up" to "thead,phy-pull-up" and
>   improve the description in the dt binding
> - Replace pull_up_en in dwcmshc_priv with bit field in new flags field
> - Create th1520_set_uhs_signaling() and call dwcmshc_set_uhs_signaling()
>   from it instead of adding th1520 code to dwcmshc_set_uhs_signaling()
> - Return -EIO instead of -1 upon errors in th1520_execute_tuning()
> 
> Changes in RFC v2:
> https://lore.kernel.org/linux-riscv/20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com/
> - Expand dwcmshc_priv based on driver in the T-Head 5.10 kernel:
>   delay_line, non_removable, pull_up_en, io_fixed_1v8
> - New boolean property "thead,pull-up" indicates phy pull-up config
> - New boolean property "thead,io-fixed-1v8" indicates that io voltage
>   should be set to 1.8V during reset
> - Add th1520_phy_1_8v_init() as voltage_switch op
> - Add th1520_execute_tuning() as the platform_execute_tuning op
> - Added th1520_sdhci_reset() as the .reset op. This function will set
>   io voltage to 1.8V after calling the standard sdhci_reset() function.
> - Modified dwcmshc_set_uhs_signaling() to enable SDHCI_CTRL_VDD_180 when
>   io_fixed_1v8 is true
> - Add many defines for register offsets and settings based on the mmc
>   support in the T-Head downstream v5.10 kernel
> 
> RFC v1 series:
> https://lore.kernel.org/r/20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com
> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
> Drew Fustini (4):
>       riscv: defconfig: Enable mmc and dma drivers for T-Head TH1520
>       riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
>       riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
>       riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
> 
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 +++++++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 20 +++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              | 34 ++++++++++++++++++++++
>  arch/riscv/configs/defconfig                       |  2 ++
>  4 files changed, 76 insertions(+)
> ---
> base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
> change-id: 20231129-th1520_mmc_dts-e472bcc70d0d
> 
> Best regards,
> -- 
> Drew Fustini <dfustini@baylibre.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
