Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCF1C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttqsK5u/vE+Qy6NOCKci6uEMaEWoxu8fMq3HUbMORCo=; b=3bxFYAn3WPCzpC
	fpcXLZdkLxUEWpOlzH/ppoqsjYEauJp9v8+qGdX6Yd3n05S/n/JZuhEgFQe/fLwVttSbNXTbiS9Nq
	Ar0LolaAOe3bG8/EG1D6tT9gpRWbLUNhzYNdz9Cd5UvpLiC9+CimubODSh8FCRA77UVgkpOV3BO+a
	87IvDCIvaB4zABAzpDyl7+7H2X42L0oWOCyoUbwOwYEaiCoqapO8MeSLuD9Ap6UkvGKvBjDoX4uPx
	18tJLlnA+mppmtfgGy+r65/a96GQ5PaFxT1B0ZMauU2ZL4u8LtlUSYAXwqdHJi7tIiSm904eZlhHI
	80+pNXGAH8mFNVCxTHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIjX-00BRz7-Kf; Thu, 24 Nov 2022 20:22:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIjU-00BRyG-Tj
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 20:22:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F1D66222B;
	Thu, 24 Nov 2022 20:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD3CC433D6;
	Thu, 24 Nov 2022 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669321323;
	bh=bbc1mWNbqU6lQapGVFaaUlUseWtvQkuYpamywwpjrHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3buWyLLznmNRcU6+mxcGpwSsueyRw+r7g74TgHlOxD7fcb/E6POc16vBx0QFmwRp
	 7VL6paj4Y3y6jZ5qgKTf0EvX+4XZyHzIyKim7Yj840/XwD5gdHnBED1WisROo7bWCE
	 HaNcDAybTbNnt/z3FgSs/KXpoLTkixBq2CYXZUmO34m/g/mxNe5F3RTU3KJYnuqPsa
	 tItNpZTXRsw1t4ekSpVGgGmziZ9uECkenU2P2kpyJzBw4Q+vk4zH2xqd8274LNQNJJ
	 AsvYawfMJDno1HFGrOXXlwi5Z/9obKG218PbITG/07nWuM6sQSsd2BIX8PU8cZ/MsH
	 Ly0eV1k20Q4Xg==
Date: Thu, 24 Nov 2022 20:21:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 3/7] riscv: errata: Add Andes alternative ports
Message-ID: <Y3/SZPjzXsd8dfkl@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124172207.153718-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_122205_075515_8F2E8964 
X-CRM114-Status: GOOD (  31.30  )
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

On Thu, Nov 24, 2022 at 05:22:03PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add required ports of the Alternative scheme for Andes CPU cores.

You've got a lot of nice info in your cover letter that would be nice in
the git history. Could you add some of the commentary about why the
Andes cache needs special handling from there to this commit message
please?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC v3 -> v4
> * New patch
> ---
>  arch/riscv/Kconfig.erratas           | 22 +++++++++
>  arch/riscv/errata/Makefile           |  1 +
>  arch/riscv/errata/andes/Makefile     |  1 +
>  arch/riscv/errata/andes/errata.c     | 68 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h |  3 ++
>  arch/riscv/include/asm/errata_list.h |  5 ++
>  arch/riscv/kernel/alternative.c      |  5 ++
>  7 files changed, 105 insertions(+)
>  create mode 100644 arch/riscv/errata/andes/Makefile
>  create mode 100644 arch/riscv/errata/andes/errata.c

> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
> new file mode 100644
> index 000000000000..ec3e052ca8c7
> --- /dev/null
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Erratas to be applied for Andes CPU cores
> + *
> + *  Copyright (C) 2022 Renesas Electronics Corporation.
> + *
> + * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cacheflush.h>
> +#include <asm/errata_list.h>
> +#include <asm/patch.h>
> +#include <asm/vendorid_list.h>
> +
> +static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)

To the lay reader, what's an "iocp" when it's at home? "I/O coherency
port"? Again, commit message would be a good place for the introduction
of that term :)

> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
> +		return false;
> +
> +	if (arch_id != 0x8000000000008a45 || impid != 0x500)

Can you #define these?

> +		return false;
> +
> +	riscv_cbom_block_size = 1;
> +	riscv_noncoherent_supported();
> +
> +	return true;
> +}
> +
> +static u32 andes_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
> +{
> +	u32 cpu_req_errata = 0;
> +

I read some code and when it does the opposite of what I'd expect, I
feel inclined to add a comment. In this case, you're probing for the
presence of the port `probe_iocp()`, but the interesting case is when
you don't find it. You can leave it uncommented if you like, but even
something like the below I think fits.

	/*
	 * In the absence of the I/O Coherency Port, access to certain peripherals
	 * requires vendor specific DMA handling.
	 */
> +	if (errata_probe_iocp(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_ANDESTECH_NO_IOCP);
> +
> +	return cpu_req_errata;
> +}
> +
> +void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> +					      unsigned long archid, unsigned long impid,
> +					      unsigned int stage)
> +{
> +	u32 cpu_req_errata = andes_errata_probe(stage, archid, impid);
> +	struct alt_entry *alt;
> +	u32 tmp;
> +
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
> +	for (alt = begin; alt < end; alt++) {
> +		if (alt->vendor_id != ANDESTECH_VENDOR_ID)
> +			continue;
> +		if (alt->errata_id >= ERRATA_ANDESTECH_NUMBER)
> +			continue;
> +
> +		tmp = (1U << alt->errata_id);

Is this not BIT(alt->errata_id)?

> +		if (cpu_req_errata & tmp) {
> +			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +
> +			riscv_alternative_fix_auipc_jalr(alt->old_ptr, alt->alt_len,
> +							 alt->old_ptr - alt->alt_ptr);
> +		}
> +	}
> +}
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 6511dd73e812..d8012af30cbd 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -46,6 +46,9 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  			     unsigned long archid, unsigned long impid,
>  			     unsigned int stage);
> +void andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> +			     unsigned long archid, unsigned long impid,
> +			     unsigned int stage);
>  
>  void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  				 unsigned int stage);
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 4180312d2a70..2ba7e6e74540 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -9,6 +9,11 @@
>  #include <asm/csr.h>
>  #include <asm/vendorid_list.h>
>  
> +#ifdef CONFIG_ERRATA_ANDES
> +#define ERRATA_ANDESTECH_NO_IOCP	0
> +#define ERRATA_ANDESTECH_NUMBER		1
> +#endif

Not a question for you, but I wonder why we even bother wrapping these
defines.

> +
>  #ifdef CONFIG_ERRATA_SIFIVE
>  #define	ERRATA_SIFIVE_CIP_453 0
>  #define	ERRATA_SIFIVE_CIP_1200 1
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index a7d26a00beea..4ded3e9aa3bc 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -47,6 +47,11 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
>  	case THEAD_VENDOR_ID:
>  		cpu_mfr_info->patch_func = thead_errata_patch_func;
>  		break;
> +#endif
> +#ifdef CONFIG_ERRATA_ANDES
> +	case ANDESTECH_VENDOR_ID:
> +		cpu_mfr_info->patch_func = andes_errata_patch_func;
> +		break;
>  #endif
>  	default:
>  		cpu_mfr_info->patch_func = NULL;
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
