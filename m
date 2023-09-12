Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF0CA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u6IQxLd/K3FkGWaRBwi0Lxbn6RtGRLXHEhT7eIjdBjo=; b=t4Y8+75FEao0SUsDAKV/m3YUzG
	BMt7mIvq5NY7ob12IYp3QiAkNYItFrPgiw36cyMBYImQXU7xEP2XsKiDLt9swZuO6bnebIQbK0NID
	z7SbT8c69AWPJdK/dVwvizsc4krCPXhx/bov0wigYYyBRXIEnkZLqBy0i5GS/7PrGlhZ+oVN4/QIA
	DfDgCVtsGs/k1gpLSxygqZjn9VC6L5XTgMZodBfcb2rErfOGLlClQwlOPHI/pacHGogoXWGxHaQDU
	UkM/9cw5NjZTV3eTqN2BvxkYI4b7ikWlpiOPqiAwU7KCkaYh13eHJZNSmlnxeYdlM9C59ei50k4gT
	+fVZlQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0ZS-002xFD-2f;
	Tue, 12 Sep 2023 10:24:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0ZP-002xEf-0e
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 10:24:37 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E0CBA3F660
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694514271;
	bh=l8BkGdGGrHPYHMDfqGr70IoZdJP5aCZ3/gTRxv7NEnI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bxPqtTxhUB7c+h8857W3uzUWNAG/Li/T41vNUM4SbRLx3rrwtMwnsVykJR0ZhmnGP
	 r/fhigXL1PMzxHWZm/plx6EOzKrjK0SWsBxzXEVYoLd1y3CtdLrN7rSn24y76Bi2mm
	 g8U2Tw+/RraFHDnPkDRIrQuCy+pK7uEvl4VJO4Af01H+vH0mXYhuQ2U3Euy7CHE/01
	 j0yLoQx2N89fC53nRj7yKMiZndvMW+PqT8C9Xa+EaidtT2FuASdSTVHww9G/QvebEC
	 752sP6l0owF57nhhmpwUtRavLpVuKF2GMtb/zMTTg5fmfZOmHKvhQkxJrYH2EqbXKt
	 ITNwGXBdJk8Dw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-414d73cb191so49863441cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 03:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694514270; x=1695119070;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8BkGdGGrHPYHMDfqGr70IoZdJP5aCZ3/gTRxv7NEnI=;
        b=Lx319vIctCUG2dFgnmBoiTTNW8G7PE/bSxp/UGr8OwU6cFzTK08wInz0EeJ8rjrDPs
         gw+SnuvFMQY2O/E7232ZVCjoWXnI5GwRhKXS+ML4fbRze51IxUWeMckHly37FH+aSYEd
         sZ55J6hb9fgVA7YK/iz9ixV1RiTYMOCKR9dHRJttyFus33cjdvOXy6u2BTqArsKmieJF
         ij8yEbiVRE9KxAWw6hVXj7u/Ym/bLTEdiC7f+XLtmdis9JDU02+lONjFBTmlgdQbcbEE
         N3Uh0aDI4BJ/B65WE2eDm4xRofAulZko9d5ugWAxhRhwHWOlk1Df4O+noqN3NgBMYttS
         BAUw==
X-Gm-Message-State: AOJu0YziHxlsF4O8gma+WLZRoeCLHABKVpLVweEoslHYvnJyBCDbvD8k
	EE3hgzV2sqEdXbxhnYMD/9rg1LgpbGYxCAF7MS+aRO7WGr/MywshhtRhho9B0kC1cec4oEGhbeF
	tMFPrHUsAgD9icJqcIkJU6HlYuUFO2cAO7ex6nI+dxlTU+czWxLWpE6adt71QwrtE0sAKWg==
X-Received: by 2002:ac8:5bc6:0:b0:410:a92f:1dbc with SMTP id b6-20020ac85bc6000000b00410a92f1dbcmr2597646qtb.11.1694514270633;
        Tue, 12 Sep 2023 03:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcRRNlOxn0auXsus2rU7wb6g+N0hAl2+PusClukejrqFC+4BhUnEqgdRBRLS8X1AS8tFGKnIp2FEizUwCOONg=
X-Received: by 2002:ac8:5bc6:0:b0:410:a92f:1dbc with SMTP id
 b6-20020ac85bc6000000b00410a92f1dbcmr2597632qtb.11.1694514270378; Tue, 12 Sep
 2023 03:24:30 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Sep 2023 03:24:29 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230911-optimize_checksum-v4-1-77cc2ad9e9d7@rivosinc.com>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com> <20230911-optimize_checksum-v4-1-77cc2ad9e9d7@rivosinc.com>
Mime-Version: 1.0
Date: Tue, 12 Sep 2023 03:24:29 -0700
Message-ID: <CAJM55Z-kj8eWKvR32At4kx+PPPn9OMaR88BhEqppQHSL03n50Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] riscv: Checksum header
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_032435_573849_9B35B0A8 
X-CRM114-Status: GOOD (  22.57  )
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

Charlie Jenkins wrote:
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h | 95 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> new file mode 100644
> index 000000000000..0d7fc8275a5e
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * IP checksum routines
> + *
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#ifndef __ASM_RISCV_CHECKSUM_H
> +#define __ASM_RISCV_CHECKSUM_H
> +
> +#include <linux/in6.h>
> +#include <linux/uaccess.h>
> +
> +#ifdef CONFIG_32BIT
> +typedef unsigned int csum_t;
> +#else
> +typedef unsigned long csum_t;
> +#endif

Hi Charlie,

Isn't unsigned long already 32bit on 32bit RISC-V, so why is this #ifdef
needed?

> +
> +/*
> + *	Fold a partial checksum without adding pseudo headers
> + */
> +static inline __sum16 csum_fold(__wsum sum)
> +{
> +	return (~sum - ror32(sum, 16)) >> 16;
> +}
> +
> +#define csum_fold csum_fold
> +
> +/*
> + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
> + * @iph is assumed to be word aligned.
> + */
> +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> +{
> +	csum_t csum = 0;
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
> +		csum_t fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
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
> +		csum += (csum >> 32) | (csum << 32);
> +		csum >>= 32;

The indentation seems off here.

/Emil

> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +#include <asm-generic/checksum.h>
> +
> +#endif // __ASM_RISCV_CHECKSUM_H
>
> --
> 2.42.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.inradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
