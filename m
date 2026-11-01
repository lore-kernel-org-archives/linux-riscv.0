Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0A606A6C0
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QLyKSj8H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiQKvFdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xtcH/6Y0OTdBv0saG5qq4WV1RLrFgvoQ+EFywHmGTb4=; b=QLyKSj8H2zlnJVaICXCf4T6MRE
	ieV60KPDQ+TYzs2q9tlNjlzQx+MJWHGfA5IuhZ2RO23RtXPBCQa1ewc33o1QVN0ejY253FA5AW2Tm
	XGUvyz1AQ/WYDUODuyrpr1SOoDzcWhZTWnd5BmiwCSCrt1AjOPtZbaDfL6yZYdwJbyiucD2FHQkQs
	dgw20NQeoVyQUgPp7YY+z1T8N2nJ3eiqvXk27VHeTTDnzZOcmA7lpTjsrvjpmdvBO7A51Hg2qrD0C
	YgOFVvpJDMIOWpdlMgKdHsNTD2R0AtB7P5K/eK3pCS8ISy2jqIeF7jG9EWp6c9npK7bT/gOOwmcI5
	/OectGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrr-0000000F3uS-1CdK;
	Sun, 01 Nov 2026 22:17:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrM-0000000F28H-3qYq
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19FD7605D6;
	Sun,  1 Nov 2026 22:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30891F00A15;
	Sun,  1 Nov 2026 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571423;
	bh=mwQ54c5JkfJpHrp/y55v3+7zzLJcgDNuv3Y/w5BwAbI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZiQKvFdKyyD65+V/GWduNoaVFFc7LGWrjAt3G2vakfNBLq64wie4OtAB6Lxc2cPzm
	 bU/0maqb8ZSvBgayOuYeaQxSaxCKsLoMgcR0LF/TSdCYbGWkbMB7vvPuNFOuveS/zP
	 8wg3MU06V9Si4ZkuKrfCO0Ch0SRRL/ez40yzZ7d2o2K1HKATkfWSebtBA4Uf51hMa1
	 VDiUGOOsMjstqnDIzz+e/WoXOWvM82m+tZ4Hh4r3b9RzjGQ4EGqswTPobUzsua9GPi
	 /7JnHzakObPpyVXHNcfYIHxhdW0rQnaIz0VrOtcSpkTv1hwVH+VwKuImOMK+A0TNCS
	 gvYlWm4P8QYIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA3CE38003B8;
	Sun,  1 Nov 2026 22:17:03 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH] riscv: mm: exclude invalid THP PMDs from page
 table
 check
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142229.2624073.6074262524879972441.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:02 +0000
References: <20260523042052.35476-1-cuiyunhui@bytedance.com>
In-Reply-To: <20260523042052.35476-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, tongtiangen@huawei.com,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sat, 23 May 2026 12:20:52 +0800 you wrote:
> RISC-V THP splitting uses a temporary invalid PMD state where
> pmd_mkinvalid() clears _PAGE_PRESENT and _PAGE_PROT_NONE but leaves
> _PAGE_LEAF set so the MM code can still recognize the PMD as a THP split
> in-progress entry.
> 
> That temporary state no longer describes a user-accessible mapping, but
> page_table_check currently treats it as one because the RISC-V PMD
> user-accessibility test only checks whether the PMD is a leaf and has
> user permissions.
> 
> [...]

Here is the summary with links:
  - [RESEND] riscv: mm: exclude invalid THP PMDs from page table check
    https://git.kernel.org/riscv/c/bdda2887cbf3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
