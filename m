Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7793BCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7krPZJ93HLdr9oLlGEij3ZnSGqd2/bNel+yZseYzcQ=; b=pb7khp2CEsC1o+
	H3l4lCh2JjJ9ntUTmGbR3FC/jafAvYYPWJT1lrUUjys2ODdyiQqYsuoBSFNmFRz+yOQYgEIseyto5
	T0Y/6gpkI7PimMIN9DndJgEI38qr3wNcuYY5yo9R3rWviX6nDrBNB6gdXBesUStyGcBALX5ZatERG
	R/D6EfOocfhXd3oRgo314+ZW+wZMxY544mW8k+OzDnmfrQ2q/DHjl5HBrQbk0pCFr/1VdduubwSTl
	mgmB+C9zclAwuD1EWwgx6e6zf6He9SaKTLEUcDvvia1P3w4B7rVZzDKVIdBChqkpI0WVEyBKNhxDX
	DggPYWZLzvPpJI7aqeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBK4-00FSbJ-16;
	Wed, 18 Oct 2023 18:31:12 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBJy-00FSaE-2D
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 18:31:10 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7d532da4bso89453597b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 11:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697653864; x=1698258664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHUD6sASExs/GXz3U87JmB/giRzmLpe5GxsMQInFySk=;
        b=fgCgnD7pZrHc9DeviLJV+Wm1Cvewb4xIofXsbhsiYm8OErG1g+McQgMpZVJ9hgxwbt
         Bo0+Tcg7e8eQCnT7Pi3/GFt8zlfRueNfyxBRVcHPM4X+G562OpsncINWjMhSs+6oN0rW
         ULddye2fWsNXVOv74KN360ukzCJdvu2DHFLFMgzIp2U8mu1l3dypQ9+SIl3j9BUNB+eC
         O8uGLmuOBMgP+n4xWw1aKGrbliPEpqEKKKt5fJNUhesi+M/GzWhhflhF6m8jbLCOgMhY
         cNLGTWOJObHZdZ9BLMgLa89ZFWjoje4VxlSMNtrqGW9nAwodwIwfSGoX53K+4vnDYJrz
         V35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697653864; x=1698258664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHUD6sASExs/GXz3U87JmB/giRzmLpe5GxsMQInFySk=;
        b=mvSx03evkoxV0bbnjkHHG1e2GV9AcQZkWwyzypSUXxPRjQZ+3qwQKWowGjfvhPtolu
         /iFHl9fJLUWclM78eBubx4DVCh313X+ewiXliwWoZspMbXT4uSQCcHJquujShEOhKkfs
         IMKX00TjKZPF1FEV62HrkpYmD2m2ZKY3dW4t1S8PGy0prAHokE0/HUYy0gfknptLKahb
         /oH40rWAGrIMlfZdeFp3Mmkbb6zEuGs0b+ZNsDOLMsgEReNMp/RpyNjTcaqLMSzSuXWH
         Up28zWnn1cH/Eks2p7q7LRk1tXkE0lRWWvW3XgJk5ly+ikYrPu3Ckgwcg2fi9KhIu1F5
         KIHQ==
X-Gm-Message-State: AOJu0YzkUlMwxyxuvAPSBfNfrvQeLoEtWGQJoC0d1F+5ypxsDAXDctOH
	QX0xKcwLKbLlx34jSv1dBsK+BSmt8gK0KjxdaHw=
X-Google-Smtp-Source: AGHT+IFQaGgVrwHXJazEcctfK/sJKSWbuonzH4gNdGVcLIC5LWa08vWj6PJu5tXvvU8uHJMregz7BA==
X-Received: by 2002:a05:690c:1b:b0:59f:72a6:da0e with SMTP id bc27-20020a05690c001b00b0059f72a6da0emr80934ywb.41.1697653864677;
        Wed, 18 Oct 2023 11:31:04 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id g8-20020a05620a218800b007759e9b0eb8sm147121qka.99.2023.10.18.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 11:31:04 -0700 (PDT)
Date: Wed, 18 Oct 2023 11:31:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 1/2] riscv: Add remaining module relocations
Message-ID: <ZTAkZAm21O3gtA7i@ghost>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
 <CAJM55Z9xgyJoCX83hgwerF6SRo6yit8=0rmLzhF8Ju4TmZq3BA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z9xgyJoCX83hgwerF6SRo6yit8=0rmLzhF8Ju4TmZq3BA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_113106_945295_FCA00463 
X-CRM114-Status: GOOD (  36.29  )
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

