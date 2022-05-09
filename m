Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46198C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSNAExP8rD9zx3Tlae9bOxemW+uBQRh0+uTmRfF59+M=; b=g2W2FdeVgARENh
	qTpo0Q0A2+HK69gzZiBW38vEdGeVeZGnhJDBlT/tUFgdZSGSxOjLum7xt9fr2AAHvNzcFo4RCc2km
	sNGOAGPFbH8VYAcezDc/oDW4l3QxqJ3pBLeemV9BjKtmbJxlXvQhFRWSwP6aNV8q0/mMlxGZqHyCE
	LmJgdOldixDAyE6BCK1Gx4HZ9AJtQI2UnLIjicg3qT/sL+4iXOK+f9pioxa9bDL9zABcZnc/Anvmk
	n7Id3lNH0GlM4S1By2NeO074x+YG7OOT2rqxXeqYN5B2lBvB/IneUzaWJ7kbTrIEX2r0mU51LD4G4
	ruNnndAlUt29f3Hunqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnw0c-00CWzw-P2; Mon, 09 May 2022 05:32:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnw0a-00CWyh-4M
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:32:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u3so17817799wrg.3
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtVlY+C8hBffv2WPWsAMedVX+O+Qs5k+jY37q9IS2fI=;
 b=0vsykZ6evwtInjYhpdg1T3hdzuqsT6eE8R38QmPbmqijiPuhM+01C1O3V6PEv8x1td
 4mWBAFpOgYgyila+zVnf5YjPy9YR37wmU1+LZde6kEOTD1xtW1GukTWOElwTGFT3c28V
 mBR0gJjrJmOE2Ml8f5MgvGUNNZQdDAp/et0x9ddlnz+p+i74yUPBB+8ldCkkb8sVEgkF
 YAxP1zmD2GXOZLOYcwz3jgZj/4ZAmPib00IQhCemqwIoOO2qpTaI1CBsC3hzYzr0M9XH
 J1znsFDFy2BZU6ctDL6CVlD5z/LAzhU5Uxh7wd7GJ5B+d/Dge1CbcsAR69slnGd81vE1
 oyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtVlY+C8hBffv2WPWsAMedVX+O+Qs5k+jY37q9IS2fI=;
 b=xqT2EHajps20j75m7M1L7oxqJgxcotdRe5GFSMOAUGBSvEOmmSEl74E16pxFOAKqGo
 HlQG9Bibf4KON22f2UqYs9WztcOU+dP6mkjr0R+S8Scrf3HGcyNO3FANvT235/3C6V2/
 AJyKMF28vOjDq9FP+fvKtTdECV/i1B9A3y6DwTNbKXE8E4R9259d2mLMRtUQeW0xL4lx
 khm9Dx6y09QGp8ylkFo1K7ymw1fkPQ1d+4S6BkKahwZZxxg9ELLhbnrJzvc4OrNt+EFO
 Cjuje7kRh2Y7r5Zx2GiPRy+qz/bTwYMwXl6Is8qXO0lCq8x3agYuf3fn1yUamS+w4PPI
 Bx7A==
X-Gm-Message-State: AOAM5316KCwAYoYLnSTwWz9vcQYvXZzEPYPChBMu94u0uKh6xgA9Zu7G
 1H35J0GuJkiiz/aNeU2j75NJrD8ZoBISIUfV2uuTGQ==
X-Google-Smtp-Source: ABdhPJy1pZWq2QSk+ODRo0bbjzB7ThwjgRWpktjes5LTN4O1ngkJ3gctzS/rpBEs6nAGoo+eF0WjnQT4pwOPU56k0Mw=
X-Received: by 2002:a05:6000:799:b0:20c:6e3c:a28c with SMTP id
 bu25-20020a056000079900b0020c6e3ca28cmr12234422wrb.346.1652074353208; Sun, 08
 May 2022 22:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-4-apatel@ventanamicro.com>
 <CAOnJCU+sDbJERnrcTUiLowvpfRDJ=-YPkc2dxzbfsD+qFBMUKw@mail.gmail.com>
In-Reply-To: <CAOnJCU+sDbJERnrcTUiLowvpfRDJ=-YPkc2dxzbfsD+qFBMUKw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:02:21 +0530
Message-ID: <CAAhSdy281_AgjQyUXLfF8ZP2SXpyKGVd68XwVEGuQVFoz16_3g@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] RISC-V: KVM: Treat SBI HFENCE calls as NOPs
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
X-CRM114-CacheID: sfid-20220508_223236_208215_B2F941AC 
X-CRM114-Status: GOOD (  18.01  )
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
> > We should treat SBI HFENCE calls as NOPs until nested virtualization
> > is supported by KVM RISC-V. This will help us test booting a hypervisor
> > under KVM RISC-V.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu_sbi_replace.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> > index 0f217365c287..3c1dcd38358e 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> > @@ -117,7 +117,11 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> > -       /* TODO: implement for nested hypervisor case */
> > +               /*
> > +                * Until nested virtualization is implemented, the
> > +                * SBI HFENCE calls should be treated as NOPs
> > +                */
> > +               break;
> >         default:
> >                 ret = -EOPNOTSUPP;
> >         }
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
