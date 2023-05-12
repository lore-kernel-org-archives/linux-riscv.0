Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E234C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rBrhoC0q2yV+4ygj4uXPE7i59R+J6z8ikXDuSWs/lI=; b=So11qXL4VVWOX7
	VUcP0PTTDdvS580SrVZwTHzvyWDvwpJziAsA65f8O6SXsSKhZ366OIxcBgSVIsU9JIStRgM+e38PN
	g850T3050cCV8i9axWGvEWn2eN4JpR5N9fIzKR9lkz9/GnlGFDoQYifG/mk1xlgDgUHNdfhkub7PT
	R2VsthvM5C0gkj/KnqBaPXTfcjy2+Utv7/3SXgJAKwRmb5BT20TvvqaukJBxw25YF+CSNo4Wb2hSp
	kD3/TmCurNABBHSuc/2BybYqkDMuMBOukXMSWjAMXaPw96CaTwjZuR8sL7oxdebpcuf7UeCVnRmKn
	v3I6ZUCHIp1kqlB3MMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPf7-00BXjg-29;
	Fri, 12 May 2023 10:06:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPf4-00BXia-1V
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 10:06:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f41d087b24so49093995e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683885964; x=1686477964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRiOAb/9csqhYTIFyp1pXoHEquerHMt4RcBHag6qrzA=;
        b=FtnfcAiPQBflolkUTJAEGWO8NbifJuTY2DfUmyZKzawcND8rUBbNphH5LHn/GcuCl9
         hw+XAzWoW+qzwKOplZAsLVdAigNEKLglK8DqSybALmT+uDVraCDYhZgn8PTiyWgChhIO
         fjcKvvrG5Ds+tqIFynzyAn/6Sl5EhfdBPNEU54fmbNmUiIxdTak4hBkP3u7bRp6wFFja
         /Ai+NSPJfybgtVYn7lbYnvVehtJM8d3FIe+UFmk0ikvVQURHRJL6XjuEo5BUVKCnWxOg
         D0Xvef1dlNf0/iliMj+yASQBt+6bT4RpTw99iK07PKEGgwnJy/4WpMIRr/XoqdqYTBeS
         J+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683885964; x=1686477964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRiOAb/9csqhYTIFyp1pXoHEquerHMt4RcBHag6qrzA=;
        b=HySm9FBjuhI/5w37qs6Tg4Kw+oJoVBXcAvbL/XJK5l/q52Feb4ACRF9/+T5GOIQdSE
         l48yDJvx+ixHP0BeaibusRZlgLw8JJAXxTV4TtSChImIazCKuuhnWU0X6jG08+lBC+Io
         +YLAou54OoaWDT7fee4Oo0GwAT17Xyqz4NeK1ir3Msfn688nDTg3h4SjRmHAXdkV4Jhg
         g8I0gOO++di1S+tUK+Q8g4jPWHrDiV5xV7hjpwsnk7nf+AvzB7G1MkKX/Gv00P085O2S
         SlowfIInY+Z33rxJsEgbSqfZKzW5nGbl6JGilrCcYSt9bsL3ZIOpyfnaQPU+/a1Tt62W
         5leQ==
X-Gm-Message-State: AC+VfDw1264BQ+S3pv+bh4DnFBblSmWXk+C/6K5NDUfyW3TpNrhUMFEG
	rPox2Fk2cl/aTNprJOnW4wcdDg==
X-Google-Smtp-Source: ACHHUZ41RiKQE8KrlkMU/mH9eDmaYqmoUwJppNHdh4NZvMMR1RzeE2dRK3wifot4GUmdO1dKVaRWSg==
X-Received: by 2002:a05:600c:2195:b0:3f4:e4cd:f6e with SMTP id e21-20020a05600c219500b003f4e4cd0f6emr4312945wme.17.1683885964259;
        Fri, 12 May 2023 03:06:04 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a6-20020a1cf006000000b003f0aefcc457sm28146577wmb.45.2023.05.12.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 03:06:03 -0700 (PDT)
Date: Fri, 12 May 2023 12:06:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Amma Lee <lixiaoyun@binary-semi.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	xiezx@binary-semi.com
Subject: Re: [PATCH v2] riscv: optimize ELF relocation function in riscv
Message-ID: <20230512-a9128942f5c09108bd0c4ec3@orel>
References: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
 <20230512-a73001a0f4cfcf5f0e68d898@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512-a73001a0f4cfcf5f0e68d898@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_030606_504074_EB74F6A5 
X-CRM114-Status: GOOD (  39.06  )
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

