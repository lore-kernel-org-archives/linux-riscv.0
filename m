Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B47EDE99D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENI2et9YfO9ZdWNEuGLoHY4uDXVO1kxmYe00yNdfpxo=; b=xCTsPq0Axz67Ud
	F/AJA69prT7HPhBqdKWdzACrAaJAeiJOlzWIfjZi061EI8GuNiA+I/aIV10sUVGD7PjVyKn0+nWiH
	L8SQrVn73XCRiN2ycgDxXZxYyDjm+hea1Q4E2CjRX624UkXWtGa4wgPUDIXbS4w89L1rPCBzxAfT+
	py6esui3DC04Tav/BIAPbrrc2n+Uq1jjOHNk2xSv6/0A1yUXRPKaoUZJT3E3DN2kquUCWqlit0fkh
	kwY1DhkNmAUK92CQE/hYWhx2qjjRCYPtN4t1OOcYHzQCfNmK0LHUjqEDHO0QFmAz4zdcAm0f6LVI7
	jIeoH1zzFgyUUaRzTmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiHo-007nLR-2V;
	Thu, 14 Sep 2023 09:05:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiHl-007nJM-0g
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 09:05:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-403012f27e3so7782955e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694682315; x=1695287115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/mRrBnh8S4j8WTa2+bV8lSaUBhWpdN931kOj5VJSEI8=;
        b=O7m0f5CFNXiYQ4FzQMlB9F9kiRv8fPJtt2AbpLbYfjTIhgk4sd8XMHC02WTX0uJ8oo
         /QgafrOJvH7nHCdZZSMEzKa9/0Jv/paGtppRiKCJnjzVPiyOGRqeLJILR45ZcMUa+EoD
         exr9BGc3CzdcKjmh0WL4JHE/jNAAV4DEz0c39CxZRyrkI8Uc+WviZc1NfJm/Hh1cbH2O
         os0tmNiCXDjL6CGc56cJ/TuGEWP+Dv9CX52Rw47c2PbWH1kfM/qFvgZn8tIPXbAYDZoU
         URGr/N6UBwMkk3MjqFayHZg4VpRfev8E+Zp0+JeqhNmUQhEfhh/A5doCpOCnp3+WF64P
         Da3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682315; x=1695287115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mRrBnh8S4j8WTa2+bV8lSaUBhWpdN931kOj5VJSEI8=;
        b=lZyEuOO/c99GPdgKJSRqfVruEDo02X/ncLb3otUOjRYp+OE/Mk1q7lxEcsXmB4N+wC
         oog3MLKHYPuN81NO8ExI8L4+aHU0XgwKl0sdy54od7ujA+DsQ+k5chqs8GblcqQVLj4C
         BTmW13W3zR+OU7iczLUCogtlN0J63uSq5TmpSG36Ri4FwbNdN6H/XSDEOxxSNtSUr4Zz
         cP++sX/y+P2aevjlEIN8Zb56HtoR/izcofTYe8zsfoXblQQ0E3KIq+siPhi8C+5Zy1YT
         WvExPHP2c9iK11/O5RwqprrqjVGjcfxYQdCndPoA9zVAEzypbzFKvJP1FfrBWdy47UZ+
         f1zg==
X-Gm-Message-State: AOJu0Yz9wdvbk/MoqWZrFgaPKQc/35JQmX7+YkBZbjGazJJlS09eF37S
	dMxfuQePVp9ghXDB3qgjKKyJgw==
X-Google-Smtp-Source: AGHT+IFy8TjeoZnzEKVRF6ve15/1ZtfpBeOza9n+OW8rYx1ZUEatSJ80NefZ30RlKJWhr7ppOLul1g==
X-Received: by 2002:a05:600c:6d7:b0:404:74e3:27a4 with SMTP id b23-20020a05600c06d700b0040474e327a4mr285671wmn.40.1694682315033;
        Thu, 14 Sep 2023 02:05:15 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bce0a000000b003fee53feab5sm1391448wmc.10.2023.09.14.02.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:05:14 -0700 (PDT)
Date: Thu, 14 Sep 2023 11:05:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Thomas Huth <thuth@redhat.com>, Colton Lewis <coltonlewis@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 8/9] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
Message-ID: <20230914-d6645bbc5ac80999674e9685@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <dd81ef2b87e4cc160cb0ee782010dcf3543e065a.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd81ef2b87e4cc160cb0ee782010dcf3543e065a.1694421911.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_020517_255778_24D7D48A 
X-CRM114-Status: GOOD (  19.76  )
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

On Thu, Sep 14, 2023 at 09:37:02AM +0800, Haibo Xu wrote:
> Move vcpu_has_ext to the processor.c and rename it to __vcpu_has_ext
> so that other test cases can use it for vCPU extension check.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h      |  2 ++
>  .../testing/selftests/kvm/lib/riscv/processor.c  |  9 +++++++++
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 +---------------
>  3 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 2c975d9cead2..7d5517648ea7 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -42,6 +42,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
>  #define RISCV_ISA_EXT_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
>  					     idx, KVM_REG_SIZE_ULONG)
>  
> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext);
> +
>  struct ex_regs {
>  	unsigned long ra;
>  	unsigned long sp;
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index 39a1e9902dec..e527ad0abc30 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -15,6 +15,15 @@
>  
>  static vm_vaddr_t exception_handlers;
>  
> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> +{
> +	unsigned long value = 0;
> +
> +	__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> +
> +	return !!value;

I'd rather not assume that value will remain zero across a system call
which fails. Let's write this as

     unsigned long value = 0;
     int ret;

     ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);

     return !ret && !!value;

> +}
> +
>  static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>  {
>  	return (v + vm->page_size) & ~(vm->page_size - 1);
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index d8ecacd03ecf..0dcff823f287 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -44,20 +44,6 @@ bool check_reject_set(int err)
>  	return err == EINVAL;
>  }
>  
> -static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> -{
> -	int ret;
> -	unsigned long value;
> -
> -	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> -	if (ret) {
> -		printf("Failed to get ext %d", ext);
> -		return false;
> -	}
> -
> -	return !!value;
> -}
> -
>  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  {
>  	struct vcpu_reg_sublist *s;
> @@ -77,7 +63,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
>  
>  		/* Double check whether the desired extension was enabled */
> -		__TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
> +		__TEST_REQUIRE(__vcpu_has_ext(vcpu, s->feature),
>  			       "%s not available, skipping tests\n", s->name);
>  	}
>  }
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
