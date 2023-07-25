Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EB3C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uaLPwGy1CkJxfg676RYxLZq3i1GoJSujLi++dcZSomk=; b=4W0Y7wh66DjeGQJAhvFm6/Y+x9
	UcQ62/zMtWrKeqihyFOGg6awTMkMXsXqP1AWSq2VYXJfd0jmLTl1uf27YrFUy1sY8dW4QpgI1P7JY
	YpePRoVMTGVHoZMhk5hrFBpu1EbQD7WoLEloskLLDzOafbB4spKwkGJQ2ILH4fpxPSt+AL54mY4qv
	v+V9jP15kMnVxhTQxVo/ObGUApuaLgAk05Al6EHHHJkfyF9X7jtelOIhxcNh6BIpQVSY+oWep7m5n
	I+xr4gDmGhKqNe4Bq12fi7HCoLVe3oLYxJuIKSSwV5iR45wajrj7d5zrnfhGzNrUylSPo4JTuOQuR
	Zn7d7hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOMPj-008EG4-0w;
	Tue, 25 Jul 2023 18:05:39 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOMPg-008ECW-1H
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 18:05:37 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-583c1903ad3so42301997b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 11:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690308331; x=1690913131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIo8qHauKdQX+T8FT8wbaojm6/JdQZAwM03PT/kIykI=;
        b=7nXQcBRpxoTRBB3DVtfi1G3SLzO+8rbX0pZK3GqB/ZiRovVnhgEY5C+Gs70dPcpJKC
         v8EbJPLKK/PtzLxWiGJ5qeO4LJqB7HN3pWAhYbANBnQSVYoMTUMzCaeCD3zEfSqoM+r2
         fDpLY03C1R0xadVk8zh9oHGZMZqSmWV+dliNXRuRczTowFXc/oEsFJjHeqmHR0h/7zjV
         1SaakHlCZawqmTagIefeOP2xnfIobskVh1rmXibU4Cwg3i96EQeqcAc0By/i+P6tJXi9
         1AMdfmti0ZHyvBS0qJY6Ig052U8rUWQC7aHvZS0sxZXtvMY234BUecIw+5qK/UmUColq
         VbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690308331; x=1690913131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIo8qHauKdQX+T8FT8wbaojm6/JdQZAwM03PT/kIykI=;
        b=KW/VNJIGW6iH4qG+A+N02NAsTpHLTB9El2S0vxJFBCR/D+2gD5Er2pgwSLtD91rxJ3
         DRRtLDMr0oV8EssMpWvCDnvT3OM2DglRGePS/LgFaY33TKi3se2Sscp/S3vDl7qhzMSD
         exj5IoRg0bs3RGOubOm+/DvCHO5AXxEH4KdjWuZAx37rDd6nKZvH8i01i4skgzrtXfyW
         wIEwMvw2TBlTAXrdHD2IgBm4/w1jNi3pkWSWauxJX/QZl86Rubli/AXLnvo4/pqO6jj6
         TTCj9Q/OwebjG1A3fcHKmFAKw8CUqppYqb7aMZMowjPD8yjNkDhJoN6Ll07JKPsA6nj1
         nzLg==
X-Gm-Message-State: ABy/qLbp5PTW97bSi+x53dsBz/N+eRgdhkcQTr9DYOEzEfdPQiylwpzx
	f/oJGTsYUnamHzW4ykahI0fNngGdRCc=
X-Google-Smtp-Source: APBJJlG+f5K6Guu8BWDh2M0jvEhmql8458IaH+LCw2ABsy+ZDoDj1Vv7TcavygUx+nDEGvPQs1RCmsWjSr8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4509:0:b0:573:5797:4b9e with SMTP id
 s9-20020a814509000000b0057357974b9emr213ywa.1.1690308331572; Tue, 25 Jul 2023
 11:05:31 -0700 (PDT)
