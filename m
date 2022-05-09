Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15178C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJAF7F0aKQw0sCYtDnSi+4uq4dd9K/5fLSdHbsrvmkU=; b=3N27pDCLdFA/az
	MZn/gUVuaPxN7oqGwmr4fiD+baxbYLqV51vPv5MS0694As3APjHQzVOkhhUSKYJPr+CGyzPSbLXBq
	Aul3HfiAM0hZpLV5pQ7p6LjeFa8SGh79QDxeNlqAuhNsaCqis3yg49C4/Bd+0FnTxdEtRFNp7CQKw
	1K7GC+A05A/R2+H3uMJMh8EFhzVC4sJxfSkWUprcre9we+Ig+RORjmi/PHrwUWj6YjurKvGGQ/Lfd
	CrqnLuf+WitsUKknxyHfaqp93fb4H5+VJrsT8wexGT9LTUcC9/grX+SJmwHhdqF0RP17LZYg2dKBT
	SgThHioEjPMgHK794lEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnw0F-00CWvz-Bd; Mon, 09 May 2022 05:32:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnw0C-00CWuA-Ob
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:32:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 r1-20020a1c2b01000000b00394398c5d51so7597182wmr.2
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LcfykvzzxOiiw+jUTB5oG4jSYC/kWrfsWiX4vYPyo9M=;
 b=kcIUmvvtYBneIxYWYiv7+ZFh4noeZ8Am8LxJbwy0tzXZr9y8d+KI/QsxlJYsuNmM08
 OGVALXNd+CoIDFW0iCeuANfBqIyQS40FLvfNaMi065NgKl77XGww480iffDwl6iePFnE
 /vJB/ZxTrHlkneSUP3qUDzxPQAp3k9HVD/gzvdtZ1VCKGBwXgKM82C1otDJIg0CsWkjK
 vsabX+kfPaNfmRig6dYdjkMY9DINlp5EnFbw/ugfF3n9ZVJn+hGULwm5aCit+DiPEilU
 PCSa4bC99EGefh/P+fD5m0E04J6FnoNl2PNtaY0heLJiAHpFynaawAWRjO/PVQgC5jjR
 TvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LcfykvzzxOiiw+jUTB5oG4jSYC/kWrfsWiX4vYPyo9M=;
 b=Sx6xq/X4S84uuVsQBOZH9CeBkJ+eICrtpXTpK809UgCPr8VZNhVBSB/F4UHgasP679
 Qsk2xPjSDS43/NkPkcl4JVK0+yExrXNOaCANTRak9sUKQDa/RweoBMbqngwZ3VlJjVFL
 ONB2tgd0u6lZDpr/ZKl0a4VuwPVcwCx/ERplEMlshlFPFoJAbAaAuMixwZR0Wlba1Fyc
 QA05fsY0fsVaVBWaNztj6ardQ+7vby9D8N9eND63OX4vYrCcNZkWiVjVYBLz4YevIG8/
 T3vRD4J+1GuyIb3om7H7pLB1RRgjBsvltMl9RPvzqFbTXKTM/JYwZrNW96nJlyDM1kNj
 TKQQ==
X-Gm-Message-State: AOAM531G8lsCvOWKjrzJwGNXFqNh24VtC2O4NBW5C9DMposteXw5GCqq
 olfz099rfX8tZ2Ktd3srHrww9zHkb8K3dVEu0AErpA==
X-Google-Smtp-Source: ABdhPJxcZ1/tgNOui63k7ToPoh6qdNSpLhheGOV0wgT4W9krBezLdETiXX52tCZksOb5ycmvbLFkw5ri8O5JCMC9+GA=
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id
 bg42-20020a05600c3caa00b003948fb80716mr3550006wmb.105.1652074328778; Sun, 08
 May 2022 22:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-3-apatel@ventanamicro.com>
 <CAOnJCUJ3KzJdqLa3zXUd+YEa00_W1P7aNWY0ibpvO9jaqarOtA@mail.gmail.com>
In-Reply-To: <CAOnJCUJ3KzJdqLa3zXUd+YEa00_W1P7aNWY0ibpvO9jaqarOtA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:01:57 +0530
Message-ID: <CAAhSdy1gyJekSvUtZ6TQutTryGATupjP3YEzEts-QJ_DifJVjw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: KVM: Add Sv57x4 mode support for G-stage
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
X-CRM114-CacheID: sfid-20220508_223212_831413_9ED09952 
X-CRM114-Status: GOOD (  19.56  )
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

On Wed, May 4, 2022 at 7:44 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Latest QEMU supports G-stage Sv57x4 mode so this patch extends KVM
> > RISC-V G-stage handling to detect and use Sv57x4 mode when available.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/csr.h |  1 +
> >  arch/riscv/kvm/main.c        |  3 +++
> >  arch/riscv/kvm/mmu.c         | 11 ++++++++++-
> >  3 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index e935f27b10fd..cc40521e438b 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -117,6 +117,7 @@
> >  #define HGATP_MODE_SV32X4      _AC(1, UL)
> >  #define HGATP_MODE_SV39X4      _AC(8, UL)
> >  #define HGATP_MODE_SV48X4      _AC(9, UL)
> > +#define HGATP_MODE_SV57X4      _AC(10, UL)
> >
> >  #define HGATP32_MODE_SHIFT     31
> >  #define HGATP32_VMID_SHIFT     22
> > diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> > index c374dad82eee..1549205fe5fe 100644
> > --- a/arch/riscv/kvm/main.c
> > +++ b/arch/riscv/kvm/main.c
> > @@ -105,6 +105,9 @@ int kvm_arch_init(void *opaque)
> >         case HGATP_MODE_SV48X4:
> >                 str = "Sv48x4";
> >                 break;
> > +       case HGATP_MODE_SV57X4:
> > +               str = "Sv57x4";
> > +               break;
> >         default:
> >                 return -ENODEV;
> >         }
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index dc0520792e31..8823eb32dcde 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -751,14 +751,23 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
> >  void kvm_riscv_gstage_mode_detect(void)
> >  {
> >  #ifdef CONFIG_64BIT
> > +       /* Try Sv57x4 G-stage mode */
> > +       csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> > +       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
> > +               gstage_mode = (HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> > +               gstage_pgd_levels = 5;
> > +               goto skip_sv48x4_test;
> > +       }
> > +
> >         /* Try Sv48x4 G-stage mode */
> >         csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
> >         if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
> >                 gstage_mode = (HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
> >                 gstage_pgd_levels = 4;
> >         }
> > -       csr_write(CSR_HGATP, 0);
> > +skip_sv48x4_test:
> >
> > +       csr_write(CSR_HGATP, 0);
> >         __kvm_riscv_hfence_gvma_all();
> >  #endif
> >  }
> > --
> > 2.25.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.19

Thanks,
Anup

>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
