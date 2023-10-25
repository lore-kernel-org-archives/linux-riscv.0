Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E3C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P46sFFqyuyECHTJKIfa8qHMuoeagtoqpnY9DsgAWg7c=; b=ss9EE/rlhcqpuZ
	prZGCN69asVZLKdSRocgxoYAsgFY3hSUJPgt+FbWaCEpBXmbrQEIR/O1iaPyFS8XONQQcQa4UGBVc
	dq8xBIQsbPrWPTYqsyhUIcNdkDnlgC3hINdgdap4YXRHSClGuMT19gQ6HXAWGhwFIAYaz/yT1u+N1
	sj+eZ1DQptXoYz2e0bUoRkBsNvYmofP5bQdzTNwwoFxIu0f8QcAq8kigbRbv5wVioldVhy1PLrGWI
	egHHb8uc5Pkw33KUzlLOM/zBXWKirwOsCdmk0DU88023QzeiPg3wvXqgiCpZbi46UV/3Nc50wIWYY
	5a86DGrkbBLTcgcW3zoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkd9-00D5y3-2f;
	Wed, 25 Oct 2023 20:37:31 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkd6-00D5xI-02
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:37:30 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6c7b3adbeb6so110105a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698266244; x=1698871044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRvWkvBoDYkTwsED6VPJ0pdisbEkaoGqPda2wjpU/Qs=;
        b=fdrG+5d5Vva8dP1165YHVLUIYgQRqJpnCxECsYJfMlAmhlnmh4JXMqDDi7CpQZzzTz
         9jQ/kr8vWi8Jmw+6iz1uSWi/tffqksM02QkuoL+MoM2kctJNZaKPpOksvaaaxlbjAKQv
         73E6ksxhe4gYeN8sm4buTnbJ2OfQg1rGXJNLryyjQusvPSw9izycf+R98EVSxYkLXo2Q
         RDXsq5mG9RuyVlvv3v/xHMelM9aVeAmouKAn+9SJQhp/SCuFJlGcIBpQ80MLxib4rShy
         570NDz5PgqwkMNJuH6dXTLivgiB/d3pmyErCeyMYBujr1noTx4+Dg5QqB3VQ8ssEQpQ/
         25BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698266244; x=1698871044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRvWkvBoDYkTwsED6VPJ0pdisbEkaoGqPda2wjpU/Qs=;
        b=phmIrBqAQ+dJJtLBVuicDTZpzhG7WghysjO9NRd1bsUbzbnvBBYAGhcaC016PjdWgx
         uqSkTZgqZ+j9FerPgFc7Dr3mI5iosluiaf0j6Afr4w7WsboWdxneRlbzDC10Tj9ZnYlt
         qDkQOqwWzhanoEgaxAeOsxV8oxHKT31CsobGDLCIo85ctRR0ghIeKZkm+j9Ok9/Tr47A
         aMYoigjpSj9NcPvq1SYYISsEqL30h+rCGo0MairSfL3t7D8jKQ/UZf0FHvrTu7PbLH5m
         NtpwTgWYzw346erdSqgFuC4h1HROMDEncUk/CPVaQtCQhmFbNcNjyxPkZJiCKJ3UY3Wr
         fwyQ==
X-Gm-Message-State: AOJu0YxD9ws1P1pT581umXRwXcJr7QXKBuNCMB0EWWvHG/UIO/2FLJO4
	65Urq0nPz19aMVct+cYWAxmpUw==
X-Google-Smtp-Source: AGHT+IFbX7AlguqhQunscrGf7kDQdcHYoFURhBlkQP1vlzURhFZhOpWBh6z5tFsLLNMSZKF3FqxKdg==
X-Received: by 2002:a9d:6286:0:b0:6bd:152f:9918 with SMTP id x6-20020a9d6286000000b006bd152f9918mr18452849otk.14.1698266244527;
        Wed, 25 Oct 2023 13:37:24 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id g15-20020a056830160f00b006b9cc67386fsm2385303otr.66.2023.10.25.13.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:37:24 -0700 (PDT)
Date: Wed, 25 Oct 2023 13:37:21 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Subject: Re: [PATCH v7 2/4] riscv: Checksum header
Message-ID: <ZTl8gauEst2NGrw6@ghost>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
 <DM8PR11MB575134C301E7E17E72281CFAB8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB575134C301E7E17E72281CFAB8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_133728_363157_54890E62 
X-CRM114-Status: GOOD (  34.64  )
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 25, 2023 at 06:50:05AM +0000, Wang, Xiao W wrote:
> Hi Charlie,
> 
> > -----Original Message-----
> > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> > Charlie Jenkins
> > Sent: Wednesday, September 20, 2023 2:45 AM
> > To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> > <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> > <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> > linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > arch@vger.kernel.org
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> > <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>
> > Subject: [PATCH v7 2/4] riscv: Checksum header
> > 
> > Provide checksum algorithms that have been designed to leverage riscv
> > instructions such as rotate. In 64-bit, can take advantage of the larger
> > register to avoid some overflow checking.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 79
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/checksum.h
> > b/arch/riscv/include/asm/checksum.h
> > new file mode 100644
> > index 000000000000..dc0dd89f2a13
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/checksum.h
> > @@ -0,0 +1,79 @@
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
> > +#define ip_fast_csum ip_fast_csum
> > +
> > +#include <asm-generic/checksum.h>
> > +
> > +/*
> > + * Quickly compute an IP checksum with the assumption that IPv4 headers
> > will
> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> > + * @ihl is the number of 32 bit segments and must be greater than or equal
> > to 5.
> > + * @iph is assumed to be word aligned.
> 
> Not sure if the assumption is always true. It looks the implementation in "lib/checksum.c" doesn't take this assumption.
> The ip header can comes after a 14-Byte ether header, which may start from a word-aligned or DMA friendly address.

While lib/checksum.c does not make this assumption, other architectures
(x86, ARM, powerpc, mips, arc) do make this assumption. Architectures
seem to only align the header on a word boundary in do_csum. I worry
that the benefit of aligning iph in this "fast" csum function would
disproportionately impact hardware that has fast misaligned accesses.

- Charlie

> 
> > + */
> > +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> > +{
> > +	unsigned long csum = 0;
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
> > +		unsigned long fold_temp;
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
> > +				not	%[fold_temp], %[csum]
> > 	\n\
> > +				rori	%[csum], %[csum], 16		\n\
> > +				sub	%[csum], %[fold_temp], %[csum]
> > 	\n\
> > +			.option pop"
> > +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > +		} else {
> > +			asm(".option push				\n\
> > +			.option arch,+zbb				\n\
> > +				rori	%[fold_temp], %[csum], 32	\n\
> > +				add	%[csum], %[fold_temp], %[csum]
> > 	\n\
> > +				srli	%[csum], %[csum], 32		\n\
> > +				not	%[fold_temp], %[csum]
> > 	\n\
> > +				roriw	%[csum], %[csum], 16		\n\
> > +				subw	%[csum], %[fold_temp], %[csum]
> > 	\n\
> > +			.option pop"
> > +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > +		}
> > +		return csum >> 16;
> > +	}
> > +no_zbb:
> > +#ifndef CONFIG_32BIT
> > +	csum += (csum >> 32) | (csum << 32);
> 
> Just like patch 3/4 does, we can call ror64(csum, 32).
> 
> BRs,
> Xiao
> 
> > +	csum >>= 32;
> > +#endif
> > +	return csum_fold((__force __wsum)csum);
> > +}
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
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
