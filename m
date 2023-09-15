Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E91DEE644B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+N9RoW5WAs4iX5VJdRNf+fTky4mW0+4H4zP9JvV2YYI=; b=d7gdNwc1+6jC1kongG/wwuLc48
	HYEjXfuYe6JPa2tB0fwrCCibIQIbSF5SyCAk27o1mWWCEq2fy23PnM8/Zr+NKpr3ZIFlsjwKrcylf
	KJHUzi+Md1ofWkTgSGPkV3uymKu64Ey25m1IK9ZJgLB5SGonLbJcahBU5ikEri6e7sjoaPnDHSPg2
	Ixj+cjT5jOCJsO7TNrFmeWlk+w6pFYJgBbj+ugSkRefu+c+3CV5DgrvwfVIbHNnzvx1d1wKAud2Z5
	IQZzlt5JQSMTzuphb5VEoQ92EU3K9i9uTTCGGPlw338Xrn0XjXXFz1UtHBn9Ppu5FbR1W5lieCVs4
	6ESDIbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5k4-00AMYu-0C;
	Fri, 15 Sep 2023 10:08:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5k1-00AMXD-0V
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 10:08:02 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 57CCE3F633
	for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694772461;
	bh=CePvDk/TxgBw6w90UlCCAlVR7GMFDlWsOITzDbSZkZE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LxOQBjnL2SkexEhi5PNFoyFTo5OnhoCImKpNsPePVcdPnt9prpiWmR8EGydLo2hps
	 M+BW4j+fRaxoHYXT2DqlvHjpRhdGBZTD4ulVae88OAzNi23qtHSkCvxxBMPeR1uCa2
	 OCa1Bq8ntMFWsXcnB2cmk8+6a5gT+iscK9DbYO5s30HXZfvocUSL0wF0FKEioqmIyj
	 59Tllb4v+eM8i9xe1E7+6bhIEfaTKJLfqYyva4MQqmVOKViNqVbGD2xw7TNDGyAf4p
	 HCyTYh5pkcOorH2WGTfKP1G11jvQ72vtaQd4r3Y/4umi2YNIi47WwVxBDwsQ/HpU33
	 4OD4nSd/DJM9g==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4121ae638c2so19875381cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 03:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772460; x=1695377260;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CePvDk/TxgBw6w90UlCCAlVR7GMFDlWsOITzDbSZkZE=;
        b=iVGUXrVHtxMHgtoTsoOG/7rw+lLLgO6G3G5fpey0flDodHN52iPw9aAiHyFkZEaepZ
         OcyZMl3Pdn1ms0XcoGdlFBCDGzAEBqS7IL7L0yFDBOMTn4dgV2t9y4LnKCKvnKEDD0HS
         AkaIC+hgbE4avC4ecmd0jX3ltTFiv34P1W8V4ieuvzXht/pFfJgk31qk8ZRs+l9U2mKr
         mhfbSovxLnrJBy/4clNgbdmb1uBlVPvbIxJ3MsuWvvzczFqT/JJOj138IQBb6y3bo6Km
         69U5b+mlxaxYaynM14BcSExTyNgSwR+7VlJWuOYA319dXcxpCsjzNRz6P2YJ4JEzZswh
         oDZw==
X-Gm-Message-State: AOJu0YxyI6bYC7lnvjwIcFzUzuEdIsPimOKsCt+8q3D/jVXFoJdbB1Xm
	7yS2CF6aiMyd5gknSRPN9IdlLSO7ZC9TBZHVkB6tpIDe1zguNjVtiUNIRJNLSvyspCzPrZVg2/Y
	1pdCE/ceHRSxNbUe+Dz+2lIuE7z7SpT1sRIsPrnlwKwmBtZ0iCIcPDvdh4Q+n6A==
X-Received: by 2002:ac8:59ca:0:b0:412:1ba6:32af with SMTP id f10-20020ac859ca000000b004121ba632afmr1121510qtf.19.1694772460112;
        Fri, 15 Sep 2023 03:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ttv6EU1BRZWt+DGbR4+QlOm43LirF30qz5OYUZ4PVhJmX/0LnnR85y4NNlsb75YxMffLnjCJzd0uf44Zpgw=
X-Received: by 2002:ac8:59ca:0:b0:412:1ba6:32af with SMTP id
 f10-20020ac859ca000000b004121ba632afmr1121495qtf.19.1694772459877; Fri, 15
 Sep 2023 03:07:39 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Sep 2023 03:07:39 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230914-optimize_checksum-v5-2-c95b82a2757e@rivosinc.com>
References: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com> <20230914-optimize_checksum-v5-2-c95b82a2757e@rivosinc.com>
Mime-Version: 1.0
Date: Fri, 15 Sep 2023 03:07:39 -0700
Message-ID: <CAJM55Z8Pjbu8uCqh9Heaj=ScuAoYgqsEzFuxwBUCfiZmMmk+KQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] riscv: Checksum header
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_030801_334551_5CCABF65 
X-CRM114-Status: GOOD (  21.45  )
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
>  arch/riscv/include/asm/checksum.h | 79 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> new file mode 100644
> index 000000000000..2f0f224682bd
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,79 @@
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
> +#define ip_fast_csum ip_fast_csum
> +
> +#include <asm-generic/checksum.h>
> +
> +/*
> + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
> + * @iph is assumed to be word aligned.
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

This indentation is still weird.

> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}
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
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
