Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F06AC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HezlSYKTxHcz9tN/t0ZbOTVtsFUSJp9K9xzBgkV+x5o=; b=cSKpdqLk+DZdGD
	4+SbzlYHs/LOsgtBsnKfg71vCdFGJQ0+sMXRATrkN3Qx77RVxSzwLba6SQocgE4VImeityQzURyx0
	b/b1uEDmomVUZByD2kQiM7+HAOYEMBfKOgsQbihvLJROAP5uX1MZUhnxg/lvxzmneQqLIjGfHWGwN
	gxsgbQPZabg9dRqnqw9xdpdc8JphKR93JYxmT4G48eUWXdofOHx7AThDDLXU8N4YyHWTz2SwsVnAn
	yOpAeuZU1kcuSmcjQBIcgDjBZVLDaTA9CQNpog/vb+0//wI5i9iOgmAtEC6MLTeBvX8VRIyXy4Sr0
	GiMi1CbIgBQB1Y8eexcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWNV-0046DG-RG; Mon, 30 Jan 2023 15:47:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWNS-0046B7-Se
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 15:47:28 +0000
Received: by mail-ed1-x531.google.com with SMTP id v10so11349548edi.8
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=csZsawza7gneE4pW6d91sgEU4qbR6DvPDzGrAgBo+6I=;
        b=iI88UPTR6w2qNj3RfOhPVylxONGPDbb2kR+pAkqE7Je1+ofWWB4QRCEC4Z3cfT6y9Y
         n9kjA1wxJ4A4CuiO8h4/PlBtL00kRS4i01HcyTwBC0klDGdX8mUi7dkdyza5JwkKT7wL
         EExfHliGVGZtfeNwVfbsmlbfgCEDiAFjjEdLLSLqodlcrkoSHyW9qN6C9eFiFkABPmw6
         F0VgfvfrW0ZpHcXtYvpxsqvizhvbQB5WGMPkJV3Jj+qM7IOzC+VW96ErHBJw5KK1mvDh
         u8Y/BKC/JxNkrpln0XOxgbol7CI5QIzgK+v+AjZq/V1HaPKhIZB8n/JG07RyZuEWP75b
         S7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csZsawza7gneE4pW6d91sgEU4qbR6DvPDzGrAgBo+6I=;
        b=jV2lFXQBaduDUidsO1wRZovMAKKP9Atjqp9z73EtiM3aGBDkZZk+zxeOPOYcyvyiTy
         uO7+jL1bPIiH5dbNWY2GZfp5i1GxyvVvF0YKxCT1GPPt1y+UMZ0Ie/yWWmvpu8smsmHt
         TJphCWOaBBsrhaMcaFlDJ1uy/jIxIX4yiOhfwkSSNcCcjVnDI/Y3822k8GzOFwKanz6s
         9FampHMeVRcNlsst5gH8rsNUquZMFbq263QJWJNg+FMN9J6Ie/ff1D6CVj+CPzvbK/q5
         MBq35j1hPioftxuFVey0o0EQcBWipfeDETscsNOrhnX8/X4E3gi0YM2TmGSXTWIUvypp
         Qjsg==
X-Gm-Message-State: AFqh2kq5m7tc9JTgZE8i8mLnimf59vBkgJZSFoAxuoMhtCEi2DvFz/LB
	IIZhU94iuc+MAyG7v1g0Rwh0UsNUf8P3hD5vaBx7ng==
X-Google-Smtp-Source: AMrXdXv8T1az16olrWqvAgFDlzX8zrPrQYEtdty8SPcoZ+QCljbGBxkvUelOiCIYGwthLrzbL2udpciQxCDYrLTq7jQ=
X-Received: by 2002:a05:6402:4494:b0:49e:89e:c7b4 with SMTP id
 er20-20020a056402449400b0049e089ec7b4mr8713677edb.1.1675093644266; Mon, 30
 Jan 2023 07:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-14-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-14-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Jan 2023 21:17:11 +0530
