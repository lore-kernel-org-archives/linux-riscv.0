Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F28C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXbmaUpJsRYVxL5VnZzcgbKbNli3D31f6uWGHTPCPsY=; b=aXEqk1XZ2i4mJR
	U/g2pu3vEjlh4aeZAV2Yo+kgYK4OSjj1MRgocvLP/iihz9byloGh6bvrQRU0Hqyl04pPwGj20SqEi
	Pjp4yf6fHM6Rtbc5+T/z4bblf4Ia6f3LJoUsASILldfH1rqHnOXCkuz+XxhvCAW8L5HHoW2Wv6RxQ
	zzVy6IbwccxsfZ8RgrUzPS0Mlj6xIpIaB32Gk22yh92vOUFyKd3r7gtEssJwPDKC0KirEpO5wnE7P
	0Az0+kpy22fYorxJ+/W+SKFkFV4k2yzF4wxcbsIfVswe6fSEkZ9eg8H6k0+XRO6gLbZk0U8xLEtsH
	NIlB5s1pbQMjTMpHZ3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7YMQ-00COvL-2B;
	Fri, 09 Jun 2023 09:24:46 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7YMM-00COtw-2E
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 09:24:44 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so2718659a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686302680; x=1688894680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZarEebR8QFxdGd6BDii6BW9L7KO3qDDoKK/MEwvn90=;
        b=Rs9/5cIfXIF0X9dJtfJjl+S6T33jQp4Px3GDSrcvuwkppHWZXUsL8ehgtlEdVWgQhp
         wZ7iBamYWGVLJ2Km1VI+A0c5Pj7Vi69maem4T1UfWqzM1ICaSwbq2qvkARzSMmxsidJ4
         Z5s05RkJYCldhPOJj5incQPIqdVf8FiB/bV5WhSttaKgHDMK9XkzcR2l0+oh0PPWQR6l
         uxEnpUlJ/GuQWDgQMmKCIbr+mIkQxQIkjpUfyCHTc3RKgv8Hd2GG7MxnWsWVzPJErurs
         8/ZrLm00PA/JasYULG9e43reLoImOlkCmqVWgNktIvQsgTUqewnuDM6i+qfRNSbyMjR2
         JIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302680; x=1688894680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZarEebR8QFxdGd6BDii6BW9L7KO3qDDoKK/MEwvn90=;
        b=BqhIqAmrzoyv5qiXuwoAhtpvrm8+kl0C8VY8L6r2g06juTvitdKaHmqXhDwm6FVC5h
         hDVIVO+pbubnJLHoEt7UVbc308CvDgN7DXgho3lcTSGaQsC9gO8yyVtzbMEKJBOsIwEz
         Y1M7Y/FRiMsiS2CcKI+uHE1IWiX3CVrg6a4G8z9kqmS9kjMmBN792Dcwdn2Jdz/1G5Nd
         3CTAR8mffn0yjikwL30og21PqmC0Ykp5GCJUej0RZCTjmQgcyVEPESNYrckU3RcDGX6V
         4H4yKfi9U22G5ksFlR4Ka9EHdgPgc+tbxb7YPrBuiNifbqaPPjc8sW7FsH2ijG3cP6zI
         EWpA==
X-Gm-Message-State: AC+VfDyWTZ3jxiiLnQmx+1GLQlvD9u3mu73ng9lQZeghs476/Zix/qBG
	41EOjpDTP4AEURE9cOnJpRjh7w==
X-Google-Smtp-Source: ACHHUZ57wveqIUZeYQtbwSYnijhoIMs/IsyQJREmzHYMiZkR8YpHPOCyKtzTyeI/sdX9LNwraQyNBg==
X-Received: by 2002:a50:fb94:0:b0:4fa:3b3:c867 with SMTP id e20-20020a50fb94000000b004fa03b3c867mr858539edq.17.1686302679914;
        Fri, 09 Jun 2023 02:24:39 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n27-20020a056402515b00b00502689a06b2sm1537895edd.91.2023.06.09.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 02:24:39 -0700 (PDT)
Date: Fri, 9 Jun 2023 11:24:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 09/10] KVM: riscv: selftests: Skip some registers set
 operation
Message-ID: <20230609-05521f954b0485c69612f00b@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com>
 <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_022442_734369_257CB93D 
X-CRM114-Status: GOOD (  19.92  )
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

On Fri, Jun 09, 2023 at 10:12:17AM +0800, Haibo Xu wrote:
> Set operation on some riscv registers(mostly pesudo ones) was not
> supported and should be skipped in the get-reg-list test. Just
> reuse the rejects_set utilities to handle it in riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index c4bd5a5259da..abacb95c21c6 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -211,16 +211,22 @@ static void run_test(struct vcpu_reg_list *c)
>  			++failed_get;
>  		}
>  
> -		/* rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE */
> +		/*
> +		 * rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE on aarch64,
> +		 * or registers that should skip set operation on riscv.
> +		 */
>  		for_each_sublist(c, s) {
>  			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
>  				reject_reg = true;
> -				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> -				if (ret != -1 || errno != EPERM) {
> -					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
> -					print_reg(config_name(c), reg.id);
> -					putchar('\n');
> -					++failed_reject;
> +				if ((reg.id & KVM_REG_ARCH_MASK) == KVM_REG_ARM64) {
> +					ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +					if (ret != -1 || errno != EPERM) {
> +						printf("%s: Failed to reject (ret=%d, errno=%d) ",
> +								config_name(c), ret, errno);
> +						print_reg(config_name(c), reg.id);
> +						putchar('\n');
> +						++failed_reject;
> +					}

Thinking about this some more, shouldn't we attempt the set ioctl for
riscv reject registers as well, but look for different error numbers?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
