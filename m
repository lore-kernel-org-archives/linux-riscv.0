Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DA9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 18:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FHkCn3CtAMdn11mTPuGmolGbESLdL3XCpYKzjsZOJI=; b=u7mZjBsHHxy6sb
	OiJZOXNkxWAxqWWo/x2rTI6cBzdDq820ePiuMMdOn8L5H6uv/QLoao4vRoX2wa8ESZ903KeOKewQK
	Y7cbDwU2/XT2VTjDbEwPCGy8Z7ChRCITcScfT4IYpDh0sMArnh0mCNNqDbzej6xcNm07NE7CZHtJG
	nPJf8Y+dSm46snvL5/8CqmaLDykZ8ZHTWl3yyi1OMMS+WC+didiue8s0yUnj/Xckxzo6LarTlj0ej
	b99VaBJtHfeU7/Wv/qblDLSYrDi38E5MbDAEX85Qex0CH30YzD8/RTJ4sinSj1OFvVN8MZXhXmf3w
	wN1SbPm1lWPeyaoWzIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns7Xl-00EFQF-S9; Fri, 20 May 2022 18:40:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns7U9-00ECPZ-0J
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 18:36:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FFDAB80D89;
 Fri, 20 May 2022 18:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 492C2C385A9;
 Fri, 20 May 2022 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653071781;
 bh=TQzXOoYS6WLOY9eLwsKqXNwOH0zAsygnd4kvMJYTGCI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hb5Jy6jXMqL5ep3RKI/kuUEyl44zqvij5PEV9DsjG9NkAPLRTqdZ7rrouUpBI4iOd
 epuKU5MtVFUM5rpM4lRDylsYxrqBmO9f2WIs5921HBbyoW0zguTUGv8t8MlQ8WM6MO
 ypQeh4dxH7O9n2kkaDe5a4q/3HMTVkVZkWVe0/Alk14wv6aMqbNp4ihLP9vGtnAbgG
 aoaekB931XtXAW3iCjjxLO2ycUP7q65fdLpg+tZPbF+yVDCGQQUeCjtTLRjgdVHHEq
 kSKEWy0WAmF9GkdiT6O9n2bTTyxEUYC+jxdqogybg7V+1k3AHtGekiN3dS94Oni5Nv
 EOLD3YnyyHvag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3525AF0383D; Fri, 20 May 2022 18:36:21 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d5b7ee6d-8d8f-4603-9a20-843f35fae857@palmer-mbp2014>
References: <mhng-d5b7ee6d-8d8f-4603-9a20-843f35fae857@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-d5b7ee6d-8d8f-4603-9a20-843f35fae857@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-rc8
X-PR-Tracked-Commit-Id: c932edeaf6d6e6cc25088e61c3fcf585c30497c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 265f34c25bad0d92ca439838529db366adb0e620
Message-Id: <165307178120.15282.9873885050504477794.pr-tracker-bot@kernel.org>
Date: Fri, 20 May 2022 18:36:21 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_113625_250537_3E79F38E 
X-CRM114-Status: UNSURE (   4.36  )
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

The pull request you sent on Fri, 20 May 2022 08:42:22 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/265f34c25bad0d92ca439838529db366adb0e620

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
