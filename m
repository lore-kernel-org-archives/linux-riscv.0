Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C89ECDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6ldJuTlh/1WqHZYVub8c8AvSaLqlu19z0JX/6abuUXQ=; b=BUDu3p8+4JxMGPNZwyR+RhWa4E
	eu7+aa5ZyMtXB+BoxC3ejcLmUOWQCC+ASxE0rR64J0QIb0IZaIFUUMvxGYLjx9Ms6JdXDo64p3EUm
	kSSIPQph7ILfiLzhd4RPRPRod6BaX4XangKna4NVQNDo4r5ee7jm/D6dWhcU7NdVq0a/Tz3nUbu22
	atwBr/xJw1x+gfoc3U0jk/N8Fq1hcl+DsYPvhiyTjA2aGH12p9LMjJ55TF03JQ+b83s1qFAjHx09e
	ihqPIYmAngoxgJ8PE9nNYcxT2UBEVHePFJA5ZkplgR4YxNtJGGC0DlR4kW1PEuiNS/9q9tlRNJDok
	qh6VPr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBRU-00FTaI-1q;
	Wed, 18 Oct 2023 18:38:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBRP-00FTYd-28
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 18:38:51 +0000
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B56373FA66
	for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697654321;
	bh=/F8svsciqHrugnjeJmUjS4sniEjdpUrYFNQxwp5PoXI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=onP/dDvkVU94vPKe/9YWoLGHlqjkfRJYuk+jc42Fl3q7uy89twkKsCtKGnyeULkVt
	 ft3dtlQym9GbjjDdu0l4EY3PAEFrtjfGRRYgJ20Kdm+njnk1OeyPi4x9Z5Nc4jA45p
	 rxSNyKKQAzp3alf9GyMMBFn6ls98WJTgdGKru2VQqbEqVbOOf9ZxpoMJkiokAN/RsS
	 VIpVmzu2n06UqTCOC9oN7Ps4RJtnevYNsGN2D0DCp6Jw+L52mqEEB2wXdH1GIiBuB/
	 MGUAu8Fy6+Ff5X6zuuRI8pERD17JVYcTBKWfWk2GuCZIqJYoPTEuupW4rqFZugz4Gj
	 unBbdJ+PVU0xw==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6cd0a9b5a90so829271a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 11:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697654320; x=1698259120;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/F8svsciqHrugnjeJmUjS4sniEjdpUrYFNQxwp5PoXI=;
        b=YiiZuE+vKVSoBFLp9lVkB5g2lcmtd59/Ka5RnQhxiavEaA2mC9M2bni01HV9O4/dJj
         FPO6dWjqv6uQWsmBTO0k1msoezXqgA2goPxYjtBY3bCbGxpubhbk1NZxGIyvtDPeZMYY
         4YzzV9UyvEHEqtjqzathgXuBRVZW9F/HihSTkbCDAsOKgZkcfj/BUYBLvjwPN/bzC4EH
         QjkCXKbodL//Vk5fttLTX1EUFPlzr6qr3vLIjv+lcxS0z+9ov0fpdNCGhTry+2ScnfgX
         ALPFZZWF5LUlraVtqgpLqBjk5UbmTh5aBnAQI89wj98gfVYhqx2HOdeVl3XWZznU2tPG
         7HaA==
X-Gm-Message-State: AOJu0YxSxtWmPamUiQBzsJBsC+8pagCs9XYwcAHujhnvL8byk1jinJvL
	Fc79HDJ3iWN6vgWXbHG3ZAY9QAxwcCjCJcOZzCh/hQP1ki6eIbs6tODlLDcZu4P6aMFJfo59mXJ
	S1D/32TmeS3xNMGrcyYQnrkqSytOj/fl/qr56U3yVb6C9OZYxtlcTxtT0jliTog==
