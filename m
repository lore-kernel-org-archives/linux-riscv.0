Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB39C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 07:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9432660F14
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 07:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9432660F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LD4mb6nBrKGnoA+t73IXbChAEDYp4VbF51np/IhylDc=; b=Ts/Ynv8iyyaE55
	4aKWVKrh7rh7520reUYtc9Ux3HgZbxUgxLxGIgKadwO2RqsyGhAafi04v/VIqKNEVefGPhYiQUOuO
	r1r87IaP7RWIXk+rlvBy/2JrUjSlqtQYVB7OSTWwyDixTGN3ma02hAiVrEARvVQxIDPJ3vwgCDxWA
	7dUn1ct48NHc+9I2rZ+DXoD6sywFV0ZtBHt4d4UhJwyimHiLgVjfu49hwlWmpwDwAwI2ONePHygs1
	sEQDCT6PBYKkUCBEQdQxYZH7qSd7KHNgpjslX3kGfxPZ5LPjZh9U0ykGuLHNpNMr6C6u/u2ctlYBc
	F8xZ0SgMHEaLTmwFsO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBB9Q-004zy5-RS; Wed, 04 Aug 2021 07:17:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBB9O-004zrH-6I
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 07:17:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id h14so1036960wrx.10
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 00:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNEs/6yr9b8hBQJj2GN/2tEZCeGoJUsw90alOL/69is=;
 b=MRfa7s2FlqWOZN1LdWG9uuA2LDK4JWa35Hl4QjcgjFTI6pryHaQWkcpUdTW9ls6cUh
 wU/tM9FUyC5q4Hs7TpxT5/kRxdkcJUp0QgLu0QMLU/TgjjYbGEPjBeVJCu2aybz6/x96
 P9wN8SKOi+yNj2hmcKkKnxLElr+ajPmy36P9Ldz2zFvolMi/qlmLZ2MF8bCYsvWHjVyW
 ASZLShSWvUGBBklIwdSJ+VhMMOhjx90ZrUk96mRak3VNf9bIg5yTfwgrahOH9QD/GWAr
 bICzY7dttw78c8vG73H8QPTvHElx6JB5fryzSD0RL5eoWWk/sogoyswO5lF/haQ8gwu1
 A8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNEs/6yr9b8hBQJj2GN/2tEZCeGoJUsw90alOL/69is=;
 b=Q8EqTZ736Qq/ULfyAx3a1TaOvZS3ijiwWJBczTuAr7uBYm6kCLNe6BBS3pwt96uwA8
 Dq/PWC2rsDvSSY47MkY3AZpgoaFjAGlf+llnWZrpt8adKuayjoqFtffLuInZAkkA47m7
 HG6v0RfH/LHQwrc8UiGYtf1er82Ah95In/MH+k5Mxef8nmAbt0WYUc7uCk82S4SlqfoE
 bPBg4FvUvuFwjHOudtemESZ0ALg7QOfEWc05+uPPGvdZ4/tyc0K0R63rJMMW1BQLtkqe
 yVE4krxjrDGDTu0eus+4OhghhdtcAIXgLZK50PLExPI5FWwPwkjo9xgdUM5jmd2UuR+t
 oWpg==
X-Gm-Message-State: AOAM5332o6RJ3B6dfHtJUUr7BQ9xwnN7gAdXHCrDaBUxB4BTK1G5soiy
 +nCoBHWWyVTR2si0XuKTQ2jGfOwqDvUJBnIlbDnOKQ==
X-Google-Smtp-Source: ABdhPJziyxjW3/zAe6HvyWFtZ1PxzUYuOaOmP44elbzWWY60sj71QIHYVTXI1bP8qaCoQecHSM5/k92hfV7UFYOU8Ew=
X-Received: by 2002:a5d:640f:: with SMTP id z15mr27704351wru.325.1628061427914; 
 Wed, 04 Aug 2021 00:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210727055450.2742868-1-anup.patel@wdc.com>
 <20210727055450.2742868-12-anup.patel@wdc.com>
 <38734ad1008a46169dcd89e1ded9ac62@huawei.com>
