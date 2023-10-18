Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447C8CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1hY2UyLjDclwCGachtLWnWXWLWdLMtZgkCHrFAThRaM=; b=nCTRY5LAMYPZHrrGXS0M7Tza74
	qwlj7ofM3c2QlA9YWOrUz9W/GyxAGf7ZOIAxiUSw9W+lmcSlpzVdPKjt9fUpC6yGMts/WwktmZDLl
	GojCmkBgK6QLasw6P9cfDMYHi3MYZjBcgy8CR5uSodSPVqFajx8kyfZWWocD6KAIw1P73XO8qltIk
	cItSPAxCQ7RcB34B0OLdKcOMPxlU+EgFPhedXN25zx2/Z+qXnRuQnHCTMQSBkY3J4DVPNxPQYHPpb
	xiqz6mk/rbRTnIk9VbvqH365lWhPIX4bsiiTeGocA3z0ZclInbXFvXR9d0ZBLgE1TSJLebkgWj9Vs
	zTbEkwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5Uu-00EdUD-38;
	Wed, 18 Oct 2023 12:18:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5Uq-00EdSE-2L
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:17:59 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 76B193F12E
	for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697631466;
	bh=9JEjALsOVS6EpRdOMeKAgdLdy8unJkD+oLph4vQm3Qc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Z3N/gwhSu9jMPd7HziYBoeHmKdP1C1iUYpYc4scJzGp9MgsW3OxrKsT0HjdXKZSqj
	 j9Qg/VHs7nZRDVv83xEqUuyM7QTXb5kMkUx0aXlCRSTc37Y4gl6z5Pitut38b8Sa3L
	 xeV+FjA4dJsQ2ovEQ+rNB/iLkY2XdYvgyogQQ02DLmI8Mz/qZFCqWJKSJG5kKiSbU1
	 Qha9vNuj74EyqQudEYuQaZQ1G+WrO6lQht8OvzS4ZCVkt5UCFVfhREQJKT+qZpY5tQ
	 FWiYnMdBBmF//dQ8PlwDLyy7LyvsK4KRruo1i7HyGTDUGvgy3KkH6dSmDPjIyf169E
	 shACBqv1X6qKQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4196a386347so78763551cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697631465; x=1698236265;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JEjALsOVS6EpRdOMeKAgdLdy8unJkD+oLph4vQm3Qc=;
        b=br4OmTSWyx/GtywNeuYhi0buz2/OzfypeSb6qhzyH21Pza4tAIgU1/RHm5/Q4QwRk/
         QYZWJS59meUnks2TY9f8gVAbYT38nF9L1bnXsU5S5lqGdRqENUobJ96RD8IKPSzAcYs6
         KyO7L7UaSxznetR705giL95OZMpgXyiG2fLwL+Ap15KzpSbAERnOZ29YNkHZnWt0rHe5
         LRUGPzGZ7VRvda1g4Azibanriyx2mkC7lxfawcWzBlRzQ177qdSc9vP8wXwi+HvGCDJQ
         Mib1CGD+72YDm6YpYFExg+6+k1HwOmurEbBtJbQugM2Oe9EtqgLf18ElUcX1wXAE6WJ3
         fHaQ==
X-Gm-Message-State: AOJu0YxN7HSheypmwhDlIEsbHbZ13EfCypeFrcM5vobvl/4uiclt0kOV
	douQdFMES38Me9kRvRk+Rtn6/vk6cV9khrs6k41BaEk1WyUxHXtAKkg3mFcX1cAsDOAJtQxt6qX
	p+BRMEZmDJLlioIKf+3KoYxE7dz2wI9y8OkxaO/c4XMIvynfTiD4u5NqBWY0s4g==
X-Received: by 2002:ac8:5881:0:b0:417:a2f9:bba6 with SMTP id t1-20020ac85881000000b00417a2f9bba6mr6082683qta.60.1697631465495;
        Wed, 18 Oct 2023 05:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOT0ZujbVgQOYLg/oMo1KykMdjcWnmsK64lOmvJEgiod5XNn3HuH70ZaRIf/EMNLmMBA1vkrk9kJquGEF9OO8=
X-Received: by 2002:ac8:5881:0:b0:417:a2f9:bba6 with SMTP id
 t1-20020ac85881000000b00417a2f9bba6mr6082652qta.60.1697631465119; Wed, 18 Oct
 2023 05:17:45 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Oct 2023 05:17:44 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com> <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
Mime-Version: 1.0
Date: Wed, 18 Oct 2023 05:17:44 -0700
Message-ID: <CAJM55Z9xgyJoCX83hgwerF6SRo6yit8=0rmLzhF8Ju4TmZq3BA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] riscv: Add remaining module relocations
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_051756_954878_D6C7E4CB 
X-CRM114-Status: GOOD (  27.38  )
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
> +	return 0;
> +}
> +
> +static int apply_r_riscv_32_pcrel_rela(struct module *me, u32 *location,
> +				       Elf_Addr v)
> +{
> +	*(u32 *)location = (u32)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_plt32_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u32 *)location = (u32)v;
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

Hi Charlie,

This is not a critique of this patch, but all these callbacks take a
u32 *location and
because of the compressed instructions this pointer may not be
aligned, so a lot of
the callbacks end up doing unaligned access which may fault to an
M-mode handler on
some platforms.

I once sent a patch to fix this:
https://lore.kernel.org/linux-riscv/20220224152456.493365-2-kernel@esmil.dk/

Maybe that's something you want to look into while touching this code anyway.

/Emil
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
> +			} else {
> +				pr_err("%s: R_RISCV_SUB_ULEB128 must always be paired with the first R_RISCV_SET_ULEB128 that comes before it. PC = %p\n",
> +				       me->name, location);
> +				return -EINVAL;
> +			}
>  		}
>
>  		res = handler(me, location, v);
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
