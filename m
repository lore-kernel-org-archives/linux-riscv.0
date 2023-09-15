Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34659EED60B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fprHm7HDJcle4lfSoDM5qev4IxHpkxwBF6gH1tIYIvk=; b=o5+EaZW0aiWNAD
	NRebhFujDPmj2zoAe7vhSrebwVxk+uQ6W+KL4Ko3ZVV0wYD4v13Z7ASP8WtTV1PuYPijAoGSpsiM6
	rzqN11nxcIdP3L5XlC4Qzd/eueQlzPE+H+f14Mw5sXYzw1H6wixOX/KsiMeCy/EKfyPgewJUiz3RS
	6U3pDyy6cpDhh838cIKPvWfFpMoX/cv5YO0JLa+9AdsfBVMRGiCUFV1r0NJy9VpIAjyncyWhKG1d0
	yqaE+WowduWEfm6By0gIWJjgvOqeFezDj2ZOptQSYXfTypNwT7pT1J1fcP/WND1GMpCmY/ykJYbQY
	se7pgledMSzGejIxTpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAhM-00AyiQ-3C;
	Fri, 15 Sep 2023 15:25:36 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAhK-00Aygt-10
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:25:35 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68fdd6011f2so1872786b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694791531; x=1695396331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nRnWJVlyVm74KJSvGTBFuTkn4CEKHbiJVsCA3/dFpo=;
        b=saVnKbxcP0jRfdyYG+Ruv5yyC8eEb62bP/0grnrZp3THoCe/1LRTNQVV86HW0J6xc5
         bnLV31MyPy0sDcXtNIGnrddKgoxLigiLjARu6xtVHMSWOije0XCxhXljlzaqXQLc8u6y
         oEiV4F4YCXSXCuchQ8h2P42nAOvKvR97KGBOsXs+UHSocl49SdENqWphOEehaLP+HC3N
         UU5sNsi3odPk8hHSpkxbasSIErXlHnokXQkBQ5/d3MqkYzR3teb2jWmvXcK8Sg1lQMCE
         sCI6M9XhZ1l/UDzygObMIP7OQfbd1V62uS91gZ7QgFag12YfIOWaOol5kAv6Cq53SAhG
         PUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791531; x=1695396331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nRnWJVlyVm74KJSvGTBFuTkn4CEKHbiJVsCA3/dFpo=;
        b=vy2L/Ugf3Ha4hjfTWyT2T0AT4euKHQTvBU1PZYQAxSCXNDGQGMP9QFy9LWXOc25vac
         Ie1jnqVMDdbhXt8/pp3jcvDtjVrzVxBkw49vkpyF94iGX8ygUIBgM46sf729aGWgXdVM
         xcZCCA9Y3BwYi7y/xuPnsxKxRCDxjVZZ8kwppEz60YnRsi9Q+GyipoOoWc+P0qMzFtwS
         Zv/d+JLu28YQAngHBz4f4C9FShLLb0snMxHY7+MWiXCUln6bDYNvIkC/ldYDF8BgMVXZ
         /bsHlE+jqW5Q/IwzJGtsvrN9PSXBziSgVH6eYxrus7FrhxWWFeQzx3n47IRvwz7ec6/h
         mW1A==
X-Gm-Message-State: AOJu0YwPfKQzpQKcq1xlgaMlTDWxzhXAYXwpce2UCqEfqHA84VNycSxf
	lD3reRzxjRfZGPa8T4YvHWn4KA==
X-Google-Smtp-Source: AGHT+IFWSAXm5J+VpZpxQapfS9Kf+W8q+RHFHOu4Swl+30DSpgpGlA/Al9XKHt9qI0P03NLRXI3ANw==
X-Received: by 2002:a05:6a00:a1f:b0:68f:e810:e87e with SMTP id p31-20020a056a000a1f00b0068fe810e87emr2318985pfh.31.1694791530991;
        Fri, 15 Sep 2023 08:25:30 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id x53-20020a056a000bf500b0069029a2206bsm3110322pfu.47.2023.09.15.08.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:25:30 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:25:27 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v5 2/4] riscv: Checksum header
Message-ID: <ZQR3Z2oUJYf3jSFl@ghost>
References: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
 <20230914-optimize_checksum-v5-2-c95b82a2757e@rivosinc.com>
 <CAJM55Z8Pjbu8uCqh9Heaj=ScuAoYgqsEzFuxwBUCfiZmMmk+KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8Pjbu8uCqh9Heaj=ScuAoYgqsEzFuxwBUCfiZmMmk+KQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_082534_345931_3E482B6A 
X-CRM114-Status: GOOD (  28.24  )
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

On Fri, Sep 15, 2023 at 03:07:39AM -0700, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > Provide checksum algorithms that have been designed to leverage riscv
> > instructions such as rotate. In 64-bit, can take advantage of the larger
> > register to avoid some overflow checking.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 79 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> > new file mode 100644
> > index 000000000000..2f0f224682bd
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
> > + * Quickly compute an IP checksum with the assumption that IPv4 headers will
> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
> > + * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
> > + * @iph is assumed to be word aligned.
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
> This indentation is still weird.
> 
Oof I was juggling stuff around and this wound up incorrect again at the
end, I apologize for that. I will fix it up.

- Charlie
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
