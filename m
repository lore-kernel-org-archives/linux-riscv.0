Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28A4CAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 21:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYogzRjpI9kF1bi8H8itnIA0jCM8upG+TezESlRSZ1s=; b=uBlJ2Z/GsfvxFf
	gQGc8Nyt4tfRzLO0xcC5tBjlotpw2vE4vm9pNU5Bl/sxIf3mZ0+QW1338jxrZG9LlPcN4ccD7mth5
	fudsShDxtqliZhim1XZ3B1LVLwRqMhY4mxNBvmaNszbWJSsPXhFEkq4OR+041VxxvCnqQtako2C9o
	eQlVEuAbu19t8NuPB/SaXnsCNk4fJXhcJYp1Ri7bGE+/oCvxhULLkIy0/YTWF3cxvnX22Kr3wCJgs
	jyp+agWgUvxIhUK16qvYfz5/stDPW5ktjK4W5W4Lb5N1+dsi9V3SlxofCTmCQuCY7mXJSE1AChvOq
	7TYin3OVBOr0tPVDBODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2GEl-00000004liK-3jly;
	Fri, 26 Sep 2025 21:44:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2GEj-00000004lh8-3Mdv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 21:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A220455B0;
	Fri, 26 Sep 2025 21:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0465AC4CEF4;
	Fri, 26 Sep 2025 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758923057;
	bh=S1fAAapAfp1lEZtCVll0Xx7svNEJjn7DXQZSbHsy0OU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YMzexQKXEyXYtGC7pdVIFnMqgs+qhU7fels5pTTmW3KdYcGkku44SQsM/HxwBFx14
	 aXCzgouf4Pe98UVBjpwLckmcXvHBdWUm7OA6yEUP14QsqqlpcXz5h3h2aqKDMtrJzj
	 a48y/3QstghSvyAdQ9EM6wIDaYstYKIr6+iX+b50yjAQuMVrltfwGBPHX8O7FYWklM
	 7gbwE361nzYDbkkgS1n/K/HLqGNhHVGZgxQnC2S4pi2XtT4wJywpzuW8N6QQaYUzCJ
	 8o4Vm6jgntuYeM1KPLtCQ4JbCeZY7CYsDVuin8PUoPrtf92GQV6Ir5UA1XCxsjj1K+
	 C0FHWM2mHITtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC339D0C3F;
	Fri, 26 Sep 2025 21:44:13 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.17-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <c6ef1683-9c29-cb02-4498-31fce8934d9e@kernel.org>
References: <c6ef1683-9c29-cb02-4498-31fce8934d9e@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <c6ef1683-9c29-cb02-4498-31fce8934d9e@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v6.17-rc8
X-PR-Tracked-Commit-Id: e24108012ce9662d90093f91d5ffebcbf78da7de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fec734e8d564d55fb6bd4909ae2e68814d21d0a1
Message-Id: <175892305195.68869.1244548316108368501.pr-tracker-bot@kernel.org>
Date: Fri, 26 Sep 2025 21:44:11 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_144417_861930_977FF331 
X-CRM114-Status: UNSURE (   3.27  )
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

The pull request you sent on Fri, 26 Sep 2025 12:33:10 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v6.17-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fec734e8d564d55fb6bd4909ae2e68814d21d0a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
