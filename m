Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A98FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2NHk2Elcwf+74S0Vxgacvj7ENNeOOhf1nXAEFUvgic=; b=cFMmMQpEoE8RJ6
	oltQyFrGKt1QxkSxx1MD6WdZPwlVzNTUG+yZapfFcVQWdk3OMvfJyz9YgOEcXaqo7mAp9W4tucFWZ
	b/aURf2BrcjoGqakQAfN0cXwTef4/an7pjkIJDZGGFNfDB2BWzWMh2wwM8lqlx4ZBW3d1NZ/NyAvN
	pFcEnP6/iflf3Xbg9bFf9PCeL/kza/mtJmqc9Op+swFW+jwJyAiQ1+TjLBjRnm8NNGtiNRt0XpP+a
	PhI8uuc/q9sX/D+DGVigKZiiB0e9B7xvde+HcmHrbR1NYIR24JTpbAp5N7hxa6XX+lqmm3d99oPSe
	M71oE9J8S/uyl7krIX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR37-002j55-Ey; Thu, 06 Oct 2022 13:36:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR34-002j3g-8O
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:36:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z97so2835747ede.8
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=0UfzhzFU90rUX1Zui/jkz3o75f5mI9Z9O0OKWUMBplQ=;
        b=kLFfxeludzLzIaDOjssv83UlUa6NwmAXruQHUbh2cWE3MCcDBNocLfnlW04y0Uc334
         EwOsQciNnARNDGu25LPXuTA7liiU9/SLLrg7I+r1nKHdcyyX8hU21KbRMY3kFfiPUPnJ
         xTSQW/ry8qRSkPlZV3aGQ2cuKb6oSc1rorG2VLmIdIRfsaIxZjQBHgifXfosK1OLA3Qv
         SIQuyrx8qTTLNJtAzRSLCfrpDrG+3xOD4ghayD3mdf6UFOpkEjX+0WvhjBivc6X+zVAt
         JlweQb05TLiKGZM+THm0ZmdJvcGSbgMryHJX2LHf4p46utaGAc8WhnmSKJDIjKzGhFhI
         rjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0UfzhzFU90rUX1Zui/jkz3o75f5mI9Z9O0OKWUMBplQ=;
        b=biYpTAf526IQTr3H7nBZsZP/CtA0AFmWsBjib5Yb0b03BAv90QYOj/GpJ465HXDCAB
         rTLh9QkwvuemTThgPBxADj9bkEGZugLPSMpIWwp+xEZU3ktui039c5ikBbP5tBCLx8ze
         K9GAwWuoX7NBUbbW6tBHF2dJUS6KXxnqEKZnpaQwU2VV1Fri4Q39NP/Q65xykNOG8Fin
         J6xefE8siuFXz9WCdD9GDmtD4dJRD36gielTMi+0aatuDKFSVlF3gOhqtaU9huhiNhvn
         ++DYEsHyD2PJJLjg7i885y9I8SzgnGa/1FSbThIWECI+zjpjV1Ie4hYec8Xbt6ISGI/m
         H5ug==
X-Gm-Message-State: ACrzQf2arOve7YusM3FoZvepVCk3sS3Uz+nEAVeW2P0bXJpCpqRkf+eF
	ffI4ySFU0Gu3I6ZfI6dcouuF/g==
X-Google-Smtp-Source: AMsMyM6+xhVtakhKWGU9SGpwhFNpt47nCQGSZGLsdYYQsMxXm0m3+WMbSh3KS1KsDrtAiU81a23ijQ==
X-Received: by 2002:aa7:c314:0:b0:458:dc90:467a with SMTP id l20-20020aa7c314000000b00458dc90467amr4598176edq.284.1665063383412;
        Thu, 06 Oct 2022 06:36:23 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id g23-20020a056402181700b004591e6f7f47sm5838159edy.42.2022.10.06.06.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:36:23 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:36:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] riscv: introduce riscv_has_extension_[un]likely()
Message-ID: <20221006133622.xnruzidkrphgxa7d@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_063626_318774_83F19E5B 
X-CRM114-Status: GOOD (  25.27  )
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

On Thu, Oct 06, 2022 at 03:08:15PM +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, that's to say, the hart features won't change any more
> after booting, this chacteristic make it straightforward to use
> static branch to check one specific ISA extension is supported or not
> to optimize performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> Basically, for ease of maintenance, we prefer to use static branches
> in C code, but recently, Samuel found that the static branch usage in
> cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> Samuel pointed out, "Having a static branch in cpu_relax() is
> problematic because that function is widely inlined, including in some
> quite complex functions like in the VDSO. A quick measurement shows
> this static branch is responsible by itself for around 40% of the jump
> table."
> 
> Samuel's findings pointed out one of a few downsides of static branches
> usage in C code to handle ISA extensions detected at boot time:
> static branch's metadata in the __jump_table section, which is not
> discarded after ISA extensions are finalized, wastes some space.
> 
> I want to try to solve the issue for all possible dynamic handling of
> ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> riscv_has_extension_*() helpers, which work like static branches but
> are patched using alternatives, thus the metadata can be freed after
> patching.
> 
> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> [2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland@arm.com/
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/hwcap.h | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6cf445653911..54b88ee6cae1 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -8,6 +8,7 @@
>  #ifndef _ASM_RISCV_HWCAP_H
>  #define _ASM_RISCV_HWCAP_H
>  
> +#include <asm/alternative-macros.h>
>  #include <asm/errno.h>
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
> @@ -96,6 +97,42 @@ static __always_inline int riscv_isa_ext2key(int num)
>  	}
>  }
>  
> +static __always_inline bool
> +riscv_has_extension_likely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_ID_MAX,
> +			   "ext must be < RISCV_ISA_EXT_ID_MAX");
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
> +	:
> +	: [ext] "i" (ext)
> +	:
> +	: l_no);
> +
> +	return true;
> +l_no:
> +	return false;
> +}
> +
> +static __always_inline bool
> +riscv_has_extension_unlikely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_ID_MAX,
> +			   "ext must be < RISCV_ISA_EXT_ID_MAX");
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
> +	:
> +	: [ext] "i" (ext)
> +	:
> +	: l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  
>  #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
> -- 
> 2.37.2
>

Cheers to Mark for this nifty idea and to you for bringing it to riscv.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
