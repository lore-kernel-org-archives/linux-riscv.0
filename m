Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC8ED2A541
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vaJBzDCZa5sdYsGLGc7BeUquRUzD0OyJhnG/CNjXas=; b=VZx2XVtpzvbLnJ
	I1inTxJJI3/e7RjKjamy6GFGiFup8zyxXDHg8zwMokrOZqM8s3iAkjkjqpwMvTs/I2Bp6B+XWsSc5
	B6EO8CFXGhnUzV7BV/zD4X96Q0/lFI2K8FfvVoq6IH2U6ecEbrYnoDEO6v4Sbyhr2GbbmVGrRZNLP
	GwMBGzLJrNtSZKpz9pklCRqNem3BXcsAdqhGDqw1/LJ6Hif4q0qBsUQeH+UPABW3TO42cK3sQdLCj
	tqFQvp7TTIv0lQx+m8raNeQxaI+tYJollorYcqk64hhsMGEzLKWh17QOg2qlaXwcJYqphZ4MPiMFi
	GWFA4+RB07KyTO7zdzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19jk-0000000CoIT-0cgG;
	Wed, 16 Oct 2024 19:31:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19gM-0000000Cnmp-11My
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:27:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cdda5cfb6so1651925ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729106861; x=1729711661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd1CmdA3yqF27op1lfKzX3+JmGDdwdfJqTWrLKRMg8E=;
        b=vfava+dhwXvfyj3Lq8ok6DbuHqVnrixyvZnJc7I+ov3V1HbmjRJpQaNsYO3qdPLAx9
         4KojM2lB7jDO3e0RTEt0VoYJvapHHNY0d33Oyv7z1+95yn4pv/0DaM6ZUpLD6YIWsOrG
         f6Bwbu70kezKYu1NdTySshHD57E6pe8i4b+N8uMFXNoF9ZQsw1rAqfDEsE+HzgFO0oMM
         a6ofH9FAFOCOwPweS4A5T4qF3EIk13hTz86SW/DYYujE2mSagAcvJv41zERFVHbmW0QK
         WDyYVl746avcz9m0TMIWa/iDfXVLo0yE4OHKvyJn/V7gvzUiWzC5DEmMUU1NCWPwYmCN
         DAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729106861; x=1729711661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd1CmdA3yqF27op1lfKzX3+JmGDdwdfJqTWrLKRMg8E=;
        b=DxjDOLw7CQc0ZxrTy5ML7VqTm+kRiAX+Ob1nvhYl7BjQPBW3FZYOIqxpl38Th7agTT
         kNVf4omAg8VqQku3P/JfP6zE+h/JfblsTxnd4oGX5LfX44X5z2MI6gSry2s0alRZXZi7
         CIT1JY5dfwp7GryLw4lQ9kVz0BRk+Z8eIGjNgvJYXEEET/Zn/t83JwoF/vuCK1XVhSWW
         6GPnlmcyg+/7c4Bw4EOmMKpfSYNlQSM1mAndBoUBRS380uEfL+KPyQFAMPBWmwHa1RdM
         1DZQWxEABEH5KugL258IALVsC1SSGUt2Ws53qtX/nEYspkXHbI0VKG0TacmSwMCM19i8
         jAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnKHIQSIh3DFd1OM+Ujb4kNG6I+Dj5cn4hJsOiCYUMA4kZNReufsOcr1+m5hNZup6iqawyUjjqsfPAHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1EXnnmkOoEFjEh9++M0OtXf4588PQJqhdya33U6nR5S8GlnqS
	pKAyKR5rTLT1txNq0QNq8wAHfEUxXLdiuLPiu1SlUsxgNSEV7fjHtHpxWspKQfw=
X-Google-Smtp-Source: AGHT+IFoxV0OBJ2pPBa3JaF0UAh0T+UygwcrRunJT3pLxQjb5MJyphkUDSDvZdgExNMyuDU4htwPIQ==
X-Received: by 2002:a17:902:d490:b0:20c:f3cf:50eb with SMTP id d9443c01a7336-20cf3cf5379mr121875075ad.44.1729106861266;
        Wed, 16 Oct 2024 12:27:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805ca60sm31993675ad.239.2024.10.16.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:27:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: apatel@ventanamicro.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [02/13] RISC-V: KVM: Save/restore HSTATUS in C source