On Wed, Oct 18, 2023 at 05:17:44AM -0700, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > Add all final module relocations and add error logs explaining the ones
> > that are not supported.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/uapi/asm/elf.h |   5 +-
> >  arch/riscv/kernel/module.c        | 207 +++++++++++++++++++++++++++++++++-----
> >  2 files changed, 186 insertions(+), 26 deletions(-)
> >
> > diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> > index d696d6610231..11a71b8533d5 100644
> > --- a/arch/riscv/include/uapi/asm/elf.h
> > +++ b/arch/riscv/include/uapi/asm/elf.h
> > @@ -49,6 +49,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
> >  #define R_RISCV_TLS_DTPREL64	9
> >  #define R_RISCV_TLS_TPREL32	10
> >  #define R_RISCV_TLS_TPREL64	11
> > +#define R_RISCV_IRELATIVE	58
> >
> >  /* Relocation types not used by the dynamic linker */
> >  #define R_RISCV_BRANCH		16
> > @@ -81,7 +82,6 @@ typedef union __riscv_fp_state elf_fpregset_t;
> >  #define R_RISCV_ALIGN		43
> >  #define R_RISCV_RVC_BRANCH	44
> >  #define R_RISCV_RVC_JUMP	45
> > -#define R_RISCV_LUI		46
> >  #define R_RISCV_GPREL_I		47
> >  #define R_RISCV_GPREL_S		48
> >  #define R_RISCV_TPREL_I		49
> > @@ -93,6 +93,9 @@ typedef union __riscv_fp_state elf_fpregset_t;
> >  #define R_RISCV_SET16		55
> >  #define R_RISCV_SET32		56
> >  #define R_RISCV_32_PCREL	57
> > +#define R_RISCV_PLT32		59
> > +#define R_RISCV_SET_ULEB128	60
> > +#define R_RISCV_SUB_ULEB128	61
> >
> >
> >  #endif /* _UAPI_ASM_RISCV_ELF_H */
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 7c651d55fcbd..e860726352ac 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/elf.h>
> >  #include <linux/err.h>
> >  #include <linux/errno.h>
> > +#include <linux/kernel.h>
> >  #include <linux/moduleloader.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/sizes.h>
> > @@ -268,6 +269,12 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
> >  	return -EINVAL;
> >  }
> >
> > +static int apply_r_riscv_add8_rela(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	*(u8 *)location += (u8)v;
> > +	return 0;
> > +}
> > +
> >  static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
> >  				    Elf_Addr v)
> >  {
> > @@ -289,6 +296,12 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
> >  	return 0;
> >  }
> >
> > +static int apply_r_riscv_sub8_rela(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	*(u8 *)location -= (u8)v;
> > +	return 0;
> > +}
> > +
> >  static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
> >  				    Elf_Addr v)
> >  {
> > @@ -310,31 +323,149 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
> >  	return 0;
> >  }
> >
> > -static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
> > -				Elf_Addr v) = {
> > -	[R_RISCV_32]			= apply_r_riscv_32_rela,
> > -	[R_RISCV_64]			= apply_r_riscv_64_rela,
> > -	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
> > -	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
> > -	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
> > -	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
> > -	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
> > -	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
> > -	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
> > -	[R_RISCV_HI20]			= apply_r_riscv_hi20_rela,
> > -	[R_RISCV_LO12_I]		= apply_r_riscv_lo12_i_rela,
> > -	[R_RISCV_LO12_S]		= apply_r_riscv_lo12_s_rela,
> > -	[R_RISCV_GOT_HI20]		= apply_r_riscv_got_hi20_rela,
> > -	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
> > -	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
> > -	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
> > -	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
> > -	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
> > -	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
> > -	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
> > -	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
> > -	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
> > -	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
> > +static int dynamic_linking_not_supported(struct module *me, u32 *location,
> > +					 Elf_Addr v)
> > +{
> > +	pr_err("%s: Dynamic linking not supported in kernel modules PC = %p\n",
> > +	       me->name, location);
> > +	return -EINVAL;
> > +}
> > +
> > +static int tls_not_supported(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	pr_err("%s: Thread local storage not supported in kernel modules PC = %p\n",
> > +	       me->name, location);
> > +	return -EINVAL;
> > +}
> > +
> > +static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	*(u8 *)location = (*location - ((u8)v & 0x3F)) & 0x3F;
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_set6_rela(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	*(u8 *)location = (*(u8 *)location & 0xc0) | ((u8)v & 0x3F);
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_set8_rela(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	*(u8 *)location = (u8)v;
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_set16_rela(struct module *me, u32 *location,
> > +				    Elf_Addr v)
> > +{
> > +	*(u16 *)location = (u16)v;
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_set32_rela(struct module *me, u32 *location,
> > +				    Elf_Addr v)
> > +{
> > +	*(u32 *)location = (u32)v;
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_32_pcrel_rela(struct module *me, u32 *location,
> > +				       Elf_Addr v)
> > +{
> > +	*(u32 *)location = (u32)v;
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_plt32_rela(struct module *me, u32 *location,
> > +				    Elf_Addr v)
> > +{
> > +	*(u32 *)location = (u32)v;
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_set_uleb128(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	/*
> > +	 * Relocation is only performed if R_RISCV_SET_ULEB128 is followed by
> > +	 * R_RISCV_SUB_ULEB128 so do computation there
> > +	 */
> > +	return 0;
> > +}
> > +
> > +static int apply_r_riscv_sub_uleb128(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	if (v >= 128) {
> > +		pr_err("%s: uleb128 must be in [0, 127] (not %ld) at PC = %p\n",
> > +		       me->name, (unsigned long)v, location);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*location = v;
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Relocations defined in the riscv-elf-psabi-doc.
> > + * This handles static linking only.
> > + */
> > +static int (*reloc_handlers_rela[])(struct module *me, u32 *location,
> > +				    Elf_Addr v) = {
> > +	[R_RISCV_32] =			apply_r_riscv_32_rela,
> > +	[R_RISCV_64] =			apply_r_riscv_64_rela,
> > +	[R_RISCV_RELATIVE] =		dynamic_linking_not_supported,
> > +	[R_RISCV_COPY] =		dynamic_linking_not_supported,
> > +	[R_RISCV_JUMP_SLOT] =		dynamic_linking_not_supported,
> > +	[R_RISCV_TLS_DTPMOD32] =	dynamic_linking_not_supported,
> > +	[R_RISCV_TLS_DTPMOD64] =	dynamic_linking_not_supported,
> > +	[R_RISCV_TLS_DTPREL32] =	dynamic_linking_not_supported,
> > +	[R_RISCV_TLS_DTPREL64] =	dynamic_linking_not_supported,
> > +	[R_RISCV_TLS_TPREL32] =		dynamic_linking_not_supported,
> > +	[R_RISCV_TLS_TPREL64] =		dynamic_linking_not_supported,
> > +	/* 12-15 undefined */
> > +	[R_RISCV_BRANCH] =		apply_r_riscv_branch_rela,
> > +	[R_RISCV_JAL] =			apply_r_riscv_jal_rela,
> > +	[R_RISCV_CALL] =		apply_r_riscv_call_rela,
> > +	[R_RISCV_CALL_PLT] =		apply_r_riscv_call_plt_rela,
> > +	[R_RISCV_GOT_HI20] =		apply_r_riscv_got_hi20_rela,
> > +	[R_RISCV_TLS_GOT_HI20] =	tls_not_supported,
> > +	[R_RISCV_TLS_GD_HI20] =		tls_not_supported,
> > +	[R_RISCV_PCREL_HI20] =		apply_r_riscv_pcrel_hi20_rela,
> > +	[R_RISCV_PCREL_LO12_I] =	apply_r_riscv_pcrel_lo12_i_rela,
> > +	[R_RISCV_PCREL_LO12_S] =	apply_r_riscv_pcrel_lo12_s_rela,
> > +	[R_RISCV_HI20] =		apply_r_riscv_hi20_rela,
> > +	[R_RISCV_LO12_I] =		apply_r_riscv_lo12_i_rela,
> > +	[R_RISCV_LO12_S] =		apply_r_riscv_lo12_s_rela,
> > +	[R_RISCV_TPREL_HI20] =		tls_not_supported,
> > +	[R_RISCV_TPREL_LO12_I] =	tls_not_supported,
> > +	[R_RISCV_TPREL_LO12_S] =	tls_not_supported,
> > +	[R_RISCV_TPREL_ADD] =		tls_not_supported,
> > +	[R_RISCV_ADD8] =		apply_r_riscv_add8_rela,
> > +	[R_RISCV_ADD16] =		apply_r_riscv_add16_rela,
> > +	[R_RISCV_ADD32] =		apply_r_riscv_add32_rela,
> > +	[R_RISCV_ADD64] =		apply_r_riscv_add64_rela,
> > +	[R_RISCV_SUB8] =		apply_r_riscv_sub8_rela,
> > +	[R_RISCV_SUB16] =		apply_r_riscv_sub16_rela,
> > +	[R_RISCV_SUB32] =		apply_r_riscv_sub32_rela,
> > +	[R_RISCV_SUB64] =		apply_r_riscv_sub64_rela,
> > +	/* 41-42 reserved for future standard use */
> > +	[R_RISCV_ALIGN] =		apply_r_riscv_align_rela,
> > +	[R_RISCV_RVC_BRANCH] =		apply_r_riscv_rvc_branch_rela,
> > +	[R_RISCV_RVC_JUMP] =		apply_r_riscv_rvc_jump_rela,
> > +	/* 46-50 reserved for future standard use */
> > +	[R_RISCV_RELAX] =		apply_r_riscv_relax_rela,
> > +	[R_RISCV_SUB6] =		apply_r_riscv_sub6_rela,
> > +	[R_RISCV_SET6] =		apply_r_riscv_set6_rela,
> > +	[R_RISCV_SET8] =		apply_r_riscv_set8_rela,
> > +	[R_RISCV_SET16] =		apply_r_riscv_set16_rela,
> > +	[R_RISCV_SET32] =		apply_r_riscv_set32_rela,
> > +	[R_RISCV_32_PCREL] =		apply_r_riscv_32_pcrel_rela,
> > +	[R_RISCV_IRELATIVE] =		dynamic_linking_not_supported,
> > +	[R_RISCV_PLT32] =		apply_r_riscv_plt32_rela,
> > +	[R_RISCV_SET_ULEB128] =		apply_r_riscv_set_uleb128,
> > +	[R_RISCV_SUB_ULEB128] =		apply_r_riscv_sub_uleb128,
> > +	/* 62-191 reserved for future standard use */
> > +	/* 192-255 nonstandard ABI extensions  */
> >  };
> 
> Hi Charlie,
> 
> This is not a critique of this patch, but all these callbacks take a
> u32 *location and
> because of the compressed instructions this pointer may not be
> aligned, so a lot of
> the callbacks end up doing unaligned access which may fault to an
> M-mode handler on
> some platforms.
> 
> I once sent a patch to fix this:
> https://lore.kernel.org/linux-riscv/20220224152456.493365-2-kernel@esmil.dk/
> 
> Maybe that's something you want to look into while touching this code anyway.
> 
> /Emil

Oh nice, I will pick up that patch and change the "native-endian"
wording to be "little-endian" in the commit.

- Charlie

> >
> >  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> > @@ -348,6 +479,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  	unsigned int i, type;
> >  	Elf_Addr v;
> >  	int res;
> > +	bool uleb128_set_exists = false;
> > +	u32 *uleb128_set_loc;
> > +	unsigned long uleb128_set_sym_val;
> > +
> >
> >  	pr_debug("Applying relocate section %u to %u\n", relsec,
> >  	       sechdrs[relsec].sh_info);
> > @@ -425,6 +560,28 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  				  me->name);
> >  				return -EINVAL;
> >  			}
> > +		} else if (type == R_RISCV_SET_ULEB128) {
> > +			if (uleb128_set_exists) {
> > +				pr_err("%s: riscv psABI requires the next ULEB128 relocation to come after a R_RISCV_SET_ULEB128 is an R_RISCV_SUB_ULEB128, not another R_RISCV_SET_ULEB128.\n",
> > +				       me->name);
> > +				return -EINVAL;
> > +			}
> > +			uleb128_set_exists = true;
> > +			uleb128_set_loc = location;
> > +			uleb128_set_sym_val =
> > +				((Elf_Sym *)sechdrs[symindex].sh_addr +
> > +					ELF_RISCV_R_SYM(rel[i].r_info))
> > +					->st_value +
> > +				rel[i].r_addend;
> > +		} else if (type == R_RISCV_SUB_ULEB128) {
> > +			if (uleb128_set_exists && uleb128_set_loc == location) {
> > +				/* Calculate set and subtraction */
> > +				v = uleb128_set_sym_val - v;
> > +			} else {
> > +				pr_err("%s: R_RISCV_SUB_ULEB128 must always be paired with the first R_RISCV_SET_ULEB128 that comes before it. PC = %p\n",
> > +				       me->name, location);
> > +				return -EINVAL;
> > +			}
> >  		}
> >
> >  		res = handler(me, location, v);
> >
> > --
> > 2.34.1
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
