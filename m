Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD3CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYXBm8fAEJGymdPr2AquFqgBxZ7xkUQDHtYkMbFuOF4=; b=C9QcL+p3WPG1vw
	cIqa3QSso4GOgiA4/IgWHnuGfqWxE1jwQmVcmVmHK3jwhnxcbIdyzLRnVZ8B1arZzEbG+g+AuDuuL
	R4XcbKYaxVfHVfXysanUxsNvyXCt1gsAQfGFzYCmdnqVHO3Otd/DODzXIHPSFazjEQqrSui+8xtb3
	AEvoXjolO1L5cVNJ8wVQIiD7XwBge6SMSi0YEJ9nYLBQX+TtTMkWlgiqZORIg+Mjhn4Q/VbjB1h2C
	bdtXoB97kgYuEoK+4XNC1BQFfqHmSEOoH7j1PwwRCZ1BNbMCHBUzPZXTTM7j/dJMosUk+TGLjfq/a
	k3N7+mbrg+OyeL1bbznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEhK-007qrJ-0L;
	Wed, 01 Nov 2023 17:08:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEhE-007qqs-31
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 17:08:04 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5b980391d70so3199863a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698858480; x=1699463280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0jwxtV8BjEMUKr1MCcns6yw/2htCkE6khzyLyRHgjw=;
        b=1wSCvug8/oOtbreDnejhbyjleWpa14kDH29lGOB8/3BLUsXvJPHpvyeXeC2uVR/0WG
         j0Oltf2Nv74rIWEU5fcTVPQID2fApjajs2w41/2lzlq6VPf0ItKcczmMtPwST+jLbagk
         q3wy/FbZhxontIU7HaVuFQUtFdF++QWIWWwFzzxB1r7rFLUk5WPuuTd6ZAEi8yfVF+rx
         gN/qZ1iBCk0w2QUvd7/WXbx+yeONd2c9rRauyCd3alB/xmAZ+PJqoFsvxW2C9wWLuuSU
         eRDr3o3hyMNqou3fIx2IyJ5HDi7lXswDKvKqKI5fy7KiAKgXuIR5DN0tTPXrrnwg1rvK
         z9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698858480; x=1699463280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0jwxtV8BjEMUKr1MCcns6yw/2htCkE6khzyLyRHgjw=;
        b=ZpCDj4A9Nk3McLrcWvQk0PjqJCA/deMWZVLFeWbw1a4fgvS9i+uus3YkM4sODCXA85
         SW5kSwdnj/2XjZqUKf87ce31ohzHFr1S51xsAVKDvlgEWmqPxYcrMToik5JjjvF4uF0F
         f+alaBSzRZCDY4pUfgLU/JErFQxelag7O1Fa8dY4I22ffuA69s7y2hC1pPNE4gCPx7DZ
         +t1l1AF6DMHPKe727g3viq3QIHneeB3OlwSW2B+SuZAdfWbOesvoZdTFjUW92cpniBF9
         rX/eq3b5KeAaH76pOO3pikJxUNvlvMfSsMQg3khQdGzgRfJ2/fKcuhM7kch7wG+ewO4f
         dhCQ==
X-Gm-Message-State: AOJu0YwQzy6suYIdOy9tU28ZZoqPpBna+6THafw/vUtOJIMWuf++f2s0
	CjhuwNQX5ZS8nkcRmltJBe1lKA==
X-Google-Smtp-Source: AGHT+IHK0new2RJGuOMeOg1bLtg3GxGg8z52nEHawRrwA8m5jo+bIus/3hti+RsRerMj5i2NpV0hmQ==
X-Received: by 2002:a05:6a20:1383:b0:17a:fa76:805f with SMTP id hn3-20020a056a20138300b0017afa76805fmr13731659pzc.23.1698858479847;
        Wed, 01 Nov 2023 10:07:59 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id t9-20020aa79389000000b00694ebe2b0d4sm1494135pfe.191.2023.11.01.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 10:07:59 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:07:56 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
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
Message-ID: <ZUKF7PDn4wZZ/2jc@ghost>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
 <20231031-optimize_checksum-v9-3-ea018e69b229@rivosinc.com>
 <ZUJtTEeFD24ZYXHQ@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZUJtTEeFD24ZYXHQ@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_100800_982458_8E526B0F 
X-CRM114-Status: GOOD (  37.29  )
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

On Wed, Nov 01, 2023 at 11:22:52PM +0800, Jisheng Zhang wrote:
> On Tue, Oct 31, 2023 at 05:18:53PM -0700, Charlie Jenkins wrote:
> > Provide checksum algorithms that have been designed to leverage riscv
> > instructions such as rotate. In 64-bit, can take advantage of the larger
> > register to avoid some overflow checking.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 81 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> > new file mode 100644
> > index 000000000000..3d77cac338fe
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/checksum.h
> > @@ -0,0 +1,81 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Checksum routines
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
> > +/* Define riscv versions of functions before importing asm-generic/checksum.h */
> > +#include <asm-generic/checksum.h>
> > +
> > +/*
> > + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> > + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
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
> 
> This looks like a open coding of riscv_has_extension_*, so if
> we use the it, the code could be rewritten as:
> 
> 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
> 		if (32bit) {
> 			asm(...)
> 
> 		} else {
> 			asm(...)
> 		}
> 		return csum >> 16;
> 	}
> #ifndef CONFIG_32BIT
> 	csum += ror64(csum, 32);
> 	csum >>= 32;
> #endif
> 	return csum_fold((__force __wsum)csum);
> 
> The code readability is improved and make it a bit easier to refactor
> the asm(...) code in the future.
> 
> And IMHO, the generated code should be the same.
> 
> Thanks

It is unfortunately not the same. riscv_has_extension_likely checks at
runtime for ZBB if alternatives is not supported. That is why the
comment is there. I can reference riscv_has_extension_likely to avoid
confusion.

- Charlie

> 
> >
> 
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
> > +	csum += ror64(csum, 32);
> > +	csum >>= 32;
> > +#endif
> > +	return csum_fold((__force __wsum)csum);
> > +}
> > +
> > +#endif /* __ASM_RISCV_CHECKSUM_H */
> > 
> > -- 
> > 2.34.1
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
