Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A1DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 04:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4oMv78k+AWiZGFnveNCnf7W2jHPb60QtL8cye88ir8=; b=Jxoozogf09w137
	8LQHaRH/5IipH54AHrSJJW7jALzP3U4k6oOan/JUcGb1cDwneJj7IthcWcLQPwnnUZTKibp8lApqU
	yiW8FWwAhd4io/nOsnRZp37l84p252dgOFIY+gHUbKGx1I8S/I0TnpatKZo4gAKuAsELmHItNHv5s
	JOlQxV2rVUZotHW6idg32dYUGzx0aawgiihmPXUJk9zeAj6Nb2tWLihv7WMSGxnI7cbsNBMGJ0o9q
	BccsykjYm22O96zWOKBh5jOuZpvSVSh7uNxf7i6XUHQ3tAG7vfp8V7kvv1EyHQ6yH6O0sIPk1y40h
	itXqi2VKJFqKMf3MUyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDI2n-00ApKB-6o; Mon, 18 Jul 2022 04:07:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDI2l-00ApIo-8f
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 04:07:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r14so15294145wrg.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 21:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HHoY7kVryiChr5cJFDSaFpXhijBDuPWIwQr/N0jnjFo=;
        b=qtaN6WcM7juIy+n1eFrV7mazTFqzvLWTIBqtGrqh9fUUTz89/1F1Ps6gSAq0qbntIl
         HR0NdANXG7QVJ15000c4yJwY4aEOJeWWaZgTdi7QwfejvWE2/OiZrzlgGWtRU4txCSZ5
         +cIb1kW9R3JWRvtBRbbJhuIZ5+jcRx60qDrmXwZBVGXOmDt64JGJjoLIrFKkLQhaufuf
         yvxDoJ12zqmZU6WLqy9mPWj+A4sgGfGfJAbBux6jeGNlG3nHThIq1F+U/DOddBa2ufZN
         iuV4eWst2h0BrJ4Q0p2YTubNC1EItG7sXU00T78E0eCWCON1qEUL3PqoegYJH+IVy4Ek
         y3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HHoY7kVryiChr5cJFDSaFpXhijBDuPWIwQr/N0jnjFo=;
        b=4PlCK8ACQ4sO3MrVE+zQzxEIl8u+fzMqxtZmQIGXQlzbqK76CmdxEjnZDDfQeDcRD0
         sG9kKGt2HKby2qQvVufe0b1R3uOOzBYLmDeVvmnnkX0B7uY4ZSTAkEOzV38fojdVw6rh
         0qYlk2LnjtUWWCBDttuYV72k5nZhT8qa7xAxZeSa9U2Gh9LRTEiUtH+k8cVdagpe4T76
         Wmt+2WkQVthpX8iolgx+hyLiWZPzjOZ+sFz4SsgCvadHIui/Ua6zmKap5rBSkYJ9OCXJ
         FPKeclNlOPRvTADys0JO/iUeHiJleDhY8F/r1tLGIZvrwUw+3HlJSUuN4gW5U+sfUKk0
         t/FA==
X-Gm-Message-State: AJIora9L51wF6aD+gjUYS2Cn4u4ztNEryWwu2IZv7VVp2f0KTPfv42R0
	4euS19Lt08MDI+IYVlGDOtQM/bAiTsWJwUzy7Lf0lA==
X-Google-Smtp-Source: AGRyM1uKbstJceqt8c2FHpo0Az/jpgVPPoiGgGAw/fVKmIhoRiki2Fa/Vb0smtxy8qPA9Z7YWzcYqUAIqOIDXYBQ7io=
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr20978506wrp.86.1658117257348; Sun, 17
 Jul 2022 21:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com>
 <20220707145248.458771-6-apatel@ventanamicro.com> <CAOnJCU+H_inpUj1EuvqEYx41iEguCdcC4B3Lr9TWdo+aFhFNAA@mail.gmail.com>
In-Reply-To: <CAOnJCU+H_inpUj1EuvqEYx41iEguCdcC4B3Lr9TWdo+aFhFNAA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:37:25 +0530
Message-ID: <CAAhSdy2cWnFTRTM3B5e2Ym8=oFiq1ScZwYeDTmWGthU-hZvmWg@mail.gmail.com>
Subject: Re: [PATCH 5/5] RISC-V: KVM: Add support for Svpbmt inside Guest/VM
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_210739_313186_34E184CF 
X-CRM114-Status: GOOD (  22.88  )
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

