Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C898EEE271
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izviuu+xv2e/KSvQs5PBUPLEGDkBvZDrTd9p8lyRdQQ=; b=jtyCgOvxAjYJup
	TikJx9U7MuBjUTO6FqLNF0JiGWn/TijFBZXh106hl1av2KlwJmvHRHyfyoFkIrTwoYRFpDr1DLnj7
	aRO/rJIxWIvgghpnpA17EXscBUIVnz/9PWUEbRP2z6rVxF3g9qJBUDnpfJe2rOzblC1e/7NxIP/CE
	1GL9ZtpMWKHaTc+zCViYgNTCFPLDCULU6Mzbf3RVyqKEVMMNAC4QTvfWSEkWRSSjvJmCwIFpHpZl3
	CoWZmXXJkyFQmCGK2+pwyc9yZF7GWm8+fQJlbp+e7TDbUsCrVPcZz2q1DX317BLUC5+gimS8n82ld
	yQnzQzFP0iOGC9CZNwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosp6-0000000EPmS-4AFM;
	Thu, 12 Sep 2024 23:02:00 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosp4-0000000EPl4-03Wl
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:01:59 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso1157354a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726182117; x=1726786917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KChuFq8ScYbijlFMvm8zOY8n9eP6VarVDAkuanrdrYo=;
        b=FAqWNj+MHpXvTV2zf8r8FkXWUKkY1lCIoL4hzXlSuvBrx/b+ZQRurDpN5S9bS5tbIn
         WRMChi7N45MfNj8urdsz/TJPLEyduMA+TybeRYyyvh08T4re23kTv+CSVioigPIZJru4
         IIa3vzqc9ltcGfIcg0o1Jsucicnl3Sxne1EOW8s8as9g3yM/kx0rUjANz6/KG7PKLI11
         ZG6OQMd/MXWcTBkZyW0Zt5y2nZJlo/DbG1dPWQKoQn3xdmpixANvII3w0tymG2eB56r4
         soc7TdmlNpiZMg40Gy6wQQhFxANW5JTY3mlaj9rsdhUnfwa6u/M99+yRliemiPW78j0d
         NVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726182117; x=1726786917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KChuFq8ScYbijlFMvm8zOY8n9eP6VarVDAkuanrdrYo=;
        b=GNenTUyQXFpLCnUm9vFV0OYPu1V6LcZign0MCqpr9YmlnTvSop8ZWbf8DlxUJaQhbK
         lioZSI+LuXNTIzHXcsfVLXDm9Uma5gXJbgMsCECKbdiCL9j+ozFjTBEclh4Rry/M30M5
         lLw5Dcm0NbgqM8S4Q7DxP33YS7w/++nY9/TFV+RlFZXZzAZOhHMTlkZG4Y3aE71MASTN
         S46XqyCaypD/1pIcXmIueN4YyzTx2IEAKNDfaDWfLA+TQngs6GR1+6RvAN+AJdJFuNul
         cxBAJfQJBfr1v8MLKXxaOnH1LbJXF/ZciHzhS+qgOJHLYPDMlAPIgBIPLmbrpiZ8dIcK
         mWxA==
X-Gm-Message-State: AOJu0YxAPCgkLAJrMqRjJJGqiOc4dvAcvFQoSxyXQrexdCm6CqX0MJUL
	AGaDZ0s6IrbtFk/JIaYqzd2BseeRwtmDh+pa+T9iZg05554Wv47eWRtc5kiHcBE=
X-Google-Smtp-Source: AGHT+IG46t6i9jwRgQMQoH4kG1FKO/7tAiHFAmbFyy4IgIFqq0GKbGzGJVhjmRRTR2Po/ZMyfwuF2Q==
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:37bd:b553 with SMTP id adf61e73a8af0-1cf76244cb3mr5657217637.46.1726182116780;
        Thu, 12 Sep 2024 16:01:56 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fddc705sm2270248a12.58.2024.09.12.16.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:01:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:01:53 -0700
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
Subject: Re: [PATCH v4 2/3] riscv: Add support for per-thread envcfg CSR
 values
Message-ID: <ZuNy4dIXe6Ik0yy3@ghost>
References: <20240814081126.956287-1-samuel.holland@sifive.com>
 <20240814081126.956287-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814081126.956287-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_160158_078124_844D2729 
X-CRM114-Status: GOOD (  25.81  )
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

On Wed, Aug 14, 2024 at 01:10:55AM -0700, Samuel Holland wrote:
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
> ---

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

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
> index 0139d4ea8426..df3e7e8d6d78 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -922,7 +922,7 @@ unsigned long riscv_get_elf_hwcap(void)
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
