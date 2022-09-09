Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C539DECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONS4sJW2lUup/TokrfYBkKD7Z+fCx/l/7BKRLYkz+Tc=; b=XCp4xwiUVuCywm
	AScTVldEYm36jAzB50LqhbKJ4mcy/zFTZ2SVoj5juhurwXm3ypgvtoZu/H9xCaW3T0v43Sr7Q0kKI
	o4IK/9WdwCXBROUi/fTd3mahup1E1lo99fzt3JevkkLxRpBoU+Cb6M7SEEoEorM2chHa+/2R+w/P/
	M0Dra+BUQlss6/WBvAMyyTjJNUB4rTmRGVdHWFY0WSBRih6edIEcCN7WPZqLIRpgNuemiS3VW473w
	4lbtLxsRMHct/p+/Kud1pkXFuKnWOPJbtIYoba55plH0bErV7c7mwRtcnH6IbxkYozvtnWRbhrr+J
	ilclDFKETNUExa/DyXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWiYX-0016gc-VA; Fri, 09 Sep 2022 18:16:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWiYV-0016fg-Gy
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 18:16:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 294D3620B2;
	Fri,  9 Sep 2022 18:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CCF9C433D6;
	Fri,  9 Sep 2022 18:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662747401;
	bh=ynniiHjprYhsTIWCLE1X1hNSPewlqP3YhOY6nNTZ//I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ph6IIM9Xhpmnie7zafAUNgg10GyQQfFHFml9OCzRhut91bKLnAlrmxWP8ATOLhNEG
	 aTZY8FmsUggx4XjYX4AoCx8EhYMDpgVVFE64lXpytpibJz2wD89AA3BYkCswdv8zqR
	 vh3ADToe6gCedt3sByfNof/7aWysRvXhBSCKoeWc48bCSMjB4nbAUWaLikRwsvyuCi
	 Nd8+b1d/QdaC4TrxFaIvpi9vcDFxu8NwLqxX8SjMtlCet1IRT2H2qx0jZQUa877JwP
	 NIzL+28PcrDIubvKLERB7T20E2BjpjlIZRzsqWh8bDwof3xSpI1JuEmZfIts8Ra0VI
	 WZ6V8TQVm+/CQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A12AC4166E;
	Fri,  9 Sep 2022 18:16:41 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-8b892856-b176-48da-8f9b-869810e0cf26@palmer-ri-x1c9>
References: <mhng-8b892856-b176-48da-8f9b-869810e0cf26@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-8b892856-b176-48da-8f9b-869810e0cf26@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc5
X-PR-Tracked-Commit-Id: 20e0fbab16003ae23a9e86a64bcb93e3121587ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22b2e2d6ab35fdef4439e27da2df208014d52eda
Message-Id: <166274740148.9705.5282979394712829527.pr-tracker-bot@kernel.org>
Date: Fri, 09 Sep 2022 18:16:41 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_111643_634980_5E70FB27 
X-CRM114-Status: UNSURE (   4.60  )
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

The pull request you sent on Fri, 09 Sep 2022 07:20:17 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22b2e2d6ab35fdef4439e27da2df208014d52eda

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
