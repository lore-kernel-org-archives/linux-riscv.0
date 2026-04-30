Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D5CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTKHhq3bEv3aNXmzLXpUFfXnceE+7MvkLUB21ga8LFg=; b=tV9AW85xhDxqgh
	Es6zBjzt1fQsqBt0SX/lqzT99M2PioOt/xAf0vZDcVo/7POdgsf0ucWCskGu2UFVn5cJ46vRYY372
	/VdVAgWPDxSgQT7J+rB5FKyem+i9fVyecz+jePxzcAXEU2zrHLJH2O/uixsD3rZGtMt5WNnCrdfMP
	H7HuoHqPRtSt8XruO11flgJaRKbpsQ0IUqP2tJ8hdtTbyq6AKBCWzncMp1Nnp2qpwh2P/YrFe1xZV
	LK89pAnzmNDpOoxZqODlKoiIjeYxM4Vl26jwslYdY9ZD230rWVLmmZdh9aIXjM7SJgjTOLOf2KIHd
	ncwjUVtVwfJy3a13Pmww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4e-00000004YnA-2UmM;
	Thu, 30 Apr 2026 03:28:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII38-00000004XCV-3FQB
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3975A61420;
	Thu, 30 Apr 2026 03:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F82C2BCB8;
	Thu, 30 Apr 2026 03:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519609;
	bh=iFqroCI9QhrRjRPr6nqnuqqWoIPtsKBpJSs5D3LwRHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qDZoBJByuNsp58dPyZrm1NWzEP6bDZxrt4juzc1Ayrev7wPMACk+uUM41eKdHbD5s
	 i6WA8mJHerklMdFyLbo0sLVn0Wn6JtNrrlu6qNz2XPV+xTwfEr2Ao33Ahz05lpp4G3
	 NHYs0GmngPzMGLvWDKQZbDWIYnpWyiSQgC7r0FnDEL/o/BYqTsd2fj/qa5a5riwjV/
	 qHReu8/iWe0Kzrh+UPBK8/K9grFHLk4eTC8pCN6N48Fw1G4diyvsMP/zpg6m8WwzEd
	 Wuvzr7EgyEvnskXgDxRM78pQgyr7y7kHNbprI6MzT+kmtUllYIlaB8//LC96wQV7Xf
	 WIQc8djoGzeYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC563809A07;
	Thu, 30 Apr 2026 03:26:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751956479.2274119.8317675820783174184.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:04 +0000
References: <20260227193030.272078-14-kas@kernel.org>
In-Reply-To: <20260227193030.272078-14-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:15 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The VMEMMAP_SYNCHRONIZE_RCU flag triggered synchronize_rcu() calls to
> prevent a race between HVO remapping and page_ref_add_unless(). The
> race could occur when a speculative PFN walker tried to modify the
> refcount on a struct page that was in the process of being remapped
> to a fake head.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
    https://git.kernel.org/riscv/c/01b1d0ffb6f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
