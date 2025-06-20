Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CD4C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0dU5pUv9bMgjGDkqk8lffRDZiu3iF4lZKiyLmjZtpU=; b=A1KM/XRgrsO0+p
	aoWcQ4XiAY6GJemCSKhXaczNjDItHI2x90uUGn4VuufbGASgr+5Bocy2b1xsC5Z6B6CywA80z8mMW
	2ExjDQN0UsLuMcSilry/2Lk9huSXXoeVEZ/aATv2V4fMsOyXJbz08H7d3kg1TBqjBGR7m4EQjnwLF
	eErtnGBGJsI+m8m9B1SBZGonh7JvtzgRpAKxzK7UuFZVMurgjRMLafhI2q8B2p/hCOB0wiRXYoxhd
	jcwx+mkkYMe+fsUMMr7f3lN9HeuL3vLyVRI7nprYiLmuiJhD58bOHFhZa+pjFV5YZGzbNYoOHsIpq
	OYc+vctTL0tTyCTdyhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSf6g-0000000GBkd-1F5T;
	Fri, 20 Jun 2025 17:00:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeU2-0000000G7lE-0AL0
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 16:20:55 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-748da522e79so1183284b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750436453; x=1751041253; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sRqS8yCp71M8J/v9FNUlPgqOmmjQL4d9Ouv9ykz1KGU=;
        b=TLhhN1rfafksN+HSDJtheJOCYP/ZU7CMWSvcxzb6bxMYpmHoru92xGAWNY52cJrjas
         Lgoa9UVHThDkYDtdyJVysUpImtOGQy7RSxd9b1oc7fc/2oXYE3tVIiHIUo7CzItENOlc
         rV2T13CKYc53MDvkCMCoP3RAaNSgOqCXRp+ttsn2uA6qQt0D/gMbzr/WVKZsFftJUyvZ
         j73l9TEmM+JCU6Mgs7AQ0qyE4b5vzSCVAyTSLH7CETaHeRI5nleMzR7A77iK9xfSd87p
         7rWIRumg57tjE8NTXMcpypTAXNdyJhq+15BrTFBMWMSQ0L2yRBTLYNk8kGUUYS4xzW8c
         s88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750436453; x=1751041253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRqS8yCp71M8J/v9FNUlPgqOmmjQL4d9Ouv9ykz1KGU=;
        b=mnC6GHdcesOG/oIofM1x5wigXi+Nk0ST1GWRCVC+2FrFIRjxVYYG94vc8T+M+j3rN8
         OTl1DsQhZ+g9J09lABxQikNasNYJCpztFhcjKNiTzBmve145zoo1BR1MdtmUeq/ortjq
         2otnpja0L0+TheFsPQCH83LRFgpK6blt9Twz6rf0Zh8rM919i/DcgwFRPJmZLnQYJUke
         w3DsJ949RhbtSXuf8Siu+Mphq/wTX8KeKyMDHfhV+iEHZO6QL3Eg0bnbIXAcb1FDZCqn
         09/GXDfWKJPK9BE0rBfZsCq+GJfMo0rJjPV6zJBpQyLgKnMlEAn/3SamoF4ndbi0sUl/
         SRiw==
X-Forwarded-Encrypted: i=1; AJvYcCWShUBiC0gG2Y/N9K3R2qAzmhaH318cw2Vp5NQ18GNvxEF5OVVxbkNSiGuJireL6FV6rmzTHRLfWxoWdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6xl1QJi1EMP6EDldgc+Ji0FGLnra3AE1ML2HF6tKrdXRl9PBW
	UzAFoKd8O38O9jvX+gr3manV3zCVYvwxiq6NLF4nJ3rfXAU2g5ET27Go
X-Gm-Gg: ASbGncuBytO9qr2MfajRsVI+d6s/lLfR1u+wPqxqFqyABC8ZHfCDIT4+LZdCOAbHSI7
	ZIxtTS2V5fVL5kh40NOIG9CL00lceKluA9rIuoKpf9ayvdFeyvCt29oXKvy6B8L9Y1eTdatPGhr
	/Cc8fEa94TcIgc3YKCh1NBv1wRcabnpSAOxtf6wii/G0QdXeXa48BvWeckywz67UNM2EpEFt1JR
	I5DKMK5Uz0+K9NY2W+7ItZy1gIOIW8AuMoqmrzkug1bYgXXqeY0HCFh4h5U2VKPOqpVbqIZzftS
	d5SpEpC6vklD9k5J3rQWO64a0wHXAEgm+iDuXpVTGDVwl+nxlTQlnZ+S/9K55kXVqjnBg9Xg
