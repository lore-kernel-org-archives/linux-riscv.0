Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E52CD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZ0T42thUOQFW78tWFDrropZRmxYNaYOys1Ib3zg2hA=; b=QEieG8emx2DvN2
	a6HzO33xwvhUa87zUdogBbpYRqwoxYDw7BdLL3KmAeM19j6HBekf7IfygdkcbG3ZgJBXT1muGS9Tc
	/lyfu3UBT7Uqd5cUWS+O0Kf5hOMfzglr1/xlic0SVDXD4Ber70f6XBSR7fSVxhqHD9hJzXql8IOIQ
	tKzKKYcz9GTHVpbT98rExWdbmkZk7WGssqZ3yM3qfaa/7bYYOup/buoUSOvRYw36BVLih0NzKc5+1
	L2teP0mPFccwxOBOwTP0PaG1PzEJnOx3D8XwReElTGw9N4MwG+vkE3Tc671oVVbzvdwbWmOOfCnM0
	kXsEQxsXXd+0aiKR0ksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4W-00000004YdK-0lpe;
	Thu, 30 Apr 2026 03:28:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3A-00000004XD4-160I
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF4D761336;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B9FC2BCB8;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519611;
	bh=VshiWipAYtRyMnsD8HAzk//9Evvgk9O0E2BL+Z2O4pk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Uv2UWaUzVbUyIkgswzPmfhdYjkOpDsLPU3O/WJGYuLPii0uH5tUW/52XxirKakoWd
	 UOuM2PUB7KOW1bgwglcr822uaES5i7LcF+WBOwNRSEheCp/iesotg9S5Mycm4t3zIa
	 4fGTEdM9Oszy1Jxg1CtvOsaJoKHw4RHWDdT87crP/eIybS4+63vm+Q+Yf5sPhl9mCM
	 Z1wnh6X3nJ8a4pe5efyJsskj4Qt+XmWPzBgBT+u1lUkn4POaCvOvYYiHycXgoFQrX0
	 qfjM3O2/8DQFXcpbsAs+5P0iEHUHGEOU+izl980r9KdymeYwT/hPa2KwEk5f9WaTSj
	 GXa9J+FBhfGjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DD43809A07;
	Thu, 30 Apr 2026 03:26:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 09/18] mm/hugetlb: Defer vmemmap population for bootmem
 hugepages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751956630.2274119.12592851885920371218.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:06 +0000
References: <20260227193030.272078-9-kas@kernel.org>
In-Reply-To: <20260227193030.272078-9-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:10 +0000 you wrote:
> Currently, the vmemmap for bootmem-allocated gigantic pages is populated
> early in hugetlb_vmemmap_init_early(). However, the zone information is
> only available after zones are initialized. If it is later discovered
> that a page spans multiple zones, the HVO mapping must be undone and
> replaced with a normal mapping using vmemmap_undo_hvo().
> 
> Defer the actual vmemmap population to hugetlb_vmemmap_init_late(). At
> this stage, zones are already initialized, so it can be checked if the
> page is valid for HVO before deciding how to populate the vmemmap.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,09/18] mm/hugetlb: Defer vmemmap population for bootmem hugepages
    https://git.kernel.org/riscv/c/209e6d9eb13a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
