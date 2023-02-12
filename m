Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9426CC05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 23:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5qXagj6GxrqiZYI32U/lpZ082jFvCACGPOgi0IuTIA=; b=EhZx6Q7g3SjWIL
	+jgHhmKno/8XXsv3LhJeiyOH/xzUbZm/7VUgr7NXPCdA1hsB/+S+yD75KVVWsSxfGvFD4sjKe5oVV
	ialLhAEdmf7XltqQPlhbMA3TizMdXCy6n6xx7vOw4ZkzjPAL2wR4X86s9zTvUekJ75V73fsY6mG83
	r3tTxMP7tuZBa1OINmGjafqv+tQkSk1zLaAIEX9xqqA6lmX06oiBc+r2Wwwd3vj8dT3B4FOvJ2rKe
	mUBlVuQ5HDWqLpSsdIUqe37epFqBijfKSXoYYz0OCBHkQcscAZf/r7yaXLbd/VGbtu2ThmnGuN511
	9QdugGXRv9HUYesWkLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRLSx-00CZVT-1m; Sun, 12 Feb 2023 23:09:03 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRLSt-00CZUu-Kj
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 23:09:01 +0000
Received: by mail-ot1-x333.google.com with SMTP id r34-20020a05683044a200b0068d4a8a8d2dso3236405otv.12
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 15:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4rA72RWnTNNYEhtSXbbVLZ5k/x5UyXL0FmY8/rgxXI=;
        b=WfvW/JMi+D65iq7O70z6qqoKpFj6lUs6DWQHCfgFyyRitWM12npJE1RvTZC2QhIU7O
         Hrx1OTHtSPwnE9hoxSagJpMDOzHgwfgyrvPxhmqUAB9/8xnB5jgMBbohxWw9WFjSoPHe
         guwzojIBfvhEczhEBGbbiSuth+sjIC2W4Zc16QxcxpjnYzYHHHG0apudCKqG4c8ZoHDS
         cAjjXLVV+B3MFwhwcDSUmw7LOWSMEQaNKjehmR6qQ1yKh7yMi4dSZPF1mNiouB7hZcMA
         M4JCeo+mW9iThW7BaBB6ta3euEmGOSdXf6DlBeZDcsY/1Xg5hZOuYa2g1NEfMoUieLYY
         0fOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4rA72RWnTNNYEhtSXbbVLZ5k/x5UyXL0FmY8/rgxXI=;
        b=CdlvpvxumPb5TiDEBbpct6VkzvrQUBHVZR6wt+hyb03prw54YHkG9uK+Ue17oAatVE
         +Fcez4wByMgfhHsm5TvJE6hvBmcyj7MzasT73st+qYnG3NMZ9XyUiUNDk5+lIJNF0ozW
         kc5EK1iFe3c1wBoz545bZPCqxK3+1DXpGrgavMhMDaGytON/icgW12z3xNoMy4VAPMnE
         C3/e5zW8a+qRDDj5DSKPKhtfnqts54KOCCJmIZWWnYkUxo1bs3lxqjRLt4aKlm+Fgv63
         6eZS1nX1s7Cv1LWDe+HqHlMIKcwnRRxb1GvFwBcmhumSHtXES7kqNBGsJwso97H9SDMs
         jjAw==
X-Gm-Message-State: AO0yUKVyqLrzkY58QZ7X/gzw8kGJxCXoAXVMqUDZjzR7up3Wsah4981h
	sxH8FTSeLrCOr4HYJedlXtYdMn6SGEY=
X-Google-Smtp-Source: AK7set9jX0MaCpkCDDeXGZ9zaPJti3vVo2yc8yKzCuIGlGu1xD2uGun+5Sul2142CcwkQtrny9WUqg==
X-Received: by 2002:a05:6830:3361:b0:68d:c1b:dd4 with SMTP id l33-20020a056830336100b0068d0c1b0dd4mr11602519ott.37.1676243338270;
        Sun, 12 Feb 2023 15:08:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1-20020a056830148100b0068bdd6e31a7sm4572513otq.7.2023.02.12.15.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 15:08:57 -0800 (PST)
