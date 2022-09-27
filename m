Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFD9C6FA8E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2b3/olaLvFuS2QLpHLvVJ12mZrwd/8BgZToWJm8ZOAs=; b=btKbzPVwlHIrIG
	gGwVfGkMuOgqr+c8rOf34zW/Bc7pSnZFvqdmzNEwJthvBpezEm9ujOD37CCfVBoWACLLtwMXZefI+
	URCf8Ef/TMaY6g0Ll7DMDPI93JSD5sFbogQ8MIT49GYqbZDkG0RwaCfQFdviw0gzSHkuUZrtzXIzd
	NJOEQyVw7bUsYGq8R6FaXlfPGAfXFXjQ6J2F78SYBMiGRJr9hLlcsL6l5W8SurDzzxzyPsRcVVbQN
	Cj8Z18yC7GkY+80/wXbS764/qH7EFn5W+O1jLg2oe87FgWky1iA1ubBa6/j6UnZkPca7CeQr0YD4i
	LE+4h/JtnTrijN390pVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8gx-00ACdy-36; Tue, 27 Sep 2022 11:23:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8gC-00AC5I-CA
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277792; x=1695813792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n2HPdcc3mpaZRYQIKMMPJJTcYN9hCCX4WnYqtare8TQ=;
  b=uMHE2zCYa68NNRct6GzGtsx47/b34m/aCC+TRRO14YY5kJtHTpLjsyOg
   S2RMRfPbPVckjwh2W+240ltG0Ua53TpiO28STjkGGGygBgd3hsXzLH5Zp
   VnO39CUir4C9eY0QazZ5eac7HrIGkV/NUt2lj1cG2x0XwlGdkoLdGNpkK
   yixOcicB10HpkQSSYFBXiczOoTj9f9IcK07WoZtkB7CaTVP1Qr1kypnFv
   9WoFDmArLuxaJajDWUaDsx5MkHscEobTqwTVy2w8qsy4k0lpUCUom16qH
   uGaKfqCEDi6dwIFk8Lxmv6aKvBE/NyVo1CnOXrG7IPGqOVXHiaNp5T3wp
   g==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="192656218"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:23:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:23:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:23:08 -0700
Date: Tue, 27 Sep 2022 12:22:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/11] New PolarFire SoC devkit devicetrees & 22.09
 reference design updates
Message-ID: <YzLc/v68wW93CaLq@wendy>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042312_508240_6B3C7E01 
X-CRM114-Status: GOOD (  32.14  )
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

On Tue, Sep 27, 2022 at 12:19:12PM +0100, Conor Dooley wrote:
> Resending with an extra patch making some more memory map changes that
> are to be introduced in the v2022.10 reference design. Since the
> v2022.10 and v2022.09 reference designs both indepedently break
> backwards compat, v2022.09 is not compatible with <= v2022.05 and
> v2022.10 is not compatible with v2022.09, I am doing the jump directly
> to v2022.10 rather than putting an intermediate step at v2022.09.
> 
> I did not drop Krzysztof's Ack on patch 1 as s/09/10 has no impact on
> the correctness of the binding.

I had already applied v5, but I am going to apply this version instead.
I will send a PR once the v2022.10 reference design has been released on
the PolarFire SoC GitHub.

Thanks,
Conor.

> 
> --8<---
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
> 
> Thanks,
> Conor.
> 
> Changes since v5:
> - swap v2022.09 for v2022.10 in the binding
> - add a patch with the v2022.10 memory map changes
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
> Conor Dooley (9):
>   dt-bindings: riscv: microchip: document icicle reference design
>   dt-bindings: riscv: microchip: document the aries m100pfsevp
>   riscv: dts: microchip: add pci dma ranges for the icicle kit
>   riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
>   riscv: dts: microchip: icicle: update pci address properties
>   riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
>   riscv: dts: microchip: reduce the fic3 clock rate
>   riscv: dts: microchip: add a devicetree for aries' m100pfsevp
>   riscv: dts: microchip: update memory configuration for v2022.10
> 
> Shravan Chippa (1):
>   dt-bindings: riscv: microchip: document the sev kit
> 
> Vattipalli Praveen (1):
>   riscv: dts: microchip: add sevkit device tree
> 
>  .../devicetree/bindings/riscv/microchip.yaml  |  20 +-
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  43 ++++-
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    |  18 +-
>  .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 +++++
>  .../boot/dts/microchip/mpfs-m100pfsevp.dts    | 179 ++++++++++++++++++
>  .../dts/microchip/mpfs-polarberry-fabric.dtsi |  29 +++
>  .../dts/microchip/mpfs-sev-kit-fabric.dtsi    |  45 +++++
>  .../riscv/boot/dts/microchip/mpfs-sev-kit.dts | 145 ++++++++++++++
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |  30 ---
>  10 files changed, 511 insertions(+), 45 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
> 
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
