Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1B5C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT9SwPlSWXVrC4SaZjxz+SE48X6lHBPTWZPS9f22xzw=; b=IRvQNBI0cog8Uz
	IRdcD4KQfDq06CDJrH27bl0X+MeCaOPYYQgvg5aHrFofilnWV77zxqZipMAJZhibRmlQtcQCTgVyh
	XDqtxGLx9t16+XCZJ8x3yvTJWko/xYwZwhR2FWiJm3ryRn+GZSlWLXXGz3wfoFqbQwVKmZMHCSkp+
	tvbRusxZE2l/UuoT3cdR/H+Di0tKue/Nl160IowBYOpGqURGJ2LqYCh0kINgE0RxLn9L0IvlHhy9M
	pFgCnJfLpSH0BRuNO3QDmBaqEMVEkM6HdWWZE2TT6/PEBq5vONB3wQ/4o5ejdUaoP6hn3Luf9xuxp
	thTK/zuVLs/bu1Sb9VZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMuI-00E7Jo-Pf; Fri, 27 Jan 2023 11:28:34 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMu1-00E7E5-5Z
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:28:19 +0000
Received: by mail-ua1-x934.google.com with SMTP id e18so989729uax.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0iqWjsVCEit1hkNQ24VDbeVqqAX3ji5FAHQReFeDUCI=;
        b=Mij0FCcT60SxZgdLEwtlO49gGbSeVHesEUDh5wBFj/SKl2skI1+LzgHrqSskJZFOb+
         jEWEHlOFEYzTYFYBIy7lQGMi4RNQukHJdmlCegCjAmppq09KWOBGho+pVKdm0QGRgMh2
         dqafK7IrZOybzvSHnOP/oJxzuuOoKzktZfB4jRCswS8/gvIt++92Nf1beLaWtrxypKcO
         n+zZdgNjqYV/4OpuHBqgquczB+6EmHVQfyz61yzKA5O6/hE6a0sXbi778Lr2YBYUHCVy
         gK8dnYFYIUnsQNXz8h9ZMyNSPTgw17PFQYL+sMLmUGvb0ZbVeTdq2zVSf5vPa7N2zic8
         16Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iqWjsVCEit1hkNQ24VDbeVqqAX3ji5FAHQReFeDUCI=;
        b=nndpAX9Ax0Hv5k5hsWEOROTkUNTZ8viZy954D9LPHkZBLPI9BGnh56RbSCnUyseuIv
         XkVR7l38BrWIZzYHXUybj3otl2+zUE6uB0EaCqlQMfRnZKj1bP1djZrLBWNa0u1uzwmr
         XBAGtq+nm9a/ql9ewm6UPjxzZf//mSkbCQ+xrCDJ0FTC5ewOfEV9kS+MtbmczGJ+gDwH
         1Z4H8O9DSnXSrP9MBlp/NLiiro/tAFQd4B0whNRQc3Z2j/mp/i/tfHLi5BTfypab4/xG
         HBT3LvGLjqoPVJj11N1TmYr0HjYg3zXza1cbpZAwkU03p35nvour1ZhAog6RXZGSGEnN
         hW1g==
X-Gm-Message-State: AFqh2krm7nypxXfkLxhKI1GgeY03jxidtFsUXGGz5Kjf35OS0iZLxuBt
	Q+AUXQ5bEa+4k4yr6oHp/qQwuARFU3VAXp4S+OYvMA==
X-Google-Smtp-Source: AMrXdXs6r56u1t0igSLJBwGfhqedhNKS/Sm3DizC4NSBgBJyMjWkRloqcL0VPVz0jBBHQzzF8jfPUvJGA0xNsKExtqU=
X-Received: by 2002:ab0:6150:0:b0:5c3:740c:2786 with SMTP id
 w16-20020ab06150000000b005c3740c2786mr4675776uan.32.1674818895037; Fri, 27
 Jan 2023 03:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-19-andy.chiu@sifive.com>
In-Reply-To: <20230125142056.18356-19-andy.chiu@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 27 Jan 2023 16:58:02 +0530
Message-ID: <CAK9=C2UWJ1qDfyfsKiznfFTVDHbjJm89m_6ymM=jpvYs7-qNcQ@mail.gmail.com>
Subject: Re: [PATCH -next v13 18/19] riscv: kvm: redirect illegal instruction
 traps to guests
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_032817_235610_006B883C 
X-CRM114-Status: GOOD (  26.76  )
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

On Wed, Jan 25, 2023 at 7:53 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Running below m-mode, an illegal instruction trap where m-mode could not
> handle would be redirected back to s-mode. However, kvm running in hs-mode
> terminates the vs-mode software when it receive such exception code.
> Instead, it should redirect the trap back to vs-mode, and let vs-mode trap
> handler decide the next step.
>
> Besides, hs-mode should run transparently to vs-mode. So terminating
> guest OS breaks assumption for the kernel running in vs-mode.
>
> We use first-use trap to enable Vector for user space processes. This
> means that the user process running in u- or vu- mode will take an
> illegal instruction trap for the first time using V. Then the s- or vs-
> mode kernel would allocate V for the process. Thus, we must redirect the
> trap back to vs-mode in order to get the first-use trap working for guest
> OSes here.

In general, it is a good strategy to always redirect illegal instruction
traps to VS-mode.

>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index c9f741ab26f5..2a02cb750892 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -162,6 +162,16 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>         vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
>  }
>
> +static int vcpu_trap_redirect_vs(struct kvm_vcpu *vcpu,
> +                                struct kvm_cpu_trap *trap)
> +{
> +       /* set up trap handler and trap info when it gets back to vs */
> +       kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> +       /* return to s-mode by setting vcpu's SPP */
> +       vcpu->arch.guest_context.sstatus |= SR_SPP;

Setting sstatus.SPP needs to be done in kvm_riscv_vcpu_trap_redirect()
because for guest all traps are always taken by VS-mode.

> +       return 1;
> +}
> +
>  /*
>   * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
>   * proper exit to userspace.
> @@ -179,6 +189,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         ret = -EFAULT;
>         run->exit_reason = KVM_EXIT_UNKNOWN;
>         switch (trap->scause) {
> +       case EXC_INST_ILLEGAL:
> +               if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> +                       ret = vcpu_trap_redirect_vs(vcpu, trap);
> +               break;
>         case EXC_VIRTUAL_INST_FAULT:
>                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>                         ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> @@ -206,6 +220,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         vcpu->arch.guest_context.hstatus);
>                 kvm_err("SCAUSE=0x%lx STVAL=0x%lx HTVAL=0x%lx HTINST=0x%lx\n",
>                         trap->scause, trap->stval, trap->htval, trap->htinst);
> +               asm volatile ("ebreak\n\t");

This is not a related change.

>         }
>
>         return ret;
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Overall, this patch can be accepted independent of this series due
to its usefulness.

I send a v2 of this patch separately.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
