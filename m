Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED631C54EBE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3SefVpcQvszuMlNSJ3Lj2h1jRtQF2ELCr+Md1xEjRQ=; b=5CnQ1Rt0Oxwh8I
	lkhFbEDpBuZ0eDwZg+yLGP/4RHNG+8IqVejN1xtlzeZSnafQp6QOW05DlJqiB1kL4VT6XT5yTRhfP
	v+lGSwWN1BttPLxEgOHb8pCuG9b14ZI0JurKw25trkOYqlC9UHK6gvUVu0Bs592wA8MB3mQ5UAHsR
	lP/iLJ+slqOSDo5JIVgNitsOTeeRfrfrzIlRG2nKyplfS4fOnaNI2Tx5nkY4ZAf77oBMwaHkBqYuV
	sQ3f55uMut9Eb64anfN3x0p5aMHc+cJRzO1iQv0Q36RhjYjMYhoait/81hhg2fUCvAwb/iPxFy7iL
	lTH4aWhigXWEaDDiD2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2BF-00GHGe-RK; Thu, 12 Jan 2023 18:20:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2BD-00GHFP-26
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 18:20:00 +0000
Received: by mail-pg1-x532.google.com with SMTP id 141so13371762pgc.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 10:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XqZSkBjF0/NwCudxK7VyjrIpDSZ4UaVvor7D5Au+9I=;
        b=Nss6QjOj2gWAnAUZSZ/Om/bvUd0ReXJo7t3e+0oHUVC0Dcr0a+a15NlUkN1pPkdNjI
         xqJouLOLu6WulABRRjr2EE8ABIhfopSfsqApSd3bBpqeKqcWQknlDmtwAnudN+zJ7Y0O
         tCQIhs+JofA7eoEN2kcocsbiz/R/AazVdN0xuYpe8+2yWT7P78IqnNkOWsgwnC05suE+
         Teec6JjBKNr3pGUiteMTH1/5Aprxv2ExecE4R5B/AThLZaTlT1/9bTMPaBNaJ1E47PbW
         SWrrj+6IYPGVrdXP9Mi9zdenICE6ibCfm4uO8gdqzKJo8G2C5yU2z34+JDcT3YVdMnoT
         USXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XqZSkBjF0/NwCudxK7VyjrIpDSZ4UaVvor7D5Au+9I=;
        b=cLxliqobwXh5kTW1+Sw0vKCpFWHY65LdQVVlbTH9NYH771vvuhA9vFI6HPVyZTa/Nl
         4oW6K5KExkiS9m9tVA2dZl2P5XCPWyoG3+arAU2Wg0vxMyloY/rWNSIazxoEdSWL6mbq
         xbucHozXmOBBRlZPLUOuYwfY9HtB/4E7d4Ktj9NMZ/u+C8o1lFPkwgNAmMKU71cuLlQp
         MyUmMi7qwIktiB95qRdSma4R4Oq4jmYvWEhbNWU3JtVgydQlce86xopzsDRKLWfGIVEM
         DEROaHuD84SQTPgkmEOJNHUPZ1M1iETQnzugGdcMROTkYl1HO7xCb1oDPVy9r/y2TBXK
         eqAQ==
X-Gm-Message-State: AFqh2kqGYmHA77Ajr+x5Rk6m0MGX98UeQvM5OafhyngcK3wqspQfyG3H
	U0UdN4Oh/CvXI2oyBxqgDoR7aLTX1lG5PmxQkNFJsw==
X-Google-Smtp-Source: AMrXdXsMZYU+ot9pUjM6sBfBWlHRs5OKPeSzQPbNaLx2GTCzg8mr/58dc6ua+GqpoYiouuO1ycmVhn1xvGW01o0l2Ac=
X-Received: by 2002:a63:d14a:0:b0:479:5a45:6d32 with SMTP id
 c10-20020a63d14a000000b004795a456d32mr3854918pgj.138.1673547597227; Thu, 12
 Jan 2023 10:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-3-atishp@rivosinc.com>
 <20230112102141.chpcqzoko25s2cak@orel>
In-Reply-To: <20230112102141.chpcqzoko25s2cak@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 Jan 2023 10:19:46 -0800
Message-ID: <CAHBxVyG0mmVJDg0MUG0FMhQM11xrk6dTw9Hc1YntVE+9qdbfOg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] RISC-V: KVM: Define a probe function for SBI
 extension data structures
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Eric Lin <eric.lin@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_101959_107469_CC6D262B 
X-CRM114-Status: GOOD (  28.09  )
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

On Thu, Jan 12, 2023 at 2:21 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Dec 15, 2022 at 09:00:37AM -0800, Atish Patra wrote:
> > Currently the probe function just checks if an SBI extension is
> > registered or not. However, the extension may not want to advertise
> > itself depending on some other condition.
> > An additional extension specific probe function will allow
> > extensions to decide if they want to be advertised to the caller or
> > not. Any extension that does not require additional dependency checks
> > can avoid implementing this function.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
> >  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > index f79478a..61dac1b 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
> >       int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                      unsigned long *out_val, struct kvm_cpu_trap *utrap,
> >                      bool *exit);
> > +
> > +     /* Extension specific probe function */
> > +     unsigned long (*probe)(struct kvm_vcpu *vcpu, unsigned long extid);
>
> It doesn't seem like the extid parameter should be necessary since the
> probe function is specific to the extension, but it doesn't hurt either.
>

Yeah. You are correct. I will drop it. Thanks.

> >  };
> >
> >  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> > diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> > index 5d65c63..89e2415 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_base.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> > @@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  {
> >       int ret = 0;
> >       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > +     const struct kvm_vcpu_sbi_extension *sbi_ext;
> >
> >       switch (cp->a6) {
> >       case SBI_EXT_BASE_GET_SPEC_VERSION:
> > @@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                        */
> >                       kvm_riscv_vcpu_sbi_forward(vcpu, run);
> >                       *exit = true;
> > -             } else
> > -                     *out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> > +             } else {
> > +                     sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> > +                     if (sbi_ext) {
> > +                             if (sbi_ext->probe)
> > +                                     *out_val = sbi_ext->probe(vcpu, cp->a0);
> > +                             else
> > +                                     *out_val = 1;
> > +                     } else
> > +                             *out_val = 0;
> > +             }
> >               break;
> >       case SBI_EXT_BASE_GET_MVENDORID:
> >               *out_val = vcpu->arch.mvendorid;
> > --
> > 2.25.1
> >
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
