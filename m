Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BAEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 00:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zrgLHM2yeBRsiREzhvGxbCzYEhZ1YE4m1p3eug86Pw=; b=FjKPiUk26G1hUY
	t2OmC7l6Vy2/jtNgFGufXmgH9M3QOgz64F6Zbt0PFEl30CB0ExIijnXfj48h3kZuJOaGrdqS/Dnxr
	NJlH+5ItwXGhxbrxRpCZMjJylRRt09jOXNbyt60LISQGX+T4yJ/yG4zPyPwQw6L/qjomwKoHRCckO
	aqEVz7uqPNaBp/uuG+YYdEfBilQQkzVMi/vlG7Rl30EeqPMxq1porbIfZwAoetEu41HOOKppiql8Q
	TupMk7rTN3p3ueJyK14yTJ7QT5UwGx6y8kt0e/uYpYw/Pxo6DdlM05gTNZmMeZlTh0tcGiefBo6+v
	1ygjbE0uQL9JebeSJaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMfei-00C1X0-1K; Wed, 23 Feb 2022 00:37:20 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMfef-00C1W1-KC
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 00:37:19 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id j12so44700393ybh.8
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 16:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2h7LQgG5S1uyoH6EetnkBe7aHYPYp/26Yua4YjiEGSc=;
 b=US0y6sd0+18z8FxUbBTywg5wBh4efzQJrYEcR7tLWaF4BR9rBrP41fvPp70ThYSeCQ
 OXqTbIstg9Upee9y5y0ouL3DM/us3uiBIY9o5oANyIl8P3Of7QnQSWQtCEhH5ntOzZkX
 GfZ4mLyabShPJ2yDKXO08duubMUun1koCTf3WiDNPfhlIMyiXMHGo8sDzzk0vBwknKeX
 R19cHN2b9baBNJOnQ1+cpGKxoZ1EhD4wGC+Z9Of59que2+NZpMAXnrDJwSOzSnXfa8Uu
 VumlWz3EofsqNheLE+AaDqN2x0WxKan7PeJcosGAc1wxt+XazbvaQcHmSW+z/ZLBmJRC
 +PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2h7LQgG5S1uyoH6EetnkBe7aHYPYp/26Yua4YjiEGSc=;
 b=ntOpq6//hYGvAGcr93a3TevI4eQhyFPf9nHae3UMcxoKWttRbrZveSS1djtMk0SCrd
 3xCV3+NHoxyF+tipxmAXi+NwM45JskudmiPMTJnAocwIf3igFzz01G6SKuX6v6+Y2YWM
 rL4ex6PpV9HxC3gS1Inil8C79aG4uFVk/5N71NVUXvJz+aJUcL4JpRWLEn+Pj5E2HpVS
 tSeIg8Kt+0kh5mOWOXxCbM1LsMg1NaYcqdl+zdVNops10MFRG8Pd0aFtkpx7ckg/ZzTN
 ulVFo+/n2OL/OCH8rsl9Mv7gltyMTR2Rx4lD1M2PLRC/9YkMFOYXvqjMfgJT7zuiNH/Q
 wVYA==
X-Gm-Message-State: AOAM533NkjfQepatL4xqIGpwU1DvAUyQs76YUktVt6AzLfeM1QVB4OY8
 H/RH29Ct5Ej3RHO/8YRXwxwReoWk7tB7MiQZc7me3w==
X-Google-Smtp-Source: ABdhPJywFYXqT3H1QVKpZBF5P2yC5jwUbwJeyiaMWjjyXrOjienhh6HCJsFKa3i4wXPlMwX1+AQiajipFQ4wsEazEtE=
X-Received: by 2002:a25:cfd7:0:b0:624:b515:5859 with SMTP id
 f206-20020a25cfd7000000b00624b5155859mr8569355ybg.232.1645576635767; Tue, 22
 Feb 2022 16:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20220217104248.30948-1-vincent.chen@sifive.com>
 <CAAhSdy22YkD+euF2wij9FhUT2q-jVQCjdN8+WQEqnyzdiQ6EAw@mail.gmail.com>
