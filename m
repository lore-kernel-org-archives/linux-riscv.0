Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81122E9D826
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HUOVnE6Q4ZGvjnZrBDJ0A6TPlPXSWPQHdI0POs9124=; b=mEi7VESZL71brr
	FdrRkiDFEqzotFaky0Ho/cLFKcvQNPn3VUi6zI1ajlM1wooAtgrWduNQG/fP37vBjJmFbUkdV3aZe
	pEg8qvXjABZcDoo3VBkU8NYRdVIycrLGD1FOq52bQY9x6oXx3nci9NRI88Jxo/ixFsU/DqMDEQKvB
	fdieDncPCnOZrG8zvhMfgmKSpTY6RP+ypO72D3gN69fhFUuBCQBfbuSbnWUNVMnQa9FhOBp0D0O+D
	NOEllyAtASI5i9PcnenQsfo3uPPZ0Qbd9H8T6gsJ9Nn6rMIH4Fa2gPzqa8kPOe84MlbQIiJFdjSkN
	jBDXGF4azb5hfun+A9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9W2Z-00000004Wiv-1pVw;
	Sun, 05 Apr 2026 22:33:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9W2W-00000004Wia-3Byc
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 22:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F39A943DDD;
	Sun,  5 Apr 2026 22:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5119C116C6;
	Sun,  5 Apr 2026 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775428432;
	bh=Z3XBv7TMf7bKVApwctTD3X2LV4ZXE69L34HODS2TMgI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ny3DjJhMoBgoSQXgK3IKP5XK/3KAjZ6wOBMxDbVpr1sUNz3eYLE5y9VcGbsFocT4I
	 JiJT0Fv8WF2e7gt57H8ejjc+RDGJ8otAaIH9rwIUi25azyxw8GsXrUed2K1iNBlEdM
	 uHT+d+kaDbKmghfWp71VThw8gTaBApjFkn4SVR1oHD0bbAtYqkvvZdcIakKI27VAeL
	 EnVHew3s3+8Xh2XQgVg1/WJU9A9HWA3E/22sEuZZ3H6HKhG0vYaC1so3ZJmAV6bB8s
	 kujOqn93x0EFcmWnaslS/RDF0vcSFR+3b6eseXTcG+nOFL8qB8TDFfRwE6lCwO5s8V
	 q1jqgRAwMgUvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7F7593809A22;
	Sun,  5 Apr 2026 22:33:33 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <4e071ea0-3571-467b-4626-5d4eb9c50435@kernel.org>
References: <4e071ea0-3571-467b-4626-5d4eb9c50435@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <4e071ea0-3571-467b-4626-5d4eb9c50435@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-7.0-rc7
X-PR-Tracked-Commit-Id: 9156585280f161fc1c3552cf1860559edb2bb7e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85fb6da43ac58dc7d1a6242e7b2102fd1d4954bc
Message-Id: <177542841205.2062966.17815148188410442703.pr-tracker-bot@kernel.org>
Date: Sun, 05 Apr 2026 22:33:32 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_153356_825920_AED79F48 
X-CRM114-Status: UNSURE (   3.18  )
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

The pull request you sent on Sun, 5 Apr 2026 15:40:30 -0600 (MDT):

> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-7.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85fb6da43ac58dc7d1a6242e7b2102fd1d4954bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
