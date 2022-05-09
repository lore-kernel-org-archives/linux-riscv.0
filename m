Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B83CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukeNwGRQWohf4gVJh3D95qfzmtg/aoXHSrkWAHapKcE=; b=JLMPuv0AG8jzmE
	4PuPsfj38P0c+B3itnI24d1cT6PSJROhDbCYtXv/tiQTa5t0ehR2zZtkZFXDBvb3XFoJHFTu+mlNS
	Jc8+F1J8jrjiB+wxNvwI0MP84ChV/VCewX9l+p8ORk61oACDHHwdSvaIsoure2htszUQHlO2bfASD
	a4eQSUwaOFo8KnaWPGWAr/SenVgmQRBUSYpcEMiAbBJx2SSsMHY3LJOOFwEhq4JcTjD9BTbQ7ov/z
	XKNkF7A2PBVZQxOoVv8Wv7ImtRqb/Tt/vXl7TaFpLSMn1b5IaN2Y4xM/YIcgAp5u2iE6cqDfAKWdS
	rxlIRiymVmZ0wpFJUVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnw2k-00CXUO-NT; Mon, 09 May 2022 05:34:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnw2i-00CXSN-6t
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:34:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so7601144wmn.1
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZM78wIZ6JLMPND7Ht3IA1Mgf/xPFUerHdSHdeZPHpFw=;
 b=Rkns/KQugvEQmGsLLnfc60vj1l7V5wIkMGSPjxpCBigi+ckpY7MB9HM9yCG+ypQkhG
 pWxETVX5ZTxLiddk/JMOIIhnbLZH4vd805xOKIzmPBv5dkPeSEsmm5E//LXP8fQ2W1Es
 SiJKseZWMb4bbTNnDEm1aYChw5QX9PEO1kMgtH1SE09LD/28GI0WSAZG5cNQNKR1Q2JO
 GR+FtIOxEqsmcnM9AcbjvZ7a5VzK/sk0Lw43s5qVzf64RMfv13eCm35YG63rGQzJgXNa
 PZThzfS6C5Rdu8U1+I0gUfjyU4KtBflnnSicfKSMuSQzv8dhmPISS28YcMN9XJwEAbW0
 CA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZM78wIZ6JLMPND7Ht3IA1Mgf/xPFUerHdSHdeZPHpFw=;
 b=4WB8WvowzVp0/V+Sd9R+d3oZJPW95nXnLVL6php37MhG6hUVpMh2DCFg7bbg9Y+yoy
 62Bs8LFC7Fz2QlY9wTMYC1+T9Q09m+IwZnAsdq6kKMXdaCI2OUT8Mf4J9FFTuwkhJoa7
 SFDNYedOUtZGRYLvqkmeteRYACXMF6kNar0V88cnf9GagKiS9fKYTnGrK1nV/mAns3DH
 hAyEuZC9JGYmyl7SM/4adfGMmKcql43ouDgn4vcHPO2kQxRnzMI3HxB7pma6DYREC6hN
 6/hOle9aRoUugNELooEZsDJIPsRa+/BkBtMvYDwEp/Vrw7WD7eQXdVu4ivNov6OXJVYL
 32kw==
X-Gm-Message-State: AOAM531ItLJxNDnzg/3PVF7Cc1CenoBPRITn6odwsFri+QwvCiI86eFL
 /HK4RLJGJrjYHcCuiiaHOGtZ85uRritEmYDhxACzjQ==
X-Google-Smtp-Source: ABdhPJx+XJja9QmJ3YmL5ZIcR7cEiHctbogPUidPX/ngHjqaF6Vs9HvPRSruYhOOLnu79JRJ91pGoIl9sM+wQ1uUUt4=
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr11044954wms.93.1652074484181; Sun, 08
 May 2022 22:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-8-apatel@ventanamicro.com>
 <CAOnJCUKPTwjGr9Lg1XRMVTCMswg0E+4VvknBQ0p+Qo6EHL3M5A@mail.gmail.com>
