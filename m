Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F882C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Feb 2022 00:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA9jfaOTo2m/NiGY1xfjifwPKy2+c6eA5u84MLyw/MY=; b=wsPBp9wNX5EiBv
	LtsMbqd+VkRfL+vCXThJdEuJhKHzJSAQgBBrMwIxuMXXQVv82bWNkLu4SPhbIwqkUQ9qUksZRuhGY
	yZspn9pqkbfHZL08t0VrrpFQ0WCE/y+rR3P3Qfz29QWti2abXm+nWCXx/hUioZlVsnqL2pWd1vm2m
	I+YYAoBnqpfTJD9yFEHtUCb99iu9d23/C8Jc73RcKJrOIPQ+/+eHl21vAfLOlG3ogN29haTXKY3by
	CSDI0Nu71Qqqlt7gKZ4alfVsWeDeKg1VUekCEuCj68Z1Y5Y10/HBfzdnJs1ePok2bcVwqa/hMDUG6
	GqivNTThtC6VBoXT4/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLDcL-00FyPs-Uf; Sat, 19 Feb 2022 00:28:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLDcJ-00FyPK-4W
 for linux-riscv@lists.infradead.org; Sat, 19 Feb 2022 00:28:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A62A361F81;
 Sat, 19 Feb 2022 00:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19E72C340E9;
 Sat, 19 Feb 2022 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645230530;
 bh=L3VRlBv6tAqdgXucgTnsdwiVKKptjWP6+7IbqcZx2Ng=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BgUdikWtguueG9dERfTa1heEckomOgVQfN0ymbMjOInpxk5beNIJFU0g5ehfrHrh9
 ucN43Oiqs5z4MMhfBiCn/pA+Gu/1L4p7QFNeNvE29aRMNE/1FtTKQeMgwGEKKu8Ghl
 lfbHXewNTSAf7j/kMF7I2oFuxzRcnxKCRkTBv+jtDnvGnd7AYbxziEhzakBJRv2PuX
 pFLEIMD9PcFbo4klBjYsZP0Wax7/phZmG5H2P6xtmtG6T+ycbg0OZPnsOMSc1+vrHT
 t+JzmPSAblJ18uR+uElP128wZujonI8mWked1EF+B/82flxl25W11sF/q1a44wbbkV
 EHSW9MXWgsspg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 09BBCE7BB07; Sat, 19 Feb 2022 00:28:50 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f149d1ba-1f6d-43b3-8df0-95d27c2b89c0@palmer-mbp2014>
References: <mhng-f149d1ba-1f6d-43b3-8df0-95d27c2b89c0@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-f149d1ba-1f6d-43b3-8df0-95d27c2b89c0@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-rc5
X-PR-Tracked-Commit-Id: 5feef64f4c67068c49f5409d43c67cabf2327f66
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 241c32d853a84b9d775f9fd58f1ba91a0a5c9117
Message-Id: <164523053003.25426.2979653564959805148.pr-tracker-bot@kernel.org>
Date: Sat, 19 Feb 2022 00:28:50 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_162851_233925_CE691934 
X-CRM114-Status: UNSURE (   4.40  )
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

The pull request you sent on Fri, 18 Feb 2022 09:50:17 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/241c32d853a84b9d775f9fd58f1ba91a0a5c9117

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
