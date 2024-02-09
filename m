Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C379C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE0TEMoKhed6Yg+NI+waw33FHAVHNlYG655YR4GwHJY=; b=clRNSKcTxZE+Oz
	r8ExurOeVUoJQKX2VJ6L/+GxcdHlqrqfeJYfK6TpI2DkAZg07pzVunwZtn9B7P3Ixc+s3bNqH57/x
	RtjXUe08jV3HVXi15pYWOb+bmrUTzu9DucncdkDLaga/z/awe5WY3tYb0qI7bTD/bSvGI8QaXskzz
	JYdRx3LwW7yV3Kw0mZyDP44KWAUrmZ90h/zqnG87soylzBfyEel+yOMebb4dn0sg7jv041n/memWI
	Z/MxN22mmLlD6OY+gQTFtp1uuN+m7piMWv8Hn+WaB9BJq+GnkM5NXYRVuOjkHugC6T5Fl1gBSruNd
	LpHKbKcyYiLuqIIc8rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYWbY-00000000OVY-3fwt;
	Fri, 09 Feb 2024 19:32:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYWbU-00000000OTm-1cTH
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 19:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B7E9CE20DE;
	Fri,  9 Feb 2024 19:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1D1C43399;
	Fri,  9 Feb 2024 19:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707507121;
	bh=1Yw4jQ4LFJihZthUSxjoizmvJLyoCoNkHVHZ49vzjrk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=vGihRs5XW32TDsPeOxG0DlRci46hkzF+jkdcMrjhiaPc4FJ244HEMQRyg6PpQVSRV
	 3DYuMijF+7URFzQdj6rv+yGxFXXf/2n0246IOaz7j9h6hSkjgs5Upm5Na6PS4TY8YC
	 mGniwiwAC0cCoY+j5bTntJgVhqzIHer2DfpHhFI+8n+33vQvMFAKqquPWrcMq1c9lA
	 AAifaUZAtv0wtThYysSN0pMhK2Ff9qJOX/b0X4H0+N9ymDRFdZnrOnlqLWd+hKApaI
	 ngbg9qLrhC2R2MOmSVSY5DPwPfe2LsyuxYr1KvpWAMtArnMldKlS8w5R9yoh7S4TEB
	 6Lg/9nbgIe4KA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5582EE2F312;
	Fri,  9 Feb 2024 19:32:01 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.8-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-cb58eea8-c84e-4aaf-ab71-f445d3b46de0@palmer-ri-x1c9>
References: <mhng-cb58eea8-c84e-4aaf-ab71-f445d3b46de0@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-cb58eea8-c84e-4aaf-ab71-f445d3b46de0@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-rc4
X-PR-Tracked-Commit-Id: 3951f6add519a8e954bf78691a412f65b24f4715
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ed18b0b7765ec3aa5f10843d1c3daaa1a225337
Message-Id: <170750712134.26526.9089159200603791474.pr-tracker-bot@kernel.org>
Date: Fri, 09 Feb 2024 19:32:01 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_113204_637641_DB2AA3FF 
X-CRM114-Status: UNSURE (   2.65  )
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

The pull request you sent on Fri, 09 Feb 2024 08:42:32 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ed18b0b7765ec3aa5f10843d1c3daaa1a225337

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
