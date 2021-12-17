Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56D5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 06:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6tgKIJg3AXAkQTe0X/MkYqupve1DBeeN13fQRRtlZQ=; b=NPW/mw8jZ19SAA
	jbHBqQlk/qY3x4ozne2NsSBz/nTdPz4nYIbH5Rm5yBoShwvczvgXik8meUrRBVhp53LzMW5ZZgLfu
	LauURXIH78BGj+fz+7nc29UAfZhr4Qt7WFEBENbJOXdx3PiJLqj16kTXWtYezpdDgRstb4M+GcJsZ
	JSVDpkH8xswlYlZPGQC9oo0yN2Fm10aGeDttAAeH3zYkSoy2Oydc6I3WeBtewiBsvK+nvwtRBVJcA
	EJTBfKP/SWjHk+2B+QIcwh9CPZk+V+oZ6oVoYI92CWiZVoYvGr5Sf2e0t0l/UPwjm34UI4DDE7+ti
	FWSlC4jOckxVl1paV3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my6Qf-008iwL-32; Fri, 17 Dec 2021 06:09:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my6Qb-008iv1-V5
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 06:09:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id q16so1999402wrg.7
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 22:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7QH2bkz/dvyar0Slq99MmeQR+6WQT9L3G9+6vCacYMo=;
 b=waZfM5crmwh+YUwgryZwAjwMKciDhj6hG65pBTNwrjBM1A46dmd2m6KpjWRAhkl7wd
 JS5DVW8eO8Uimxc6CRvZGASqDGLGtIxT4pSS0Q2yP0/cxQFGmnbL+M26OJP39exU97n0
 ETsBk5MuDSbC3hzEQ70IMoZ4xcLGze2MiNSUmzKUo7GcPuIT1FE30tKffUNi1PngZwEz
 lUWM2lZNQcNejkV4FWNaW92ubDzXPPfkhSVPEav86ScTugM5bW0DnVYgUtNU/mGHdZve
 pdei1icgv91nuiO75ZrsV1uhdHx38sMaqJ68d4EfYlXeJWiU/6kGGxyhzSsxq/sH6LyP
 ojqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7QH2bkz/dvyar0Slq99MmeQR+6WQT9L3G9+6vCacYMo=;
 b=VOtuZ/+Y1TLcS84nVQh1RZrjO7qy6llaoXRBrbwpCMUBBBBb7p69tO0pbpEYDI2tAq
 CkwFx508VcSJH0IOtF3BAHOcsK+Znemnt39jCzGTQzEYTzL8+Nu5bFbiHvceX1P7VWEC
 MZylqM48BkLc1cKFxk/suWZCbdlD7v/L2fmMOJ6Fp7iNOvDABlojdHc4u1sIjas884J0
 GxTZVQdsZkSVWY52H7qLmUsCcVgPXOWBGh+KIcYRikF4eH29AOB4aRxBtDnET2mRYI5e
 Nw0mJWhGoacjz4H6EBxuZ1x+S/IdV6N94UNL9P7cYXkFxPgy8OjvgtQ1Bp3l+JlR7QRu
 OYPg==
X-Gm-Message-State: AOAM5335xTjqq6sxgV9naSRY+exezKLz7BY2YVyDgoMk6nWnZ1qFCoZF
 hQixYViSvTJpyEDUCJhySb99OG9ipGUuwPLv59rJvA==
X-Google-Smtp-Source: ABdhPJwEquvnLOderDNKIdJ1HekDsTALy8TIENkzMKo1N7N3wuyG5X3zylXVjua0nOnoW8rY/7T9uIm++VL6JFu35Vw=
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr1095151wrw.313.1639721351448; 
 Thu, 16 Dec 2021 22:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-3-anup.patel@wdc.com>
 <CAOnJCU+Yft5EjgUUCi=nW79pYSGYPWB1ew5iyTjViFvGGQxQCA@mail.gmail.com>
In-Reply-To: <CAOnJCU+Yft5EjgUUCi=nW79pYSGYPWB1ew5iyTjViFvGGQxQCA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Dec 2021 11:38:59 +0530
Message-ID: <CAAhSdy1WXnoFw2_o+6E1zjx5bP96FeW3ijMuOp3R794Yxasskg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] RISC-V: KVM: Add VM capability to allow userspace
 get GPA bits
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup.patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_220914_097410_A14A1CC2 
X-CRM114-Status: GOOD (  25.32  )
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

On Fri, Dec 17, 2021 at 11:17 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Nov 29, 2021 at 12:10 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The number of GPA bits supported for a RISC-V Guest/VM is based on the
> > MMU mode used by the G-stage translation. The KVM RISC-V will detect and
> > use the best possible MMU mode for the G-stage in kvm_arch_init().
> >
> > We add a generic VM capability KVM_CAP_VM_GPA_BITS which can be used by
> > the KVM userspace to get the number of GPA (guest physical address) bits
> > supported for a Guest/VM.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 1 +
> >  arch/riscv/kvm/mmu.c              | 5 +++++
> >  arch/riscv/kvm/vm.c               | 3 +++
> >  include/uapi/linux/kvm.h          | 1 +
> >  4 files changed, 10 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 37589b953bcb..ae5d238607fe 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -221,6 +221,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
> >  void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_stage2_mode_detect(void);
> >  unsigned long kvm_riscv_stage2_mode(void);
> > +int kvm_riscv_stage2_gpa_size(void);
> >
> >  void kvm_riscv_stage2_vmid_detect(void);
> >  unsigned long kvm_riscv_stage2_vmid_bits(void);
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 9ffd0255af43..9b6d6465094f 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -760,3 +760,8 @@ unsigned long kvm_riscv_stage2_mode(void)
> >  {
> >         return stage2_mode >> HGATP_MODE_SHIFT;
> >  }
> > +
> > +int kvm_riscv_stage2_gpa_size(void)
> > +{
> > +       return stage2_gpa_bits;
> > +}
>
> The ioctl & the underlying stage2_gpa_bits has bits.
> Maybe rename the function to kvm_riscv_stage2_gpa_bits as well ?

Okay, I will rename in the next revision.

Thanks,
Anup

>
> > diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > index fb18af34a4b5..6f959639ec45 100644
> > --- a/arch/riscv/kvm/vm.c
> > +++ b/arch/riscv/kvm/vm.c
> > @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >         case KVM_CAP_NR_MEMSLOTS:
> >                 r = KVM_USER_MEM_SLOTS;
> >                 break;
> > +       case KVM_CAP_VM_GPA_BITS:
> > +               r = kvm_riscv_stage2_gpa_size();
> > +               break;
> >         default:
> >                 r = 0;
> >                 break;
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 1daa45268de2..469f05d69c8d 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
> >  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
> >  #define KVM_CAP_ARM_MTE 205
> >  #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> > +#define KVM_CAP_VM_GPA_BITS 207
> >
> >  #ifdef KVM_CAP_IRQ_ROUTING
> >
> > --
> > 2.25.1
> >
>
> Other than that, it looks good to me.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
