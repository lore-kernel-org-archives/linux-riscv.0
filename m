Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AA2FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udf4l9sw1it7UMmbpRHV6W1HeW6DXPrAmouSYELYjq8=; b=i3XPPE4/C50PlJ
	HlBsalv+QI+hCKSI1SZL/ErtgOmi3Mf2d5bDzj1w8AzdM20wWrjvShOTfp9f9Sxi12aS9F6xESQX3
	w7yiU95eU/XLWmkSUQC3N7yuYyzIVSZ/HK3YUq3p34urHE51OP4yIGCEqnaSBxa5PCukaKT66tdx/
	wA9O23pdr9F8MByoRWvoCbqGbPvhs7KMCbYWjb+RU3EFHpyPMiBuvh3QOnwWZwb073Y8sAju5D7hT
	dNybH7um+bfac8GuuuFBuks7neqYnFcLMc/OeLWHCYJf8oluIZC2cdrnCFghfBtqexFokVa5E3lbe
	pHQV+a9Z0frHsWm3xwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3c-00000004Xep-00sp;
	Thu, 30 Apr 2026 03:27:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2a-00000004Wdi-31hg
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B24796111B;
	Thu, 30 Apr 2026 03:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CBBC2BCB8;
	Thu, 30 Apr 2026 03:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519575;
	bh=smOY6pVVDHq+6KTLdCSD+6r2J5A4soRjk1OnTI5ZlHM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dlIOoBl75hOEvwa9uZFaZ+vWlsAdTS39VaV4zcZr1mzQxorM426fS9+fb28XtX88C
	 mIMu8bSZblyQBO31WlUqBz/lLMExGlKNb2t502quWMfL1IhwIaR/AD0zsN8a+NTHJ6
	 zmf4ytfrdcHkQlThMspBfvMBQDI0tL1x8xlIkXHVW0gMUhTWpoTSTiWboBMAsfLejF
	 xMSpymzn8EpJxwfu8ylIwFEzlUqynLBRHPUrG3gQLEWB71MSDyIjlXH8YvuULeIEX1
	 QjYiMQ3POVX8oQTp1LZaq859UmwFqPiAefqkYOMchJ+U9DxQPoBfsXiabOdjSMuvQk
	 U0dvV/7SEMN8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E8D3809A07;
	Thu, 30 Apr 2026 03:25:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 15/18] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key
 static key
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751953040.2274119.2787096861157625411.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:30 +0000
References: <20260227193030.272078-15-kas@kernel.org>
In-Reply-To: <20260227193030.272078-15-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, david@kernel.org
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

On Fri, 27 Feb 2026 19:30:16 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The hugetlb_optimize_vmemmap_key static key was used to guard fake head
> detection in compound_head() and related functions. It allowed skipping
> the fake head checks entirely when HVO was not in use.
> 
> With fake heads eliminated and the detection code removed, the static
> key serves no purpose. Remove its definition and all increment/decrement
> calls.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,15/18] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
    https://git.kernel.org/riscv/c/da3e2d1ca43d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
