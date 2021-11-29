Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 03:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ke1RRWl/juCKjFj2GEVPdC+Junc+dp3O8xxeRsxluHk=; b=Um3I1mgnVgYDkW
	pLlYWgvxYpm1KcicK90UbiJjfEBw2lrG59H+EfvfP8GoqgybIB6oX7JSfO6o1I93DXroyfxtPiU64
	T+RjJax4H5nTtkWH8e3bOk1NLDKPrjmc98VydiR1LuB7FZC1TJhwfe4Npu3NtzJ8rcOcFavy25PnT
	lpHw4xzuGCxxZN4micWrYSBRicnhYAVML+vD2r6aB25+fLiYHLjZ1rJIlfu0htZZmgSe8CWjw0b4+
	9QMFdmS2yIpCSyAm+v+QmFT9z+dbnSCc27qvxNYTpaGLE5kK1wZWWvIddTOT96G0+ydRC6bXAdvGM
	ehgEBUBZENX8cKu7IW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrXX9-00HC62-Jw; Mon, 29 Nov 2021 03:40:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrXX7-00HC4N-41
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 03:40:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so11395005wme.4
 for <linux-riscv@lists.infradead.org>; Sun, 28 Nov 2021 19:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SHoWN3qsrC9PjO8f+fhaJ1a87+hWxCOTLw3EtpXfuKo=;
 b=6BnctyDHGkdqp5PF0QNSAgoJ6HrlI6ALPrdjxjj1/Vtv+HDCN4xmasn1GbjHiMyKMc
 u4eG4kh9FSX1wmSF0EoprhkiNL7NWt3n3lU16XjzsWj5Yfh3aiwtpCW6orLBtvkimPzH
 518o2kfAe3MpRwu5scQ8v9mEGxqbJExhSO5OVtg3Fv6noQYr4MDDmjU0EPtCaEBuTMpJ
 NyeTwgVy5p+nJAAVh1qh6iDgGeBpLMKH+YN8NankGfnvOaqMI8q2ZEpUQlOJFoQ78VXU
 AErhlh4vPQF826DPhb+4BsKM+xWnQdkrFHDiUhqzEZpcmHtj6uDVhSwHOKEPwAxiyY4D
 Eh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHoWN3qsrC9PjO8f+fhaJ1a87+hWxCOTLw3EtpXfuKo=;
 b=g4fAnGWN7HxD7si6VvcJK/iN8OIyquFWPZqkfGV3FqFltzWxLZ7iicMdPDpTw4UY4o
 8lYmL7PHetmV6nD/eChIYCVSoiDPvdy2i4ztf1akJ8Q5fKNFHVTpZaqRWI6K/LHl/4tp
 BQguM6fu7rRy+oNNH3nkh/q5W/DoZE9ScdVVBAl0RH1ZNXwHT1pQ5TB+BvrFs+vvNV08
 fU5vri1Ml/ywvWbzVusRy5MsUl0AAIGMxZQrvA/VWwkrV8U+NQoYBlGVVTyU2ZMoLGT6
 fxX2WSwCbBY8PMcsirWmamOsqWpuba/qJ3kcUehegsTf8M90JLCjJJaoJBeRK8I/s5d1
 1B2w==
X-Gm-Message-State: AOAM532SfIK9n2ShhoS94DJY91SlQWyTgYYynyMmNKDEPiwBbUCUio2B
 4/JezWMXwcq+iQTLwey3E8gxzaYFj4/i4MScgQFp1A==
X-Google-Smtp-Source: ABdhPJye1t6ElsPCeS1s6UZ/CRrpaWYJ5xKmqKZNSpbvlCjLK9dQjMtOM2OpdagX1S7Yl7xZiLvXmuXsti1liEKcAA8=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr33597189wmb.137.1638157247562; 
 Sun, 28 Nov 2021 19:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-3-anup.patel@wdc.com>
 <4fcb162a-738b-64e7-6326-9f9967d1b8a8@redhat.com>
In-Reply-To: <4fcb162a-738b-64e7-6326-9f9967d1b8a8@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Nov 2021 09:10:36 +0530
Message-ID: <CAAhSdy0EVLVjbD9XdM_-DyjRjH4C3Bo9=WUbm6HUJ8NmPpeH_g@mail.gmail.com>
Subject: Re: [PATCH 2/4] RISC-V: KVM: Add VM capability to allow userspace get
 GPA size
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_194049_189307_D863E14C 
X-CRM114-Status: GOOD (  21.18  )
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

On Fri, Nov 26, 2021 at 9:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/26/21 16:40, Anup Patel wrote:
> > The GPA size supported for a RISC-V Guest/VM is based on the MMU mode
> > used by G-stage translation. The KVM RISC-V will detect and use the
> > best possible MMU mode for the G-stage in kvm_arch_init().
> >
> > We add a RISC-V specific VM capability KVM_CAP_RISCV_VM_GPA_SIZE which
>
> You can make it just KVM_CAP_VM_GPA_BITS instead - it's useful on other
> architectures as well.

Sure, I will update.

Regards,
Anup

>
> Paolo
>
> > can be used by KVM userspace to get guest physical address (GPA) size
> > (i.e. number of GPA bits) supported for a Guest/VM.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >   arch/riscv/include/asm/kvm_host.h | 1 +
> >   arch/riscv/kvm/mmu.c              | 5 +++++
> >   arch/riscv/kvm/vm.c               | 3 +++
> >   include/uapi/linux/kvm.h          | 1 +
> >   4 files changed, 10 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 37589b953bcb..ae5d238607fe 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -221,6 +221,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
> >   void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
> >   void kvm_riscv_stage2_mode_detect(void);
> >   unsigned long kvm_riscv_stage2_mode(void);
> > +int kvm_riscv_stage2_gpa_size(void);
> >
> >   void kvm_riscv_stage2_vmid_detect(void);
> >   unsigned long kvm_riscv_stage2_vmid_bits(void);
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 9ffd0255af43..9b6d6465094f 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -760,3 +760,8 @@ unsigned long kvm_riscv_stage2_mode(void)
> >   {
> >       return stage2_mode >> HGATP_MODE_SHIFT;
> >   }
> > +
> > +int kvm_riscv_stage2_gpa_size(void)
> > +{
> > +     return stage2_gpa_bits;
> > +}
> > diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > index fb18af34a4b5..ae97f6929897 100644
> > --- a/arch/riscv/kvm/vm.c
> > +++ b/arch/riscv/kvm/vm.c
> > @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >       case KVM_CAP_NR_MEMSLOTS:
> >               r = KVM_USER_MEM_SLOTS;
> >               break;
> > +     case KVM_CAP_RISCV_VM_GPA_SIZE:
> > +             r = kvm_riscv_stage2_gpa_size();
> > +             break;
> >       default:
> >               r = 0;
> >               break;
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 1daa45268de2..dac98df3101d 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
> >   #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
> >   #define KVM_CAP_ARM_MTE 205
> >   #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> > +#define KVM_CAP_RISCV_VM_GPA_SIZE 207
> >
> >   #ifdef KVM_CAP_IRQ_ROUTING
> >
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
