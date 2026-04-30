Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD990FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdIS7DwaCDtzrUKMj6diRE0Uo9wk8lXjeuokJKQHHI0=; b=SSA6qvElIYikSQ
	wD0iu2dQg49+HfwJTNQpdYMFfQVYQzmQ+M0x/wFRcKKSkqvaludqNmaNDdWicgNze1vXvgSObXYR8
	MTe2aswECv/v3ePCC138H3qMLlYC/dQsi6Z2OSLpGa/jHyJiesaMkBx2NsFz/dh9SQgxdLNkOzEJ9
	JETHn3j7gVqfEG6aN2k3+rMGDa84OEHw+lluYV9C5R+cDMCC56Xk69HpSUCy7ywwPfuj/N7Q2AV7j
	khQwdzWRn9LMPM4Y8YRyjLKydkS5YUtNJwJ5b6hJRcgUJd6Ma6kCBreLoGSkd9zKY5b2PARnZ2j5Q
	xCzoMdCC61SNuGyKmCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3t-00000004Xuk-3swd;
	Thu, 30 Apr 2026 03:27:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2k-00000004WjX-1VIl
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13F8840B7A;
	Thu, 30 Apr 2026 03:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9403C2BCB8;
	Thu, 30 Apr 2026 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519586;
	bh=7NsYW91aqne8euCtRV/Zaf8K1DQN8v/p5dHajdo+8yc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BDggSUI/DU00ul+f1gXDXnnF9GW7Ln4bEPIleiGatyjAcEDR3/0c3HZ45qeuP53O+
	 RHqUBUleYalpg/t7kM2RRrOc7opPlWUoW4RC7GR5y3Bs0jP+staKlwJZvt8AY4Vght
	 GW5FNvgEwFUCcJDe8gKUKchXT0d4R9CHF5faG0OmsqjTk7ZMlgaNiCobP6ZJa8bHjV
	 843djgTadQOXBoY1gLWaFLk3iH4N4aTsoXVrb85auq+UuOKSwFnXafOsRXr416j9cA
	 Mt9x87MJjmjRNDYbbOA3t6kXEA8gYvQZOIzytzDlqzDkDODp/PFewOmUK5nEEmUChG
	 6H7uKZd5Pu/eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD063809A07;
	Thu, 30 Apr 2026 03:25:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 11/18] x86/vdso: Undefine
 CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751954081.2274119.4093898849560517911.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:40 +0000
References: <20260227193030.272078-11-kas@kernel.org>
In-Reply-To: <20260227193030.272078-11-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202627_477907_DE15B781 
X-CRM114-Status: UNSURE (   7.72  )
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

On Fri, 27 Feb 2026 19:30:12 +0000 you wrote:
> The 32-bit VDSO build on x86_64 uses fake_32bit_build.h to undefine
> various kernel configuration options that are not suitable for the
> VDSO context or may cause build issues when including kernel headers.
> 
> Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP in fake_32bit_build.h to
> prepare for change in  HugeTLB Vmemmap Optimization.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,11/18] x86/vdso: Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
    https://git.kernel.org/riscv/c/76351f2f0c27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