X-Received: by 2002:a05:6830:25d4:b0:6be:e553:334 with SMTP id d20-20020a05683025d400b006bee5530334mr115268otu.7.1697654320395;
        Wed, 18 Oct 2023 11:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF0UksmymuHw1fp3h4M4i9qqquVpQcCrkbRyISkaxIhPx0qi4esrJkWIiw1Jl5e88uKvQbRele/z2Cs9R6hPs=
X-Received: by 2002:a05:6830:25d4:b0:6be:e553:334 with SMTP id
 d20-20020a05683025d400b006bee5530334mr115252otu.7.1697654320098; Wed, 18 Oct
 2023 11:38:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Oct 2023 11:38:39 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZTAkZAm21O3gtA7i@ghost>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
 <CAJM55Z9xgyJoCX83hgwerF6SRo6yit8=0rmLzhF8Ju4TmZq3BA@mail.gmail.com> <ZTAkZAm21O3gtA7i@ghost>
Mime-Version: 1.0
Date: Wed, 18 Oct 2023 11:38:39 -0700
Message-ID: <CAJM55Z_Myd-ifrmQebO3V+GXTU70e105O7D7+hu4T7CazpdJsg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] riscv: Add remaining module relocations
To: Charlie Jenkins <charlie@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_113848_071464_8B073CCE 
X-CRM114-Status: GOOD (  32.91  )
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
> On Wed, Oct 18, 2023 at 05:17:44AM -0700, Emil Renner Berthing wrote:
> > Charlie Jenkins wrote:
> > > Add all final module relocations and add error logs explaining the ones
> > > that are not supported.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/uapi/asm/elf.h |   5 +-
> > >  arch/riscv/kernel/module.c        | 207 +++++++++++++++++++++++++++++++++-----
> > >  2 files changed, 186 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> > > index d696d6610231..11a71b8533d5 100644
> > > --- a/arch/riscv/include/uapi/asm/elf.h
> > > +++ b/arch/riscv/include/uapi/asm/elf.h
> > > @@ -49,6 +49,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
> > >  #define R_RISCV_TLS_DTPREL64	9
> > >  #define R_RISCV_TLS_TPREL32	10
> > >  #define R_RISCV_TLS_TPREL64	11
> > > +#define R_RISCV_IRELATIVE	58
> > >
> > >  /* Relocation types not used by the dynamic linker */
> > >  #define R_RISCV_BRANCH		16
> > > @@ -81,7 +82,6 @@ typedef union __riscv_fp_state elf_fpregset_t;
> > >  #define R_RISCV_ALIGN		43
> > >  #define R_RISCV_RVC_BRANCH	44
> > >  #define R_RISCV_RVC_JUMP	45
> > > -#define R_RISCV_LUI		46
> > >  #define R_RISCV_GPREL_I		47
> > >  #define R_RISCV_GPREL_S		48
> > >  #define R_RISCV_TPREL_I		49
> > > @@ -93,6 +93,9 @@ typedef union __riscv_fp_state elf_fpregset_t;
> > >  #define R_RISCV_SET16		55
> > >  #define R_RISCV_SET32		56
> > >  #define R_RISCV_32_PCREL	57
> > > +#define R_RISCV_PLT32		59
> > > +#define R_RISCV_SET_ULEB128	60
> > > +#define R_RISCV_SUB_ULEB128	61
> > >
> > >
> > >  #endif /* _UAPI_ASM_RISCV_ELF_H */
> > > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > > index 7c651d55fcbd..e860726352ac 100644
> > > --- a/arch/riscv/kernel/module.c
> > > +++ b/arch/riscv/kernel/module.c
> > > @@ -7,6 +7,7 @@
> > >  #include <linux/elf.h>
> > >  #include <linux/err.h>
> > >  #include <linux/errno.h>
> > > +#include <linux/kernel.h>
> > >  #include <linux/moduleloader.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <linux/sizes.h>
> > > @@ -268,6 +269,12 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
> > >  	return -EINVAL;
> > >  }
> > >
> > > +static int apply_r_riscv_add8_rela(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	*(u8 *)location += (u8)v;
> > > +	return 0;
> > > +}
> > > +
> > >  static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
> > >  				    Elf_Addr v)
> > >  {
> > > @@ -289,6 +296,12 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
> > >  	return 0;
> > >  }
> > >
> > > +static int apply_r_riscv_sub8_rela(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	*(u8 *)location -= (u8)v;
> > > +	return 0;
> > > +}
> > > +
> > >  static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
> > >  				    Elf_Addr v)
> > >  {
> > > @@ -310,31 +323,149 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
> > >  	return 0;
> > >  }
> > >
> > > -static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
> > > -				Elf_Addr v) = {
> > > -	[R_RISCV_32]			= apply_r_riscv_32_rela,
> > > -	[R_RISCV_64]			= apply_r_riscv_64_rela,
> > > -	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
> > > -	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
> > > -	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
> > > -	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
> > > -	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
> > > -	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
> > > -	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
> > > -	[R_RISCV_HI20]			= apply_r_riscv_hi20_rela,
> > > -	[R_RISCV_LO12_I]		= apply_r_riscv_lo12_i_rela,
> > > -	[R_RISCV_LO12_S]		= apply_r_riscv_lo12_s_rela,
> > > -	[R_RISCV_GOT_HI20]		= apply_r_riscv_got_hi20_rela,
> > > -	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
> > > -	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
> > > -	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
> > > -	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
> > > -	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
> > > -	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
> > > -	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
> > > -	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
> > > -	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
> > > -	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
> > > +static int dynamic_linking_not_supported(struct module *me, u32 *location,
> > > +					 Elf_Addr v)
> > > +{
> > > +	pr_err("%s: Dynamic linking not supported in kernel modules PC = %p\n",
> > > +	       me->name, location);
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int tls_not_supported(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	pr_err("%s: Thread local storage not supported in kernel modules PC = %p\n",
> > > +	       me->name, location);
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	*(u8 *)location = (*location - ((u8)v & 0x3F)) & 0x3F;
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_set6_rela(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	*(u8 *)location = (*(u8 *)location & 0xc0) | ((u8)v & 0x3F);
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_set8_rela(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	*(u8 *)location = (u8)v;
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_set16_rela(struct module *me, u32 *location,
> > > +				    Elf_Addr v)
> > > +{
> > > +	*(u16 *)location = (u16)v;
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_set32_rela(struct module *me, u32 *location,
> > > +				    Elf_Addr v)
> > > +{
> > > +	*(u32 *)location = (u32)v;
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_32_pcrel_rela(struct module *me, u32 *location,
> > > +				       Elf_Addr v)
> > > +{
> > > +	*(u32 *)location = (u32)v;
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_plt32_rela(struct module *me, u32 *location,
> > > +				    Elf_Addr v)
> > > +{
> > > +	*(u32 *)location = (u32)v;
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_set_uleb128(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	/*
> > > +	 * Relocation is only performed if R_RISCV_SET_ULEB128 is followed by
> > > +	 * R_RISCV_SUB_ULEB128 so do computation there
> > > +	 */
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_r_riscv_sub_uleb128(struct module *me, u32 *location, Elf_Addr v)
> > > +{
> > > +	if (v >= 128) {
> > > +		pr_err("%s: uleb128 must be in [0, 127] (not %ld) at PC = %p\n",
> > > +		       me->name, (unsigned long)v, location);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	*location = v;
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Relocations defined in the riscv-elf-psabi-doc.
> > > + * This handles static linking only.
> > > + */
> > > +static int (*reloc_handlers_rela[])(struct module *me, u32 *location,
> > > +				    Elf_Addr v) = {
> > > +	[R_RISCV_32] =			apply_r_riscv_32_rela,
> > > +	[R_RISCV_64] =			apply_r_riscv_64_rela,
> > > +	[R_RISCV_RELATIVE] =		dynamic_linking_not_supported,
> > > +	[R_RISCV_COPY] =		dynamic_linking_not_supported,
> > > +	[R_RISCV_JUMP_SLOT] =		dynamic_linking_not_supported,
> > > +	[R_RISCV_TLS_DTPMOD32] =	dynamic_linking_not_supported,
> > > +	[R_RISCV_TLS_DTPMOD64] =	dynamic_linking_not_supported,
> > > +	[R_RISCV_TLS_DTPREL32] =	dynamic_linking_not_supported,
> > > +	[R_RISCV_TLS_DTPREL64] =	dynamic_linking_not_supported,
> > > +	[R_RISCV_TLS_TPREL32] =		dynamic_linking_not_supported,
> > > +	[R_RISCV_TLS_TPREL64] =		dynamic_linking_not_supported,
> > > +	/* 12-15 undefined */
> > > +	[R_RISCV_BRANCH] =		apply_r_riscv_branch_rela,
> > > +	[R_RISCV_JAL] =			apply_r_riscv_jal_rela,
> > > +	[R_RISCV_CALL] =		apply_r_riscv_call_rela,
> > > +	[R_RISCV_CALL_PLT] =		apply_r_riscv_call_plt_rela,
> > > +	[R_RISCV_GOT_HI20] =		apply_r_riscv_got_hi20_rela,
> > > +	[R_RISCV_TLS_GOT_HI20] =	tls_not_supported,
> > > +	[R_RISCV_TLS_GD_HI20] =		tls_not_supported,
> > > +	[R_RISCV_PCREL_HI20] =		apply_r_riscv_pcrel_hi20_rela,
> > > +	[R_RISCV_PCREL_LO12_I] =	apply_r_riscv_pcrel_lo12_i_rela,
> > > +	[R_RISCV_PCREL_LO12_S] =	apply_r_riscv_pcrel_lo12_s_rela,
> > > +	[R_RISCV_HI20] =		apply_r_riscv_hi20_rela,
> > > +	[R_RISCV_LO12_I] =		apply_r_riscv_lo12_i_rela,
> > > +	[R_RISCV_LO12_S] =		apply_r_riscv_lo12_s_rela,
> > > +	[R_RISCV_TPREL_HI20] =		tls_not_supported,
> > > +	[R_RISCV_TPREL_LO12_I] =	tls_not_supported,
> > > +	[R_RISCV_TPREL_LO12_S] =	tls_not_supported,
> > > +	[R_RISCV_TPREL_ADD] =		tls_not_supported,
> > > +	[R_RISCV_ADD8] =		apply_r_riscv_add8_rela,
> > > +	[R_RISCV_ADD16] =		apply_r_riscv_add16_rela,
> > > +	[R_RISCV_ADD32] =		apply_r_riscv_add32_rela,
> > > +	[R_RISCV_ADD64] =		apply_r_riscv_add64_rela,
> > > +	[R_RISCV_SUB8] =		apply_r_riscv_sub8_rela,
> > > +	[R_RISCV_SUB16] =		apply_r_riscv_sub16_rela,
> > > +	[R_RISCV_SUB32] =		apply_r_riscv_sub32_rela,
> > > +	[R_RISCV_SUB64] =		apply_r_riscv_sub64_rela,
> > > +	/* 41-42 reserved for future standard use */
> > > +	[R_RISCV_ALIGN] =		apply_r_riscv_align_rela,
> > > +	[R_RISCV_RVC_BRANCH] =		apply_r_riscv_rvc_branch_rela,
> > > +	[R_RISCV_RVC_JUMP] =		apply_r_riscv_rvc_jump_rela,
> > > +	/* 46-50 reserved for future standard use */
> > > +	[R_RISCV_RELAX] =		apply_r_riscv_relax_rela,
> > > +	[R_RISCV_SUB6] =		apply_r_riscv_sub6_rela,
> > > +	[R_RISCV_SET6] =		apply_r_riscv_set6_rela,
> > > +	[R_RISCV_SET8] =		apply_r_riscv_set8_rela,
> > > +	[R_RISCV_SET16] =		apply_r_riscv_set16_rela,
> > > +	[R_RISCV_SET32] =		apply_r_riscv_set32_rela,
> > > +	[R_RISCV_32_PCREL] =		apply_r_riscv_32_pcrel_rela,
> > > +	[R_RISCV_IRELATIVE] =		dynamic_linking_not_supported,
> > > +	[R_RISCV_PLT32] =		apply_r_riscv_plt32_rela,
> > > +	[R_RISCV_SET_ULEB128] =		apply_r_riscv_set_uleb128,
> > > +	[R_RISCV_SUB_ULEB128] =		apply_r_riscv_sub_uleb128,
> > > +	/* 62-191 reserved for future standard use */
> > > +	/* 192-255 nonstandard ABI extensions  */
> > >  };
> >
> > Hi Charlie,
> >
> > This is not a critique of this patch, but all these callbacks take a
> > u32 *location and
> > because of the compressed instructions this pointer may not be
> > aligned, so a lot of
> > the callbacks end up doing unaligned access which may fault to an
> > M-mode handler on
> > some platforms.
> >
> > I once sent a patch to fix this:
> > https://lore.kernel.org/linux-riscv/20220224152456.493365-2-kernel@esmil.dk/
> >
> > Maybe that's something you want to look into while touching this code anyway.
> >
> > /Emil
>
> Oh nice, I will pick up that patch and change the "native-endian"
> wording to be "little-endian" in the commit.

Great, thanks. You'll probably also want the reads to be wrapped in
le16_to_cpu() and similar when writing now that it's decided that the parcels
are always in little-endian byteorder.

/Emil

>
> - Charlie
>
> > >
> > >  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> > > @@ -348,6 +479,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> > >  	unsigned int i, type;
> > >  	Elf_Addr v;
> > >  	int res;
> > > +	bool uleb128_set_exists = false;
> > > +	u32 *uleb128_set_loc;
> > > +	unsigned long uleb128_set_sym_val;
> > > +
> > >
> > >  	pr_debug("Applying relocate section %u to %u\n", relsec,
> > >  	       sechdrs[relsec].sh_info);
> > > @@ -425,6 +560,28 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> > >  				  me->name);
> > >  				return -EINVAL;
> > >  			}
> > > +		} else if (type == R_RISCV_SET_ULEB128) {
> > > +			if (uleb128_set_exists) {
> > > +				pr_err("%s: riscv psABI requires the next ULEB128 relocation to come after a R_RISCV_SET_ULEB128 is an R_RISCV_SUB_ULEB128, not another R_RISCV_SET_ULEB128.\n",
> > > +				       me->name);
> > > +				return -EINVAL;
> > > +			}
> > > +			uleb128_set_exists = true;
> > > +			uleb128_set_loc = location;
> > > +			uleb128_set_sym_val =
> > > +				((Elf_Sym *)sechdrs[symindex].sh_addr +
> > > +					ELF_RISCV_R_SYM(rel[i].r_info))
> > > +					->st_value +
> > > +				rel[i].r_addend;
> > > +		} else if (type == R_RISCV_SUB_ULEB128) {
> > > +			if (uleb128_set_exists && uleb128_set_loc == location) {
> > > +				/* Calculate set and subtraction */
> > > +				v = uleb128_set_sym_val - v;
> > > +			} else {
> > > +				pr_err("%s: R_RISCV_SUB_ULEB128 must always be paired with the first R_RISCV_SET_ULEB128 that comes before it. PC = %p\n",
> > > +				       me->name, location);
> > > +				return -EINVAL;
> > > +			}
> > >  		}
> > >
> > >  		res = handler(me, location, v);
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
