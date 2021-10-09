Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5532C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 16:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E5B60F22
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 16:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E5B60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77rgQxoK47ldQWAVfNR/jN6USvT2bgs+LhHokmtA6dc=; b=0utxkYDj0j+BsV
	VXtifG1JmsoP45NSLhUGEbKogU2vkpdqOY+9tQVoBZ7ZIDi1nFeqdYnKTSAq1HDXIPMpjrEhC+A79
	GsnP1+R2YvKFHEMM8M5IKg+W7P8cW3bfucGiFIpcdw5xPBE+vF+Jvj74BdZ5yArhH+Bc+cI4LD1/E
	JhTHgqY8zLuwAfhxAP49nv0p6oPE3cI5wHqk6Q4TaaVPdJd5JXgmapsuIRaYTcaBoNlq8gPTEBvH1
	sjzrmNMucxlRodwJaGWA6UvLPsUuPviowld5AX/fN27pcaDfVW/1/s1eNsx3cnJT7x1x8qfRaIdM0
	HYIHu+cfA6hIOvtufA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZEwb-005o4O-9Y; Sat, 09 Oct 2021 16:11:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZEwY-005o40-V9
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 16:11:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 031DF60F48;
 Sat,  9 Oct 2021 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633795886;
 bh=Zkm9WMyVZJvHlnzzyGSk2xNb4qHWVCVklol1no09I7Q=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kBpEHw6yB9t68qgY+pD6fqIGJ/py+k+rDej3aDqBe/uKhu0oLT8yB+EYgtWv79ELM
 Ugmhlp2ELWRyUmdT3jzCxgzh3w3GGD4dOF+2OUk0A42nbAvi3pOQW0zue5fgwp3VHE
 J2eB1IPq8F1b8Nw1fHFwJ1ziPkgmSUh0Phiwirtv23QyTrjPriFuNEd9/R1Kux4qYX
 nMEDxIlDea5Wlf34GWc9Ht/Yo72KKaN0uW+TjARcKa/kwOyVLs96ePT5rhOLI9GchV
 /ZJHRkQFqDIu4GwYrmeVKrOWdyKVIY7gv0BtXdM5bgO6AeRPNuuDmHI5BkyALtzc19
 4ST6VT59MjETg==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-26107d68-d2af-46eb-a8a4-43c1496a9ef4@palmerdabbelt-glaptop>
References: <mhng-26107d68-d2af-46eb-a8a4-43c1496a9ef4@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-26107d68-d2af-46eb-a8a4-43c1496a9ef4@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.15-rc5
X-PR-Tracked-Commit-Id: 3ef6ca4f354c53abf263cbeb51e7272523c294d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 717478d89fe22df61a4ecf73b1adb31b5f8d1bba
Message-Id: <163379588595.23991.2589894586404146995.pr-tracker-bot@kernel.org>
Date: Sat, 09 Oct 2021 16:11:25 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_091127_037111_A1B85951 
X-CRM114-Status: UNSURE (   2.46  )
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

The pull request you sent on Fri, 08 Oct 2021 21:38:14 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/717478d89fe22df61a4ecf73b1adb31b5f8d1bba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
