Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41248FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5G0Lfee1tg9Ex77mFyubKakqk0MBXsutrX+shp75kGc=; b=mltnV6BqF37Yoh
	15icHbxtPKtzlGx/Yr0jA3Aa/SkxzfCZMFSIuE9k/v2LMT7/Rre/nAcmQMvrR8yuuzxE6CJ4AhLyd
	54ypn0CSUolFt/t08iA03coB7LRharpQlaRRidvEmrsNMqbCya1G9hsicDABX8FgukqYxrPPoR/ZU
	FQEOoidl99elas5pIVfRocXWM8C+VbkhoAnYu4103mlJIGy29ZwYTINrGvqQ+PH8oSj4b9Z35l0+i
	kM8VQwBgeL0U+4wvpyNjr0ShlWdPZNIs4bcOT22Bk0A/3AdR0mTqgaUVIQ/XQwFM95NX51m7KiESJ
	tKYAVjeX+ys3V2fAI9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4T-00000004YZE-19F4;
	Thu, 30 Apr 2026 03:28:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII34-00000004X83-1WPO
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BECBD6133D;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BC9C2BCC9;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519605;
	bh=fhSNmqrG5HsEC/X36MILLZcbTZ/au30iHuph+y5PVBY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NG/keSn0FdCovg8MaqpF8Evbj/6L9DumthcIlwwxhgqo4krFVNquz8+s6I6cAbdTk
	 F7gB7AFBovML2uNA08fug18O6ouheKOBf7t2Cnd7nzLWNimtDo+aiOW2df5uW2tRMT
	 rjTagxlakUXzJK5UOaOgiNsPLEmBzI0SrCWLU0VLJ0JlqZw+7s1UFWYN+UsHMoS2Qd
	 iECXbmORVBx8yix7TpNhGpQ4YIOkqqw/43+B09zOhAKOAI6t3lqj+2vCV+m4mWAT9q
	 7VgoHD8YmgUg9LVrLh8uiVHBbs9Yxff6nj7MkquNCz6a+id9IgGedB0JwH8SAImjFL
	 engiwcFkxaZoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E0C3809A07;
	Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 02/18] mm: Change the interface of prep_compound_tail()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751956029.2274119.5996274092422873804.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:00 +0000
References: <20260227193030.272078-2-kas@kernel.org>
In-Reply-To: <20260227193030.272078-2-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:03 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Instead of passing down the head page and tail page index, pass the tail
> and head pages directly, as well as the order of the compound page.
> 
> This is a preparation for changing how the head position is encoded in
> the tail page.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,02/18] mm: Change the interface of prep_compound_tail()
    https://git.kernel.org/riscv/c/f0369fb13619

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
