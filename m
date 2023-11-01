Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C64DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qAwudXT3NgMuds/6vG+soFLA/DkyBkrqNfLhhJ5/22Q=; b=mpA8CG+5AofVS5mxBasgRtAyYy
	YQM128rRM/VK2OaD+nMun6r/ktIEdv8AZ4HXtdMvOrOV6MAZ6ms4z7EwQWY42kvn3y6AB/l4V8eP0
	kctREzKMO5t711PuuUC4k0tIMHhQfYF5zAxB0WOfvzykBsNCuj68R6lm4P9PCKBmw2XJSFemqJBWV
	8zrFeP4/T+nuHOitIcwwEUZ4dfI5IR7vwQexDX5jj4PiqzwAmSrDH6srsUXyo6Fgwk4jKNR9B0rcb
	Mr3sBUd3Wt0ONdO+hsDc+5+DLWJc0Xbwc5ibr4yD39YjcMVVqd02t9D8+p7huN1Q+otcuKKJYUwv0
	tCszAvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCSc-007foZ-0q;
	Wed, 01 Nov 2023 14:44:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCSW-007fn3-2p
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 14:44:45 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D17C43F6A0
	for <linux-riscv@lists.infradead.org>; Wed,  1 Nov 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698849873;
	bh=Krk06Mbiwmqz1nqWi3xOtE3pHx1q0sr4aocMS4DzPnQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sjETFT1MHYIn1yDY/uZBoX3g5KSdqKRD0tcMfgRwXys3TXD2GLtZ/1feeLnLtyQt2
	 /oF/wtFwW3SfEIFMKDEUsazqTowt1tUFsjX0FyWfdbopJZMYf/a5tLjHLR5DG+QuNO
	 /XoOKeK6U0WeQeP3sbSs9cRHp2JC0NFJdd4xENL6HszBAWCtszqqkaQ5cltZeVae3y
	 BDObcsW6ZOV53y/sFcOvME9B3X/2StZwpcJTxxOmAigoC6SUEa9eHjV6buBNJ4P+nI
	 JLRHTnNn41d/WgS1iphH3vK4JIvnJAIKi8kQ5vMoaXfrYeNG3DMFRx6RF4Z3lleoGp
	 eKr1kJefaOJSA==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c50c873604so77742831fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 07:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698849873; x=1699454673;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Krk06Mbiwmqz1nqWi3xOtE3pHx1q0sr4aocMS4DzPnQ=;
        b=lQ/J8X80X2naHhmb5MH5yDIputNX0XMFBrEJWwRU+rN9xdg6luBXLcCgH9xVNJJB7p
         G5WWmXqYlZ4ZFi/c62YxCVfM3xRLa5RKoFEnPNi2VkWVXKqzdgYDRChMjbVrimWC+nUh
         DqYp6mbAL0DNFwsOzeYMDa0FAELpgDx3UcmCfPHq1+incDmnoe2XYr+Q61MhDOJPvx+c
         iDlzevWacr3spna2l+d60ry9ib1/j13P6YE+ZK3ZRnttt8mlE/2d/PuBdVjmAthjMwyw
         67K/9G35lbcE7lfAFpcxSkdw8ZDo822Pf6mJKJdvP056aSJ3CxagWqdpoSqmbz+ISZ5s
         ufUA==
X-Gm-Message-State: AOJu0YwlCLFVFzkyFUnn6Pazyt4+pv7cb7qHj+unKp6M9zzq6bYv839R
	IU17hRff81MC9dJKV+9mM0VQANC3/++Rh4BUv5iaS5TsvihtrWLavbesL1EWA6iNE1BLEJVb0bi
	V2tkLJmzM4H0C+dBwRW7O52tyiFYXlLAD2FyCPGZeSGe7sB8zE7S8HxMlVJcgJg==
X-Received: by 2002:ac2:4982:0:b0:509:d86:fb2c with SMTP id f2-20020ac24982000000b005090d86fb2cmr8386676lfl.58.1698849872953;
        Wed, 01 Nov 2023 07:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH65D3J2ONGqMjqbilt6uelnF2nA9viQzuvJaz3Z7Octc6msG4T81UJFCfcFgQMg8310PrtyKMeIzfEN6hiprw=
X-Received: by 2002:ac2:4982:0:b0:509:d86:fb2c with SMTP id
 f2-20020ac24982000000b005090d86fb2cmr8386653lfl.58.1698849872495; Wed, 01 Nov
 2023 07:44:32 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Nov 2023 15:44:30 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231031-module_relocations-v8-2-09b5b720c1fe@rivosinc.com>
