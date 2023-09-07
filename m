Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0967AEC8742
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 17:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpcWE0OyAAaaY+qQuo90PUhtTfpDIdb8wUwVuhiYJaU=; b=GXSy+ydxy/5DS9
	nvOjogrzGVp4RgfI25LW6XPZMKSSIagNpJcK1ZNB0sf6HPsIufbW3wJe13SDlm+dTfZCNX8IDHN0B
	m+MlPrcnSoj6decR9wAV+usW/XCgdEiEYkbHvzeIwL+vsi2lKdJ9t/hsbA7D/TjAsm6MHs5GChTnW
	C8Z5UgKF7aFa76v//PROXRh6ns3ulGorBEfEJXUvpsAZbmxHB7Xlwro5OB9gFIPtlm7at94rWDoiL
	8eaZa7jzBeGq2nd35b2b7cAQwgpNwUw9CyZbK7crgO1HowWA+xb8w5BCG7MtNUiwONR/VfoHtTawY
	XPqqhothshbMspcPARsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ3Z-00CUps-34;
	Thu, 07 Sep 2023 17:44:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ3W-00CUoz-1u
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 17:44:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68a3082c771so880442b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694108675; x=1694713475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCtqJ2v90gtNEyhzR2bE+oo8HzdMCZa9CshpcYdMP5Q=;
        b=Lq7ljtQYfeARGE+CWJe637HP3pJsfDztjJ2DgsqFL4iXa1L7VHARd/L6s/qmhclKTT
         8/a4RnFlu8M184TnPm7Tof+YUlRifFep9xPHyuOlHFOzsRgksafgiBTSLKiqy8N3EQPb
         iCzzB9hYenVqHnUMXXGPram4Z+h0OTkTUcJVSaIdG7MZ7dS83gCQvvMB82ppPKJPk61Q
         yBtKStA+e4wRzXpdhefKiPY9u+X5o3tH8xq4Il3vACYIQeKuIoPSy1HgBO48Ox+3XXom
         NauRx25SPYo7OF7UH6Fxz8XU3Y+uVX2gR5rI8Lxyo8LuwZ+7irYJaWTwcCdTS+rsDzlG
         qilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108675; x=1694713475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCtqJ2v90gtNEyhzR2bE+oo8HzdMCZa9CshpcYdMP5Q=;
        b=Yt+tka122ydOayOfPDmED5wlMXzmb/KYAkgxTUQXei+CFa8Ms0tUbRAHyKtg+m/1pC
         6/bx+/jezE9TLpl7VhBf0cpy1NDiVX6EGkb954AW+kpPV+gzjjnUT4ZJgOFrxKcwaHo7
         YlhTGXon3ya7VwFN6WHAFCjD2hNYrdn+xi7gI/CLp0sVlqzaVoTS5NQr1YwCnUXik/7g
         4Nhv8kHHkGQEcneBYbA7Oo8ZXWx0eui6AuDfZhvR/hvz5DEIiOxGAsFM7NItGE0Tf9is
         EvyonjMHeAH3njaOksOLWIvXZ9rQP2YcJcZ8FV0zwdrlCYJshrMzfoKd0NLaoifDtE6I
         y7gw==
X-Gm-Message-State: AOJu0Yz4qxqqZotKaYM8PHndvkEsDd9Tu5GoWBnW++uWK3ofdhu08x9S
	DEyr8Dm+hMgVmvwhnH1qRj5zwA==
X-Google-Smtp-Source: AGHT+IGKlJ3xnjimABZZjw0izpcyGAzZhRB7XVrLYIALIqu7KjiK8LMDFOXECqHizN0cOMXuOlhPvA==
X-Received: by 2002:a05:6a00:14c2:b0:68b:e8b8:b9ee with SMTP id w2-20020a056a0014c200b0068be8b8b9eemr141311pfu.11.1694108675570;
        Thu, 07 Sep 2023 10:44:35 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:84f6:5055:9180:822])
        by smtp.gmail.com with ESMTPSA id c14-20020aa781ce000000b00687dde8ae5dsm5944pfn.154.2023.09.07.10.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 10:44:35 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:44:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/5] riscv: Checksum header
