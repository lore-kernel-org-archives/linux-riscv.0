Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC4CF885A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 19:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJ+ntAJdEuj29lB9DTnlZsFQqfd7B4WiZUFtPbNNs8U=; b=md30OKBu2YARDv
	AXHLXjtsw7xcCbQU5zjc9cSJo2+e/iH2TSWO898MTtIBVg6uJOc0jR1rcYTpSWl6fkn53zcp1sa/6
	OibF+PWbYk+dgtO3Y7uM6iYKXQ9auEbwSdVkyxVoqraA9qq78ax3ZJiIp0j4gxvwBgzNiBZkS4UEt
	cPQUGPI38WVkuqPCT1Tl4KjqPnty7GHyF8U/dcxiRoB0BOvdfgeh5urNr43nAk9+z+SQPapV05Tma
	KLR2cpweFJKNEFkK9TKZRot0bsJpg1Kz6+PAwBuK5xRfFu6mYCODRmR2+Bee9j6Cau4abv65hY5rp
	dBuw2CyrGxRoYSdEmYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swo0a-0000000DuDB-0emz;
	Fri, 04 Oct 2024 19:30:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnzN-0000000Dtxs-1tN9
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 19:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 471215C5C4A;
	Fri,  4 Oct 2024 19:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2106DC4CEC6;
	Fri,  4 Oct 2024 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728070160;
	bh=7f1WwxlAsPRjjkw++ov0fnWKuNPkbGiQHsuOf11eB2A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TMyNAmiOSVssKxyq2VVPWZb5MucWQwapElVKWUcuqUstBR6Lvu1eEe4/EM/PEJ7z+
	 P2JYPEwM8TD0W3AnCi/5XA94x5ZuMa7Hj6v6T5jZ7iMXC0eBpBt6bqwiepN4HDYVO5
	 fd/rAOHAz2OKK536zmDp+A9NblKiWXsbshRglmGMvvI02qU5ZXrAWUY8YXCqndDWTa
	 vM+A6Ubh/ZaaLERQ+QqxSVEBAP1cb5+vr4iYK5IRpwAJg24aK2CV5Tdtpy34P5x++g
	 iq6YBg8OFNTYA8IFGdwqGedzviCfwvBHnnRTmWgB632C1Lq5cx2FBmew1NVLswV+0T
	 vVKPt9Du+B29w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB95B39F76FF;
	Fri,  4 Oct 2024 19:29:24 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-06f4491c-e8d5-4713-9342-3470d90d42e7@palmer-ri-x1c9>
References: <mhng-06f4491c-e8d5-4713-9342-3470d90d42e7@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-06f4491c-e8d5-4713-9342-3470d90d42e7@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-rc2
X-PR-Tracked-Commit-Id: cfb10de18538e383dbc4f3ce7f477ce49287ff3d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7943f06cfc8693d861816dbe608f84d52dd4af52
Message-Id: <172807016349.2715268.14481192352086944256.pr-tracker-bot@kernel.org>
Date: Fri, 04 Oct 2024 19:29:23 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_122921_548141_2529C70E 
X-CRM114-Status: UNSURE (   3.26  )
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

The pull request you sent on Fri, 04 Oct 2024 07:15:11 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7943f06cfc8693d861816dbe608f84d52dd4af52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
