Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C237CC6B03
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaCBMzNNMSa0jeueTfEJRLurIKxpOspR3oSbN0MGKd8=; b=r8Xgs1hvKz/NF0
	+TAKkxHxlNHle0rdxSfGEFwtXvvaMW+mmlSGqXP06sh9NPFD+SWTw/xY9/axF2bE3RQlya4uYV7Wi
	Kh07etcTTpkiiB9PNxqBsM/GOX+XB7RDjxxlUS4vP/9p8+qJGEbVA8qTJGynWyUc+BuqNjL+xDD2h
	Ch3hUGkCySPxqV5Nh406GpBvy4KwYX0HNNvBUqb88tRuZI4MASzo8/kBwaRe1cG+qvbXzXymcEjme
	tz/HFW8xoBInqbhtKI7wccPmEYgQo+oeKJdpGcRKfB2F7sK5uetX6aB0PMNYGDcO3mVr3DqBT+Ia9
	V1FkjNc6zViV02qWlFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BkT-0000000Gv7K-0AWB;
	Thu, 02 Apr 2026 06:41:49 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BkO-0000000Gv67-1hca
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 06:41:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YGfHhgMior3q5j5JdFpPpqZ7mhPmyjTNJcKuxYUM4Og=;
	b=PEjqRz3X9AO9bly9xTiRnY2RSRvy+/eyleEdEG2Zs5ZJThQGoFAzq+a9DaZ6G2KWBL0Fwtgox
	mb7yVIutIdNIxwuTm3ChQ4+D/EKhWy0Od7B05fx0aqNrrsjim/BaK7mZt95KkadySXILXh+4Msy
	DojzRpJNoUqPW8pL8kpcd9M=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fmXDK2c4Dz1T4GW;
	Thu,  2 Apr 2026 14:35:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 868FE4056A;
	Thu,  2 Apr 2026 14:41:27 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 2 Apr 2026 14:41:26 +0800
Message-ID: <80a971b7-45ef-f0ef-55c9-5d8b1d81a94b@huawei.com>
Date: Thu, 2 Apr 2026 14:41:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] arch/riscv: Add bitrev.h file to support rev8 and brev8
Content-Language: en-US
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <akpm@linux-foundation.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260311071344.3305640-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260311071344.3305640-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_234145_125035_390DFB1A 
X-CRM114-Status: GOOD (  19.93  )
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



On 2026/3/11 15:13, Jinjie Ruan wrote:
> The RISC-V Bit-manipulation Extension for Cryptography (Zbkb) provides
> the 'brev8' instruction, which reverses the bits within each byte.
> Combined with the 'rev8' instruction (from Zbb or Zbkb), which reverses
> the byte order of a register, we can efficiently implement 16-bit,
> 32-bit, and (on RV64) 64-bit bit reversal.
> 
> This is significantly faster than the default software table-lookup
> implementation in lib/bitrev.c, as it replaces memory accesses and
> multiple arithmetic operations with just two or three hardware
> instructions.
> 
> Select HAVE_ARCH_BITREVERSE and provide <asm/bitrev.h> to utilize
> these instructions when the Zbkb extension is available at runtime
> via the alternatives mechanism.

Gentle ping.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/bitrev.h | 46 +++++++++++++++++++++++++++++++++
>  lib/bitrev.c                    |  3 ---
>  3 files changed, 47 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/bitrev.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 90c531e6abf5..e7a04b96c0c8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAS_IOPORT if MMU
>  	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_BITREVERSE
>  	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
> new file mode 100644
> index 000000000000..b1977600638a
> --- /dev/null
> +++ b/arch/riscv/include/asm/bitrev.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_BITREV_H
> +#define __ASM_BITREV_H
> +
> +#include <linux/types.h>
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +
> +extern u8 const byte_rev_table[256];
> +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBKB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB)) {
> +		unsigned long result = x;
> +
> +		asm volatile(
> +			".option push\n"
> +			".option arch,+zbkb\n"
> +			"rev8 %0, %0\n"
> +			"brev8 %0, %0\n"
> +			".option pop"
> +			: "+r" (result)
> +		);
> +
> +		if (__riscv_xlen == 64)
> +			return (u32)(result >> 32);
> +
> +		return (u32)result;
> +	}
> +
> +	return (u32)byte_rev_table[x & 0xff] << 24 |
> +	       (u32)byte_rev_table[(x >> 8) & 0xff] << 16 |
> +	       (u32)byte_rev_table[(x >> 16) & 0xff] << 8 |
> +	       (u32)byte_rev_table[x >> 24];
> +}
> +
> +static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 16;
> +}
> +
> +static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 24;
> +}
> +#endif
> diff --git a/lib/bitrev.c b/lib/bitrev.c
> index 81b56e0a7f32..05088231f31f 100644
> --- a/lib/bitrev.c
> +++ b/lib/bitrev.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -#ifndef CONFIG_HAVE_ARCH_BITREVERSE
>  #include <linux/types.h>
>  #include <linux/module.h>
>  #include <linux/bitrev.h>
> @@ -43,5 +42,3 @@ const u8 byte_rev_table[256] = {
>  	0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
>  };
>  EXPORT_SYMBOL_GPL(byte_rev_table);
> -
> -#endif /* CONFIG_HAVE_ARCH_BITREVERSE */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
