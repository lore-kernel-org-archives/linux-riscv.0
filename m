Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEEDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 05:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017D460F8F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 05:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 017D460F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIHTWSC6YgPo9CjnbgiifBg1WikgEgRNX0TxptLxNUc=; b=G2O31fgsyv+OzK
	uck8+0EUg79QIxP3+RLMNCrdM6Tns65PHR3cu0YeCTI7KlSUga1lgTQlIGo7Zxa6Rt/lUFMFtuakZ
	bpdBR5FkOwS8YRL0bvj2j/RpuoUdaxJlnX1GLIry4/AMxPkdcEpGIQxq8+06VCoE0L2wQ7HZXqsv3
	yl6kL0gKWlV+Zy0PhOfHNGCCTIecedEUTwGajxgKp8HFqSQnsR8HJJB6XQ06Q0Eavs2YGlAU0lWon
	/nvT6eMh2u9vb6u6VfglK/WH9Pi157mdQ9LQwTHtxjpW0XPvMOCTVy2NP6gT/p5bBPQQJrsC9PBRL
	Z74JB79XgR9povEYczow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPe9L-000I32-2H; Mon, 13 Sep 2021 05:04:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPe9G-000I1m-Mj
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 05:04:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso5934947wmb.2
 for <linux-riscv@lists.infradead.org>; Sun, 12 Sep 2021 22:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1pBtXNv7jjtOAwbNHwZFp94KRGcskfbG/kKSpEReEnE=;
 b=EcevB9XuFgAmfi6jSbrFo6xV6nU/SVrLQWQLDDCB6CZtVKu4JrY7Q8BYRMcfmxqs9a
 9fqzTZJbrKf8dUXYBxXkvKcMYzv31wIT6NwY2nlYnT4N9i0dA6GFkQ459sjoZm7/0xAl
 pkNPqRveOeEgouY3r+glQWEUTyltHKD1q485PkAk+tu1fLPSATXB+5ubq4QwrjPFg0Yb
 4BIehCHEmASsj1/K1OZB42CMRdvSW29GVJyQ9GQHq27PqW7nYGInt+aY7KWXzaSUkUed
 FiKpdMDW4rMdrdFmITtrsPwyqJl4pZzcXl7rZxhkJbUHnA12V6q6u8jjLz//cvOVQUpl
 9/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pBtXNv7jjtOAwbNHwZFp94KRGcskfbG/kKSpEReEnE=;
 b=qX2xyOxbFcim4V1mtKIVw6PnFYBeO24r3457CVYKLyVhV1h5AFkwuVT78UsxTFwPS+
 a5HvXhTcbW9CSqzAnGzl75PetB/hd8Iz/hmTIETe9Uo//wxuqzrdOuAa0/alw9qfnEvy
 URhNCGvFwA+neTd8N5R01sSsYBTvQqf02A2Ypk4oa12ZlZQ9JvP+t+Fx6u6TEBzNoMGs
 xRvjKp4krfdP24miHxtlVDtz02lpzafwDN2DyEBj/OpJtmzjGfLTIFmRmBGwLjrSkt0p
 tD518GSE9XLJ+fB2TG8XL9C0kgQ4nYoOEmyEAWSi64D5r/kpG0iEb6pUz083OyHBr1V6
 wEhQ==
X-Gm-Message-State: AOAM530sdboocf1DhI+1GnxL+AeqGoLn3wCBAwk/RlVpaXfS1l49ieTU
 FPmslQlqmL8JKX7LMwRkQYtvBFCW4j0maSxU7FdAQA==
X-Google-Smtp-Source: ABdhPJzjiW/1p8CRf2OoVnwmPJjQX12UeLY15ECwGt04sGSdC8fbPkudK37wlxqm6MOV3v0jGX+JO0pmcV5CTEdV49o=
X-Received: by 2002:a7b:c005:: with SMTP id c5mr9413406wmb.59.1631509489958;
 Sun, 12 Sep 2021 22:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210727055450.2742868-1-anup.patel@wdc.com>
 <20210727055450.2742868-14-anup.patel@wdc.com>
 <CABvJ_xgyn0yeYnbqN=xA60xmuWL6vwFtLt_b60BF_tnfd8r5cQ@mail.gmail.com>