Message-ID: <ZPoMAGYlIxPZsE7+@ghost>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-1-ccd658db743b@rivosinc.com>
 <20230907-f8c8993dbeb24d5ea5310ec7@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907-f8c8993dbeb24d5ea5310ec7@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_104438_632421_C66169C9 
X-CRM114-Status: GOOD (  36.90  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 07, 2023 at 10:40:54AM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> Just a passing thought that I can't really test since I am meant to be
> on holidays...
> 
> On Tue, Sep 05, 2023 at 09:46:50PM -0700, Charlie Jenkins wrote:
> > Provide checksum algorithms that have been designed to leverage riscv
> > instructions such as rotate. In 64-bit, can take advantage of the larger
> > register to avoid some overflow checking.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 96 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> > new file mode 100644
> > index 000000000000..573714b9ea15
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/checksum.h
> > @@ -0,0 +1,96 @@
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
> > +
> > +/*
> > + *	Fold a partial checksum without adding pseudo headers
> > + */
> > +static inline __sum16 csum_fold(__wsum sum)
> > +{
> > +	sum += (sum >> 16) | (sum << 16);
> > +	return (__force __sum16)(~(sum >> 16));
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
> > +#ifdef CONFIG_32BIT
> > +		csum += csum < ((const unsigned int *)iph)[pos];
> > +#endif // !CONFIG_32BIT
> 
> Some of this ifdeffery really should become IS_ENABLED(), there's
> nothing in some of them that can't just get removed by the compiler.
> 
> > +	} while (++pos < ihl);
> > +
> > +#ifdef CONFIG_RISCV_ISA_ZBB
> 
> This here I can't test since I'm supposed to be AFK, but can this also
> be an IS_ENABLED()? I know it is guarding code that the toolchain may
> not support, but does it get removed before that matters?
> 
> I mainly ask because there's a host of ifdeffery here & the code would
> be a lot easier to understand if we could cut it down to a minimum.
> 
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > +		csum_t fold_temp;
> > +
> > +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> > +					      RISCV_ISA_EXT_ZBB, 1)
> > +		    :
> > +		    :
> > +		    :
> > +		    : no_zbb);
> > +#ifdef CONFIG_32BIT
> > +		asm(".option push				\n\
> > +		.option arch,+zbb				\n\
> > +			rori %[fold_temp],%[csum],16		\n\
> > +			add %[csum],%[fold_temp],%[csum]	\n\
> > +		.option pop"
> > +		: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > +#else // !CONFIG_32BIT
> > +		asm(".option push				\n\
> > +		.option arch,+zbb				\n\
> > +		    rori %[fold_temp], %[csum], 32		\n\
> > +		    add %[csum], %[fold_temp], %[csum]		\n\
> > +		    srli %[csum], %[csum], 32			\n\
> > +		    roriw %[fold_temp], %[csum], 16		\n\
> > +		    addw %[csum], %[fold_temp], %[csum]		\n\
> > +		.option pop"
> > +		: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> > +#endif // !CONFIG_32BIT
> 
> These 3 I think are pretty easy to follow immediately, but...
> 
> > +		return ~(csum >> 16);
> > +	}
> > +	/*
> > +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> > +	 * worth checking if supported without Alternatives.
> > +	 */
> > +no_zbb:
> > +#endif // CONFIG_RISCV_ISA_ZBB
> > +#ifdef CONFIG_32BIT
> > +#else // !CONFIG_32BIT
> > +	csum += (csum >> 32) | (csum << 32);
> > +	csum >>= 16;
> > +#endif // !CONFIG_32BIT
> 
> ...these ones here could be converted too, afaict.
> 
> Thanks,
> Conor.
> 
That should make it look much cleaner, I will switch over to IS_ENABLED.

- Charlie
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



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
