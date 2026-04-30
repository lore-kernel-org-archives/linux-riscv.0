Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307BCCD13DE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSbAMF4HOIKw1T0VXQboZtX2jxUq0WjqvCzProZGGBg=; b=An+5zHSQT7B+hN
	pFmIaxD5FuVZdThwb0LeuPpolHmVJJCUlqkW7oIs8PxAjC05Yba4VfowAIMN0nWEvIlpyG7wdUpjg
	jyNJIpm3BMF+GH5+WmZMwISQnEtCphIdJmwLC4/HUY5IKqafIhw8qyUBRuAqu0gy2Cb69mxP44LnY
	VdZ5BOUe9Lu5oLN26hKvSn1Ge6uqxMiTiay399iDAYCwgSIJT/Xz987Q3Inn8752uKaK3kFA/j2dj
	EFHeAFkOeugSwIT4DdG2mS1UVYmqtuMz5ZJltTnSs+M5UXQv6kIrHjYkDM+UBOAZi0uDvaojaKGIw
	hf1KeMwYdJbOuEa7t6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2v-00000004Wsr-1TT5;
	Thu, 30 Apr 2026 03:26:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2K-00000004WRe-2tUi
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68490445A1;
	Thu, 30 Apr 2026 03:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC8C2BCB8;
	Thu, 30 Apr 2026 03:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519560;
	bh=FqQgY6wUDRilF2lGF6AUp3SKA6W84Y4EVzMNWrmj1MA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dBlnnBYufwWMR1nExtz6aedB6xaU7P3x/0oqMjOtTdGUGUeJhPpncFc8sQY3bIxea
	 XS/p9LPRIkyQYR5a1xzoJhZL0FGP3XnLB7ZOHUY+pjLBscTvEbhOx3347ogxt9Bg+O
	 C2d21DtveABggnbmyzR85YZv8OmWR7FrM7RHm1MgP1DRBG3Ws+XDi1lSb5QcoQRFQy
	 HggmLnjnOtaQyPsKj5Of94mOctLczazEPyKkSBrZTM0g4YEqgl8wDGz5u4d4xH7e3X
	 tNGIsp/yArFBiyVYOS04DFlQB67Ot1uXHMbEsSeRTpDG+n3WdwGMNxgjPm1MfRZuFz
	 N/I5dqZRvaPOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF413809A07;
	Thu, 30 Apr 2026 03:25:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/15] mm: memory hot(un)plug and SPARSEMEM cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751951529.2274119.16732782086222000591.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:15 +0000
References: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
In-Reply-To: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
To: David Hildenbrand (Arm) <david@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, osalvador@suse.de, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, sidhartha.kumar@oracle.com,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202602_815453_57AA598A 
X-CRM114-Status: UNSURE (   8.24  )
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

On Fri, 20 Mar 2026 23:13:32 +0100 you wrote:
> Some cleanups around memory hot(un)plug and SPARSEMEM. In essence,
> we can limit CONFIG_MEMORY_HOTPLUG to CONFIG_SPARSEMEM_VMEMMAP,
> remove some dead code, and move all the hotplug bits over to
> mm/sparse-vmemmap.c.
> 
> Some further/related cleanups around other unnecessary code
> (memory hole handling and complicated usemap allocation).
> 
> [...]

Here is the summary with links:
  - [v2,01/15] mm/memory_hotplug: fix possible race in scan_movable_pages()
    https://git.kernel.org/riscv/c/89e69c7d187e
  - [v2,02/15] mm/memory_hotplug: remove for_each_valid_pfn() usage
    https://git.kernel.org/riscv/c/9d80de66a046
  - [v2,03/15] mm/sparse: remove WARN_ONs from (online|offline)_mem_sections()
    https://git.kernel.org/riscv/c/e66383b6746d
  - [v2,04/15] mm/Kconfig: make CONFIG_MEMORY_HOTPLUG depend on CONFIG_SPARSEMEM_VMEMMAP
    https://git.kernel.org/riscv/c/fb3c3f5d27ef
  - [v2,05/15] mm/memory_hotplug: simplify check_pfn_span()
    https://git.kernel.org/riscv/c/62257a5fb987
  - [v2,06/15] mm/sparse: remove !CONFIG_SPARSEMEM_VMEMMAP leftovers for CONFIG_MEMORY_HOTPLUG
    https://git.kernel.org/riscv/c/119c31caa59e
  - [v2,07/15] mm/bootmem_info: remove handling for !CONFIG_SPARSEMEM_VMEMMAP
    https://git.kernel.org/riscv/c/41293414433a
  - [v2,08/15] mm/bootmem_info: avoid using sparse_decode_mem_map()
    https://git.kernel.org/riscv/c/7f8e592bb327
  - [v2,09/15] mm/sparse: remove sparse_decode_mem_map()
    https://git.kernel.org/riscv/c/22688ade3b54
  - [v2,10/15] mm/sparse: remove CONFIG_MEMORY_HOTPLUG-specific usemap allocation handling
    https://git.kernel.org/riscv/c/dac89b150bdb
  - [v2,11/15] mm: prepare to move subsection_map_init() to mm/sparse-vmemmap.c
    https://git.kernel.org/riscv/c/fead6dcff83b
  - [v2,12/15] mm/sparse: drop set_section_nid() from sparse_add_section()
    https://git.kernel.org/riscv/c/b551ed94d959
  - [v2,13/15] mm/sparse: move sparse_init_one_section() to internal.h
    (no matching commit)
  - [v2,14/15] mm/sparse: move __section_mark_present() to internal.h
    https://git.kernel.org/riscv/c/08e5f77c3720
  - [v2,15/15] mm/sparse: move memory hotplug bits to sparse-vmemmap.c
    https://git.kernel.org/riscv/c/738de20c4faf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