In-Reply-To: <CABvJ_xgyn0yeYnbqN=xA60xmuWL6vwFtLt_b60BF_tnfd8r5cQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Sep 2021 10:34:38 +0530
Message-ID: <CAAhSdy2zY+f1FE4hBKmvRL+ShmVfw=RwpLciG7=XhCzoOkU1hw@mail.gmail.com>
Subject: Re: [PATCH v19 13/17] RISC-V: KVM: FP lazy save/restore
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_220454_829220_0BD71EC9 
X-CRM114-Status: GOOD (  39.72  )
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

On Mon, Sep 13, 2021 at 10:01 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> On Tue, Jul 27, 2021 at 3:30 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > From: Atish Patra <atish.patra@wdc.com>
> >
> > This patch adds floating point (F and D extension) context save/restore
> > for guest VCPUs. The FP context is saved and restored lazily only when
> > kernel enter/exits the in-kernel run loop and not during the KVM world
> > switch. This way FP save/restore has minimal impact on KVM performance.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Alexander Graf <graf@amazon.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h |   5 +
> >  arch/riscv/kernel/asm-offsets.c   |  72 +++++++++++++
> >  arch/riscv/kvm/vcpu.c             |  91 ++++++++++++++++
> >  arch/riscv/kvm/vcpu_switch.S      | 174 ++++++++++++++++++++++++++++++
> >  4 files changed, 342 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 18b4ec1b5105..99b43229fe7a 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -125,6 +125,7 @@ struct kvm_cpu_context {
> >         unsigned long sepc;
> >         unsigned long sstatus;
> >         unsigned long hstatus;
> > +       union __riscv_fp_state fp;
> >  };
> >
> >  struct kvm_vcpu_csr {
> > @@ -239,6 +240,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                         struct kvm_cpu_trap *trap);
> >
> >  void __kvm_riscv_switch_to(struct kvm_vcpu_arch *vcpu_arch);
> > +void __kvm_riscv_fp_f_save(struct kvm_cpu_context *context);
> > +void __kvm_riscv_fp_f_restore(struct kvm_cpu_context *context);
> > +void __kvm_riscv_fp_d_save(struct kvm_cpu_context *context);
> > +void __kvm_riscv_fp_d_restore(struct kvm_cpu_context *context);
> >
> >  int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
> >  int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
> > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> > index 91c77555d914..24d3827e4837 100644
> > --- a/arch/riscv/kernel/asm-offsets.c
> > +++ b/arch/riscv/kernel/asm-offsets.c
> > @@ -195,6 +195,78 @@ void asm_offsets(void)
> >         OFFSET(KVM_ARCH_TRAP_HTVAL, kvm_cpu_trap, htval);
> >         OFFSET(KVM_ARCH_TRAP_HTINST, kvm_cpu_trap, htinst);
> >
> > +       /* F extension */
> > +
> > +       OFFSET(KVM_ARCH_FP_F_F0, kvm_cpu_context, fp.f.f[0]);
> > +       OFFSET(KVM_ARCH_FP_F_F1, kvm_cpu_context, fp.f.f[1]);
> > +       OFFSET(KVM_ARCH_FP_F_F2, kvm_cpu_context, fp.f.f[2]);
> > +       OFFSET(KVM_ARCH_FP_F_F3, kvm_cpu_context, fp.f.f[3]);
> > +       OFFSET(KVM_ARCH_FP_F_F4, kvm_cpu_context, fp.f.f[4]);
> > +       OFFSET(KVM_ARCH_FP_F_F5, kvm_cpu_context, fp.f.f[5]);
> > +       OFFSET(KVM_ARCH_FP_F_F6, kvm_cpu_context, fp.f.f[6]);
> > +       OFFSET(KVM_ARCH_FP_F_F7, kvm_cpu_context, fp.f.f[7]);
> > +       OFFSET(KVM_ARCH_FP_F_F8, kvm_cpu_context, fp.f.f[8]);
> > +       OFFSET(KVM_ARCH_FP_F_F9, kvm_cpu_context, fp.f.f[9]);
> > +       OFFSET(KVM_ARCH_FP_F_F10, kvm_cpu_context, fp.f.f[10]);
> > +       OFFSET(KVM_ARCH_FP_F_F11, kvm_cpu_context, fp.f.f[11]);
> > +       OFFSET(KVM_ARCH_FP_F_F12, kvm_cpu_context, fp.f.f[12]);
> > +       OFFSET(KVM_ARCH_FP_F_F13, kvm_cpu_context, fp.f.f[13]);
> > +       OFFSET(KVM_ARCH_FP_F_F14, kvm_cpu_context, fp.f.f[14]);
> > +       OFFSET(KVM_ARCH_FP_F_F15, kvm_cpu_context, fp.f.f[15]);
> > +       OFFSET(KVM_ARCH_FP_F_F16, kvm_cpu_context, fp.f.f[16]);
> > +       OFFSET(KVM_ARCH_FP_F_F17, kvm_cpu_context, fp.f.f[17]);
> > +       OFFSET(KVM_ARCH_FP_F_F18, kvm_cpu_context, fp.f.f[18]);
> > +       OFFSET(KVM_ARCH_FP_F_F19, kvm_cpu_context, fp.f.f[19]);
> > +       OFFSET(KVM_ARCH_FP_F_F20, kvm_cpu_context, fp.f.f[20]);
> > +       OFFSET(KVM_ARCH_FP_F_F21, kvm_cpu_context, fp.f.f[21]);
> > +       OFFSET(KVM_ARCH_FP_F_F22, kvm_cpu_context, fp.f.f[22]);
> > +       OFFSET(KVM_ARCH_FP_F_F23, kvm_cpu_context, fp.f.f[23]);
> > +       OFFSET(KVM_ARCH_FP_F_F24, kvm_cpu_context, fp.f.f[24]);
> > +       OFFSET(KVM_ARCH_FP_F_F25, kvm_cpu_context, fp.f.f[25]);
> > +       OFFSET(KVM_ARCH_FP_F_F26, kvm_cpu_context, fp.f.f[26]);
> > +       OFFSET(KVM_ARCH_FP_F_F27, kvm_cpu_context, fp.f.f[27]);
> > +       OFFSET(KVM_ARCH_FP_F_F28, kvm_cpu_context, fp.f.f[28]);
> > +       OFFSET(KVM_ARCH_FP_F_F29, kvm_cpu_context, fp.f.f[29]);
> > +       OFFSET(KVM_ARCH_FP_F_F30, kvm_cpu_context, fp.f.f[30]);
> > +       OFFSET(KVM_ARCH_FP_F_F31, kvm_cpu_context, fp.f.f[31]);
> > +       OFFSET(KVM_ARCH_FP_F_FCSR, kvm_cpu_context, fp.f.fcsr);
> > +
> > +       /* D extension */
> > +
> > +       OFFSET(KVM_ARCH_FP_D_F0, kvm_cpu_context, fp.d.f[0]);
> > +       OFFSET(KVM_ARCH_FP_D_F1, kvm_cpu_context, fp.d.f[1]);
> > +       OFFSET(KVM_ARCH_FP_D_F2, kvm_cpu_context, fp.d.f[2]);
> > +       OFFSET(KVM_ARCH_FP_D_F3, kvm_cpu_context, fp.d.f[3]);
> > +       OFFSET(KVM_ARCH_FP_D_F4, kvm_cpu_context, fp.d.f[4]);
> > +       OFFSET(KVM_ARCH_FP_D_F5, kvm_cpu_context, fp.d.f[5]);
> > +       OFFSET(KVM_ARCH_FP_D_F6, kvm_cpu_context, fp.d.f[6]);
> > +       OFFSET(KVM_ARCH_FP_D_F7, kvm_cpu_context, fp.d.f[7]);
> > +       OFFSET(KVM_ARCH_FP_D_F8, kvm_cpu_context, fp.d.f[8]);
> > +       OFFSET(KVM_ARCH_FP_D_F9, kvm_cpu_context, fp.d.f[9]);
> > +       OFFSET(KVM_ARCH_FP_D_F10, kvm_cpu_context, fp.d.f[10]);
> > +       OFFSET(KVM_ARCH_FP_D_F11, kvm_cpu_context, fp.d.f[11]);
> > +       OFFSET(KVM_ARCH_FP_D_F12, kvm_cpu_context, fp.d.f[12]);
> > +       OFFSET(KVM_ARCH_FP_D_F13, kvm_cpu_context, fp.d.f[13]);
> > +       OFFSET(KVM_ARCH_FP_D_F14, kvm_cpu_context, fp.d.f[14]);
> > +       OFFSET(KVM_ARCH_FP_D_F15, kvm_cpu_context, fp.d.f[15]);
> > +       OFFSET(KVM_ARCH_FP_D_F16, kvm_cpu_context, fp.d.f[16]);
> > +       OFFSET(KVM_ARCH_FP_D_F17, kvm_cpu_context, fp.d.f[17]);
> > +       OFFSET(KVM_ARCH_FP_D_F18, kvm_cpu_context, fp.d.f[18]);
> > +       OFFSET(KVM_ARCH_FP_D_F19, kvm_cpu_context, fp.d.f[19]);
> > +       OFFSET(KVM_ARCH_FP_D_F20, kvm_cpu_context, fp.d.f[20]);
> > +       OFFSET(KVM_ARCH_FP_D_F21, kvm_cpu_context, fp.d.f[21]);
> > +       OFFSET(KVM_ARCH_FP_D_F22, kvm_cpu_context, fp.d.f[22]);
> > +       OFFSET(KVM_ARCH_FP_D_F23, kvm_cpu_context, fp.d.f[23]);
> > +       OFFSET(KVM_ARCH_FP_D_F24, kvm_cpu_context, fp.d.f[24]);
> > +       OFFSET(KVM_ARCH_FP_D_F25, kvm_cpu_context, fp.d.f[25]);
> > +       OFFSET(KVM_ARCH_FP_D_F26, kvm_cpu_context, fp.d.f[26]);
> > +       OFFSET(KVM_ARCH_FP_D_F27, kvm_cpu_context, fp.d.f[27]);
> > +       OFFSET(KVM_ARCH_FP_D_F28, kvm_cpu_context, fp.d.f[28]);
> > +       OFFSET(KVM_ARCH_FP_D_F29, kvm_cpu_context, fp.d.f[29]);
> > +       OFFSET(KVM_ARCH_FP_D_F30, kvm_cpu_context, fp.d.f[30]);
> > +       OFFSET(KVM_ARCH_FP_D_F31, kvm_cpu_context, fp.d.f[31]);
> > +       OFFSET(KVM_ARCH_FP_D_FCSR, kvm_cpu_context, fp.d.fcsr);
> > +
> >         /*
> >          * THREAD_{F,X}* might be larger than a S-type offset can handle, but
> >          * these are used in performance-sensitive assembly so we can't resort
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index f26b249eae8e..024f2c6e7582 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -40,6 +40,86 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
> >                        sizeof(kvm_vcpu_stats_desc),
> >  };
> >
> > +#ifdef CONFIG_FPU
> > +static void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
> > +{
> > +       unsigned long isa = vcpu->arch.isa;
> > +       struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> > +
> > +       cntx->sstatus &= ~SR_FS;
> > +       if (riscv_isa_extension_available(&isa, f) ||
> > +           riscv_isa_extension_available(&isa, d))
> > +               cntx->sstatus |= SR_FS_INITIAL;
> > +       else
> > +               cntx->sstatus |= SR_FS_OFF;
> > +}
> > +
> > +static void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
> > +{
> > +       cntx->sstatus &= ~SR_FS;
> > +       cntx->sstatus |= SR_FS_CLEAN;
> > +}
> > +
> > +static void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
> > +                                        unsigned long isa)
> > +{
> > +       if ((cntx->sstatus & SR_FS) == SR_FS_DIRTY) {
> > +               if (riscv_isa_extension_available(&isa, d))
> > +                       __kvm_riscv_fp_d_save(cntx);
> > +               else if (riscv_isa_extension_available(&isa, f))
> > +                       __kvm_riscv_fp_f_save(cntx);
> > +               kvm_riscv_vcpu_fp_clean(cntx);
>
> Hi Anup and Atish,
> First of all, thank you very much for contributing this patch set to
> add H extension support to the Linux kernel.
>
> I tried to do some development based on this patchset and encountered
> some strange behaviors related to FPU registers. After diagnosis, I
> suspect the root cause of these behaviors is in the
> kvm_riscv_vcpu_fp_clean().
> In the kvm_riscv_vcpu_fp_clean(), the sstatus.FS field of guest OS
> will be set to clean. It will cause the guest kernel to mistakenly
> believe the status of the FPU register is clean so that the guest OS
> will not save the value of FPU registers to the process context before
> this process is scheduled out. However, here the host OS only saves
> the FPU register to the guest OS context instead of the process
> context. In this case, for the process in the guest OS, the data in
> FPU registers may be lost due to the lack of context saving before
> scheduling out. Therefore, IMHO, the kvm_riscv_vcpu_fp_clean() might
> be unnecessary and could be removed.

Please don't confuse the Guest view of sstatus.FS with the Host view of
sstatus.FS.

When the Guest is running (i.e. V=1):
1) The Guest access to SSTATUS CSR are mapped to VSSTATUS CSR
and the actual SSTATUS CSR (in background) represents Host SSTATUS.
2) The FP state (OFF, INIT, CLEAN, and DIRTY) is tracked in two FS fields
VSSTATUS.FS (for Guest OS) and SSTATUS.FS (for Host/Hypervisor).
3) The RISC-V hardware will check and update both actual SSTATUS.FS
and VSSTATUS.FS when running in Guest mode (i.e. V=1)
4) The Hypervisor uses actual SSTATUS.FS to save/restore FP from
Host perspective whereas  the Guest OS uses VSSTATUS.FS to save/restore
FP from Guest perspective

The "cntx->sstatus" in KVM RISC-V code represents the actual Host
SSTATUS CSR while Guest/VM was running and does not represent
the Guest view of SSTATUS (which is in VSSTATUS CSR).

Another way of looking at this is, Hypervisor will save/restore FP based
on it's own view of SSTATUS.FS (i.e. actual SSTATUS CSR) while
Guest OS will save/restore FP based on it's own view of SSTATUS.FS
(i.e. VSSTATUS CSR). It is possible that Guest gets preempted even
before it got chance to save FP registers so the hypervisor ensures that
FP is saved-and-restored based on it's own view of SSTATUS.FS.

The above rationale also applies to V-extension.

Let us know if you still have questions related to this.

>
> > +       }
> > +}
> > +
> > +static void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
> > +                                           unsigned long isa)
> > +{
> > +       if ((cntx->sstatus & SR_FS) != SR_FS_OFF) {
> > +               if (riscv_isa_extension_available(&isa, d))
> > +                       __kvm_riscv_fp_d_restore(cntx);
> > +               else if (riscv_isa_extension_available(&isa, f))
> > +                       __kvm_riscv_fp_f_restore(cntx);
> > +               kvm_riscv_vcpu_fp_clean(cntx);
>
> The reason is the same as above. Here the kvm_riscv_vcpu_fp_clean()
> might be unnecessary and could be removed.

Please see above.

>
> > +}
> > +
> > +static void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
> > +{
> > +       /* No need to check host sstatus as it can be modified outside */
> > +       if (riscv_isa_extension_available(NULL, d))
> > +               __kvm_riscv_fp_d_save(cntx);
> > +       else if (riscv_isa_extension_available(NULL, f))
> > +               __kvm_riscv_fp_f_save(cntx);
> > +}
> > +
> > +static void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
> > +{
> > +       if (riscv_isa_extension_available(NULL, d))
> > +               __kvm_riscv_fp_d_restore(cntx);
> > +       else if (riscv_isa_extension_available(NULL, f))
> > +               __kvm_riscv_fp_f_restore(cntx);
> > +}
> > +#else
> > +static void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
> > +{
> > +}
> > +static void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
> > +                                        unsigned long isa)
> > +{
> > +}
> > +static void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
> > +                                           unsigned long isa)
> > +{
> > +}
> > +static void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
> > +{
> > +}
> > +static void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
> > +{
> > +}
> > +#endif
> > +
> >  #define KVM_RISCV_ISA_ALLOWED  (riscv_isa_extension_mask(a) | \
> >                                  riscv_isa_extension_mask(c) | \
> >                                  riscv_isa_extension_mask(d) | \
> > @@ -60,6 +140,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
> >
> >         memcpy(cntx, reset_cntx, sizeof(*cntx));
> >
> > +       kvm_riscv_vcpu_fp_reset(vcpu);
> > +
> >         kvm_riscv_vcpu_timer_reset(vcpu);
> >
> >         WRITE_ONCE(vcpu->arch.irqs_pending, 0);
> > @@ -194,6 +276,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
> >                         vcpu->arch.isa = reg_val;
> >                         vcpu->arch.isa &= riscv_isa_extension_base(NULL);
> >                         vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
> > +                       kvm_riscv_vcpu_fp_reset(vcpu);
> >                 } else {
> >                         return -EOPNOTSUPP;
> >                 }
> > @@ -598,6 +681,10 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >
> >         kvm_riscv_vcpu_timer_restore(vcpu);
> >
> > +       kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
> > +       kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
> > +                                       vcpu->arch.isa);
> > +
> >         vcpu->cpu = cpu;
> >  }
> >
> > @@ -607,6 +694,10 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> >
> >         vcpu->cpu = -1;
> >
> > +       kvm_riscv_vcpu_guest_fp_save(&vcpu->arch.guest_context,
> > +                                    vcpu->arch.isa);
> > +       kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
> > +
> >         csr_write(CSR_HGATP, 0);
> >
> >         csr->vsstatus = csr_read(CSR_VSSTATUS);
> > diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> > index e22721e1b892..029a28a195c6 100644
> > --- a/arch/riscv/kvm/vcpu_switch.S
> > +++ b/arch/riscv/kvm/vcpu_switch.S
> > @@ -224,3 +224,177 @@ ENTRY(__kvm_riscv_unpriv_trap)
> >         REG_S   a1, (KVM_ARCH_TRAP_HTINST)(a0)
> >         sret
> >  ENDPROC(__kvm_riscv_unpriv_trap)
> > +
> > +#ifdef CONFIG_FPU
> > +       .align 3
> > +       .global __kvm_riscv_fp_f_save
> > +__kvm_riscv_fp_f_save:
> > +       csrr t2, CSR_SSTATUS
> > +       li t1, SR_FS
> > +       csrs CSR_SSTATUS, t1
> > +       frcsr t0
> > +       fsw f0,  KVM_ARCH_FP_F_F0(a0)
> > +       fsw f1,  KVM_ARCH_FP_F_F1(a0)
> > +       fsw f2,  KVM_ARCH_FP_F_F2(a0)
> > +       fsw f3,  KVM_ARCH_FP_F_F3(a0)
> > +       fsw f4,  KVM_ARCH_FP_F_F4(a0)
> > +       fsw f5,  KVM_ARCH_FP_F_F5(a0)
> > +       fsw f6,  KVM_ARCH_FP_F_F6(a0)
> > +       fsw f7,  KVM_ARCH_FP_F_F7(a0)
> > +       fsw f8,  KVM_ARCH_FP_F_F8(a0)
> > +       fsw f9,  KVM_ARCH_FP_F_F9(a0)
> > +       fsw f10, KVM_ARCH_FP_F_F10(a0)
> > +       fsw f11, KVM_ARCH_FP_F_F11(a0)
> > +       fsw f12, KVM_ARCH_FP_F_F12(a0)
> > +       fsw f13, KVM_ARCH_FP_F_F13(a0)
> > +       fsw f14, KVM_ARCH_FP_F_F14(a0)
> > +       fsw f15, KVM_ARCH_FP_F_F15(a0)
> > +       fsw f16, KVM_ARCH_FP_F_F16(a0)
> > +       fsw f17, KVM_ARCH_FP_F_F17(a0)
> > +       fsw f18, KVM_ARCH_FP_F_F18(a0)
> > +       fsw f19, KVM_ARCH_FP_F_F19(a0)
> > +       fsw f20, KVM_ARCH_FP_F_F20(a0)
> > +       fsw f21, KVM_ARCH_FP_F_F21(a0)
> > +       fsw f22, KVM_ARCH_FP_F_F22(a0)
> > +       fsw f23, KVM_ARCH_FP_F_F23(a0)
> > +       fsw f24, KVM_ARCH_FP_F_F24(a0)
> > +       fsw f25, KVM_ARCH_FP_F_F25(a0)
> > +       fsw f26, KVM_ARCH_FP_F_F26(a0)
> > +       fsw f27, KVM_ARCH_FP_F_F27(a0)
> > +       fsw f28, KVM_ARCH_FP_F_F28(a0)
> > +       fsw f29, KVM_ARCH_FP_F_F29(a0)
> > +       fsw f30, KVM_ARCH_FP_F_F30(a0)
> > +       fsw f31, KVM_ARCH_FP_F_F31(a0)
> > +       sw t0, KVM_ARCH_FP_F_FCSR(a0)
> > +       csrw CSR_SSTATUS, t2
> > +       ret
> > +
> > +       .align 3
> > +       .global __kvm_riscv_fp_d_save
> > +__kvm_riscv_fp_d_save:
> > +       csrr t2, CSR_SSTATUS
> > +       li t1, SR_FS
> > +       csrs CSR_SSTATUS, t1
> > +       frcsr t0
> > +       fsd f0,  KVM_ARCH_FP_D_F0(a0)
> > +       fsd f1,  KVM_ARCH_FP_D_F1(a0)
> > +       fsd f2,  KVM_ARCH_FP_D_F2(a0)
> > +       fsd f3,  KVM_ARCH_FP_D_F3(a0)
> > +       fsd f4,  KVM_ARCH_FP_D_F4(a0)
> > +       fsd f5,  KVM_ARCH_FP_D_F5(a0)
> > +       fsd f6,  KVM_ARCH_FP_D_F6(a0)
> > +       fsd f7,  KVM_ARCH_FP_D_F7(a0)
> > +       fsd f8,  KVM_ARCH_FP_D_F8(a0)
> > +       fsd f9,  KVM_ARCH_FP_D_F9(a0)
> > +       fsd f10, KVM_ARCH_FP_D_F10(a0)
> > +       fsd f11, KVM_ARCH_FP_D_F11(a0)
> > +       fsd f12, KVM_ARCH_FP_D_F12(a0)
> > +       fsd f13, KVM_ARCH_FP_D_F13(a0)
> > +       fsd f14, KVM_ARCH_FP_D_F14(a0)
> > +       fsd f15, KVM_ARCH_FP_D_F15(a0)
> > +       fsd f16, KVM_ARCH_FP_D_F16(a0)
> > +       fsd f17, KVM_ARCH_FP_D_F17(a0)
> > +       fsd f18, KVM_ARCH_FP_D_F18(a0)
> > +       fsd f19, KVM_ARCH_FP_D_F19(a0)
> > +       fsd f20, KVM_ARCH_FP_D_F20(a0)
> > +       fsd f21, KVM_ARCH_FP_D_F21(a0)
> > +       fsd f22, KVM_ARCH_FP_D_F22(a0)
> > +       fsd f23, KVM_ARCH_FP_D_F23(a0)
> > +       fsd f24, KVM_ARCH_FP_D_F24(a0)
> > +       fsd f25, KVM_ARCH_FP_D_F25(a0)
> > +       fsd f26, KVM_ARCH_FP_D_F26(a0)
> > +       fsd f27, KVM_ARCH_FP_D_F27(a0)
> > +       fsd f28, KVM_ARCH_FP_D_F28(a0)
> > +       fsd f29, KVM_ARCH_FP_D_F29(a0)
> > +       fsd f30, KVM_ARCH_FP_D_F30(a0)
> > +       fsd f31, KVM_ARCH_FP_D_F31(a0)
> > +       sw t0, KVM_ARCH_FP_D_FCSR(a0)
> > +       csrw CSR_SSTATUS, t2
> > +       ret
> > +
> > +       .align 3
> > +       .global __kvm_riscv_fp_f_restore
> > +__kvm_riscv_fp_f_restore:
> > +       csrr t2, CSR_SSTATUS
> > +       li t1, SR_FS
> > +       lw t0, KVM_ARCH_FP_F_FCSR(a0)
> > +       csrs CSR_SSTATUS, t1
> > +       flw f0,  KVM_ARCH_FP_F_F0(a0)
> > +       flw f1,  KVM_ARCH_FP_F_F1(a0)
> > +       flw f2,  KVM_ARCH_FP_F_F2(a0)
> > +       flw f3,  KVM_ARCH_FP_F_F3(a0)
> > +       flw f4,  KVM_ARCH_FP_F_F4(a0)
> > +       flw f5,  KVM_ARCH_FP_F_F5(a0)
> > +       flw f6,  KVM_ARCH_FP_F_F6(a0)
> > +       flw f7,  KVM_ARCH_FP_F_F7(a0)
> > +       flw f8,  KVM_ARCH_FP_F_F8(a0)
> > +       flw f9,  KVM_ARCH_FP_F_F9(a0)
> > +       flw f10, KVM_ARCH_FP_F_F10(a0)
> > +       flw f11, KVM_ARCH_FP_F_F11(a0)
> > +       flw f12, KVM_ARCH_FP_F_F12(a0)
> > +       flw f13, KVM_ARCH_FP_F_F13(a0)
> > +       flw f14, KVM_ARCH_FP_F_F14(a0)
> > +       flw f15, KVM_ARCH_FP_F_F15(a0)
> > +       flw f16, KVM_ARCH_FP_F_F16(a0)
> > +       flw f17, KVM_ARCH_FP_F_F17(a0)
> > +       flw f18, KVM_ARCH_FP_F_F18(a0)
> > +       flw f19, KVM_ARCH_FP_F_F19(a0)
> > +       flw f20, KVM_ARCH_FP_F_F20(a0)
> > +       flw f21, KVM_ARCH_FP_F_F21(a0)
> > +       flw f22, KVM_ARCH_FP_F_F22(a0)
> > +       flw f23, KVM_ARCH_FP_F_F23(a0)
> > +       flw f24, KVM_ARCH_FP_F_F24(a0)
> > +       flw f25, KVM_ARCH_FP_F_F25(a0)
> > +       flw f26, KVM_ARCH_FP_F_F26(a0)
> > +       flw f27, KVM_ARCH_FP_F_F27(a0)
> > +       flw f28, KVM_ARCH_FP_F_F28(a0)
> > +       flw f29, KVM_ARCH_FP_F_F29(a0)
> > +       flw f30, KVM_ARCH_FP_F_F30(a0)
> > +       flw f31, KVM_ARCH_FP_F_F31(a0)
> > +       fscsr t0
> > +       csrw CSR_SSTATUS, t2
> > +       ret
> > +
> > +       .align 3
> > +       .global __kvm_riscv_fp_d_restore
> > +__kvm_riscv_fp_d_restore:
> > +       csrr t2, CSR_SSTATUS
> > +       li t1, SR_FS
> > +       lw t0, KVM_ARCH_FP_D_FCSR(a0)
> > +       csrs CSR_SSTATUS, t1
> > +       fld f0,  KVM_ARCH_FP_D_F0(a0)
> > +       fld f1,  KVM_ARCH_FP_D_F1(a0)
> > +       fld f2,  KVM_ARCH_FP_D_F2(a0)
> > +       fld f3,  KVM_ARCH_FP_D_F3(a0)
> > +       fld f4,  KVM_ARCH_FP_D_F4(a0)
> > +       fld f5,  KVM_ARCH_FP_D_F5(a0)
> > +       fld f6,  KVM_ARCH_FP_D_F6(a0)
> > +       fld f7,  KVM_ARCH_FP_D_F7(a0)
> > +       fld f8,  KVM_ARCH_FP_D_F8(a0)
> > +       fld f9,  KVM_ARCH_FP_D_F9(a0)
> > +       fld f10, KVM_ARCH_FP_D_F10(a0)
> > +       fld f11, KVM_ARCH_FP_D_F11(a0)
> > +       fld f12, KVM_ARCH_FP_D_F12(a0)
> > +       fld f13, KVM_ARCH_FP_D_F13(a0)
> > +       fld f14, KVM_ARCH_FP_D_F14(a0)
> > +       fld f15, KVM_ARCH_FP_D_F15(a0)
> > +       fld f16, KVM_ARCH_FP_D_F16(a0)
> > +       fld f17, KVM_ARCH_FP_D_F17(a0)
> > +       fld f18, KVM_ARCH_FP_D_F18(a0)
> > +       fld f19, KVM_ARCH_FP_D_F19(a0)
> > +       fld f20, KVM_ARCH_FP_D_F20(a0)
> > +       fld f21, KVM_ARCH_FP_D_F21(a0)
> > +       fld f22, KVM_ARCH_FP_D_F22(a0)
> > +       fld f23, KVM_ARCH_FP_D_F23(a0)
> > +       fld f24, KVM_ARCH_FP_D_F24(a0)
> > +       fld f25, KVM_ARCH_FP_D_F25(a0)
> > +       fld f26, KVM_ARCH_FP_D_F26(a0)
> > +       fld f27, KVM_ARCH_FP_D_F27(a0)
> > +       fld f28, KVM_ARCH_FP_D_F28(a0)
> > +       fld f29, KVM_ARCH_FP_D_F29(a0)
> > +       fld f30, KVM_ARCH_FP_D_F30(a0)
> > +       fld f31, KVM_ARCH_FP_D_F31(a0)
> > +       fscsr t0
> > +       csrw CSR_SSTATUS, t2
> > +       ret
> > +#endif
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