In-Reply-To: <38734ad1008a46169dcd89e1ded9ac62@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Aug 2021 12:46:20 +0530
Message-ID: <CAAhSdy2jCQQScw9KMwHy-c7Mgkaq5xB95qmjypJEYbb+0q3_Tg@mail.gmail.com>
Subject: Re: [PATCH v19 11/17] RISC-V: KVM: Implement MMU notifiers
To: "limingwang (A)" <limingwang@huawei.com>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, 
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_001714_280726_8466F76D 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, Aug 3, 2021 at 6:49 PM limingwang (A) <limingwang@huawei.com> wrote:
>
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c index
> > fa9a4f9b9542..4b294113c63b 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -300,7 +300,8 @@ static void stage2_op_pte(struct kvm *kvm, gpa_t
> > addr,
> >       }
> >  }
> >
> > -static void stage2_unmap_range(struct kvm *kvm, gpa_t start, gpa_t size)
> > +static void stage2_unmap_range(struct kvm *kvm, gpa_t start,
> > +                            gpa_t size, bool may_block)
> >  {
> >       int ret;
> >       pte_t *ptep;
> > @@ -325,6 +326,13 @@ static void stage2_unmap_range(struct kvm *kvm,
> > gpa_t start, gpa_t size)
> >
> >  next:
> >               addr += page_size;
> > +
> > +             /*
> > +              * If the range is too large, release the kvm->mmu_lock
> > +              * to prevent starvation and lockup detector warnings.
> > +              */
> > +             if (may_block && addr < end)
> > +                     cond_resched_lock(&kvm->mmu_lock);
> >       }
> >  }
> >
> > @@ -405,7 +413,6 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa,
> > phys_addr_t hpa,
> >  out:
> >       stage2_cache_flush(&pcache);
> >       return ret;
> > -
> >  }
> >
> >  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm, @@
> > -547,7 +554,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >       spin_lock(&kvm->mmu_lock);
> >       if (ret)
> >               stage2_unmap_range(kvm, mem->guest_phys_addr,
> > -                                mem->memory_size);
> > +                                mem->memory_size, false);
> >       spin_unlock(&kvm->mmu_lock);
> >
> >  out:
> > @@ -555,6 +562,73 @@ int kvm_arch_prepare_memory_region(struct kvm
> > *kvm,
> >       return ret;
> >  }
> >
> > +bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> > +{
> > +     if (!kvm->arch.pgd)
> > +             return 0;
> > +
> > +     stage2_unmap_range(kvm, range->start << PAGE_SHIFT,
> > +                        (range->end - range->start) << PAGE_SHIFT,
> > +                        range->may_block);
> > +     return 0;
> > +}
> > +
> > +bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range) {
> > +     int ret;
> > +     kvm_pfn_t pfn = pte_pfn(range->pte);
> > +
> > +     if (!kvm->arch.pgd)
> > +             return 0;
> > +
> > +     WARN_ON(range->end - range->start != 1);
> > +
> > +     ret = stage2_map_page(kvm, NULL, range->start << PAGE_SHIFT,
> > +                           __pfn_to_phys(pfn), PAGE_SIZE, true, true);
> > +     if (ret) {
> > +             kvm_err("Failed to map stage2 page (error %d)\n", ret);
> > +             return 1;
> > +     }
>
> Hi, Anup
>
> I think that it is not appropriate to add kvm_err here, because stage2_set_pte function
> may apply for memory based on the pcache parameter. If the value of pcache is NULL,
> stage2_set_pte function considers that there is not enough memory and here an invalid
> error log is generated.
>
> As an example, this error log is printed when a VM is migrating. But finally the VM migration
> is successful. And if the kvm_err is added to the same position in the ARM architecture, the
> same error log is also printed.

Okay, I have converted kvm_err() to kvm_debug(). In the future, we can totally
remove it as well.

Please try riscv_kvm_v20 branch at:
https://github.com/avpatel/linux.git

Regards,
Anup

>
> Mingwang
>
> > +     return 0;
> > +}
> > +
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
