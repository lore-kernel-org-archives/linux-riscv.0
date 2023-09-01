Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE2ECA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGDiTmOlNAWigaNyy6iSkU42kDUozwEhH0YRweutv2A=; b=J4EYD/hVsqlTlb
	zhEZ9IyEgMpi+drsoEcTVYbEn+M3Jh4pLI26UPN8NBXcbA4W7/4TLqEmBuNgibpQulnSbO601BVqa
	0s6ubn8VNTKc+Rx7WdJI7EUjsP4KE+wMS5JjPejklQgaa2ySkCgWAD6r/lMfJF+Uv0sHCUl9T8ufv
	Sb5UN+UILBi5HYbc+WLu/fPZNqm9ibQokLIgZQ8fDlca1pMbXH/92+x8P5pvjwmWJJZxH5JO4LRMv
	335Q/HMTTb9lXNVqtPvOx+/p//kT+O5EbqmlgBDDEP1XpesjJOmbBMjbbrQ9IGqQdH1uEJtKOkRDc
	dzbboiNdBjFMMbo3UsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xc-000A8V-1j;
	Fri, 01 Sep 2023 16:25:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xY-000A1I-3D
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 16:25:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3BD84B825B9;
	Fri,  1 Sep 2023 16:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BFDBC433CB;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=noAvIfpMGFcZorZdKdFmseXEzNomZCMzL+8qZXfzzJk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZDKqWbh1gbOILnoUkmILmBnmCqApJbL1o4X6I7NxlIF5Bw86+I5KDeVng4+GDq532
	 OVrw9hCGh38cvj+9jge4FUsv8m1q0r6cvbObtvuoLoN52kC9ge4s7QMkYUVoO2AvdL
	 6SfgoZE0LKu2TAfDqhwBOyshO1UCyvW+PJl7BiieoEIN7swSAhOnLr5deHucUnqyGh
	 ZO7AgqUyGwRbZ8PLm126bpbvQswhPJ8tgOxzpWzrFG2+g/sjnRpx11o60z8umIR3yu
	 VgvB1sO1BR0dX/dt5wnPb/Z4K/yLPj4kZ82KqVTuQ0ge67eHf337Ok4gsb/nBiRC/5
	 ZSfpO3lJgKsLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83DBEE29F3E;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 22/38] riscv: Implement the new page table range API
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169358551553.8276.14329578180496231845.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <20230802151406.3735276-23-willy@infradead.org>
In-Reply-To: <20230802151406.3735276-23-willy@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 alexghiti@rivosinc.com, rppt@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_092525_185873_7678F113 
X-CRM114-Status: UNSURE (   9.59  )
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

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed,  2 Aug 2023 16:13:50 +0100 you wrote:
> Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
> Change the PG_dcache_clean flag from being per-page to per-folio.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> 
> [...]

Here is the summary with links:
  - [v6,22/38] riscv: Implement the new page table range API
    https://git.kernel.org/riscv/c/864609c6a0b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
