Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1122C021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhLu500shGlK6MVUqLZmNX1r3QDx8yqJf6bvU1nJ+iM=; b=cUs4jwO4fkSAxP
	lMXxvhn/KzJalklQ2LnpwN1WzUbbKPqrPyt02rG2tE5uZZOoM4YyUjiTItrqNf4pIsnCCJm975OQx
	Akp5m3fwEHiCp4dAtYK/diMy9CoYTOhaGXjIlHdurRSjck/2yfjDZ+EMdd4RAFZv61s8UohEyPodk
	7NrKGkzD9wCKEk69nsdHv5Lbu1kc8MazFnfJhtH/IUHScay8rBWC365K4MJUwjSb0bIjp5QoOWu5f
	9+ztA2N6RJrZmu6fcx8xz2S1Y/m3NEq27ARCgh9ZiWJwtSZz/kieuswZra2UhDlYFMeZxsfwVAZxb
	duLeKBaadJ4dKehPeEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZt-00000000aSj-354B;
	Tue, 25 Feb 2025 17:18:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyUN-00000000YvC-0hCG
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 17:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 038005C7307;
	Tue, 25 Feb 2025 17:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92410C4CEE2;
	Tue, 25 Feb 2025 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503577;
	bh=YjEUZwsogp1BXu+m+BGgPWuKELg/DQ7OzuV1i8GVl4I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FnUQt0r+xfs9pmhrbbR3tha+iad4eITPdLohj8Vo3/L4zs48UxngSZvX5rAxiEMju
	 9UYb4HWMpNlg29SGUreQpmbR4YxqfdYfIP9m1cmDniLJAblvMwnGSH7MDf2Etxp5le
	 9/GxTFliE7dL7Nt36Q7+VF9ChsIlcX3Vw+77qDA59xKY0vYboShicOlS71d2gxVOy/
	 G6lKXfR02IFyHcVd7GXH3yPAswYMifeyfGw6awRZY6kCugUTckKlNLUBZZYd4FmHuQ
	 B30a8HiXbLTPPWCacxs32TK9phtT6oudhdQ/JZ2QAX1txRM4VVXQpNbx3qI4kyYblk
	 qO1+wlmncsOrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BF6380CEE8;
	Tue, 25 Feb 2025 17:13:30 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
References: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-rc5
X-PR-Tracked-Commit-Id: 245aece3750d3692ae7a44516c1096936bded7ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a1944bff54907a4e68f167dcdf772b1e4c3ce6d
Message-Id: <174050360902.52791.9049622524104197339.pr-tracker-bot@kernel.org>
Date: Tue, 25 Feb 2025 17:13:29 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_091259_255704_1BEFF766 
X-CRM114-Status: UNSURE (   3.50  )
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

The pull request you sent on Mon, 24 Feb 2025 09:46:58 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a1944bff54907a4e68f167dcdf772b1e4c3ce6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
