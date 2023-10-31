Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B09BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SdUhdChzWORXfFL5h9F1u6Z24zzqcJ0v5qMzt67MaOM=; b=nALAvGu9231zl9DZL7Z0s4V48v
	HlWhNEoUi+xGp78DoJJ1B1VGNKW24verZlhDDtfKxvcjfATDZF2QrYERGM4tabveP8UevV/CnT6yt
	HGHIfgc8SvSFmFKI0+wItToMtChb8bNu3hz3jONOIdl36VSKk8hSH++ftyaOuvxfvDagIS5kCMemv
	AoP1LO6uNmPYFTLaJZoXoYiTBs+3Q2SKVAQO6gHvvME2sEv8MSX1sy1DiODqFay11iPztBexWz7ho
	9ECxnddBXnT9Ut8H3exw1nYrB7dPv9eC3ilm5uy25RuAApGf1wSygotDGEA/r7LnuNqnLjkqXSdEJ
	M+bHfwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxp1o-005MMS-2C;
	Tue, 31 Oct 2023 13:43:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxp1j-005MKE-1X
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 13:43:31 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4CDDA3FAE8
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698759802;
	bh=DhcPyxWaQOwmHuCZrkERAbfUQYQe206OySS/v+kaDnA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pIaFKftMX2d9GClnF88YZ/Lu19R0yVeaRJIottAfQDczXmmhjkrzIPOQHycU23K5s
	 2GVZZ41ouL+adC18IVtlw1p7onoogGXFodY3vrHM7S2JVM9V35T3I59NWvqkrt9omY
	 1mnL88YhWt3kqVbwQz7l7VttLnsNDxTTc5t69A56h3/GclJwdBhIyLogVOgGnDnrUA
	 +N+fB5P18ZK9kM48PL2CgNgG5LOeGUCgbYDh6SPCBhZtOzslMz2n/smMfZtQkYErs4
	 i9yVe0a8qlsx3kSh4f2ug2Fk9p8PeLOGvTWNPiHD9qIZFE1ilETjSaPWcOohyT5VPk
	 +DE7oVsApWG+Q==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cdbdbd8a5so67900651cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 06:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698759801; x=1699364601;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhcPyxWaQOwmHuCZrkERAbfUQYQe206OySS/v+kaDnA=;
        b=Iz0a+J82x9YaNLR75Mo6lvt/m2+D5KuAfCuBjAUWAFKG/OTtOwL03miMKainRZbP0A
         5an/lsyTtBQr6fBkUUax6vaKZP7Q4iPt85RDLd9uAuq2sKjR01gai9t8+lFqjGZzsMWG
         4HgPu0VJZfydQt/OAwn+g3kOEt8JezRAfUucPMAxGEZTnFbPZCwMHpNm+v2pTTMjkEB1
         PX/3OfNfDOk8Yf5hNJt9v33Wa+tJIO+9ye/tSpj6cM/ssBCq3klWjjuERwSbcGuyrfE4
         VJjwpxWktLpzLWC2/IqU/2GNBbVwX1cOu1dk0zPfmQC+W6paSHDhvbDv/jrxJUD7poYi
         mb/w==
X-Gm-Message-State: AOJu0YxKQ6bnEawqjEToSd8+8/8VV4va7eTsOH7W/ARh5CDP4T7ZVyMl
	vnjd1nvp6EMuWwKkeEdU3Ks9AJUt8R7fn4RXCX2+jTuY1NtDALSt++ePWffmNIXUj7VqCkcjqHN
	OUNFAClMX9FbM+E4+IolTiSMC/IWtrINiPlUyuGdda2spwnCiuHIDW5rDLYCzzw==
X-Received: by 2002:a05:622a:180e:b0:418:273:c337 with SMTP id t14-20020a05622a180e00b004180273c337mr14358907qtc.61.1698759800943;
        Tue, 31 Oct 2023 06:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8f06WZ/nkHThgpnpz8Vbm/9TsZic7xUF/AZT1K7GGBSrQZz4xmlyrfExAE+Se/rq93eeuIK7rJZOU+OyCN7Y=
