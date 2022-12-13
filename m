Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3C48LH35sugd9ajfD7wwF/y1fKG9fZFSLqgTBBYP+aY=; b=G+76kBmZdtteM/
	rZNlYRJxOX6qAs+9W1sA/LjF7S8m2pFaTtE+PopbhJ8fOrb87TCfVshhO6/mWUANXmVVCQn9m+rM4
	ASRfijiJbjWNXdNMg1Xxy6D2M3/A1vcuQIhXGoYkjA4ewgqVqk0tvxJMhRGJ7wWpYJFZE2yXjGila
	U3kiiL3h7fRYgWO3q0lMYUITwzfsoqDTugZTuyc5fNhTvNvgIv41YaE0JTtuFqKLUbHmYOBmHLFan
	eTAN+8HKAMJl0Va5kITsC5cgs3XgZtAljFQVJIWBNPlq5wOEnI7eX66C25e7RAIuzCVfIV/n/5jj8
	PzOlPnE0Xea+/6AK/yYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4tgX-008Yqz-Kg; Tue, 13 Dec 2022 01:02:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4tgU-008Yoh-EQ
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 01:02:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id l10so322535plb.8
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GqFhoQ5IFUAK9oX1MHOecDUK0USc3JCTx3X8yerj1o=;
        b=FtjwIkrUOBV2twjG7aSDbbD70cPG5TPStSgDCsNV45Bhmz74eNy+ozucvejg73x4O1
         Iohs4s0dpsdVjim7W9yTFCi/EcSDg8iCwzhlHWz1fotOSARecFpPQ4Hcfa3qQYCWl4fD
         i1NYMRChruL7+5L6pSJLJXVhu8QmidC5EEUqHA/lI7bch3t3TIv1aCN57q4l7rtPFYua
         FlWlimYfUfUgVCukMvVJuuDDKaWduMb0REZn22mFV2kYcjkEnorPqV83jL7/8bj0vUDj
         SOGbsMyi3efvpD/4Q6/fjpBXN88wAA6q87W5qjPxSb+fHE/weIam6vo+2qT/aO85DhR1
         U6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GqFhoQ5IFUAK9oX1MHOecDUK0USc3JCTx3X8yerj1o=;
        b=00JLFvIfdVufuFCGmfSScBuX8QKnUR1rex2XQD2g1KHbyPGT4T5CNUbLMV5VBWzzZp
         j81Sy4x953QcB3JhdjYTPOFF5QEXwtla6CFuqbqce5chRYuygV+E7ElDS9ahtpdAMveR
         10A7+3znlOgFyA/lYloSw3e1HYVxPTkeiqwrQveEGt0d4RB1+XNg+7O1B0kWh/19YMpx
         djvpBnIxuvFoFqC0P0aAZTl9L5gcJ+3FBrjFdZLzyFiMx4C94uSfEwAaaTqUgSOIC6Rp
         736Az4/Cwp4pJ9rCXNiL2taBqb9IV/9kH9vKObQBVIqJREFvNC2ZwEfAKnBrX9aPHDH+
         tr8A==
X-Gm-Message-State: ANoB5plRsLvwbCwKIPRcMtmAP30UEjW2SrRF71zQA3BDuF88NCSddbAM
	Zm6grZwHTjKjsHKxzxzcV3bTfw==
X-Google-Smtp-Source: AA0mqf6YEPI+D/p+C5vB/eTbMi0DUTnPh+gMPudwZTqoN9JqStWe3ScZcQMFez7S1hpnK/27SYk6nw==
X-Received: by 2002:a17:90b:394b:b0:218:7bf2:4ff2 with SMTP id oe11-20020a17090b394b00b002187bf24ff2mr62913pjb.0.1670893330943;
        Mon, 12 Dec 2022 17:02:10 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id n15-20020a170903110f00b00186bc66d2cbsm7066219plh.73.2022.12.12.17.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 17:02:10 -0800 (PST)
Date: Tue, 13 Dec 2022 01:02:06 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Nadav Amit <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 20/37] KVM: x86/mmu: Abstract away computing the max
 mapping level
Message-ID: <Y5fPDqI7TBngeaj8@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-21-dmatlack@google.com>
 <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
 <CALzav=cashgJPmeKSRQnd_kdYg2EK0G4rygSCt6GaJWSYz3juw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALzav=cashgJPmeKSRQnd_kdYg2EK0G4rygSCt6GaJWSYz3juw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_170214_595847_8A7C061B 
X-CRM114-Status: GOOD (  24.41  )
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

On Mon, Dec 12, 2022, David Matlack wrote:
> On Mon, Dec 12, 2022 at 11:32 AM Ben Gardon <bgardon@google.com> wrote:
> >
> > On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
> > >
> > > Abstract away kvm_mmu_max_mapping_level(), which is an x86-specific
> > > function for computing the max level that a given GFN can be mapped in
> > > KVM's page tables. This will be used in a future commit to enable moving
> > > the TDP MMU to common code.
> > >
> > > Provide a default implementation for non-x86 architectures that just
> > > returns the max level. This will result in more zapping than necessary
> > > when disabling dirty logging (i.e. less than optimal performance) but no
> > > correctness issues.
> >
> > Apologies if you already implemented it in a later patch in this
> > series, but would it not at least be possible to port
> > host_pfn_mapping_level to common code and check that?
> > I'm assuming, though I could be wrong, that all archs map GFNs with at
> > most a host page table granularity mapping.
> > I suppose that doesn't strictly need to be included in this series,
> > but it would be worth addressing in the commit description.
> 
> It's not implemented later in this series, but I agree it's something
> we should do. In fact, it's worth doing regardless of this series as a
> way to share more code across architectures (e.g. KVM/ARM has it's own
> version in arch/arm64/kvm/mmu.c:get_user_mapping_size()).

Ya, ARM converted to walking the host user page tables largely in response to
x86's conversion.  After x86 switched, ARM was left holding the bag that was
PageTransCompoundMap().

On a related topic, I'm guessing all the comments in transparent_hugepage_adjust()
about the code working _only_ for THP are stale.  Unless ARM support for HugeTLB
works differently, walking host user page tables should Just Work for all hugepage
types.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
