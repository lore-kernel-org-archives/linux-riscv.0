Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1194C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlxOP5S+OOxAL+U/1ITl1v59eKlIF+eip8IgM6AiJTI=; b=UOtG7QAmIN0uil
	6rFDfinIZTqJp4km+wpyoxkQ4H4PPG2tLKXLUL8RG5pxewGNoj0lZMP79up1EEeVV/ZCThf4855s+
	/2agm6g3o/zkY6f3wnEiZlWB6GfPYurQ+GpbIvp7l2JimzD+GigDp6teFck375ehpJylkpXPtT9Lg
	UnW7ffP2cGxNvWnFvRIt7lAvBF9HVYZ+17IX/890YFR7dBVZjUFBMXWULtVRUENSwUwcd7eTTo1ml
	FOU/ozhKDCJMrV0XTlddwdBazL9TqPmhAqrng6FePVRMZebn/Lx/W2/9/gA7GUEL26Uc0P84koR/u
	2lYIrbv7Ip9mIFOLoLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kjw-0000000GHcM-0a3t;
	Wed, 08 May 2024 17:06:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kjr-0000000GHUv-3PL0
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 17:05:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ed012c1afbso14935ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715187933; x=1715792733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NSwC0XUWH2/jAZekAHNFl+y4/f7gtwIOhD7wWr4LzY=;
        b=jQ7iJMVt4yocKXDuKI02k2d+Mlwl2uS2/HS1hdAMniJItN2D3ncaTxoV0s71HzQ6/F
         A1/ZVEVPu8VIycaMX0jbxqS6viEGvfEMTYJz0dYMJlOHEWyz0bLfDxY+vQXfStX3DdKg
         wYekvN97DFmo7t6swzoraMmYltMCJFIz2DD2pAw2eExUhj+r0A26yQ+mEV12ySfaq8Vd
         XZ8eryUSiHUMVmDzzv9LRtTMOk9Qgj8sXaCrWtJApBVFoWRYkchJsHZtjvq95foaWMP0
         qxyAG8vNV3TgpD2ygfLtmioNroFlzSvV1EotHWfptVQUyCY2E2fJvkRHQ5XSMh38G3eQ
         dZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715187933; x=1715792733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NSwC0XUWH2/jAZekAHNFl+y4/f7gtwIOhD7wWr4LzY=;
        b=Egc5W+LCuOkRwHNcXU08IRooVwcYNzDWlWEqXwJZzCUHarFyXKz3J8cR0NoP6JroeK
         uZEo83u/FvvP4qOrjspoyas+NtAlGHFev3LLlAPB9vc+wnrSohrxBJxZvB1a3F6HLhTk
         XXyM96B0iGSE/iuiV+ml3i90Dj9NC/AvAQOTNLwYnhsaqQbVSfYWQPxwP0816V34PY/B
         OoMfvvxa8sSshcRhJgDbKG7Q1EQOb/i0iBwnyClTa7phThoNK7SkvvVN/ku6IyWnxwWS
         MJLNRGIVTLhoo9KPhs9NKtDZkHxoEzya4QUuqg5opNhmcIJd9KVdPw0wyxEjmRRg18dn
         Qa5A==
X-Forwarded-Encrypted: i=1; AJvYcCUHcNLbvDyN0rMcQVWpc28DeeNqdwnGfxdQH3mmZbd8JMVIcB09IhGa3V22qOPSDMc7LpkqQoUFeYN+dJOtwvtaoq8zfmZQCLiQWagPJmsW
X-Gm-Message-State: AOJu0YzBwXOyJicvQ2CJvopOk3Qt14ulImdijE+ILgpsGHOw+75VAKpR
	RWJFi47528SAFSLEGu8Di4bmzq8Sc01UlZioQP8dOQvNa0XnrgNKilSaKPumC0g=
X-Google-Smtp-Source: AGHT+IGgz0QEZsH36hv/uUgJ9K6WhGuMsBxbHUfds4fIdLNeyAsKU2bNpkZPr42Zsg1brC4AQL33vQ==
X-Received: by 2002:a17:902:da84:b0:1e2:a5db:30d1 with SMTP id d9443c01a7336-1eefa138b68mr3407615ad.13.1715187933343;
        Wed, 08 May 2024 10:05:33 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1d01:8836:5e9d:e040])
        by smtp.gmail.com with ESMTPSA id jx7-20020a170903138700b001e469386fddsm12124945plb.40.2024.05.08.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:05:32 -0700 (PDT)
Date: Wed, 8 May 2024 10:05:30 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT
 Kconfig option
Message-ID: <Zjuw2t6vL6yIcPR9@ghost>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240507-compile_kernel_with_extensions-v2-3-722c21c328c6@rivosinc.com>
 <b3ff587a-61f5-4abf-b71f-7ad48ff66969@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3ff587a-61f5-4abf-b71f-7ad48ff66969@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_100555_888542_0F92DD8D 
