Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37582ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6G+2DqzzT9cBTdjSEvJ2uXevTlTYzr+dSb671RR4ynM=; b=rK50KKVVxKReUb
	UTl0b1kwjLt4BgY49y7GaXWhqZi50N7wr8NSgOtrGOksSbpWxdUgisJo7o5DhaPydrtyjjRKoWGX3
	qqjBojgJdb3OVSCT3zTIspCDl9pyCBiEyPdXxaYtI7b/hjFzCyYz72o2qRSoJJCfRaz6uhrujsOCN
	6yCy2AdbphMU6qfFqUdBJw6CbxOS/po3er4lcMD2I1Waejaj2Scr8CmljLQeDi+yb05Qz3GcAZkq7
	mWL9kz6P2hl9DdjQ4P/szj9poWEkM25LQPJzxg6CSBL20RU2ijaOBj4BdoowfyGTEUlA54+Yk9sQn
	zpaBzWPnj0DhBIPvTQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaLPk-00Djcr-EN; Mon, 19 Sep 2022 18:22:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaLPg-00DjWn-F5
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 18:22:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0101B81189;
	Mon, 19 Sep 2022 18:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F320C433D6;
	Mon, 19 Sep 2022 18:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663611752;
	bh=U1+SDYKggiG8jAFpjC++cQPT78CN9my3T9nFCzeYXmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRx9/KWPJhJxfSFZGsoHudD/h0kFRSOHLcAzPSeVZBatKL03gAH8vD3cygOGjuKhi
	 DceFV4xj40t6W/BGkvlhUeZ7rYZjMujKhu2c7UGdcBcgzU8E8ci1uMbieHbdeTGVlf
	 +vHuvXECmcBx2cLITyhFpK7r7A6PUnmEUHzfdVG3aL95UHNHDG4VBgklunZ/BedAj3
	 My4dZCKPSkWn+KfMs8U2Q8/PDMY5lSC1fYw0/ymn9wOlRw2sflBA9szU4kHlkpuAkE
	 okeNojUoaSFvuJw0QSfTj9EHpRz5+X5/JpIo66uHfXXTRy6L8dtvw3IOAGPJUYKHBA
	 yTBnz+4L31ukQ==
Date: Mon, 19 Sep 2022 19:22:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cyril Jean <Cyril.Jean@microchip.com>,
	Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>,
	Wolfgang Grandegger <wg@aries-embedded.de>,
	Hugh Breslin <hugh.breslin@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] New PolarFire SoC devkit devicetrees & 22.09
 reference design updates
Message-ID: <YyizYqHFG3vKrKFU@spud>
References: <20220916112645.567794-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220916112645.567794-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_112236_825783_EFA47CB1 
X-CRM114-Status: GOOD (  29.59  )
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

On Fri, Sep 16, 2022 at 12:26:36PM +0100, Conor Dooley wrote:
> Hey all,
> 
> Some 6.1 targeted changes here.
> Firstly, two new dev kits (one first-party & one from Aries Embedded).
> They've been sitting in our vendor tree, so are being sent where they
> belong.
> 
> Secondly, another release of our reference design for the Icicle kit
> is due in September. Usually these do not really change much for the
> devicetree, but this time around a pair of changes impact the memory
> map.
> 
> The first of these is adding dma-ranges to the pcie controller. The
> controller had some issues to begin with & with the current reference
> design (v2022.05) would not work with mainline Linux nor has it since
> reference design v2021.08. A combination of the property, a change
> to the FPGA design & a small fix to the driver will get it working
> with mainline again. The other non-backwards compatible change to the
> reference design is moves of the peripherals instantiated in the
> fabric. Currently they are fairly spread out & a common complaint has
> been that this leaves little room in the fic3 section of the memory map
> for custom peripherals without removing the existing ones.
> 
> This series depends on [0] so as not to add dtbs_check warnings. The
> fabric clock support is added by [1].

I've pushed this series to dt-for-next:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=dt-for-next

There's a minor conflict with dt-fixes as that branch deletes a property
from the pcie dt node which is moved in this series. I deleted the
property as I moved it in this series so the fix will be to take the
version in dt-for-next instead.

> 
> Thanks,
> Conor.
> 
> Changes since v4:
> - fix the incompatible interrupts on m100pfsevp
> 
> Changes since v3:
> - add an extra patch reducing the fic3 clock rate
> 
> Changes since v2:
> - drop the sd & emmc versions of the aries devicetree
> - remove a extra newline
> 
> Changes since v1:
> - made the polarberry part of an enum in patch 1
> 
> 0 - https://lore.kernel.org/linux-gpio/20220825143522.3102546-1-conor.dooley@microchip.com/
> 1 - https://lore.kernel.org/linux-clk/20220824093342.187844-1-conor.dooley@microchip.com/
> 
> Conor Dooley (8):
>   dt-bindings: riscv: microchip: document icicle reference design
>   dt-bindings: riscv: microchip: document the aries m100pfsevp
>   riscv: dts: microchip: add pci dma ranges for the icicle kit
>   riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
>   riscv: dts: microchip: icicle: update pci address properties
>   riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
>   riscv: dts: microchip: reduce the fic3 clock rate
>   riscv: dts: microchip: add a devicetree for aries' m100pfsevp
> 
> Shravan Chippa (1):
>   dt-bindings: riscv: microchip: document the sev kit
> 
> Vattipalli Praveen (1):
>   riscv: dts: microchip: add sevkit device tree
> 
>  .../devicetree/bindings/riscv/microchip.yaml  |  20 +-
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  44 ++++-
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    |   3 +-
>  .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 +++++
>  .../boot/dts/microchip/mpfs-m100pfsevp.dts    | 179 ++++++++++++++++++
>  .../dts/microchip/mpfs-polarberry-fabric.dtsi |  29 +++
>  .../dts/microchip/mpfs-sev-kit-fabric.dtsi    |  45 +++++
>  .../riscv/boot/dts/microchip/mpfs-sev-kit.dts | 145 ++++++++++++++
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |  29 ---
>  10 files changed, 499 insertions(+), 42 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
> 
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
