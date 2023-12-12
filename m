Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A50C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 01:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rys2xmSiRUxPGJk916Xo2iP+dZNqlMTb/cQ9V7Ot2x0=; b=TnSZA3ec8Lyt0Q
	x3nIZ9G7aGyXL9ZzVZV6Rz43rgr/Uc8IYnU/HYKI5unpIX8XD6gyXhfukk71z4cX0aXTwK3w8dINr
	irU8mOobG1B7n7G6/QDblTA3iVroAUXXw3xnkn53Z95vXk91LHvCThR3VRHuhTonnDZzgpLvq28BP
	bNgvCT4sp2sapr+zP/xtyi5mKl2NrOyE7gJ2xa5OLF+N9PdDlGsQUmoAjexK/4kh+StrleyVAS2d6
	WCSD2cBvB99oLdX+l8QCGlBArZd1zJWsJIxbnyWErSpiWcltozdG1CjrkBOJsH5liQGVf2f82og4T
	WDOzE9j0A5hiBuGSi/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrvX-00ATPK-0p;
	Tue, 12 Dec 2023 01:51:15 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrvS-00ATOx-2U
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 01:51:13 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35d82fb7e86so14506555ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 17:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702345869; x=1702950669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX2WLxx5Rcq4VaM/IYqMbN57BjVsaN794DZZVcGhbe0=;
        b=nqZ8BhiZZ3BJIoDUKtZQoxtUw9BSC6qnrEkxJ+VsUfGvsStHlX6fnOh/1uO17o7nem
         nFtNR7wn+UCMjweOFLbIrRz06Yj9HxcwzcBp6heKyjA4ha1fHulVPliHtidUeHX85D97
         5q2EGBDOQlCOxStXA2cQo2sAVU3EFOlI5Qcb9iKWY0UJnl4T71bKFaUPTdp6m4ap3mip
         FNA5EGDCsHCOCewTVdAGKEfgY/SkgQoer9YxeB54EMwqWv/lkpL9GYXanj4AcD29UZuP
         fJb2STtUE+jKPxnj2D+DQNZ5PDIbTOQC6pXbbUwOPwr3SRWtg+qIeyxqs3xaq/mUZWC3
         ZWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702345869; x=1702950669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX2WLxx5Rcq4VaM/IYqMbN57BjVsaN794DZZVcGhbe0=;
        b=VmY8Lqtjs1wHBvhYOF0XCmeZ5AXaCEVtSi2W9AjO5ZYHWKzS/8OyuM85JJG16C7UUi
         dK7jF+KC7P6m/7LVNIV5xxpkEIuJxjSKZdn/MUU2w+5fEGnPgfD2TA2c7aKGT372z5g2
         yEMTBN5Fmu0MK8KtzIgC/ZI54BqWyrGJCpcyKW8WEswR7Bc+944DQYON0wsl/JGM7IzS
         +1hy050AgakYm7Ma2wBcEctooSqDhey07x/wrxUA7f84x0Q7qEQ6GoamGgl/HgHlc5Ti
         H/75zVMSGD3qOoYRnDRfUU8yzdnv3vbgEsOkndHka+WAv2BpEqYou/KcuN1YMAf2lmxm
         ZlLA==
X-Gm-Message-State: AOJu0YwslRJNusxd0jzW9BKW+eVSzIVLXt0WRkH90lxx9I/wYUMSeZuo
	im/UtYAsEhKrXKEsQsgEVRhY5g==
X-Google-Smtp-Source: AGHT+IGnyMrJXzmjvP+GzSeN8xEYOBCyBBOu71OLX4nlpJx0A1/qebH4GVwEO5MPcOyQmk0ZvFgk2Q==
X-Received: by 2002:a05:6e02:1aa5:b0:35d:a3ce:4e50 with SMTP id l5-20020a056e021aa500b0035da3ce4e50mr4700952ilv.37.1702345869214;
        Mon, 11 Dec 2023 17:51:09 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id jg7-20020a17090326c700b001d0d312bc2asm7296320plb.193.2023.12.11.17.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 17:51:08 -0800 (PST)
