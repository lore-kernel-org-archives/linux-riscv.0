Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C307FC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp11xWEI1NOb9+15v2Salkt7eluTlDFijDG/hQby0EA=; b=3b0Pi5Zi7k0zLK
	pAF7SClu+iIy+HwNkX3hf8OyRveeioKGxSZETNvBNvkBHxMcFXwl2U3vuGuokwqVa6P+lQZJtDKMH
	viQc8oB9rcqoaxKTQaXppGjKdcm0sdhBccyEeuImLodpdlOmA8PUPpVcqUo5qQlJA366EVwVapWEy
	xsAjMBDXti70GF9XHY3z10lDcwGVd5NBCRfLaU6ne7NlmvvXfykqi06RDgiOLl/E/+y40hiDMoRMs
	PG7tJOWSOjIDuFu/uPwYg7kmsnm7HEyLLCjpKU3Zdy1M9FgAJyxnhh9xtdCfadmhVitcaZ3APumpU
	dNyLwDS8J0KsHLPlDwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPNx-002dbz-DQ; Mon, 30 Jan 2023 08:19:29 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPNJ-002dTP-J5
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 08:18:51 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-50aa54cc7c0so121786807b3.8
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UUp/6YID92JFAcveT6p4E2dADeEO7Fk2qJDYnyhDUuM=;
        b=LCl/0LT+oiQFk2TDeIP0mhJLimuvr2KYhCX+kKriLEOd231afvJevzELvXaP6E152L
         7k5xWJjg51U/ggIHE8YzxrXzuCkljXtK66I8nSG30nX3Toml+cq/8M8vtA7EoI57rQAj
         GHZiSQOlEuLpXmrwY4e8UcaEcU8oajg8QsVBTcRj6aZbGLIePJximGxKu3WT/Cbi6woV
         2kDdLGZRJyK4nQOoxyWPv/r1L8l2ukp/c56raw3vbuecSYbQKhiHrbX5v8QNTM+g/pjr
         LjOjWM8vtrhZNMtu8wIE4jr/93U/wrb4rSqy0CYHvjxk2+7vAn1tIsw1vNx6ZOjBv9nY
         OY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUp/6YID92JFAcveT6p4E2dADeEO7Fk2qJDYnyhDUuM=;
        b=a/QNDnmItKVTnui7hXioAy3NcpQ7eBb7UE1G5ZQZXnikwqJ2VXOvt+glF+jvPyEvio
         0FkPMvSvDjKnKfJgF3ezVU0PqjD7p0l2kHg0YXyO0liFE76+kOBETZSYzmjvUBgzB9xh
         1EORSxTtcg6KwVjuF1qr5wnmXnIctT99TPDavj89weP7/r8RQLufsc+SAlf6w4IeHK+h
         HSYGP22oqFn7hC+eU8sATsF68ZYG0rLhMOzgRzrrXwa2x5WqcGZdslJLp9++reAmde3U
         yEJiFliUkyLK9qp/4qICL9ewFv+edNZOxw/rMT6Qj41pyAH8XJanM7q6JstBGnH2sjdI
         vgMA==
X-Gm-Message-State: AFqh2kowg0KR31L6TWxDH3unETUcPmoCHUkH1gp9iStOa6KVJHpLp+yp
	1aVm7Ei1U2z3epWbc/HG8c7kJOD3y771ux7IeEKjgw==
X-Google-Smtp-Source: AMrXdXuiEugqB5vsz67q2rlzfCL6FLkh6p+M/+KuuutF0CGZJOSsBFbARe7b0EMunhesbUho6cQRttFrf2ydGcl2NsU=
X-Received: by 2002:a81:7307:0:b0:464:4ea1:3baa with SMTP id
 o7-20020a817307000000b004644ea13baamr5078631ywc.302.1675066718489; Mon, 30
 Jan 2023 00:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-19-andy.chiu@sifive.com>
 <CAK9=C2UWJ1qDfyfsKiznfFTVDHbjJm89m_6ymM=jpvYs7-qNcQ@mail.gmail.com>
