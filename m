Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA1C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWaJg3Isxzv5EbGkN8eiDKcgfBOg5sjfpv/2zYLS8+Q=; b=pnXasIEnQaQzzs
	kjGVfKLBWEuOSVWi1SB5VUvAubiQj4N8R7Hc0iqrZtrtMuRtsd71nKyJnVIYQLoP4Iaqn6RsRKf/r
	72/IHTPXnPuSIN1xPHRoeEuCxoAAbgIpTZNwa60h+HsrNQbws/vA1T9Li5v8MBvgqVOwPTNanhqDA
	j+z64c1YhvBrIFn49kn6W9fJ6DEkw7SulAgrkySMcrhjaB0ziFvX9McFiHGgJnOv1v+Y658P6f4SY
	JXuSCSv8fC32uS87MBVCQoE4TfOi61pfR8d0ExXiTbD0SmL9qCgl3FSsYQ/uMhWHZ6ZY97bCnrya7
	tMJZaIRN7RznKOfWEhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiW9-00000006slA-3QMf;
	Fri, 05 Apr 2024 12:18:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiW5-00000006sga-2qU8
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:17:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4148c6132b4so18981055e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712319470; x=1712924270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0g33fTsVSlizqg1S+bo16IuI7wIXRqKOdHvOtcRNGdQ=;
        b=Cf9PwUYYv7ul5Qfn4So/0eOCb744ROaUnWn6Hb5OUA/L6yJscY1rWtF06DM0+pe60L
         rR2hDYEUrObLo1sxeae3avk0Ne0VG4LZ82+n0E2kRI2bRbLwz/JLdknPISN4g5uVS4sa
         TOsR0DThFQaRIWZdP43g2fgYf7mBH7l8CHvhJ8Z3t1uAz4388xOw/OgyYunzK2cCkqep
         ymlnTj3vsxbe0MLZGc+NQLk0zGhxiWt2VjemTxIMowhutcoOXqbblzZQd9w1sdbF8s4m
         3fJzTAFLBHR2JStu7Xjz/Nr5L2AfrDExUGQC5MvxkXtkD8uyeDrbr3MQTyvHvydS2cr0
         FkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319470; x=1712924270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g33fTsVSlizqg1S+bo16IuI7wIXRqKOdHvOtcRNGdQ=;
        b=aQtOxQk1pgkCdFNdgHvfMOBgpV3rtgSwVKQzZ99mUyDFuhRWgc0hFqFnviXaJmk5Kw
         flLFKaK0srNRD8MlIVlPNX9oXmVmrikGFPyQ8GStiXP9ekZIerjnnkuipSxfuWLMVNQp
         6OxIsUsPuj3O1CH9H545Jw7g+Qq2neyna9sC5iQgwTvz/J4zBy5tDATwHEZSBO+Ynb+T
         ZxczY5UbU3eT7usk3oq8z7LXUG/lxag/evsPP+TSbghFk1PKZNNX78TlNEyJUvgxVNuc
         /SiDRE6h2XjR4zH4SGg9w4HT2QIGTEGZGjVPC7vkyywVc77oPhKk4Ds54S5Nae/Jdrf5
         p+KA==
X-Forwarded-Encrypted: i=1; AJvYcCXB2JxfZXEoozwxQBPVrimgw2fSAKFUXILpljXWmhVvsPVeQ61Oq+1THpm5uBSGFQIouMeZr1v2g4DlTa2a4z0vmmlEWzlPAF6ZXZzt5RjV
X-Gm-Message-State: AOJu0Yw5/2YpAZJWjYrRk/ujBRRy8wBmFBtGvwcO9woxigTmqx6yI0rJ
	N/BEivr+l92lZpZBCTLF7Hhb6NI5sDX4WQnNy0E3xKoAJ7ZovRtJJv3aeVdzbvA=
X-Google-Smtp-Source: AGHT+IHSUvbZnvo4yH+jaq8czfWTlAV7G9MX9xSOk1rTV7ws0g9gKf124xz7RpWYcZhefNvu3BhLlw==
X-Received: by 2002:a05:600c:4746:b0:415:431d:7747 with SMTP id w6-20020a05600c474600b00415431d7747mr2014418wmo.7.1712319470607;
        Fri, 05 Apr 2024 05:17:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j10-20020a05600c488a00b004161ea7ed6dsm6093903wmp.38.2024.04.05.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:17:50 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:17:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 17/22] KVM: riscv: selftests: Add helper functions for
 extension checks
Message-ID: <20240405-dae6363b92b742554e85cf4c@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-18-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-18-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_051757_759684_F0051F7A 
X-CRM114-Status: GOOD (  19.24  )
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

On Wed, Apr 03, 2024 at 01:04:46AM -0700, Atish Patra wrote:
> __vcpu_has_ext can check both SBI and ISA extensions when the first
> argument is properly converted to SBI/ISA extension IDs. Introduce
> two helper functions to make life easier for developers so they
> don't have to worry about the conversions.
> 
> Replace the current usages as well with new helpers.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 10 ++++++++++
>  tools/testing/selftests/kvm/riscv/arch_timer.c        |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 3b9cb39327ff..5f389166338c 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -50,6 +50,16 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>  
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
>  
> +static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
> +{
> +	return __vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(isa_ext));
> +}
> +
> +static inline bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
> +{
> +	return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
> +}
> +
>  struct ex_regs {
>  	unsigned long ra;
>  	unsigned long sp;
> diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> index e22848f747c0..6a3e97ead824 100644
> --- a/tools/testing/selftests/kvm/riscv/arch_timer.c
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -85,7 +85,7 @@ struct kvm_vm *test_vm_create(void)
>  	int nr_vcpus = test_args.nr_vcpus;
>  
>  	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
> -	__TEST_REQUIRE(__vcpu_has_ext(vcpus[0], RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSTC)),
> +	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
>  				   "SSTC not available, skipping test\n");
>  
>  	vm_init_vector_tables(vm);
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