On Fri, May 12, 2023 at 12:04:13PM +0200, Andrew Jones wrote:
> On Fri, May 12, 2023 at 04:51:53PM +0800, Amma Lee wrote:
> > The patch can optimize the running times of "insmod" command by modify ELF
> > relocation function.
> > When install the riscv ELF driver which contains multiple
> > symbol table items to be relocated, kernel takes a lot of time to
> > execute the relocation. For example, we install a 3+MB driver need 180+s.
> > We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
> > items relocation function and find that there are two for-loops in this
> > function. If we modify the begin number in the second for-loops iteration,
> > we could save significant time for installation. We install the 3+MB
> > driver could just need 2s.
> > 
> > Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> > Reviewed-by: Conor Dooley <conor@kernel.org>
> > 
> > ---
> >  arch/riscv/kernel/module.c | 53 ++++++++++++++++++++++++++++++----------------
> >  1 file changed, 35 insertions(+), 18 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 55507b0..1683c1d 100755
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -385,9 +385,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  
> >  		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
> >  			unsigned int j;
> > -			/*Modify the j for-loops begin number from last iterates end value*/
> > +
> > +			/*
> 
> whitespace issue here
> 
> > +			* In the second for-loops, each traversal for j is
> > +			* starts from 0 to the symbol table item index which
> > +			* is detected. By the tool "readelf", we find that all
> > +			* the symbol table items about R_RISCV_PCREL_HI20 type
> > +			* are incrementally added in order. It means that we
> > +			* could interate the j with the previous loop end
> > +			* value(j_idx) as the begin number in the next loop;
> > +			*/
> >  			for (j = j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
> > -			/* Modify end */
> >  				unsigned long hi20_loc =
> >  					sechdrs[sechdrs[relsec].sh_info].sh_addr
> >  					+ rel[j].r_offset;
> > @@ -420,22 +428,30 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  					break;
> >  				}
> >  			}
> > +
> >  			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
> > -				if(j_idx == 0){
> > +				if (j_idx == 0) {
> >  					pr_err(
> >  						"%s: Can not find HI20 relocation information\n",
> >  						me->name);
> >  					return -EINVAL;
> >  				}
> > -				
> > -				
> > -				for (j = 0; j < j_idx; j++){ 
> > +
> > +				/*
> 
> also here
> 
> > +				* If the last j-loop have been traversed to the
> > +				* maximum value but never match the
> > +				* corresponding symbol relocation item, the
> > +				* j-loop will execute the second loop which
> > +				* is begin from 0 to the prerious index (j_idx)
> 
> previous
> 
> > +				* unless the previous j_idx == 0;
> > +				*/
> > +				for (j = 0; j < j_idx; j++) {
> >  					unsigned long hi20_loc =
> >  						sechdrs[sechdrs[relsec].sh_info].sh_addr
> >  						+ rel[j].r_offset;
> >  					u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
> > -				
> > -				
> > +
> > +
> 
> While fixing this whitespace, we could remove the redundant blank line too.
> 
> >  					/* Find the corresponding HI20 relocation entry */
> >  					if (hi20_loc == sym->st_value
> >  						&& (hi20_type == R_RISCV_PCREL_HI20
> > @@ -447,36 +463,37 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  						unsigned long hi20_sym_val =
> >  							hi20_sym->st_value
> >  							+ rel[j].r_addend;
> > -					
> > -				
> > +
> > +
> 
> also here
> 
> >  						/* Calculate lo12 */
> >  						size_t offset = hi20_sym_val - hi20_loc;
> > +						/* Calculate lo12 */
> 
> stray copy+pasted line?
> 
> >  						if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
> >  							&& hi20_type == R_RISCV_GOT_HI20) {
> >  							offset = module_emit_got_entry(
> >  								me, hi20_sym_val);
> >  							offset = offset - hi20_loc;
> > -				
> > +
> 
> need to just remove this blank line
> 
> >  						}
> >  						hi20 = (offset + 0x800) & 0xfffff000;
> >  						lo12 = offset - hi20;
> >  						v = lo12;
> > -					
> > +
> 
> same here
> 
> >  						break;
> >  					}
> >  				}
> > -				
> > -				if (j == j_idx)
> > -				{
> > +
> > +				if (j == j_idx) {
> >  					pr_err(
> >  						"%s: Can not find HI20 relocation information\n",
> >  						me->name);
> >  					return -EINVAL;
> >  				}
> > -				
> > -				
> > +
> > +
> 
> should just remove both the blank lines above
> 
> >  			}
> > -			
> > +
> > +			/* Record the previous j-loop end index */
> >  			j_idx = j;
> 
> Huh... what did I miss? I went through the whole patch but only see
> formatting changes (and more opportunity for formatting changes).
> Where's the actual change?

It's best to do formatting ("no functional change") changes separately
from the functional changes to help reviewers see that, too. Please
separate the formatting into its own patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
