Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C794CFC276
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hcf+D8oIw2snPBHG3BarLDPuo6TfChHZjvveSl5QRCo=; b=EgMibDriJKJ/s7
	kHDnaHW6iA21lTL9hh243bxtXVlqbRFEfw5nLAoMnvK3k+a86yhBFFxxNAt4q4CjbaubvK8cf4szd
	sseDMUSaVbhU9XkD+UDLJk5tnrTqm0aEQjA0lmlx+FxO9U0gwzp0OOKaws/09vxemupajlxd0whEu
	XqoheUiq5sOCn+6UtH8ymGAxG8pSArHUFGOXcJO64Tw5UIeX9xo8y45pGZs8Kvj8XBTEv7K/nvt/A
	HymFvSxAYhdm1Hsv48Qd4jIQk5XWM8QjDcjkdbKzwyPgTPYFop9Q1kKzQYhyuvfe1n9pWD5M01WDs
	uWEEYtA5gS6yxutTe5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dGZ-00000007Zh5-1uVp;
	Tue, 15 Oct 2024 08:50:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dGX-00000007Zff-0Ua4
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 08:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5941FA41778;
	Tue, 15 Oct 2024 08:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AC3C4CEC6;
	Tue, 15 Oct 2024 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982252;
	bh=eKCHhGW5lPuKziFFhV0/ls1DKJ+Sz8/SY2/HjTb/qrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smF9Oos3+kGx+7D6m1ZdXYJXM1lQqJUKRtOl/3m7++sDE0VOmcQSvlRiHyu09fv5j
	 XyXo0GtEqqAHGi3kq9WzKEjMtVenLWj/8bk4r+z84N0MctIgSFUDfjTVyE5jiTgX6W
	 Pu6lfGno6N4MFnM3LhJryA21Ehy+vXiko9qoUyTRYisHwjuc0gf4IgyxrT1w6yjf02
	 HaeQ5VOqZtlLEr12WUtNx12Jjh0vRLI0/ELYhrHY/fAJN4yEeRyh4/SDLjvsDKYSHV
	 4NwFKMJF2Gm4KX2s81hD/imv07yAjwW1Gzl86yeg7VJ0IS1z0CQYDInTq51oSw8MDn
	 iwAmj0YZted9Q==
Date: Tue, 15 Oct 2024 09:50:45 +0100
From: Will Deacon <will@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20241015085044.GA19110@willie-the-truck>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
 <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_015053_321342_8FF69098 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10, 2024 at 12:48:05PM -0700, Tomasz Jeznach wrote:
> Introduce platform device driver for implementation of RISC-V IOMMU
> architected hardware.
> =

> Hardware interface definition located in file iommu-bits.h is based on
> ratified RISC-V IOMMU Architecture Specification version 1.0.0.
> =

> This patch implements platform device initialization, early check and
> configuration of the IOMMU interfaces and enables global pass-through
> address translation mode (iommu_mode =3D=3D BARE), without registering
> hardware instance in the IOMMU subsystem.
> =

> Link: https://github.com/riscv-non-isa/riscv-iommu
> Co-developed-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> Co-developed-by: Sebastien Boeuf <seb@rivosinc.com>
> Signed-off-by: Sebastien Boeuf <seb@rivosinc.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---

[...]

> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> new file mode 100644
> index 000000000000..700e33dc2446
> --- /dev/null
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright =A9 2022-2024 Rivos Inc.
> + * Copyright =A9 2023 FORTH-ICS/CARV
> + *
> + * Authors
> + *	Tomasz Jeznach <tjeznach@rivosinc.com>
> + *	Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#ifndef _RISCV_IOMMU_H_
> +#define _RISCV_IOMMU_H_
> +
> +#include <linux/iommu.h>
> +#include <linux/types.h>
> +#include <linux/iopoll.h>
> +
> +#include "iommu-bits.h"
> +
> +struct riscv_iommu_device {
> +	/* iommu core interface */
> +	struct iommu_device iommu;
> +
> +	/* iommu hardware */
> +	struct device *dev;
> +
> +	/* hardware control register space */
> +	void __iomem *reg;
> +
> +	/* supported and enabled hardware capabilities */
> +	u64 caps;
> +	u32 fctl;
> +
> +	/* available interrupt numbers, MSI or WSI */
> +	unsigned int irqs[RISCV_IOMMU_INTR_COUNT];
> +	unsigned int irqs_count;
> +};
> +
> +int riscv_iommu_init(struct riscv_iommu_device *iommu);
> +void riscv_iommu_remove(struct riscv_iommu_device *iommu);
> +
> +#define riscv_iommu_readl(iommu, addr) \
> +	readl_relaxed((iommu)->reg + (addr))
> +
> +#define riscv_iommu_readq(iommu, addr) \
> +	readq_relaxed((iommu)->reg + (addr))
> +
> +#define riscv_iommu_writel(iommu, addr, val) \
> +	writel_relaxed((val), (iommu)->reg + (addr))
> +
> +#define riscv_iommu_writeq(iommu, addr, val) \
> +	writeq_relaxed((val), (iommu)->reg + (addr))
> +
> +#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, time=
out_us) \
> +	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
> +			   delay_us, timeout_us)
> +
> +#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, time=
out_us) \
> +	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> +			   delay_us, timeout_us)
> +
> +#endif

Curious: why do you need these MMIO wrappers if the driver depends on
64BIT?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
