Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHqFzfO4HYtXmQUGgJZjmOFX0afebyyqSCxPJr7JaDM=; b=k1diCpErfZfMaT
	6ePLWIQUtTjjdP6qbc/VKqBEQ9G0bc2qpQzoMSr9MgUok2GxEoy/pdnApI/2B35dTF1bZBKCRpKbc
	HRaqCrU/4l1OTNURuEwiWQkDWYeZMOh6VSY6U6kNIpR7xlQVvYxyyC30a77/95tkEDocL14NFcrXO
	bQY+jmGHbPhh0JPH6Fwl+IiA/DfXAqS1iJdLgHvz54mThOSjdo5eBjaBilqWsF2Z1y8eNQjIar3nT
	cuY9L5GlAIOeOz1OUtba+c/xHc0qNNOCd4QbLAI5IpI21BOCxPLfF9lsGFyU1j80dqFGrZNBGZntV
	3IYFK4RSJTkDYfaEniqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0miy-004RX9-1W;
	Wed, 08 Nov 2023 17:52:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0miv-004RVL-37
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 17:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C2E5EB81E13;
	Wed,  8 Nov 2023 17:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27305C433C7;
	Wed,  8 Nov 2023 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699465934;
	bh=BKkD7Q3EK77TDJ3/V4QDl5+V5ZpQzgcsuI9IvYmu3Fw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CJOnmYiakFqWWSWAK5vWOiwYADdlLIdsaA6C6SZ7Zyt0AJW0yZzVA50YqwmcrtFro
	 pSDTWmyVfg1Jn34+NoPxaL8RpUiGzYy+9BigflHhn9gqyu611tEaMAviXaFpAqaiYd
	 tUQRwaGNAE0XN+hiy85ss597fdA1s9b+DEflfThWXmomWGAMdCN9pKJf7XLw++UsKQ
	 V2gKIiUTRBXX8THYvBBy6AnJSq7YHKFmmbo8835dR6Oyzp1cujNRdCrF+qzarPm4IV
	 IXy/f4T8tHpb/+K5TmtFwJSmZ8cS4jb5hj5m+VcATsBAViTMmdq0+3Vq1KLZv4YFeU
	 jqECfNZFXVF4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 146F5E00081;
	Wed,  8 Nov 2023 17:52:14 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.7 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ff3fd3dc-81e2-440e-9e77-b97a64e23520@palmer-ri-x1c9>
References: <mhng-ff3fd3dc-81e2-440e-9e77-b97a64e23520@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-ff3fd3dc-81e2-440e-9e77-b97a64e23520@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-rc1
X-PR-Tracked-Commit-Id: e1c05b3bf80f829ced464bdca90f1dfa96e8d251
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d46392bbf5c6ce594669f00b8177f0b34e983f90
Message-Id: <169946593407.29156.17001806080175480755.pr-tracker-bot@kernel.org>
Date: Wed, 08 Nov 2023 17:52:14 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_095218_169477_1247C691 
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

The pull request you sent on Mon, 06 Nov 2023 07:13:47 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d46392bbf5c6ce594669f00b8177f0b34e983f90

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
