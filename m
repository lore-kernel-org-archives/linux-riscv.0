Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971CBC54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMj/aPvV2NwwGslmMF/o3z6FavpVXgWH09kpKFXwKZA=; b=u3AdVeK/usO9mP
	CoALpOKfMShlqo7ohhAK+BDVBTWXZ+Y5dLwMSpKbBd4Gu1rvkL5cWSNAWUEQxZ7ymAJ/gZz4KZzWn
	SeOBdHAolvTVkKrZUCkxn1IoO47C3Zs8h3ReNIWbWEjpEeFla+ZcJ+aUwTmGXlQ3VDv0tL6EbgO5Y
	h9pPF04LpumsF7FDFdr3gOKwYmX69pJ8pRt0ILKUaIHJZ/WwBR88YhMYSi/dhPcXnzY7uxNJ8Oe7V
	0IrBz4r6kJwv3cdcWIAMXL4fWkISt7d/fgefC1VAhaL894oreB6fWhm3gL6dSHD4+Low/qTKENK+a
	5FNFqVIQeQfCSkYPEojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPAb-00F9hL-JO; Fri, 27 Jan 2023 13:53:33 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPAU-00F9dF-S4
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:53:28 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id y8so5415853vsq.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 05:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzUBqryTptYUzEfhbyg+Lbcb+hwacEV+TO0IK7LNXU8=;
        b=Nj0//xHZCol4X/4LoPRHBLp04mZ6EyoR6ifMGAJyZKXqDQ2DDO+UCVf7oXmiq8NKlv
         uZhMC6w+AZvGFtaDvUzwidx8Sj6lRH4ps0RND4mC75QLASrACcarZbZAwCO+OrbBgA2a
         g6FO/H9UpLopISqqI4EpbAT5FHiezaN0Fh8eq1vv3wpFDi1xJ1DxrF1FbWDGq1iQM8db
         jhsXmwcthCd/L7yBe0BjwKvAfI5jGJEJ22/YXzrIkm6RnhG1QA/BRHhzDOqjpj8yDCHA
         D4eYt52pTgdUF+rDhhr2qje3A/dPZp0eHCoQb4UOKqcPObAZwnduqaFfm0Ypw1PKn7gw
         EiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzUBqryTptYUzEfhbyg+Lbcb+hwacEV+TO0IK7LNXU8=;
        b=duB6ecbO4kXoYq5X/gbnI/n9k+2GjoVsWwCedovcLcXCWAhbwa+d1ip7sL9Apvpz1a
         6T/ojVkhHOabVKuwhfV97T+OBNHjzy5dLKXbj5Ylmwhv6mVntY6U/S3lG3jYObEwBzdx
         r3wQBdS6gplokQGW0RhRS6+K8PK2oQnW1LH4y1+8tka0Mwf5XIr0lx8qGTH+6o2pjfud
         aPyr0AA/Z2RPEJ1nRNN3HeS8JwCurmp5Rfte6KDdELAO6Ow45sHfWkalb7Kg0hLWPyvi
         GJaIhPvVeohdL7UR3bbRB7dn2A8kXwHZDg2JivSxxu6ctO4ewBQRYBcP0gBsQKDE6y1n
         QdcQ==
X-Gm-Message-State: AO0yUKVZ0hH778oLG/X2qarc5dCTZ6870K61VMB2HXQYAe5yo/nvYI96
	SE8NpEW4AiEmP+srdJHRER9Jw/dR7ifKQGjMPf/4xNZXdn82LQ==
X-Google-Smtp-Source: AK7set+G91Acv+61aPdZ7vz54qMR8TqpiXkerxphHeLdypTJtL9kTh+QKLLarGjOUcQbXe2xYcQWJXCbqIL8IuEg6ZM=
X-Received: by 2002:a05:6102:3098:b0:3ec:1029:9eae with SMTP id
 l24-20020a056102309800b003ec10299eaemr661243vsb.10.1674827605343; Fri, 27 Jan
 2023 05:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
 <20230112140304.1830648-4-apatel@ventanamicro.com> <20230126161147.6rewhfvlouqn4ual@orel>
