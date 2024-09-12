Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D39EEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4nbZ/mibmHlo5dJRTDZLgqIwaaqyJnaTAxluZVpcGg=; b=b0GDW1/Av9rinT
	mqF75q5VMzu1lmN3s7BM+OqanlcU6c3YiA3rw+S/0QJZJDEYATz68XnAaDvwwaHsRU2cXgLXfKG+D
	nR631iLHy0MWzWBR6RQhfAB1qMJwsUAV2tmvEn+nk8HabhcDq0WgZVjV773myg2d6YPoszd3NocwZ
	M1kkC41Cavggej4tQW+B8LMBSG0678bAZZAfnoXuAEc3LvgeeEvLSUIdHPzuHv3xtd5kgPY3pZ0Mp
	LGRUsKzdIGy3927d3/BTt5P9dowMl13VKQBy2oW5paBE84S6n1GVgFvscZJejWpTkftEJFDBmC0GJ
	/HL1RqQHcHsTOMW/cVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soskG-0000000EPAu-3MPr;
	Thu, 12 Sep 2024 22:57:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soskE-0000000EP9q-0tDl
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 22:56:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2057c6c57b5so8908715ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726181817; x=1726786617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYeDafd6h4Ckb8JAjqukFPSa5tGTBnNmbEnNRSDSsQ0=;
        b=JFaMf7BFKbxB4maD3IQf5yi0xXpAdAzA72QE35WHprTOBXNPK/Wn20m729B/VJtreq
         oKP43wvwwze0CMd2dVsL7RwPVBW/0yVGMhEsE6tHOSsWmEsT/2qLJZ5o671yo3xEJxyG
         3nbCeDZVniPIvunPVWDTWoMxApi3EYUDk0ehjlbik06CFIBNr4VHpW4A+RzFnEO4vX3D
         dGxpKtPcR8KTZOLKUMbM2GJU73k3kkK/C+UTt23XM0tNv2e0sAS4lkn57rHuWUvsGR2V
         6bxGKT21q+K8xTpY15hy6rpUmqRhM6AMg/cU2oDzsUM8nrvAdJI/IVb+LM0SJ77MxMgj
         DmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726181817; x=1726786617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYeDafd6h4Ckb8JAjqukFPSa5tGTBnNmbEnNRSDSsQ0=;
        b=YLu5UYxZNZK/cYsufpamdzH2clv3BXzWVRh8BZsTSgC7eG4FUNbMQngPxr0SuKbozk
         tz1gfdflT+hM/Nim4nwX2ChkBj8Xz4Wa+qQlzYufpOTBsuJncFRoBABJwA4Dwnt+jnpg
         tCNrrXCblvzL+dRJwbla3aOHurr0dHeiYJlYIa/tt+A+ZAtMJSdn8akd/Cj53DlqCEO7
         AKxijofXgab8QPnBco591PX2yjD5PpG6J+umgGw8aQ7AEAx4Vpy7L0CeIR/Jwd5nYdGV
         A47H7re5vfPkv0WzSfXmHiJijPCAhF1uOWv0hFt2fCrDXuJXfy7x0vjrUDVUklp403Rr
         Ph+w==
X-Gm-Message-State: AOJu0Yxu0O4RXcnk4EJ5DlRdmxjl+mm8J/vpTCuGnrNHM9X8U5x95Tx4
	izglR1zyQbaNWQL+QPirxW6np6l3ouiDYlsmr3a1QdQwkWnDdIH7QbjekPFRQQ4=
X-Google-Smtp-Source: AGHT+IHY8n+CpuCNyplrI5I2c5yN0lN83eMD2C9rgDbxBSIaStLSLcw/aHiLyl46zfx/eLeTeZoTHQ==
X-Received: by 2002:a17:902:ea03:b0:202:4bd9:aea5 with SMTP id d9443c01a7336-2074c623694mr162541905ad.14.1726181817024;
        Thu, 12 Sep 2024 15:56:57 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdc33csm18588835ad.143.2024.09.12.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 15:56:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:56:54 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: Re: [PATCH v3 2/3] riscv: Add support for per-thread envcfg CSR
 values
Message-ID: <ZuNxtoZqvbzGptyp@ghost>
References: <20240718004808.2246354-1-samuel.holland@sifive.com>
 <20240718004808.2246354-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718004808.2246354-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_155658_275638_8ECD21C5 
X-CRM114-Status: GOOD (  25.59  )
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

On Wed, Jul 17, 2024 at 05:47:55PM -0700, Samuel Holland wrote:
> Some bits in the [ms]envcfg CSR, such as the CFI state and pointer
> masking mode, need to be controlled on a per-thread basis. Support this
> by keeping a copy of the CSR value in struct thread_struct and writing
> it during context switches. It is safe to discard the old CSR value
> during the context switch because the CSR is modified only by software,
> so the CSR will remain in sync with the copy in thread_struct.
> 
> Use ALTERNATIVE directly instead of riscv_has_extension_unlikely() to
> minimize branchiness in the context switching code.
> 
> Since thread_struct is copied during fork(), setting the value for the
> init task sets the default value for all other threads.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> 
> (no changes since v1)
> 
>  arch/riscv/include/asm/processor.h | 1 +
>  arch/riscv/include/asm/switch_to.h | 8 ++++++++
>  arch/riscv/kernel/cpufeature.c     | 2 +-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 8702b8721a27..586e4ab701c4 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -124,6 +124,7 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> +	unsigned long envcfg;
>  	u32 riscv_v_flags;
>  	u32 vstate_ctrl;
>  	struct __riscv_v_ext_state vstate;
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 7594df37cc9f..9685cd85e57c 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>  
> +static inline void __switch_to_envcfg(struct task_struct *next)
> +{
> +	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
> +				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
> +			:: "r" (next->thread.envcfg) : "memory");
> +}
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> @@ -103,6 +110,7 @@ do {							\
>  		__switch_to_vector(__prev, __next);	\
>  	if (switch_to_should_flush_icache(__next))	\
>  		local_flush_icache_all();		\
> +	__switch_to_envcfg(__next);			\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 4efaf12b470e..43fdae953379 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -878,7 +878,7 @@ unsigned long riscv_get_elf_hwcap(void)
>  void riscv_user_isa_enable(void)
>  {
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
> -		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
> +		current->thread.envcfg |= ENVCFG_CBZE;
>  	else if (any_cpu_has_zicboz)
>  		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
>  }
> -- 
> 2.45.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
