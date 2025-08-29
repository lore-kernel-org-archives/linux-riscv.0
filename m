Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BCBCA0FF9
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pIubDguITJKkYDhB0fIjgthwUPJBLnoQnq/LMC++ja4=; b=3JFzY0YTdT4I21b5gBufi8B22I
	I66iLek/eWxGnheviFqZhBGiwJt1yd8rYWiJDBID942Xn2NlA8qfnZEuwuqPYFZ83z7apKis7cPlK
	BBern4we728Fh/fiaaDVde58E7p3ZvQEkeh9eOwZ5HHqcKzwP77GxLeLz+DShJba74I+ZUQNELDUW
	9P05aQhbhif6rmjXAACEJf+xr/FUZ+iX0Y6K46CWrR+JwoO7LxgSmPe0YSD5GXGjapt6OBUpuWqNN
	UJg+UhN4yKalLX96uHp2X3HqC9MXyYSqe2QhfLF+CUyigTT7YH7sFs56WD03z33GkvV2++aBieylF
	QKcjnhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oK-00000007CFi-2SUG;
	Sat, 30 Aug 2025 00:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us60W-00000006rKf-3XVK
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Aug 2025 20:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=; b=lB6JsMOhXKmt0yF6aGoHsuYVUq
	Jui/4CUm1/ugm0QxePiryvOjYGcr/LwrSJcDIp7iLCq4aOoRW8XVjex/6iBtJ4gkl/Te6xcO9Q6FC
	D4myk7gOhPbcAW/rixsSAPY+XS2sNcxKDAeSyjzkNLUlyi0NDtW6zzwYR7ZAN0AwsGXhYtjBnDbbd
	QoJ9slOeBE8AnyLNBwgTKTdk4P2sKPuXXiGfjbP3sn3f3YJXAKVw9reidsA+BV8hNYPH8QpjQjOv3
	KFckcyMbyaNK96sTWPariKpJz1UDiHgAva5G9/4cvmIqCRE29WcWvLa+co62LBZzAGhLLo4y1GGDc
	83xuK+QQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us60R-00000003JLR-0P4w
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 20:47:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-325e31cecd6so2453671a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756500447; x=1757105247; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=;
        b=ZQAo+tQwf7ICQLSSaOjLPJr1Tot82AWHpWc8y1ThOXoqmwEdNqXa3T0mcEVcS9SGT3
         lSZGSwBvpqf3BnBY2k/gFO3Z4OXLXGvbFWTpshSQMitLPoi5+okd734EJ9k28wBq++Rf
         +OSfT7oQp6LT3PEJfA6I7oLyKIJgeu8LF65STy899FVn7CnEvHWybsyEHPvWQErdriCc
         rpdAWQM9o1m+o0Cn8BN8SCLjV24V/kkslU1XWizBpYf+6Sc+93q9DITAdgrRHO+9m4Mk
         yNswyVoz6kIgkrPmc85mv3K6EE3kmXBgDnFRyeTmmyF1pfAuPyGgLgspxxwY6wuAiSGz
         3IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756500447; x=1757105247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=;
        b=IiDFSK8URB5oo12LF2UE2mlmY1jCG35yG6R+z7U07dA1tTOW0xDvm4yZjmaRKkN0Gi
         Q/r0NNnSPDqYaUDScIL1t+CUmwMEraZBOtNuZvRW6Bfvhx/NQLN5RdZ7dYp5C0u8nf05
         U8bppD5u8fA+9fEWiyVg6XO2UzfW/Imk9bEEXtbDou6+6E1KEfeEVp5xw3CBY5x5ziVu
         1j4LZ82gknnTbJShRfU2mbU2mSqX2X+v1f2vw4YpOOgIrTY/bHf/GUFnkyNsrok0wo9L
         UETl8d9z0/OVJIf/Vkw74AcSD7WGyUq8Fn9hN85mbSYq6JGY2WQOJ3UscEjX4sQKUxm4
         B4yg==
X-Forwarded-Encrypted: i=1; AJvYcCUOHhCSqAd3uPXtQhr6MBIIbi9Z/H5tj/J3U2mK1EnMGQ2a9r56VDqvwmr4Q+jmcCBMDV0KWd89vWCbSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7fT2U7ZNNtuiItooU/1um9MowxWhI5WD37PZq1Uqgp1Rbmzxe
	lYZPx3FIuByMpL6w7Zfe8ilZlups7Vd6vu1BGThTwxcHP8jTPlUw+yU5db3SY5NGXya30MWuYbs
	r/nAbfg==
X-Google-Smtp-Source: AGHT+IEEqHXHhC1dOfepFQ4McJBotwArzkUulxIcLhYJ/fKtpfgV5WqeosCA+M558p3CNkr7r/wGr0do/qg=
X-Received: from pjbli2.prod.google.com ([2002:a17:90b:48c2:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3889:b0:327:b30d:9b7f
 with SMTP id 98e67ed59e1d1-327b30d9cdbmr12852743a91.12.1756500446915; Fri, 29
 Aug 2025 13:47:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 13:47:25 -0700
In-Reply-To: <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
Mime-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com> <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
Message-ID: <aLIR3deQPxVI2VrE@google.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_214732_397314_BBE5A3A9 
X-CRM114-Status: GOOD (  22.24  )
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

On Fri, Aug 29, 2025, Atish Patra wrote:
> The arch specific code may need to know if a particular gpa is valid and
> writable for the shared memory between the host and the guest. Currently,
> there are few places where it is used in RISC-V implementation. Given the
> nature of the function it may be used for other architectures.
> Hence, a common helper function is added.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/linux/kvm_host.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 15656b7fba6c..eec5cbbcb4b3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
>  	return !kvm_is_error_hva(hva);
>  }
>  
> +static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
> +{
> +	bool writable;
> +	unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
> +
> +	return !kvm_is_error_hva(hva) && writable;

I don't hate this API, but I don't love it either.  Because knowing that the
_memslot_ is writable doesn't mean all that much.  E.g. in this usage:

	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
	if (kvm_is_error_hva(hva) || !writable)
		return SBI_ERR_INVALID_ADDRESS;

	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
	if (ret)
		return SBI_ERR_FAILURE;

the error code returned to the guest will be different if the memslot is read-only
versus if the VMA is read-only (or not even mapped!).  Unless every read-only
memslot is explicitly communicated as such to the guest, I don't see how the guest
can *know* that a memslot is read-only, so returning INVALID_ADDRESS in that case
but not when the underlying VMA isn't writable seems odd.

It's also entirely possible the memslot could be replaced with a read-only memslot
after the check, or vice versa, i.e. become writable after being rejected.  Is it
*really* a problem to return FAILURE if the guest attempts to setup steal-time in
a read-only memslot?  I.e. why not do this and call it good?

	if (!kvm_is_gpa_in_memslot(vcpu->kvm, shmem >> PAGE_SHIFT))
		return SBI_ERR_INVALID_ADDRESS;

	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
	if (ret)
		return SBI_ERR_FAILURE;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
