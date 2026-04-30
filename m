Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6871CCD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ISdIGt7n77iaiBQY0Gp3omSEqojSFBYNVxSQEtgEso=; b=WlgJ1Zc8ukHSk1
	JsZ0LI9HE3bs2hYGYQRBLQmDW8tqBvVyzEu9kvEyCRo0e90whPonGBDrbbFhR6ElehdOQcuHHSnY+
	nW2fs2Kx4pmLwoVqusiw+01PWYwCwYrzhDaRYwxrJv3XmDHmBWTngVceZtXEyE9Aq+L5b1lYWgYD8
	Rj2hE5MrqGeRA8Ip2RiEzrYmGDGBmVj5HE2zFireY1HX9OFSgD4n9kp5o9oK4yuFxHYlGE/RICPvW
	+HERZEIA/BKN2qKy5k32c1i2KwkCDJKYgSKQMa7c/RFGRz9NitmtwUwc5p8FZk5c4Jnv2TKAoXCzS
	Jeux7owW8Pn2H5N4GfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2B-00000004WMs-0CTo;
	Thu, 30 Apr 2026 03:25:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII28-00000004WKo-02zJ;
	Thu, 30 Apr 2026 03:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 146F844455;
	Thu, 30 Apr 2026 03:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE62C2BCB9;
	Thu, 30 Apr 2026 03:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519547;
	bh=dFN6b0A1gSAjmpxBdfCzLd7sjLkkLRUt90cBNTEzJS4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oK4W1kKQ5frD7xBp2Peo4k+zymjuUiJnLNz1vcnh5EFW4Atm0o1eacKZFX3kxsdMB
	 Z/9Bybkbt3e4DSKls2D0XjOElY/uAFwJmkXI/D33yiz2mgpn1fh1pHq8wwtdcupk2H
	 lxsRxcmcLT6uUAPcxQs3YzTqZheDJf8qP4uhFGhGgLv/DTlHLkFL3nUxAt6MFMm3Wn
	 udAWzPlFVeqX0qf5lNmUGifS42MtZaKyGgO3cIqnJJYyJsJWf51lM0MqpG8QFB2ry2
	 1jlaoCGMchkNV4IFNSmAKO5kJWwGEnpPKMc5ZEWOTjjRj0oKTos1CMGgTRvfcPXQMF
	 j0NI9CkIJOSPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDA63809A07;
	Thu, 30 Apr 2026 03:25:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE and
 cleanup CONFIG_MIGRATION
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950193.2274119.6306882784421764696.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:01 +0000
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
In-Reply-To: <20260319-config_migration-v1-0-42270124966f@kernel.org>
To: David Hildenbrand (Arm) <david@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202548_070543_C4A34FC2 
X-CRM114-Status: UNSURE (   8.22  )
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu, 19 Mar 2026 09:19:39 +0100 you wrote:
> While working on memory hotplug code cleanups, I realized that
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE is not really required anymore.
> 
> Changing that revealed some rather nasty looking CONFIG_MIGRATION
> handling.
> 
> Let's clean that up by introducing a dedicated CONFIG_NUMA_MIGRATION
> option and reducing the dependencies that CONFIG_MIGRATION has.
> 
> [...]

Here is the summary with links:
  - [1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
    https://git.kernel.org/riscv/c/078f80f909ba
  - [2/2] mm: introduce CONFIG_NUMA_MIGRATION and simplify CONFIG_MIGRATION
    https://git.kernel.org/riscv/c/6ebf98d71f9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
