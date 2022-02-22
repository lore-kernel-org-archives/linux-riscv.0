Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 23:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YmpO3tXCOoODlbVX//EP/3yK0FAFLscTXEnTZpyzmw=; b=N8XLSp0DLQ1GdX
	mjd9qBypC67GhkO9loGb0+PYs8umji+m8eXXCRdS6kD9gF3GeS5VTgbfEte/8xpnpTzqe5+Gmac+9
	V18u3C/GAbzjbCYg689dX5KtWqgzTZdi3/iFbu8simpkgE734naRO2PtnpgRUc6w16fODoEyIp51j
	xsjavBY84RvbdjTZoqmRoF+rKqq02JV65JTP6JYrzjlXiCbJDrr9P1hiY+8L3rWHpuTffHy794Zm6
	gt53E+9NRmRK4PmTcWBkCzlZejIl7tPH9AzJzkDckD8BJhQkVBOHgef7D8tr2aUfXaSrAnJy91HL0
	1UVarMunKWh9c+J/7ruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMf1Q-00By6a-9h; Tue, 22 Feb 2022 23:56:44 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMf1N-00By58-KS
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 23:56:43 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id bt13so44586592ybb.2
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 15:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mllQGFC3WEKp6XzrSESCPgbl5djA3qBbKDbZz6ohprU=;
 b=b3f8otBFJYUqBdQ5FOW9Khjl/pgCWSsFZtcnO6RW/TELNG0zf6paeKnMOXYsHc4JcO
 WWFVwCwn9FIt8lJsazJR1HEzCfWexKUT00gLWv4j9Sw9je3WTvIBSGJFDgXd4DiyWo4U
 F6afkvMCMwoXlSe2lriyUrildW9AQJwwJcVVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mllQGFC3WEKp6XzrSESCPgbl5djA3qBbKDbZz6ohprU=;
 b=3YOsZaKW42APfvxAasfh0SRL6PKX3yisqsaAgYI+5krg1B/NXoOwv+Kw7jKaFRyf55
 6jOnu1Jwfj/iybMJYKj9nFG4o45Hx3I7Tg/cL13RySVgdxktllymp8HhRlW+IuCoVOIy
 mTAKRDjzdMrmuYld5fPh9+k9zlto5lhMEbfs4yTo38FVHSORGCmjatLEJfQkxCjfYsna
 2c1qBJ/G9IHA5kquXENMD4cwCXHWinZT1E880/hEoLyMprqFC/Oy5vFqiN897iwCzIDN
 oYwJ8KIL7HixeyDCKM4jeuuJJwbt/1wzMH6fekLnJL7SGUk0igoAOLZDsZaF6QPv/+jy
 23wA==
X-Gm-Message-State: AOAM530VsROufoUHpbvjRHNz0a2kzWRsknB/LQLN0NfOGtVQTkMWwuSW
 DR2pbkHnk9cBXoC3YIKTRzNuVwjsR0tRs24Cnuov
X-Google-Smtp-Source: ABdhPJxsoD0Z8T2CTk4jVbbagwhfA7izzMw0d3AiTk0jpyHcRUq6W3KAAWums7n1VjTy5jsG0KgnVmM55gDHETLRu00=
X-Received: by 2002:a25:d294:0:b0:61d:9809:9917 with SMTP id
 j142-20020a25d294000000b0061d98099917mr25651792ybg.289.1645574200901; Tue, 22
 Feb 2022 15:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-4-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 15:56:30 -0800
Message-ID: <CAOnJCUKPw-kiYZWAECPU5z9QS600s1AUREon=WuB+gPG+rprvw@mail.gmail.com>
Subject: Re: [PATCH 3/6] RISC-V: KVM: Implement SBI v0.3 SRST extension
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_155641_699719_B344C023 
X-CRM114-Status: GOOD (  16.52  )
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
> The SBI v0.3 specification defines SRST (System Reset) extension which
> provides a standard poweroff and reboot interface. This patch implements
> SRST extension for the KVM Guest.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi.c         |  2 ++
>  arch/riscv/kvm/vcpu_sbi_replace.c | 44 +++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 11ae4f621f0d..a09ecb97b890 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -45,6 +45,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> @@ -55,6 +56,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_time,
>         &vcpu_sbi_ext_ipi,
>         &vcpu_sbi_ext_rfence,
> +       &vcpu_sbi_ext_srst,
>         &vcpu_sbi_ext_hsm,
>         &vcpu_sbi_ext_experimental,
>         &vcpu_sbi_ext_vendor,
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 1bc0608a5bfd..0f217365c287 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -130,3 +130,47 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
>         .extid_end = SBI_EXT_RFENCE,
>         .handler = kvm_sbi_ext_rfence_handler,
>  };
> +
> +static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
> +                                   struct kvm_run *run,
> +                                   unsigned long *out_val,
> +                                   struct kvm_cpu_trap *utrap, bool *exit)
> +{
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       unsigned long funcid = cp->a6;
> +       u32 reason = cp->a1;
> +       u32 type = cp->a0;
> +       int ret = 0;
> +
> +       switch (funcid) {
> +       case SBI_EXT_SRST_RESET:
> +               switch (type) {
> +               case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +                       kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
> +                                               KVM_SYSTEM_EVENT_SHUTDOWN,
> +                                               reason);
> +                       *exit = true;
> +                       break;
> +               case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +               case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +                       kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
> +                                               KVM_SYSTEM_EVENT_RESET,
> +                                               reason);
> +                       *exit = true;
> +                       break;
> +               default:
> +                       ret = -EOPNOTSUPP;
> +               }
> +               break;
> +       default:
> +               ret = -EOPNOTSUPP;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
> +       .extid_start = SBI_EXT_SRST,
> +       .extid_end = SBI_EXT_SRST,
> +       .handler = kvm_sbi_ext_srst_handler,
> +};
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
