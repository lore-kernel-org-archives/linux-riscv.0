Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD86FC4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 02:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX8j/N5Vp0r7IhPRWeyDGk2PY8TRH0yQhGZJ+MfrfBI=; b=iWGIXQF5SUdSIlnKLKZljA72FU
	VbERcQGsf1bEyjkd9pRaQJ7/UDdgImx2Lzpv5Q7dDFiyRGsPgx5hAkbjp5xUYQQCDMWqxaUmXDC9K
	FC/FCYSf46mr+vyQVnvSw+Z3xFGT2z21awojCeIfdwyC1lsBTVvllkrryILRaDLLyw+LM2AKdmQBs
	G1w+KFTIQbNxv40lqwARFxiyHsKSc4AI89t2PAh4nkp4c8f8nSST5t4U6z3Jfg2y0H9fD0ls+cDhl
	YYkoDtMhM3wAWWEh/p8TDFzJebjWypWF4DLuAHAQ6efT+EpSJ51Uf/hTA7Gs+iSKr/dZJvy9GxE/q
	2LQxcKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s34nf-000000011xd-37Km;
	Sat, 04 May 2024 02:06:55 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s34nc-000000011wr-2znn
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 02:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714788412; x=1746324412;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9/HUwWFCApOtzCHm2pdpofQL3S13z9SIlzxOPXrKgLE=;
  b=AL7P9+4f0jOzNrZ01eD0aKTI0ZZt/vOGaFexEdJSDNsgF4RoDWWxvgyI
   uoH2MtqVwrHldHYFoSPLFMoSxjtqQ1FPiPPLsDjM6o1AiBDzv9/XIGx7k
   K2lRJIyoCIZW7w2It4/IkCQQ73nFQrlyUOJ8dmkOJlDQJbtx5ZqQ7hlwK
   34Avc3iTUw/yO2u3/9995av1203+HDqscx3HbVFnA4VNKVSaKDRFwGt1f
   WugVkO/Cnp/UrUI8AKKUQoJEGYUrYjhhOUumKgEqv7wp3DgnWkcwfmXMU
   0g0LwLfZk4oNVe1t8YljRi417VwyuFU0MRWyHt3THJ3z+3mAVpqSVhM9G
   A==;
X-CSE-ConnectionGUID: Z8zc7AhyRTaTmagiHfxs/Q==
X-CSE-MsgGUID: fnML/i/QQxmPczYdsoVsZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14395696"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="14395696"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 19:06:51 -0700
X-CSE-ConnectionGUID: fbqs6S7CTPSDYfcFMS4Sgg==
X-CSE-MsgGUID: +lc4EfxITNWBw/CbQ7Frqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="58818072"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa001.fm.intel.com with ESMTP; 03 May 2024 19:06:47 -0700
Message-ID: <b17ca96a-9e0c-43ca-9815-fee5a3661ad4@linux.intel.com>
Date: Sat, 4 May 2024 10:05:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714752293.git.tjeznach@rivosinc.com>
 <68afb8d5e45e82dfc818385e01e9ddaa659007e1.1714752293.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <68afb8d5e45e82dfc818385e01e9ddaa659007e1.1714752293.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_190652_846590_E1F5435E 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/4/24 12:12 AM, Tomasz Jeznach wrote:
> Introduce platform device driver for implementation of RISC-V IOMMU
> architected hardware.
> 
> Hardware interface definition located in file iommu-bits.h is based on
> ratified RISC-V IOMMU Architecture Specification version 1.0.0.
> 
> This patch implements platform device initialization, early check and
> configuration of the IOMMU interfaces and enables global pass-through
> address translation mode (iommu_mode == BARE), without registering
> hardware instance in the IOMMU subsystem.
> 
> Link:https://github.com/riscv-non-isa/riscv-iommu
> Co-developed-by: Nick Kossifidis<mick@ics.forth.gr>
> Signed-off-by: Nick Kossifidis<mick@ics.forth.gr>
> Co-developed-by: Sebastien Boeuf<seb@rivosinc.com>
> Signed-off-by: Sebastien Boeuf<seb@rivosinc.com>
> Signed-off-by: Tomasz Jeznach<tjeznach@rivosinc.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
