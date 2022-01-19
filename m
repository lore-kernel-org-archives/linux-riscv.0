Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E55EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mA9LIQVvjD1xDOzPP/f9rLqqADWW5UGgNFkN+CHUzuQ=; b=rW0VF11GfmImyo
	8gDl++T0fAiVVBDuWVvHjqDzc97whytXCmbWs1G+IWYXaQJQCoGWZEPNGcSQcNVZXuovO6kxua3/4
	kX6YVjWE8SOgCwdCSpGDcW1LVKE+KmrdmBdWSEMZeYlfPJFNn2gJutqgASOVTRLNnEy7kdml/m8tR
	JoKJfN0zt/b/nzya0sn0qCt8r9WuPaeGJ3defpNK1y9v6vreFZpVEiuJLJWOHR1Y0q+XUkcNqtzFA
	LzjGRg+TyUzLTlNsyZNGVzsuMEjeM4WWFZHSp/3qOj4EHuacIIdpFc20UchqZpPZFr6Lpy9g9DMjt
	T03AV3SUc2bACnHYPinw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7Zi-004i9J-TF; Wed, 19 Jan 2022 09:48:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7Zg-004i6w-29
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 09:48:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34C29B81907;
 Wed, 19 Jan 2022 09:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA590C340E5;
 Wed, 19 Jan 2022 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642585692;
 bh=iWKKx5io6KUyHwyzoYOZlJXeJdppkve6no+RNsA9mds=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=e+qeB7uSEawCukvb1YiIGVIXeRWNeViK7avaVhgRhGNUF4qvPKRa34ayzvYX+fV7I
 1+dK5T+iq/SlPRNI9tBgY0+jjvs3Ri1N4TVegS83bC+1not5Kb9jLGeLXQX57qhyaS
 837M+sQlYKJPKnCtyBlMbh0fWfn4bmdAJf83LIy5ptwDI0OzzSzL9PijvmfHLsQHJM
 yZbbLTxTvvXfaU6UxjpYamOOrT1NYcNxsh4VdL4AReLw5Q/ghsQJCMl0ovQNMhjwLj
 1ZeRleQLbEHYzQkFXWEo35jf1EFYsIpz03qWZB40+zmRJy1wuKV4z3iir0Z8EWILb8
 Z7A68k6Y29ptQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C8A85F60795; Wed, 19 Jan 2022 09:48:12 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.17 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d9275aee-84cd-428e-8732-adfa59900a9d@palmer-ri-x1c9>
References: <mhng-d9275aee-84cd-428e-8732-adfa59900a9d@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-d9275aee-84cd-428e-8732-adfa59900a9d@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-mw0
X-PR-Tracked-Commit-Id: b579dfe71a6a5c3967ca9ad648673b6ca10ab0d5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1b744f65e2f9682347c5faf6377e61e2ab19a67
Message-Id: <164258569281.19279.8075866123840125296.pr-tracker-bot@kernel.org>
Date: Wed, 19 Jan 2022 09:48:12 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_014816_266737_B5282E82 
X-CRM114-Status: UNSURE (   5.06  )
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

The pull request you sent on Tue, 18 Jan 2022 11:04:09 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1b744f65e2f9682347c5faf6377e61e2ab19a67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
