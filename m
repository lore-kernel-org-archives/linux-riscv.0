Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC005C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5G86tUDg88K6DV8cmbx76sVo3EEB4P3JiJlpkaUTk0Q=; b=JPQ68GZlHt+6Op
	4Z2udEdl9La0itObOdRQadKddgsZKDPw6YQcnUvm0hXnP74TDzBJmYfT+u7FIQVxf5UBd1uR+0aGR
	nCWEf9PuAa4lhC7vdqX948BLoHL2JKQIyPxE2cl7zy+K3ez13Kcvs2+ja0WaAGmMN2VoRtiqnud38
	qGDXx8yR2cch7YK1v3mfx6I7NokA0RWJF+Axy/rXpXKc9dZ3GdQlkp0j0wOpwgLaYAM/7RP3n0CTi
	x72zVk0qSbOgHZsJSZcJnJVatMxz3dHzh+7CTQHt6NwR04axPaZyQ+IDa+aKa3GDfjpM7eqvsvKYH
	PzFdGWrcKzB1NxhT9s4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0nXx-0000000G1YN-2N8w;
	Sat, 27 Apr 2024 19:17:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0nXt-0000000G1Wh-48Bi
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 19:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 42CF8CE16C0;
	Sat, 27 Apr 2024 19:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A128C113CE;
	Sat, 27 Apr 2024 19:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714245427;
	bh=1rBmnpmp+3+JeOb4OkzzFCSSkgiCQNgM06ytnrIgAZM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mjbvyOuJxXqxs9dB7sFqVku9giS15pxN5OUhicJTAWk6K1r7IQYGRehSTU3Hspit1
	 yykTo5Tgln5hQ0xTPbeX5wRoCsQ34htqvmjObqDB0m2OyndPYi9+oezofl6cdvKcO3
	 yuZy+vSjHwg9V4vo8zgGjfd7AP3z5w7Hd2muAMDd4u456mwB2FfpUThDAPOLoYeFwH
	 GayYoOgpZ6PQG31Hp+Ky3gHKJ7R//l38G25sWlRLIcbgG3kA32qG7fZf7KawzgUBE2
	 6rzI418PI7rePSanGcEZAyo0VeOzZHNOqDVG1j6nAzKpqrtpsaqa+RcxMkbeMyLst9
	 zTukrVvJnx5UA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 506E4DF3C9F;
	Sat, 27 Apr 2024 19:17:07 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.9-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-2f5e2c44-3944-4a0e-9669-12967d8e6f15@palmer-ri-x1c9>
References: <mhng-2f5e2c44-3944-4a0e-9669-12967d8e6f15@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-2f5e2c44-3944-4a0e-9669-12967d8e6f15@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-rc6
X-PR-Tracked-Commit-Id: 6beb6bc5a81e1433a1534e75173f67d42a6f225a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57865f397001f592817eea513251705d45d000af
Message-Id: <171424542732.11751.17792998119200649819.pr-tracker-bot@kernel.org>
Date: Sat, 27 Apr 2024 19:17:07 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_121714_221702_3541E50A 
X-CRM114-Status: UNSURE (   2.62  )
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

The pull request you sent on Sat, 27 Apr 2024 07:56:54 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57865f397001f592817eea513251705d45d000af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
