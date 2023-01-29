Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB90DC61D97
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSYcymG9QcMbs1w/yJ9gvwSccVuyklffjXQvddNE/gY=; b=tXB+MwSIPVeygR
	1yu/kR8JtT6QZwZZCkQCmZVjR395dCRFR68g1fO2E4bBJ22f2vQodHlIjI6t29+SAYHY9eUqAlWYB
	Tv1b6VhGfnE5YWst+5Hkcn2O7+U5PYlPjkh+e0JvVaQnetrVfEQHBKUN+RDWHmU6eeZ6fJ9+E+jvG
	D1e5nyZO7E1j9qn7Hg+YcrBdfb2WoTA0jOP6blgGwC1yYQD2I+UIw6JfnoOrshotu+c9wfCzSlzfn
	sB1OI4RK2j2CNDIqqjrvPqmVaeaCu5JW1s7WNcTsh2VnMMZd9Gn1XmAX4Hh6Z16clafN5ENJavvv5
	KD8bW6fbn7y72gvT7CJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM72x-001SJ2-VJ; Sun, 29 Jan 2023 12:44:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM72u-001SEf-6i
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 12:44:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id kt14so24876519ejc.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 04:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hzvl/LqOmRuw2DLDajc9nmwbZP+g/NBX1KDunvAJzQY=;
        b=fY2QFwBTKBZO8Qst6ZUPyMu24A/jtW4pov+KH93ZP6/BznpvqQcwmDLlU9AlvfKvHc
         kx1xqrQiAdRu1gI52+5qnmtBBw15VMdkOECUlNhT3f8RgCEjtRC2sD9hx92S0IRA7UZb
         dbuzIexlxY2xnBHPJSFzDxTOPcc6Woi6Hq1hant2sI9rU3oXS9qKpMHoAiAc/E8Rsm50
         jF9blpDcxyN56OCp0mwJpQw9r5/Yp6W4WSPMHNQ/X+0RAf+3DoSPj0DDL4EpygJtbeHj
         IH1nClRvnDmSkrauRgGR/vJ2W9/BRexsnmqgHAhLchQrqyGIyHcdyqbbXNqK9kcehZ/R
         UZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzvl/LqOmRuw2DLDajc9nmwbZP+g/NBX1KDunvAJzQY=;
        b=kgCkiEJAnSFUF+y3Ox8gaQz8Vp+rNBM5tN6mC44UHgWJ6K3wmICSv0xOMmLoyC5BKu
         MmSl56mojYMsp1mTtqJPDbSsz7RgGuXOh9BmbBFwOgHWWWBQsmuLqZyn9sJ1kRApCKSx
         tX3FKRSjYxfmX6OjIsdEXfIjsFpFSgZJiZEWyaBb1oLwNUmGJJzGBr/ykTxULqIsoP9p
         ftdioXPH/tgWXDjvoIk2wasojVe06cwlxocsZqmhSS1tR24Y416NdwtExsIWg1Xb3bgz
         Lh2G4i//lvd1y7ucK/1h5LKvyzE9t9VXio9bAIO77U/n2D3uVAw0xqsgYuzdErPllG3n
         oS0A==
X-Gm-Message-State: AO0yUKUKUVvOMrH5NHE26mLKb8Eoybuya6nbsQkAOJPosdxmR0OAhpAI
	74GXnhS+ckBTd6lxTSRtNjYy6uA5HwVpfN661qxHTA==
X-Google-Smtp-Source: AK7set+98zHjTjUCfz1Po+4TvGNEYBc/NoX6CxQ6nYhmE2sLz3ErpGLxfO2NEtvlVStSPaC/HwnxsOot12jRU9W6Y68=
X-Received: by 2002:a17:906:e116:b0:881:4488:297c with SMTP id
 gj22-20020a170906e11600b008814488297cmr1198000ejb.129.1674996269674; Sun, 29
 Jan 2023 04:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-12-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-12-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 29 Jan 2023 18:14:18 +0530
Message-ID: <CAAhSdy1+6AprOdzRRTG98p6swisNFO6MUKjXobxW3RWbixvjCg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_044432_281381_7632CB3F 
X-CRM114-Status: GOOD (  22.67  )
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
> As the KVM guests only see the virtual PMU counters, all hpmcounter
> access should trap and KVM emulates the read access on behalf of guests.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
>  arch/riscv/kvm/vcpu_insn.c            |  4 ++-
>  arch/riscv/kvm/vcpu_pmu.c             | 45 ++++++++++++++++++++++++++-
>  3 files changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 3f43a43..022d45d 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -43,6 +43,19 @@ struct kvm_pmu {
>  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
>  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
>
> +#if defined(CONFIG_32BIT)
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> +#else
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> +#endif
> +
> +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +                               unsigned long *val, unsigned long new_val,
> +                               unsigned long wr_mask);
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
>  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_ext_data *edata);
> @@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>  #else
>  struct kvm_pmu {
>  };
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = 0,      .count = 0, .func = NULL },
> +

Redundant newline here.

>
>  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  {
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index 0bb5276..f689337 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -213,7 +213,9 @@ struct csr_func {
>                     unsigned long wr_mask);
>  };
>
> -static const struct csr_func csr_funcs[] = { };
> +static const struct csr_func csr_funcs[] = {
> +       KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> +};
>
>  /**
>   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 7713927..894053a 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -17,6 +17,44 @@
>
>  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
>
> +static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +                       unsigned long *out_val)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       struct kvm_pmc *pmc;
> +       u64 enabled, running;
> +
> +       pmc = &kvpmu->pmc[cidx];
> +       if (!pmc->perf_event)
> +               return -EINVAL;
> +
> +       pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> +       *out_val = pmc->counter_val;
> +
> +       return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +                               unsigned long *val, unsigned long new_val,
> +                               unsigned long wr_mask)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> +
> +       if (!kvpmu || !kvpmu->init_done)
> +               return KVM_INSN_EXIT_TO_USER_SPACE;

As discussed previously, this should be KVM_INSN_ILLEGAL_TRAP.

> +
> +       if (wr_mask)
> +               return KVM_INSN_ILLEGAL_TRAP;
> +
> +       cidx = csr_num - CSR_CYCLE;
> +
> +       if (pmu_ctr_read(vcpu, cidx, val) < 0)
> +               return KVM_INSN_EXIT_TO_USER_SPACE;

Same as above.

> +
> +       return ret;
> +}
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
>  {
>         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> @@ -69,7 +107,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>                                 struct kvm_vcpu_sbi_ext_data *edata)
>  {
> -       /* TODO */
> +       int ret;
> +
> +       ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
> +       if (ret == -EINVAL)
> +               edata->err_val = SBI_ERR_INVALID_PARAM;
> +
>         return 0;
>  }
>
> --
> 2.25.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
