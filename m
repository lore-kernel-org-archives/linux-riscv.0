Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70668606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=la99PJU/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3sJ6LyQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jA0cdU52Q7cr0L+7WOnHu9ZJSUGUe147ALiXtvNTNoE=; b=la99PJU/DS13r6qqUfT+wlg7Le
	iAxL6sQ9LEUW7z7bLlHMpiGyD+eEFzJKCE5GOVDUaIvXLY9AZa28uyWk41VE6VNggOJHdC8Ng7wNv
	X5lynznlrdjRZHD6pDtFqV/dGNs7/+ntKLaSgsAyTlN8cNJrZcdO6Z5ZEtAxenJ3+V8WNaJEUUJh0
	3siE1aca4UBQejUHywlhIh34q4GzANeQ/mc2RByt+oreRap7BEcl8DTAvjWCQvgOtiLGuE2aW5X9o
	F/uQp0qvBBH6O7HoZG+4Q8GMGva7xH38FtdqUSrlfMuj3gkuZ0NJNT+ghMNORG30Twnjh+hM4iwhj
	biNT0apw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTV7h-00000007Vuv-3ZNw;
	Wed, 18 Nov 2026 02:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTV7g-00000007Vui-0Hf2
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 02:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71C8943AB7;
	Wed, 18 Nov 2026 02:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8061F000C4;
	Wed, 18 Nov 2026 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967807;
	bh=3PpxRRk/bQeKzZGNJ7h5uX8M1JkfHN+OI1kHnZjXcQc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z3sJ6LyQMKVy1d/xef/3MwiMpiSrXumXLqU4MT9bP96vl40TiMb+I5PPGlr/6IgBg
	 kF2Kb5qyk4xxv99ndlXrB2A80HY/YnqqrMxHkEMXQz9FiMUy67oy4o+WVRjQVCeNXf
	 SlGLm/qMweA8komZfsKUJ8xZ0xLPJJFCZRtIt1QBZzKHFm4Nt06kYdYqrsBehNhcA7
	 cFlM/Ev2Cxdwjufc8uI8lUNe8/2pm5O/SKC1JM3camj6F9x6+L8yBubkpB1uEUUlVW
	 9emalSLuo/6UbiVb8MBz8lFfmnVPdKfNPEU4hKB96PEhfWA8n9CzKaTvI8XT2XMBKz
	 TTf8fyuxS70xQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A664392B1FF;
	Wed, 18 Nov 2026 02:10:07 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock
 and
 RTNL in PM callbacks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179496780578.1408948.14862363785692324970.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:10:05 +0000
References: <20261113132435.434615-1-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org,
 troy.mitchell@linux.spacemit.com, wangruikang@iscas.ac.cn,
 amadeus@jmu.edu.cn, tmshlvck@gmail.com, meatuni001@gmail.com,
 s-vadapalli@ti.com, maxime.chevallier@bootlin.com, vadim.fedorenko@linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, leitao@debian.org
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 18:24:33 +0500 you wrote:
> This series fixes two locking problems in the SpacemiT K1 Ethernet
> driver.
> 
> Patch 1 fixes the TX timeout work, which ends up waiting for itself
> through cancel_work_sync() in emac_down(), so every TX timeout leaves
> RTNL held forever.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: spacemit: Fix TX timeout work deadlocking on itself
    https://git.kernel.org/netdev/net/c/0dcf21648f25
  - [net,v2,2/2] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
    https://git.kernel.org/netdev/net/c/f60eae61466c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
