Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D0EC64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0M+3b/mY/5q9ZwGXu5Pdp6qhdFeDwnNkGuL/ced/rs=; b=S2PNq08Ag1PIdL
	v9styePvjUY9J1UgZEdsgEK80JYpDeguhkpz2pQphAAyxaSLj1ss35Np/SKtq7Cr0eThPlrJHkFtO
	J9G5HKa54jvMVLF9AXFA0Wocw5mbl4OChPP8X0TJ1fMbbxPIQfK2EqHRPqyl4cX7GbFBB+xUYY/xw
	REgQMvwSagxpJdQl9w5plw2BCO9sgeDMyG4sQrsJtOMH7S03eVAuZBjWlRJs4hvbanR8m5heSJDv/
	gMdd2NGCpBxqQ10d3jj7sSYFIf9nz/YI4KOixW5UXmIPUn3SqB/prMZWN9drLKuUNCoiH+dnU/Csj
	Ae8XVIxhHEdBF4OAfjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7Fx-00EInE-Nm; Tue, 28 Feb 2023 21:11:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7Fp-00EIh7-Ss
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 21:11:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1943A611BF;
	Tue, 28 Feb 2023 21:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C6F4C4339B;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677618677;
	bh=IB9Sk6Sew2oBE0tBUuiuebk20E+C56Ut6PZLin772Nk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=emOgvl42vWzqzWChtKHzMHvotZsKDFOYMyzPq7CQAWnydVT3wCUftCrJgz4I96sVT
	 J/p2OpBWB1Pfl7lM95qMXkEOuSSwV3OOY5QkIi4y4E4TMiphO/6LCFUrjcj6VtVV7y
	 OqFAVUEOEE+LHNIKcVtUjyUQDYVHHnyUdND45alz0Hd9SkIYZjwDkf5s6BhiNivQ3t
	 ooc1Zz4w4sfDqIRqmXhnwa/PPz8cRzyNIKX7rNjgeVdg9M8zNjUmOXtoCwjv3phgR8
	 zgYKOqkEV/UonTYwYdQveKsTxgsF4XCJOJ+DHfzlb61xD21CVpekeZTvgvBIXth6Ct
	 kGAa595muc6kQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50A4DC395EC;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167761867732.10135.11248419155612086016.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 21:11:17 +0000
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, netdev@vger.kernel.org, hch@infradead.org,
 david@redhat.com, mhocko@suse.com, peterx@redhat.com, nadav.amit@gmail.com,
 willy@infradead.org, vbabka@suse.cz, riel@surriel.com, will@kernel.org,
 mpe@ellerman.id.au, palmer@dabbelt.com, borntraeger@linux.ibm.com,
 dave.hansen@linux.intel.com, brauner@kernel.org, edumazet@google.com,
 akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_131122_020488_7B2A1FBC 
X-CRM114-Status: UNSURE (   8.59  )
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

This patch was applied to riscv/linux.git (for-next)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue,  3 Jan 2023 16:27:32 -0800 you wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> [...]

Here is the summary with links:
  - mm: remove zap_page_range and create zap_vma_pages
    https://git.kernel.org/riscv/c/e9adcfecf572

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
