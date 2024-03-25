Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6A3CD11BF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NH6nNVP121GQ6TMZHC4/1vrC+bDVsxQ5gbAHCp/9WU=; b=kD6YkanDcwezXZ
	mQ35HD+pdIQFXx3CSJtxbtXT0LsTffOCTFyOx20PJRs9ACORYNTQjTalmOwCg37+YrQCspD/MnPGO
	2RW+tza6KesH/wyVsz5QViFvagCYYJ6z/Cg9Q3IHrtyp/JAfE2PotaB1+8R6WqLeDdwAq6bdgYX5c
	kPuwKHp+/xxro0VFOoiPN7l0suQkb6A5XB6KR78e69pzZLWezyPlAjDsUilL/fW/fsFNHtMZ8k/Wb
	yS771G+BvTZAmED7fQ+3qGDIJNfyo5gEXsye0ejLCZDyjeY8wFysoFrbdpb1oBKzMUpO5B+3/LllP
	AH4vcrjtk8NUHGNUY0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocB1-0000000FEPX-2giu;
	Mon, 25 Mar 2024 04:43:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAO-0000000FE4q-3182;
	Mon, 25 Mar 2024 04:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4E2C60D39;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB0CCC43143;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=XMszcJq9qKpbV4DFBwSekh9f/MWb18ne5dXsAM6kKD8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GdKqpJYqq4nzWFRO9Hpv5UH3Py1smxmB/DXoCXJtllla7M+UbtYM4CJ5/L896W7IV
	 yQNZ+TVXisg+8sTpUFlmLRoFuUc0LEioY4l5kubTTV7+kTnb8wBKXBmUQuqxFirQOM
	 +r7s6pXT4cgp/uVDoprMn8sgYkXHbx8mHeeSxDTGj5EF3mvSNK50KxsmorJkJA4wO7
	 zDT9ZpkpOD2ZRWN3OzSLAbYkoL+iyKgdNDK5cCLI9ndEy0u4mkYkxx8ZcQ9kia61k/
	 zgU/eNUoN3a7r9NnvA0lfHszFUpclZw3XcF/Xe2dG4exz/EXhbcXzChTQzT6SVcFzX
	 xxSpvAwPq1e4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB1EAD95072;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175476.18749.11889611045887549553.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240129124649.189745-1-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org,
 ryan.roberts@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, dinguyen@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214236_920132_C3836033 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 29 Jan 2024 13:46:34 +0100 you wrote:
> Now that the rmap overhaul[1] is upstream that provides a clean interface
> for rmap batching, let's implement PTE batching during fork when processing
> PTE-mapped THPs.
> 
> This series is partially based on Ryan's previous work[2] to implement
> cont-pte support on arm64, but its a complete rewrite based on [1] to
> optimize all architectures independent of any such PTE bits, and to
> use the new rmap batching functions that simplify the code and prepare
> for further rmap accounting changes.
> 
> [...]

Here is the summary with links:
  - [v3,01/15] arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary
    (no matching commit)
  - [v3,02/15] arm/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,03/15] nios2/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,04/15] powerpc/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,05/15] riscv/pgtable: define PFN_PTE_SHIFT
    https://git.kernel.org/riscv/c/57c254b2fb31
  - [v3,06/15] s390/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,07/15] sparc/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,08/15] mm/pgtable: make pte_next_pfn() independent of set_ptes()
    (no matching commit)
  - [v3,09/15] arm/mm: use pte_next_pfn() in set_ptes()
    (no matching commit)
  - [v3,10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
    (no matching commit)
  - [v3,11/15] mm/memory: factor out copying the actual PTE in copy_present_pte()
    (no matching commit)
  - [v3,12/15] mm/memory: pass PTE to copy_present_pte()
    (no matching commit)
  - [v3,13/15] mm/memory: optimize fork() with PTE-mapped THP
    (no matching commit)
  - [v3,14/15] mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
    (no matching commit)
  - [v3,15/15] mm/memory: ignore writable bit in folio_pte_batch()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
