Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90109CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTXPIuve5x5omqhNCDBU3u8a+pnEqYiEL4X68+ASdbo=; b=lH6ydrbeSu8bv3
	HEQDgtfLEfGqi7rSQ7FmTcESkQyAxwfiyUPpqfF+Qo+wE68rVSwlOFFCfs3ti0UsteHNTome6PrwQ
	2czH6fZJasriuhk6xyG9ziTEgsp1VngRoAs1QyIqWCJM1SnbpF+Geu5aIGZhp0PLG7DXfwVCkk/5T
	go/N9TSjqmbkLdWdY/ktB6WkGln02fqOUh6vLxKpGcSktZf+QTfxCXZxkN6vW5nPmc7Fo2bW3KW9j
	TUZYK0pKOoK3BSfWvdTnYbwG+JiarGAVRLKgYFdaBt6Mm+w9su+HH9Xlkfln1pX4buwqGtJdzCiYo
	Sj2QSFNtzJ3sA21q2Rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBHp-00FS4M-34;
	Wed, 18 Oct 2023 18:28:53 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBHk-00FS2u-36
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 18:28:52 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-419c8911049so48024931cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697653727; x=1698258527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUcw5okN5wncPu5Duait9qP75YEDXN830LWrskfnUHs=;
        b=HOi+Gen8OiNP+45rVxBBFKlAMOFmmVwEdE2C6YcXls410h06CXWaiBcmtmC6/rzlj3
         FzEGmNTAA1Sbo+DfVaesewE36CgSdFf/Wg2iAPvQueloYmK5MUPvxmgV5a8SoNbj5NAS
         XiV00LKL43Sf5avfbnwaTvy0jYWY23E2XndRmgRSxGRPPIvFwugfKTB/En5ZMjakaawb
         f2qbRU/94ID7ifpWQd4YGw1FdeMROrrVr/hHT176lIHDi2NaujelSkAhBxYnvDxe2wLJ
         DxN1gPeiuafgzSyZ+16IegKlbnzcV+Ow7lIZ1c34UytNZm+sygpluaZqu1KdJinaCtXD
         BplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697653727; x=1698258527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUcw5okN5wncPu5Duait9qP75YEDXN830LWrskfnUHs=;
        b=NfS8tZ9wBExmlD3garW8+F6pD9an+G77Hc6Pqm7DGUbqK5F4GbIynDHTW6xWxHg/C3
         wOj1zZbZEaDyrlssV20R/NtG2gJTEHp/RjNcQb3IyJbRfHwqHcxY+Bku9IaZ8QLiFEEy
         XF7xd35LgXdjHz3Rt061SxB4S8C7cOYEGvDAIZrtNuD2sjgpOh6PL/4vL8/5mNSn8C38
         slzxg/s1T4vb85QSaRp8C2SzTZlr6C/8+4dqOGEXfRxdDI4IEO1Ys6xzdLCQ2YDR/BPV
         kQ/z9ui+sABcNOxgwh+HC7vlfN/mCD5DHCsKKOhCdW8RuQXDsO+ihAbSROoUEbwidjf1
         QAyQ==
X-Gm-Message-State: AOJu0YyAWEkgQHEjoxq/JU2U4AN7I1El9bM+WnvJpg0SyI3vfLHyTPAJ
	t1pJH4LaVu370WO+zeG/GDRf1g==
X-Google-Smtp-Source: AGHT+IF0bo1L3sO0ffxrVBI6mbDyWxNwo9HiS9a9ETu36ZowCWDy4sh/rnteUtkR0vokAZaCq6ulrg==
X-Received: by 2002:a05:622a:1a87:b0:418:804:340d with SMTP id s7-20020a05622a1a8700b004180804340dmr75023qtc.48.1697653727055;
        Wed, 18 Oct 2023 11:28:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:f59c:efa7:80ec:8da0? ([2600:1700:2000:b002:f59c:efa7:80ec:8da0])
        by smtp.gmail.com with ESMTPSA id fp7-20020a05622a508700b00405502aaf76sm144270qtb.57.2023.10.18.11.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 11:28:46 -0700 (PDT)