Message-ID: <CAAhSdy18ORoM1+aDF86=TsgbdmHZS=9Rm-J0A0LnOwJvq=sJXg@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] RISC-V: KVM: Support firmware events
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_074726_976602_9647590F 
X-CRM114-Status: GOOD (  33.78  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> SBI PMU extension defines a set of firmware events which can provide
> useful information to guests about number of SBI calls. As hypervisor

s/about number/about the number/

> implements the SBI PMU extension, these firmware events corresponds

s/corresponds/correspond/

> to ecall invocations between VS->HS mode. All other firmware events
> will always report zero if monitored as KVM doesn't implement them.
>
> This patch adds all the infrastructure required to support firmware
> events.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  16 +++
>  arch/riscv/kvm/vcpu_pmu.c             | 144 +++++++++++++++++++-------
>  2 files changed, 124 insertions(+), 36 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 022d45d..b235e7e 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -17,6 +17,14 @@
>  #define RISCV_KVM_MAX_FW_CTRS 32
>  #define RISCV_MAX_COUNTERS      64
>
> +struct kvm_fw_event {
> +       /* Current value of the event */
> +       unsigned long value;
> +
> +       /* Event monitoring status */
> +       bool started;
> +};
> +
>  /* Per virtual pmu counter data */
>  struct kvm_pmc {
>         u8 idx;
> @@ -25,11 +33,14 @@ struct kvm_pmc {
>         union sbi_pmu_ctr_info cinfo;
>         /* Event monitoring status */
>         bool started;
> +       /* Monitoring event ID */
> +       unsigned long event_idx;
>  };
>
>  /* PMU data structure per vcpu */
>  struct kvm_pmu {
>         struct kvm_pmc pmc[RISCV_MAX_COUNTERS];
> +       struct kvm_fw_event fw_event[RISCV_KVM_MAX_FW_CTRS];
>         /* Number of the virtual firmware counters available */
>         int num_fw_ctrs;
>         /* Number of the virtual hardware counters available */
> @@ -52,6 +63,7 @@ struct kvm_pmu {
>  { .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
>  #endif
>
> +int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid);
>  int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>                                 unsigned long *val, unsigned long new_val,
>                                 unsigned long wr_mask);
> @@ -81,6 +93,10 @@ struct kvm_pmu {
>  #define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
>  { .base = 0,      .count = 0, .func = NULL },
>
> +static inline int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)
> +{
> +       return 0;
> +}
>
>  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  {
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 73dccf7..b8d6aba 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -203,12 +203,15 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>         struct kvm_pmc *pmc;
>         u64 enabled, running;
> +       int fevent_code;
>
>         pmc = &kvpmu->pmc[cidx];
> -       if (!pmc->perf_event)
> -               return -EINVAL;
>
> -       pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> +       if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +               fevent_code = get_event_code(pmc->event_idx);
> +               pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> +       } else if (pmc->perf_event)
> +               pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
>         *out_val = pmc->counter_val;
>
>         return 0;
> @@ -224,6 +227,55 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
>         return 0;
>  }
>
> +static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, int ctr_idx,
> +                                    struct perf_event_attr *attr, unsigned long flag,
> +                                    unsigned long eidx, unsigned long evtdata)
> +{
> +       struct perf_event *event;
> +
> +       kvm_pmu_release_perf_event(pmc);
> +       pmc->idx = ctr_idx;
> +
> +       attr->config = kvm_pmu_get_perf_event_config(eidx, evtdata);
> +       if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
> +               //TODO: Do we really want to clear the value in hardware counter
> +               pmc->counter_val = 0;
> +       }
> +
> +       /*
> +        * Set the default sample_period for now. The guest specified value
> +        * will be updated in the start call.
> +        */
> +       attr->sample_period = kvm_pmu_get_sample_period(pmc);
> +
> +       event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
> +       if (IS_ERR(event)) {
> +               pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
> +               return PTR_ERR(event);
> +       }
> +
> +       pmc->perf_event = event;
> +       if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> +               perf_event_enable(pmc->perf_event);
> +
> +       return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       struct kvm_fw_event *fevent;
> +
> +       if (!kvpmu || fid >= SBI_PMU_FW_MAX)
> +               return -EINVAL;
> +
> +       fevent = &kvpmu->fw_event[fid];
> +       if (fevent->started)
> +               fevent->value++;
> +
> +       return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>                                 unsigned long *val, unsigned long new_val,
>                                 unsigned long wr_mask)
> @@ -276,6 +328,7 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>         int i, pmc_index, sbiret = 0;
>         struct kvm_pmc *pmc;
> +       int fevent_code;
>
>         if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
>                 sbiret = SBI_ERR_INVALID_PARAM;
> @@ -290,7 +343,22 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>                 pmc = &kvpmu->pmc[pmc_index];
>                 if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
>                         pmc->counter_val = ival;
> -               if (pmc->perf_event) {
> +               if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +                       fevent_code = get_event_code(pmc->event_idx);
> +                       if (fevent_code >= SBI_PMU_FW_MAX) {
> +                               sbiret = SBI_ERR_INVALID_PARAM;
> +                               goto out;
> +                       }
> +
> +                       /* Check if the counter was already started for some reason */
> +                       if (kvpmu->fw_event[fevent_code].started) {
> +                               sbiret = SBI_ERR_ALREADY_STARTED;
> +                               continue;
> +                       }
> +
> +                       kvpmu->fw_event[fevent_code].started = true;
> +                       kvpmu->fw_event[fevent_code].value = pmc->counter_val;
> +               } else if (pmc->perf_event) {
>                         if (unlikely(pmc->started)) {
>                                 sbiret = SBI_ERR_ALREADY_STARTED;
>                                 continue;
> @@ -317,6 +385,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>         int i, pmc_index, sbiret = 0;
>         u64 enabled, running;
>         struct kvm_pmc *pmc;
> +       int fevent_code;
>
>         if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
>                 sbiret = SBI_ERR_INVALID_PARAM;
> @@ -329,7 +398,18 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>                 if (!test_bit(pmc_index, kvpmu->pmc_in_use))
>                         continue;
>                 pmc = &kvpmu->pmc[pmc_index];
> -               if (pmc->perf_event) {
> +               if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +                       fevent_code = get_event_code(pmc->event_idx);
> +                       if (fevent_code >= SBI_PMU_FW_MAX) {
> +                               sbiret = SBI_ERR_INVALID_PARAM;
> +                               goto out;
> +                       }
> +
> +                       if (!kvpmu->fw_event[fevent_code].started)
> +                               sbiret = SBI_ERR_ALREADY_STOPPED;
> +
> +                       kvpmu->fw_event[fevent_code].started = false;
> +               } else if (pmc->perf_event) {
>                         if (pmc->started) {
>                                 /* Stop counting the counter */
>                                 perf_event_disable(pmc->perf_event);
> @@ -342,11 +422,14 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>                                 pmc->counter_val += perf_event_read_value(pmc->perf_event,
>                                                                           &enabled, &running);
>                                 kvm_pmu_release_perf_event(pmc);
> -                               clear_bit(pmc_index, kvpmu->pmc_in_use);
>                         }
>                 } else {
>                         sbiret = SBI_ERR_INVALID_PARAM;
>                 }
> +               if (flag & SBI_PMU_STOP_FLAG_RESET) {
> +                       pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
> +                       clear_bit(pmc_index, kvpmu->pmc_in_use);
> +               }
>         }
>
>  out:
> @@ -361,12 +444,11 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>                                      struct kvm_vcpu_sbi_ext_data *edata)
>  {
>         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> -       struct perf_event *event;
> -       int ctr_idx;
> +       int ctr_idx, sbiret = 0, ret;
>         u32 etype = kvm_pmu_get_perf_event_type(eidx);
> -       u64 config;
> -       struct kvm_pmc *pmc;
> -       int sbiret = 0;
> +       struct kvm_pmc *pmc = NULL;
> +       bool is_fevent;
> +       unsigned long event_code;
>         struct perf_event_attr attr = {
>                 .type = etype,
>                 .size = sizeof(struct perf_event_attr),
> @@ -387,7 +469,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>                 goto out;
>         }
>
> -       if (kvm_pmu_is_fw_event(eidx)) {
> +       event_code = get_event_code(eidx);
> +       is_fevent = kvm_pmu_is_fw_event(eidx);
> +       if (is_fevent && event_code >= SBI_PMU_FW_MAX) {
>                 sbiret = SBI_ERR_NOT_SUPPORTED;
>                 goto out;
>         }
> @@ -412,33 +496,17 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>         }
>
>         pmc = &kvpmu->pmc[ctr_idx];
> -       kvm_pmu_release_perf_event(pmc);
> -       pmc->idx = ctr_idx;
> -
> -       config = kvm_pmu_get_perf_event_config(eidx, evtdata);
> -       attr.config = config;
> -       if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
> -               //TODO: Do we really want to clear the value in hardware counter
> -               pmc->counter_val = 0;
> -       }
> -
> -       /*
> -        * Set the default sample_period for now. The guest specified value
> -        * will be updated in the start call.
> -        */
> -       attr.sample_period = kvm_pmu_get_sample_period(pmc);
> -
> -       event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
> -       if (IS_ERR(event)) {
> -               pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
> -               return PTR_ERR(event);
> +       if (is_fevent) {
> +               if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> +                       kvpmu->fw_event[event_code].started = true;
> +       } else {
> +               ret = kvm_pmu_create_perf_event(pmc, ctr_idx, &attr, flag, eidx, evtdata);
> +               if (ret)
> +                       return ret;
>         }
>
>         set_bit(ctr_idx, kvpmu->pmc_in_use);
> -       pmc->perf_event = event;
> -       if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> -               perf_event_enable(pmc->perf_event);
> -
> +       pmc->event_idx = eidx;
>         edata->out_val = ctr_idx;
>  out:
>         edata->err_val = sbiret;
> @@ -489,6 +557,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>
>         kvpmu->num_hw_ctrs = num_hw_ctrs;
>         kvpmu->num_fw_ctrs = num_fw_ctrs;
> +       memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
>
>         /*
>          * There is no correlation between the logical hardware counter and virtual counters.
> @@ -502,6 +571,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>                         continue;
>                 pmc = &kvpmu->pmc[i];
>                 pmc->idx = i;
> +               pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
>                 if (i < kvpmu->num_hw_ctrs) {
>                         kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
>                         if (i < 3)
> @@ -540,8 +610,10 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
>                 pmc = &kvpmu->pmc[i];
>                 pmc->counter_val = 0;
>                 kvm_pmu_release_perf_event(pmc);
> +               pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
>         }
>         bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
> +       memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
>  }
>
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
