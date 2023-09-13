Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19630EE7FF4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 02:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz5Y22sVwpOaD7oTlr/ugf7pPBr9N0SXht2nMt7TMyM=; b=1wj6QFB9QEBqbK
	qrt3696Kfll1gHmrj6EuHHAGN+kAGh0UgaU4GsHMtneuQ5vu2OAru7gTgfbS09z4k2oa7OQvqaOnr
	hlz1Sy22MveVkE0RrXWSo+3P8Sf09Keo0TwwD3jBHbsKcaocP5H7wul3c16lwyvgq9kT0Eb3jOe0/
	OYjWzg+AqpWL9xdCrDf2baoKdgxC1iMs0tRBVbb/GdflAeebPw6+mCQfdcj+dUo4PSywpH9VwHHSH
	ufC+I5MwvBs9OGYfz1TEYHdKD0uihHK/JUmlCsS9Ks+IkG/ndeNvLZW0CaOXi2/7RPqG+IpCvNf9k
	41mYzPcZ313IkM1B49XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgFlc-004SKF-1R;
	Wed, 13 Sep 2023 02:38:12 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgFlZ-004SJe-1m
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 02:38:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-573e0d471ceso4400245a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 19:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694572687; x=1695177487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCV0SJs4aaH7C3SBh6saHJSAUm4Tutw8CuZ1ZBrfFjc=;
        b=X/UT8MThZUtNY0JNgI4dSVxKsLBB4RWLAdStBWae7bNHm9ZyHRvBNhRyksp/MLGPZE
         Xh6yuLBf7y4MLC36qs9jfhb8STacw21I9ls7bNXt/NV/xvsTQnTDdNbxmTiy3bwZdDCN
         5P4Sbaj2fSZFNqY1MZRV4uXvwGw63CLWpzrd2PaPo8iyP277Ur1s8LRirMahNBFRBcWb
         sojmQnQREr/I6WmbpMj1EMvpOR/cLESEsgX7+Gu65rpXCPxB2EhSZSsX/1pfmPXWYbTO
         Dn6cRGLOJzlKHKY0HjWdDZIFfsdPCyEWR5Zx8BDg0SOqIs503d4JLmDOgXCBB7DTpLty
         qI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694572687; x=1695177487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCV0SJs4aaH7C3SBh6saHJSAUm4Tutw8CuZ1ZBrfFjc=;
        b=gjhlSQ/cqVRetJlmcLp+bzgxpNDH7wZrHzxRlsPX/2skqylLdlEJrp9f/Qlt1q9LbY
         R2ZzwyRZZgZTzVf+QT7++xr1YTZZdX4L/KVqKZKkjzRufS1zZXaKJ/WaMXZsIRr9sL31
         uTv9AWwRY49VvxlX9PQ1gLHt0ccneGp4VVjJ9fQLc/7vZfV2OhRw1148rq3vPQ1RvZc2
         k/tes0qYFiYus1sVtmNZNN+H4hczITmrRZdqwVrc+Kcku82Hgy4PXrNFqdui7lReIcO9
         /qBpbxxcfX6YO14GmjyaKDPXHrGMrWSgsVzMTqSc0yzezExfjY4z/aILZVF1/5xPZsub
         OLGg==
X-Gm-Message-State: AOJu0YwE7OmgB4TAuQorUkaleJOPLHXgkFYwh2DpGN1P6zDFjL3I0Mzp
	/kShKio3rCoEHm532LwfVSxjVw==
X-Google-Smtp-Source: AGHT+IH2B7XBScq2iYXM8ny2G8opApTtyTQuJqi3nFFRqw9P1cRROod8LeDTStUMGhmitD2aoTWP6g==
X-Received: by 2002:a05:6a20:b70a:b0:154:fb34:5f23 with SMTP id fg10-20020a056a20b70a00b00154fb345f23mr1049772pzb.8.1694572686918;
        Tue, 12 Sep 2023 19:38:06 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id j9-20020a170902da8900b001bbbbda70ccsm9157674plx.158.2023.09.12.19.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 19:38:06 -0700 (PDT)