In-Reply-To: <CAAhSdy22YkD+euF2wij9FhUT2q-jVQCjdN8+WQEqnyzdiQ6EAw@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 23 Feb 2022 08:37:04 +0800
Message-ID: <CABvJ_xg5SHbH9x5WWXob09XJena7nUkTYU6uq_Yxk=d-PLi4CQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: refine __kvm_riscv_switch_to and
 __kvm_riscv_switch_from function
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fu-Ching Yang <fu-ching.yang@sifive.com>, 
 Hsinyi Lee <hsinyi.lee@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_163717_744237_D056EF7A 
X-CRM114-Status: GOOD (  21.99  )
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

On Tue, Feb 22, 2022 at 2:43 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Feb 17, 2022 at 4:13 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
>
> I think the patch subject should be:
> RISC-V: KVM: Refine __kvm_riscv_switch_to() implementation
>
> > Kernel uses __kvm_riscv_switch_to() and __kvm_riscv_switch_from() to switch
>
> s/__kvm_riscv_switch_from/__kvm_switch_return/
>
> > the context of host kernel and guest kernel. Several CSRs belonging to the
> > context will be read and written during the context switch. To ensure
> > atomic read-modify-write control of CSR and ordering of CSR accesses, some
> > hardware blocks or flushes the pipeline when writing a CSR. In this
>
> s/hardware blocks or flushes/hardware blocks flush/
>
> > circumstance, grouping CSR executions together as much as possible can
> > reduce the performance impact of the pipeline. Therefore, this commit
> > reorders the CSR instructions to enhance the context switch performance..
>
> I am mostly fine with this patch except a few nits below.
>
Hi Anup,
Thank you for your suggestions. I will modify them in the v2 patch.

