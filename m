Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83383C5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBS8zuzqeCRn+MH7XgriEEw+V+MLyXir18N5ZdAaWhI=; b=wvRR4/3a0Q+Q4i
	CmaSUm8MwgsZYtWlya+NJWlMZNOYLzKJwM1WFkOuXzEE3O2U+qoUdpiodC8d6bMaAYHOyolsCEEda
	0KLetcqbVnBpCuxBo9TzBXxhjFnQ8MsQlm6hbERuYOytil7DlkF2PaPiWeUHLro3art79EsxA7d/V
	PcjV9J7k7wWrXznIl0viC8bQC6p3eJc9ds3KjAMDfgM5RkTBKcLM2t44bBLc5Gh/K15wUb0l2zFcy
	7cfLrnldaTmR4DuC3nKLptPKcNyyplbZ2yupa1ez0o4jHE6wn2+59J1IG6Al6SzdmGAVzvbJu8bG5
	4anNTV6UCxC7um+9q+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAm4-0000000CGLK-2dIO;
	Thu, 20 Aug 2026 21:58:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAm3-0000000CGL9-1aHX
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:58:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8016560A58;
	Thu, 20 Aug 2026 21:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394AB1F000E9;
	Thu, 20 Aug 2026 21:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787263090;
	bh=rxHTN/JcCsKDX7JqXUGFUn3Ei4QlwGF8aQ7Fc1/77/Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IeF1vYDZJMjxeHuGnIfT71c/ggd5/y7bpX0VnGyWI8/R7SKoMGKNcY6hprlfn/3Dx
	 ULLgTQ8K8K+QYoZngd/QRGtgK5BUvDSwfZ7jgKB/wPiI9xk4J3SULwwasMuxEA6wM5
	 ChdqCcNvDcTLONAi/rnOednlIglXCdURlhLrVJzHkFu08HDXVod4wFfB1qAz5I+IMK
	 Z9AqroVuGizwFMO2rwNmjOMpQcaowuBX7+LQw5jrSnWQoQ27yy/OA3XFQWsAIWYwT8
	 /FOiHMpDkWz4tHS2mkT4wuzHfHlnBJAbk6lMWIomEHSk+0e9AwjUVazR5iWbqNi4qw
	 l4IatgCoGKsGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BD43924472;
	Thu, 20 Aug 2026 21:57:21 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <d788ab68-c0de-69a3-a36d-b968d6de9b7a@kernel.org>
References: <d788ab68-c0de-69a3-a36d-b968d6de9b7a@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d788ab68-c0de-69a3-a36d-b968d6de9b7a@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-mw1
X-PR-Tracked-Commit-Id: 8da45c93dfa98f25b148512d92ecfa75d027a5cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 073e62fd33fe9cec754cb89e60c0ebbab781a50a
Message-Id: <178726304020.508102.14128049558533490488.pr-tracker-bot@kernel.org>
Date: Thu, 20 Aug 2026 21:57:20 +0000
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

The pull request you sent on Thu, 20 Aug 2026 11:04:52 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/073e62fd33fe9cec754cb89e60c0ebbab781a50a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
