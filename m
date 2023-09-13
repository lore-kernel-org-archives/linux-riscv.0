Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E705CCA5512
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDzSWyOfyv8U32Na7hWq5u1GbRi73Jik9Mb6f7xNnZ0=; b=bn88REKJf1XuH8
	ywD0AgkPxpv1Heekrz4EHIBs41faJ/zLpB/m/byLVo/KELuPmx0ggy/3S1+cxJ26801qxi1c0S/fq
	NRKRfWuDcJqyQ++Pi1SDVsMW5GhYw1M2TQPXH/bdewQjQ9UmiNLLb1+09XQDM0z9naLfH16xIJNVF
	qZNB/bEQXyIxMHEwZQL9f0ZdQJylZehGU6ZXNMvTky8Eg6adrPl7onbHLeByxWQX9hQKd8t6Iw+U1
	kdWO0lr/Fiq+4aITO/hMlXj7TuLfdfitY/Gv/ftN91llE9UaM0Elrz8IC2ygVXo3GP6DmIQDoKA1F
	2NNKi1+o4LfJjIBLeNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgM2O-005IGk-0P;
	Wed, 13 Sep 2023 09:19:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgM2J-005IDi-17
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 09:19:53 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B26793F671
	for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694596785;
	bh=QtCA0UtRzCSjKL8jQ8LuLqlWRxghJL7WuWVY8knUOsQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=X5Fny7FYuObTIPO3NToF+rc3XSp3Rnty3cIBwb78GkwpNkJ2QYFa2ijHLelNrU4WT
	 T9Ltewab6+841dU0xHDGK9nHpm7wU7pM/7t5z1gmsCtjEMfjVMhJcJiSBs1s3nC78U
	 suvLXt9AiKCE3YCxvuGNWHL5PCwu6kvJQBGjBOl1HuvDtYlNEL+ENyQXa2b6cm4ljG
	 UEY1lb1xMQ4hvmKoiakBfA9i1zYnek9i/272Dr0HvpfVFN4kTldmx4bp8I+7ll7vQM
	 eCsxmxT7zuwgEIUxUwiIdrxg8eGgAnWU8FVfJNTR5LBZw9+gHqvaO5X0TIVnrYzgn5
	 QPVaixAI8+DoQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4150f8480c5so57254801cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 02:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694596784; x=1695201584;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtCA0UtRzCSjKL8jQ8LuLqlWRxghJL7WuWVY8knUOsQ=;
        b=J5b8KqfLeYsPdcCTFAu8cS42uT0xb8C4ACXDSsdxMoqY5fgroyHGprJmSR2cbwBBTE
         JUDPG954a5myIndrJvOimA4KkgcYmHUNkMsf/v3hsvJ9eHzhaz0Qr+9nO01MTu/DvCe/
         lJql1edZ2RYh0C7RJ5vmH7msN9MAUzgy0rYUhllPDoZdP0hjvClCfmqxXp92+7mx3CDp
         W5huze9+kl7sJ6PNGBrOkTRZFt65WkO1Y1TaU2ZVZKYuvjx5ucW2Pa1tEToQ8k0/sOhe
         gcbtebga1X7HlPvRHlwuYtFLKzt6QOkU9KX7i4Jo39MI+MY4Sp8AoP1SXnxss3tJIhWV
         feUQ==
X-Gm-Message-State: AOJu0YzdT2M+IyWJB1CFHxyStAyINAW8gIxcSoouFb+IWgFDoDCCsCRQ
	5paZ609Ni12IuBKjQyT3EKzdCXMCuUBPcwXCzhN+YDCKcJW10EX5FcTY7UZk1rFZ/VRrT2BKRby
	xsveJ4NC8IiK2Orbx1hwP94wfu2iOvDSzoecWYv4QvszqeJydyLiPsfCu4tFPew==
X-Received: by 2002:ac8:5e50:0:b0:410:8873:aca with SMTP id i16-20020ac85e50000000b0041088730acamr1946441qtx.52.1694596784431;
        Wed, 13 Sep 2023 02:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEPEk+g8sSB+NpwuSLALIeaLj2VlTbMgY40JOMaj8TmrfLzRbqL3eZIJfaog8DKhpLdeY+wYP5elUu40uvzLk=
X-Received: by 2002:ac8:5e50:0:b0:410:8873:aca with SMTP id
 i16-20020ac85e50000000b0041088730acamr1946425qtx.52.1694596784130; Wed, 13
 Sep 2023 02:19:44 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Sep 2023 02:19:43 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZQEgi9v1gt6MlkDv@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-1-77cc2ad9e9d7@rivosinc.com>
 <CAJM55Z-kj8eWKvR32At4kx+PPPn9OMaR88BhEqppQHSL03n50Q@mail.gmail.com> <ZQEgi9v1gt6MlkDv@ghost>
