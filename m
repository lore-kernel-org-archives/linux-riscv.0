Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE80CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdM1Q2XcrO/++zgnDcuj4LO+/JDjEZz920TZjHuWe7g=; b=i1BrCmHVfSldFy
	/kB7PYnzOWSmgIRm6sS2jfPLcV+RKaGaaqzGg/N7mLSyK/IS7n0UklSoQYrB6ParDr+SidCLoAyWC
	+QLVN9NRzntwrcbUU3+wgfmfKBW6335KgsJTstb6bpc6hSW5QihGPc1S6/CqqCRlXV8wNh8fPy0kO
	Bhd30ONNa9H+NUq+26cOQrX0dBRtl3BecYuiLkALIVWHbm4UA3UlL2S6oabuIU0dMU16F6Yspu8EH
	+3B4eXiOltSIjURTQ8MFmompKdvORiZBgAU8Itr8l7W2Ji4OBJEcmPXNz6vzkH8Opufx4GIJHiKsV
	g0rm95xhDA0glHcPGTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3n-00000004Xl9-2N2X;
	Thu, 30 Apr 2026 03:27:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2c-00000004WfK-3c1b
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 848C844587;
	Thu, 30 Apr 2026 03:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68319C2BCB9;
	Thu, 30 Apr 2026 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519578;
	bh=47f6wiWNhzOqt1LxqL7cNkDmVIEiOhL3j+AXGV6BKtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cl9E+pNFzygSkS9LU/raL18uAT2/mdwVF0PbOkbJFVE2UnECPe1iib5UKDbz/VFiB
	 kCueQLkBhWbRQ6xkD5hfnrYJJitPDJ20v3dqbagbqe3Thwq9vPSamcXk64ppjOAWIM
	 0Odo3lSTHVNjv+zUtbfeUXCXcL5YKfO8ee7DlMznTcjH2rfmNDqS9UPzFzFor/KH8a
	 OLm6+qme5UNwIMLcImLlbQUQX7W7NQi3nQ/wDgUh9nvkufIp3vgnGETLL1SyXgrN2j
	 hnqogKGfQLce6UWx/XmYM1y2W8pzY9O+AwA1F4QkZ2h7SpSwvzzeWdQj+1RDLx16Tr
	 J5G98eNyx8p9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EBB3809A07;
	Thu, 30 Apr 2026 03:25:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 10/18] mm/hugetlb: Refactor code around vmemmap_walk
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751953329.2274119.9976334880562386444.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:33 +0000
References: <20260227193030.272078-10-kas@kernel.org>
In-Reply-To: <20260227193030.272078-10-kas@kernel.org>
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
X-CRM114-CacheID: sfid-20260429_202618_934560_7BC7AAFF 
X-CRM114-Status: UNSURE (   7.41  )
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

On Fri, 27 Feb 2026 19:30:11 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> To prepare for removing fake head pages, the vmemmap_walk code is being
> reworked.
> 
> The reuse_page and reuse_addr variables are being eliminated. There will
> no longer be an expectation regarding the reuse address in relation to
> the operated range. Instead, the caller will provide head and tail
> vmemmap pages.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,10/18] mm/hugetlb: Refactor code around vmemmap_walk
    https://git.kernel.org/riscv/c/c0b495b91a47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
