Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190BAC47422
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycI4EGJGmfwzroJXc/WexxgaNgWJkWxNYt4UY7NwOGg=; b=dRatNuPQfqIqT3
	A4wMs7erPBznokAhhFygmWjcby48B2rmgm+MsO0I2GrqvEEZBEzs7fS1zizVLvT/7WJXbLQIKZrhL
	xzCqDAj8pQglPE468MtubFbDD3QpDvXsSIhUTZseN5zw1pexXpQPcQPX0clPXaDOsPcd0kMubCarK
	jroPrlcyqd0ey/Y2e8bRylhNGCqFzNRuDpWWRayRirVO3LieDnx8AQ6TxnQTzAU/O4XoxaRTVGbiK
	brpE9kND5hEXfJryv4L73XFmgQyY+gnlPwh88ijKKubBe7L7V/gm/rPSpj5+y5CjJd/sNbBMnYWwE
	XVNbyBjzpBNp142ZjRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUKO-00000005Xfi-1bDB;
	Fri, 26 Jan 2024 22:05:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUKK-00000005Xdq-2pxl;
	Fri, 26 Jan 2024 22:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C783D62598;
	Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 901BCC433F1;
	Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706306729;
	bh=N9SsXMMEIz6W0s6a25j4nRRqUAORhnzwDEPJ14spk7M=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=TmHl+wK79aOPYqUIkyl+O4hRZ9LtANjP+gIunhbMVZNIGjixz+5Y5/pPYe8c8ybij
	 fWSAk5/CHqBQ9OJ8N+4G0nI0jC6ONcnijs0+HQ8Fz/8S0tpJbv1B4XOU6nrsl4JfXB
	 Z5Y7RjA1VAp12cjl+6BMNjNlqjc7drxGPiAbTkLexpNBUIIL1ozYxSkDnmkeZdE2Ct
	 +3rpJiNv5vpih1O/h6p5ATenUkENmimwNWeeNPXSB2iU5aS9kLW0BJ2DpGNiJHCNeU
	 rCv2IC2oPlEoAmmYlLUCRTDr05hvUAt1rWItC41fw4amw8c+PsjVaNr+5E9ApyAr9q
	 0wG1Hgyt8BnXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 805F9DFF760;
	Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
Subject: Re: [GIT PULL] Arm SoC fixes for 6.8, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
References: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.8-1
X-PR-Tracked-Commit-Id: 1f4a994be2c3d13852fd5c1054f292bd303352cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae971859f810d90c2e844cb2eb3daa5e061dd446
Message-Id: <170630672952.20742.6986632229064866379.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jan 2024 22:05:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_140532_777481_4B69D614 
X-CRM114-Status: UNSURE (   3.40  )
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

The pull request you sent on Fri, 26 Jan 2024 19:22:04 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.8-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae971859f810d90c2e844cb2eb3daa5e061dd446

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