References: <20231031-module_relocations-v8-0-09b5b720c1fe@rivosinc.com> <20231031-module_relocations-v8-2-09b5b720c1fe@rivosinc.com>
Mime-Version: 1.0
Date: Wed, 1 Nov 2023 15:44:30 +0100
Message-ID: <CAJM55Z8Q7jG60TGakAhvg90zosdbNq8NeAuQeHVwHomvD+heAQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] riscv: Add remaining module relocations
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@linux-m68k.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nelson Chu <nelson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_074441_192960_84625CE4 
X-CRM114-Status: GOOD (  27.68  )
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

Charlie Jenkins wrote:
> Add all final module relocations and add error logs explaining the ones
> that are not supported. Implement overflow checks for
> ADD/SUB/SET/ULEB128 relocations.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/elf.h |   5 +-
>  arch/riscv/kernel/module.c        | 503 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 476 insertions(+), 32 deletions(-)
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
> index a9e94e939cb5..0f5d41eaa596 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -7,6 +7,9 @@
>  #include <linux/elf.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/hashtable.h>
> +#include <linux/kernel.h>
> +#include <linux/log2.h>
>  #include <linux/moduleloader.h>
>  #include <linux/vmalloc.h>
>  #include <linux/sizes.h>
> @@ -14,6 +17,39 @@
>  #include <asm/alternative.h>
>  #include <asm/sections.h>
>
> +struct used_bucket {
> +	struct list_head head;
> +	struct hlist_head *bucket;
> +};
> +
> +struct relocation_head {
> +	struct hlist_node node;
> +	struct list_head *rel_entry;
> +	void *location;
> +};
> +
> +struct relocation_entry {
> +	struct list_head head;
> +	Elf_Addr value;
> +	unsigned int type;
> +};
> +
> +struct relocation_handlers {
> +	int (*reloc_handler)(struct module *me, void *location, Elf_Addr v);
> +	bool accumulate_relocations;
> +	int (*accumulate_handler)(struct module *me, void *location,
> +				  long buffer);
> +};
> +
> +unsigned int initialize_relocation_hashtable(unsigned int num_relocations);
> +void process_accumulated_relocations(struct module *me);
> +int add_relocation_to_accumulate(struct module *me, int type, void *location,
> +				 unsigned int hashtable_bits, Elf_Addr v);
> +
> +struct hlist_head *relocation_hashtable;
> +
> +struct list_head used_buckets_list;
> +
>  /*
>   * The auipc+jalr instruction pair can reach any PC-relative offset
>   * in the range [-2^31 - 2^11, 2^31 - 2^11)
> @@ -35,7 +71,7 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
>  	insn &= keep;
>  	insn |= set;
>
> -	parcel[0] = cpu_to_le32(insn);
> +	parcel[0] = cpu_to_le16(insn);
>  	parcel[1] = cpu_to_le16(insn >> 16);
>  	return 0;
>  }
> @@ -43,8 +79,12 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
>  static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
>  {
>  	u16 *parcel = location;
> +	u16 insn = le16_to_cpu(*parcel);
>
> -	*parcel = cpu_to_le16((le16_to_cpu(*parcel) & keep) | set);
> +	insn &= keep;
> +	insn |= set;
> +
> +	*parcel = cpu_to_le16(insn);
>  	return 0;
>  }

I think you meant to squash these two chunks into the previous patch.

>
> @@ -269,6 +309,12 @@ static int apply_r_riscv_align_rela(struct module *me, void *location,
>  	return -EINVAL;
>  }
>
> +static int apply_r_riscv_add8_rela(struct module *me, void *location, Elf_Addr v)
> +{
> +	*(u8 *)location += (u8)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_add16_rela(struct module *me, void *location,
>  				    Elf_Addr v)
>  {
> @@ -290,6 +336,12 @@ static int apply_r_riscv_add64_rela(struct module *me, void *location,
>  	return 0;
>  }
>
> +static int apply_r_riscv_sub8_rela(struct module *me, void *location, Elf_Addr v)
> +{
> +	*(u8 *)location -= (u8)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub16_rela(struct module *me, void *location,
>  				    Elf_Addr v)
>  {
> @@ -311,33 +363,415 @@ static int apply_r_riscv_sub64_rela(struct module *me, void *location,
>  	return 0;
>  }
>
> -static int (*reloc_handlers_rela[]) (struct module *me, void *location,
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
> +static int dynamic_linking_not_supported(struct module *me, void *location,
> +					 Elf_Addr v)
> +{
> +	pr_err("%s: Dynamic linking not supported in kernel modules PC = %p\n",
> +	       me->name, location);
> +	return -EINVAL;
> +}
> +
> +static int tls_not_supported(struct module *me, void *location, Elf_Addr v)
> +{
> +	pr_err("%s: Thread local storage not supported in kernel modules PC = %p\n",
> +	       me->name, location);
> +	return -EINVAL;
> +}
> +
> +static int apply_r_riscv_sub6_rela(struct module *me, void *location, Elf_Addr v)
> +{
> +	u8 *byte = location;
> +	u8 value = v;
> +
> +	*byte = (*byte - (value & 0x3f)) & 0x3f;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set6_rela(struct module *me, void *location, Elf_Addr v)
> +{
> +	u8 *byte = location;
> +	u8 value = v;
> +
> +	*byte = (*byte & 0xc0) | (value & 0x3f);
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set8_rela(struct module *me, void *location, Elf_Addr v)
> +{
> +	*(u8 *)location = (u8)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set16_rela(struct module *me, void *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location = (u16)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set32_rela(struct module *me, void *location,
> +				    Elf_Addr v)
> +{
> +	*(u32 *)location = (u32)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_32_pcrel_rela(struct module *me, void *location,
> +				       Elf_Addr v)
> +{
> +	*(u32 *)location = v - (unsigned long)location;

nit: in other reviews i've been told to use uintptr_t when casting pointers to
an unsigned integer.

> +	return 0;
> +}
> +
> +static int apply_r_riscv_plt32_rela(struct module *me, void *location,
> +				    Elf_Addr v)
> +{
> +	ptrdiff_t offset = (void *)v - location;
> +
> +	if (!riscv_insn_valid_32bit_offset(offset)) {
> +		/* Only emit the plt entry if offset over 32-bit range */
> +		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
> +			offset = (void *)module_emit_plt_entry(me, v) - location;
> +		} else {
> +			pr_err("%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
> +			       me->name, (long long)v, location);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	*(u32 *)location = (u32)offset;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set_uleb128(struct module *me, void *location, Elf_Addr v)
> +{
> +	*(long *)location = v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_sub_uleb128(struct module *me, void *location, Elf_Addr v)
> +{
> +	*(long *)location -= v;
> +	return 0;
> +}
> +
> +static int accumulation_not_supported(struct module *me, void *location, long buffer)
> +{
> +	pr_err("%s: Internal error. Only ADD/SUB/SET/ULEB128 should be accumulated.", me->name);
> +	return -EINVAL;
> +}
> +
> +static int apply_6_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	u8 *byte = location;
> +	u8 value = buffer;
> +
> +	if (buffer > 0x3f) {
> +		pr_err("%s: value %ld out of range for 6-bit relocation.\n",
> +		       me->name, buffer);
> +		return -EINVAL;
> +	}
> +
> +	*byte = (*byte & 0xc0) | (value & 0x3f);
> +	return 0;
> +}
> +
> +static int apply_8_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	if (buffer > U8_MAX) {
> +		pr_err("%s: value %ld out of range for 8-bit relocation.\n",
> +		       me->name, buffer);
> +		return -EINVAL;
> +	}
> +	*(u8 *)location = (u8)buffer;
> +	return 0;
> +}
> +
> +static int apply_16_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	if (buffer > U16_MAX) {
> +		pr_err("%s: value %ld out of range for 16-bit relocation.\n",
> +		       me->name, buffer);
> +		return -EINVAL;
> +	}
> +	*(u16 *)location = (u16)buffer;
> +	return 0;
> +}
> +
> +static int apply_32_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	if (buffer > U32_MAX) {
> +		pr_err("%s: value %ld out of range for 32-bit relocation.\n",
> +		       me->name, buffer);
> +		return -EINVAL;
> +	}
> +	*(u32 *)location = (u32)buffer;
> +	return 0;
> +}
> +
> +static int apply_64_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	*(u64 *)location = (u64)buffer;
> +	return 0;
> +}
> +
> +static int apply_uleb128_accumulation(struct module *me, void *location, long buffer)
> +{
> +	/*
> +	 * ULEB128 is a variable length encoding. Encode the buffer into
> +	 * the ULEB128 data format.
> +	 */
> +	u8 *p = location;
> +
> +	while (buffer != 0) {
> +		u8 value = buffer & 0x7f;
> +
> +		buffer >>= 7;
> +		value |= (!!buffer) << 7;
> +
> +		*p++ = value;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * Relocations defined in the riscv-elf-psabi-doc.
> + * This handles static linking only.
> + */
> +static struct relocation_handlers reloc_handlers[] = {

I don't see anywhere this table is written to. Can we maybe make it const?

> +	[R_RISCV_32] = { apply_r_riscv_32_rela, false,
> +			 accumulation_not_supported },
> +	[R_RISCV_64] = { apply_r_riscv_64_rela, false,
> +			 accumulation_not_supported },
> +	[R_RISCV_RELATIVE] = { dynamic_linking_not_supported, false,
> +			       accumulation_not_supported },
> +	[R_RISCV_COPY] = { dynamic_linking_not_supported, false,
> +			   accumulation_not_supported },
> +	[R_RISCV_JUMP_SLOT] = { dynamic_linking_not_supported, false,
> +				accumulation_not_supported },
> +	[R_RISCV_TLS_DTPMOD32] = { dynamic_linking_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TLS_DTPMOD64] = { dynamic_linking_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TLS_DTPREL32] = { dynamic_linking_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TLS_DTPREL64] = { dynamic_linking_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TLS_TPREL32] = { dynamic_linking_not_supported, false,
> +				  accumulation_not_supported },
> +	[R_RISCV_TLS_TPREL64] = { dynamic_linking_not_supported, false,
> +				  accumulation_not_supported },
> +	/* 12-15 undefined */
> +	[R_RISCV_BRANCH] = { apply_r_riscv_branch_rela, false,
> +			     accumulation_not_supported },
> +	[R_RISCV_JAL] = { apply_r_riscv_jal_rela, false,
> +			  accumulation_not_supported },
> +	[R_RISCV_CALL] = { apply_r_riscv_call_rela, false,
> +			   accumulation_not_supported },
> +	[R_RISCV_CALL_PLT] = { apply_r_riscv_call_plt_rela, false,
> +			       accumulation_not_supported },
> +	[R_RISCV_GOT_HI20] = { apply_r_riscv_got_hi20_rela, false,
> +			       accumulation_not_supported },
> +	[R_RISCV_TLS_GOT_HI20] = { tls_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TLS_GD_HI20] = { tls_not_supported, false,
> +				  accumulation_not_supported },
> +	[R_RISCV_PCREL_HI20] = { apply_r_riscv_pcrel_hi20_rela, false,
> +				 accumulation_not_supported },
> +	[R_RISCV_PCREL_LO12_I] = { apply_r_riscv_pcrel_lo12_i_rela, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_PCREL_LO12_S] = { apply_r_riscv_pcrel_lo12_s_rela, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_HI20] = { apply_r_riscv_hi20_rela, false,
> +			   accumulation_not_supported },
> +	[R_RISCV_LO12_I] = { apply_r_riscv_lo12_i_rela, false,
> +			     accumulation_not_supported },
> +	[R_RISCV_LO12_S] = { apply_r_riscv_lo12_s_rela, false,
> +			     accumulation_not_supported },
> +	[R_RISCV_TPREL_HI20] = { tls_not_supported, false,
> +				 accumulation_not_supported },
> +	[R_RISCV_TPREL_LO12_I] = { tls_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TPREL_LO12_S] = { tls_not_supported, false,
> +				   accumulation_not_supported },
> +	[R_RISCV_TPREL_ADD] = { tls_not_supported, false,
> +				accumulation_not_supported },
> +	[R_RISCV_ADD8] = { apply_r_riscv_add8_rela, true,
> +			   apply_8_bit_accumulation },
> +	[R_RISCV_ADD16] = { apply_r_riscv_add16_rela, true,
> +			    apply_16_bit_accumulation },
> +	[R_RISCV_ADD32] = { apply_r_riscv_add32_rela, true,
> +			    apply_32_bit_accumulation },
> +	[R_RISCV_ADD64] = { apply_r_riscv_add64_rela, true,
> +			    apply_64_bit_accumulation },
> +	[R_RISCV_SUB8] = { apply_r_riscv_sub8_rela, true,
> +			   apply_8_bit_accumulation },
> +	[R_RISCV_SUB16] = { apply_r_riscv_sub16_rela, true,
> +			    apply_16_bit_accumulation },
> +	[R_RISCV_SUB32] = { apply_r_riscv_sub32_rela, true,
> +			    apply_32_bit_accumulation },
> +	[R_RISCV_SUB64] = { apply_r_riscv_sub64_rela, true,
> +			    apply_64_bit_accumulation },
> +	/* 41-42 reserved for future standard use */
> +	[R_RISCV_ALIGN] = { apply_r_riscv_align_rela, false,
> +			    accumulation_not_supported },
> +	[R_RISCV_RVC_BRANCH] = { apply_r_riscv_rvc_branch_rela, false,
> +				 accumulation_not_supported },
> +	[R_RISCV_RVC_JUMP] = { apply_r_riscv_rvc_jump_rela, false,
> +			       accumulation_not_supported },
> +	/* 46-50 reserved for future standard use */
> +	[R_RISCV_RELAX] = { apply_r_riscv_relax_rela, false,
> +			    accumulation_not_supported },
> +	[R_RISCV_SUB6] = { apply_r_riscv_sub6_rela, true,
> +			   apply_6_bit_accumulation },
> +	[R_RISCV_SET6] = { apply_r_riscv_set6_rela, true,
> +			   apply_6_bit_accumulation },
> +	[R_RISCV_SET8] = { apply_r_riscv_set8_rela, true,
> +			   apply_8_bit_accumulation },
> +	[R_RISCV_SET16] = { apply_r_riscv_set16_rela, true,
> +			    apply_16_bit_accumulation },
> +	[R_RISCV_SET32] = { apply_r_riscv_set32_rela, true,
> +			    apply_32_bit_accumulation },
> +	[R_RISCV_32_PCREL] = { apply_r_riscv_32_pcrel_rela, false,
> +			       accumulation_not_supported },
> +	[R_RISCV_IRELATIVE] = { dynamic_linking_not_supported, false,
> +				accumulation_not_supported },
> +	[R_RISCV_PLT32] = { apply_r_riscv_plt32_rela, false,
> +			    accumulation_not_supported },
> +	[R_RISCV_SET_ULEB128] = { apply_r_riscv_set_uleb128, true,
> +				  apply_uleb128_accumulation },
> +	[R_RISCV_SUB_ULEB128] = { apply_r_riscv_sub_uleb128, true,
> +				  apply_uleb128_accumulation },
> +	/* 62-191 reserved for future standard use */
> +	/* 192-255 nonstandard ABI extensions  */
>  };
>
> +void process_accumulated_relocations(struct module *me)
> +{
> +	/*
> +	 * Only ADD/SUB/SET/ULEB128 should end up here.
> +	 *
> +	 * Each bucket may have more than one relocation location. All
> +	 * relocations for a location are stored in a list in a bucket.
> +	 *
> +	 * Relocations are applied to a temp variable before being stored to the
> +	 * provided location to check for overflow. This also allows ULEB128 to
> +	 * properly decide how many entries are needed before storing to
> +	 * location. The final value is stored into location using the handler
> +	 * for the last relocation to an address.
> +	 *
> +	 * Three layers of indexing:
> +	 *	- Each of the buckets in use
> +	 *	- Groups of relocations in each bucket by location address
> +	 *	- Each relocation entry for a location address
> +	 */
> +	struct used_bucket *bucket_iter;
> +	struct relocation_head *rel_head_iter;
> +	struct relocation_entry *rel_entry_iter;
> +	int curr_type;
> +	void *location;
> +	long buffer;
> +
> +	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
> +		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
> +			buffer = 0;
> +			location = rel_head_iter->location;
> +			list_for_each_entry(rel_entry_iter,
> +					    rel_head_iter->rel_entry, head) {
> +				curr_type = rel_entry_iter->type;
> +				reloc_handlers[curr_type].reloc_handler(
> +					me, &buffer, rel_entry_iter->value);
> +				kfree(rel_entry_iter);
> +			}
> +			reloc_handlers[curr_type].accumulate_handler(
> +				me, location, buffer);
> +			kfree(rel_head_iter);
> +		}
> +		kfree(bucket_iter);
> +	}
> +
> +	kfree(relocation_hashtable);
> +}
> +
> +int add_relocation_to_accumulate(struct module *me, int type, void *location,
> +				 unsigned int hashtable_bits, Elf_Addr v)
> +{
> +	struct relocation_entry *entry;
> +	struct relocation_head *rel_head;
> +	struct hlist_head *current_head;
> +	struct used_bucket *bucket;
> +	unsigned long hash;
> +
> +	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> +	INIT_LIST_HEAD(&entry->head);
> +	entry->type = type;
> +	entry->value = v;
> +
> +	hash = hash_min((unsigned long)location, hashtable_bits);

uintptr_t

> +
> +	current_head = &relocation_hashtable[hash];
> +
> +	/* Find matching location (if any) */
> +	bool found = false;
> +	struct relocation_head *rel_head_iter;
> +
> +	hlist_for_each_entry(rel_head_iter, current_head, node) {
> +		if (rel_head_iter->location == location) {
> +			found = true;
> +			rel_head = rel_head_iter;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		rel_head = kmalloc(sizeof(*rel_head), GFP_KERNEL);
> +		rel_head->rel_entry =
> +			kmalloc(sizeof(struct list_head), GFP_KERNEL);
> +		INIT_LIST_HEAD(rel_head->rel_entry);
> +		rel_head->location = location;
> +		INIT_HLIST_NODE(&rel_head->node);
> +		if (!current_head->first) {
> +			bucket =
> +				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
> +			INIT_LIST_HEAD(&bucket->head);
> +			bucket->bucket = current_head;
> +			list_add(&bucket->head, &used_buckets_list);
> +		}
> +		hlist_add_head(&rel_head->node, current_head);
> +	}
> +
> +	/* Add relocation to head of discovered rel_head */
> +	list_add_tail(&entry->head, rel_head->rel_entry);
> +
> +	return 0;
> +}
> +
> +unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
> +{
> +	/* Can safely assume that bits is not greater than sizeof(long) */
> +	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
> +	unsigned int hashtable_bits = ilog2(hashtable_size);
> +
> +	/*
> +	 * Double size of hashtable if num_relocations * 1.25 is greater than
> +	 * hashtable_size.
> +	 */
> +	int should_double_size = ((num_relocations + (num_relocations >> 2)) > (hashtable_size));
> +
> +	hashtable_bits += should_double_size;
> +
> +	hashtable_size <<= should_double_size;
> +
> +	relocation_hashtable = kmalloc_array(hashtable_size,
> +					     sizeof(*relocation_hashtable),
> +					     GFP_KERNEL);
> +	__hash_init(relocation_hashtable, hashtable_size);
> +
> +	INIT_LIST_HEAD(&used_buckets_list);
> +
> +	return hashtable_bits;
> +}
> +
>  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  		       unsigned int symindex, unsigned int relsec,
>  		       struct module *me)
> @@ -349,11 +783,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	unsigned int i, type;
>  	Elf_Addr v;
>  	int res;
> +	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
> +	unsigned int hashtable_bits = initialize_relocation_hashtable(num_relocations);
>
>  	pr_debug("Applying relocate section %u to %u\n", relsec,
>  	       sechdrs[relsec].sh_info);
>
> -	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
> +	for (i = 0; i < num_relocations; i++) {
>  		/* This is where to make the change */
>  		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
>  			+ rel[i].r_offset;
> @@ -371,8 +807,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>
>  		type = ELF_RISCV_R_TYPE(rel[i].r_info);
>
> -		if (type < ARRAY_SIZE(reloc_handlers_rela))
> -			handler = reloc_handlers_rela[type];
> +		if (type < ARRAY_SIZE(reloc_handlers))
> +			handler = reloc_handlers[type].reloc_handler;
>  		else
>  			handler = NULL;
>
> @@ -428,11 +864,16 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  			}
>  		}
>
> -		res = handler(me, location, v);
> +		if (reloc_handlers[type].accumulate_relocations)

As far as I can tell the table above has accumulate_relocations == false if and
only if .accumulate_handler == accumulation_not_supported. Could we maybe drop
the bool and just check for that?

Are there situations where we might end up calling
accumulation_not_supported()? If not we could just let .accumulate_handler be
NULL where accumulation is not supported. Then the table could be initialised
with

  { reloc_handler }, // when accumulation is not supported and
  { reloc_handler, accumulate_handler }, // when it is

..and the test above would just be

	if (reloc_handlers[type].accumulate_handler)

> +			res = add_relocation_to_accumulate(me, type, location, hashtable_bits, v);
> +		else
> +			res = handler(me, location, v);
>  		if (res)
>  			return res;
>  	}
>
> +	process_accumulated_relocations(me);
> +
>  	return 0;
>  }
>
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
