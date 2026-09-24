Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB31C98304
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 02:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lTiVaY0FT38x6GGqlUiLTCB5xZJUshADSX8QIKJiC8=; b=z7+V5wcyYF4C0m
	VjNRynHXy2bDpDPkQhuig7KijZO55VVLk42deFuH0WjQjVwjojtZWqOcQxVRoPaSFZgcsOwq4t/nM
	67ATHy52pjGu+6BdEe5YC0s8fXZ8xzcR7OoJzt0lLurv6fQwwIM892oyBbEO5FmvBH+htc3ZpiWN+
	51JBvonTDMOL4XDm5ARwHCN9qZlkc4KGzM0CZ0ObjHn0sXWGOsf49DFzBfU37Q+ZTXZUdXpzxOwGT
	jkW/huNbHoDTwKKZ+2eP+4E6rFizYg06F/kOuHbZyo4vl/h4zLKfTKJB3rj+IjkrW7bL+tvZkRR9K
	uu2VjDEYP94fGi23nswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Zd4-00000009uAs-1rgl;
	Thu, 24 Sep 2026 02:56:10 +0000
Received: from out-95.mta0.migadu.com ([2001:41d0:1004:224b::5f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Zd1-00000009u9v-1c06
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 02:56:09 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=i3rUJrOssAsIlzaIbpG4p7ewG7Kkt+KPljgikjsMoRc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790218564; v=1; x=1790823364;
 b=Ckaz0wTrb9WChEDMMPZoMKsoiASMuXtYD8MXij4Z2VX4tIx/LPQbi9RurLmV+G1NQPuqZ7HX
 6BtLv7sqNe1i5pdNXYy4OvwUj0j3eDqS0R+KFbEIgrQHGJl0yU3C+8Nim9/vhFkwvGufgxCiSe+
 otzbitNzcSXs2oJ1DxiUQs6Y=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9cade30b803883cf;
	Thu, 24 Sep 2026 02:56:02 +0000
X-Mizu-Trace-ID: 9cade30b803883cf
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	guoren@kernel.org,
	bcain@kernel.org,
	geert@linux-m68k.org,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux@armlinux.org.uk,
	vgupta@kernel.org,
	monstr@monstr.eu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	chleroy@kernel.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	ysato@users.sourceforge.jp,
	shakeel.butt@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-arch@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	hughd@google.com,
	qi.zheng@linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 11/12] mm: make userland page table freeing RCU-safe
Date: Thu, 24 Sep 2026 10:55:56 +0800
Message-ID: <20260924025556.18719-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260922-rcu-pagetable-freeing-v4-11-fe1ad1f1e303@kernel.org>
References: <20260922-rcu-pagetable-freeing-v4-11-fe1ad1f1e303@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_195607_572046_B64A68FF 
X-CRM114-Status: GOOD (  12.56  )
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


On Tue, Sep 22, 2026 at 04:35:42PM +0100, Lorenzo Stoakes (ARM) wrote:
>Now every architecture has been converted to support
>CONFIG_MMU_GATHER_RCU_TABLE_FREE, this configuration option no longer makes
>any sense to keep around.
>
>Therefore remove it, and remove all the dead code that existed for
>!CONFIG_MMU_GATHER_RCU_TABLE_FREE architectures previously.
>
>Additionally, CONFIG_MMU_GATHER_TABLE_FREE is no longer necessary, as all
>architectures instead use CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE when a custom
>__tlb_remove_table() is required, so remove this too.
>
>A number of architectures only enabled CONFIG_MMU_GATHER_RCU_TABLE_FREE if
>CONFIG_MMU was set, however the mmu_gather logic only actually does
>something meaningful if CONFIG_MMU is set (mmu_gather.c is only compiled in
>this case, for instance).
>
>As a result, there's no need to gate any of this logic on CONFIG_MMU
>explicitly.
>
>CONFIG_PT_RECLAIM however does have a strict dependency on CONFIG_MMU, so
>make this dependency explicit.
>
>Additionally, correct comments to remove references to non-RCU page table
>gathering and make it clear that this is not 'semi-RCU', nor has it been
>since commit 1fb3d8c20bfa ("mm/mmu_gather: replace IPI with
>synchronize_rcu() when batch allocation fails").
>
>With this change in place the kernel policy is now that userspace page
>tables are freed after an RCU grace period, and thus it is now safe to
>unconditionally perform page table walks under RCU, safe in the knowledge
>that page tables will not be freed underneath the walker.
>
>This is all that is guaranteed, however, so naturally it is still incumbent
>upon page table walkers to ensure that the page table entries are as
>expected.
>
>Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

with David's feedback folded in, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