X-Google-Smtp-Source: AGHT+IEWxjdwWEc3fO2QlYsxczv0i4+WeKU2EtbTY6IkJyPa6vf0ImD2eIaO/NXQMX7yrumuW68/Cg==
X-Received: by 2002:a05:6a21:4612:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-22026ff9abcmr5656587637.39.1750436452658;
        Fri, 20 Jun 2025 09:20:52 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6c203bsm2386636b3a.171.2025.06.20.09.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:20:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:20:47 -0400
From: Yury Norov <yury.norov@gmail.com>
To: cp0613@linux.alibaba.com
Cc: linux@rasmusvillemoes.dk, arnd@arndb.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <aFWKX4rpuNCDBP67@yury>
References: <20250620111610.52750-1-cp0613@linux.alibaba.com>
 <20250620111610.52750-3-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250620111610.52750-3-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_092054_088161_A6140BA3 
X-CRM114-Status: GOOD (  17.19  )
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

On Fri, Jun 20, 2025 at 07:16:10PM +0800, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The RISC-V Zbb extension[1] defines bitwise rotation instructions,
> which can be used to implement rotate related functions.
> 
> [1] https://github.com/riscv/riscv-bitmanip/
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/bitops.h | 172 ++++++++++++++++++++++++++++++++
>  1 file changed, 172 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index d59310f74c2b..be247ef9e686 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -20,17 +20,20 @@
>  #include <asm-generic/bitops/__fls.h>
>  #include <asm-generic/bitops/ffs.h>
>  #include <asm-generic/bitops/fls.h>
> +#include <asm-generic/bitops/rotate.h>
>  
>  #else
>  #define __HAVE_ARCH___FFS
>  #define __HAVE_ARCH___FLS
>  #define __HAVE_ARCH_FFS
>  #define __HAVE_ARCH_FLS
> +#define __HAVE_ARCH_ROTATE
>  
>  #include <asm-generic/bitops/__ffs.h>
>  #include <asm-generic/bitops/__fls.h>
>  #include <asm-generic/bitops/ffs.h>
>  #include <asm-generic/bitops/fls.h>
> +#include <asm-generic/bitops/rotate.h>
>  
>  #include <asm/alternative-macros.h>
>  #include <asm/hwcap.h>
> @@ -175,6 +178,175 @@ static __always_inline int variable_fls(unsigned int x)
>  	 variable_fls(x_);					\
>  })

...

> +static inline u8 variable_ror8(u8 word, unsigned int shift)
> +{
> +	u32 word32 = ((u32)word << 24) | ((u32)word << 16) | ((u32)word << 8) | word;

Can you add a comment about what is happening here? Are you sure it's
optimized out in case of the 'legacy' alternative?

> +
> +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBB, 1)
> +			  : : : : legacy);
> +
> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		"rorw %0, %1, %2\n"
> +		".option pop\n"
> +		: "=r" (word32) : "r" (word32), "r" (shift) :);
> +
> +	return (u8)word32;
> +
> +legacy:
> +	return generic_ror8(word, shift);
> +}
> +
> +#define rol64(word, shift) variable_rol64(word, shift)
> +#define ror64(word, shift) variable_ror64(word, shift)
> +#define rol32(word, shift) variable_rol32(word, shift)
> +#define ror32(word, shift) variable_ror32(word, shift)
> +#define rol16(word, shift) variable_rol16(word, shift)
> +#define ror16(word, shift) variable_ror16(word, shift)
> +#define rol8(word, shift)  variable_rol8(word, shift)
> +#define ror8(word, shift)  variable_ror8(word, shift)

Here you wire ror/rol() to the variable_ror/rol() unconditionally, and
that breaks compile-time rotation if the parameter is known at compile
time.

I believe, generic implementation will allow compiler to handle this
case better. Can you do a similar thing to what fls() does in the same
file?

Thanks,
Yury

> +
>  #endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE) */
>  
>  #include <asm-generic/bitops/ffz.h>
> -- 
> 2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
