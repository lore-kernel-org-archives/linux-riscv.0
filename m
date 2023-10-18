Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2131CCDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 05:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05SKO7XlJS4TCYdGFKoYgbtjChPqRam5MUyDaAwrEp8=; b=tTxApORtJUrGc8
	fWwtfBLJGhTQ5DNqjmv7oGqBx4f14aKOtcTs8S8T6A3UG9AcwbqWBykKTJY8zDHPeqhyEIrKi8YoC
	TkraqQ3isIM9gmRsv/9GWgtkOnpfU7PP4jN2xlxezYQFgkgEDemdS8kXQsae5x6paLXcFlLf5D+Zj
	gxO4jv3JFY7MZeSeouRaeNKzSD0Wz7q6vbFiRMpssMvNs9EirPa0yiytntDNHDs511VbBpxyLSBnQ
	UGg70Ef1lgdXvuLUuHsj+M4oJ7WNoHJL6WAucyhxOpBJMJdELmi5hdsG82IsMD18G67lD5pmDVZND
	bhMLnf8xXLR133UxLeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qszE8-00Dq1x-0a;
	Wed, 18 Oct 2023 05:36:16 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qszE4-00Dq11-2l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 05:36:14 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2e44c7941so504031b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 22:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697607371; x=1698212171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RVGEVK2oqiimD1UCwBActT2L4ZyISAIQqtoBz0C3gOM=;
        b=2trWWHIA22LQRc4xcLyltsZm9bjI/UraaSViWG2cF2lP+/eSZXKz7uE6y1fzal5pjm
         h8nDUoKtqM3Z2mGNB1riD2pzb9HMoRDbVYqPcJRH/hFnz2wTxAraftd2pie2Ljpm/Iob
         FVvPHCFaW9/ukTXmtxHw9F0zdz2GPt6Zp/nb1FSJSyUs8eA7NmNplrSXeJsOY2Nr124W
         RykWv3F+Z9uTX2/7EQ1eRmIs92DjG3EaFS/Go8E5xQsBQnMery6p2JC1EK6np6Yrwi8c
         2NXWhDnbuxHycR1VoSf2TJ6yGCjoNjAq3TstpsZVaGrUhk5dCDZYHDHAAaRlC1gtHKQd
         ocCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697607371; x=1698212171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVGEVK2oqiimD1UCwBActT2L4ZyISAIQqtoBz0C3gOM=;
        b=ZnjUdB6W2nKVN1CCdSo2cT8FI3mO2mPaqDhMqGOnCv+UjtAptdUOZRcnNGuFrlbHD5
         g1wIDJomWM89yakzVcthu/WELeMvsmNhMceny+pkmoX3rL7l2ivDErqHucWcNxdiHsC+
         X5cele/WxJwg9MtlG0Z5C4gQ9hqT1uzX1VBchrziZ9+TnwpbzVWq0tCLIj9wlBxEg+QI
         JSDxaCf8tHeFt4P/+x5DW5EpuQIPigkcTMNx6JnUXRfkedwPH8puK7E52vQWze/bZFaI
         dDgmQc1r95KSI3VrOrKm9vrH2FpgjvzmkZLM0FjMNbB7PEbgHQqHjNaPitzH/m2+JjCr
         VsQQ==
X-Gm-Message-State: AOJu0Yw5DE0gymgU4QbViE0Sc6VLBRE/RLBQXwh8ZqBbuUgaEhzZ7Dz+
	ykNr+I/+kRdBpJKV/subGoqbZA==
X-Google-Smtp-Source: AGHT+IEvzLb3C4KqeMCgyh/WDl3C4rY51QFTJJan1ICRIFhgomvelxVfP2gaAQYax7svEYG3H7Gdxg==
X-Received: by 2002:a54:4399:0:b0:3a9:ba39:6d70 with SMTP id u25-20020a544399000000b003a9ba396d70mr4750526oiv.23.1697607370952;
        Tue, 17 Oct 2023 22:36:10 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:f063:a395:7fed:1020])
        by smtp.gmail.com with ESMTPSA id bp18-20020a056808239200b003af644e6e81sm533544oib.45.2023.10.17.22.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 22:36:10 -0700 (PDT)
Date: Tue, 17 Oct 2023 22:36:07 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 1/2] riscv: Add remaining module relocations
Message-ID: <ZS9ux/IFas4Yw3qY@ghost>
References: <20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com>
 <20231016-module_relocations-v3-1-a667fd6071e9@rivosinc.com>
 <20231017-heaviness-husked-f3b81d5ecdfb@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017-heaviness-husked-f3b81d5ecdfb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_223612_896934_E5F6443A 
X-CRM114-Status: GOOD (  30.14  )
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

On Tue, Oct 17, 2023 at 08:08:26AM +0100, Conor Dooley wrote:
> On Mon, Oct 16, 2023 at 10:36:09AM -0700, Charlie Jenkins wrote:
> > Add all final module relocations and add error logs explaining the ones
> > that are not supported.
> 
> In the patchwork automation's clang/llvm allmodconfig:
>  ../arch/riscv/kernel/tests/module_test/test_uleb128.S:18:17: error: unknown relocation name
>  ../arch/riscv/kernel/tests/module_test/test_uleb128.S:19:17: error: unknown relocation name
> 
> (llvm-17 iirc)
> 
> Cheers,
> Conor.
Thank you, that slipped my mind that I needed to conditionally build the
uleb128 tests. I will send an updated version.

- Charlie
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/uapi/asm/elf.h |   6 +-
> >  arch/riscv/kernel/module.c        | 207 +++++++++++++++++++++++++++++++++-----
> >  2 files changed, 187 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> > index d696d6610231..a9307a1c9ceb 100644
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
> > @@ -81,7 +82,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
> >  #define R_RISCV_ALIGN		43
> >  #define R_RISCV_RVC_BRANCH	44
> >  #define R_RISCV_RVC_JUMP	45
> > -#define R_RISCV_LUI		46
> > +#define R_RISCV_RVC_LUI		46
> >  #define R_RISCV_GPREL_I		47
> >  #define R_RISCV_GPREL_S		48
> >  #define R_RISCV_TPREL_I		49
> > @@ -93,6 +94,9 @@ typedef union __riscv_fp_state elf_fpregset_t;
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
> > index 7c651d55fcbd..73f47de538d2 100644
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
> > +	*(u8 *)location -= (u8)v & 0x3F;
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
> > 2.42.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