Date: Tue, 25 Jul 2023 11:05:29 -0700
In-Reply-To: <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com> <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
Message-ID: <ZMAO6bhan9l6ybQM@google.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_110536_435411_3324F5EE 
X-CRM114-Status: GOOD (  25.30  )
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

On Fri, Jul 21, 2023, Xu Yilun wrote:
> On 2023-07-21 at 14:26:11 +0800, Yan Zhao wrote:
> > On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:
> > 
> > May I know why KVM now needs to register to callback .change_pte()?
> 
> I can see the original purpose is to "setting a pte in the shadow page
> table directly, instead of flushing the shadow page table entry and then
> getting vmexit to set it"[1].
> 
> IIUC, KVM is expected to directly make the new pte present for new
> pages in this callback, like for COW.

Yes.

> > As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
> > surrounded by .invalidate_range_{start,end}().
> > 
> > While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
> > to zap all leaf SPTEs, and page fault path will not install new SPTEs
> > successfully before kvm_mmu_notifier_invalidate_range_end(),
> > kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
> > update PFN.
> 
> I also failed to figure out how the kvm_set_spte_gfn() could pass
> several !is_shadow_present_pte(iter.old_spte) check then write the new
> pte.

It can't.  .change_pte() has been dead code on x86 for 10+ years at this point,
and if my assessment from a few years back still holds true, it's dead code on
all architectures.

The only reason I haven't formally proposed dropping the hook is that I don't want
to risk the patch backfiring, i.e. I don't want to prompt someone to care enough
to try and fix it.

commit c13fda237f08a388ba8a0849785045944bf39834
Author: Sean Christopherson <seanjc@google.com>
Date:   Fri Apr 2 02:56:49 2021 +0200

    KVM: Assert that notifier count is elevated in .change_pte()
    
    In KVM's .change_pte() notification callback, replace the notifier
    sequence bump with a WARN_ON assertion that the notifier count is
    elevated.  An elevated count provides stricter protections than bumping
    the sequence, and the sequence is guarnateed to be bumped before the
    count hits zero.
    
    When .change_pte() was added by commit 828502d30073 ("ksm: add
    mmu_notifier set_pte_at_notify()"), bumping the sequence was necessary
    as .change_pte() would be invoked without any surrounding notifications.
    
    However, since commit 6bdb913f0a70 ("mm: wrap calls to set_pte_at_notify
    with invalidate_range_start and invalidate_range_end"), all calls to
    .change_pte() are guaranteed to be surrounded by start() and end(), and
    so are guaranteed to run with an elevated notifier count.
    
    Note, wrapping .change_pte() with .invalidate_range_{start,end}() is a
    bug of sorts, as invalidating the secondary MMU's (KVM's) PTE defeats
    the purpose of .change_pte().  Every arch's kvm_set_spte_hva() assumes
    .change_pte() is called when the relevant SPTE is present in KVM's MMU,
    as the original goal was to accelerate Kernel Samepage Merging (KSM) by
    updating KVM's SPTEs without requiring a VM-Exit (due to invalidating
    the SPTE).  I.e. it means that .change_pte() is effectively dead code
    on _all_ architectures.
    
    x86 and MIPS are clearcut nops if the old SPTE is not-present, and that
    is guaranteed due to the prior invalidation.  PPC simply unmaps the SPTE,
    which again should be a nop due to the invalidation.  arm64 is a bit
    murky, but it's also likely a nop because kvm_pgtable_stage2_map() is
    called without a cache pointer, which means it will map an entry if and
    only if an existing PTE was found.
    
    For now, take advantage of the bug to simplify future consolidation of
    KVMs's MMU notifier code.   Doing so will not greatly complicate fixing
    .change_pte(), assuming it's even worth fixing.  .change_pte() has been
    broken for 8+ years and no one has complained.  Even if there are
    KSM+KVM users that care deeply about its performance, the benefits of
    avoiding VM-Exits via .change_pte() need to be reevaluated to justify
    the added complexity and testing burden.  Ripping out .change_pte()
    entirely would be a lot easier.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