X-Received: by 2002:a05:622a:180e:b0:418:273:c337 with SMTP id
 t14-20020a05622a180e00b004180273c337mr14358884qtc.61.1698759800488; Tue, 31
 Oct 2023 06:43:20 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 06:43:20 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231031-module_relocations-v7-2-6f4719b64bf7@rivosinc.com>
References: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com> <20231031-module_relocations-v7-2-6f4719b64bf7@rivosinc.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 06:43:19 -0700
Message-ID: <CAJM55Z_qeGwWYS7LdmkqmkRRg-tK5CsaRzPCAXS1Jfq2C8dTKQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] riscv: Add remaining module relocations
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@linux-m68k.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nelson Chu <nelson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_064327_979299_7FD93F22 
X-CRM114-Status: GOOD (  21.59  )
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
>  arch/riscv/kernel/module.c        | 534 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 511 insertions(+), 28 deletions(-)
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
> index a9e94e939cb5..230172ecb26e 100644
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
> @@ -14,6 +17,27 @@
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
> +struct hlist_head *relocation_hashtable;
> +
> +struct list_head used_buckets_list;
> +
>  /*
>   * The auipc+jalr instruction pair can reach any PC-relative offset
>   * in the range [-2^31 - 2^11, 2^31 - 2^11)
> @@ -269,6 +293,12 @@ static int apply_r_riscv_align_rela(struct module *me, void *location,
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
> @@ -290,6 +320,12 @@ static int apply_r_riscv_add64_rela(struct module *me, void *location,
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
> @@ -311,33 +347,470 @@ static int apply_r_riscv_sub64_rela(struct module *me, void *location,
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
> +	*(u8 *)location = (*(u8 *)location - ((u8)v & 0x3F)) & 0x3F;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set6_rela(struct module *me, void *location, Elf_Addr v)
> +{
> +	*(u8 *)location = ((*(u8 *)location & 0xc0) | ((u8)v & 0x3F));

Most of these casts are simple enough for here and above I'd consider
something like this for readability:

	u8 *byte = location;
	u8 value = v;

	*byte = (*byte & 0xc0) | (value & 0x3f)

The compiler should generate the same code.

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
> +/*
> + * Relocations defined in the riscv-elf-psabi-doc.
> + * This handles static linking only.
> + */
> +static int (*reloc_handlers_rela[])(struct module *me, void *location,
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
> +};
> +
> +static bool accumulate_relocations[] = {
> +	[R_RISCV_32] =			false,
> +	[R_RISCV_64] =			false,
> +	[R_RISCV_RELATIVE] =		false,
> +	[R_RISCV_COPY] =		false,
> +	[R_RISCV_JUMP_SLOT] =		false,
> +	[R_RISCV_TLS_DTPMOD32] =	false,
> +	[R_RISCV_TLS_DTPMOD64] =	false,
> +	[R_RISCV_TLS_DTPREL32] =	false,
> +	[R_RISCV_TLS_DTPREL64] =	false,
> +	[R_RISCV_TLS_TPREL32] =		false,
> +	[R_RISCV_TLS_TPREL64] =		false,
> +	/* 12-15 undefined */
> +	[R_RISCV_BRANCH] =		false,
> +	[R_RISCV_JAL] =			false,
> +	[R_RISCV_CALL] =		false,
> +	[R_RISCV_CALL_PLT] =		false,
> +	[R_RISCV_GOT_HI20] =		false,
> +	[R_RISCV_TLS_GOT_HI20] =	false,
> +	[R_RISCV_TLS_GD_HI20] =		false,
> +	[R_RISCV_PCREL_HI20] =		false,
> +	[R_RISCV_PCREL_LO12_I] =	false,
> +	[R_RISCV_PCREL_LO12_S] =	false,
> +	[R_RISCV_HI20] =		false,
> +	[R_RISCV_LO12_I] =		false,
> +	[R_RISCV_LO12_S] =		false,
> +	[R_RISCV_TPREL_HI20] =		false,
> +	[R_RISCV_TPREL_LO12_I] =	false,
> +	[R_RISCV_TPREL_LO12_S] =	false,
> +	[R_RISCV_TPREL_ADD] =		false,
> +	[R_RISCV_ADD8] =		true,
> +	[R_RISCV_ADD16] =		true,
> +	[R_RISCV_ADD32] =		true,
> +	[R_RISCV_ADD64] =		true,
> +	[R_RISCV_SUB8] =		true,
> +	[R_RISCV_SUB16] =		true,
> +	[R_RISCV_SUB32] =		true,
> +	[R_RISCV_SUB64] =		true,
> +	/* 41-42 reserved for future standard use */
> +	[R_RISCV_ALIGN] =		false,
> +	[R_RISCV_RVC_BRANCH] =		false,
> +	[R_RISCV_RVC_JUMP] =		false,
> +	/* 46-50 reserved for future standard use */
> +	[R_RISCV_RELAX] =		false,
> +	[R_RISCV_SUB6] =		true,
> +	[R_RISCV_SET6] =		true,
> +	[R_RISCV_SET8] =		true,
> +	[R_RISCV_SET16] =		true,
> +	[R_RISCV_SET32] =		true,
> +	[R_RISCV_32_PCREL] =		false,
> +	[R_RISCV_IRELATIVE] =		false,
> +	[R_RISCV_PLT32] =		false,
> +	[R_RISCV_SET_ULEB128] =		true,
> +	[R_RISCV_SUB_ULEB128] =		true,
> +	/* 62-191 reserved for future standard use */
> +	/* 192-255 nonstandard ABI extensions  */
> +};
> +
> +static int accumulation_not_supported(struct module *me, void *location, long buffer)
> +{
> +	pr_err("%s: Internal error. Only ADD/SUB/SET/ULEB128 should be accumulated.", me->name);
> +	return -EINVAL;
> +}
> +
> +static int apply_6_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	if (buffer != (buffer & 0x3F)) {

It may be a matter of taste, but I'd find something like this easier to read:

	if (buffer > 0x3f) {

To me that more directly conveys that you're just checking if any if the higher
bits are set.

> +		pr_err("%s: value %ld out of range for 6-bit relocation.\n",
> +		       me->name, buffer);
> +		return -EINVAL;
> +	}
> +	*(u8 *)location = ((*(u8 *)location & 0xc0) | ((u8)buffer & 0x3F));

Here the casts also get a bit much.

> +	return 0;
> +}
> +
> +static int apply_8_bit_accumulation(struct module *me, void *location, long buffer)
> +{
> +	if (buffer != (u8)buffer) {
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
> +	if (buffer != (u16)buffer) {

	if (buffer > U16_MAX) {

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
> +	if (buffer != (u32)buffer) {

	if (buffer > U32_MAX) {

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
> +	while (buffer != 0) {
> +		*(u8 *)location = (u8)buffer & 0x7F;
> +		buffer >>= 7;
> +		*(u8 *)location |= (buffer != 0) << 7;
> +		location = (u8 *)location + 1;
> +	}

How about something like

	u8 *p = location;

	while (buffer) {
		u8 value = buffer & 0x7f;

		buffer >>= 7;
		value |= (!!buffer) << 7;

		*p++ = value;
	}


This sould do the same as above, but if buffer == 0 it doesn't write anything.
Is that the right thing to do?

> +	return 0;
> +}
> +
> +/*
> + * Need to duplicate this a third time to capture the handlers for accumulation.
> + */
> +static int (*accumulate_handlers[])(struct module *me, void *location, long buffer) = {
> +	[R_RISCV_32] =			accumulation_not_supported,
> +	[R_RISCV_64] =			accumulation_not_supported,
> +	[R_RISCV_RELATIVE] =		accumulation_not_supported,
> +	[R_RISCV_COPY] =		accumulation_not_supported,
> +	[R_RISCV_JUMP_SLOT] =		accumulation_not_supported,
> +	[R_RISCV_TLS_DTPMOD32] =	accumulation_not_supported,
> +	[R_RISCV_TLS_DTPMOD64] =	accumulation_not_supported,
> +	[R_RISCV_TLS_DTPREL32] =	accumulation_not_supported,
> +	[R_RISCV_TLS_DTPREL64] =	accumulation_not_supported,
> +	[R_RISCV_TLS_TPREL32] =		accumulation_not_supported,
> +	[R_RISCV_TLS_TPREL64] =		accumulation_not_supported,
> +	/* 12-15 undefined */
> +	[R_RISCV_BRANCH] =		accumulation_not_supported,
> +	[R_RISCV_JAL] =			accumulation_not_supported,
> +	[R_RISCV_CALL] =		accumulation_not_supported,
> +	[R_RISCV_CALL_PLT] =		accumulation_not_supported,
> +	[R_RISCV_GOT_HI20] =		accumulation_not_supported,
> +	[R_RISCV_TLS_GOT_HI20] =	accumulation_not_supported,
> +	[R_RISCV_TLS_GD_HI20] =		accumulation_not_supported,
> +	[R_RISCV_PCREL_HI20] =		accumulation_not_supported,
> +	[R_RISCV_PCREL_LO12_I] =	accumulation_not_supported,
> +	[R_RISCV_PCREL_LO12_S] =	accumulation_not_supported,
> +	[R_RISCV_HI20] =		accumulation_not_supported,
> +	[R_RISCV_LO12_I] =		accumulation_not_supported,
> +	[R_RISCV_LO12_S] =		accumulation_not_supported,
> +	[R_RISCV_TPREL_HI20] =		accumulation_not_supported,
> +	[R_RISCV_TPREL_LO12_I] =	accumulation_not_supported,
> +	[R_RISCV_TPREL_LO12_S] =	accumulation_not_supported,
> +	[R_RISCV_TPREL_ADD] =		accumulation_not_supported,
> +	[R_RISCV_ADD8] =		apply_8_bit_accumulation,
> +	[R_RISCV_ADD16] =		apply_16_bit_accumulation,
> +	[R_RISCV_ADD32] =		apply_32_bit_accumulation,
> +	[R_RISCV_ADD64] =		apply_64_bit_accumulation,
> +	[R_RISCV_SUB8] =		apply_8_bit_accumulation,
> +	[R_RISCV_SUB16] =		apply_16_bit_accumulation,
> +	[R_RISCV_SUB32] =		apply_32_bit_accumulation,
> +	[R_RISCV_SUB64] =		apply_64_bit_accumulation,
> +	/* 41-42 reserved for future standard use */
> +	[R_RISCV_ALIGN] =		accumulation_not_supported,
> +	[R_RISCV_RVC_BRANCH] =		accumulation_not_supported,
> +	[R_RISCV_RVC_JUMP] =		accumulation_not_supported,
> +	/* 46-50 reserved for future standard use */
> +	[R_RISCV_RELAX] =		accumulation_not_supported,
> +	[R_RISCV_SUB6] =		apply_6_bit_accumulation,
> +	[R_RISCV_SET6] =		apply_6_bit_accumulation,
> +	[R_RISCV_SET8] =		apply_8_bit_accumulation,
> +	[R_RISCV_SET16] =		apply_16_bit_accumulation,
> +	[R_RISCV_SET32] =		apply_32_bit_accumulation,
> +	[R_RISCV_32_PCREL] =		accumulation_not_supported,
> +	[R_RISCV_IRELATIVE] =		accumulation_not_supported,
> +	[R_RISCV_PLT32] =		accumulation_not_supported,
> +	[R_RISCV_SET_ULEB128] =		apply_uleb128_accumulation,
> +	[R_RISCV_SUB_ULEB128] =		apply_uleb128_accumulation,
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
> +			list_for_each_entry(rel_entry_iter, rel_head_iter->rel_entry, head) {
> +				curr_type = rel_entry_iter->type;
> +				reloc_handlers_rela[curr_type](me, &buffer, rel_entry_iter->value);
> +				kfree(rel_entry_iter);
> +			}
> +			accumulate_handlers[curr_type](me, location, buffer);
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
> +	struct hlist_node *first;
> +	struct used_bucket *bucket;
> +	unsigned long hash;
> +
> +	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> +	INIT_LIST_HEAD(&entry->head);
> +	entry->type = type;
> +	entry->value = v;
> +
> +	hash = hash_min((unsigned long)location, hashtable_bits);
> +
> +	current_head = &relocation_hashtable[hash];
> +	first = current_head->first;
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
> @@ -349,11 +822,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
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
> @@ -428,11 +903,16 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  			}
>  		}
>
> -		res = handler(me, location, v);
> +		if (accumulate_relocations[type])
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
