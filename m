Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D865C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rgjIR2BuDdZvJtbFWqEB2PBa7xyl6O6dR+9EO5OQFHw=; b=POSaGlirj1IEL43xt+59cyrKSY
	VlIwClaGeRPH6Hi2nkeFWJKRuLFD2DGW/e0KneN7ESVvT/anxQRgDWYSvmGc7mDzRSHo729Z45Oma
	kV1hedbqeczblRdhscldvU1eYfoRZp5Xzbn2Rjvv5uJRuX/IXs2J5zJC8IRfo/srxAJxYKP6u0OVN
	HFObLfLp9O3G+vK8ObDTXNShhYBznYrlVoVmT0eTDRPU5kY2eKYijJn+j15Fu8TzxjyLFXZQMNhj5
	MYgIXOZtiYvv+pUT751j6UE7nZL3zy1A3p0bUbd9bEnKhR4EjRpOvytVsUEUwwNgkryyodVVm/5pX
	1Dfzta4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6IX-0000000BLml-1NQG;
	Wed, 03 Jul 2024 20:09:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6IT-0000000BLlk-3p7t
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 20:09:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fb0d88fd25so8105545ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1720037384; x=1720642184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4FouA7VioUzPJdQBxarBi0pOj5dSVbdiVe7TRmDJpg=;
        b=0tkR2QQu4CmY+OIYjxka4/pS2hDZI68IQoBcqj7FlOCptiBAKy165oI0R2esswL168
         0/4pnsWsHgY1+XlHm3HcwnlNfOFvv/P68nT3uhksxawsZiw/keQ/tYV3T5St7xJ3Y2h0
         Pcjh34U0kU5JQNiW071vQD2j3RR96+cdrGSN8O7b6eA3Sh4u70ixwuQVW4DjRrH5yjqj
         KonHKa9/Jm6tJ9QZZeTSwZJKdP8MRf2U8lxQgfW249aBrY8sPwPKTHiBtCdALFK+HaSu
         XKLNuiVwex6gOLLqRGWMAladDTfQ697Vyyrbd6+9DHnyPsZkcs/kR04kEdJ2cSylw0l/
         7bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720037384; x=1720642184;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4FouA7VioUzPJdQBxarBi0pOj5dSVbdiVe7TRmDJpg=;
        b=GZ+FG4WdICTyiA31iy5BlAIFgatbPLs2Wb7kVtXicWswQAlnZ13njihYE1tRHocWaH
         bUxgU08oiKSuHKIOtBVEB79FRcj9ypV+cZMOI7wgotlWElHzc+IxZYEyD92I50bFbIWv
         fMCnYgdZTIAWbQqwn1fTYaY/a/ZTaXwEYNblrSM3Vy+6RHzEv44Q8e4xQwGycRYIdKFk
         VeTIyhXEser1INLmwOHPcspgjCsvlNscj54UR8s5Abwb27W+3ODHfX2YulTiOyAOkywk
         kTQsu725dvJ16e+xtiU0h+/gtFrPJnJR3VrPK+SUoYlKYc9h3lNDHE3IwmzlIEes/FPg
         xXDQ==
X-Gm-Message-State: AOJu0Yy/EvBxXQdkjfllDcsHsxTeOpHBltD7nMhdD/7KXfImEzoImpOl
	WYgh69d04p/i9tSgsE9VQhtlnEZ1Zez90wEM3mWG4RDLHLiIXbb9Rt42yMJzIY24wSzTclHkUYF
	/
X-Google-Smtp-Source: AGHT+IE/RAJExYCxtp42/QiVcBw56WCduRLPuKmlGp9uvOrWj161yHkrj+IXxb7OGhVp3sjVz2IG2g==
X-Received: by 2002:a17:902:f687:b0:1f9:fb0f:ba05 with SMTP id d9443c01a7336-1fb1a088d8dmr39645665ad.26.1720037383898;
        Wed, 03 Jul 2024 13:09:43 -0700 (PDT)
Received: from localhost ([199.68.152.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a8df09fsm8386574a12.34.2024.07.03.13.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 13:09:43 -0700 (PDT)
Date: Wed, 03 Jul 2024 13:09:43 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Jul 2024 13:09:40 PDT (-0700)
Subject: Re: [PATCH v1 0/5] PolarFire SoC Icicle Reference Design PCIe ?support?/fixes
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, daire.mcnamara@microchip.com,
  robh@kernel.org, krzk+dt@kernel.org, samuel.holland@sifive.com, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-011d3bea-b607-4df2-a65c-7b08547cb85e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_130946_198446_7F9C688D 
X-CRM114-Status: GOOD (  23.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Jun 2024 04:09:12 PDT (-0700), Conor Dooley wrote:
> Hey all,
>
> Here's some patches that add an Erratum to enable non-coherent DMA
> support for PolarFire SoC. By nature of being an FPGA, and due to the
> PCIe root ports being only 32-bit capable, many bitstreams configure the
> FPGA fabric such that peripherals in the fabric become non-coherent. The
> PCIe root ports on PolarFire SoC are connected to the core-complex via
> the fabric, and therefore can be (and regularly are) made DMA
> non-coherent. The Icicle Kit Reference Design has been configuring the
> PCIe root port in this manner since late 2022 and in a way unsupported
> by mainline since earlier that year. Adding this non-coherent DMA
> support makes PCIe functional on those FPGA designs. Daire did almost all
> the work to figure out how to support these kinds of designs, and this
> series depends on his patches to introduce the required dma-ranges
> handling for the root port driver:
> https://lore.kernel.org/linux-pci/20240531085333.2501399-1-daire.mcnamara@microchip.com/
>
> The final patch depends on:
> https://lore.kernel.org/linux-pci/20240527-slather-backfire-db4605ae7cd7@wendy/
>
> I'm not sure if an Erratum is really the right way to go about doing
> this, but I didn't want to make ARCH_MICROCHIP depend on NONPORTABLE.
> An alternative would be to add a menu under drivers/soc like Renesas
> does and allow it to be toggled as an option there instead.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if you want to take this via some other tree.

I don't see any issue calling it an erratum, if it lets us keep building 
generic kernels for these systems that seems like a good enough agrument 
to me.

>
> Thanks,
> Conor.
>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Samuel Holland <samuel.holland@sifive.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
>
> Conor Dooley (5):
>   cache: ccache: allow building for PolarFire
>   cache: ccache: add mpfs to nonstandard cache ops list
>   RISC-V: Add an MPFS erratum for PCIe
>   riscv: dts: microchip: modify memory map & add dma-ranges for pcie on
>     icicle
>   riscv: dts: microchip: update pcie reg properties
>
>  arch/riscv/Kconfig.errata                     | 19 +++++
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 77 ++++++++++++-------
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    | 44 +++++++++--
>  .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  6 +-
>  .../dts/microchip/mpfs-polarberry-fabric.dtsi |  6 +-
>  drivers/cache/Kconfig                         |  2 +-
>  drivers/cache/sifive_ccache.c                 |  2 +
>  7 files changed, 116 insertions(+), 40 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
