Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C621AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 06:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8d5xkn7oWoJy6CQTBtetCmK6iW0C2+YpGtVNUXMHTLQ=; b=xAkqglA/SvMv57
	qmwtKli+yJz3QRsHCdpjT2L/Sd8cuxI7Sd/Ym6VpH81ALVQpQGiwI+LY4nm9EuJlJ+vVFRAm5SnZ6
	z8Dz+K0ytujLWMwXNbbwxeZtV4yc+OmiSEk43LXO2qiPeSlC8cz/M7F2+YB3RCdKgNeqzWtUQbiD8
	qo9zEK4/iMLybhaxneOWLoIS6hA42w8OMoAyw6DiBkUt1K5znQf8L8xQJb6SwBrYft0K7Or612G3i
	aFC/JcQ+T0pxCq5kSzpyRIMsgpi4UfIfFyKiUod7LmC0FFKQoxCschc6btF7S7RfxcZLlTmNCkoMR
	kBE6mdyVCFkK826b9uxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollom-005lG1-HY; Fri, 21 Oct 2022 06:47:44 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olloj-005lCn-KM
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 06:47:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id r17so4815886eja.7
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 23:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rz8S9MMQRt8zPpvrNpbhX5Tj2i1jjVBTVbkbjHZYyRM=;
        b=WQE6C3Cfh/sF5gQfmupWGacH2Ck1q0VF6PV83R45exfq8m59GATBQ3H7J//jcxkDNp
         G5K4CG+PbOJLrmWYhAR+g8BWQMn5Z6qYhOMx5XVIviGST2E1FHLZZWRKOfmraGsN8XHd
         krPv/COxA8nMYOyAbxPmWNNhNsaAflvIMqNuUzeOjyoFDr/zP8H5j5knuj4YC+8zSA1V
         NIgGclsyH5FaFGXoznhSAUviqAmc+BhFrn5MHPpBta5k8wmZLQKFQWzTj9/adOXgdpUv
         t5GRkqbIHJC+lsgAdGQrVAUeOZcpGxDsSPPuJgzz0mnOxsaT57QFq3vNIdDyas0tI1av
         +Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rz8S9MMQRt8zPpvrNpbhX5Tj2i1jjVBTVbkbjHZYyRM=;
        b=vpt+iRXnZrdivOPCTS9XDHRPBhacZyI68cNyyAb48xKu9vThSNQeUTlTDAt7GvTBzR
         vsVAappA0az27PNkS7WD73tH6ZCAuv7cqBkEzKwqv7PNgHJkJAUwLOvfDdAjxqbS3FJs
         v9Ek9aCYqpIjwIsKdNLRXGlHuOKmLuRfyl49bcvDg6+vJOo1D8v57lnK81vzXB7PovA6
         2tsqY+3Dt94eSS+WbREaMkN8MavR+bzwmiH10cIOQZHENjV8ItN3Ye1XzpQW2SRwvqz/
         pW4jdCr8iHZrJczXHqQDBaF6yRasL6gCsld3qw0q2HcBOacxc1qO25DpFPXrux/NSFNN
         Vpsg==
X-Gm-Message-State: ACrzQf3yZ//jrEKcTpSRCNaSv5reW+u0ZD8eKQZ8QAN7R3OWVloWf+KV
	Q9hLu8wp5RQbgnwD2KamskFaxE2LcZUn+cgGr5DNCw==
X-Google-Smtp-Source: AMsMyM6pQHRPA5JEM3T9CLocnalknf1b06jBC2miJcOeuA6fxx8hkV1pE7MgAVLDnlzbb1EL4XbFpDUSEcapbRUtloI=
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id
 xi8-20020a170906dac800b00741545b796amr13903081ejb.240.1666334857669; Thu, 20
 Oct 2022 23:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221019114535.131469-1-apatel@ventanamicro.com> <CAOnJCUJYQegEa3H+1drGAcy5ptEku9A3gtKWkOm=imC62S4UZw@mail.gmail.com>
In-Reply-To: <CAOnJCUJYQegEa3H+1drGAcy5ptEku9A3gtKWkOm=imC62S4UZw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Oct 2022 12:17:25 +0530
Message-ID: <CAAhSdy0B-4JobSVUP9-CPZiSu4UBYUrvxmyVjEE--O5Fb6V_Ew@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_234741_678524_D6E92C2F 
X-CRM114-Status: GOOD (  23.74  )
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

On Fri, Oct 21, 2022 at 11:34 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Oct 19, 2022 at 4:45 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The kvm_riscv_vcpu_timer_pending() checks per-VCPU next_cycles
> > and per-VCPU software injected VS timer interrupt. This function
> > returns incorrect value when Sstc is available because the per-VCPU
> > next_cycles are only updated by kvm_riscv_vcpu_timer_save() called
> > from kvm_arch_vcpu_put(). As a result, when Sstc is available the
> > VCPU does not block properly upon WFI traps.
> >
> > To fix the above issue, we introduce kvm_riscv_vcpu_timer_sync()
> > which will update per-VCPU next_cycles upon every VM exit instead
> > of kvm_riscv_vcpu_timer_save().
> >
> > Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
> >  arch/riscv/kvm/vcpu.c                   |  3 +++
> >  arch/riscv/kvm/vcpu_timer.c             | 17 +++++++++++++++--
> >  3 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
> > index 0d8fdb8ec63a..82f7260301da 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_timer.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
> > @@ -45,6 +45,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
> >  int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_guest_timer_init(struct kvm *kvm);
> > +void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
> >  bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a032c4f0d600..71ebbc4821f0 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -708,6 +708,9 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
> >                                 clear_bit(IRQ_VS_SOFT, &v->irqs_pending);
> >                 }
> >         }
> > +
> > +       /* Sync-up timer CSRs */
> > +       kvm_riscv_vcpu_timer_sync(vcpu);
> >  }
> >
> >  int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
> > diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> > index 185f2386a747..ad34519c8a13 100644
> > --- a/arch/riscv/kvm/vcpu_timer.c
> > +++ b/arch/riscv/kvm/vcpu_timer.c
> > @@ -320,20 +320,33 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
> >         kvm_riscv_vcpu_timer_unblocking(vcpu);
> >  }
> >
> > -void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
> > +void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
> >  {
> >         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> >
> >         if (!t->sstc_enabled)
> >                 return;
> >
> > -       t = &vcpu->arch.timer;
> >  #if defined(CONFIG_32BIT)
> >         t->next_cycles = csr_read(CSR_VSTIMECMP);
> >         t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
> >  #else
> >         t->next_cycles = csr_read(CSR_VSTIMECMP);
> >  #endif
> > +}
> > +
> > +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
> > +{
> > +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> > +
> > +       if (!t->sstc_enabled)
> > +               return;
> > +
> > +       /*
> > +        * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
> > +        * upon every VM exit so no need to save here.
> > +        */
> > +
> >         /* timer should be enabled for the remaining operations */
> >         if (unlikely(!t->init_done))
> >                 return;
> > --
> > 2.34.1
> >
>
> Ahh. That's a tricky one. Thanks for fixing it.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Thanks, queued this patch for Linux-6.1-rcX

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
