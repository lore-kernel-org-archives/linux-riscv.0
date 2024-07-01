Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C071CC3065A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2Kt0ytyl9lH66p+Wkq2Qr9yVsBXirJM+5uKrR44E9Y=; b=mR8n4HkF/Jot2G
	clc630jl5l4peJ5n81FENglTfvkrXX3U+t024krP7hw9QI45XKvWrhsRA8bFQYOr7gqpV3gHFNabf
	FIbwIW3CJGtumi5LoeWIhr8A3IMMBvuDgMFrKy+imdhljPPPdKk5wAqY6B9T1QhWTg9JW00rdQOL2
	Ll8l2i/e/s1OKWngAnWMhEwzl5OHy4CJEDexqfDodDksDq9Sp/qGIeQHGu+so9cobwZjsEZ6K/Qfl
	5B1Ja5piGqeNtSRIpECgb5j/U1D+ZtKq8sinTAbQNyYvYnOZuaAetzx/f75hXRUNl+b+HQ6pyVq/U
	2xmvBsr9Wf0BkexMiXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKEC-00000004Ajp-1tmf;
	Mon, 01 Jul 2024 16:50:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKE0-00000004AeA-260y;
	Mon, 01 Jul 2024 16:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
	:Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DF+8y0/g/8mIo8Axh6oXlhUxjmxBmH6xYbCIrtGAFXk=; b=BUkLOizmPDKEY6kqaU6n63uVHd
	834i/zNOnEitY9Cp7YniFXlk0ieQCCwP6UgNpztzrFv6M2j5yu2mOYEBs3O6IqQkMLxwz6mu7Dtas
	qTK30xUG0f4ZbSlCKUDe26Jw7w2U6QbXGAImUcNASps/92HrZFP2pJi4gIwPUzvchJNvmU5u1VUtZ
	xsJJpLm+esUpdCMU+N7bl23PqZNcOSdD57rlsvdFcNIve96tK/7fAmhSoT2XcNdREjiuoqY+ru9TD
	NVCsPf386K8oa8RK8CjE0oikjRFj8jDuegsGwOv4xFz7ik+ymUjKUWELaE1DwfQNkNtfyFTgmKuYO
	uZzrMpmQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKDu-00000009gkH-0EU4;
	Mon, 01 Jul 2024 16:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2E18616A6;
	Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A27B5C32781;
	Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719852583;
	bh=aIy8w2x4i39X1sEGi7Yo4OKtvRgd6sbGVj+X1IPp9hc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=nETWEwBkViETCOMRbr/aNo7rsET1W64vQHQtv+ftwAyUJBEZHiWsuOqlpLZGEnqUs
	 Ftjr3NrZwGFrRVU4A7kftk7Eg3i6C/ZTjWhIbadpx1/r+RwzBJLbPCiEPKrwTvtQJJ
	 3nBag6NIkXcqxrPb7SrJ++lv2Q6aTFnrzY9FmMEeJXtUp3t8T/hy2DZw1YzFPIuG2d
	 QqBcq5Gb3EKG9gerEY0cLHwtNyaQCxdBrj2pLCcAkYg+CIXdMhe7kUF7v/xWbqxYAg
	 Ny9MxINsXsZoOKsu5gYOgCWySey/ZWbp7X83HdsW7T6UTSIf3ejBmup/ksHSkrmz3x
	 +h3qdvlYk4/gA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95DC0C43446;
	Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 6.10, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <3040c98f-940b-4380-9a90-dfcae18a47b6@app.fastmail.com>
References: <3040c98f-940b-4380-9a90-dfcae18a47b6@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <3040c98f-940b-4380-9a90-dfcae18a47b6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-2
X-PR-Tracked-Commit-Id: 07917ee08723e6c46074a2655a380126acee3898
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 651ab78190e2e4817eb6c21bbc5b4119c2fb34f7
Message-Id: <171985258360.24381.15874330138736099680.pr-tracker-bot@kernel.org>
Date: Mon, 01 Jul 2024 16:49:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_174951_404126_5AEC750C 
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

The pull request you sent on Mon, 01 Jul 2024 18:00:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/651ab78190e2e4817eb6c21bbc5b4119c2fb34f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
