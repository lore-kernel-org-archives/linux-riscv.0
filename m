Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA924C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQjS9yZbadoU7lAmCKUsltFdxW43nviM5DCCBB58AdI=; b=yCrohBFxtcKHaY
	6Lyx1xOMNO61Z7uV36nig3ltHF8DJXc9LtI6PWZ8pQ0D3GrmebxCU7yWJra7AYkOaRjZlhW0PpKI1
	2pmhg4AuGLksJB1gNJWHi2Jz0VoP6Ya9C57Z5wEZ5vIte4afpglG3CsH0bLfIZtAmG2hF4MCqvpdq
	0adIWlw91cj4wujv0M8EPacI+Hv4I8/ktCVQgLEHZEYQO5ZxOT41PGafMcubRIEXZ/Shww9riBVOd
	nzonsup8SXSN/IKbbOwv1Lxs+aQQDQMsZCI12bdKPkoTOcNuqFMLe6hQygLlgORx5iPpEx+NB0xkZ
	m+L+cSfQ5WeTlIFs9Tzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDFV-007kj9-25;
	Wed, 01 Nov 2023 15:35:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDFP-007kh6-0W
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 15:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02E8561198;
	Wed,  1 Nov 2023 15:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AE3C433C9;
	Wed,  1 Nov 2023 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698852909;
	bh=bbdrSxFMrsXv8i5RW4uSoBXIoUFMBluPi9Yoa790odM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgJY1V2HKsWnaXdqbPjdfzpglTtq4dcJLMF+pW0xil4K7rwUmLxqh1iiY/XXQOjXM
	 M19pPpzwc1M6I8QCWhA1O5ynJKE2lWLDj1CWSGJAW+n2OEagaQkhjs0A964+/7Rk1Z
	 s1svrJnFT0glrtxFNZktZ0K1STk+LOAhF01HCtPqYkAjde+kWePYT/uNA7buXZwuRe
	 uqIJI9OiyIs+0BodAgzGbRjZthhdhCTKL2vkMt5vAoC8SNHr2AODXhPZI+y+pwpsTI
	 sgygKOQ+nEVsJ+EXqCWQEfLur/RiWcWDx7MHGphZBGPQh7yxxHDq0ot/N/Cr1MFhnP
	 BZ8cyZlqOvbVQ==
Date: Wed, 1 Nov 2023 23:22:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 3/5] riscv: Checksum header
Message-ID: <ZUJtTEeFD24ZYXHQ@xhacker>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
 <20231031-optimize_checksum-v9-3-ea018e69b229@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031-optimize_checksum-v9-3-ea018e69b229@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_083511_306393_987CED33 
X-CRM114-Status: GOOD (  28.51  )
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

On Tue, Oct 31, 2023 at 05:18:53PM -0700, Charlie Jenkins wrote:
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/checksum.h | 81 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> new file mode 100644
> index 000000000000..3d77cac338fe
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Checksum routines
> + *
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#ifndef __ASM_RISCV_CHECKSUM_H
> +#define __ASM_RISCV_CHECKSUM_H
> +
> +#include <linux/in6.h>
> +#include <linux/uaccess.h>
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +/* Define riscv versions of functions before importing asm-generic/checksum.h */
> +#include <asm-generic/checksum.h>
> +
> +/*
> + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
> + * @iph is assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
> + *	riscv, defining IP headers to be aligned.
> + */
> +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> +{
> +	unsigned long csum = 0;
> +	int pos = 0;
> +
> +	do {
> +		csum += ((const unsigned int *)iph)[pos];
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			csum += csum < ((const unsigned int *)iph)[pos];
> +	} while (++pos < ihl);
> +
> +	/*
> +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> +	 * worth checking if supported without Alternatives.
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)

This looks like a open coding of riscv_has_extension_*, so if
we use the it, the code could be rewritten as:

	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
		if (32bit) {
			asm(...)

		} else {
			asm(...)
		}
		return csum >> 16;
	}
#ifndef CONFIG_32BIT
	csum += ror64(csum, 32);
	csum >>= 32;
#endif
	return csum_fold((__force __wsum)csum);

The code readability is improved and make it a bit easier to refactor
the asm(...) code in the future.

And IMHO, the generated code should be the same.

Thanks

>

> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +
> +		if (IS_ENABLED(CONFIG_32BIT)) {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				not	%[fold_temp], %[csum]		\n\
> +				rori	%[csum], %[csum], 16		\n\
> +				sub	%[csum], %[fold_temp], %[csum]	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		} else {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				rori	%[fold_temp], %[csum], 32	\n\
> +				add	%[csum], %[fold_temp], %[csum]	\n\
> +				srli	%[csum], %[csum], 32		\n\
> +				not	%[fold_temp], %[csum]		\n\
> +				roriw	%[csum], %[csum], 16		\n\
> +				subw	%[csum], %[fold_temp], %[csum]	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		}
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}
> +
> +#endif /* __ASM_RISCV_CHECKSUM_H */
> 
> -- 
> 2.34.1
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