In-Reply-To: <CAOnJCUKPTwjGr9Lg1XRMVTCMswg0E+4VvknBQ0p+Qo6EHL3M5A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:04:32 +0530
Message-ID: <CAAhSdy0QxZ7kfh34DO_mPuCbXUM6Use7XT-TSpayR1B3BEU3tg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] RISC-V: KVM: Cleanup stale TLB entries when host
 CPU changes
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_223448_276439_73E6FA92 
X-CRM114-Status: GOOD (  24.13  )
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

On Fri, May 6, 2022 at 1:23 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On RISC-V platforms with hardware VMID support, we share same
> > VMID for all VCPUs of a particular Guest/VM. This means we might
> > have stale G-stage TLB entries on the current Host CPU due to
> > some other VCPU of the same Guest which ran previously on the
> > current Host CPU.
> >
> > To cleanup stale TLB entries, we simply flush all G-stage TLB
> > entries by VMID whenever underlying Host CPU changes for a VCPU.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h |  5 +++++
> >  arch/riscv/kvm/tlb.c              | 23 +++++++++++++++++++++++
> >  arch/riscv/kvm/vcpu.c             | 11 +++++++++++
> >  3 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index a40e88a9481c..94349a5ffd34 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -166,6 +166,9 @@ struct kvm_vcpu_arch {
> >         /* VCPU ran at least once */
> >         bool ran_atleast_once;
> >
> > +       /* Last Host CPU on which Guest VCPU exited */
> > +       int last_exit_cpu;
> > +
> >         /* ISA feature bits (similar to MISA) */
> >         unsigned long isa;
> >
> > @@ -256,6 +259,8 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
> >                                      unsigned long order);
> >  void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
> >
> > +void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
> > +
> >  void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
> > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > index c0f86d09c41d..1a76d0b1907d 100644
> > --- a/arch/riscv/kvm/tlb.c
> > +++ b/arch/riscv/kvm/tlb.c
> > @@ -215,6 +215,29 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
> >         csr_write(CSR_HGATP, hgatp);
> >  }
> >
> > +void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> > +{
> > +       unsigned long vmid;
> > +
> > +       if (!kvm_riscv_gstage_vmid_bits() ||
> > +           vcpu->arch.last_exit_cpu == vcpu->cpu)
> > +               return;
> > +
> > +       /*
> > +        * On RISC-V platforms with hardware VMID support, we share same
> > +        * VMID for all VCPUs of a particular Guest/VM. This means we might
> > +        * have stale G-stage TLB entries on the current Host CPU due to
> > +        * some other VCPU of the same Guest which ran previously on the
> > +        * current Host CPU.
> > +        *
> > +        * To cleanup stale TLB entries, we simply flush all G-stage TLB
> > +        * entries by VMID whenever underlying Host CPU changes for a VCPU.
> > +        */
> > +
> > +       vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> > +       kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> > +}
> > +
> >  void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
> >  {
> >         local_flush_icache_all();
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 9cd8f6e91c98..a86710fcd2e0 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -67,6 +67,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
> >         if (loaded)
> >                 kvm_arch_vcpu_put(vcpu);
> >
> > +       vcpu->arch.last_exit_cpu = -1;
> > +
> >         memcpy(csr, reset_csr, sizeof(*csr));
> >
> >         memcpy(cntx, reset_cntx, sizeof(*cntx));
> > @@ -735,6 +737,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
> >  {
> >         guest_state_enter_irqoff();
> >         __kvm_riscv_switch_to(&vcpu->arch);
> > +       vcpu->arch.last_exit_cpu = vcpu->cpu;
> >         guest_state_exit_irqoff();
> >  }
> >
> > @@ -829,6 +832,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >                         continue;
> >                 }
> >
> > +               /*
> > +                * Cleanup stale TLB enteries
> > +                *
> > +                * Note: This should be done after G-stage VMID has been
> > +                * updated using kvm_riscv_gstage_vmid_ver_changed()
> > +                */
> > +               kvm_riscv_local_tlb_sanitize(vcpu);
> > +
> >                 guest_timing_enter_irqoff();
> >
> >                 kvm_riscv_vcpu_enter_exit(vcpu);
> > --
> > 2.25.1
> >
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.19

Thanks,
Anup

> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
