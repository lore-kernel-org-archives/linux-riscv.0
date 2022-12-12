Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A9AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lp7YkwhG7sQWBSE+katseSIrGVUuHQfcCEG6jNTi97E=; b=M5pBpAg3PP/Z9D
	Hl235AWDIodU8q5QTnwnFeqRxx4U+iwr020iq0wdfuq/NINhVfw+CQ5l18+0giGvi5TeH7Fy66r3r
	U/AtegszAwIMg+UM/26GQocpjy33WneQS7hgPS+b6yCz0cthU/pS0K0j7I+JxQT2htGYVMWYSIEiq
	lVaZ8CHGRZ+m8keE9zwzu1VmmmD1XeOnHR7fymhzaXZe7uo1IEs2SRqCxcxIXWntRT89NfsBmnslQ
	rLyW4Klhmuy8/Jh2dH0dlB6hdDbSqq+/rU0cz70KzWj50Xeg+Fhv+r87YuKxkCVpp+4FAC7Z8tniT
	M6yaEdqOsyEchfy77mUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4mmV-0030kE-V3; Mon, 12 Dec 2022 17:39:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4mmJ-00306U-Ua
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 17:39:50 +0000
Received: by mail-pg1-x531.google.com with SMTP id 142so8695335pga.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QS7ynIDmKRlIs3oQp3nNRq3SgpEDJuiT7l2fKUtqJA=;
        b=Q0nnG/dD12oshnk2CykCxq72d8uZrdzzqkuH5dft2uszejZpVFSnXayz+SB3Bwgro8
         BRpXeeCgbqfUn2wNBfcOZyX3qyFKQJ6SczkPWVABh1mpb57722xzOrsTLiE48vG5UkwV
         bWLck3WppDEGsIUBHKKGTEWgFtdCLpnoSQ2bevYVQ/nLcPPAgPGAlA/9ZOfUNOvgOGId
         G76GaBjjIODSpD0MI08sPApYWZ6pYb2TgRVicuKhWCGe6JSitmtMJPjC2xPhiXqe6dk1
         lh4RR1K4cJ0EETmdVRDXbjpYPE9b76QlJk+PQjM9eohHtNpBi7HjhEH0vhjhhqilbAjf
         2W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QS7ynIDmKRlIs3oQp3nNRq3SgpEDJuiT7l2fKUtqJA=;
        b=6zW08TqOiBc0rjgEcRFgUgFNgmyxa34392INElfzglnnhUZyz0E+MaNlx3QrgKhg4y
         kqyI1f3pGFDbcJ7JfOSp9FOqoeD9bExoUn3dPzJcTnESqTUjq3NfROjxgBkhRfTluCon
         Wd6y7i9+/3tXlgqQpVDGy65n3smbJHiby3/nIMu/UfhAZtDbprXu1wMGr5rgiciOEyb3
         UUNbW2VDPJrUVs6tWno47bihf4wj1oqbOvTLcF8LCpYU21pw6rzKXo0JQ7nISjRYQVOo
         V5Z5IZ1KQynZOl/6T/Fx5563VyAagKsX0C7u+WFWakseIY/jKP8/9tkByxDtnE9BPNei
         cevw==
X-Gm-Message-State: ANoB5pkLHCOicBrRb1Y0iVownyScEF1WnM6JDDNZzoCG7r9YNspwKIqR
	G9DZxwqotI/Wi7LyAwaeBTGNSg==
X-Google-Smtp-Source: AA0mqf4fRjcF7yqcwPoqLk9QucrmsFbaTw1SZFxx+iK6d+zjxBOpK3Jkaq0gjsaSmdZVgYI9LkA78w==
X-Received: by 2002:a05:6a00:27a4:b0:576:22d7:fd9e with SMTP id bd36-20020a056a0027a400b0057622d7fd9emr657961pfb.0.1670866782130;
        Mon, 12 Dec 2022 09:39:42 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id y10-20020aa793ca000000b0057555d35f79sm6092008pff.101.2022.12.12.09.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 09:39:41 -0800 (PST)
Date: Mon, 12 Dec 2022 17:39:38 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	"Yang, Weijiang" <weijiang.yang@intel.com>,
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
Message-ID: <Y5dnWgJ0ine55/hN@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_093947_996013_9A1BE511 
X-CRM114-Status: GOOD (  21.90  )
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

On Fri, Dec 09, 2022, David Matlack wrote:
> On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index 4d188f056933..f375b719f565 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> > > >     union kvm_cpu_role role = {0};
> > > >     role.base.access = ACC_ALL;
> > > > -   role.base.smm = is_smm(vcpu);
> > > > +   role.base.as_id = is_smm(vcpu);
> > >
> > > I'm not familiar with other architectures, is there similar conception as
> > > x86 smm mode?
> 
> The notion of address spaces is already existing architecture-neutral
> concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
> virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.

Yes, SMM is currently the only use-case.

> Architectures that do not use multiple address spaces will just leave
> as_id is as always 0.

My preference would be to leave .smm in x86's page role.  IMO, defining multiple
address spaces to support SMM emulation was a mistake that should be contained to
SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
even x86 can opt out.

For all potential use cases I'm aware of, SMM included, separate address spaces
are overkill.  The SMM use case is to define a region of guest memory that is
accessible if and only if the vCPU is operating in SMM.  Emulating something like
TrustZone or EL3 would be quite similar.  Ditto for Intel's TXT Private Space
(though I can't imagine KVM ever emulating TXT :-) ).

Using separate address spaces means that userspace needs to define the overlapping
GPA areas multiple times, which is inefficient for both memory and CPU usage.
E.g. for SMM,  userspace needs to redefine all of "regular" memory for SMM in
addition to memory that is SMM-only.  And more bizarelly, nothing prevents userspace
from defining completely different memslot layouts for each address space, which
might may not add complexity in terms of code, but does make it more difficult to
reason about KVM behavior at the boundaries between modes.

Unless I'm missing something, e.g. a need to map GPAs differently for SMM vs.
non-SMM, SMM could have been implemented with a simple flag in a memslot to mark
the memslot as SMM-only.  Or likely even better, as an overlay to track attributes,
e.g. similar to how private vs. shared memory will be handled for protected VMs.
That would be slightly less efficient for memslot searches for use cases where all
memory is mutually exclusive, but simpler and more efficient overall.

And separate address spaces become truly nasty if the CPU can access multiple
protected regions, e.g. if the CPU can access type X and type Y at the same time,
then there would need to be memslots for "regular", X, Y, and X+Y.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
