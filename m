Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E7CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9YZaLctASBXXnG5r16FvwIkUeZ9RlXK698Mj7RyL7g=; b=1nwLI4BreHR2WJ
	0V5YiHn9dKI9vyl5Sc0UYsayTVMdDcY7tzaYr762r2/2RprhNtMPkY2ZOMQMBRRSFR5ydD8bvAdvy
	FBfpW6BfnTpNMonwpVlJ2WMzFy+oxVLSMr+gBHFS5O78VoEfnDwFsNzTcvMVu68emKfAQALZZ4tBp
	KjUARdJIXEFiX5GtWM6M3BMRqUaxyKgGhlH8q61yRBNf/y+KuQbTOoc0waJYdVdLha71RLvxOQ3Gm
	q3FpA1DVEyGliFWsFhURMDb0oVxidajYIe6j5Eg8zNHqf8oZRCIGpsA/mSJKg/tnAxAGutHE6p5CQ
	cJ84dxWTOD6k0LlD4Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n6B-00000008OWw-0LWs;
	Fri, 17 Oct 2025 16:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n69-00000008OVh-2SsQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZcRYGr52a4tOVgKtqMlXN+kBqCdQJvh2IsOMcMv7JGg=; b=Jj24bQqloc6FXkx6ZOo1n2k8RU
	PCBXi+8by2eXaJYWoxhBMydrdWPtaxr6cnci3DJwhXKl0Qpk/QAtZnOE7WbnEHz1/ZEjR79BzxksG
	Zlzsef2LYc8IH2zp8GNcRyuu+eX3LKk6GEvHMyduQ/WqhAkaCMCELdib8sodswfB7sqL0w7E+5h7i
	ryoqDnuQsSXvDQpAFvKXpmx7y5QmwtWQlztYFEvJld7pZidbb69s33dPqpPzEFHcfMzyMc/wDwb22
	rX8VXa5g70dQIYvKqdIJLwTkVikQXODtKHrO321kB2KxHzVjKJHjGfssjRMBUyoP/aEgxP4kN/46s
	UScrg8OQ==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n62-00000007jXW-04Mr
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:14:32 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-937b40137b4so131711439f.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760717664; x=1761322464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcRYGr52a4tOVgKtqMlXN+kBqCdQJvh2IsOMcMv7JGg=;
        b=KX7rkJxs/Nt92fpoOzWz44leUlPszoTpidAtuoaWfgCaTdy3QVWT6n9fDR75M0xj7m
         SxpWG3R0dxkoe+KQx0Z2Oca0VZL489OoAk0yVk6Wgfp51+y1rhXe6CGVU4WFdDdockZL
         eZat1u242In+RTP2VbULg9uUYvRNwiLkxSLkMnQU7UvxPtphy7tKw+Cm/IkSSY5uHS8L
         n4jJILcwL78O7p712CVhE0AtccaOJUPwL1rRJZ3j4tQxKlT3mcxJF7NW25PCqUkIrRq4
         /wkSBhN4FuXa06lUKU7z4VJoX4bDIhiwHocxsHqMkU7+1WZJ5FZUWCS1s3VbO/mV8k6a
         Sgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717664; x=1761322464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcRYGr52a4tOVgKtqMlXN+kBqCdQJvh2IsOMcMv7JGg=;
        b=lV09EEFmAcaWdYj0TdA8eGOVH2Lt+sBrdBTpCzVJHTmrOd+p0Le4y1mjf6t3W/YD/U
         u23ZxIOSUqC1TaOj6ORsPVksbVgzLgT9lwPRrPkMpy2AoT8QP2eILdwFkyUUre8Z2I1a
         qLySEHUdVRMXiOYJMnqeETy5uG7KJRVZupP1037PBu5kVMWIlAVMDE3KRzdyOpLYlM/y
         xeRVcGn2Td9HhqOEDnho8IzQpr9wEUhtmoo3mIA6WUvxi9qRNZ83IX1/sDPfkNDG2Mdr
         QuFpMvu6rckFqXQANQYXzbE7fmxiV2bizKtdv11QoKgtvTSSLuh49pOOlUa8mB5POoG/
         iqOw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5UEflPhyegnOepO/fOJgpMPjN9qtoh8oqAzUPDortlQYi4hDkVDpJaoZFWFvXnGB6pdFPeouE0hHCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx0p5Lh0dls0dQpB1EdWGAjCQdcXkUwkzR0bHqci9ixieSfpFi
	OKMK3/KKm9vDt8ywlanXM+vjCS0GDeDMrbUUwSoxGSWgxo5lkgi9l6XlOPiSckwdpVo=
