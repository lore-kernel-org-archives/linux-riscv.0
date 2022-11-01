Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BB9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMuJWMUvXznTiXh+9dpfv8rudbcHMVVhnQKtAUf+3+0=; b=n8RTFwgy4mhmnR
	vGGGshYwZqORBjcpWRg+nBBDJCCPA0FQBjp+AaeRwFKGX5UJRK7AHbYw0OEFArKm5/Xsq1kc8TKWp
	q0bI+6U//JlDXmz3Xpkzw7qmzTcTk8sbuQPxvhtUqMUJlYGe1tselHB3oCCgFcvWkvDmfNnCmSBbj
	+hkTv34O9K0OnuQxFVVGYksQk+h2lDAWm2LfvAsCDcs5AAb77aAW7kqwJ5hJp42c32CTm25tQ8+6m
	zb1CqE4blBx4r0BIoc8Ncjcr4QGgQ8nfpgw/7ffq/PoM+J7Um7mqjjtaJ85vKy1Y1vogcBLsLdHZB
	5BScrjxmnY4ODTDTKZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsDt-005U4H-M6; Tue, 01 Nov 2022 14:26:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsDq-005U33-L2
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 14:26:36 +0000
Received: by mail-ej1-x632.google.com with SMTP id b2so37469773eja.6
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVIuibKW7Di+NHpw7iDbFjaRzUNbZHTAtJupVrKnN1I=;
        b=U4fWyAMhWOG3hCLCogEuTz5Hv9u9XUphFx5Vg3AFjaJhjIOkTLj50uF4LDfLtaRWNV
         dSKACqGdqSeCgbMkJ8qZo4G9p8MREV9xRGNvxRh824kyLcQ7tvDs0O5m7C6dfqxA7NW+
         cF2TzSFiTu4LJR4c3wrtB4SIr1YgjDhPS5JfWIm2L9Xqhqnhh1qcCCWPC3h21GExAVJB
         0e/I7GQioRkyW+J7cvewoz2ETTxr4fMvngnAbbS/B92SgCQDjfdqNQelxpM1FlejPe1d
         1NbkiAHccCZoRxsRBFLQSe8+wgkhcwXWicBfO8cg++wmVsBcQM1ZayDZCseaevANwze1
         j5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVIuibKW7Di+NHpw7iDbFjaRzUNbZHTAtJupVrKnN1I=;
        b=2NN1xKH6YidIL7j2VSde7auZvxExw0q6JNobnKyshKx3Z+GYWOPQmgCKZeIdPf0Yau
         G8Sy5jSKzlqwBggqtyP58D/EXnsNc6ds5HxzbRgagOmDNgGUo6VrpVmx3eZXIsmmWhxP
         vJt8hlXVUm0AVUXesoJ1ae3GizPq1MqugRvtLz8gzX/QVZOOn+EV9eMAJyh4HppaYNkZ
         i+Oky3ZDTOXX0h2vknqIZmd988vZMQ7RFQ9/1FpDd3uKsa1M02C3OJmyeCDqb+v4Sx7s
         zAJyhui7C5iQgYyH8hD/DxK49ClfF5rpxISXwsqcZgyF5MvM8qBEPpXbxhPrpq2tOdZl
         yX9g==
X-Gm-Message-State: ACrzQf2Q5F1S/9KoMh0fgBHH/UqOcTPQ2Zs1kowC/wcQFZbeeuNOlUtL
	41HVR6NnJ7Te2wmosGTE0llhAg==
X-Google-Smtp-Source: AMsMyM4lOOJRlCZ+7BLMeDTWBlE5tKftEVsKjQPh7j2g2sPc7AfFGdOsPLoeTfoJpR1uuJZ243VD1w==
X-Received: by 2002:a17:906:ee89:b0:73d:70c5:1a4e with SMTP id wt9-20020a170906ee8900b0073d70c51a4emr17976079ejb.683.1667312792806;
        Tue, 01 Nov 2022 07:26:32 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id oq13-20020a170906cc8d00b0073022b796a7sm4286691ejb.93.2022.11.01.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 07:26:32 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:26:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  6/9] RISC-V: KVM: Add SBI PMU extension support
Message-ID: <20221101142631.du54p4kyhlgf54cr@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-7-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-7-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_072634_715131_00272628 
X-CRM114-Status: GOOD (  26.99  )
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

On Mon, Jul 18, 2022 at 10:02:02AM -0700, Atish Patra wrote:
> SBI PMU extension allows KVM guests to configure/start/stop/query about
> the PMU counters in virtualized enviornment as well.
> 
> In order to allow that, KVM implements the entire SBI PMU extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c | 81 +++++++++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d45e7da3f0d3..da9f7959340e 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -50,6 +50,16 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
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
> @@ -58,6 +68,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>  	&vcpu_sbi_ext_rfence,
>  	&vcpu_sbi_ext_srst,
>  	&vcpu_sbi_ext_hsm,
> +	&vcpu_sbi_ext_pmu,
>  	&vcpu_sbi_ext_experimental,
>  	&vcpu_sbi_ext_vendor,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> new file mode 100644
> index 000000000000..90c51a95d4f4
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Rivos Inc
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
> +				   unsigned long *out_val,
> +				   struct kvm_cpu_trap *utrap,
> +				   bool *exit)
> +{
> +	int ret = -EOPNOTSUPP;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	unsigned long funcid = cp->a6;
> +	uint64_t temp;

I think we need something like

   if (!vcpu_to_pmu(vcpu)->enabled)
      return -EOPNOTSUPP;

here. Where 'enabled' is only true when we successfully initialize
the pmu. And, successful initialization depends on 
IS_ENABLED(CONFIG_RISCV_PMU_SBI) and
riscv_isa_extension_available(NULL, SSCOFPMF) as well as not
failing other things. And, KVM userspace should be able to
disable the pmu, which keep enabled from being set as well.

> +
> +	switch (funcid) {
> +	case SBI_EXT_PMU_NUM_COUNTERS:
> +		ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, out_val);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_GET_INFO:
> +		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, out_val);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> +#if defined(CONFIG_32BIT)
> +		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> +#else
> +		temp = cp->a4;
> +#endif
> +		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, temp);
> +		if (ret >= 0) {
> +			*out_val = ret;
> +			ret = 0;
> +		}
> +		break;
> +	case SBI_EXT_PMU_COUNTER_START:
> +#if defined(CONFIG_32BIT)
> +		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> +#else
> +		temp = cp->a3;
> +#endif
> +		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2, temp);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_STOP:
> +		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_FW_READ:
> +		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, out_val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +unsigned long kvm_sbi_ext_pmu_probe(unsigned long extid)
> +{
> +	/*
> +	 * PMU Extension is only available to guests if privilege mode filtering
> +	 * is available. Otherwise, guest will always count events while the
> +	 * execution is in hypervisor mode.
> +	 */
> +	return riscv_isa_extension_available(NULL, SSCOFPMF);
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