Mime-Version: 1.0
Date: Wed, 13 Sep 2023 02:19:43 -0700
Message-ID: <CAJM55Z9SC0ET=tBJ7s0pz+L4tRSC02yogsWtmsuhr=-jf04yjQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] riscv: Checksum header
To: Charlie Jenkins <charlie@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021951_523220_17ABD03B 
X-CRM114-Status: GOOD (  32.31  )
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

Charlie Jenkins wrote:
> On Tue, Sep 12, 2023 at 03:24:29AM -0700, Emil Renner Berthing wrote:
> > Charlie Jenkins wrote:
> > > Provide checksum algorithms that have been designed to leverage riscv
> > > instructions such as rotate. In 64-bit, can take advantage of the larger
> > > register to avoid some overflow checking.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/checksum.h | 95 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 95 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> > > new file mode 100644
> > > index 000000000000..0d7fc8275a5e
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/checksum.h
> > > @@ -0,0 +1,95 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * IP checksum routines
> > > + *
> > > + * Copyright (C) 2023 Rivos Inc.
> > > + */
> > > +#ifndef __ASM_RISCV_CHECKSUM_H
> > > +#define __ASM_RISCV_CHECKSUM_H
> > > +
> > > +#include <linux/in6.h>
> > > +#include <linux/uaccess.h>
> > > +
> > > +#ifdef CONFIG_32BIT
> > > +typedef unsigned int csum_t;
> > > +#else
> > > +typedef unsigned long csum_t;
> > > +#endif
> >
> > Hi Charlie,
> >
> > Isn't unsigned long already 32bit on 32bit RISC-V, so why is this #ifdef
> > needed?
> Oh, I wasn't sure so I ran sizeof(long) in qemu-system-riscv32 and it
> gave me 8 so assumed a long was 8 bytes. Do you think it would make what
> is going on more clear if I use u32 and u64 or would you recommend just
> using long?

Yeah, it doesn't seem like csum_t is used anywhere else, so I'd just use
unsigned long if all you want is a register sized unsigned value. It'll be more
familiar and easier to read for most people.

> >
> > > +
> > > +/*
> > > + *	Fold a partial checksum without adding pseudo headers
> > > + */
> > > +static inline __sum16 csum_fold(__wsum sum)
> > > +{
> > > +	return (~sum - ror32(sum, 16)) >> 16;
> > > +}
> > > +
> > > +#define csum_fold csum_fold
> > > +
> > > +/*
> > > + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> > > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> > > + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
> > > + * @iph is assumed to be word aligned.
> > > + */
> > > +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> > > +{
> > > +	csum_t csum = 0;
> > > +	int pos = 0;
> > > +
> > > +	do {
> > > +		csum += ((const unsigned int *)iph)[pos];
> > > +		if (IS_ENABLED(CONFIG_32BIT))
> > > +			csum += csum < ((const unsigned int *)iph)[pos];
> > > +	} while (++pos < ihl);
> > > +
> > > +	/*
> > > +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> > > +	 * worth checking if supported without Alternatives.
> > > +	 */
> > > +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> > > +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > > +		csum_t fold_temp;
> > > +
> > > +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> > > +					      RISCV_ISA_EXT_ZBB, 1)
> > > +		    :
> > > +		    :
> > > +		    :
> > > +		    : no_zbb);
> > > +
> > > +		if (IS_ENABLED(CONFIG_32BIT)) {
> > > +			asm(".option push				\n\
> > > +			.option arch,+zbb				\n\
> > > +				not	%[fold_temp], %[csum]		\n\
> > > +				rori	%[csum], %[csum], 16		\n\
> > > +				sub	%[csum], %[fold_temp], %[csum]	\n\
> > > +			.option pop"
> > > +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > > +		} else {
> > > +			asm(".option push				\n\
> > > +			.option arch,+zbb				\n\
> > > +				rori	%[fold_temp], %[csum], 32	\n\
> > > +				add	%[csum], %[fold_temp], %[csum]	\n\
> > > +				srli	%[csum], %[csum], 32		\n\
> > > +				not	%[fold_temp], %[csum]		\n\
> > > +				roriw	%[csum], %[csum], 16		\n\
> > > +				subw	%[csum], %[fold_temp], %[csum]	\n\
> > > +			.option pop"
> > > +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > > +		}
> > > +		return csum >> 16;
> > > +	}
> > > +no_zbb:
> > > +#ifndef CONFIG_32BIT
> > > +		csum += (csum >> 32) | (csum << 32);
> > > +		csum >>= 32;
> >
> > The indentation seems off here.
> >
> > /Emil
> >
> > > +#endif
> > > +	return csum_fold((__force __wsum)csum);
> > > +}
> > > +
> > > +#define ip_fast_csum ip_fast_csum
> > > +
> > > +#include <asm-generic/checksum.h>
> > > +
> > > +#endif // __ASM_RISCV_CHECKSUM_H
> > >
> > > --
> > > 2.42.0
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.inradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
