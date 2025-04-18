Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE4C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WutXfouwdxDX64z9iB2Gcn5dsneO6rFSQNif3MTqiU=; b=AyZ2IUe/vl0BpW
	XL7aei2Nu6UhsKpNfvZWw7yqvqkJm8Ng/sna2nb1sMXqX5U2afqf9XF3J0Smd/EKXvAr7S5CiN7En
	f7BluAV5rhUutJsib1A+keQLtadzzZIY3KXAKafjDMqe+vBnUM11t9RLIdNWn14WvMxGP5oseMk2K
	jU8Y4dCrldCio2MGjOOqO10CI/oLVQTBZg0Mvxdc//QidL3e3ee44Sp42wGNOjDeYkDZk4ITIhOpK
	gbQAiR3utLKdgApOR7JSmRfD8eMwPR5WmDipQExXSZ+Rh60wKaQIhcUEzhzhW26K6ReHRuj9tt1Xn
	iI2G+eHPT0ira4YsFETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sKr-000000009lG-388f;
	Fri, 18 Apr 2025 20:29:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sJ0-000000009Bi-2fKM
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 20:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24DB84A696;
	Fri, 18 Apr 2025 20:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479B3C4CEEC;
	Fri, 18 Apr 2025 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008041;
	bh=zB4JD/utzrx4JucPzJnLPw/gegfQGf58iSb9rLuvUwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C0ImqSZ56hbjPUFrtCzxg3t2u8qkXZs+acJz6dDMgccFX3HJ5zcRal95A4WqDEq4C
	 Pn/TIzAqKzFAJJLY5fcrtf3hCxZ16mdHPDqrgqERxqL9akEUhQQKKYW76zSSV9o/l/
	 8MbgEPrRHRYRYjxuS0bPgHifIZdYmS2VPUnPvSCrjNtkfBbHnCHRNCrXsQkQ4vG5s7
	 EmfA+/4iZEo8SSu5Wwgkh5kqrBRwW2Y5kdwkqIUBvduoRp4hRHws/DoWHGjkWpNLd4
	 vE8PePWIY9D3+UzaZjhH/JtSj3OAzuv8FunnOFYlutkoDN5t2wziAVNrb7RbjLxSY2
	 qgYJWauHbtYWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC3E3822E09;
	Fri, 18 Apr 2025 20:28:00 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
References: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc3
X-PR-Tracked-Commit-Id: 615e705fc8c7bdb6816faf09b5b16a0441f050e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b828867b3949d8e9dd698b906e2be5b7eaad4a5
Message-Id: <174500807936.316726.7073678550748667980.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 20:27:59 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_132722_707290_EF8CF5AF 
X-CRM114-Status: UNSURE (   3.41  )
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

The pull request you sent on Fri, 18 Apr 2025 10:44:38 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b828867b3949d8e9dd698b906e2be5b7eaad4a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