Message-ID: <2fea6698-7446-443b-9026-c4b082a9f809@sifive.com>
Date: Wed, 18 Oct 2023 13:28:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] riscv: Add remaining module relocations
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_112849_015950_138242E4 
X-CRM114-Status: GOOD (  26.56  )
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

On 2023-10-18 12:34 AM, Charlie Jenkins wrote:
> Add all final module relocations and add error logs explaining the ones
> that are not supported.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/elf.h |   5 +-
>  arch/riscv/kernel/module.c        | 207 +++++++++++++++++++++++++++++++++-----
>  2 files changed, 186 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> index d696d6610231..11a71b8533d5 100644
> --- a/arch/riscv/include/uapi/asm/elf.h
> +++ b/arch/riscv/include/uapi/asm/elf.h
> @@ -49,6 +49,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_TLS_DTPREL64	9
>  #define R_RISCV_TLS_TPREL32	10
>  #define R_RISCV_TLS_TPREL64	11
> +#define R_RISCV_IRELATIVE	58
>  
>  /* Relocation types not used by the dynamic linker */
>  #define R_RISCV_BRANCH		16
> @@ -81,7 +82,6 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_ALIGN		43
>  #define R_RISCV_RVC_BRANCH	44
>  #define R_RISCV_RVC_JUMP	45
> -#define R_RISCV_LUI		46
>  #define R_RISCV_GPREL_I		47
>  #define R_RISCV_GPREL_S		48
>  #define R_RISCV_TPREL_I		49
> @@ -93,6 +93,9 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_SET16		55
>  #define R_RISCV_SET32		56
>  #define R_RISCV_32_PCREL	57
> +#define R_RISCV_PLT32		59
> +#define R_RISCV_SET_ULEB128	60
> +#define R_RISCV_SUB_ULEB128	61
>  
>  
>  #endif /* _UAPI_ASM_RISCV_ELF_H */
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7c651d55fcbd..e860726352ac 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -7,6 +7,7 @@
>  #include <linux/elf.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/kernel.h>
>  #include <linux/moduleloader.h>
>  #include <linux/vmalloc.h>
>  #include <linux/sizes.h>
> @@ -268,6 +269,12 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
>  	return -EINVAL;
>  }
>  
> +static int apply_r_riscv_add8_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	*(u8 *)location += (u8)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -289,6 +296,12 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>  
> +static int apply_r_riscv_sub8_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	*(u8 *)location -= (u8)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -310,31 +323,149 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>  
> -static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
> -				Elf_Addr v) = {
> -	[R_RISCV_32]			= apply_r_riscv_32_rela,
> -	[R_RISCV_64]			= apply_r_riscv_64_rela,
> -	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
> -	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
> -	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
> -	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
> -	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
> -	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
> -	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
> -	[R_RISCV_HI20]			= apply_r_riscv_hi20_rela,
> -	[R_RISCV_LO12_I]		= apply_r_riscv_lo12_i_rela,
> -	[R_RISCV_LO12_S]		= apply_r_riscv_lo12_s_rela,
> -	[R_RISCV_GOT_HI20]		= apply_r_riscv_got_hi20_rela,
> -	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
> -	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
> -	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
> -	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
> -	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
> -	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
> -	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
> -	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
> -	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
> -	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
> +static int dynamic_linking_not_supported(struct module *me, u32 *location,
> +					 Elf_Addr v)
> +{
> +	pr_err("%s: Dynamic linking not supported in kernel modules PC = %p\n",
> +	       me->name, location);
> +	return -EINVAL;
> +}
> +
> +static int tls_not_supported(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	pr_err("%s: Thread local storage not supported in kernel modules PC = %p\n",
> +	       me->name, location);
> +	return -EINVAL;
> +}
> +
> +static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	*(u8 *)location = (*location - ((u8)v & 0x3F)) & 0x3F;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set6_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	*(u8 *)location = (*(u8 *)location & 0xc0) | ((u8)v & 0x3F);
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set8_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	*(u8 *)location = (u8)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location = (u16)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set32_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u32 *)location = (u32)v;

