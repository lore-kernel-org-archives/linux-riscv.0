Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1634FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnxM4evBvWQUZi9Oq9mXA93N1GC2asrxcILr1AQH+pU=; b=31z9J+ygOSG9/4
	vWkUm0pnd3Dvu/LF/WerhebsqhodfvecL13wExCi9Z0Mj7b1EAXC5ymsfBxcisX6neW6Czdr6R3XD
	IruFzNBumicMjmhSGf7T3dRIngaMrK/7HrH+xI/JeGOZMLiClsPpfrzk48flQUzLhrOIEdey4+kZJ
	SDBPYy2A1cbPuGefJGV0b1VFM1VHGz3Qmdkh/oSKgyyOJW0KQuvZ2rvTPkM8qJ2KCTVhJZo5fnzwv
	G0Iy9Jj31DvCo7jSxmlQKfHOvVCz4fZT4qOgM5yLC+3MlsZ6mfwZzrBSg3l88J5BLML7/QnICg3/n
	OhhUnJEuPgspoDHA7IXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2u-00000004Wrw-2vzN;
	Thu, 30 Apr 2026 03:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2H-00000004WR2-3k4o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83710444C0;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662B9C2BCB8;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519557;
	bh=3A9sSPpTFnTSwNLnH2RiVekzHJbPnUK+mXyDzY4bjyk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PvM8my1IW2Yjwupoq66vKLJIr1YZ/KioPkhJQkE7eo14dAk8o2H6RNfUatGZ2Au9S
	 91HQM/8YvYPRiw98kHgqVpZmSf7VnKX3GtzG7tbbozHcDgaRlvxBU0lZAMm+aj7cPh
	 qT6q1tde0FqSYSPt0N2fidtUIF1aUhoMl4reQhuruOMGgj3cRRvZeoBRiI4AEgorg0
	 StaKda1S6UYGl5kKlqXb2yBN8WQ8cq7wMowo/Uy/ler0ew/dVewdsp0hCgMvA54aza
	 CunUoeLgN5/VA34GkpqJiUE2zYwO5PBQl4g1nYfrAsGa+cekkOMHiB31Rm0HDxSQeo
	 il5OF8PZWn6WQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA3583809A07;
	Thu, 30 Apr 2026 03:25:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 16/18] mm: Remove the branch from compound_head()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751951229.2274119.12563342067361093997.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:12 +0000
References: <20260227193030.272078-16-kas@kernel.org>
In-Reply-To: <20260227193030.272078-16-kas@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202602_802650_B2E3660C 
X-CRM114-Status: UNSURE (   7.79  )
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

On Fri, 27 Feb 2026 19:30:17 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The compound_head() function is a hot path. For example, the zap path
> calls it for every leaf page table entry.
> 
> Rewrite the helper function in a branchless manner to eliminate the risk
> of CPU branch misprediction.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,16/18] mm: Remove the branch from compound_head()
    https://git.kernel.org/riscv/c/66b2a3d9ae46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