X-Gm-Gg: ASbGncsgvMHZOiV3CeVTm2GWWXwHup8eRRO+b2X/jcukTtZuDCObqUzscGf6FZGdPVJ
	GW8SSQR7T1daT59sunTtSWkDnCbKxEmxA3e4W6mwn7Q23fIlkXn58XnbSf7s36tEQXWLb99N5mB
	cjMG8C981DA1lBBt1ACtq47hnFgfZ3DncJDtfb45z4YriiBHjBe3eJR62a843aSJFANnh11uCkj
	h2jXiCP4wwX4hpShjQ28y6GY/Up7ZeH8+oEttgyEg3admKkcUIvRPBDklFQ7xFjWYIROGBdsQYD
	76Wy+Pwc7NLTlEE2VbmMoWssOG54uQgrgW2BXadtssLEWY8PdZbMVVRqfAacQmneg34aVC9glhP
	SqKYYPJ7CfcHn6yaIvSXD+AZg3sDZdHSnM+4A6kF5KE3TlgG0MYfo3+e2fn8NIkRkg3+ZM8QTi6
	4WQQ==
X-Google-Smtp-Source: AGHT+IG8NcfyQvR4Ib9EQoaH4QfobDX+a05XY4rSJHsCAlxEkbmXVJHbo70zGFdtD5RzLgfxV/T+lw==
X-Received: by 2002:a05:6e02:178b:b0:430:9918:e69f with SMTP id e9e14a558f8ab-430b41eb013mr122131225ab.4.1760717663752;
        Fri, 17 Oct 2025 09:14:23 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768bfbsm8636173.48.2025.10.17.09.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:23 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:14:22 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] RISC-V: KVM: Convert kvm_riscv_vcpu_sbi_forward()
 into extension handler
Message-ID: <20251017-161e4ec373e5f7c41364a4d3@orel>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
 <20251017155925.361560-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017155925.361560-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_171426_216446_42EAE045 
X-CRM114-Status: GOOD (  21.14  )
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

