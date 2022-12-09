Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC73C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faK6XpAWxwo6YgJGyKIk42cWb2S5TH3azsIw/VYagVY=; b=UXrYkW4h/3xfFJ
	r+dtnhDVk3PeJ9GioJpF68ArrS86sHCCqXLj7tRuuRnvRywldMgWfl4P/xeWcNd+uP5K2I3wG0laq
	7CAqYKUycRZUlQnlM1ysiV7dpMhBa68nDTVO9aWLepnSBGMb3zG+i5M15vhVacNoCsqV6eeX+VgnQ
	w4OobMh5PRt60YrxzCo6BgTI6IRjWZMC4zWt5dCIRxnE5ZfuNKp8CHurI1jxkrWcSPRxoROcX0vKL
	ks6/pkQjX63ag+pRcBzYlzPLtCgi3X09xC/QuVX0wcCGj62pCMuGsQJEp5fPQKX1QvtuQJl3ppjrj
	M/UaaL792eyHZpL1PsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3hNL-009zEI-Do; Fri, 09 Dec 2022 17:41:31 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3hNA-009z6L-92
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 17:41:21 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id v71so6347187ybv.6
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 09:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae7igBpi6aOVu172YIUgxS7qKV+pzUf0AUP0I5I75q8=;
        b=N+7B9/rCWK5Sp2/p4Ir8f6MIvbqCGaqwi8Po2oncdcAwLhGA2JbFygWWQUv6V6CPMa
         5qEu3kJoWRw2vCClh6Nppk6pcE8Gs4F+bRtzVoiff0JJsexRmVNGr2a680WUghXF5FfZ
         hJT8t5JkmvW4LhfLt9VxecKUoVAgOFMQFaEgzYrErkPW87ek/r4P8aluMVRPjzuoCpmc
         s8hnbdPk8IjCsgDtQ2r43eSt/10ErW7paYLAy3fVr+Nls1PaCuUT+RlvNLCKRaMhvrdb
         84/0ge7Jjg4S3PzFHcaNOXRMWYnTQH+nKv2Q4uZnvxishqyp8n2lzRaNXljaSz/ExQZQ
         ySPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae7igBpi6aOVu172YIUgxS7qKV+pzUf0AUP0I5I75q8=;
        b=b9yq4lkDfTaqZn36SLlB0EZptM1/oSeTrFRoL+uc4DweIEb2hBOhkSGfpZBJdySs9H
         hW5mdT1I4D+xr8bSD67PwnHHSWxLlyuECplr+ecNizdVCfPEgQgVclCmwO3DvYTaN25B
         0YSVRlHpwTMP5JbcWGcpBnw+f3EJiyu18F1MX09Sb5JCPPNr9Kj5vyveVJUdf99GYCtl
         pkidti6APw+MGhJFpdNSQ8uurB/4+F5xf4OQS3MzJ9LzjcDUF8Bkhb35Su4tV/QRtaX9
         gXP3rWgDzXUIlaGDD06f7tC2f6aQlBjbKlQyBIIGaLDSm06IwKKuEN1USM/B1gE8J0Nx
         H/OA==
X-Gm-Message-State: ANoB5pmAAfpq/dETurvW84xrf8MSs1XO0W4ZVPy6Kkj9PF6iRXE9IYWK
	z3+UZE0srj4S4WgYRYzXBflBMDSCzEgE5zlRUdSkjQ==
X-Google-Smtp-Source: AA0mqf5h6EJUa8o1mU6n0d18d5R9db+bCd1t++iK380my63/Q1gFej7B2AoWgEI4of2L90azWCjh0YyRl3fL7yBolSs=
X-Received: by 2002:a25:742:0:b0:6fd:6aa4:82a5 with SMTP id
 63-20020a250742000000b006fd6aa482a5mr25244378ybh.305.1670607674506; Fri, 09
 Dec 2022 09:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com> <Y5NvYmxpy6BPkmpW@google.com>
In-Reply-To: <Y5NvYmxpy6BPkmpW@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 9 Dec 2022 09:40:48 -0800
Message-ID: <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
To: Oliver Upton <oliver.upton@linux.dev>
Cc: "Yang, Weijiang" <weijiang.yang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Christopherson,, Sean" <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, "Amit, Nadav" <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_094120_324683_447BB5A2 
X-CRM114-Status: GOOD (  26.59  )
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

On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
>
> On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> >
> > On 12/9/2022 3:38 AM, David Matlack wrote:
> > > Rename kvm_mmu_page_role.smm with kvm_mmu_page_role.as_id and use it
> > > directly as the address space ID throughout the KVM MMU code. This
> > > eliminates a needless level of indirection, kvm_mmu_role_as_id(), and
> > > prepares for making kvm_mmu_page_role architecture-neutral.
> > >
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >   arch/x86/include/asm/kvm_host.h |  4 ++--
> > >   arch/x86/kvm/mmu/mmu.c          |  6 +++---
> > >   arch/x86/kvm/mmu/mmu_internal.h | 10 ----------
> > >   arch/x86/kvm/mmu/tdp_iter.c     |  2 +-
> > >   arch/x86/kvm/mmu/tdp_mmu.c      | 12 ++++++------
> > >   5 files changed, 12 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > index aa4eb8cfcd7e..0a819d40131a 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -348,7 +348,7 @@ union kvm_mmu_page_role {
> > >              * simple shift.  While there is room, give it a whole
> > >              * byte so it is also faster to load it from memory.
> > >              */
> > > -           unsigned smm:8;
> > > +           unsigned as_id:8;
> > >     };
> > >   };
> > > @@ -2056,7 +2056,7 @@ enum {
> > >   # define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> > >   # define KVM_ADDRESS_SPACE_NUM 2
> > >   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
> > > -# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
> > > +# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).as_id)
> > >   #else
> > >   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
> > >   #endif
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index 4d188f056933..f375b719f565 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> > >     union kvm_cpu_role role = {0};
> > >     role.base.access = ACC_ALL;
> > > -   role.base.smm = is_smm(vcpu);
> > > +   role.base.as_id = is_smm(vcpu);
> >
> > I'm not familiar with other architectures, is there similar conception as
> > x86 smm mode?

The notion of address spaces is already existing architecture-neutral
concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
Architectures that do not use multiple address spaces will just leave
as_id is as always 0.

>
> For KVM/arm64:
>
> No, we don't do anything like SMM emulation on x86. Architecturally
> speaking, though, we do have a higher level of privilege typically
> used by firmware on arm64, called EL3.
>
> I'll need to read David's series a bit more closely, but I'm inclined to
> think that the page role is going to be rather arch-specific.

Yes most of the fields are in the arch-specific sub-role. The TDP MMU
only needs to know about the as_id, level, and invalid bits. (See next
patch.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
