Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E73AC00140
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 01:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTEpmzc/tOINBmi3Qzs7S6DEoOE9k5REEL6DW0uxURU=; b=1UazgRE7aGJsE8
	Y4rdNj7bUvqjfMDXQbLjmrPvYw06TdoE5YVAHLn52vXubwy+bNofSlB3SY7h8tT+/ybh+P9LkrPPY
	D7SjnzeoHpGyqCcxf1AwwIEDIFzm+rp+i9XyhPZfY1gngAgjGi9eUPcXbMbHiLEPvFweeocEETiVb
	clYtKD3As6Sd8hs4wAYQlNw3mwY1zPu8yuErbl643qmbcknxWTBRjHz4EZ9/K9w29gY+uxSVAUQo2
	ZbQvYivtOCJCYXA/swzJ5H7pH9FxIEk0cp5dzKR6RZyFoMPCtG1nIYYQM5yjJltU2D+VkfmYN2Uan
	XtYCub88OcokoOnysyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMgCz-002vfy-Cc; Sat, 13 Aug 2022 01:45:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMgCx-002vbp-0N
	for linux-riscv@lists.infradead.org; Sat, 13 Aug 2022 01:45:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65E49618F3;
	Sat, 13 Aug 2022 01:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7271C433D6;
	Sat, 13 Aug 2022 01:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660355096;
	bh=YkOWYg9z91JRVVZTsna0k28551z0dkkdRpmWVXzlNPc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TlXXdiNwt0xYktkrqVpYznm7mlt/jiqWTHuZNNvSlLKzyN/3hOL2w8il10n9Jrrc6
	 P8DkXdZdOSuezBEVNZp4hvgnU/obMbb1rDXNbhx97N/6sB6VvkXvpW+ugfAfsDRE0W
	 29PrNWrsc32HktlW7TY3gKedFOU+CmPGbd7yIATP4MKn1fUH6Rle3TUJ7hGcBTDOGD
	 Terya/fBBrebJOS0xtItz0wqiN7nTt2zSYGnQ9VgGRhrztqfEjTNBaqCeGhftVLHGw
	 i7f/tk6zV4sHxC05oh/uObnzc4ID29IywPV8MkNqRYUrwvcpd4YYf6lmL+7QeD3HFB
	 ih6VjKCBMlZ4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B68F5C43141;
	Sat, 13 Aug 2022 01:44:56 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-563e7d68-e504-4e0a-b666-f7c2fbab62db@palmer-ri-x1c9>
References: <mhng-563e7d68-e504-4e0a-b666-f7c2fbab62db@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-563e7d68-e504-4e0a-b666-f7c2fbab62db@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw2
X-PR-Tracked-Commit-Id: 5cef38dd03f33ef206eb792df0fb3b200d762546
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69dac8e431af26173ca0a1ebc87054e01c585bcc
Message-Id: <166035509674.20476.2939118231201405076.pr-tracker-bot@kernel.org>
Date: Sat, 13 Aug 2022 01:44:56 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_184459_119969_EB791B77 
X-CRM114-Status: UNSURE (   4.02  )
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

The pull request you sent on Fri, 12 Aug 2022 17:37:06 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69dac8e431af26173ca0a1ebc87054e01c585bcc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
