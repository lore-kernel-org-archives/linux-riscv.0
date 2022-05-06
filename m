Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514ECC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwf8vPMAckJCdhrE2VsAtKXR7TmuHhJapSRGOBctSVw=; b=phQa7CxIibsMRr
	75Du9mjdc/BtwontRecECmg0XUU+57uV0Ydxc3bmKIOSdlZageJRCgAMlKtTrgOaF6nnJXvB28aKY
	OfCiGXNvo1a/6+WGCOLYPt1iDwI9GAghp5iIPu/RVZgz01EhZE5aEMkBGe/1SUh26P7tEMGAprLmU
	C39IEWBDZBzh7You/6BNboSGGyI+uJneySw0Ar53MM87+9+JZvMOmIrD+Vt+RBsol1SVC1/SjsEga
	SLtLwZUI6+cHI2sZepjr1f7nR6Res3Oc1sYUkA/qfIb1sQlxLAm8bwqGQxBhxBhDiZ1cmiL50QWKt
	kk+OBZ9a2OiIUeXuoQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn3Pn-004onx-5d; Fri, 06 May 2022 19:14:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn3Pj-004olj-PC
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 19:14:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76998621B3;
 Fri,  6 May 2022 19:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAA41C385A8;
 Fri,  6 May 2022 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651864493;
 bh=9izC6voEokk5hZqLjo1Prxi7Rfhs3FZIxAhsffdcD0A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kqsK2oc+VtM1VqpoVU/2qEgRevrIEfXgxdJVFNs6BuH4/aJJPgTnmelxYYmYCWfGF
 8UEUOAg785tt4vJJh+f1u8b6YlJ7jDlxhHvb+LZMQJ66cCuUsyGgQErX3u/I9Kfh8J
 ywPW96MnY2ND0CNQyf2JAYijURqxHx17sdP55MfGh1MYlAAoEptPDcd8FH7klC1Z99
 Unvx6C+P9nHK1krB/TNKAmz5Uyubf5uW3Zq9ws6TELHYUI3XqMlJ5USWb79AZmLiGk
 rKPFC7/u0CR/mY9syf0LjjgzT0Ysc2MzzVgO2CXN90r2ig5FDTFEEuAeZXQ2aTtXLv
 tUZWQG+scrrSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C73DAEAC081; Fri,  6 May 2022 19:14:53 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fix for 5.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-93e651e7-8975-4f60-8fab-31f695d9af2b@palmer-mbp2014>
References: <mhng-93e651e7-8975-4f60-8fab-31f695d9af2b@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-93e651e7-8975-4f60-8fab-31f695d9af2b@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-rc6
X-PR-Tracked-Commit-Id: c6fe81191bd74f7e6ae9ce96a4837df9485f3ab8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 497fe3bb196de7249723ba1496fb72ca63ce14e2
Message-Id: <165186449380.13372.12860414235856776719.pr-tracker-bot@kernel.org>
Date: Fri, 06 May 2022 19:14:53 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_121455_878048_1FD7D444 
X-CRM114-Status: UNSURE (   4.15  )
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

The pull request you sent on Fri, 06 May 2022 09:36:51 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/497fe3bb196de7249723ba1496fb72ca63ce14e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