Date: Wed, 16 Oct 2024 12:27:38 -0700
Message-Id: <20241016192738.646447-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-3-apatel@ventanamicro.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_122742_307046_920749A6 
X-CRM114-Status: GOOD (  11.71  )
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

> We will be optimizing HSTATUS CSR access via shared memory setup
> using the SBI nested acceleration extension. To facilitate this,
> we first move HSTATUS save/restore in kvm_riscv_vcpu_enter_exit().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c        |  9 +++++++++
>  arch/riscv/kvm/vcpu_switch.S | 36 +++++++++++++-----------------------
>  2 files changed, 22 insertions(+), 23 deletions(-)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 449e5bb948c2..93b1ce043482 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -720,9 +720,18 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
>   */
>  static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
> +	struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
> +
>  	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
>  	guest_state_enter_irqoff();
> +
> +	hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
> +
>  	__kvm_riscv_switch_to(&vcpu->arch);
> +
> +	gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
> +
>  	vcpu->arch.last_exit_cpu = vcpu->cpu;
>  	guest_state_exit_irqoff();
>  	kvm_riscv_vcpu_swap_in_host_state(vcpu);
> diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> index 0c26189aa01c..f83643c4fdb9 100644
> --- a/arch/riscv/kvm/vcpu_switch.S
> +++ b/arch/riscv/kvm/vcpu_switch.S
> @@ -43,35 +43,30 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  
>  	/* Load Guest CSR values */
>  	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
> -	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
> -	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> -	la	t4, .Lkvm_switch_return
> -	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
> +	REG_L	t1, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> +	la	t3, .Lkvm_switch_return
> +	REG_L	t4, (KVM_ARCH_GUEST_SEPC)(a0)
>  
>  	/* Save Host and Restore Guest SSTATUS */
>  	csrrw	t0, CSR_SSTATUS, t0
>  
> -	/* Save Host and Restore Guest HSTATUS */
> -	csrrw	t1, CSR_HSTATUS, t1
> -
>  	/* Save Host and Restore Guest SCOUNTEREN */
> -	csrrw	t2, CSR_SCOUNTEREN, t2
> +	csrrw	t1, CSR_SCOUNTEREN, t1
>  
>  	/* Save Host STVEC and change it to return path */
> -	csrrw	t4, CSR_STVEC, t4
> +	csrrw	t3, CSR_STVEC, t3
>  
>  	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
> -	csrrw	t3, CSR_SSCRATCH, a0
> +	csrrw	t2, CSR_SSCRATCH, a0
>  
>  	/* Restore Guest SEPC */
> -	csrw	CSR_SEPC, t5
> +	csrw	CSR_SEPC, t4
>  
>  	/* Store Host CSR values */
>  	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
> -	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
> -	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> -	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
> -	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
> +	REG_S	t1, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> +	REG_S	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
> +	REG_S	t3, (KVM_ARCH_HOST_STVEC)(a0)
>  
>  	/* Restore Guest GPRs (except A0) */
>  	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
> @@ -153,8 +148,7 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
>  	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
>  	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> -	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
> -	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
> +	REG_L	t4, (KVM_ARCH_HOST_SSTATUS)(a0)
>  
>  	/* Save Guest SEPC */
>  	csrr	t0, CSR_SEPC
> @@ -168,18 +162,14 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  	/* Save Guest and Restore Host SCOUNTEREN */
>  	csrrw	t3, CSR_SCOUNTEREN, t3
>  
> -	/* Save Guest and Restore Host HSTATUS */
> -	csrrw	t4, CSR_HSTATUS, t4
> -
>  	/* Save Guest and Restore Host SSTATUS */
> -	csrrw	t5, CSR_SSTATUS, t5
> +	csrrw	t4, CSR_SSTATUS, t4
>  
>  	/* Store Guest CSR values */
>  	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
>  	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
>  	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> -	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
> -	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
> +	REG_S	t4, (KVM_ARCH_GUEST_SSTATUS)(a0)
>  
>  	/* Restore Host GPRs (except A0 and T0-T6) */
>  	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
