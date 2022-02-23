Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A961C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 00:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7RC6KdRmQ8omLyGLovFVi6OGpyEAGk8y7AjoyG4x0g=; b=hQkK84+RUuUQNQ
	7RDG3jf3HSm9sT9J1ZEp82yOJPbnK0qwCxeE/6KEMDpg+gN/2N2v1yNIWrMX7NtZFGh/gNew0Ufyy
	j/jv7RdGp48nAWkgvc5EYe2HEzkmIabkLiHCSpuiV3I1F2nvoepVCT++CaAuZbNMgnpwBUBa9iUnA
	aY2xHc8Co4MxCN3/ZFgT1BjLxc2safWwHqXYrKsHtE/SybYBqJgWOUYD/zt/clpTdH8ooPejvhopz
	ZxsQaADnFGfCjtVkT/WdtIrg8K8S0erRodrjgENXvU4i8p0iw20jTMYh0K1CGEmFwhzoITzVgS6s5
	dMIDR5Cr5ofp18eSIW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMf5F-00Bz4J-Tg; Wed, 23 Feb 2022 00:00:41 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMf5C-00Bz0E-UT
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 00:00:40 +0000
Received: by mail-yb1-xb35.google.com with SMTP id g6so23221376ybe.12
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 16:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSiA3S1xm7pTjQu/oWXgbDLtQEnGSkP+ktjeX6MfsjM=;
 b=Bu6a3ODl5Dt10lmJ5M8HJj4XhWyMZUaPvnc5LHBO10SuKJ0H6a1+Gft6VaKaQipiGt
 OIEB7d4uZNNxcC61l1LBWuQ1YYW6u6j5j7NORForrUCLX4n9gYHjjv4rse1jN401KuaQ
 OElEcQ7cvC+9l9AaJQVhISosQFpNVruxJxwJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSiA3S1xm7pTjQu/oWXgbDLtQEnGSkP+ktjeX6MfsjM=;
 b=ZmawDtzPpBwvp3iudt/PfH9gnLuJsqM8aEiEvqGzUECPLnJ8uFZHH8QJD2xodPOEws
 6NYQR8MUucLxUygtZJGbCoi/P6SE2qVA0yA0I5f9WdfWKU9t2oeYR+A96S+eNigxYlTD
 BbcxGHCLVuyAO/edpDs4/9BbGIZsRqDOWc71pCsPwwsDeLty/8/NZQyi1X7z1L3KlNvq
 NnKZffocRr9erZ2HE/eqEKPlK8sm9c5w+ku4UcI7EVDPjoz/qPjoTBmDUx55HtRHIXmi
 1S5dXqptwSAxByJx2TKIoBrEmfM6KiShQgM0QJ3bJR7ErbLKK/naWv8hJrOu+UUGCh1K
 FBXw==
X-Gm-Message-State: AOAM5311xm54G3MNFVF4Qm3/XhDCYIeOrZly15pkPtAw5wJA3ZuzdS/G
 JllWcWXfwbSVQMNr/inw4KzR9tIbq/A4lqC1kqQi
X-Google-Smtp-Source: ABdhPJw/3qzihNlONhEyWS53iUqO28cZ5mxXYNwCukNQR9UtK83rnxFwjJmDBuKON6Y+0IknNK19j5XplikMTJtDQ18=
X-Received: by 2002:a25:b205:0:b0:624:6faf:d090 with SMTP id
 i5-20020a25b205000000b006246fafd090mr15268936ybj.14.1645574437937; Tue, 22
 Feb 2022 16:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-5-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 16:00:27 -0800
Message-ID: <CAOnJCU+Xfd5Y-ZLrY1JVoYFOtgw7eSahO=QwZVT57VV_UVjQVg@mail.gmail.com>
Subject: Re: [PATCH 4/6] RISC-V: Add SBI HSM suspend related defines
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_160039_020659_D4D19406 
X-CRM114-Status: GOOD (  16.28  )
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

On Tue, Feb 1, 2022 at 12:23 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add defines related to SBI HSM suspend call and also update HSM states
> naming as-per the latest SBI specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
