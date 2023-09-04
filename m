Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E427C71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLFSwknVR3tVzfgMBLDT0gnJoox1hse5i0rmS6kZ5r4=; b=ujopL0EFgz3XL8
	s015rXxXdhgSU5A1ZzsaFmPYTsj3RIUqkwYMVabSjRZrdSZGotUPJATXQbVPyxEXU1fAmpyIe2QQZ
	DjTGyGG9PDm6pPSJ6j5Lhf08RKKxzoJYQL2TnfjkuW5Fk6VoFkJzWgFxup0DV0G/b74qjYvWyKGuD
	sB43T4eZsbNqfLhziPaYzPM+TTpVJvwQe1BoyTmF5bqvm6oQ117aEPxYuC5GplkWxOB1BEl+M1IbF
	CxVwVrAv7GBROyGptjIaIohPAc/CF3bA9sQicE7BMSNdwl0THPwFSsRoDFDIiqm4RuLjzihC6XcRB
	35vjZv3mnryckI5+zH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdABw-004EAm-2e;
	Mon, 04 Sep 2023 14:04:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdABt-004E8z-1J
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 14:04:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5007616b756so2530198e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693836267; x=1694441067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9tH83s7KCzR3FLIzIaXHcz20Hx2Sr3w2Og6WosJQfY=;
        b=dDSdmjW1YXYROsv3Bus1UeKsAHfemtilv9h2b1J+/1n1ZkyWYnolbo00jso0YDAYNB
         Bnt5Snh9lZ3fdG4mmpxyA+ZFGjRzficDF6OE1ZUVgUb9dq4rZjmWtRcclYItWPn2Blny
         w5vh2CAVG3RX8XtAMGuv23fWqpR548Xa6fcyg+UorFHrsweWBghpfAQxI+PdbMLBC9/h
         y/2I6xV+kEys/mR8RwzuqLSovPiPULbQxUrf4/VsAiIQwurWxX+kO+m11eBx8+/onyJR
         ahH/Ai6TCsD2uNOVCZCCAkd9iUFUIvmR6gaWp70BD8IqIYqTveX3uORQYMmz9pR4eCtD
         fv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693836267; x=1694441067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9tH83s7KCzR3FLIzIaXHcz20Hx2Sr3w2Og6WosJQfY=;
        b=ZKTotKg2D/eAc1TVlIyEhRcwsoW+nqq2B9qRqQUw20ogXPPuiSXrUu2T8mVQ6he/YF
         M9dH3MtKa3yfo52Du+rPWUVZLzSrvwt8/VflCWFlRTRArA/NNVqjPU3SpaInUYecfdoh
         dT+f1pvsEYBaCjiKcSKpbEQJ2hGIfNziZB4f4IBz0QGYMmOGJuoy13vlTCuqQLd/Oqzo
         +Z9L0989J7CFPn8WJoiNUYv8jvoKm3CrOB2HypS8Na227HU3vM8RWhjixDdevLfbR1gO
         Iww0MCk4MdDVZ1C3j6R/DMCTNV1HnhriKyPU0lpc1sfkoWFaY50TAtHy6J1+VOPslxkq
         FkQA==
X-Gm-Message-State: AOJu0Yx+c4MgF2x3wljUX5bdlk+xbilardPJuWbffCYm7ek9mFqbX5AW
	RjE6lTd8RUIUSK1KC2uQ9DFJgA==
X-Google-Smtp-Source: AGHT+IFF/9PKy4T0NHsglzBux4yLOD/vizZwx8Nlo/Ot5FXCeYE3JH7zKOg8I6O1HYXtVBq3ndfieA==
X-Received: by 2002:a19:5e11:0:b0:500:c566:1797 with SMTP id s17-20020a195e11000000b00500c5661797mr5671974lfb.3.1693836266646;
        Mon, 04 Sep 2023 07:04:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j8-20020a50ed08000000b0052333d7e320sm5801086eds.27.2023.09.04.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:04:25 -0700 (PDT)
Date: Mon, 4 Sep 2023 16:04:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Jim Mattson <jmattson@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Like Xu <likexu@tencent.com>, Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, David Woodhouse <dwmw@amazon.co.uk>, 
	Michal Luczaj <mhal@rbox.co>, Paul Durrant <paul@xen.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 7/8] KVM: riscv: selftest: Change vcpu_has_ext to a
 common function
Message-ID: <20230904-aa8b0d8d23d391586686038a@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_070433_444338_AA121E06 
X-CRM114-Status: GOOD (  20.07  )
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

On Sat, Sep 02, 2023 at 08:59:29PM +0800, Haibo Xu wrote:
> Move vcpu_has_ext to the processor.c so that other test cases
> can use it for vCPU extension check.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h        |  2 ++
>  tools/testing/selftests/kvm/lib/riscv/processor.c  |  9 +++++++++
>  tools/testing/selftests/kvm/riscv/get-reg-list.c   | 14 --------------
>  3 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index d1e5d9f7ad45..6087c8fc263a 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -42,6 +42,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
>  #define RISCV_ISA_EXT_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
>  					     idx, KVM_REG_SIZE_ULONG)
>  
> +bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext);
> +
>  struct ex_regs {
>  	unsigned long ra;
>  	unsigned long sp;
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index 39a1e9902dec..5ececa566f24 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -15,6 +15,15 @@
>  
>  static vm_vaddr_t exception_handlers;
>  
> +bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> +{
> +	unsigned long value = 0;
> +
> +	vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> +
> +	return !!value;
> +}
> +
>  static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>  {
>  	return (v + vm->page_size) & ~(vm->page_size - 1);
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index d8ecacd03ecf..c4028bf32e3f 100644
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

get-reg-list will now assert on get-reg when an extension isn't present,
rather than failing the __TEST_REQUIRE(), which would do a skip instead.
We need both the return false version and the assert version.

> -}
> -
>  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  {
>  	struct vcpu_reg_sublist *s;
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
