Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0553FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jloMqpz/K6by3sntVmdm2qT7jT4esRh4vIP3uegNEcg=; b=n+f1w0EGEejO7k
	Vtk3sjsjJmYpUMrWK4ffj3TaWAAA6oCMLhq9YkZBLjM2T9QJHBDefsQHAmuAZdGuE8bV5Z035jeH1
	Klin2Hs/IT15IkJdnIj6upuh3U4ChGHuZ263WYG3I7GfoVF0xQ84QC5n2uq0Xn7Efs9YmMMuHLoN1
	o9qYLRfE/fTjKZFXiNFCtw8yBQSfPO0x9g3IrdBmU6srjw+xzadntgvgWWtAAn8KW6OacAMcr4bEX
	kuwiqsF7L9/EQMKwCnUcBeR1yvw195Khtm/0445knSNvE6uTQqDnQY0vovT1i8Q3pNhDRpF3GS87e
	poTbuywww5js3M+xnbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3o-00000004XnA-39cz;
	Thu, 30 Apr 2026 03:27:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2p-00000004Wki-1BIs
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B348361330;
	Thu, 30 Apr 2026 03:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BA1C2BCB9;
	Thu, 30 Apr 2026 03:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519590;
	bh=jzZuBjGs6d//AuDRvfXUPCJyxdAcdxXtpm8HzJf5lJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YDec7xN4GgIHYxxQboOLUbUYbbvBYvnFwvFlnN4Pkvu/m8uiFtXXPmJQYboZEMuwM
	 4pxMYNokfOgCdNlI2KJ6ESz18qolGtTs7BwEGy+u3PBOUBdor0Hog62FPZKdlUichJ
	 tKFpwGoZJRw6d/pJa3z7TPuVtgIxOSxYtVgcgrI8I/PR1/sWZgK4JBRCqP4THb9aN3
	 hOp5H8D4lUYt7ZahrJKsA6nSwJ/0HxzbRn77Hcr02O2pIZJUfET8BQdXHW2xdKR6dm
	 f73ut3z3cqnO57mGnch0C4kBKpYioYz1mr5yhV+dc0QPZ6XkrJzTmQQ664unY5icPx
	 JD55dswsCR4/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E6B3809A07;
	Thu, 30 Apr 2026 03:25:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 05/18] riscv/mm: Align vmemmap to maximal folio size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751954529.2274119.13385443972464181623.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:45 +0000
References: <20260227193030.272078-5-kas@kernel.org>
In-Reply-To: <20260227193030.272078-5-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:06 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> struct pages of the head page to be naturally aligned with regard to the
> folio size.
> 
> Align vmemmap to the newly introduced MAX_FOLIO_VMEMMAP_ALIGN.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,05/18] riscv/mm: Align vmemmap to maximal folio size
    https://git.kernel.org/riscv/c/476849b0fba4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
