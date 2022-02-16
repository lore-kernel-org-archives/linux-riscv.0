Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A80FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrqTnJfI9FX8Wbd60snBJAZbldd6o3jgbmT+YhO8U7g=; b=TkqY2NmrTgTGfG
	5ZQr9g6LddNGDReOBGMLLMV95k5xwNGjy3k8hqDQxFxC11CM3x0yyx4sYfvv5kr6GNVr01M0DtfvJ
	gAXNj4xejznkuqljzhX4A96niPmrP2SEpINQHf4cjMn5vnFsvdahgJdWa9FhiTT2Px9/KIZyjHqXf
	UttufmcJI8JdfDJg83uSPU5TTePZ9kEQywSsfl26hH5afjZBpDyWhnvnzM8Vs05S+J/6MD6mqw8+w
	EjDBJEs9vEWAfQRpiLU1HvkTxCT1NeUDFp23DiSMw7h/JgBP+sidjohE0olfMYn9dO+CQNYG69WH7
	0PGMQzerYOSmqU0Jjkbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKFC0-005xYL-LW; Wed, 16 Feb 2022 07:57:40 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKFBf-005xPV-Pj
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 07:57:23 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id l125so3614559ybl.4
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 23:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMtBLX0dxO/FEXDrSK4WwXrfvEvOmP/i+ozpjhDxh2o=;
 b=EGr7uINoD4BR8i3qX/tomHNRruYcjc/QbsipOZJBMwQk2ZyhvOQqpMphIFGGGWNWd3
 JuGaeHSzEymH3RXHvUYHLSTERTs3AOZYPXnaVJ7N/QHn/Lzy8Soxfsdbwy63HmyHvoGF
 ibPohfBIFhqTBcVfC4PMPdPyf0zXr8PsqaP7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMtBLX0dxO/FEXDrSK4WwXrfvEvOmP/i+ozpjhDxh2o=;
 b=j3ddu1zTh5kVLaxuc6vjWvPIeJUNcaLSroV84ntYcGqhRMdhpV8uRObdUaDN9VEKOc
 3vyF9tPfDoRgQOSfPZ9o/mbqYO/IBjN4PE2YsTNqZWkBAFXBuJAEzfrJBT7ushH39zVE
 t/4ixBr4aMwBm8tZwUJB7xFDmWLk6VW8ONL8O3uFiA87qHsdE/1MQmLeWKJrs5EQK418
 WiD+mDU4smtrAiZF0C41WNtl/jiO+v21rbGSTsZo99P63ipqmN0juNjCUmf/RDAEtybp
 ggq25AF99U/xM1PkQik5Vw0CErUWxI0TXdtBE6UZDFtwbETgQ4pgZ2UnSbqsu9n1Ae6h
 h86A==
X-Gm-Message-State: AOAM532Ku+Gsj7g5sPa00PvMEEsoNzwvZ/Mn9TBoXdGA9CwJNW40AT16
 BRzjVfzZkCyZALn+BxOqO+HE5fLipdqGKhw6KolG
X-Google-Smtp-Source: ABdhPJxexRI1WA8BLHddNiaTLw6WNqMOfbfVIS1bSiAe/Miw7A1PF3HzHsObN1ZBqCdCL+fBicqD5iLDeOuq1uHkDM4=
X-Received: by 2002:a5b:ec5:0:b0:615:4edf:4641 with SMTP id
 a5-20020a5b0ec5000000b006154edf4641mr1079024ybs.494.1644998236462; Tue, 15
 Feb 2022 23:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-5-apatel@ventanamicro.com>
In-Reply-To: <20220210054947.170134-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Feb 2022 23:57:05 -0800
Message-ID: <CAOnJCU+VpiMtkoKBTLn9kzNxdLaFmedhNX=K36O+42nTkfZ0-A@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] RISC-V: Add SBI HSM suspend related defines
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 Anup Patel <anup@brainfault.org>, devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_235719_892333_5F8C1369 
X-CRM114-Status: GOOD (  17.16  )
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

On Wed, Feb 9, 2022 at 9:50 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We add defines related to SBI HSM suspend call and also
> update HSM states naming as-per latest SBI specification.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