Message-ID: <4658b0b0-dfd1-b5d8-f50a-3dbd81065cf1@roeck-us.net>
Date: Sun, 12 Feb 2023 15:08:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org,
 linux-riscv@lists.infradead.org, ajones@ventanamicro.com
References: <20230212194735.491785-1-conor@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
In-Reply-To: <20230212194735.491785-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_150859_734260_715CF7CE 
X-CRM114-Status: GOOD (  22.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/12/23 11:47, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Guenter reported a splat during boot, that Samuel pointed out was the
> lockdep assertion failing in patch_insn_write():
> 
> WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
> epc : patch_insn_write+0x222/0x2f6
>   ra : patch_insn_write+0x21e/0x2f6
> epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
>   gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
>   t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
>   s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
>   a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
>   a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
>   s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
>   s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
>   s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
>   s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
>   t5 : ffffffffd8180000 t6 : ffffffff81803bc8
> status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
> [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
> [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
> [<ffffffff80003348>] _apply_alternatives+0x46/0x86
> [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
> [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
> [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
> 
> This issue was exposed by 702e64550b12 ("riscv: fpu: switch has_fpu() to
> riscv_has_extension_likely()"), as it is the patching in has_fpu() that
> triggers the splats in Guenter's report.
> 
> Take the text_mutex before doing any code patching to satisfy lockdep.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/20230212154333.GA3760469@roeck-us.net/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Applying this patch together with

riscv: Fix early alternative patching
riscv: Fix Zbb alternative IDs

_and_ disabling CONFIG_RISCV_ISA_ZBB fixes all problems observed with
riscv64 for me. With that,

Tested-by: Guenter Roeck <linux@roeck-us.net>

Unfortunately I still see boot failures when trying to boot riscv32
images, so something is still broken. I don't know yet if that is
a generic problem or if it is related to a riscv patch.
I am still trying to track that down ...

Guenter

> ---
> Applies on top of Samuel's critical fixes in his "Fix alternatives
> issues on for-next":
> https://lore.kernel.org/all/20230212021534.59121-1-samuel@sholland.org/
> ---
>   arch/riscv/errata/sifive/errata.c | 3 +++
>   arch/riscv/errata/thead/errata.c  | 8 ++++++--
>   arch/riscv/kernel/cpufeature.c    | 4 ++++
>   3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> index ef9a4eec0dba..da55cb247e89 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/kernel.h>
> +#include <linux/memory.h>
>   #include <linux/module.h>
>   #include <linux/string.h>
>   #include <linux/bug.h>
> @@ -107,8 +108,10 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
>   
>   		tmp = (1U << alt->errata_id);
>   		if (cpu_req_errata & tmp) {
> +			mutex_lock(&text_mutex);
>   			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
>   					  alt->alt_len);
> +			mutex_lock(&text_mutex);
>   			cpu_apply_errata |= tmp;
>   		}
>   	}
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 1dd90a5f86f0..3b96a06d3c54 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/bug.h>
>   #include <linux/kernel.h>
> +#include <linux/memory.h>
>   #include <linux/module.h>
>   #include <linux/string.h>
>   #include <linux/uaccess.h>
> @@ -101,10 +102,13 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
>   			altptr = ALT_ALT_PTR(alt);
>   
>   			/* On vm-alternatives, the mmu isn't running yet */
> -			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT) {
>   				memcpy(oldptr, altptr, alt->alt_len);
> -			else
> +			} else {
> +				mutex_lock(&text_mutex);
>   				patch_text_nosync(oldptr, altptr, alt->alt_len);
> +				mutex_unlock(&text_mutex);
> +			}
>   		}
>   	}
>   
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 21fb567e1b22..59d58ee0f68d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -10,6 +10,7 @@
>   #include <linux/ctype.h>
>   #include <linux/libfdt.h>
>   #include <linux/log2.h>
> +#include <linux/memory.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <asm/alternative.h>
> @@ -292,8 +293,11 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>   
>   		oldptr = ALT_OLD_PTR(alt);
>   		altptr = ALT_ALT_PTR(alt);
> +
> +		mutex_lock(&text_mutex);
>   		patch_text_nosync(oldptr, altptr, alt->alt_len);
>   		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
> +		mutex_unlock(&text_mutex);
>   	}
>   }
>   #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
