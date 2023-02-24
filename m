Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B87C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QT5mFuwSIZvWp0gyLfgO/MJxy6XT3Glvzrus2aPIpnk=; b=nvYMdXxUUQpCzI
	lApuIDM1S//BYQI4QHt3diOrHXPENTvjSI0CCHvRBUyP4uL0ovno/7BrId/gZCd60alC9BEaqFsM7
	cxTvg5Zp+je9tbwgXxcb3BTjVkOMu3dciR+eqeMF68oo4yAo+YSV0Xfo4TQ3AXM1p7Vvm/Lk1yu3h
	b8oXoYru8z+RG6IGd8hvzmcwfhZSTNO/9k34/OC2U8Ga4ua1dvaZ4MRUrXii+fm6gOnMpOCvmOvY/
	wXBwGQuKaqC0mesbgNhKDCk6Na5TZvYschoj3kBi25WAfdONMXvIUd+poTHBdLpF94rU3lvLPRxfr
	xusJGm4n/qCPpkQBd6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYd3-002gcm-0f; Fri, 24 Feb 2023 14:00:53 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYd0-002gbn-9H; Fri, 24 Feb 2023 14:00:52 +0000
Received: from [167.98.27.226] (helo=[10.35.4.85])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pVYcu-008Yc1-W1; Fri, 24 Feb 2023 14:00:45 +0000
Message-ID: <36abc02f-ef35-88a8-1fa8-ce7cebbae7ea@codethink.co.uk>
Date: Fri, 24 Feb 2023 14:00:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 6/8] RISC-V: Use Zicboz in clear_page when available
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>, 'Jisheng Zhang ' <jszhang@kernel.org>,
 'Anup Patel ' <apatel@ventanamicro.com>,
 'Conor Dooley ' <conor.dooley@microchip.com>,
 'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
 'Heiko Stuebner ' <heiko@sntech.de>,
 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Albert Ou '
 <aou@eecs.berkeley.edu>, 'Atish Patra ' <atishp@rivosinc.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-7-ajones@ventanamicro.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230221190916.572454-7-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_060050_373946_AFE1FFBF 
X-CRM114-Status: GOOD (  25.92  )
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

On 21/02/2023 19:09, Andrew Jones wrote:
> Using memset() to zero a 4K page takes 563 total instructions, where
> 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> takes 169 total instructions, where 4 are branches and 33 are nops.
> Even though the block size is a variable, thanks to alternatives, we
> can still implement a Duff device without having to do any preliminary
> calculations. This is achieved by using the alternatives' cpufeature
> value (the upper 16 bits of patch_id). The value used is the maximum
> zicboz block size order accepted at the patch site. This enables us
> to stop patching / unrolling when 4K bytes have been zeroed (we would
> loop and continue after 4K if the page size would be larger)
> 
> For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> only loop a few times and larger block sizes to not loop at all. Since
> cbo.zero doesn't take an offset, we also need an 'add' after each
> instruction, making the loop body 112 to 160 bytes. Hopefully this
> is small enough to not cause icache misses.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/Kconfig                | 13 ++++++
>   arch/riscv/include/asm/insn-def.h |  4 ++
>   arch/riscv/include/asm/page.h     |  6 ++-
>   arch/riscv/kernel/cpufeature.c    | 11 +++++
>   arch/riscv/lib/Makefile           |  1 +
>   arch/riscv/lib/clear_page.S       | 73 +++++++++++++++++++++++++++++++
>   6 files changed, 107 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/lib/clear_page.S

[snip]

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 0594989ead63..4a496552b812 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -292,6 +292,17 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
>   	if (!value)
>   		return true;
>   
> +	switch (id) {
> +	case RISCV_ISA_EXT_ZICBOZ:
> +		/*
> +		 * Zicboz alternative applications provide the maximum
> +		 * supported block size order, or zero when it doesn't
> +		 * matter. If the current block size exceeds the maximum,
> +		 * then the alternative cannot be applied.
> +		 */
> +		return riscv_cboz_block_size <= (1U << value);
> +	}
> +
>   	return false;
>   }
>   
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 6c74b0bedd60..26cb2502ecf8 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -8,5 +8,6 @@ lib-y			+= strlen.o
>   lib-y			+= strncmp.o
>   lib-$(CONFIG_MMU)	+= uaccess.o
>   lib-$(CONFIG_64BIT)	+= tishift.o
> +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>   
>   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> new file mode 100644
> index 000000000000..7c7fa45b5ab5
> --- /dev/null
> +++ b/arch/riscv/lib/clear_page.S
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +#include <asm/page.h>
> +
> +#define CBOZ_ALT(order, old, new)				\
> +	ALTERNATIVE(old, new, 0,				\
> +		    ((order) << 16) | RISCV_ISA_EXT_ZICBOZ,	\
> +		    CONFIG_RISCV_ISA_ZICBOZ)
> +
> +/* void clear_page(void *page) */
> +ENTRY(__clear_page)
> +WEAK(clear_page)

out of interest, why the __clear_page() entry and the
WEAK(clear_page)?

Just followed up with a patch to fix the modpost.

So far this seems to be working with qemu and a backport to 5.19.x

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
