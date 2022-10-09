Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7EDC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlahkVBT5Hr+6uy3/iv5ctC+MqpWnGC7ruiuo1aueQQ=; b=Nh2V9qLxLUKQUm
	7wSxV0ocs3UKfHYGiMBhq7LS6tuFgTC/XMjB2hnFcts3dLAzwyyvRxv1Lt2gVslOSqeIvkaTW71yw
	W7LeftnagMhxxfN29NoqhAzADejrO2LB7Dy13thcO7r38ClrQ5YGPj5Y0Aa08JdCFekdC4nEf9f6b
	naRRyZxFK3LoED37OVFTonUs2DGZBnw0/xzMsDdwavaJqNKt1vaxuyxqgOkCKZgq/4X37klODSLT6
	449Tc2JpEd0k73aKaPJkAda8GRYoRDfXB5pqTCFw00nE1MHrTr3O1TeatgJWZbukvP6T76mBP5Hsg
	P0Fw1hNz/f2AdK1wNDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohdfm-00GDDq-O1; Sun, 09 Oct 2022 21:17:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohdfj-00GDDM-1c
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 21:17:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C59E460C92;
	Sun,  9 Oct 2022 21:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34CA0C433D6;
	Sun,  9 Oct 2022 21:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665350237;
	bh=Es/2BThmp7XL9RuYfTeRmgf9ulTqA+6Rk8+OCWEZxX4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=K3IqbaA8YbbqC/5SWxODXo+2R6Efyz+DEfIkOGkQid4LDvMc+DP1c5nHy/ELHqx7P
	 PtsS69NpVRTakM/w4/bs9aqtJ5BC7Opxx+Q1q1IkYa27tAqDtDcQaoD35teGN/on1S
	 gpw31bwKWJjicILYGxas8HtxF2F2rMFukBfT6ag++0gjQhGSiS9e0lDNLtBlNs0L9T
	 l4LJLGi4jJ09UYy5+qaccUi5fTyM8ah86YoOEWAoz3n2y4Eq0FtFQf+2IAE8gb/vgB
	 c6p11ldQJ2NtYJrjU658Yutxa0Spt7ub3D4HBNrkyCrPWDjNDnrBFr72xq+2r2hVgr
	 bEbN+7b/TEvBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 261F9C73FE7;
	Sun,  9 Oct 2022 21:17:17 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.1 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-6190fb79-f9f6-41bd-90f3-d4d6009d41a5@palmer-ri-x1c9>
References: <mhng-6190fb79-f9f6-41bd-90f3-d4d6009d41a5@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-6190fb79-f9f6-41bd-90f3-d4d6009d41a5@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-mw1
X-PR-Tracked-Commit-Id: 87f81e66e2e84c7e6056413703d732a99c20c09b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e64066dab157ffcd0e9ec2ff631862e6e222876
Message-Id: <166535023715.11566.287602438367733555.pr-tracker-bot@kernel.org>
Date: Sun, 09 Oct 2022 21:17:17 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_141719_159576_E480BE95 
X-CRM114-Status: UNSURE (   4.94  )
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

The pull request you sent on Fri, 07 Oct 2022 10:47:57 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e64066dab157ffcd0e9ec2ff631862e6e222876

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