You don't need to cast the pointer, since it's already a `u32 *`.

> +	return 0;
> +}
> +
> +static int apply_r_riscv_32_pcrel_rela(struct module *me, u32 *location,
> +				       Elf_Addr v)
> +{
> +	*(u32 *)location = (u32)v;

This expression should be:

    *location = v - location;

matching the other PC-relative relocations.

(BTW, recent clang generates these relocations for module alternatives.)

> +	return 0;
> +}
> +
> +static int apply_r_riscv_plt32_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u32 *)location = (u32)v;

This should look like apply_r_riscv_32_pcrel_rela(), but with the PLT entry
emission code from apply_r_riscv_call_plt_rela(). See the psABI commit[1].

[1]:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/c3f8269c56d8a2f56c2602f2a44175362024ef9c

> +	return 0;
> +}
> +
> +static int apply_r_riscv_set_uleb128(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	/*
> +	 * Relocation is only performed if R_RISCV_SET_ULEB128 is followed by
> +	 * R_RISCV_SUB_ULEB128 so do computation there
> +	 */
> +	return 0;
> +}
> +
> +static int apply_r_riscv_sub_uleb128(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	if (v >= 128) {
> +		pr_err("%s: uleb128 must be in [0, 127] (not %ld) at PC = %p\n",
> +		       me->name, (unsigned long)v, location);
> +		return -EINVAL;
> +	}
> +
> +	*location = v;
> +	return 0;
> +}
> +
> +/*
> + * Relocations defined in the riscv-elf-psabi-doc.
> + * This handles static linking only.
> + */
> +static int (*reloc_handlers_rela[])(struct module *me, u32 *location,
> +				    Elf_Addr v) = {
> +	[R_RISCV_32] =			apply_r_riscv_32_rela,
> +	[R_RISCV_64] =			apply_r_riscv_64_rela,
> +	[R_RISCV_RELATIVE] =		dynamic_linking_not_supported,
> +	[R_RISCV_COPY] =		dynamic_linking_not_supported,
> +	[R_RISCV_JUMP_SLOT] =		dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPMOD32] =	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPMOD64] =	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPREL32] =	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPREL64] =	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_TPREL32] =		dynamic_linking_not_supported,
> +	[R_RISCV_TLS_TPREL64] =		dynamic_linking_not_supported,
> +	/* 12-15 undefined */
> +	[R_RISCV_BRANCH] =		apply_r_riscv_branch_rela,
> +	[R_RISCV_JAL] =			apply_r_riscv_jal_rela,
> +	[R_RISCV_CALL] =		apply_r_riscv_call_rela,
> +	[R_RISCV_CALL_PLT] =		apply_r_riscv_call_plt_rela,
> +	[R_RISCV_GOT_HI20] =		apply_r_riscv_got_hi20_rela,
> +	[R_RISCV_TLS_GOT_HI20] =	tls_not_supported,
> +	[R_RISCV_TLS_GD_HI20] =		tls_not_supported,
> +	[R_RISCV_PCREL_HI20] =		apply_r_riscv_pcrel_hi20_rela,
> +	[R_RISCV_PCREL_LO12_I] =	apply_r_riscv_pcrel_lo12_i_rela,
> +	[R_RISCV_PCREL_LO12_S] =	apply_r_riscv_pcrel_lo12_s_rela,
> +	[R_RISCV_HI20] =		apply_r_riscv_hi20_rela,
> +	[R_RISCV_LO12_I] =		apply_r_riscv_lo12_i_rela,
> +	[R_RISCV_LO12_S] =		apply_r_riscv_lo12_s_rela,
> +	[R_RISCV_TPREL_HI20] =		tls_not_supported,
> +	[R_RISCV_TPREL_LO12_I] =	tls_not_supported,
> +	[R_RISCV_TPREL_LO12_S] =	tls_not_supported,
> +	[R_RISCV_TPREL_ADD] =		tls_not_supported,
> +	[R_RISCV_ADD8] =		apply_r_riscv_add8_rela,
> +	[R_RISCV_ADD16] =		apply_r_riscv_add16_rela,
> +	[R_RISCV_ADD32] =		apply_r_riscv_add32_rela,
> +	[R_RISCV_ADD64] =		apply_r_riscv_add64_rela,
> +	[R_RISCV_SUB8] =		apply_r_riscv_sub8_rela,
> +	[R_RISCV_SUB16] =		apply_r_riscv_sub16_rela,
> +	[R_RISCV_SUB32] =		apply_r_riscv_sub32_rela,
> +	[R_RISCV_SUB64] =		apply_r_riscv_sub64_rela,
> +	/* 41-42 reserved for future standard use */
> +	[R_RISCV_ALIGN] =		apply_r_riscv_align_rela,
> +	[R_RISCV_RVC_BRANCH] =		apply_r_riscv_rvc_branch_rela,
> +	[R_RISCV_RVC_JUMP] =		apply_r_riscv_rvc_jump_rela,
> +	/* 46-50 reserved for future standard use */
> +	[R_RISCV_RELAX] =		apply_r_riscv_relax_rela,
> +	[R_RISCV_SUB6] =		apply_r_riscv_sub6_rela,
> +	[R_RISCV_SET6] =		apply_r_riscv_set6_rela,
> +	[R_RISCV_SET8] =		apply_r_riscv_set8_rela,
> +	[R_RISCV_SET16] =		apply_r_riscv_set16_rela,
> +	[R_RISCV_SET32] =		apply_r_riscv_set32_rela,
> +	[R_RISCV_32_PCREL] =		apply_r_riscv_32_pcrel_rela,
> +	[R_RISCV_IRELATIVE] =		dynamic_linking_not_supported,
> +	[R_RISCV_PLT32] =		apply_r_riscv_plt32_rela,
> +	[R_RISCV_SET_ULEB128] =		apply_r_riscv_set_uleb128,
> +	[R_RISCV_SUB_ULEB128] =		apply_r_riscv_sub_uleb128,
> +	/* 62-191 reserved for future standard use */
> +	/* 192-255 nonstandard ABI extensions  */
>  };
>  
>  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> @@ -348,6 +479,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	unsigned int i, type;
>  	Elf_Addr v;
>  	int res;
> +	bool uleb128_set_exists = false;
> +	u32 *uleb128_set_loc;
> +	unsigned long uleb128_set_sym_val;
> +

