Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426D3C531E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGm4R2cHdFDw9tA6nNabKYJyMaaTCSNZ6PJu6e2kj5w=; b=wUOvMCbvR5BmZ0
	fBgFWitgUKZ1qRQjms3J3+IJeuAeTqfMScxIBgac7Twtzx3bjHoAk1tD/PSp5nn5gGJonrzd5yoTd
	9z+l512MfbTHBtNEBX2mxLM12Jsplijjd/8NdufU+a8RKBA1DlEmIi0suMEzZ/pZTozNksHbXxTsH
	hp/hdz9fTc9dM2xXRzlFfMg+k3Ft8S5+XXKDZa6oe9m/09Tr/7as8yjNYaiv6tz4EbLVVS/NkG5yH
	baiZ7FTdnyD4ydN1ulHaBvOWz/VBtb3CNBq0c4vFqGvxtQCvYe7cQorNoChRus4Z9SBAbvswysrIk
	iSgnj3xpzfAhwHgFOZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqd-0000000DCGO-2xTc;
	Fri, 20 Feb 2026 04:10:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqb-0000000DCFT-1VFz;
	Fri, 20 Feb 2026 04:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84F376184E;
	Fri, 20 Feb 2026 04:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267C4C19421;
	Fri, 20 Feb 2026 04:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560631;
	bh=YLLAbyGm0F9m0Mypc3ideA8QOvIO6kTmhd+3yWxkaE4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kTtK5AKZ1RD3Hd+Qxzib1YAeeESOC+72wxWtnIJN6iDEVUEIY7Rxl2ePuPiN/V5o/
	 k+rZIs9FvLnPIxPUWEwmtTWZePyqnygsvQ/oRArPOSMUQehN9ZmGNPzN/htt5J58Ai
	 qcfxI2WQy0ULly43wzvW5aObYdstSnWi5aOFUekprwhQS9sIRFzYU9aMBGM2c3HeI2
	 Zee+wtGMbpNJzghQBk7w0eK0VIxBPrxD2SptGPil48nFuUCxTHwCt5C3MokQ+6Oo4M
	 NnfGIuud5nhQXgIazdRPxlu5zrkOUi0ojKCNfxJMh6pEIcV6UUhN2bIxI3/yprxCQG
	 neCFLK/sxgU3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EF73809A88;
	Fri, 20 Feb 2026 04:10:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156063929.189817.18154815738132303149.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:39 +0000
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
 akpm@linux-foundation.org, maddy@linux.ibm.com, npiggin@gmail.com,
 rmclure@nvidia.com, chleroy@kernel.org, alex@ghiti.fr, x86@kernel.org,
 nicholas@linux.ibm.com, sweettea-kernel@dorminy.me,
 andrew+kernel@donnellan.id.au, ssrish@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, 19 Dec 2025 04:09:32 +1100 you wrote:
> [I will be leaving IBM in about a month from now, and will also be on leave
> for most of that time starting tomorrow. I've cc'd my personal email, which
> I am going to use for any kernel development I do after I leave, and also
> Srish Srinivasan, who will be taking over some of my work.]
> 
> Support page table check on PowerPC. Page table check tracks the usage of
> of page table entries at each level to ensure that anonymous mappings have
> at most one writable consumer, and likewise that file-backed mappings are
> not simultaneously also anonymous mappings.
> 
> [...]

Here is the summary with links:
  - [v18,01/12] arm64/mm: Add addr parameter to __set_ptes_anysz()
    https://git.kernel.org/riscv/c/9ac4941aceb0
  - [v18,02/12] arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
    https://git.kernel.org/riscv/c/ee329c29fde8
  - [v18,03/12] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud[s]_set()
    https://git.kernel.org/riscv/c/c4a0c5ff85b7
  - [v18,04/12] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd[s]_set()
    https://git.kernel.org/riscv/c/6e2d8f9fc4ed
  - [v18,05/12] mm/page_table_check: Provide addr parameter to page_table_check_ptes_set()
    https://git.kernel.org/riscv/c/0a5ae4483177
  - [v18,06/12] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud_clear()
    https://git.kernel.org/riscv/c/2e6ac078ce5d
  - [v18,07/12] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd_clear()
    (no matching commit)
  - [v18,08/12] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pte_clear()
    (no matching commit)
  - [v18,09/12] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
    https://git.kernel.org/riscv/c/d79f9c9cf703
  - [v18,10/12] powerpc/mm: Implement *_user_accessible_page() for ptes
    https://git.kernel.org/riscv/c/2f5e576598c9
  - [v18,11/12] powerpc/mm: Use set_pte_at_unchecked() for internal usages
    https://git.kernel.org/riscv/c/2360f523a49b
  - [v18,12/12] powerpc/mm: Support page table check
    https://git.kernel.org/riscv/c/641d47d4c963

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
