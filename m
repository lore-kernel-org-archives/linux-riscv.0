Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314E7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSXm9JegiHY2qj+4tPLjAEjsX9wgdF+WXAxqXQZ+wr8=; b=QDv4CUR9/Oe7Au
	BdY24lna+RLC/TDpuNmZdGiojfsDbDpKdjdTAov3qTOPOHaBxpzD5qIx1aZhlItoVzlnoNdVh0w0i
	SOJNoLMLcu4P3WVBCzVhtpu6XvYfpCMSrhs4vfIshvHTBwGhl1I1seN2TPxD4y3SyGxP/1xfJ2g+1
	gGdV6b1A5C0eH6u6aGE3cKBkE8WqbVg2IFVzM3lsBkyArfPwU5+GMIkdtikOOBcJic/OhSm+sgdkX
	iYU+JrwCkKIXCqb0/2jD/pOr3IFFyOwv9FL35QLKIA4m8mKwakvFqNvp2kvxIgITB4qWlPzxjROfv
	HknNH/PcyDVFqXw6TIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPGF-00EPuZ-1p;
	Fri, 08 Dec 2023 01:02:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPGC-00EPsV-01
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 01:02:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d0897e99e0so12198405ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 17:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701997345; x=1702602145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHjpYG+aTG+cGWCfpcLI6dqd/B/j+rYpLgN/+rREz9Y=;
        b=aUvhu9bIofk6B+rMzv21hYE8zrT6HlXI2Do/WN3tOv8AOyfEDchD3VESfpp16gttho
         CltmLORWqq98I8r+ZHz8lvr/50mnId+IpjLGSD/40xf4p0MZUZurFPv1UktfKTP9XE6Z
         BLu+wH6G2chF3sffTaAI98mX3KgB4Om55cJbp3X/AsKnW3v/u8iTRHGK6h1ytrEQSiro
         jpmKuouwpJCdQyoiX+MtM1U113QGDjQpLrR0Cf3sbCmr+VXTAUDqwIXhsPc8eTHM55xG
         c4o7GTkHQ3Cl0y8/3yykG9vpDExPdjIehFEob+5FfVJ2gjms9xiv+It1jNIKygTFlizM
         2/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997345; x=1702602145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHjpYG+aTG+cGWCfpcLI6dqd/B/j+rYpLgN/+rREz9Y=;
        b=m/62ehbA/iSdR83HOv1WisuefqIemAZxS1pVbEMOdsBspVH/lU5fK3iNiQNsXfC9sm
         GEoWwOc4lo+kCCHG0E3WmwUnvcGG5953Q6xbKfPBETOrShphBgDRHSkEqer0UpfZFNdK
         DNAgBuH8M+CT4T5BXVz6+86Igh/+aHyWLzVk9xxn1dd7TSOoD2IJs5cLenSdzfZSPzd7
         VGkBPmGhW8efy3wo44oOz4PQQsJaiTxPK/Mdr58aViw7yhKXZddz4lasUO9aCXn1H3hQ
         6nPEPUVOnAREyrMPb/4W6fEI0UECOaFYMOxLRkYUVMK7zBnZP5b+8MkFpCgvttm2rxPP
         A2jg==
X-Gm-Message-State: AOJu0Yyrbbld0CE2fkb5wlOAW5yAWp7E3LtXqnZJkmtbnMOPaLiGpIg4
	2mQf37uWwu02ri6dKUoe8OEjUw==
X-Google-Smtp-Source: AGHT+IETnkjdJb69QIsZhyHN/XmPatwPLHf0ROdLScBWbQw+jQfCeWBk6Qo8WhgUG+EzAY3jUQSopQ==
X-Received: by 2002:a17:903:32ca:b0:1d0:6ffd:ae05 with SMTP id i10-20020a17090332ca00b001d06ffdae05mr3258630plr.108.1701997345466;
        Thu, 07 Dec 2023 17:02:25 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id g24-20020a170902869800b001bc930d4517sm436637plo.42.2023.12.07.17.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:02:24 -0800 (PST)
Date: Thu, 7 Dec 2023 17:02:16 -0800
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
Message-ID: <ZXJrGLwxtjf6cK42@ghost>
References: <20230913130501.287250-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913130501.287250-1-fido_max@inbox.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_170232_048333_541DFE39 
X-CRM114-Status: GOOD (  31.16  )
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

On Wed, Sep 13, 2023 at 04:05:00PM +0300, Maxim Kochetkov wrote:
> The patch can optimize the running times of insmod command by modify ELF
> relocation function.
> In the 5.10 and latest kernel, when install the riscv ELF drivers which
> contains multiple symbol table items to be relocated, kernel takes a lot
> of time to execute the relocation. For example, we install a 3+MB driver
> need 180+s.
> We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
> type items relocation function in the arch\riscv\kernel\module.c and
> find that there are two-loops in the function. If we modify the begin
> number in the second for-loops iteration, we could save significant time
> for installation. We install the same 3+MB driver could just need 2s.
> 
> Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
> Changes in v4:
> - use 'while' loop instead of 'for' loop to avoid code duplicate
> ---
>  arch/riscv/kernel/module.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7c651d55fcbd..8c9b644ebfdb 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -346,6 +346,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	Elf_Sym *sym;
>  	u32 *location;
>  	unsigned int i, type;
> +	unsigned int j_idx = 0;
>  	Elf_Addr v;
>  	int res;
>  
> @@ -384,9 +385,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  		v = sym->st_value + rel[i].r_addend;
>  
>  		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
> -			unsigned int j;
> +			unsigned int j = j_idx;
> +			bool found = false;
>  
> -			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
> +			do {
>  				unsigned long hi20_loc =
>  					sechdrs[sechdrs[relsec].sh_info].sh_addr
>  					+ rel[j].r_offset;
> @@ -415,16 +417,26 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  					hi20 = (offset + 0x800) & 0xfffff000;
>  					lo12 = offset - hi20;
>  					v = lo12;
> +					found = true;
>  
>  					break;
>  				}
> -			}
> -			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
> +
> +				j++;
> +				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
> +					j = 0;
Very interesting algorithm here. Assuming the hi relocation is after the
previous one seems to be a good heuristic. However I think we can do
better. In GNU ld, a hashmap of all of the hi relocations is stored and
a list of all of the lo relocations. After all of the other relocations
have been parsed, it iterates through all of the lo relocations and
looks up the associated hi relocation in the hashmap.

There is more memory overhead here but I suspect it will be faster. I
had started to mock up a hashmap implementation to see if it was faster
but decided I should mention it here first in case somebody had some
additional insight. 

- Charlie

> +
> +			} while (j_idx != j);
> +
> +			if (!found) {
>  				pr_err(
>  				  "%s: Can not find HI20 relocation information\n",
>  				  me->name);
>  				return -EINVAL;
>  			}
> +
> +			/* Record the previous j-loop end index */
> +			j_idx = j;
>  		}
>  
>  		res = handler(me, location, v);
> -- 
> 2.40.1
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