X-CRM114-Status: GOOD (  37.48  )
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

On Wed, May 08, 2024 at 10:00:48AM +0100, Ben Dooks wrote:
> On 08/05/2024 02:36, Charlie Jenkins wrote:
> > The existing "RISCV_ISA_SVNAPOT" option is repurposed to be used to by
> > kernel code to determine if either
> > PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT or
> > PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT has been set.
> > 
> > PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT will check if the hardware
> > supports Svnapot before using it, while
> > PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT will assume that the hardware
> > supports Svnapot.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/Kconfig               | 19 -----------------
> >   arch/riscv/Kconfig.isa           | 44 ++++++++++++++++++++++++++++++++++++++++
> >   arch/riscv/include/asm/pgtable.h |  3 ++-
> >   3 files changed, 46 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c2e9eded0a7d..3c1960e8cd7c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -484,25 +484,6 @@ config RISCV_ALTERNATIVE_EARLY
> >   	help
> >   	  Allows early patching of the kernel for special errata
> > -config RISCV_ISA_SVNAPOT
> > -	bool "Svnapot extension support for supervisor mode NAPOT pages"
> > -	depends on 64BIT && MMU
> > -	depends on RISCV_ALTERNATIVE
> > -	default y
> > -	help
> > -	  Add support for the Svnapot ISA-extension in the kernel when it
> > -	  is detected at boot.
> > -
> > -	  The Svnapot extension is used to mark contiguous PTEs as a range
> > -	  of contiguous virtual-to-physical translations for a naturally
> > -	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > -	  size. When HUGETLBFS is also selected this option unconditionally
> > -	  allocates some memory for each NAPOT page size supported by the kernel.
> > -	  When optimizing for low memory consumption and for platforms without
> > -	  the Svnapot extension, it may be better to say N here.
> > -
> > -	  If you don't know what to do here, say Y.
> > -
> >   config RISCV_ISA_SVPBMT
> >   	bool "Svpbmt extension support for supervisor mode page-based memory types"
> >   	depends on 64BIT && MMU
> > diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
> > index 0663c98b5b17..37585bcd763e 100644
> > --- a/arch/riscv/Kconfig.isa
> > +++ b/arch/riscv/Kconfig.isa
> > @@ -124,3 +124,47 @@ config RISCV_ISA_V_PREEMPTIVE
> >   	  This config allows kernel to run SIMD without explicitly disable
> >   	  preemption. Enabling this config will result in higher memory
> >   	  consumption due to the allocation of per-task's kernel Vector context.
> > +
> > +config RISCV_ISA_SVNAPOT
> > +	bool
> > +
> > +choice
> > +	prompt "Svnapot extension support for supervisor mode NAPOT pages"
> > +	default PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT
> > +	help
> > +	  This selects the level of support for Svnapot in the Linux Kernel.
> > +
> > +	  The Svnapot extension is used to mark contiguous PTEs as a range
> > +	  of contiguous virtual-to-physical translations for a naturally
> > +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > +	  size. When HUGETLBFS is also selected this option unconditionally
> > +	  allocates some memory for each NAPOT page size supported by the kernel.
> > +	  When optimizing for low memory consumption and for platforms without
> > +	  the Svnapot extension, it may be better to prohibit Svnapot.
> > +
> > +config PROHIBIT_RISCV_ISA_SVNAPOT
> > +	bool "Prohibit Svnapot extension"
> > +	help
> > +	  Regardless of if the platform supports Svnapot, prohibit the kernel
> > +	  from using Svnapot.
> > +
> > +config PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT
> > +	bool "Allow Svnapot extension if supported"
> > +	depends on 64BIT && MMU
> > +	depends on RISCV_ALTERNATIVE
> > +	select RISCV_ISA_SVNAPOT
> > +	help
> > +	  Add support for the Svnapot ISA-extension in the kernel when it
> > +	  is detected at boot.
> > +
> > +config PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT
> > +	bool "Emit Svnapot mappings when building Linux"
> > +	depends on 64BIT && MMU
> > +	depends on NONPORTABLE
> > +	select RISCV_ISA_SVNAPOT
> > +	help
> > +	  Compile a kernel that assumes that the platform supports Svnapot.
> > +	  This option produces a kernel that will not run on systems that do
> > +	  not support Svnapot.
> > +
> > +endchoice
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 6afd6bb4882e..432be9691b78 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -289,7 +289,8 @@ static inline pte_t pud_pte(pud_t pud)
> >   static __always_inline bool has_svnapot(void)
> >   {
> > -	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
> > +	return IS_ENABLED(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT) ||
> > +	       riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
> 
> could you add the IS_ENABLED(*) check into riscv_has_extension_likely
> and other such functions?

I wasn't sure how to support that. An option I was debating about this
was fixing up riscv_has_extension_likely() so that it's a macro and
SVNAPOT could be expanded to both
CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT and RISCV_ISA_EXT_SVNAPOT.

- Charlie

> 
> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
