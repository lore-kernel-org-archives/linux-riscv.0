Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2143C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKa0TWyLJBBLRCbW3L0ntGoJOV5tB8ej/Ca+LSiHbCc=; b=cHGL1wgMPhWew4
	2zsOn0xcNyKiMEHJEYccrJ/DpN74Ce9AeGoJBkXSyeHcNZQW2VQNQ6mpQH4A3j9pz0VKIwMMMZSsP
	pmv47PuPMO8PoQmHZh8o2iIXzvUQhFf3mOjb7NPDZg3SfnLuWrqPi2mgN3wPAMJHnIJalS3W3I+6s
	oIaryY0i0yElV3XYlANwxja72ZIRpnRQ5KP3elKV7Dw9TwnzeRnIWvFaB/Bwfq79CVJBEMxh0Nu05
	iYe95ogBdmpAPfW9MMiG8wO/ZC5vXf7oePW0/X4P82+Jah4PvotkTLRjwZKJXveUFvVLtV26O5dk5
	Nu3x9iMKIGLO/PX1gCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcqv-00000001GWs-1JD3;
	Fri, 19 Jul 2024 01:56:09 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcqo-00000001GVH-2ECw
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 01:56:07 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-8036ce66134so54775139f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721354161; x=1721958961; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBMoNxUmM+zvCwOfsVSk2SpUB5b5ZDpmyE9LlBQJw9Q=;
        b=Bt5MeIwqg8ejtT4A6Gcdtedi8PimVOxILwWw3O7UsaE3BLFpV6x11wL3qqktb5mZDF
         q68kw0PaRa1X/KT8cHuTNfU57CuHHBzeZjhLWntRAAAu0O3Eez6yu6wjQZ1oMVBY/yCW
         9dCKwqTWjRO7u0d3mcETVBDvy5grBjJBUtiGFEq3ggKIh9gP+jcNODXKjg+CXRPfCJc2
         /20zEftraiSf3EmcfNI69KJ8f5fBIv9fZz+RSnM+niFi1QMF/MMpC3TxFvA7KmV8zX4d
         p4bvpkj9HK3LZw4lAsV3G8G1wEpXDD/h002lbZA1kiOsSLZh8vIgpff9XRKOzEDw3Z9o
         Vc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721354161; x=1721958961;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBMoNxUmM+zvCwOfsVSk2SpUB5b5ZDpmyE9LlBQJw9Q=;
        b=GaswzTM+VoeeLDOeCVXDkw6dn0gxSqxAK4tQVc47SfhPYFDCKXS+6cBPOIPY85JLxb
         0gGgbYPBdjgYBfxVPP/NAjNKNcbpNah/Xs8EzzyM9g9z4qcggMO1WA1fOX6f8AzUpPFA
         7ZC52yQj0IOrGPIgmM/Efwq1IKUy9bK7veYj1mFw0cGPdkeT8w6qa6Bsp/T4kJf3Wimv
         h37G1niqU5BOa7nzYwLCdShrtiq9/ekLPD9HSvXPJl7O1xzvse6aQO6RY/37W1aMcgNT
         NjFrW7xq46/RO6MElaGU3shV80A8Co8tZkJrajnYKuvR8GtG4tWZM2eM9H9Noza0g7m2
         68dw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Y+14yUnFNTJ6cdu87dqZfxddxL7/YNUrDIYnbhjtql+PatWGhe64qWH1pimOGevUmm8JLp/VpmO/v+6SkbTuw0zTSj8wq33uB9hqWZnB
X-Gm-Message-State: AOJu0YxlC9lI1JWHdAv2n0rwqJrbEICe0XxpeM7rAbAyxhdk31lPuIef
	psKMdyFqx10mweTjKFdGeuxQau0of2O7xSNqP+H+NTg4WiPz+qpUhv+QEV/2NnY=
