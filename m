Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7648CC3DA7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FB+0R3hnW8Yd9ZAR4UHHi1w5vVN8c7i5KZXLgIYItk=; b=ZwercdnxY+R4Ox
	6PJgSosjmyX7qEhsy3T0TaD8bB47qJaBj83lcIz7n0rNDKCKFCSLaK3cZXtayZOjCNKaEdFJqrtf6
	/LpuqP71f3gztlYOr31XO05pLLZNgLRck7DehH6w8rXDDWH+LvBSZhSXLcgl5kQZ3owfglvEkC8+x
	npxbhdhJIjLR9fzBrlEu2jp28vaqo548/oSP8wJnW1bLk85POv73vvkRA5SrJ0B+skJ0Nwp4Ih3N8
	Jc4tJaR/6DxfRX3fgwAUNxe338a2DrUc7Ilu7gKyWb2mIK5LlJ37M2lOXmxFokjz4PEqIcPv3yxNl
	JokDtSIbSUWG4l+XyZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTQL-0000000C53w-0cfi;
	Mon, 29 Jul 2024 16:40:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTPR-0000000C4hp-1xyC;
	Mon, 29 Jul 2024 16:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8301461B96;
	Mon, 29 Jul 2024 16:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAE1BC4AF0E;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271180;
	bh=mNvXML5Nk4yWB83caFXu2jPWm4A4dReK0f5e32AqTwU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YFoaUtwfPkoJfSSKHESCAmhmix7yJANDH3e6NCD2V1gwyJj+Lmj4VEPTAQvcG1wwa
	 1IR//NNVLaDgA4+bKqtuaon4VjXb3Pi8NIgBRWCdy+x0skAlMRiztQFYk+xP6Rv7KS
	 TphF5dMxBvS+A/yFC8il4awQtrLV3CcpYcwimga/rokLykHh3F38ffFGPwfaLgSzWF
	 s+irSv5UYKf06ktOA8g34jq33VkVLAeDgMs6cJVK2jB1tYyOvxIoakTdIvth10WEN6
	 b9Tju6W4OPwJdsBLWT9Z+3u8e9hmBsxZmBvPtrtGePw4P5+o7tKGPdA3YAHXPY3QEF
	 8R57Th8w623jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D69CEC43638;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] vmalloc: Modify the alloc_vmap_area() error message for
  better diagnostics
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172227117987.3603.11842142446691677565.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:39:39 +0000
References: <CH2PR01MB5894B0182EA0B28DF2EFB916F5C72@CH2PR01MB5894.prod.exchangelabs.com>
In-Reply-To: <CH2PR01MB5894B0182EA0B28DF2EFB916F5C72@CH2PR01MB5894.prod.exchangelabs.com>
To: Shubhang Kaushik OS <Shubhang@os.amperecomputing.com>
Cc: linux-riscv@lists.infradead.org,
 ampere-linux-kernel@lists.amperecomputing.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, cl@linux.com, corbet@lwn.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, guoren@kernel.org,
 linux-doc@vger.kernel.org, xiongwei.song@windriver.com,
 linux-csky@vger.kernel.org, willy@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_093941_581452_EABEB214 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, 11 Jun 2024 19:38:44 +0000 you wrote:
> 'vmap allocation for size %lu failed: use vmalloc=<size> to increase size'
> The above warning is seen in the kernel functionality for allocation of the restricted virtual memory range till exhaustion.
> 
> This message is misleading because 'vmalloc=' is supported on arm32, x86 platforms and is not a valid kernel parameter on a number of other platforms (in particular its not supported on arm64, alpha, loongarch, arc, csky, hexagon, microblaze, mips, nios2, openrisc, parisc, m64k, powerpc, riscv, sh, um, xtensa, s390, sparc). With the update, the output gets modified to include the function parameters along with the start and end of the virtual memory range allowed.
> 
> The warning message after fix on kernel version 6.10.0-rc1+:
> 
> [...]

Here is the summary with links:
  - [v5] vmalloc: Modify the alloc_vmap_area() error message for better diagnostics
    https://git.kernel.org/riscv/c/55ccad6fc1a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
