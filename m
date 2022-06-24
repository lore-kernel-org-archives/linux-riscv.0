Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5BCC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcJjVSWQ4eBV31YOaVsEJ/bVzJeD3GPIbNtrmAiApyQ=; b=Kl/xYV1AhHBSfU
	7WbRYB078lUbt8WjAxWw3gGhhSMtxQzYNgew/ZGXv+OaGi6+hkoT66L13CwMBzIsAMbzBgiTp/nFr
	Fj7s5yR9i4VSQ/DtAW96/Gl1AXgNRp7YLPzUGCWOU/esE+ihPelQyL6r5h0ZbU3G3ai9zYDTLuN9U
	FSwAKj4jV8FNa1I6cTqcAGQ8dmLIUlAZpunTnJgu4905RneAi0N0CsbhInCOzMTT5lXSl/mPI6Eoy
	SZyful7GL3XXsQ5rwBgRvL5Tb6z+ykMjI0irB5bA8NUKGcjqeGg0UzUNXGTO8r5ZNBUj6VoGt4xEC
	XfZAGpmoheGS9kHnkPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4p7C-003e7U-DL; Fri, 24 Jun 2022 19:37:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4p7A-003e6j-00
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 19:37:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5457C62230;
	Fri, 24 Jun 2022 19:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2739BC341C8;
	Fri, 24 Jun 2022 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656099431;
	bh=5ACM3bmKFglYuCnEdvbo4N4wC9DXmhVYmVrneXs9zUo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ejgg1Dfb0BA6H/g3XHXNaw1NYfPVuJGJxCWWXn4vSLNegNjaze12aPlk2w1sCRLyf
	 VkAgPi45tspTMz9NV8S8fx5A9WIzjxaWQr9w53ydTdhTBz7bdnT3FLl5UJFjk2DtSG
	 cRnyubIyxEdVEEYS0EwU2nRXjwXTdbFBJ+nU0wNHU0rIs1DJ48FHkV0xAzQwRFJZyc
	 gZls1tcWZepKRqH9wWzNcwo9KgyH54ONEDnMIflXY2wjm+Zdl5CGT+rtHbKfR+J2sd
	 3WweGu46f88wH0C1UIfRUn6qBzOGcAJO088D+uUsq6OonCnV8UPCRRepFrU8wRWo5a
	 wrfcyG9NdRhtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10C7DE574DA;
	Fri, 24 Jun 2022 19:37:11 +0000 (UTC)
Subject: Re: [GIT PULL] A Single RISC-V Fix for 5.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-3e339ca6-0ed6-4d02-96b8-2f664f62cc8c@palmer-mbp2014>
References: <mhng-3e339ca6-0ed6-4d02-96b8-2f664f62cc8c@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-3e339ca6-0ed6-4d02-96b8-2f664f62cc8c@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc4
X-PR-Tracked-Commit-Id: e83031564137cf37e07c2d10ad468046ff48a0cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70d605cbeecb408dd884b1f0cd3963eeeaac144c
Message-Id: <165609943106.3020.10530019402105354343.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jun 2022 19:37:11 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_123712_111858_9DC46A3E 
X-CRM114-Status: UNSURE (   3.71  )
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

The pull request you sent on Fri, 24 Jun 2022 09:08:12 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70d605cbeecb408dd884b1f0cd3963eeeaac144c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
