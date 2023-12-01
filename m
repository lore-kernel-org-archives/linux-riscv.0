Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2902BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6GSowARvCf1A2GJwY0DZmViYgkrIICOLp/ukP5bmfo=; b=Gf++0IuEDy0a0+
	JoczJXLvj1kzUFeCDW2bodDOlrpG+FuaujNdkKWSLmqYBEBU4CdE66t/Rg9gX9otDBXjVKDDxS5E+
	ouvj1hGxr4H9FQvJF27+oFOKSgj0E34JtdrXZ63toT8/J6rdarHqdP8wt93qWZmcd0V3jLdL7Qm33
	c+B8AdQ75cx326dRjYx4jVfru86xoij2aga76Lr2ERIt43MEUqMSF5z5LsAirKxS+TBopvtvIloCI
	53XovWrjzyxMkCLOOK2UxZ1Z9vsQjncFSaWG+Kx3RZGmdcXbe7McFnlEJI2tjlcCrLSNKilnFXs0s
	iu3BSO2rhyzewTbQ2L0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8wyf-00Cmu4-1X;
	Fri, 01 Dec 2023 06:26:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8wyc-00CmsO-1t
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 06:26:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2855b3d9a9bso1502187a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 22:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701411972; x=1702016772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w52QZSruv1anio9btke3NBc3IgsdiLnww0k+vFI0c5I=;
        b=M30103D02vnWsSdbRP9PSVRUbvjYsLE6sqpKhKsllcCuchihu11Jiu9MwAHp/Neu/L
         8wLz9t2lrG9TUYbaw78ZCufYOhaj7G39RG6BMhIFdPtpzXG2rON2k6gJHCZM9Kh1sOQd
         raSqxlEyz+KtCPeh2I1NDbZhw7Hi2M9qas3lxaCADpATpD5yJekZAqBYm1J1OrzFHEgC
         XNU/K7YOR//2uXZOXlpYEZcb1GN0VsMMRMR5I0kVsyzfsVkw8ncQZqpyRhMaV499mbCW
         RZOaz5Wq/fPQeGP+PhnbJ5DOCxr4i9Jx7WeX3wy1RJsNQ/BlRNYm73I8MZRE/IBlW/1y
         ZZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701411972; x=1702016772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w52QZSruv1anio9btke3NBc3IgsdiLnww0k+vFI0c5I=;
        b=wH7rF+CP19No7TR+GZ9eKQXFXyxlyraVSTcXDa43O8ZJCFEeUB7Dt5Ze6A3IbPQx+V
         KWAOMcWfTYXzXDs0hC7SNYAmuK9ILjODWbrgzrB5lWdjp0yNccx+Bt1G3z4cMJJo7pa5
         JV3wswrfM3kUeP/OsGB7l/qUr+nx9jRQ8GpZI1+dBSgX4ryoBzmubC8HuiSiuPo5qZ00
         O5ecxa5nnntVVfyiMXxCTDlGnyzN0hxHwKXClb9H+Vun6YYhe5h7LEtQOIozwZ1BlTF5
         ziyMhKEW/2PNZduqdPAHh3wisRSieRvRzuv9MCh75W3F/niXc+zJYRBUR6nd8dEoGoN/
         c6pA==
X-Gm-Message-State: AOJu0YzYigTiHYmGN8x+jQGK4W3RLFekydS+m2SMtJTCRuzTGX6RQkNx
	cErfL0oaTszTn9jgfKl6dH9wqw==
X-Google-Smtp-Source: AGHT+IGcVvkXgYNL0bZwgQdzmwA5Q8xpnG63OxSZgijKo1J0YJ/VJq0AR+l3fm81tC0qWzJ8LdaoSA==
X-Received: by 2002:a17:90b:38cf:b0:286:457b:1970 with SMTP id nn15-20020a17090b38cf00b00286457b1970mr3533030pjb.31.1701411972456;
        Thu, 30 Nov 2023 22:26:12 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:9075:c975:12d3:f5fb])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090ad80b00b0028649b84907sm1520303pjv.16.2023.11.30.22.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 22:26:11 -0800 (PST)