X-Google-Smtp-Source: AGHT+IG2CoPSYAyYkOoMBa2c9qiOtGSDneT6EFNBl+4SSwvbjQ9YO4XF8yNAxCBa+piiQdYwhgiz9A==
X-Received: by 2002:a05:6602:6d8d:b0:813:f74:e6e6 with SMTP id ca18e2360f4ac-81711e18cd9mr843812239f.15.1721354161352;
        Thu, 18 Jul 2024 18:56:01 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2342bf2cfsm124927173.8.2024.07.18.18.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 18:56:00 -0700 (PDT)
Message-ID: <a28ddc26-d77a-470a-a33f-88144f717e86@sifive.com>
Date: Thu, 18 Jul 2024 20:55:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: patch: Remove redundant functions
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>,
 Puranjay Mohan <puranjay@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20240717084102.150914-1-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240717084102.150914-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_185602_640482_0F45DEC3 
X-CRM114-Status: GOOD (  21.34  )
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

Hi Alex,

On 2024-07-17 3:41 AM, Alexandre Ghiti wrote:
> Commit edf2d546bfd6f5c4 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") removed the last differences between
> patch_text_set_nosync() and patch_insn_set(), and between
> patch_text_nosync() and patch_insn_write().
> 
> So remove the redundant *_nosync() functions.

My understanding was that we would eventually revert that patch, once we are
sure we never non-atomically patch the text patching code. So it's helpful to
keep the semantic distinction between the two sets of functions.

And looking at this closer, I think the original patch should not have removed
the calls to flush_icache_range() anyway. It replaces a global icache flush with
a local icache flush, which is wrong if there is more than one CPU online, and
there are a couple of places (bpf_jit_core.c, kprobes.c) where those functions
are called at runtime.

