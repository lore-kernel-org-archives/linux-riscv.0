Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C96CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 05:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzBE14NZkES1fdvtwJK6InCvCZKfpb2RU8p3HECIDUE=; b=CMzFZHLfH1Lu3O
	6t3iqnarbcLqaPt2aQW2qbcBgiAsrcmTLvUTTzkcZWgLC298Hzzgz3rfzMcTUUND7UI1uPdaJ98nC
	tJunsgC1WW7s4oBQDxAUjUda6H/by4LmHPTXAYyRxRO5jvzjy1BU3sUPwP90dluAtCLuAv885zk9z
	WtekQ07jCqwyJqg+8cOxXOmaVpfRJPtGZWqZI17RGf9kBhqKuShbd8g5qewQutbMpCuugCn0tbwJQ
	QegF1nw4UueISNfL4Jx6eQyMKBLNHOiDbG9Vi08vYOgzWah3COVnO0fyxwxmWPe71auR4pgOuKul1
	Redv09wMOUsxa9yr4pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipXH-001tTJ-2L;
	Wed, 20 Sep 2023 05:14:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipXE-001tRN-2v
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 05:14:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40413ccdd4cso2949755e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 22:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695186833; x=1695791633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nA7XftN55Rzt443xAle+6ZlQo/LHZ8P1ArIv8UK8Is8=;
        b=GTmk1O0Pkkk/LjexWvjr22RhdYfGKHzVwvX8/JwBiY43zKV0VtexNDSlVVjXKnbIYz
         FC0bA+jR7eEBL9o+3cksyJ03fymnrhYf1EzSI5b+vFapszu8zo2/E7Dc4/cvMYQyEJpy
         reAuLJ4EZcJVMK6orAorY0++k9vFDldUgc9YOCBF6XLVbH7bHiRXJlqa+l2aKffbgkmB
         RA5D5zuW9PN8Wy89CgjEd6Lzo1rzC4GmL9RroWxbwmtFxPNfc1DBGoUIpI6Eg0+mNatq
         UGFvQOdDBKK8nh97E7gvpGR+0OiEnAYvbwzeNCu3rctUDDM/nWyfxtGb13ywfcuxLkZH
         jF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695186833; x=1695791633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA7XftN55Rzt443xAle+6ZlQo/LHZ8P1ArIv8UK8Is8=;
        b=FkLsL3iJSINps7sCUzc/0ab2CCtM85xcD8/gKA3wWuG6IbDKpRmYgWucqt40S+F+1U
         MLkocvRiutxi6CHusRco9Evqyo+vPvJCFKgEekoTinI5vG5mRcpXvGJnmTe1El2Gsbn4
         DYJ///VJWX0V5lPNjJQIWLaCQCF4FHs1GTajIvIMS1CC3dTDxUP2xsMaDjYQaGwDByPN
         3pNQgoslWT5eNqtTZvF+i7PPiHZrrdJiQR7NKLCH3afLOKOrLr+SL55KfJFub1rS7kLW
         XvrlRscFAQzrYvhruzaqJBURYRDdVmsnhop+Des24413hbyaEXiWM+AX68jCtVcPvv3d
         fz1A==
X-Gm-Message-State: AOJu0YzsX+n4Bsh9r2kJ7gR1OX0bXb3541obnL6UU9MQLgVZZLUJfz+2
	IeVG9v8yTNNNd32g/UeVEK0z2A==
X-Google-Smtp-Source: AGHT+IFZ2CL+IU2qwUWM9cnEzbB80cRIpZX4g3i3VlY2xsCXTMrHZNyExNRtNkpOkCGAttCle3BkPg==
X-Received: by 2002:adf:f9c5:0:b0:31f:f9e8:3fce with SMTP id w5-20020adff9c5000000b0031ff9e83fcemr3545885wrr.16.1695186833161;
        Tue, 19 Sep 2023 22:13:53 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l21-20020a7bc455000000b003fee8502999sm863420wmi.18.2023.09.19.22.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:13:52 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:13:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] KVM: riscv: selftests: Fix ISA_EXT register handling
 in get-reg-list
Message-ID: <20230920-c166b288c4c1c17144dc3709@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918180646.1398384-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_221400_949163_9FFC504A 
X-CRM114-Status: GOOD (  21.62  )
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

On Mon, Sep 18, 2023 at 11:36:45PM +0530, Anup Patel wrote:
> Same set of ISA_EXT registers are not present on all host because
> ISA_EXT registers are visible to the KVM user space based on the
> ISA extensions available on the host. Also, disabling an ISA
> extension using corresponding ISA_EXT register does not affect
> the visibility of the ISA_EXT register itself.
> 
> Based on the above, we should filter-out all ISA_EXT registers.
> 
> Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 35 +++++++++++--------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index d8ecacd03ecf..76c0ad11e423 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -14,17 +14,33 @@
>  
>  bool filter_reg(__u64 reg)
>  {
> +	switch (reg & ~REG_MASK) {
>  	/*
> -	 * Some ISA extensions are optional and not present on all host,
> -	 * but they can't be disabled through ISA_EXT registers when present.
> -	 * So, to make life easy, just filtering out these kind of registers.
> +	 * Same set of ISA_EXT registers are not present on all host because
> +	 * ISA_EXT registers are visible to the KVM user space based on the
> +	 * ISA extensions available on the host. Also, disabling an ISA
> +	 * extension using corresponding ISA_EXT register does not affect
> +	 * the visibility of the ISA_EXT register itself.
> +	 *
> +	 * Based on above, we should filter-out all ISA_EXT registers.
>  	 */
> -	switch (reg & ~REG_MASK) {
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
> @@ -50,12 +66,7 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
>  	unsigned long value;
>  
>  	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> -	if (ret) {
> -		printf("Failed to get ext %d", ext);
> -		return false;
> -	}
> -
> -	return !!value;
> +	return (ret) ? false : !!value;

This is an unrelated change, but OK. It's consistent with the plan[1] we
have on the timer test series

[1] https://lore.kernel.org/all/20230914-d6645bbc5ac80999674e9685@orel/

>  }
>  
>  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> @@ -506,10 +517,6 @@ static __u64 base_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A,
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C,
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I,
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
