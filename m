Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA4FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ph4UpQM9WFKNAD88tYSR9YNg3yIzJlIWO2bqspoaUE8=; b=MJxdtE2zuXOAMT
	V9o4Ah4sulXUO+oMjWTlY1Tx+DelBx3JHeWjKmn7IhFmRK5QgevF6NfX+siMoust21fwgKES8BRYK
	bK5gDF78JV/YEpkk6wj+IlevPh7NKws9AnRy8yucnBbN6ZOaPcH7kbg/BIkGWI77Q5Je3fuAt6V3O
	mdPmRQdH3ZcFrA4HiPF/5bLFvvZGzqsNcjJ6glv2RdcKwVMGaScPGjIXxtKumJOYsH2Rqe/AuC5/2
	Rop8XqK5C+vgiDcqtDhCZU554iAOmKu9RM7tHsQ/8Wf0xmK4y3jl9iHZ9Con7yf9GSGhy7yE/Cg6l
	UXhx6bT3gN5CORb3VRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4G-00000004YMn-2fAO;
	Thu, 30 Apr 2026 03:28:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII30-00000004X1f-42fu
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55CF461331;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0920CC2BCC4;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519602;
	bh=jOQ6F/qbqPQvr86AWUfO60sG0ahit7mDPYuhhIPcxY8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EeR+2fmKlkkC3zXJwh38hlAoE2ur0kbazDdCl1B0MzT/OzLC7NC+ZFsu3TPGh+796
	 1/Fwn9HhrPzwpstx5GId8w3mBHNX+inZaFjWNZCcKAt3Hx5c7c9X6uhDHJ7nHFEuTH
	 Mr3HXQraGn7ohoz860VHeqXMnOfcBHYMb4T4DMOb4BFIN5FcUNgi39M2UCuTGwL7hT
	 In6FDxyUbEFipwzNGL+OYqMERE9GjsYnTUp2l1+SjCm14W/kgT4XbCAnl39BDschFA
	 SmzEX01qhFEt2udL9WTiIjiVW38Jch76j0dr7SJpWdZA6RjuNd5fQQuQw3af4SB2gc
	 gWvic7yeoMu2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD553809A07;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 08/18] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955604.2274119.1021480725497900179.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:56 +0000
References: <20260227193030.272078-8-kas@kernel.org>
In-Reply-To: <20260227193030.272078-8-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:09 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> If page->compound_info encodes a mask, it is expected that vmemmap to be
> naturally aligned to the maximum folio size.
> 
> Add a VM_WARN_ON_ONCE() to check the alignment.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
    https://git.kernel.org/riscv/c/9f94db4c7eaa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
