Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5D4C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eW9JhCZbXZZ/zQE1Yhiap1Zmk56IC2WUaCbXIqPeU7E=; b=CORD2KTRljUQvg
	noQecWPczxsSp9r7r1nf9onvcKlRpanXudbQQNtGkEGMIfiU05ljplc6k0KdxPttVQtxGTniM64TX
	EPgyAQQvvm1TqKmqPRkYpF6gGqbWI/QEpGDdEY8DiG9LYbjZmIHR+PBDiZCNgdSwbdVaZvbE9F9zA
	cCjMamPalSlyqZA0n7XoCJx6c/YVFP3KdckJG/7ZP9V70dH8ffL/NT5kbUVsZHrxpuIronxN2jg3c
	gALkwFTBhHrIvrZhcOFI2erhpNOXzBvPyZZSkP0VfecdRE2+a/HL3UQ9f6UYFaTRWNniahL+Jt6R6
	CBIEoHaKdEWVyJ4SNHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2E25-00H7Oy-2Q;
	Thu, 25 May 2023 16:41:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2E22-00H7Mw-1x
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 16:41:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso6356335e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685032899; x=1687624899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tCR9GGMFNorDSK4vdX+Y26zqtl9VCvHN3JUMiQf7Kew=;
        b=o0+muES5ARWipQlSHLAB/7akRAZep94c2231xrpi4KXF9lrhcshS97WUidLAwDlV0z
         RynFU2r3rhKJw/R/nmU6WNfQKB4sdhG5wGjyacVparRSMjT7utlC++3SKNxIWbmEnrqb
         iCHXwHQ5JCmxDfuVyoomnxx5fXlCmn1FrU94WX//iqa63oTjwym++VI7aXvtVcJPJAnk
         NxFrHDfHj4z65JE9h93cXQOWf1cNMP7ZqPFB+34FkNCQsI0ojVWYt5Mptr5g22z9HLCz
         +k1c5zZRwyDfMpndDIIqYhg4r4xDlr4ri4WYXwWXwOy9+6CcBzDuWlNxUyQWJI0UThtJ
         0Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685032899; x=1687624899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCR9GGMFNorDSK4vdX+Y26zqtl9VCvHN3JUMiQf7Kew=;
        b=hLPnsOY4oib70tAA5UMeTdorIn5kWKwGfWG5b3dzI9+1U1xQn/eJb0663ug/mRR5vO
         qppQTy7e37cPb80REjs06NQclmqK7CsGOtHKpZkkAj8jF6kPcJvssBj0yXXefAwqME2Z
         jKg3G9vnq3K3khr91Q5mkfdL10YW18bY5oxBVVhVDkjcNf7fQ83O9j2MfOGqafpG+1hI
         H15sgOGFL6xqqnqi7KyeCJAVnnJ+PKy0Bbs/zOQLW5PfUklVJN9TdUpC3xnbY2QoE9+q
         ATG2Rs7KpuTUVrZoKaP4c+mEW3vq65tAocDmvfbL3/aWJ7VD82GbmkD7zclSFHvw1q+L
         c//Q==
X-Gm-Message-State: AC+VfDyR1SY11zQ/D8NDfGbyNmrUKfmaF0CClPkDrJjBv7DsF8IlsTwW
	WErbDJY1rxdHt7591BWdi9oAuQ==
X-Google-Smtp-Source: ACHHUZ53ktqlluQQR/F53uKrM+aSDG4pKo6I8rAgr8k2wvNBb6mDiqz/ahIuAkvn+sNwUSvJ1bkr1w==
X-Received: by 2002:a05:600c:d0:b0:3f6:119:ee11 with SMTP id u16-20020a05600c00d000b003f60119ee11mr3346603wmm.32.1685032899461;
        Thu, 25 May 2023 09:41:39 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d58d0000000b002ffbf2213d4sm2338037wrf.75.2023.05.25.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 09:41:39 -0700 (PDT)
Date: Thu, 25 May 2023 18:41:38 +0200
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
Subject: Re: [PATCH v2 10/11] KVM: riscv: selftests: Skip some registers set
 operation
Message-ID: <20230525-50097c796339f56320da7643@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com>
 <a10cd1ff57e07e408d08eca7e6a4557217ca0af3.1684999824.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a10cd1ff57e07e408d08eca7e6a4557217ca0af3.1684999824.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_094142_642449_653F6090 
X-CRM114-Status: GOOD (  20.16  )
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

On Thu, May 25, 2023 at 03:38:34PM +0800, Haibo Xu wrote:
> Set operation on some riscv registers(mostly pesudo ones) was not
> supported and should be skipped in the get-reg-list test. Just
> reuse the rejects_set utilities to handle it in riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index f1fc113e9719..ebd6b580b33b 100644
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
>  				}
>  				break;
>  			}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
