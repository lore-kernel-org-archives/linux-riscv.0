Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D46CA101F
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Sep 2025 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPxHy+Hc7airep24RVcA69I/74tz0O5CR/edTVFiqZc=; b=qzFS/UUFiMuB1v
	RhDjG6S5XoQyCYljJDd9j/wKhf5VdtwLbQBlGdAqMHrMvumcpCW+igJ01H98TgEYxfDWhibw9JvPi
	b+//niS/c1tMr71asRGSvro4cz0ILkuzWWYSMocCp+RWb/ZbhtAGxghxlaOG+d5tDzf1i804/uoHJ
	KoC6F1bCaJZhxPvWjOEJ+9m6a1jdzvJy4NYaABH7AwbISmN8cQlEcqbN8QUewF59/hFRrBBYr5PDR
	3FEpCMlFdbc0jWIoMk3mA+qDYdQzaPhkktsFe/z6ukVHX8SiL2DENo5yoynT2us8EakFUZPcbf3TK
	XHfSsNhPG5jrhLwYIL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvHNF-0000000Bh53-3y6R;
	Sun, 07 Sep 2025 15:32:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvHNE-0000000Bh4M-2PDr
	for linux-riscv@lists.infradead.org;
	Sun, 07 Sep 2025 15:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACD7A60207;
	Sun,  7 Sep 2025 15:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556C0C4CEF0;
	Sun,  7 Sep 2025 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757259131;
	bh=b2ag+q5FEP7AKxW51T+P+cgwmPygSZIDFfP88xqPCGY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=K9w/FTZo4TsKmONxOLJJ2tvJRA3bCCvQj0jvUf6uxGAiSROVkCtkg/VEAWP/GRgUj
	 aw81CqUELxXRTFspmv+WfSeZsF2EHQ8LcHvmD/c9oaED7+4W92E28C3ITNAAAbEY0+
	 TTevBOQeDKFj6N2mhYBl2ETnWCmXUj+jofDgmO5rm7EWxVS0/JSyVYRcwL76zKIgLt
	 F+BUmHGLWRFNbbZVgxPm8QUbPAey97/0SBiMoQPzN/Un5fKHAuLoLl6962z9DcbkTv
	 EITgXzeG3gUpcKZ39TUuXiPC9QAEWXEthivP0ZBtt0L+ddBVtUDHgeQIshkxeCMHEc
	 iGlMKeYLhQ0eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DAD383BF69;
	Sun,  7 Sep 2025 15:32:16 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <053b276c-b22b-f3e7-6c11-abe61b8ee36b@kernel.org>
References: <053b276c-b22b-f3e7-6c11-abe61b8ee36b@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <053b276c-b22b-f3e7-6c11-abe61b8ee36b@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.17-rc5
X-PR-Tracked-Commit-Id: a03ee11b8f850bd008226c6d392da24163dfb56e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 00e69828220782cae5df67d1546d4969770c9753
Message-Id: <175725913509.3081192.6395265560508974365.pr-tracker-bot@kernel.org>
Date: Sun, 07 Sep 2025 15:32:15 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 5 Sep 2025 16:16:30 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.17-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/00e69828220782cae5df67d1546d4969770c9753

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