Date: Tue, 12 Sep 2023 19:38:03 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v4 1/5] riscv: Checksum header
Message-ID: <ZQEgi9v1gt6MlkDv@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-1-77cc2ad9e9d7@rivosinc.com>
 <CAJM55Z-kj8eWKvR32At4kx+PPPn9OMaR88BhEqppQHSL03n50Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-kj8eWKvR32At4kx+PPPn9OMaR88BhEqppQHSL03n50Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_193809_795375_EF9677B4 
X-CRM114-Status: GOOD (  30.46  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 12, 2023 at 03:24:29AM -0700, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > Provide checksum algorithms that have been designed to leverage riscv
> > instructions such as rotate. In 64-bit, can take advantage of the larger
> > register to avoid some overflow checking.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 95 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> > new file mode 100644
> > index 000000000000..0d7fc8275a5e
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/checksum.h
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * IP checksum routines
> > + *
> > + * Copyright (C) 2023 Rivos Inc.
> > + */
> > +#ifndef __ASM_RISCV_CHECKSUM_H
> > +#define __ASM_RISCV_CHECKSUM_H
> > +
> > +#include <linux/in6.h>
> > +#include <linux/uaccess.h>
> > +
> > +#ifdef CONFIG_32BIT
> > +typedef unsigned int csum_t;
> > +#else
> > +typedef unsigned long csum_t;
> > +#endif
> 
> Hi Charlie,
> 
> Isn't unsigned long already 32bit on 32bit RISC-V, so why is this #ifdef
> needed?
Oh, I wasn't sure so I ran sizeof(long) in qemu-system-riscv32 and it
gave me 8 so assumed a long was 8 bytes. Do you think it would make what
is going on more clear if I use u32 and u64 or would you recommend just
using long?
> 
> > +
> > +/*
> > + *	Fold a partial checksum without adding pseudo headers
> > + */
> > +static inline __sum16 csum_fold(__wsum sum)
> > +{
> > +	return (~sum - ror32(sum, 16)) >> 16;
> > +}
> > +
> > +#define csum_fold csum_fold
> > +
> > +/*
> > + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> > + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
> > + * @iph is assumed to be word aligned.
> > + */
> > +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> > +{
> > +	csum_t csum = 0;
> > +	int pos = 0;
> > +
> > +	do {
> > +		csum += ((const unsigned int *)iph)[pos];
> > +		if (IS_ENABLED(CONFIG_32BIT))
> > +			csum += csum < ((const unsigned int *)iph)[pos];
> > +	} while (++pos < ihl);
> > +
> > +	/*
> > +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> > +	 * worth checking if supported without Alternatives.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> > +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > +		csum_t fold_temp;
> > +
> > +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> > +					      RISCV_ISA_EXT_ZBB, 1)
> > +		    :
> > +		    :
> > +		    :
> > +		    : no_zbb);
> > +
> > +		if (IS_ENABLED(CONFIG_32BIT)) {
> > +			asm(".option push				\n\
> > +			.option arch,+zbb				\n\
> > +				not	%[fold_temp], %[csum]		\n\
> > +				rori	%[csum], %[csum], 16		\n\
> > +				sub	%[csum], %[fold_temp], %[csum]	\n\
> > +			.option pop"
> > +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > +		} else {
> > +			asm(".option push				\n\
> > +			.option arch,+zbb				\n\
> > +				rori	%[fold_temp], %[csum], 32	\n\
> > +				add	%[csum], %[fold_temp], %[csum]	\n\
> > +				srli	%[csum], %[csum], 32		\n\
> > +				not	%[fold_temp], %[csum]		\n\
> > +				roriw	%[csum], %[csum], 16		\n\
> > +				subw	%[csum], %[fold_temp], %[csum]	\n\
> > +			.option pop"
> > +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > +		}
> > +		return csum >> 16;
> > +	}
> > +no_zbb:
> > +#ifndef CONFIG_32BIT
> > +		csum += (csum >> 32) | (csum << 32);
> > +		csum >>= 32;
> 
> The indentation seems off here.
> 
> /Emil
> 
> > +#endif
> > +	return csum_fold((__force __wsum)csum);
> > +}
> > +
> > +#define ip_fast_csum ip_fast_csum
> > +
> > +#include <asm-generic/checksum.h>
> > +
> > +#endif // __ASM_RISCV_CHECKSUM_H
> >
> > --
> > 2.42.0
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.inradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
