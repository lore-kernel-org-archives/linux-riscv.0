Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D56C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Iun9l95WgdBstTvySv3P5aepWDrAHJ1b9rpt4oCiZw=; b=Vkuw0LpNxB/AdK
	QPZ0aKccurCuGNymXxSd4XdVYLmQdnwVDGGT+oZmo5LTmTToeXWZQp5sfNHfh7F92zsZlcm0OGudQ
	4Ny9S8t+ztdrZpSuCIHqxrUFiORdhQlRCA0aLB9Ip7c/dTR+Kk4T6jPxj32KhQgYUZb3i5zE2SbkP
	lby1pluvyB0rkJp5xBAlluD7F4AjNdnxQwfpYLKV3HOnYh9qB77yTA+0WRmicWA8ethugQMl5vxb1
	1bf4XqJL8wFoYYzPK6s+4jmCXgTx4GSbO/dwvw8Ms+wSoTOXgeH9sLMuMQmSGFUz5CQ/1GaEkytzT
	E4VNhNhatWb9Sgysu1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK62-002fx1-2A;
	Fri, 28 Jul 2023 09:49:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK5z-002fvq-0P
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:49:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso2563444a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690537753; x=1691142553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q5nn0TL8ozMkfbttvB6kE7ZxMnlIo+EeJgK/9n8Mj1I=;
        b=gACLxCuQCEdu51w5VdhqNvVqjzISdVkvlBLeYLgdbaG++mxGSCdtdqms/zahddtjDi
         j0swRIun2wRShaOvnaf+KJtHxVBLMBAy+i/Ge80sFlOEt9wsFA63xc/mDWcyGjpq2JUI
         qbn10cgJWzEGQaljXx/EQImIsEBlXmq32QKDgrx368aaSED44YsEtr2B0tLz9452dkzM
         XFEefqxSqwwuL8g7g/r3nirycyUq5MNoherWPm4I+L1JFLxm6DQYSgpkG9Wz4t4Kf3p4
         KSVA0GDbMRnCMeiOnPKc6zLCdQmICLmt+RWoDujl1leVv/QmLV+UMJPjwH1PxcTJoIzG
         Rgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537753; x=1691142553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5nn0TL8ozMkfbttvB6kE7ZxMnlIo+EeJgK/9n8Mj1I=;
        b=lXPUxCdZ1+v0139LqBwVK/icfK0WPwD/GzZY2nfsrfdwIWJJLF3ewL6zf9JnVSs6AD
         yo8Ossk6S43Sqk0GHhMe19J+M3CoGSn5ZMQCVgrxE5GAWltZ5Ny3cModrnvAzroKmeGw
         aInqsBVIcAKqymRcenqIG+QV3bJrUxFPhu/I9lqc52HgY6S2JEa44AvMRpm5uFCsAlPE
         Ou//85jOVzMIe9j/fSB6mhCjk3sUm85SReZ6nr2aA4skqXlo0/L9mZATfXrmDMDNtgZy
         7Wppk2E/gjhCAo1Qps2x4lsK76mKr0IGPJPA0H7xy7iMwZSKOwrvphUgfGk1dZug/i0v
         m4tw==
X-Gm-Message-State: ABy/qLZF4YxyxTy2Yiz74XIvajPSeHp4xUNq9s/kY53xXmT6aqzH2svV
	R9ouiByBZ9gOjPx02Jdv2wb0oQ==
X-Google-Smtp-Source: APBJJlGIFiMF31MKWtUHTgKLxY7INzVOjVfUymee39P/mxUdaq/c7lBnWza5/439Jb5NZ2SKbZZTFA==
X-Received: by 2002:aa7:c0d4:0:b0:522:303c:2f8c with SMTP id j20-20020aa7c0d4000000b00522303c2f8cmr1136476edp.6.1690537752939;
        Fri, 28 Jul 2023 02:49:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7d49a000000b0051dfa2e30b2sm1604860edr.9.2023.07.28.02.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:49:12 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:49:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/4] KVM: riscv: selftests: Add guest helper to get vcpu
 id
Message-ID: <20230728-42019a78766a59dc5abdd412@orel>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <36b5837e9e94465dd2b7d7a17bb84dea082f2ffa.1690364259.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36b5837e9e94465dd2b7d7a17bb84dea082f2ffa.1690364259.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_024915_166669_C7EEA7B7 
X-CRM114-Status: GOOD (  18.12  )
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

On Thu, Jul 27, 2023 at 03:20:07PM +0800, Haibo Xu wrote:
> Add guest_get_vcpuid() helper to simplify accessing to per-cpu
> private data. The sscratch CSR was used to store the vcpu id.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
>  tools/testing/selftests/kvm/lib/riscv/processor.c     | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 9ea6e7bedc61..ca53570ce6de 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -165,4 +165,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +uint32_t guest_get_vcpuid(void);

I'd also put this prototype somewhere common.

> +
>  #endif /* SELFTEST_KVM_PROCESSOR_H */
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index f1b0be58a5dc..b8ad3e69a697 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -316,6 +316,9 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
>  	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.sp), stack_vaddr + stack_size);
>  	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
>  
> +	/* Setup scratch regiter of guest */

typo: register

The comment above is pretty useless since it just states what the code
states, but with even less information, since it doesn't state how the
sscratch register is getting set up. I'd either drop it or write it
as

 /* Setup sscratch for guest_get_vcpuid() */

> +	vcpu_set_reg(vcpu, RISCV_CSR_REG(sscratch), vcpu_id);
> +
>  	/* Setup default exception vector of guest */
>  	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
>  
> @@ -424,3 +427,8 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, void (*handler)(struct ex_r
>  
>  	handlers->exception_handlers[1][0] = handler;
>  }
> +
> +uint32_t guest_get_vcpuid(void)
> +{
> +	return csr_read(CSR_SSCRATCH);
> +}
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