In-Reply-To: <CAK9=C2UWJ1qDfyfsKiznfFTVDHbjJm89m_6ymM=jpvYs7-qNcQ@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 16:18:27 +0800
Message-ID: <CABgGipUPwnu1p14sc6GT+Agh-zx=cbwHanTsTRweR1ErtsX0kA@mail.gmail.com>
Subject: Re: [PATCH -next v13 18/19] riscv: kvm: redirect illegal instruction
 traps to guests
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_001849_652063_540ACA3E 
X-CRM114-Status: GOOD (  34.54  )
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

On Fri, Jan 27, 2023 at 7:28 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Wed, Jan 25, 2023 at 7:53 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > Running below m-mode, an illegal instruction trap where m-mode could not
> > handle would be redirected back to s-mode. However, kvm running in hs-mode
> > terminates the vs-mode software when it receive such exception code.
> > Instead, it should redirect the trap back to vs-mode, and let vs-mode trap
> > handler decide the next step.
> >
> > Besides, hs-mode should run transparently to vs-mode. So terminating
> > guest OS breaks assumption for the kernel running in vs-mode.
> >
> > We use first-use trap to enable Vector for user space processes. This
> > means that the user process running in u- or vu- mode will take an
> > illegal instruction trap for the first time using V. Then the s- or vs-
> > mode kernel would allocate V for the process. Thus, we must redirect the
> > trap back to vs-mode in order to get the first-use trap working for guest
> > OSes here.
>
> In general, it is a good strategy to always redirect illegal instruction
> traps to VS-mode.
>
> >
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  arch/riscv/kvm/vcpu_exit.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> > index c9f741ab26f5..2a02cb750892 100644
> > --- a/arch/riscv/kvm/vcpu_exit.c
> > +++ b/arch/riscv/kvm/vcpu_exit.c
> > @@ -162,6 +162,16 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
> >         vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> >  }
> >
> > +static int vcpu_trap_redirect_vs(struct kvm_vcpu *vcpu,
> > +                                struct kvm_cpu_trap *trap)
> > +{
> > +       /* set up trap handler and trap info when it gets back to vs */
> > +       kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> > +       /* return to s-mode by setting vcpu's SPP */
> > +       vcpu->arch.guest_context.sstatus |= SR_SPP;
>
> Setting sstatus.SPP needs to be done in kvm_riscv_vcpu_trap_redirect()
> because for guest all traps are always taken by VS-mode.
NIce. Sorry that I didn't dig much into the kvm part so I thought it
was left to VU-mode on purpose.
>
> > +       return 1;
> > +}
> > +
> >  /*
> >   * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
> >   * proper exit to userspace.
> > @@ -179,6 +189,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >         ret = -EFAULT;
> >         run->exit_reason = KVM_EXIT_UNKNOWN;
> >         switch (trap->scause) {
> > +       case EXC_INST_ILLEGAL:
> > +               if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> > +                       ret = vcpu_trap_redirect_vs(vcpu, trap);
> > +               break;
> >         case EXC_VIRTUAL_INST_FAULT:
> >                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> >                         ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> > @@ -206,6 +220,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                         vcpu->arch.guest_context.hstatus);
> >                 kvm_err("SCAUSE=0x%lx STVAL=0x%lx HTVAL=0x%lx HTINST=0x%lx\n",
> >                         trap->scause, trap->stval, trap->htval, trap->htinst);
> > +               asm volatile ("ebreak\n\t");
>
> This is not a related change.
>
Oops, that was a mistake.
> >         }
> >
> >         return ret;
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Overall, this patch can be accepted independent of this series due
> to its usefulness.
>
> I send a v2 of this patch separately.
Thank you Anup. I will leave this patch there for the following
revision of the vector patches.

Cheers,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
