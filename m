Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0101606A334
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4k/vg4H+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UM2QO2gp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t18KYIvaRwmCFG3Y2INQLZAAmVj4u43UDOCf+d3jYQc=; b=4k/vg4H+VRCgv1Kt6kL3MakqSi
	wRQnX6cUTFG6XM3K6j81qSZNYse29/jOeVJvlMkQ0qa35q6LegUyTs4dLthf5GSOU/iyeoDHdLFmI
	aC9YI3ekumynjzpygq0mZUeX7peKPZzAmVpPx1fzF55KpY1ybdbqv8pe7EzEnhlgeP4EJLYy6JGN3
	lYAGe9/6VZI+YjdD9jnTt4/68GlWBIpe3hWGWX3apvtcfnwxxubiwKNElIXw1uF/l2nbD0v0G13Bz
	gL+P47CVXwdwRucIapEEqYXLbps40aX57EEEKTfg6kwKd4ebfZyfXUFzUoAF0k30tG4QGMvBqHfES
	LpP2j47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrt-0000000F43a-2yrr;
	Sun, 01 Nov 2026 22:17:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrR-0000000F2Om-21Hm
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9479C60616;
	Sun,  1 Nov 2026 22:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481E11F0093A;
	Sun,  1 Nov 2026 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571428;
	bh=nBcby+831tnh65V15hxneU/5jEcnLn3vcSSp3uQCZhw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UM2QO2gpOUFN7K4kaI4CIv+BCK/BlsbtUXc6McRUkNmpG/SqfTu/HEOHHHo5l4CAn
	 OAo8AnZs0Sb+cGM4YF5L+tBa9M8+83JeELgaprjspGt5zewixeNEj9lGKtF/wxuJcq
	 nqFa1ziN/TB9BQ8COwY1bBL9x8JoYWXOucfN47kcCgGzgba13gLvHBtqKqqol+Gxin
	 KlO9N2iIUP+He2LtIwhX4zwsEHj/beQQcb8/KZzwY3agVlLdILI3RAFYLV4EJVa1Kv
	 szaWAjNYBIygMKL1K/v9ObhGNjQWniwA8IN3l77UViN+j0jjxIopZtDHj40xfy+6T4
	 Oj0uSH7v+Yt2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401C638003B8;
	Sun,  1 Nov 2026 22:17:08 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142679.2624073.3195794229721502682.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:06 +0000
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
In-Reply-To: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 urezki@gmail.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 liuye@kylinos.cn
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 28 Sep 2026 16:15:53 +0800 you wrote:
> vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
> allocations.
> 
>   1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
>      and outside the VA lookup range.
> 
>   2. The function searches only one vmap node, but allocations
>      larger than 64 KiB may span multiple vmap zones whose VA
>      is stored in a different node's rb-tree.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
    https://git.kernel.org/riscv/c/f4399c9927c4
  - [v4,2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
    https://git.kernel.org/riscv/c/4b52da012040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
