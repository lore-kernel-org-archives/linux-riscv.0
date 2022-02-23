Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E690C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6+ydlBk4dPjF7nqguVvL2Mtq/t9FVEbNWrsJrbEi3I=; b=x5DqggjgFVgM5T
	fsd1W1wghTsgrtZWsAnfpgmeA852OXh4Se/aN12V1jy+UyM59V1OS2g1aJavIm1jZe4uUQFgz3Msu
	hi1tpP9yuvU32sj0ovCRpwmbOLMRm20+4Bz20k2tvZkqbTmLg1K8tzgr0KcUxElt4f5cqiIaf8b/Q
	tStkxHY2PDpagnf6stlpCBDFFN4cuRkE5WnopDihRtDCF/bhkfai1kQHXL49g71krLW40PO8W4wIE
	izttBb2dkinC98A0fi670UsLtwZCHoUiewggRzF+pQ9Q60fd1QGlxyqISAUMatHOt0y+eUyE9jMDP
	fgoQeP6d8GvGtMOVSeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMlfb-00D3xw-9g; Wed, 23 Feb 2022 07:02:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMlfO-00D3tk-Ql
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 07:02:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d3so22355235wrf.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 23:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRZEca9XxWtSPuMYjIlFseYg4Esas5bKwsfEt1eCOA8=;
 b=QIZAImlqRhQHCLYGSrjuJDOCauDvhW1Xw72lbZyNLZmlfJUmufZxFSBB8H2EoKBfKN
 jxoSwFnND2lhvOlCrC0AidfwIohJ6YEjrVIrXGyyGzc+TWJgHAZww2WFDkbsbRxXjul8
 qVPvMzBNI6gfzqTmYteg2xN1VqQ7fqk+Pc1po1AtwoR1q6n08ExvZHauK5YFE7VYcj0Z
 P7U3rFT/AD4Nlw2WtttkORxq2jersjOa1mPgV6CpwJlXuQyh4yx6S86RN13NT2apUzMc
 VKjIZnG57JmHU6woyskYANNc8Yk+LiEB0wEfmqBnv/2JpZcQP5nQaLkRkyXGn6EddG07
 h/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRZEca9XxWtSPuMYjIlFseYg4Esas5bKwsfEt1eCOA8=;
 b=ealtEdkDMNi/DwvPLo0n6vuXGb04lofjaVYathMhm7XL0EElvDSf2TJZsUeYDQKiat
 FVUc9Y1e6f9rPc5yLtkEFOrsWeXE1Lr+jhbQiek4Vztzl0tCL/WivZVFR1ubwigdlsZ2
 2Q7xohQ6qWIYaxqeoBoD1AdiGH4UKwLk3q72bz3dMv0hkn4CBnn7OC+8cqt4aI+FzKjD
 d88+U0KE3cvn3ZQpG2V5OVM8MabL2U2AedllNhQW29c1+FXs+V1VWoL0Ix5pHjierwvu
 VT5V7sCWVZ2MdBDA8IGOX3j/HXq6Q8bUEliIcSZ7xxN4Wx8f+QIJaDMtsoEseQsxKUiR
 rcnQ==
X-Gm-Message-State: AOAM532SuacfjyxBhIQ+SrlqQjfJOWxxXFVXAfR/mcQBiKNwnv8MRLtg
 tfHThMf8pgMDthYdU/oGgMiIXONNdGYYCLfSL9GSlA==
X-Google-Smtp-Source: ABdhPJzIrMTIABtJTtVWuTHPjm8BpgI0RV6d0ZUOVxs96DHbAWugAxYt8PRNLPnq+EeeWflAFVTZPUTf3jvN2iH+k6Y=
X-Received: by 2002:adf:ec47:0:b0:1e4:a380:bb73 with SMTP id
 w7-20020adfec47000000b001e4a380bb73mr22204190wrn.86.1645599744652; Tue, 22
 Feb 2022 23:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-5-apatel@ventanamicro.com>
In-Reply-To: <20220210054947.170134-5-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Feb 2022 12:32:11 +0530
Message-ID: <CAAhSdy3jK26WFhG8Q=Up8hhHPpJCCkA09EKOi+B-Kp0U9Rwg7w@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] RISC-V: Add SBI HSM suspend related defines
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <apatel@ventanamicro.com>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Liush <liush@allwinnertech.com>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_230226_876884_EF66EACA 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Palmer