On Wed, Jul 13, 2022 at 6:54 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The Guest/VM can use Svpbmt in VS-stage page tables when allowed by the
> > Hypervisor using the henvcfg.PBMTE bit.
> >
> > We add Svpbmt support for the KVM Guest/VM which can be enabled/disabled
> > by the KVM user-space (QEMU/KVMTOOL) using the ISA extension ONE_REG
> > interface.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
> >  arch/riscv/include/uapi/asm/kvm.h |  1 +
> >  arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 6d85655e7edf..17516afc389a 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -156,6 +156,18 @@
> >                                  (_AC(1, UL) << IRQ_S_TIMER) | \
> >                                  (_AC(1, UL) << IRQ_S_EXT))
> >
> > +/* xENVCFG flags */
> > +#define ENVCFG_STCE                    (_AC(1, ULL) << 63)
> > +#define ENVCFG_PBMTE                   (_AC(1, ULL) << 62)
> > +#define ENVCFG_CBZE                    (_AC(1, UL) << 7)
> > +#define ENVCFG_CBCFE                   (_AC(1, UL) << 6)
> > +#define ENVCFG_CBIE_SHIFT              4
> > +#define ENVCFG_CBIE                    (_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
> > +#define ENVCFG_CBIE_ILL                        _AC(0x0, UL)
> > +#define ENVCFG_CBIE_FLUSH              _AC(0x1, UL)
> > +#define ENVCFG_CBIE_INV                        _AC(0x3, UL)
> > +#define ENVCFG_FIOM                    _AC(0x1, UL)
> > +
> >  /* symbolic CSR names: */
> >  #define CSR_CYCLE              0xc00
> >  #define CSR_TIME               0xc01
> > @@ -252,7 +264,9 @@
> >  #define CSR_HTIMEDELTA         0x605
> >  #define CSR_HCOUNTEREN         0x606
> >  #define CSR_HGEIE              0x607
> > +#define CSR_HENVCFG            0x60a
> >  #define CSR_HTIMEDELTAH                0x615
> > +#define CSR_HENVCFGH           0x61a
> >  #define CSR_HTVAL              0x643
> >  #define CSR_HIP                        0x644
> >  #define CSR_HVIP               0x645
> > @@ -264,6 +278,8 @@
> >  #define CSR_MISA               0x301
> >  #define CSR_MIE                        0x304
> >  #define CSR_MTVEC              0x305
> > +#define CSR_MENVCFG            0x30a
> > +#define CSR_MENVCFGH           0x31a
> >  #define CSR_MSCRATCH           0x340
> >  #define CSR_MEPC               0x341
> >  #define CSR_MCAUSE             0x342
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 6119368ba6d5..24b2a6e27698 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >         KVM_RISCV_ISA_EXT_H,
> >         KVM_RISCV_ISA_EXT_I,
> >         KVM_RISCV_ISA_EXT_M,
> > +       KVM_RISCV_ISA_EXT_SVPBMT,
> >         KVM_RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 6dd9cf729614..b7a433c54d0f 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -51,6 +51,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >         RISCV_ISA_EXT_h,
> >         RISCV_ISA_EXT_i,
> >         RISCV_ISA_EXT_m,
> > +       RISCV_ISA_EXT_SVPBMT,
> >  };
> >
> >  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> > @@ -777,6 +778,19 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
> >         return -EINVAL;
> >  }
> >
> > +static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> > +{
> > +       u64 henvcfg = 0;
> > +
> > +       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
> > +               henvcfg |= ENVCFG_PBMTE;
> > +
> > +       csr_write(CSR_HENVCFG, henvcfg);
> > +#ifdef CONFIG_32BIT
> > +       csr_write(CSR_HENVCFGH, henvcfg >> 32);
> > +#endif
> > +}
> > +
> >  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >  {
> >         struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> > @@ -791,6 +805,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >         csr_write(CSR_HVIP, csr->hvip);
> >         csr_write(CSR_VSATP, csr->vsatp);
> >
> > +       kvm_riscv_vcpu_update_config(vcpu->arch.isa);
> > +
> >         kvm_riscv_gstage_update_hgatp(vcpu);
> >
> >         kvm_riscv_vcpu_timer_restore(vcpu);
> > --
> > 2.34.1
> >
>
> LGTM.
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>

Queued this patch for 5.20.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
