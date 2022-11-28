Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD900C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWu/WZYNJ0t4Ged0uJO837zSbmWCyKIFio3eJ4w77yY=; b=EqicVgTt439SxK
	TxfowA6rSF6Nh3YI725IjYWkdeNiavMAbb9LjCrTGsGuIoGOhZCmossVF37Aumsdl8GdgDtCWpfgc
	BbLFg3PZqWT1X+lTtJTgDZc7FwA5IGvvUmSUtwA0Ui+gW0FHnb/k+FJQy9US74fm0Ws0vY6Cqe+XQ
	bDHGEuulyB60voAnKaRH19Jc/H5BbgduUGj2m1yyfgjesJILP0umIRFi3yX91BgLmS/dIERF0lp36
	ld5p105qU6zvRJCZHMtySWAg5nqV5lNBDZ3EXAaXkRCNrCkoY6m+pMr4ihe4t6Bwq8R6DkpVhrWmR
	J/1jr8VS4zV7SeIlLfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlMW-004SIl-KV; Mon, 28 Nov 2022 21:08:24 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlMU-004SHN-At
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:08:23 +0000
Received: by mail-oi1-x22a.google.com with SMTP id v81so13031214oie.5
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSBfsqCjFUVdLz7ulQ1i3UEkSNxvV0b23GvomxS/sUQ=;
        b=rLHtAPO4mqSfikiodD24FI+oWCKcxXu13WH/iIuPpfO7+LFnq8JEVROmBSArLXBjws
         zBn1FscaWxifjhKOK14Kwvb32xvFgPq6s5W1YKc2w/vfNgSn4+UjcpkmslJcwW73zLjs
         sLUFZiFB859WxDekzTIwggyRPPIXycnk03XO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSBfsqCjFUVdLz7ulQ1i3UEkSNxvV0b23GvomxS/sUQ=;
        b=daSNMkB73KXG9s3FKmRx2boBCsOz9Ax49mLpPYHfEf6FrSYnrIkDAV+XOUx2Kwr33A
         FzyEfsKkcUScxC+xwnnwSH0ttYfYw7L0erD65ATB7cPiiXcYd2UQr8MXJi3QAGN0OX/r
         IuCUwTHDhe9HB1cKaqthSa87J0R7qVowJ38yjeGQKkvd07o9oiEv1ZKGb1l7doKdgbRs
         NO3H6+wzc9k0SiRWUp62EqC0yAtovlG+Sr0KqWUnb4yly7IsZi7GKYIXy5iRq3/Z3dJR
         i0lciSFuy3Bd0qmHztHQZbccqw/BNqr32ExPEj+3TgABxTp+dp1IpsmBX9+2D5imPnU8
         VMMw==
X-Gm-Message-State: ANoB5pk7oNp513oiAt2l20ym0RHLfzKg2xHV9v0rFWCBboPC8FGBPrem
	OD35zCnCnREeQEjV73n3+CRut00CQqieJ/q7Q5uJ
X-Google-Smtp-Source: AA0mqf747TRpJM0z0cNNdw0eBXubIWGs0+ixNACK9zM7uCm1pKpeqai+fmM/x3tLSK/eylcYsOBLju2tPTxVJKt7pMA=
X-Received: by 2002:a05:6808:a90:b0:35b:aa33:425a with SMTP id
 q16-20020a0568080a9000b0035baa33425amr4729498oij.181.1669669699655; Mon, 28
 Nov 2022 13:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-8-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-8-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:08:08 -0800
Message-ID: <CAOnJCUK3Dffumx0cY7tJbncuinnkLwpGfH7oNXebXM5SeCciQQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] RISC-V: KVM: Save mvendorid, marchid, and mimpid when
 creating VCPU
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130822_390000_7F23EC32 
X-CRM114-Status: GOOD (  18.29  )
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

On Mon, Nov 28, 2022 at 8:15 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should save VCPU mvendorid, marchid, and mimpid at the time
> of creating VCPU so that we don't have to do host SBI call every
> time Guest/VM ask for these details.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/vcpu.c             |  6 ++++++
>  arch/riscv/kvm/vcpu_sbi_base.c    | 11 +++++------
>  3 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 91c74b09a970..93f43a3e7886 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -165,6 +165,11 @@ struct kvm_vcpu_arch {
>         /* ISA feature bits (similar to MISA) */
>         DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
>
> +       /* Vendor, Arch, and Implementation details */
> +       unsigned long mvendorid;
> +       unsigned long marchid;
> +       unsigned long mimpid;
> +
>         /* SSCRATCH, STVEC, and SCOUNTEREN of Host */
>         unsigned long host_sscratch;
>         unsigned long host_stvec;
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 68c86f632d37..312a8a926867 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -21,6 +21,7 @@
>  #include <asm/csr.h>
>  #include <asm/cacheflush.h>
>  #include <asm/hwcap.h>
> +#include <asm/sbi.h>
>
>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
>         KVM_GENERIC_VCPU_STATS(),
> @@ -171,6 +172,11 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>                         set_bit(host_isa, vcpu->arch.isa);
>         }
>
> +       /* Setup vendor, arch, and implementation details */
> +       vcpu->arch.mvendorid = sbi_get_mvendorid();
> +       vcpu->arch.marchid = sbi_get_marchid();
> +       vcpu->arch.mimpid = sbi_get_mimpid();
> +
>         /* Setup VCPU hfence queue */
>         spin_lock_init(&vcpu->arch.hfence_lock);
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 0c806f61c629..5d65c634d301 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -19,7 +19,6 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  {
>         int ret = 0;
>         struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> -       struct sbiret ecall_ret;
>
>         switch (cp->a6) {
>         case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -48,13 +47,13 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         *out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
>                 break;
>         case SBI_EXT_BASE_GET_MVENDORID:
> +               *out_val = vcpu->arch.mvendorid;
> +               break;
>         case SBI_EXT_BASE_GET_MARCHID:
> +               *out_val = vcpu->arch.marchid;
> +               break;
>         case SBI_EXT_BASE_GET_MIMPID:
> -               ecall_ret = sbi_ecall(SBI_EXT_BASE, cp->a6, 0, 0, 0, 0, 0, 0);
> -               if (!ecall_ret.error)
> -                       *out_val = ecall_ret.value;
> -               /*TODO: We are unnecessarily converting the error twice */
> -               ret = sbi_err_map_linux_errno(ecall_ret.error);
> +               *out_val = vcpu->arch.mimpid;
>                 break;
>         default:
>                 ret = -EOPNOTSUPP;
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