Best regards,
Vincent
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Suggested-by: Hsinyi Lee <hsinyi.lee@sifive.com>
> > Suggested-by: Fu-Ching Yang <fu-ching.yang@sifive.com>
> > ---
> >  arch/riscv/kvm/vcpu_switch.S | 55 ++++++++++++++++++------------------
> >  1 file changed, 28 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> > index 029a28a195c6..75cf21e5ed92 100644
> > --- a/arch/riscv/kvm/vcpu_switch.S
> > +++ b/arch/riscv/kvm/vcpu_switch.S
> > @@ -40,34 +40,35 @@ ENTRY(__kvm_riscv_switch_to)
> >         REG_S   s9, (KVM_ARCH_HOST_S9)(a0)
> >         REG_S   s10, (KVM_ARCH_HOST_S10)(a0)
> >         REG_S   s11, (KVM_ARCH_HOST_S11)(a0)
>
> Add a new line here.
>
> Also add a single line comment as follows:
> /* Load Guest CSR values */
>
> > +       REG_L   t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
> > +       REG_L   t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
> > +       REG_L   t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> > +       la      t4, __kvm_switch_return
> > +       REG_L   t5, (KVM_ARCH_GUEST_SEPC)(a0)
> >
> >         /* Save Host and Restore Guest SSTATUS */
> > -       REG_L   t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
> >         csrrw   t0, CSR_SSTATUS, t0
> > -       REG_S   t0, (KVM_ARCH_HOST_SSTATUS)(a0)
> >
> >         /* Save Host and Restore Guest HSTATUS */
> > -       REG_L   t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
> >         csrrw   t1, CSR_HSTATUS, t1
> > -       REG_S   t1, (KVM_ARCH_HOST_HSTATUS)(a0)
> >
> >         /* Save Host and Restore Guest SCOUNTEREN */
> > -       REG_L   t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> >         csrrw   t2, CSR_SCOUNTEREN, t2
> > -       REG_S   t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> > -
> > -       /* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
> > -       csrrw   t3, CSR_SSCRATCH, a0
> > -       REG_S   t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
> >
> >         /* Save Host STVEC and change it to return path */
> > -       la      t4, __kvm_switch_return
> >         csrrw   t4, CSR_STVEC, t4
> > -       REG_S   t4, (KVM_ARCH_HOST_STVEC)(a0)
> > +
> > +       /* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
> > +       csrrw   t3, CSR_SSCRATCH, a0
> >
> >         /* Restore Guest SEPC */
> > -       REG_L   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> > -       csrw    CSR_SEPC, t0
> > +       csrw    CSR_SEPC, t5
> > +
>
> Add a single line comment as follows:
> /* Store Host CSR values */
>
> > +       REG_S   t0, (KVM_ARCH_HOST_SSTATUS)(a0)
> > +       REG_S   t1, (KVM_ARCH_HOST_HSTATUS)(a0)
> > +       REG_S   t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> > +       REG_S   t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
> > +       REG_S   t4, (KVM_ARCH_HOST_STVEC)(a0)
> >
> >         /* Restore Guest GPRs (except A0) */
> >         REG_L   ra, (KVM_ARCH_GUEST_RA)(a0)
> > @@ -144,35 +145,35 @@ __kvm_switch_return:
> >         REG_S   t4, (KVM_ARCH_GUEST_T4)(a0)
> >         REG_S   t5, (KVM_ARCH_GUEST_T5)(a0)
> >         REG_S   t6, (KVM_ARCH_GUEST_T6)(a0)
>
> Add a new line here.
>
> Also add a single line comment as follows:
> /* Load Host CSR values */
>
> > +       REG_L   t1, (KVM_ARCH_HOST_STVEC)(a0)
> > +       REG_L   t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
> > +       REG_L   t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> > +       REG_L   t4, (KVM_ARCH_HOST_HSTATUS)(a0)
> > +       REG_L   t5, (KVM_ARCH_HOST_SSTATUS)(a0)
> >
> >         /* Save Guest SEPC */
> >         csrr    t0, CSR_SEPC
> > -       REG_S   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> > -
> > -       /* Restore Host STVEC */
> > -       REG_L   t1, (KVM_ARCH_HOST_STVEC)(a0)
> > -       csrw    CSR_STVEC, t1
> >
> >         /* Save Guest A0 and Restore Host SSCRATCH */
> > -       REG_L   t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
> >         csrrw   t2, CSR_SSCRATCH, t2
> > -       REG_S   t2, (KVM_ARCH_GUEST_A0)(a0)
> > +
> > +       /* Restore Host STVEC */
> > +       csrw    CSR_STVEC, t1
> >
> >         /* Save Guest and Restore Host SCOUNTEREN */
> > -       REG_L   t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> >         csrrw   t3, CSR_SCOUNTEREN, t3
> > -       REG_S   t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> >
> >         /* Save Guest and Restore Host HSTATUS */
> > -       REG_L   t4, (KVM_ARCH_HOST_HSTATUS)(a0)
> >         csrrw   t4, CSR_HSTATUS, t4
> > -       REG_S   t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
> >
> >         /* Save Guest and Restore Host SSTATUS */
> > -       REG_L   t5, (KVM_ARCH_HOST_SSTATUS)(a0)
> >         csrrw   t5, CSR_SSTATUS, t5
> > -       REG_S   t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
> >
>
> Add a single line comment as follows:
> /* Store Guest CSR values */
>
> > +       REG_S   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> > +       REG_S   t2, (KVM_ARCH_GUEST_A0)(a0)
> > +       REG_S   t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> > +       REG_S   t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
> > +       REG_S   t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
>
> Add new line here
>
> >         /* Restore Host GPRs (except A0 and T0-T6) */
> >         REG_L   ra, (KVM_ARCH_HOST_RA)(a0)
> >         REG_L   sp, (KVM_ARCH_HOST_SP)(a0)
> > --
> > 2.17.1
> >
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
