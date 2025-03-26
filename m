Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CFFC36005
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 02:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q0KpdZm5sGJDZNbHXc5M9kCtiMB3t6hjDjVD5ACrVU=; b=VkiikCLMLNQlcm
	Uj4B96apWIbckWMxSRbuZWWT/I9ovzGfjPyJgUwNSb/8VmXOajkXUPYoGoVPxFbmYs7xhsGSkJQVj
	ds5aGaevc39d+XIhaPa5YWS2ZNu063PceoiZA8OEEsYT4Mw3Egs0qt4KoJi7o0xZjDNcFW4PTa0Pn
	LszeT+Kbglbz5vS1xUwbLFWB4rk7MD1sWhiKi1+9qiUpkGRaoJs/jYYkDodb8F/YfmajVrMnYp/br
	MiGsZ1i60jChihBdWua8OOX1yRRYrPGUhQaBxPb/xtVvvjLGyq7KT2Xg0a3CLAhKCdWSEc/1A8xa+
	2V1+f4yIuyZ4aQQJan/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txG8S-00000007NnL-37ri;
	Wed, 26 Mar 2025 02:04:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txG8Q-00000007NnC-3gB3
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 02:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEBBC6115E;
	Wed, 26 Mar 2025 02:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA68C4CEED;
	Wed, 26 Mar 2025 02:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742954689;
	bh=EvC093YO6Vl20sHLh3XTqh/N84zVNcc11k0pLZiOPkc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tI1Q9Drogq70o6tVvsmX5SZgcEWkFLV4V9Wm1fk6XA5SUJ7GX0y/MbDo6+NBYzwKL
	 Wjc1PkQy4JiaEkP54O8IzwuEaZT8zYq66+xquFqCeKyDL+YQTByg/XUPuVeJ7l8tTW
	 0Lx9SeruqDaUaFAGhUaF/32YwAU8AYgWqqyaFqjNH5NwjdHKk0k4l8ArbNtWWnvEwe
	 6a4VVG2w7WPASac8511qeirEecNxDu16ks9s2Y+fTv+edXdWM1fGdjPXZPasjcxFSA
	 EOUVFIk8n1NmWE5CW0dbZf0LN/S4SlqQzvEtEVSukYkASgeAHZe/yyJ4oiJ4BN1roh
	 xUvWSfUAIbAyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 716B0380DBFD;
	Wed, 26 Mar 2025 02:05:27 +0000 (UTC)
Subject: Re: [GIT PULL] CRC updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250323222415.GC9584@sol.localdomain>
References: <20250323222415.GC9584@sol.localdomain>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250323222415.GC9584@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus
X-PR-Tracked-Commit-Id: acf9f8da5e19fc1cbf26f2ecb749369e13e7cd85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ee6740fd34eb53c5c76be01201c15310f461b69f
Message-Id: <174295472606.808498.5170254847116979850.pr-tracker-bot@kernel.org>
Date: Wed, 26 Mar 2025 02:05:26 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, linux-crypto@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Keith Busch <kbusch@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Uros Bizjak <ubizjak@gmail.com>
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

The pull request you sent on Sun, 23 Mar 2025 15:24:15 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ee6740fd34eb53c5c76be01201c15310f461b69f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