On Thu, Feb 10, 2022 at 11:20 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We add defines related to SBI HSM suspend call and also
> update HSM states naming as-per latest SBI specification.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

This patch is shared with "KVM RISC-V SBI v0.3 support".
(https://lore.kernel.org/all/20220201082227.361967-2-apatel@ventanamicro.com/T/)

How do you want to handle this ?

One option is that I take this patch through the KVM RISC-V tree
and you can send this series (minus this patch) for 5.18 after the
KVM RISC-V changes have been merged.

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h    | 27 ++++++++++++++++++++++-----
>  arch/riscv/kernel/cpu_ops_sbi.c |  2 +-
>  arch/riscv/kvm/vcpu_sbi_hsm.c   |  4 ++--
>  3 files changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index d1c37479d828..06133b4f8e20 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -71,15 +71,32 @@ enum sbi_ext_hsm_fid {
>         SBI_EXT_HSM_HART_START = 0,
>         SBI_EXT_HSM_HART_STOP,
>         SBI_EXT_HSM_HART_STATUS,
> +       SBI_EXT_HSM_HART_SUSPEND,
>  };
>
> -enum sbi_hsm_hart_status {
> -       SBI_HSM_HART_STATUS_STARTED = 0,
> -       SBI_HSM_HART_STATUS_STOPPED,
> -       SBI_HSM_HART_STATUS_START_PENDING,
> -       SBI_HSM_HART_STATUS_STOP_PENDING,
> +enum sbi_hsm_hart_state {
> +       SBI_HSM_STATE_STARTED = 0,
> +       SBI_HSM_STATE_STOPPED,
> +       SBI_HSM_STATE_START_PENDING,
> +       SBI_HSM_STATE_STOP_PENDING,
> +       SBI_HSM_STATE_SUSPENDED,
> +       SBI_HSM_STATE_SUSPEND_PENDING,
> +       SBI_HSM_STATE_RESUME_PENDING,
>  };
>
> +#define SBI_HSM_SUSP_BASE_MASK                 0x7fffffff
> +#define SBI_HSM_SUSP_NON_RET_BIT               0x80000000
> +#define SBI_HSM_SUSP_PLAT_BASE                 0x10000000
> +
> +#define SBI_HSM_SUSPEND_RET_DEFAULT            0x00000000
> +#define SBI_HSM_SUSPEND_RET_PLATFORM           SBI_HSM_SUSP_PLAT_BASE
> +#define SBI_HSM_SUSPEND_RET_LAST               SBI_HSM_SUSP_BASE_MASK
> +#define SBI_HSM_SUSPEND_NON_RET_DEFAULT                SBI_HSM_SUSP_NON_RET_BIT
> +#define SBI_HSM_SUSPEND_NON_RET_PLATFORM       (SBI_HSM_SUSP_NON_RET_BIT | \
> +                                                SBI_HSM_SUSP_PLAT_BASE)
> +#define SBI_HSM_SUSPEND_NON_RET_LAST           (SBI_HSM_SUSP_NON_RET_BIT | \
> +                                                SBI_HSM_SUSP_BASE_MASK)
> +
>  enum sbi_ext_srst_fid {
>         SBI_EXT_SRST_RESET = 0,
>  };
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index dae29cbfe550..2e16f6732cdf 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -111,7 +111,7 @@ static int sbi_cpu_is_stopped(unsigned int cpuid)
>
>         rc = sbi_hsm_hart_get_status(hartid);
>
> -       if (rc == SBI_HSM_HART_STATUS_STOPPED)
> +       if (rc == SBI_HSM_STATE_STOPPED)
>                 return 0;
>         return rc;
>  }
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 2e383687fa48..1ac4b2e8e4ec 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -60,9 +60,9 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
>         if (!target_vcpu)
>                 return -EINVAL;
>         if (!target_vcpu->arch.power_off)
> -               return SBI_HSM_HART_STATUS_STARTED;
> +               return SBI_HSM_STATE_STARTED;
>         else
> -               return SBI_HSM_HART_STATUS_STOPPED;
> +               return SBI_HSM_STATE_STOPPED;
>  }
>
>  static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