Extra blank line.

>  
>  	pr_debug("Applying relocate section %u to %u\n", relsec,
>  	       sechdrs[relsec].sh_info);
> @@ -425,6 +560,28 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  				  me->name);
>  				return -EINVAL;
>  			}
> +		} else if (type == R_RISCV_SET_ULEB128) {
> +			if (uleb128_set_exists) {
> +				pr_err("%s: riscv psABI requires the next ULEB128 relocation to come after a R_RISCV_SET_ULEB128 is an R_RISCV_SUB_ULEB128, not another R_RISCV_SET_ULEB128.\n",
> +				       me->name);
> +				return -EINVAL;
> +			}
> +			uleb128_set_exists = true;
> +			uleb128_set_loc = location;
> +			uleb128_set_sym_val =
> +				((Elf_Sym *)sechdrs[symindex].sh_addr +
> +					ELF_RISCV_R_SYM(rel[i].r_info))
> +					->st_value +
> +				rel[i].r_addend;
> +		} else if (type == R_RISCV_SUB_ULEB128) {
> +			if (uleb128_set_exists && uleb128_set_loc == location) {
> +				/* Calculate set and subtraction */
> +				v = uleb128_set_sym_val - v;

You need to set uleb128_set_exists back to false somewhere, or you can only
handle one R_RISCV_SET_ULEB128 relocation per module.

Regards,
Samuel

> +			} else {
> +				pr_err("%s: R_RISCV_SUB_ULEB128 must always be paired with the first R_RISCV_SET_ULEB128 that comes before it. PC = %p\n",
> +				       me->name, location);
> +				return -EINVAL;
> +			}
>  		}
>  
>  		res = handler(me, location, v);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
