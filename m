Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784DDCD6E79
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 01:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0F8nD3QNecbfMf2X30kTDeWLwr9CqyTswkv9fEikq24=; b=ba0XtSmPy71nhI
	L0uucQyWuLnb5ZrktGVbV2iyA7v1jmkAf+rU6rQCfic+ubxIGHVgE2sHGKcQC9LDuG6OKOStOTnl0
	5SvP880noVjhGaHVvXiElCEp0ikr9StmNILHbM8o4RIq3mB8YdFj8nQ++i2DpfPOlLCDGa/G2Sbz8
	UsnY46xMN72iA1KGQGsGZlMpZf7qDL8GJRo1L1WvqwSpNXPoGPhF/mt5PcgJOpdRVQLr1SsGLSjAe
	vcyOLZuGwJC6H7ZlfKzwBCLfWi1B7iU26acDc+N8MUYHYuq+momPmdEg2Km8M/rec+NjuGu1cv4y+
	jtuy6hYaYw8IkwUminDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlUE-00000004bFb-2VX9;
	Tue, 09 Jun 2026 01:42:38 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlU4-00000004b8X-0v0q
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 01:42:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HO6DGfU3xacey1W43Ld+NtfEtj2hV6hCNfH5uDNJXJE=;
	b=mTn7KZe//jeJvtyz+0rJ7TaeRaHON4eHxFTaPps68SscPn+PRPgy9c63srUkzdwf/VJW4yr0q
	CK1avzhCuJHPDW+3L+ENfGjx7SZPrnzlMC9zN/z/gSMRwyF95vTFOLzwQT6f7nBepFzGtlQSAJp
	NvRSOj+rAodzIQE9UZhwc84=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gZBFB0jLgz1prwj;
	Tue,  9 Jun 2026 09:30:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AB0B40561;
	Tue,  9 Jun 2026 09:38:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Jun 2026 09:38:48 +0800
Message-ID: <2bd07ecf-9f7f-4c47-b5d8-0f17b72bc56d@huawei.com>
Date: Tue, 9 Jun 2026 09:38:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arch/riscv: Add bitrev.h file to support rev8 and
 brev8
To: Yury Norov <ynorov@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Eric Biggers
	<ebiggers@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
	<sdf@fomichev.me>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<netdev@vger.kernel.org>, <bpf@vger.kernel.org>
CC: David Laight <david.laight.linux@gmail.com>
References: <20260506175207.110893-1-ynorov@nvidia.com>
 <20260506175207.110893-5-ynorov@nvidia.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260506175207.110893-5-ynorov@nvidia.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_184229_871654_3EE900B5 
X-CRM114-Status: GOOD (  20.36  )
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



On 5/7/2026 1:52 AM, Yury Norov wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
> 
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
> Select HAVE_ARCH_BITREVERSE as well as GENERIC_BITREVERSE,
> and provide <asm/bitrev.h> to utilize these instructions when
> the Zbkb extension is available at runtime via the alternatives
> mechanism.
> 
> [Yury: select the options conditionally on BITREVERSE]
> 
> Link: https://docs.riscv.org/reference/isa/unpriv/b-st-ext.html
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  arch/riscv/Kconfig              |  2 ++
>  arch/riscv/include/asm/bitrev.h | 51 +++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 arch/riscv/include/asm/bitrev.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d235396c4514..a708583f785d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -104,6 +104,7 @@ config RISCV
>  	select FUNCTION_ALIGNMENT_8B if DYNAMIC_FTRACE_WITH_CALL_OPS
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_ATOMIC64 if !64BIT
> +	select GENERIC_BITREVERSE if HAVE_ARCH_BITREVERSE

Maybe 'select GENERIC_BITREVERSE if BITREVERSE' ?

>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select GENERIC_CPU_DEVICES
>  	select GENERIC_CPU_VULNERABILITIES
> @@ -128,6 +129,7 @@ config RISCV
>  	select HAS_IOPORT if MMU
>  	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_BITREVERSE if RISCV_ISA_ZBKB && BITREVERSE
>  	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>  	select HAVE_ARCH_JUMP_LABEL
> diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
> new file mode 100644
> index 000000000000..4b9b8d34cc3b
> --- /dev/null
> +++ b/arch/riscv/include/asm/bitrev.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_BITREV_H
> +#define __ASM_BITREV_H
> +
> +#include <linux/types.h>
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm-generic/bitops/__bitrev.h>
> +
> +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> +{
> +	unsigned long result;
> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> +		return generic___bitrev32(x);
> +
> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbkb\n"
> +		"rev8 %0, %1\n"
> +		"brev8 %0, %0\n"
> +		".option pop"
> +		: "=r" (result) : "r" ((long)x)
> +	);
> +
> +	return result >> (__riscv_xlen - 32);
> +}
> +
> +static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
> +{
> +	return __arch_bitrev32(x) >> 16;
> +}
> +
> +static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
> +{
> +	unsigned long result;
> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> +		return generic___bitrev8(x);
> +
> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbkb\n"
> +		"brev8 %0, %1\n"
> +		".option pop"
> +		: "=r" (result) : "r" ((long)x)
> +	);
> +
> +	return result;
> +}
> +#endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
