Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4628C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCi++sYnstBcInG8RhR7p80MR3BVW9GlNZaWaHV+6VA=; b=sMLXknrrSeujeH
	X00sUwG7gD0H/PjY+55L8nn8NQyynZeTsaNG2lmk3gCdvnTGlpjWgj+oRCwRNHO+WCZX5NWt5YdVM
	1R97+qE8PVeMD+vsp5cEWTjbZ/az+NZG6mjdqZezH+iR7a8hrPszrrlfKwFnRLZns4EuH8YIvs4va
	mwG0auF/JgTprvs8HE8CDaF+snSp9XRVwcuuaJwbLrDXOYuyW16fWjRu9KX0RQZOouHe5pMqM7QFX
	wPM2x3vDAj08dX6zuUP35JSY+GggqK+Hdps7jA1mC1zA3EIDdDJ5dXdL9BFK4fehY0gt6YS/MTy8p
	XjigUZcvsLEJ4O96mqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEGlH-004mEz-2o;
	Fri, 15 Dec 2023 22:34:27 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEGlF-004mEM-0F
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 22:34:26 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35d699ec3caso4437965ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702679664; x=1703284464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSrXYwHfJZ+IcxeBuu1Bbb4/ovX7+ju+MTg9H3SUSYc=;
        b=QizGltfuVgKR+hAU5NiVywPYm7t/chb+5Z1h2/KrG9WcODN/bkH1ei8yNgcrWct/kf
         vf3vFbO/GBLI9rdfezWcJ+tezQFdzWuqoTRFQxmSsaUb9WUAm2tJ/lE5YCPOpX4652+q
         /neSZEDrydsmsOpfU/0Z231/Bwy8kHOrvxjlZdeOw0HQQWqNv0BJH1UvIbLhIvdmW0pQ
         XVWcLIg97ENQ7bA1E0bsbAwKmxafyslkkitX8BD2AM4CxtLJM0XR8z5HKozBbaKGe5hV
         POipHyRnQ/PoWANCGl44QdPbRDrIXM0aCCui2o0cba3zxOZdfH3a1NlXb2VkEvOPQqaG
         4REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702679664; x=1703284464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSrXYwHfJZ+IcxeBuu1Bbb4/ovX7+ju+MTg9H3SUSYc=;
        b=GhMek1L72noGUm4UxZD1H77MdFMXzk8Epcw5FyRNuZ8tiuBFH/OVGByO/YyO64VuRn
         Hr5yjCgZnLVaZ48CcNQwXnsh69EmOGMsiViSObNtGQ20A2z9CFcV+AVIoEitlhqS1XJi
         +BhfmuklCkHnjr74/yJKrksR5z7gSm6eC9VZ0o/JH3GsBGi/mefhUnMvNhh6iWb2sfJd
         yQV8B7Wa2BjtAxDHYmXSmxx9z0hCs2ZV2NZhIZ6Ult69LZjhIRY19bo9tbxELqUDdy/E
         1XeDIWVM7V1C1I10pyWp6/ZW1shs4Ht1/mNkrLu9/YzDnLKok8Iv7TSXVadJeQOFLmdQ
         EHRA==
X-Gm-Message-State: AOJu0YxJSmOaSWyZe8CPOrZ90V5z+pmjHXQVjqA+WPpywxx7Q4Kk37pT
	C1ohsqwUbrILdohI6fiaJRfBDw==
X-Google-Smtp-Source: AGHT+IFtx84X6gNszU4kSOLh8mxXgB8OVmieQxRy1pgvQE4NY6CM1WiqREAIvEllICpeAQSqQtttGQ==
X-Received: by 2002:a05:6e02:180c:b0:35f:7585:e322 with SMTP id a12-20020a056e02180c00b0035f7585e322mr7344225ilv.56.1702679664016;
        Fri, 15 Dec 2023 14:34:24 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id l2-20020a6542c2000000b005c621e0de25sm11916724pgp.71.2023.12.15.14.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 14:34:23 -0800 (PST)
Date: Fri, 15 Dec 2023 14:34:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2] riscv: Check if the code to patch lies in the
 exit section
Message-ID: <ZXzUbRSQYUmHHh1V@ghost>
References: <20231214091926.203439-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214091926.203439-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_143425_121149_33AC870C 
X-CRM114-Status: GOOD (  23.66  )
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

On Thu, Dec 14, 2023 at 10:19:26AM +0100, Alexandre Ghiti wrote:
> Otherwise we fall through to vmalloc_to_page() which panics since the
> address does not lie in the vmalloc region.
> 
> Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> Changes in v2:
> - Fix XIP rv32 build failure
> 
>  arch/riscv/include/asm/sections.h   |  1 +
>  arch/riscv/kernel/patch.c           | 11 ++++++++++-
>  arch/riscv/kernel/vmlinux-xip.lds.S |  2 ++
>  arch/riscv/kernel/vmlinux.lds.S     |  2 ++
>  4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index 32336e8a17cb..a393d5035c54 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -13,6 +13,7 @@ extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
>  extern char __init_text_begin[], __init_text_end[];
>  extern char __alt_start[], __alt_end[];
> +extern char __exittext_begin[], __exittext_end[];
>  
>  static inline bool is_va_kernel_text(uintptr_t va)
>  {
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 13ee7bf589a1..37e87fdcf6a0 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -14,6 +14,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/ftrace.h>
>  #include <asm/patch.h>
> +#include <asm/sections.h>
>  
>  struct patch_insn {
>  	void *addr;
> @@ -25,6 +26,14 @@ struct patch_insn {
>  int riscv_patch_in_stop_machine = false;
>  
>  #ifdef CONFIG_MMU
> +
> +static inline bool is_kernel_exittext(uintptr_t addr)
> +{
> +	return system_state < SYSTEM_RUNNING &&
> +		addr >= (uintptr_t)__exittext_begin &&
> +		addr < (uintptr_t)__exittext_end;
> +}
> +
>  /*
>   * The fix_to_virt(, idx) needs a const value (not a dynamic variable of
>   * reg-a0) or BUILD_BUG_ON failed with "idx >= __end_of_fixed_addresses".
> @@ -35,7 +44,7 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
>  	uintptr_t uintaddr = (uintptr_t) addr;
>  	struct page *page;
>  
> -	if (core_kernel_text(uintaddr))
> +	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
>  		page = phys_to_page(__pa_symbol(addr));
>  	else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
>  		page = vmalloc_to_page(addr);
> diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
> index 50767647fbc6..8c3daa1b0531 100644
> --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> @@ -29,10 +29,12 @@ SECTIONS
>  	HEAD_TEXT_SECTION
>  	INIT_TEXT_SECTION(PAGE_SIZE)
>  	/* we have to discard exit text and such at runtime, not link time */
> +	__exittext_begin = .;
>  	.exit.text :
>  	{
>  		EXIT_TEXT
>  	}
> +	__exittext_end = .;
>  
>  	.text : {
>  		_text = .;
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 492dd4b8f3d6..002ca58dd998 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -69,10 +69,12 @@ SECTIONS
>  		__soc_builtin_dtb_table_end = .;
>  	}
>  	/* we have to discard exit text and such at runtime, not link time */
> +	__exittext_begin = .;
>  	.exit.text :
>  	{
>  		EXIT_TEXT
>  	}
> +	__exittext_end = .;
>  
>  	__init_text_end = .;
>  	. = ALIGN(SECTION_ALIGN);
> -- 
> 2.39.2

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

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
