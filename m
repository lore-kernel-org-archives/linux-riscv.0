Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77887C7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgGhmyo4dAfAI7wbqIrZMidqAr5dV5D7VRtaZ6Su2kc=; b=QbWzprtZp9Whxl
	1ni9MYgTGbWpK+thslMiR59mZqBEV/MAv2SX2JUNm6kl6V1KBbFsaZStS1H9Y/g1K+e/szsxcsaVE
	v/4Lw0X7G0XSu5qqd59Q5Dq3LA4q24FaQsmZ0R16HQdBGbhJRxVGW3u3gA+XCq1788zaNUdiY+Zva
	ejv6M15lPbpwsiROAPHirBSY3J07yNQfPWmzf8VWEaExaytgfpp1Kon8QBUgUJJBnIBH24HFKAN8s
	a/jii6SBdM3tOB/KMdaESdxHQJOIrnfqvEi0ZGr1D2suvzztTSTQpH1tPrlFgGBahWxKeMByRaU+R
	9m5j1Lyl+iGaGw2YlewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7f9j-00Dcvi-1n;
	Fri, 09 Jun 2023 16:40:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7f9g-00Dcv0-1p
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 16:40:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B7EA60B66;
	Fri,  9 Jun 2023 16:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 836C2C433D2;
	Fri,  9 Jun 2023 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686328803;
	bh=G2Q33B8KxwtFPHl814M2Os4E+1M8uuR7LRuh6lu/CEQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UpINuVdkslrxaBtQQO0CupFoKLM4vnbbo7mwlT9bpnEoywJTIim0CKo0yvgl2Z7Ot
	 mgNwgz+TTd2IYyJP8/hvgwqQa5mjb7u63TD/W9RFL+tTA98u5x5Gw1tW0O6dEijzgH
	 s3QjdpxAv/0d7va9pzpOIJuS0irMpKiSEi2LQc7Ih2pcazmAEPFyVNhra2FZx+CcCV
	 ji5yoJNSDukMap8yikDaJLBzdLOKp3tnJc3s46jv4d0R1hGxes7IimWLWudiFkhM2T
	 siQDdec7qfpDqLUaFOITvfVlEzz8pxwFjgwdkX3sgZAsXGRhrY+EZxqCGuTw2fNKRb
	 lyOnHvy0+UOcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6CB4EC395EC;
	Fri,  9 Jun 2023 16:40:03 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.4-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-bf5e8144-98a0-441d-b6df-63978648c75a@palmer-ri-x1c9>
References: <mhng-bf5e8144-98a0-441d-b6df-63978648c75a@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-bf5e8144-98a0-441d-b6df-63978648c75a@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc6
X-PR-Tracked-Commit-Id: 99a670b2069c725a7b50318aa681d9cae8f89325
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f506c7f7d3d8d68a1a020c3d914390b3ffc30d0
Message-Id: <168632880343.22626.17527323735551974086.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jun 2023 16:40:03 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_094004_645995_421F02BD 
X-CRM114-Status: UNSURE (   4.33  )
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

The pull request you sent on Fri, 09 Jun 2023 07:45:06 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f506c7f7d3d8d68a1a020c3d914390b3ffc30d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
