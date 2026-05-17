Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888ACCD4F3D
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 19:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6rf95lMNelbnPV0q+1xUUxZcxJEsMJHirk+7DkVmZk=; b=VgpfkxlU1Tt8xI
	hvCuBdZQl4FLjI8fAnRLkR8j8m8dIWwXsjP0c1PloBM9Ui57veLenKN6r+pwBS3M9S14QuIkJ4uIu
	pnlUfcq9x7ZF+a8i1sYtIiHUUSAkx+gxturJp4vDiJzIJpA4l1CWXj1TQrK1t7OUf5uX/TxfFAqaL
	bvBYxHlHULY104GvYauJCj55MFVX1bIxUHCaWwCYA3LRz/80qACBiGMG2VvGS3GpWTL0IJ627ZagS
	heEuWIwUfRhvaU2bFSx6BXi4wjJPVYYelVKJdGHh1g9pzRZoC+S5K9Ee8VHlypDp5FndJgPOD9DwM
	Es1kPlHPNC4x5zbvdOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOh9z-0000000DKpE-23jY;
	Sun, 17 May 2026 19:28:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOh9x-0000000DKoe-2r5D
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 19:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D17244510;
	Sun, 17 May 2026 19:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D59C2BCB0;
	Sun, 17 May 2026 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779046100;
	bh=lF7NVJE0CzMAThOmv6bq/zLJ9cj8ciPvjgG/RLA37/c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=feX24+uhsjSYXJz5XTjfOYy3RBTMWgfylYudMqfKpqv6F7JHF0+QgHJQh1jOGGIU6
	 UZTnMm15krdL68sUpiHSPV5q57FEiRJyOw0xnT/Utxo1eMwrX/tWH4T/azTVhBRFfI
	 v0UIML4hgGokQwGGKlaPirKU9R1dNRjeCDe/6IjlZ0POyyH/Yb8KEod190cJ2sW99i
	 atJfSCooKej1LurNNjelf0MT33cJVKCuUNX/XRLgU7CWUqJZGhIgCGfQYK5/JeXWZi
	 Szxtsg0YCYFbXbsLLcwZmAh2QUGOIfAXKZjxSV82YmHSUucRjHslyDiZ1laCGpBPzW
	 IDziKIYnNuxJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939D33930B89;
	Sun, 17 May 2026 19:28:33 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <95613c06-fa15-c5ae-cf7e-92fd91563e74@kernel.org>
References: <95613c06-fa15-c5ae-cf7e-92fd91563e74@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <95613c06-fa15-c5ae-cf7e-92fd91563e74@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.1-rc4
X-PR-Tracked-Commit-Id: b69bcb13ed7024a84d6cd8ad330f1e32782fcf28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7c79949bef47ff93167c8ae85a07ac006ed7139
Message-Id: <177904611210.673362.1363614580989146265.pr-tracker-bot@kernel.org>
Date: Sun, 17 May 2026 19:28:32 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_122821_733519_99DAC6E9 
X-CRM114-Status: UNSURE (   3.13  )
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

The pull request you sent on Sat, 16 May 2026 18:58:23 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7c79949bef47ff93167c8ae85a07ac006ed7139

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