On Fri, Oct 17, 2025 at 09:29:22PM +0530, Anup Patel wrote:
> All uses of kvm_riscv_vcpu_sbi_forward() also updates retdata->uexit so
> to further reduce code duplication move retdata->uexit assignment to
> kvm_riscv_vcpu_sbi_forward() and convert it into SBI extension handler.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 +++-
>  arch/riscv/kvm/vcpu_sbi.c             |  6 +++++-
>  arch/riscv/kvm/vcpu_sbi_base.c        | 20 +++-----------------
>  arch/riscv/kvm/vcpu_sbi_replace.c     | 27 +--------------------------
>  arch/riscv/kvm/vcpu_sbi_system.c      |  4 +---
>  arch/riscv/kvm/vcpu_sbi_v01.c         |  3 +--
>  6 files changed, 14 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 3497489e04db..446f4a8eb3cd 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -69,7 +69,9 @@ struct kvm_vcpu_sbi_extension {
>  			     unsigned long reg_size, const void *reg_val);
>  };
>  
> -void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +int kvm_riscv_vcpu_sbi_forward_handler(struct kvm_vcpu *vcpu,
> +				       struct kvm_run *run,
> +				       struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
>  				     struct kvm_run *run,
>  				     u32 type, u64 flags);
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 1b13623380e1..fd4106c276d8 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -120,7 +120,9 @@ static bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
>  	return sext && scontext->ext_status[sext->ext_idx] != KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
>  }
>  
> -void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_riscv_vcpu_sbi_forward_handler(struct kvm_vcpu *vcpu,
> +				       struct kvm_run *run,
> +				       struct kvm_vcpu_sbi_return *retdata)
>  {
>  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>  
> @@ -137,6 +139,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  	run->riscv_sbi.args[5] = cp->a5;
>  	run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
>  	run->riscv_sbi.ret[1] = 0;
> +	retdata->uexit = true;
> +	return 0;
>  }
>  
>  void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 5bc570b984f4..ca489f2dfbdf 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -41,8 +41,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			 * For experimental/vendor extensions
>  			 * forward it to the userspace
>  			 */
> -			kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -			retdata->uexit = true;
> +			return kvm_riscv_vcpu_sbi_forward_handler(vcpu, run, retdata);
>  		} else {
>  			sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a0);
>  			*out_val = sbi_ext && sbi_ext->probe ?
> @@ -72,27 +71,14 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
>  	.handler = kvm_sbi_ext_base_handler,
>  };
>  
> -static int kvm_sbi_ext_forward_handler(struct kvm_vcpu *vcpu,
> -				       struct kvm_run *run,
> -				       struct kvm_vcpu_sbi_return *retdata)
> -{
> -	/*
> -	 * Both SBI experimental and vendor extensions are
> -	 * unconditionally forwarded to userspace.
> -	 */
> -	kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -	retdata->uexit = true;
> -	return 0;
> -}
> -
>  const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental = {
>  	.extid_start = SBI_EXT_EXPERIMENTAL_START,
>  	.extid_end = SBI_EXT_EXPERIMENTAL_END,
> -	.handler = kvm_sbi_ext_forward_handler,
> +	.handler = kvm_riscv_vcpu_sbi_forward_handler,
>  };
>  
>  const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor = {
>  	.extid_start = SBI_EXT_VENDOR_START,
>  	.extid_end = SBI_EXT_VENDOR_END,
> -	.handler = kvm_sbi_ext_forward_handler,
> +	.handler = kvm_riscv_vcpu_sbi_forward_handler,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index b490ed1428a6..2c456e26f6ca 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -186,34 +186,9 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
>  	.handler = kvm_sbi_ext_srst_handler,
>  };
>  
> -static int kvm_sbi_ext_dbcn_handler(struct kvm_vcpu *vcpu,
> -				    struct kvm_run *run,
> -				    struct kvm_vcpu_sbi_return *retdata)
> -{
> -	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> -	unsigned long funcid = cp->a6;
> -
> -	switch (funcid) {
> -	case SBI_EXT_DBCN_CONSOLE_WRITE:
> -	case SBI_EXT_DBCN_CONSOLE_READ:
> -	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
> -		/*
> -		 * The SBI debug console functions are unconditionally
> -		 * forwarded to the userspace.
> -		 */
> -		kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -		retdata->uexit = true;
> -		break;
> -	default:
> -		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> -	}
> -
> -	return 0;
> -}
> -
>  const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
>  	.extid_start = SBI_EXT_DBCN,
>  	.extid_end = SBI_EXT_DBCN,
>  	.default_disabled = true,
> -	.handler = kvm_sbi_ext_dbcn_handler,
> +	.handler = kvm_riscv_vcpu_sbi_forward_handler,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
> index 359be90b0fc5..c6f7e609ac79 100644
> --- a/arch/riscv/kvm/vcpu_sbi_system.c
> +++ b/arch/riscv/kvm/vcpu_sbi_system.c
> @@ -47,9 +47,7 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
>  
>  		/* userspace provides the suspend implementation */
> -		kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -		retdata->uexit = true;
> -		break;
> +		return kvm_riscv_vcpu_sbi_forward_handler(vcpu, run, retdata);
>  	default:
>  		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
>  		break;
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 368dfddd23d9..188d5ea5b3b8 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -32,8 +32,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
>  		 * handled in kernel so we forward these to user-space
>  		 */
> -		kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -		retdata->uexit = true;
> +		ret = kvm_riscv_vcpu_sbi_forward_handler(vcpu, run, retdata);
>  		break;
>  	case SBI_EXT_0_1_SET_TIMER:
>  #if __riscv_xlen == 32
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
