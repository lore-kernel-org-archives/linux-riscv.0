Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F745C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 09:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+o2QtmMtVAusCABHwPnP1tAlQzK/C69EzY7flwz95E=; b=m8sD1+x1WY5Ssy
	fkbS6bEOhbt8CRGgEJowEp0td3I9iArC/2qhLmDHeCo0hAyuF0ne5V4ChCk+494IeYMDTMTpuv2F9
	4c90VQ5Nahu0P/aHFrpLTS1eKHbLBdLAAfFdEjIG9HjFhDdrYSZC5lvqtblLYebTaWJr7ms7BGFd7
	43B49zvTywvdLVXM0vqbQhREpw3+MnsOrPuvYTdFalUSlV9XOac5hbEsNeumFOxRBFw7Dc80aT5dy
	nWoF80FsHQFXUrGdB5NEskNnHenncG2l1zJ/mfg0KCV1im6kYUdqbvRSX4NvA2X33woWcSGQjaygH
	S5jhb+jNpoQrfTRAxT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4hr-00CeK6-1O;
	Tue, 27 Jun 2023 09:09:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4ho-00CeFm-14
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 09:09:50 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so487766366b.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687856970; x=1690448970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0dPPN6kCxjJ5erU6C8GI2QpZR2Odnb/ktBK6lqyvdY=;
        b=eZMzvYYkDo8EfR7GYZC2UEnZSGriHw1BzLCiOfGra3b2gqub9gEyeftBpgrsE1Us2o
         6JFZLDMOSh92+JS5MZ8TD+vn5oJrWDH9kD7RhVcSTc6pdjTmRzo/XgWxOHvGQ1NE1lbk
         jj1kvNlyxa+p46PiIy/BuVrkH2bfc9U3Xil7zkB2GQ93+HVIkPsktCI+rx8rlNQ1hDrs
         l946asInJqI5DBhG9fmf0hvBTKRlMttnOpX2bZ7N0+OIzUcF4Voh365nwihT8sINjk9D
         XYiSnoYfIaGsCm8wmUxhO/obTZwOD/O99AOzfjGeeM9upJVj16dWxdKE1bixlQt8yXsG
         kl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687856970; x=1690448970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0dPPN6kCxjJ5erU6C8GI2QpZR2Odnb/ktBK6lqyvdY=;
        b=a7VP2SxlRZNl3vMYGvp851RkHOvkMFnbkcxfdCjQMynVOO5HAUDIKEuHUvopIKHtYs
         wtKycFRDkB8Pmm5J4hY0P/6OrR4Ldd12NK1xweNcT2kpEnW871sMGU/KsGoGYOky4nDC
         f+cFVHZc6C6shRVcUQHwngc08fnjoHX0lI9zxUx92dLVTM2K3LzMSw4hjmmzMAwR3wm7
         s1h2LqZezdGV5TDrEGva7D3fPgsIdQJO+rWFfGf8XrbDNjx02XFZlbWpkNUofABSVwsx
         7D1OPd4cjatCoVsaxgTp3RMSzJGBBi38IJnWTDereQKd+brwWIeEevjaj4KfD2FAKAm6
         ft4Q==
X-Gm-Message-State: AC+VfDwxkitkkD6FQuSDWWgur/5WoidPmpaIsxzRNn/KA3LcA8oO22ks
	TScoqhWLBFZAFNzQwUtDTYLGzQ==
X-Google-Smtp-Source: ACHHUZ4JTx2HNgMrDX8zs9F7AE78EPk6RMDfso94B/r0ax0vwcVieNX1DoGrYahuA+FJpIr1APh3ag==
X-Received: by 2002:aa7:d784:0:b0:51b:d49c:8c36 with SMTP id s4-20020aa7d784000000b0051bd49c8c36mr15262930edq.16.1687856970460;
        Tue, 27 Jun 2023 02:09:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7d513000000b0051d8a512472sm3133032edq.51.2023.06.27.02.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:09:29 -0700 (PDT)
Date: Tue, 27 Jun 2023 11:09:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 08/12] KVM: arm64: selftests: Move reject_set check
 logic to a function
Message-ID: <20230627-4d207186c4ef81be43c9d874@orel>
References: <cover.1687515463.git.haibo1.xu@intel.com>
 <341feff384c9f8a20ed4aac6e2dda0440d6b84f2.1687515463.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <341feff384c9f8a20ed4aac6e2dda0440d6b84f2.1687515463.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_020948_365603_DAE2CED6 
X-CRM114-Status: GOOD (  25.10  )
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

On Fri, Jun 23, 2023 at 06:40:10PM +0800, Haibo Xu wrote:
> No functional changes. Just move the reject_set check logic to a
> function so we can check for specific errno for specific register.
> This is a preparation for support reject_set in riscv.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/aarch64/get-reg-list.c | 8 ++++++++
>  tools/testing/selftests/kvm/get-reg-list.c         | 7 ++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> index aaf035c969ec..4e2e1fe833eb 100644
> --- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
> @@ -27,6 +27,14 @@ bool filter_reg(__u64 reg)
>  	return false;
>  }
>  
> +bool reject_set_fail(__u64 reg)
> +{
> +	if (reg == KVM_REG_ARM64_SVE_VLS)
> +		return (errno != EPERM);
> +
> +	return false;
> +}

I think we should pass errno in as a parameter and I prefer positive
predicate functions, so I'd name this check_reject_set() and reverse
the logic. Also, we don't want to check for KVM_REG_ARM64_SVE_VLS,
because that duplicates the rejects set. I see in a later patch
that riscv needs to check reg because different errors are used
for different registers, but that's because KVM_REG_RISCV_TIMER_REG(state)
was erroneously added to the rejects set. KVM_REG_RISCV_TIMER_REG(state)
doesn't belong there. That register can be set, but it only supports
certain input, otherwise, it correctly, results in EINVAL. We'll need
the concept of a "skip set" to avoid tripping over that one.

So, I think arm's function should be

 bool check_reject_set(int errno)
 {
     return errno == EPERM;
 }

and riscv's should be

 bool check_reject_set(int errno)
 {
     return errno == EOPNOTSUPP;
 }

> +
>  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
>  
>  #define CORE_REGS_XX_NR_WORDS	2
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index f6ad7991a812..b956ee410996 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -98,6 +98,11 @@ void __weak print_reg(const char *prefix, __u64 id)
>  	printf("\t0x%llx,\n", id);
>  }
>  
> +bool __weak reject_set_fail(__u64 reg)
> +{
> +	return false;
> +}
> +
>  #ifdef __aarch64__
>  static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
>  {
> @@ -216,7 +221,7 @@ static void run_test(struct vcpu_reg_list *c)
>  			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
>  				reject_reg = true;
>  				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> -				if (ret != -1 || errno != EPERM) {
> +				if (ret != -1 || reject_set_fail(reg.id)) {
>  					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
>  					print_reg(config_name(c), reg.id);
>  					putchar('\n');
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
