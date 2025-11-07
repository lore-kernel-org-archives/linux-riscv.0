Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4415ACCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IVxF3nx0KRPaH6o5OzU6kheJkkl3aorVk4K7sx4E9o=; b=dmeetQ87HShy85
	cTcfak9uxbmGemx6fVGOysyuul5wA5qZ9cUABxuen5lbrAvpUqs3mQNNguxFVfWqhdsMr0h4z7T1R
	g9VXUiroTez6hXKpgKU7TsnPd92z0op4DI3s/yI6H4Fb3hNknlTk+7HmVyD11uEVDv6mPfu04g9S3
	1N74Y99QEYEWzSabNvUts2Kg3CnqjwlnKGAhA5NJ8vEDXiJ0R1rd/atXAK1wua5WuQeq9YAKUfQYR
	onOGTJ8sFvDq19zsI2RgumeRlVVvyZC0z++nI+OiF/5siR4VIimPLJuheqIurNjpIgM6W/Qg4h/gt
	cQCMT017nZ9FNeSDtrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHAgB-0000000GTDU-3v0G;
	Fri, 07 Nov 2025 00:50:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHAg9-0000000GTD7-1xLd
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 00:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D749240C47;
	Fri,  7 Nov 2025 00:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76A9C4CEF7;
	Fri,  7 Nov 2025 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762476612;
	bh=RriSvM7sxLTV9fBiNQohHybXVqXphRcxLw5gWXqJryI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f0bK2xeMucmqxEGEr9Jisx2OPtppxjUpFRudzu7yNjBdGaIwqURtEyeU90GUVWpdG
	 7iOASgr7vDaoEMCT7N8bx43DD/IJcLwEHLu5QOvHtg75jzKZyj7jy8LHkwEkLNp+XN
	 X6g/r2E0ONuUJPXyuWq+BgowCSOLKa/QW5QWAj5xoFa10ReREhMrr1+N0BbQzEKW3b
	 Ovpte/WK7ky0Tllr/1Pqe7ishgKAM78Em0zA9l7bjTlsTGEEE2x4GexAECeM50eER0
	 7WhpHlvRuZFkJWJzdOb3xed9iWh/HVApvqsifySpMTZ6VnoZT8xyTw0ZV2N2cGQiYs
	 7OjWdngyT+wDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF47A39EF974;
	Fri,  7 Nov 2025 00:49:46 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org>
References: <50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc5
X-PR-Tracked-Commit-Id: 2e448567839c65768486d56612c88cb327d26050
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 225a97d6d45456a7627633da09cb842a43ef1b85
Message-Id: <176247658534.436188.2567112900291866949.pr-tracker-bot@kernel.org>
Date: Fri, 07 Nov 2025 00:49:45 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_165013_529440_F99F1BC0 
X-CRM114-Status: UNSURE (   3.40  )
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

The pull request you sent on Thu, 6 Nov 2025 15:52:22 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/225a97d6d45456a7627633da09cb842a43ef1b85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
