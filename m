Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E905EC2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 15:58:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A240261159
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A240261159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLzc05PqjeCG2QICa1UUYtjD4XxW73tWLl5NoyfNY98=; b=ZGKkhHUSRqzfDR
	Gd4+D3M4lRerm0XHaRIPxxZDlJ3t0+dynoYiEmC8/S+ieV/XK/1PNUxFbJp+bfwCs4PToUgWOMFTQ
	AOWCk+HhM0lq9Xjg4YvIsQkzF9630PJj5rsnd8mwi+4hxm+jGsZIBSHIspLNn6LMaDI07XJcSH9tr
	TQMWa3DEcoyAiMb3xXp/7V4ld0pIL2EHZV7NtpqeZjad4sxEHKRwlWgqJbFfl0hl3js+z3I4GL7LI
	RwnxN11hpsoQbrZG4J8rBIx54/IdjJkhNfUCgSHHcMmd4gSNidOt1xbG3WW/9st717KrJGXNkU6hL
	uBB0ztP4YHMlhJhXj6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ludMe-00HF2J-B7; Sat, 19 Jun 2021 15:58:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ludMa-00HF1R-K7
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 15:58:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 337A161159;
 Sat, 19 Jun 2021 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624118308;
 bh=CCnEEpYjax/88/40kieIEn+5Hb9pnHYH+EwEkzyEOLY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ccU9c33kOR26j6t2T8xICsk0r5dPlwZaulQFZoUVZ72Dx+ZCux8CJACWfhxPcZ019
 oXhZ/IuwxFDpOsRM8PBTihfDHoUIyumzoxj6DKwws8T6KkZEicyOHbSasGa0e9WSAf
 bsUIUe2HHIqMxaAdc8NmpW68u0lyTvr+aMIyIiMTlt4hzn6oK3aAwl+FuX/hUuxZgm
 LHpKQmv6nom1iN9A6Lnujo5yfvDzSabDG8mV+PsuOTOaBV7vazjmHX0jTrrm1HNpwm
 NNQ/xUUFSwRw0zthWyZFDbbCWbU5bMAjiIl1LCNsxuWJPQsEA/DDa/Zd4TMXnHgs6L
 marHk6F3prXdA==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-768bd541-d21a-4a3e-9c92-da08277ab3ba@palmerdabbelt-glaptop>
References: <mhng-768bd541-d21a-4a3e-9c92-da08277ab3ba@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-768bd541-d21a-4a3e-9c92-da08277ab3ba@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.13-rc7
X-PR-Tracked-Commit-Id: 7ede12b01b59dc67bef2e2035297dd2da5bfe427
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d9403d307dba1a71ee6462b22300c2d3be773b1c
Message-Id: <162411830815.5022.4024485479331822245.pr-tracker-bot@kernel.org>
Date: Sat, 19 Jun 2021 15:58:28 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_085828_714603_34D88844 
X-CRM114-Status: UNSURE (   2.68  )
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

The pull request you sent on Sat, 19 Jun 2021 08:42:59 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d9403d307dba1a71ee6462b22300c2d3be773b1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
