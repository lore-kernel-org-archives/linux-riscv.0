Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062B9C9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSinrk8TxoaevdA42TF6KvqhYNRn0s5eU2R0mzL5rjE=; b=uJ1nzMxvnT+lHs
	aVAk3lw9sBlIdjlyMMo8EradU2mkRiOYo+DYuPMwjeca2JPlv5kcM9QOPq+1Hn1Mc8F3WizZlEcav
	qFYit5E4tirKz0pF4XVzpgDstmq1Ghpq/lhFBr0TIA5+zW640dQxKT5SXVvdcn1il6iQuTgZt9Tyj
	nhSFdbqv+o2j6j/e5Eq/wBJfLQhFOLJbSx/KG+foSzRrxl+sj427dUhrs7kLSksJyajABM3u0Ny2P
	wstpp7uCEuTDDTSnFuESpY6MRweK15VB8SXkRY4MccG6cbT+eQG55a+M+BcOiyHiuGjcG3obMnbfh
	sv5+1+DMHOJABCRYf1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T2A-00000009MkL-3P0f;
	Wed, 23 Sep 2026 19:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T27-00000009Mjf-3v3l;
	Wed, 23 Sep 2026 19:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A726741A56;
	Wed, 23 Sep 2026 19:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0D01F000FF;
	Wed, 23 Sep 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790193214;
	bh=p4edf0YYCmWA79RL5zC8Xmz8p09vaatBemczrDrD/n0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eE9WCS2ousaSTQemTQ4AA1ZkY9n6f+r4xISLZALK3AMHEPFEmixpwYev88YxZLXeN
	 CHmB0H3Bw3SM8Ql9Z+14bUyIFrP0hgQ5aVwbxlPcF2pYaWAyJOWebDVlGCFrkFZrGM
	 ck3P7oheu0DSTRvd14VSbm/sP0AV2Mko/VrdoIFk=
Date: Wed, 23 Sep 2026 12:53:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Guo Ren
 <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster
 <schuster.simon@siemens-energy.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, Rich Felker <dalias@libc.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>,
 Vineet Gupta <vgupta@kernel.org>, Michal Simek <monstr@monstr.eu>, Chris
 Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon
 <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick
 Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 "David S. Miller" <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Shakeel
 Butt <shakeel.butt@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Randy
 Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, Hugh Dickins
 <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 01/12] mm/khugepaged: deposit a newly allocated page
 table on collapse
Message-Id: <20260923125331.882dfeb1f43d284b146a4633@linux-foundation.org>
In-Reply-To: <arN7q5nHz7iebA_e@gremlin>
References: <20260922-rcu-pagetable-freeing-v4-0-fe1ad1f1e303@kernel.org>
	<20260922-rcu-pagetable-freeing-v4-1-fe1ad1f1e303@kernel.org>
	<arN7q5nHz7iebA_e@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 23 Sep 2026 08:14:01 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Andrew - would it be possible to make one quick fix up below?
> 
> Fixup is here:
> 
> -		if (!pgtable)
> -			goto out_nolock;
> +		if (!pgtable) {
> +			result = SCAN_ALLOC_HUGE_PAGE_FAIL;
> +			goto out_nolock;
> +		}

--- a/mm/khugepaged.c~mm-khugepaged-deposit-a-newly-allocated-page-table-on-collapse-fix
+++ a/mm/khugepaged.c
@@ -1329,8 +1329,10 @@ static enum scan_result collapse_huge_pa
 
 	if (is_pmd_order(order)) {
 		pgtable = alloc_deposit_pte(mm);
-		if (!pgtable)
+		if (!pgtable) {
+			result = SCAN_ALLOC_HUGE_PAGE_FAIL;
 			goto out_nolock;
+		}
 	}
 
 	mmap_read_lock(mm);
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
