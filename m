Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA208C636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5yWTkqCJOfemyAomWFIH9HjyV2ZGsuBn7Onr9AxZuw=; b=iU3EPulwv33cmC
	RMLPlh5frQkxLced1hYi20HL4zVliHVHgtkr44OK2V6L3AbrnuWzPF7c+dm4++OsBsFpGkVqAKUTD
	IMJ+2wfLwS0JLapJkBlcTtSDPDwBQkSCUaUXdcAbsxBQLLMj16HL8tEROlKDeYZffZsKFOLr/e5nU
	sdT4lu5EfMVfDDty5r0+xdJIYkmFAaAvwunJm8GjMxZOxT8IjU4eoOWJ9kft5f36XRm6tCyFgGMjO
	rqnJpydmF7ID0G6iLGHJhDBcBvfuJz5gMeQh5zgEEdgkLyeG2WXlW9zZYx2JI8n9jdtL/Sjrld5xc
	2gX4092JP/mH6zwE2aYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLSA-00Bmgg-T8; Tue, 07 Feb 2023 10:43:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLS7-00Bmdr-QL
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 10:43:57 +0000
Received: by mail-ed1-x533.google.com with SMTP id eq11so14859088edb.6
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aysR5vD4/WnLwTb4+d5w/oRG3WV5hUhyo3zqkAwzu/U=;
        b=Lbh2pe2SjToYlM3eMWJzUh53QzYoufwjh4CPTc/bjLCazyH+ncXK+eer8vWsFvqy4E
         dS63E6+w9nNEBD+WLw3dAxs9pMNUbXbhfU7rPZLSsujniXj/GGkBcauI2iWuItF6gycI
         54wrnIJleIOeetLJkVAHWaAKW/+guFzRZzDq2SlUFBbH4ykFuv7WM9mx2m9HJx6Qui6v
         HnStCnysWCThx8A3pEBFvhUB1VNQ377RlR00ZfTtuZhw7G6lOd3HSsAGRTwq8JUyjVTj
         DO/HPV/rDEHORpSWE1RpZa1oz8aagS1ahu+617UvHXppuCC3Qq1XOCicpafrgYKMYOVD
         Fcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aysR5vD4/WnLwTb4+d5w/oRG3WV5hUhyo3zqkAwzu/U=;
        b=xqsyEcbraUsgkmTrV/W/vPbBibfsFa19O09BSMH+EaAV9I0B6TfIbKqbxqeb4QD4bf
         /8bZmKs/Yrj6lTxEup0wnFdZkN2e5B87F1eFOyrAtg265pOWxTo+hBOTFsbAXQtVSR/N
         xAYe23brYFlIQcxO3+dqAbTD3EpazckfCvllqS+nsuvLpL1r5C7VuVN8pCEGiWDHjwQP
         EL0Y1BJ7myIkZraM5P5H7/mzOEMNAp7koOQ1ryn9K9wcdWhCovSN85gmx5FU5PbCXE+x
         hFuTKBZvrBLglVgMPv9cbHNVlesIAeqxGEzakQ/SwuXv1a1hkvPyAJIeIMhYowykSBXS
         5tPw==
X-Gm-Message-State: AO0yUKVdNennOiPAqShVva/2fpM0VKHTZZ3LTPKgOFPw8iDIs7NUsbhM
	+FeqgOhT7t1Xqaa8tzNR4M4jtQ==
X-Google-Smtp-Source: AK7set/IowiI/By7ir9R0s0h5oXXHYPZkzjtB8Jz1q4EjqzQQMbwWh0Q2t9/YwfqtXE+WnydpjC5ug==
X-Received: by 2002:a50:bac4:0:b0:497:948b:e8 with SMTP id x62-20020a50bac4000000b00497948b00e8mr3104398ede.6.1675766632126;
        Tue, 07 Feb 2023 02:43:52 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o11-20020a056402444b00b00495f4535a33sm6262099edb.74.2023.02.07.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:43:51 -0800 (PST)
Date: Tue, 7 Feb 2023 11:43:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v6 2/8] RISC-V: KVM: Add SBI PMU extension support
Message-ID: <20230207104350.ekjklgxehrc7qtil@orel>
References: <20230207095529.1787260-1-atishp@rivosinc.com>
 <20230207095529.1787260-3-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207095529.1787260-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_024355_876742_1763BD54 
X-CRM114-Status: GOOD (  27.02  )
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

On Tue, Feb 07, 2023 at 01:55:23AM -0800, Atish Patra wrote:
> SBI PMU extension allows KVM guests to configure/start/stop/query about
> the PMU counters in virtualized enviornment as well.
> 
> In order to allow that, KVM implements the entire SBI PMU extension.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/Makefile       |  2 +-
>  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c | 86 +++++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> 
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 5de1053..278e97c 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
>  kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_sbi_hsm.o
>  kvm-y += vcpu_timer.o
> -kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
> +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index fe2897e..15fde15 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>  };
>  #endif
>  
> +#ifdef CONFIG_RISCV_PMU_SBI
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> +#else
> +static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> +	.extid_start = -1UL,
> +	.extid_end = -1UL,
> +	.handler = NULL,
> +};
> +#endif
> +
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>  	&vcpu_sbi_ext_v01,
>  	&vcpu_sbi_ext_base,
> @@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>  	&vcpu_sbi_ext_rfence,
>  	&vcpu_sbi_ext_srst,
>  	&vcpu_sbi_ext_hsm,
> +	&vcpu_sbi_ext_pmu,
>  	&vcpu_sbi_ext_experimental,
>  	&vcpu_sbi_ext_vendor,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> new file mode 100644
> index 0000000..38efadb
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Rivos Inc
> + *
> + * Authors:
> + *     Atish Patra <atishp@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +				   struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret = 0;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	unsigned long funcid = cp->a6;
> +	u64 temp;
> +
> +	if (!kvpmu->init_done) {
> +		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> +		return 0;
> +	}
> +
> +	switch (funcid) {
> +	case SBI_EXT_PMU_NUM_COUNTERS:
> +		ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_GET_INFO:
> +		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> +#if defined(CONFIG_32BIT)
> +		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> +#else
> +		temp = cp->a4;
> +#endif
> +		/*
> +		 * This can fail if perf core framework fails to create an event.
> +		 * Forward the error to userspace which is an error happened

"Forward the error to userspace because it's an error which happened..."

(Can probably be fixed up on merge.)

> +		 * within the host kernel. The other option would be to convert
> +		 * to an SBI error and forward to the guest.
> +		 */
> +		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> +						       cp->a2, cp->a3, temp, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_START:
> +#if defined(CONFIG_32BIT)
> +		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> +#else
> +		temp = cp->a3;
> +#endif
> +		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
> +						   temp, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_STOP:
> +		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_FW_READ:
> +		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> +		break;
> +	default:
> +		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> +	}
> +
> +	return ret;
> +}
> +
> +static unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +
> +	return kvpmu->init_done;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> +	.extid_start = SBI_EXT_PMU,
> +	.extid_end = SBI_EXT_PMU,
> +	.handler = kvm_sbi_ext_pmu_handler,
> +	.probe = kvm_sbi_ext_pmu_probe,
> +};
> -- 
> 2.25.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