Date: Thu, 30 Nov 2023 22:26:08 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	anup@brainfault.org, haicheng.li@intel.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Optimize hweight API with Zbb extension
Message-ID: <ZWl8gA1hptdjorgE@ghost>
References: <20231112095244.4015351-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231112095244.4015351-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_222614_623869_81E3802E 
X-CRM114-Status: GOOD (  20.34  )
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

On Sun, Nov 12, 2023 at 05:52:44PM +0800, Xiao Wang wrote:
> The Hamming Weight of a number is the total number of bits set in it, so
> the cpop/cpopw instruction from Zbb extension can be used to accelerate
> hweight() API.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/include/asm/arch_hweight.h | 78 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/bitops.h       |  4 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/arch_hweight.h
> 
> diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
> new file mode 100644
> index 000000000000..c20236a0725b
> --- /dev/null
> +++ b/arch/riscv/include/asm/arch_hweight.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Based on arch/x86/include/asm/arch_hweight.h
> + */
> +
> +#ifndef _ASM_RISCV_HWEIGHT_H
> +#define _ASM_RISCV_HWEIGHT_H
> +
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +
> +#if (BITS_PER_LONG == 64)
> +#define CPOPW	"cpopw "
> +#elif (BITS_PER_LONG == 32)
> +#define CPOPW	"cpop "
> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +static __always_inline unsigned int __arch_hweight32(unsigned int w)
> +{
> +#ifdef CONFIG_RISCV_ISA_ZBB
> +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBB, 1)
> +			  : : : : legacy);
> +
> +	asm (".option push\n"
> +	     ".option arch,+zbb\n"
> +	     CPOPW "%0, %0\n"
> +	     ".option pop\n"
> +	     : "+r" (w) : :);
> +
> +	return w;
> +
> +legacy:
> +#endif
> +	return __sw_hweight32(w);
> +}
> +
> +static inline unsigned int __arch_hweight16(unsigned int w)
> +{
> +	return __arch_hweight32(w & 0xffff);
> +}
> +
> +static inline unsigned int __arch_hweight8(unsigned int w)
> +{
> +	return __arch_hweight32(w & 0xff);
> +}
> +
> +#if BITS_PER_LONG == 64
> +static __always_inline unsigned long __arch_hweight64(__u64 w)
> +{
> +# ifdef CONFIG_RISCV_ISA_ZBB
> +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBB, 1)
> +			  : : : : legacy);
> +
> +	asm (".option push\n"
> +	     ".option arch,+zbb\n"
> +	     "cpop %0, %0\n"
> +	     ".option pop\n"
> +	     : "+r" (w) : :);
> +
> +	return w;
> +
> +legacy:
> +# endif
> +	return __sw_hweight64(w);
> +}
> +#else /* BITS_PER_LONG == 64 */
> +static inline unsigned long __arch_hweight64(__u64 w)
> +{
> +	return  __arch_hweight32((u32)w) +
> +		__arch_hweight32((u32)(w >> 32));
> +}
> +#endif /* !(BITS_PER_LONG == 64) */
> +
> +#endif /* _ASM_RISCV_HWEIGHT_H */
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index b212c2708cda..f7c167646460 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -271,7 +271,9 @@ static __always_inline int variable_fls(unsigned int x)
>  #include <asm-generic/bitops/fls64.h>
>  #include <asm-generic/bitops/sched.h>
>  
> -#include <asm-generic/bitops/hweight.h>
> +#include <asm/arch_hweight.h>
> +
> +#include <asm-generic/bitops/const_hweight.h>
>  
>  #if (BITS_PER_LONG == 64)
>  #define __AMO(op)	"amo" #op ".d"
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
