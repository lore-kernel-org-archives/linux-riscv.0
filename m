Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E82C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiCJmQZqTxIQatgNc4rXBdsyRj0kPapIkS3748l5GWc=; b=jHkkMdmR4qlFQy
	+6Z5+pMjv1y4968XGbXE5KkbyDJ9oRz1DvaU+0QCMoKz1Z4k5wpjxw35VdsrCqZTXthdjBJFcMBY9
	MOt4yaZHWUxcnuzxcbglE8tWZXNKPr01AG5I66dYx/cHCMGH+hmFTa7AY/X1cjkGJUVC6UuLucXhu
	GKjpzm4B7TDGiqr9bIsXANIPsrAwa7Xqtq0XT7r/WjWCg8c9a18i+HnG4v2+e3En+irjK/LLBKQ74
	D21MHNWYDhFheATcYfZ3s7EBcS+FoVSwOQsxX5m+R1XgxmoN3k3VonMvug8ujdw8FjY3uRqYw2hog
	wmp49/ZuWAXgNC8jXehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxxc8-006Gun-0g;
	Tue, 31 Oct 2023 22:53:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxxc5-006GtV-0j
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 22:53:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc2575dfc7so33985885ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 15:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698792811; x=1699397611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87511vkM5pQLS/sY+Xc2jbRWOxXQCc9BpRYK++HTkxM=;
        b=Tt1kfFZSxgvSzBqj7IBO1rBHp6vvg7j8zbiC6OfuLS8lGBTXamtqgjt79S6ZhJ451N
         c0EBzj8xRsOXPkuz9qRD4SaufkzuV8YvGnBLFqgMo5uunrkGnex51mMlU8XoqmbtQecb
         m/53JeapPd7W3IACaeAC7T2aoWTFMXX/4KzeEHCFR9X0nwgVRsCGEHk5HREK+E0vEVuF
         nivTrH48yvLqB85BC4EEIqrodRNZomlZrtyDFxMF+NNNPoCI9SBxw7wWpeAwkZ2s25Mk
         neOLQ+LQU6z31TsuIvludJAdAwQJvUTIE2ZAxjXxPncUoIHLE4M2Aic4VpXLlTP6lHFc
         JNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698792811; x=1699397611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87511vkM5pQLS/sY+Xc2jbRWOxXQCc9BpRYK++HTkxM=;
        b=u5s1UhkOWIhvMD0cwKgDJhH5orAMptXezaC58MuDnQA2ogvSl4NdR2MHiZLexb9kbP
         08QKngsFqIQPjC0c5uLsOWCJjmZwnE9CM6y69tiGPNf0aJ5mUEkjW78z+fig6/GC2Gf/
         8bPhHKOkJ8MfmWYfWqbzvkAl12HrrtLXj6mwKR0srZQbHEgKsb9x5HOv9LXqcA6KasVW
         dIDmmVLjU15pwHfKNsDIZTYp4kZttHxWw4KGUhTmUjGE6jsbl0J8oFpkAJSDL68msZ/D
         iUtbsks/nUNeNZ9lizkvUfwlcStlLPnOF1cXsTUSQcTKTIGF/pAquapQSImvBhSphSLO
         srmQ==
X-Gm-Message-State: AOJu0Yx3YLnxKP/XZUO5HaEBqv3YAt435ByqMdvEJ/MtBURq7RG5Znrt
	Me3U9VCLJ/xHIop2dykqy+P53Q==
X-Google-Smtp-Source: AGHT+IFkJBny1MzTOAbm3yqjjyqntKNn/QvQV635wjKHR1BORDo8BaW/HAraINKF0pHrz+lkKQOcKA==
X-Received: by 2002:a17:902:e1cd:b0:1ca:8541:e1ea with SMTP id t13-20020a170902e1cd00b001ca8541e1eamr9793668pla.0.1698792810859;
        Tue, 31 Oct 2023 15:53:30 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id e19-20020a170902ed9300b001bbb8d5166bsm75583plj.123.2023.10.31.15.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 15:53:30 -0700 (PDT)
Date: Tue, 31 Oct 2023 15:53:28 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Evan Green <evan@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 3/5] riscv: Checksum header
Message-ID: <ZUGFaCihPOnlc6Uy@ghost>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
 <20231027-optimize_checksum-v8-3-feb7101d128d@rivosinc.com>
 <DM8PR11MB5751FE93CB74EDE4A2F4876BB8A0A@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5751FE93CB74EDE4A2F4876BB8A0A@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_155333_272124_9AB52A4E 
X-CRM114-Status: GOOD (  35.14  )
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

On Tue, Oct 31, 2023 at 09:11:07AM +0000, Wang, Xiao W wrote:
> 
> 
> > -----Original Message-----
> > From: Charlie Jenkins <charlie@rivosinc.com>
> > Sent: Saturday, October 28, 2023 6:44 AM
> > To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> > <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> > <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> > Wang, Xiao W <xiao.w.wang@intel.com>; Evan Green <evan@rivosinc.com>;
> > linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > arch@vger.kernel.org
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> > <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>; Conor Dooley
> > <conor.dooley@microchip.com>
> > Subject: [PATCH v8 3/5] riscv: Checksum header
> > 
> > Provide checksum algorithms that have been designed to leverage riscv
> > instructions such as rotate. In 64-bit, can take advantage of the larger
> > register to avoid some overflow checking.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 92
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/checksum.h
> > b/arch/riscv/include/asm/checksum.h
> > new file mode 100644
> > index 000000000000..9fd4b1b80641
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/checksum.h
> > @@ -0,0 +1,92 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * IP checksum routines
> 
> The checksum helpers' usage may not be limited to IP protocol.
> 

Will remove IP from the wording.

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
> > +extern unsigned int do_csum(const unsigned char *buff, int len);
> > +#define do_csum do_csum
> > +
> > +/* Default version is sufficient for 32 bit */
> > +#ifdef CONFIG_64BIT
> > +#define _HAVE_ARCH_IPV6_CSUM
> > +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> > +			const struct in6_addr *daddr,
> > +			__u32 len, __u8 proto, __wsum sum);
> > +#endif
> 
> The do_csum and csum_ipv6_magic helpers are implemented in patch 4/5, so the
> declarations should be moved there. Otherwise, build would fail at this patch.
> 

Oops, that snuck into this patch somehow.

> > +
> > +/* Define riscv versions of functions before importing asm-
> > generic/checksum.h */
> > +#include <asm-generic/checksum.h>
> > +
> > +/*
> > + * Quickly compute an IP checksum with the assumption that IPv4 headers
> > will
> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> > + * @ihl is the number of 32 bit segments and must be greater than or equal
> > to 5.
> > + * @iph is assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
> > + *	riscv, defining IP headers to be aligned.
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
> Just like the next patch does, we can call ror64(csum, 32).

I meant to change this last time, thank you for pointing it out again.

- Charlie

> 
> BRs,
> Xiao
> 
> > +	csum >>= 32;
> > +#endif
> > +	return csum_fold((__force __wsum)csum);
> > +}
> > +
> > +#endif /* __ASM_RISCV_CHECKSUM_H */
> > 
> > --
> > 2.42.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
