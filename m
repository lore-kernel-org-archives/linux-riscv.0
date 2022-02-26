Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6ECC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Feb 2022 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHqVqJgHeROyRfdj+ygnZmf4rcrk+sqmzhAeZkNY3CU=; b=CkSOLY9oRAsEfP
	ztVm0TtBbDdOierxZU/R37HrkowA+8txPzEgSY+e86QuDmc/7P3VhO5vABKsKSNekksGXdtpqYGPn
	gPvOPW87o3LP0WHbHc1DVejPeDmyrKe9RCPBFGXiZnb07rWdgfkDQjV+0HZ2oOjthVmMD86FUcYn5
	Ft4Nz6RKVKDd1nYCtkUccYHdsiSPhp8tXVRYa0Kh2sfiXUkLn/L9Dnox+qSRBDaNlmH9iadSLmPJh
	7CW7qqhDZ/zIQzjkzrMwwyZHVYWAGLiNR88jqYQf/hgzS0EisuRjhDr6e4mdPZdS64RjW/Un0Ij+z
	OOEBkOyCnDYq3MQfEliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nO2Qf-008RYH-CU; Sat, 26 Feb 2022 19:08:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nO2Qc-008RXS-Bn
 for linux-riscv@lists.infradead.org; Sat, 26 Feb 2022 19:08:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C34B660EE7;
 Sat, 26 Feb 2022 19:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34BEFC340E8;
 Sat, 26 Feb 2022 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645902505;
 bh=4izAxj7a+iBRtv9WYa9ixB3vP7meMrt2ONVYK8/J2SM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ePMBXWSt5ikTOSzg8mEMulxsy6c20rkmH4u/2vnSgFgWUzawWfpBcyb4aVFvKcJ7B
 eBt/e/spSd7HItjmZE5y0QO5dQNMqbPdh/QOr0hyTCan2dH7/j9wqwMs6NwyvQGCTR
 qLROdqlPkkluBN6Q8kkCAFGF4gLmF0im7UW03Xq42jIoAP+8jsLRAGZYupprPICzBC
 mRXZOVhb9LjQYTxgrbSEKE+/wY0D/PjfQVQTvm5y9ZlDCpGIwmYj068bDB3EnPUt/w
 j/wYZVUzRl1MdGSqxIO2tBSICy/acnn1zS6wN+rdSC8FK7613k4g/FqV7BojToL0TU
 crKrlnwhnJWlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1F90DE6D3DE; Sat, 26 Feb 2022 19:08:25 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.17-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-673458fa-1596-4318-ae4b-b0275abc5d23@palmer-mbp2014>
References: <mhng-673458fa-1596-4318-ae4b-b0275abc5d23@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-673458fa-1596-4318-ae4b-b0275abc5d23@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-rc6
X-PR-Tracked-Commit-Id: 22e2100b1b07d6f5acc71cc1acb53f680c677d77
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c8c230edab57eae6d2e8df7239ef121a45a1443
Message-Id: <164590250512.22829.11386233979430643210.pr-tracker-bot@kernel.org>
Date: Sat, 26 Feb 2022 19:08:25 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_110826_458337_35BAE145 
X-CRM114-Status: UNSURE (   4.03  )
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

The pull request you sent on Fri, 25 Feb 2022 11:07:43 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c8c230edab57eae6d2e8df7239ef121a45a1443

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
