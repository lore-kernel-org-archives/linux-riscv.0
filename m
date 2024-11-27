Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E0D6D227
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDxI3po2zEtJ77FFvfIwi4cDbzkMmI2U4N6mmOYQdJY=; b=R8rphZAWrghoE7
	9Q2ER6aS/dgMFB+Umh6ogSnENnG1+NjXPLdt4OQuOKz0jIQLTD7q3B4DmeLGFVwWamntCQzQuPh8N
	FqDy4yio29/dQitkX+sP9VOUdU3dArsHd7sQgHJTSxn2X1uGWSWqVWFkzCxGOkyBuDZvaYBx4vEb/
	v0sZMK2aASx6oIS80MIVllALB7+VEqx105yY9GMfW5nHMqKrVX0wIoCbmvgcCxYqkTGlGQv/yfTQi
	5r/LrJwhZeGF+VD7t9B1pAUMYx6UzeXXeBZswsGAOYGysRVbBqvbamIDwAZS2V+r1l0LeZp9sAvQq
	kq7/ph4uVpraYwxR0Gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNqp-0000000DxZa-1ACb;
	Wed, 27 Nov 2024 19:37:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNqO-0000000DxT4-1hqx
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 19:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE6A6A439EA;
	Wed, 27 Nov 2024 19:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609C7C4CECC;
	Wed, 27 Nov 2024 19:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732736219;
	bh=ZzX7oKXy2Tdp/Dmbid7+UFmOK72Wd7W9l1+Q2D83x7o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EbmRD5LXDAgDQHIvFlqudUM0R6quL2TGkZ8P+fphFPjwQ96iz9ie1gMFZaG2Fg9RP
	 bQSdPcit6iGL2p2czFpl0unt0zFVHM0mJ3na/7wUhV372f2bCHQwicSBc+2wMR6ath
	 iQUxtxVv724HqsFIr7B9rrRxrbUqXS214hzRfHRUQKuEoRIraAPub/xPsFGfktV/dU
	 F2JM2ylC+phYxKEldtzeFKWBKjdOzxGOB/01NkbOaZTJhgU8wuj4V3ykqSdRbSsI/I
	 JNlGuUh4XMcVGiUEzBF/Lup4HkVsX9LUTj0cS9E+sQ0FwTEdVh99ftFhVklpowxUNc
	 8W0P55JiddsGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEC0380A944;
	Wed, 27 Nov 2024 19:37:13 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Paches for the 6.13 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5c0ea89d-908b-4009-ba23-e4fac45618b4@palmer-ri-x1c9>
References: <mhng-5c0ea89d-908b-4009-ba23-e4fac45618b4@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-5c0ea89d-908b-4009-ba23-e4fac45618b4@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-mw1
X-PR-Tracked-Commit-Id: 8d4f1e05ff821a5d59116ab8c3a30fcae81d8597
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91dbbe6c9ffe5eded9a3e75d773ff92da8d2bc57
Message-Id: <173273623222.1191875.109864199559601828.pr-tracker-bot@kernel.org>
Date: Wed, 27 Nov 2024 19:37:12 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_113700_502419_CE5F9EAF 
X-CRM114-Status: UNSURE (   3.51  )
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

The pull request you sent on Wed, 27 Nov 2024 07:30:53 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91dbbe6c9ffe5eded9a3e75d773ff92da8d2bc57

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
