Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9480C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57I5IICewZqUO7XMTTcZpRaSs0sWh0LEZo3N8iFWWKk=; b=ZZp9Ps5vkD0Jap
	p2au4ZDOuA3bMkC9cgdOa8rTGKw1H4fn8OhuoBkmV3unyiHvalTw7CrAj+niFWS0B8no2GUkpoI8y
	CvTxdaA500YRMVYMU6BmnujURnQdWP6UROShl5ml5zb3EcHzuuTiiZ3d6LAo3xSO3+6pcWEPYaE7W
	gOgej7hX8157cu9/4LZSnNDXJjoZ8In77HGzQCjd7UheQfoKg6a93E++sLqoMTqWx+N/witpY+ifP
	aRiwfBtb6+9ADtncYi0LSQ2gS0Wem1xQ0bgC1MPCori3m4nUSo8YTkfMeWaDaBr5j5Yjy4Io4XXBm
	30VUb+wGPL4BifE4oFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3h7U-009usw-5V; Fri, 09 Dec 2022 17:25:08 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3h7P-009upn-WC
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 17:25:05 +0000
Date: Fri, 9 Dec 2022 17:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1670606700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sbHd3TvFPLETZHNVBUCcer9R9cb69+aHOJviFvExi4Y=;
	b=myof8e9+vePyEh1XAVMIRcDm8q1jyelUp0oMG47QgTKeMP8Ad9MLe/+7riFT55TVEnMYX8
	7B84ih0UqSmmSzalw4eYcdn7TGzMbR//yFaIlKDe2lSOL8s23+xUh0Njytzg/zI8dV/8zF
	cfDPbjEUYbw41qF2SIUp1mnpdTfjg4Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Yang, Weijiang" <weijiang.yang@intel.com>
Cc: David Matlack <dmatlack@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Christopherson,, Sean" <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Amit, Nadav" <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
Message-ID: <Y5NvYmxpy6BPkmpW@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_092504_491461_7885090F 
X-CRM114-Status: GOOD (  21.79  )
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

On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> 
> On 12/9/2022 3:38 AM, David Matlack wrote:
> > Rename kvm_mmu_page_role.smm with kvm_mmu_page_role.as_id and use it
> > directly as the address space ID throughout the KVM MMU code. This
> > eliminates a needless level of indirection, kvm_mmu_role_as_id(), and
> > prepares for making kvm_mmu_page_role architecture-neutral.
> > 
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h |  4 ++--
> >   arch/x86/kvm/mmu/mmu.c          |  6 +++---
> >   arch/x86/kvm/mmu/mmu_internal.h | 10 ----------
> >   arch/x86/kvm/mmu/tdp_iter.c     |  2 +-
> >   arch/x86/kvm/mmu/tdp_mmu.c      | 12 ++++++------
> >   5 files changed, 12 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index aa4eb8cfcd7e..0a819d40131a 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -348,7 +348,7 @@ union kvm_mmu_page_role {
> >   		 * simple shift.  While there is room, give it a whole
> >   		 * byte so it is also faster to load it from memory.
> >   		 */
> > -		unsigned smm:8;
> > +		unsigned as_id:8;
> >   	};
> >   };
> > @@ -2056,7 +2056,7 @@ enum {
> >   # define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> >   # define KVM_ADDRESS_SPACE_NUM 2
> >   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
> > -# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
> > +# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).as_id)
> >   #else
> >   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
> >   #endif
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 4d188f056933..f375b719f565 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> >   	union kvm_cpu_role role = {0};
> >   	role.base.access = ACC_ALL;
> > -	role.base.smm = is_smm(vcpu);
> > +	role.base.as_id = is_smm(vcpu);
> 
> I'm not familiar with other architectures, is there similar conception as
> x86 smm mode?

For KVM/arm64:

No, we don't do anything like SMM emulation on x86. Architecturally
speaking, though, we do have a higher level of privilege typically
used by firmware on arm64, called EL3.

I'll need to read David's series a bit more closely, but I'm inclined to
think that the page role is going to be rather arch-specific.

--
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