Date: Mon, 11 Dec 2023 17:51:06 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-riscv@lists.infradead.org, bigunclemax@gmail.com,
	Amma Lee <lixiaoyun@binary-semi.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] riscv: optimize ELF relocation function in riscv
Message-ID: <ZXe8imHSg20nKagf@ghost>
References: <20230913130501.287250-1-fido_max@inbox.ru>
 <ZXJrGLwxtjf6cK42@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXJrGLwxtjf6cK42@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_175111_040600_D20DB39E 
X-CRM114-Status: GOOD (  43.23  )
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

On Thu, Dec 07, 2023 at 05:02:16PM -0800, Charlie Jenkins wrote:
> On Wed, Sep 13, 2023 at 04:05:00PM +0300, Maxim Kochetkov wrote:
> > The patch can optimize the running times of insmod command by modify ELF
> > relocation function.
> > In the 5.10 and latest kernel, when install the riscv ELF drivers which
> > contains multiple symbol table items to be relocated, kernel takes a lot
> > of time to execute the relocation. For example, we install a 3+MB driver
> > need 180+s.
> > We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
> > type items relocation function in the arch\riscv\kernel\module.c and
> > find that there are two-loops in the function. If we modify the begin
> > number in the second for-loops iteration, we could save significant time
> > for installation. We install the same 3+MB driver could just need 2s.
> > 
> > Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> > ---
> > Changes in v4:
> > - use 'while' loop instead of 'for' loop to avoid code duplicate
> > ---
> >  arch/riscv/kernel/module.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 7c651d55fcbd..8c9b644ebfdb 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -346,6 +346,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  	Elf_Sym *sym;
> >  	u32 *location;
> >  	unsigned int i, type;
> > +	unsigned int j_idx = 0;
> >  	Elf_Addr v;
> >  	int res;
> >  
> > @@ -384,9 +385,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  		v = sym->st_value + rel[i].r_addend;
> >  
> >  		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
> > -			unsigned int j;
> > +			unsigned int j = j_idx;
> > +			bool found = false;
> >  
> > -			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
> > +			do {
> >  				unsigned long hi20_loc =
> >  					sechdrs[sechdrs[relsec].sh_info].sh_addr
> >  					+ rel[j].r_offset;
> > @@ -415,16 +417,26 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  					hi20 = (offset + 0x800) & 0xfffff000;
> >  					lo12 = offset - hi20;
> >  					v = lo12;
> > +					found = true;
> >  
> >  					break;
> >  				}
> > -			}
> > -			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
> > +
> > +				j++;
> > +				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
> > +					j = 0;
> Very interesting algorithm here. Assuming the hi relocation is after the
> previous one seems to be a good heuristic. However I think we can do
> better. In GNU ld, a hashmap of all of the hi relocations is stored and
> a list of all of the lo relocations. After all of the other relocations
> have been parsed, it iterates through all of the lo relocations and
> looks up the associated hi relocation in the hashmap.
> 
> There is more memory overhead here but I suspect it will be faster. I
> had started to mock up a hashmap implementation to see if it was faster
> but decided I should mention it here first in case somebody had some
> additional insight. 

Turns out this is a fantastic heuristic. Using a hashmap is
significantly faster than the default implementation but this algorithm
above is significantly faster than the hashmap. Using the amdgpu driver
(which is actually a collection of drivers) and is a size of about 469M
I found that the hashmap implementation is about 30% faster than the
current implementation, but this patch is 50% faster than the current
implementation. It is probably possible to write an ELF header with the
relocations sufficiently scrambled to make the hashmap faster, but I
suspect that for all "normal" programs this algorithm is faster.

I also tried a couple other smaller modules and it was faster or around
the same as the hashmap in all of them.

A lot of code has changed in this file since this patch was submitted,
can you rebase onto 6.7-rc1? Otherwise this patch is great.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> - Charlie
> 
> > +
> > +			} while (j_idx != j);
> > +
> > +			if (!found) {
> >  				pr_err(
> >  				  "%s: Can not find HI20 relocation information\n",
> >  				  me->name);
> >  				return -EINVAL;
> >  			}
> > +
> > +			/* Record the previous j-loop end index */
> > +			j_idx = j;
> >  		}
> >  
> >  		res = handler(me, location, v);
> > -- 
> > 2.40.1
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
