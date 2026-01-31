Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0DEE6BF33
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTYx1J5rTHQ6RpLgApfWS04OzPOB8d63v+XGOc9/SDI=; b=Ob3i2PlwdYcghW
	Ohl2NiZVjs4HrKh16rt4M36DgOrfvEZ38mAjyGGwI+/fl0XX7gVfjDxeuh2AXSy1JkmE07mWeoC2w
	9kZX7w+lEgablONa1nrZ6T54yyfqQFLUyMwGkRGDhZfypl3FheASLQzl/qtDkXCZy93+cgVH/kWoW
	UcJnF4c4Z2+LQfjUXLHD80xVhgzmod5s9qqG6ilcLWwaq97Vv6+V6n4Vxl7rnkxvS96XoANtrkKXG
	M+Xz1BfnbKHsjhWO9uo0+p2iYWlHh69O8jKWJRaxicb1f9WpLNtFcbPjYb3MmD1Q9At5r7NIudgXR
	Ssb/srCWvucRGtPzTDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzMQ-00000002AV4-2en1;
	Sat, 31 Jan 2026 01:01:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzMM-00000002AUh-3pEE
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 01:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BDD1442F9;
	Sat, 31 Jan 2026 01:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F025CC4CEF7;
	Sat, 31 Jan 2026 01:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769821267;
	bh=whUM68Np2u0pqrtxJFiTIeqXIGMdzG55eeHmClwZ0so=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O1l0Nw76wFYIVdMY02azIy0xTx3N91qVDZ+Me8+dOl5utsztrKnsNZE74F8dDMWs6
	 sWsKzxZlsoouuzcxacEthb+/fP4FO90b/bd3Cgjr1eONqEIZaqXO50T/65UcwPqC5e
	 ir0xegzYi88vwwSrswbb+1+8yNPI0oQUgjF9CHsh6qmEd/4ZRt8nINq4QVm52PQCf6
	 Zqyz8R386g4tD811b5iaoP6zhkYQvBi5j/VgKVHY/h9kVe9xzLWwV4OGFlfyZBFBEh
	 jxkYqpyeGAqg80Man2ypBFpLwf/IgmNXMY/p19dCTTNKkCsFJo1u5GnuwP0Q2CKzB9
	 wn0zXzF0MC89Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7142E380CFFB;
	Sat, 31 Jan 2026 01:01:00 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <486c518d-4349-a1ef-25b9-c30abe0008fb@kernel.org>
References: <486c518d-4349-a1ef-25b9-c30abe0008fb@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <486c518d-4349-a1ef-25b9-c30abe0008fb@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc8
X-PR-Tracked-Commit-Id: 0ea05c4f7527a98f5946f96c829733788934311d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 283073725700d494d0d8f0085f76bb4e3ff063ce
Message-Id: <176982125919.3947395.8731596186589158759.pr-tracker-bot@kernel.org>
Date: Sat, 31 Jan 2026 01:00:59 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_170110_996019_D8A26336 
X-CRM114-Status: UNSURE (   3.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 30 Jan 2026 16:27:13 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/283073725700d494d0d8f0085f76bb4e3ff063ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