Regards,
Samuel

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/linux-riscv/CAMuHMdUwx=rU2MWhFTE6KhYHm64phxx2Y6u05-aBLGfeG5696A@mail.gmail.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/errata/sifive/errata.c |  4 ++--
>  arch/riscv/errata/thead/errata.c  |  2 +-
>  arch/riscv/include/asm/patch.h    |  3 +--
>  arch/riscv/kernel/alternative.c   |  4 ++--
>  arch/riscv/kernel/cpufeature.c    |  2 +-
>  arch/riscv/kernel/jump_label.c    |  2 +-
>  arch/riscv/kernel/patch.c         | 24 +-----------------------
>  arch/riscv/net/bpf_jit_core.c     |  4 ++--
>  8 files changed, 11 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> index 716cfedad3a2..5253b205aa17 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -112,8 +112,8 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  		tmp = (1U << alt->patch_id);
>  		if (cpu_req_errata & tmp) {
>  			mutex_lock(&text_mutex);
> -			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
> -					  alt->alt_len);
> +			patch_insn_write(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
> +					 alt->alt_len);
>  			mutex_unlock(&text_mutex);
>  			cpu_apply_errata |= tmp;
>  		}
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index bf6a0a6318ee..0ce280a190b6 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -182,7 +182,7 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  				memcpy(oldptr, altptr, alt->alt_len);
>  			} else {
>  				mutex_lock(&text_mutex);
> -				patch_text_nosync(oldptr, altptr, alt->alt_len);
> +				patch_insn_write(oldptr, altptr, alt->alt_len);
>  				mutex_unlock(&text_mutex);
>  			}
>  		}
> diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
> index 9f5d6e14c405..6b0e9b8a321b 100644
> --- a/arch/riscv/include/asm/patch.h
> +++ b/arch/riscv/include/asm/patch.h
> @@ -6,9 +6,8 @@
>  #ifndef _ASM_RISCV_PATCH_H
>  #define _ASM_RISCV_PATCH_H
>  
> +int patch_insn_set(void *addr, u8 c, size_t len);
>  int patch_insn_write(void *addr, const void *insn, size_t len);
> -int patch_text_nosync(void *addr, const void *insns, size_t len);
> -int patch_text_set_nosync(void *addr, u8 c, size_t len);
>  int patch_text(void *addr, u32 *insns, int ninsns);
>  
>  extern int riscv_patch_in_stop_machine;
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 0128b161bfda..a8b508d99cf8 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -83,7 +83,7 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
>  	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
>  
>  	/* patch the call place again */
> -	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> +	patch_insn_write(ptr, call, sizeof(u32) * 2);
>  }
>  
>  static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> @@ -98,7 +98,7 @@ static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
>  	riscv_insn_insert_jtype_imm(&jal_insn, imm);
>  
>  	/* patch the call place again */
> -	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> +	patch_insn_write(ptr, &jal_insn, sizeof(u32));
>  }
>  
>  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5ef48cb20ee1..4c040a857c7e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -795,7 +795,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  		altptr = ALT_ALT_PTR(alt);
>  
>  		mutex_lock(&text_mutex);
> -		patch_text_nosync(oldptr, altptr, alt->alt_len);
> +		patch_insn_write(oldptr, altptr, alt->alt_len);
>  		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
>  		mutex_unlock(&text_mutex);
>  	}
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index e6694759dbd0..74b5ebfacf4a 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -36,6 +36,6 @@ void arch_jump_label_transform(struct jump_entry *entry,
>  	}
>  
>  	mutex_lock(&text_mutex);
> -	patch_text_nosync(addr, &insn, sizeof(insn));
> +	patch_insn_write(addr, &insn, sizeof(insn));
>  	mutex_unlock(&text_mutex);
>  }
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index ab03732d06c4..bf45b507f900 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -177,7 +177,7 @@ static int __patch_insn_write(void *addr, const void *insn, size_t len)
>  NOKPROBE_SYMBOL(__patch_insn_write);
>  #endif /* CONFIG_MMU */
>  
> -static int patch_insn_set(void *addr, u8 c, size_t len)
> +int patch_insn_set(void *addr, u8 c, size_t len)
>  {
>  	size_t patched = 0;
>  	size_t size;
> @@ -198,17 +198,6 @@ static int patch_insn_set(void *addr, u8 c, size_t len)
>  }
>  NOKPROBE_SYMBOL(patch_insn_set);
>  
> -int patch_text_set_nosync(void *addr, u8 c, size_t len)
> -{
> -	u32 *tp = addr;
> -	int ret;
> -
> -	ret = patch_insn_set(tp, c, len);
> -
> -	return ret;
> -}
> -NOKPROBE_SYMBOL(patch_text_set_nosync);
> -
>  int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>  	size_t patched = 0;
> @@ -230,17 +219,6 @@ int patch_insn_write(void *addr, const void *insn, size_t len)
>  }
>  NOKPROBE_SYMBOL(patch_insn_write);
>  
> -int patch_text_nosync(void *addr, const void *insns, size_t len)
> -{
> -	u32 *tp = addr;
> -	int ret;
> -
> -	ret = patch_insn_write(tp, insns, len);
> -
> -	return ret;
> -}
> -NOKPROBE_SYMBOL(patch_text_nosync);
> -
>  static int patch_text_cb(void *data)
>  {
>  	struct patch_insn *patch = data;
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index 0a96abdaca65..b053ae5c4191 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -226,7 +226,7 @@ void *bpf_arch_text_copy(void *dst, void *src, size_t len)
>  	int ret;
>  
>  	mutex_lock(&text_mutex);
> -	ret = patch_text_nosync(dst, src, len);
> +	ret = patch_insn_write(dst, src, len);
>  	mutex_unlock(&text_mutex);
>  
>  	if (ret)
> @@ -240,7 +240,7 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
>  	int ret;
>  
>  	mutex_lock(&text_mutex);
> -	ret = patch_text_set_nosync(dst, 0, len);
> +	ret = patch_insn_set(dst, 0, len);
>  	mutex_unlock(&text_mutex);
>  
>  	return ret;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