In-Reply-To: <20230126161147.6rewhfvlouqn4ual@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 27 Jan 2023 19:23:13 +0530
Message-ID: <CAK9=C2XzTdqXr+vWZ4Ua=HET1gvskAY+y9yFtGbmR2LGg87asQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID
 mask defines
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_055326_956557_A4563933 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Jan 26, 2023 at 9:41 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jan 12, 2023 at 07:33:00PM +0530, Anup Patel wrote:
> > The hgatp.VMID mask defines are used before shifting when extracting
> > VMID value from hgatp CSR value so based on the convention followed
> > in the other parts of asm/csr.h, the hgatp.VMID mask defines should
> > not have a _MASK suffix.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/csr.h | 8 ++++----
> >  arch/riscv/kvm/mmu.c         | 3 +--
> >  arch/riscv/kvm/vmid.c        | 4 ++--
> >  3 files changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index d608dac4b19f..36d580528f90 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -131,12 +131,12 @@
> >
> >  #define HGATP32_MODE_SHIFT   31
> >  #define HGATP32_VMID_SHIFT   22
> > -#define HGATP32_VMID_MASK    _AC(0x1FC00000, UL)
> > +#define HGATP32_VMID         _AC(0x1FC00000, UL)
> >  #define HGATP32_PPN          _AC(0x003FFFFF, UL)
> >
> >  #define HGATP64_MODE_SHIFT   60
> >  #define HGATP64_VMID_SHIFT   44
> > -#define HGATP64_VMID_MASK    _AC(0x03FFF00000000000, UL)
> > +#define HGATP64_VMID         _AC(0x03FFF00000000000, UL)
> >  #define HGATP64_PPN          _AC(0x00000FFFFFFFFFFF, UL)
> >
> >  #define HGATP_PAGE_SHIFT     12
> > @@ -144,12 +144,12 @@
> >  #ifdef CONFIG_64BIT
> >  #define HGATP_PPN            HGATP64_PPN
> >  #define HGATP_VMID_SHIFT     HGATP64_VMID_SHIFT
> > -#define HGATP_VMID_MASK              HGATP64_VMID_MASK
> > +#define HGATP_VMID           HGATP64_VMID
> >  #define HGATP_MODE_SHIFT     HGATP64_MODE_SHIFT
> >  #else
> >  #define HGATP_PPN            HGATP32_PPN
> >  #define HGATP_VMID_SHIFT     HGATP32_VMID_SHIFT
> > -#define HGATP_VMID_MASK              HGATP32_VMID_MASK
> > +#define HGATP_VMID           HGATP32_VMID
> >  #define HGATP_MODE_SHIFT     HGATP32_MODE_SHIFT
> >  #endif
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 34b57e0be2ef..034746638fa6 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -748,8 +748,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
> >       unsigned long hgatp = gstage_mode;
> >       struct kvm_arch *k = &vcpu->kvm->arch;
> >
> > -     hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
> > -              HGATP_VMID_MASK;
> > +     hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
> >       hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
> >
> >       csr_write(CSR_HGATP, hgatp);
> > diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> > index 6cd93995fb65..6f4d4979a759 100644
> > --- a/arch/riscv/kvm/vmid.c
> > +++ b/arch/riscv/kvm/vmid.c
> > @@ -26,9 +26,9 @@ void kvm_riscv_gstage_vmid_detect(void)
> >
> >       /* Figure-out number of VMID bits in HW */
> >       old = csr_read(CSR_HGATP);
> > -     csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
> > +     csr_write(CSR_HGATP, old | HGATP_VMID);
> >       vmid_bits = csr_read(CSR_HGATP);
> > -     vmid_bits = (vmid_bits & HGATP_VMID_MASK) >> HGATP_VMID_SHIFT;
> > +     vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
> >       vmid_bits = fls_long(vmid_bits);
> >       csr_write(CSR_HGATP, old);
> >
> > --
> > 2.34.1
> >
>
> Could switch to GENMASK too at the same time :-)

Okay, I will update.

>
> Anyway,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
