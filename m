Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F99CC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itXhrRLwORRa22ylJI9sbrwUC75M30HS8CkO4v3eOUs=; b=2j0eYM24qXFx7F
	Hhx5BywDWvCH+0Gp/GLJY9lIFfKtXkxN9tdqF25y3tZLRj+wVc88xLb6zcYe57iI2ELA9pUiH4zQt
	i4k7GON9DPxcbB+prq6osRO/KYT/UBmkNpNrWuxPI5lZQ+79Jx6fboksQKkH9/Y8xmeT7gtMX1zBV
	p7pzUifEwaR7yNp2WT16tNaTjDem2HcVwQE2RP2pz90P3Gu+euKBqQhZUmEyJv1cIEKp+ANPrHN7N
	h4ReRMC1izHrU2EQl72zDGCX894uAmB7u0zmSysTSq7FAIopwWuLkKNhcDd/+rQ/tnoio02IqWCNj
	xVVE5JesXaSxrIbjsbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3i8u-00ALZn-Po; Fri, 09 Dec 2022 18:30:40 +0000
Received: from out-153.mta0.migadu.com ([91.218.175.153])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3i8f-00ALTR-5d
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 18:30:28 +0000
Date: Fri, 9 Dec 2022 18:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1670610621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sp1A6UXIoqNJWGJtdonH4Zsm1F89DCGx3ZYcZ2op3bM=;
	b=jR4PiHfMsMGnm69Suf71e/70K7WEW4Ckwww6P2DbR1hvNOndJUptnkqHKMBTt6fIGBmQdr
	ov89mpeQhS51X1/M2mDXZLGgvayYnsNMKQf+C//bfr73BRyk9BbiZau9RKlj5+SRQzhmAd
	54D8anc79u/KgI2hxA84HnHQ8nsdRfk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
	Sean Christopherson <seanjc@google.com>,
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
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 23/37] KVM: MMU: Move VM-level TDP MMU state to
 struct kvm
Message-ID: <Y5N+s1BR7hacr8U/@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-24-dmatlack@google.com>
 <Y5NxCYz9XV3hgGYX@google.com>
 <CALzav=f-qDqJcvPEo1ZxxVizAE77crMFsbKUVif5B-mNgGEHyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALzav=f-qDqJcvPEo1ZxxVizAE77crMFsbKUVif5B-mNgGEHyQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_103025_703729_9DA640A2 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri, Dec 09, 2022 at 09:57:15AM -0800, David Matlack wrote:
> On Fri, Dec 9, 2022 at 9:32 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > Hey David,
> >
> > On Thu, Dec 08, 2022 at 11:38:43AM -0800, David Matlack wrote:
> > > Move VM-level TDP MMU state to struct kvm so it can be accessed by
> > > common code in a future commit.
> > >
> > > No functional change intended.
> >
> > Could you instead introduce a structure to hold all of the MMU state and
> > stick that in struct kvm? If the goal is to eventually supersede all
> > uses of the arm64 pgtable library we are going to need the ability to
> > operate outside of a KVM VM context.
> 
> This patch does introduce a tdp_mmu struct to hold all of the TDP MMU
> state. Did you have something else in mind?

No, I'm just an idiot without caffeine. I read the patch then forgot
about it when reading the changelog. Sorry!

--
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
