Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E475E7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiwzA+UD2NYiOBzwti7odRnfBETik4xprKH0R1jartc=; b=Ub2H2QY8t2Z83b
	ZMWtvrcNLJMvgyKcVNL1bAye8ge1/gMW6gP0uunjareg/vvibbW8CvYNwJW2mRIdkfkGRmJB1RsHZ
	eIdzI8Fh4twHD/gdU4TvdV/6EF9ICT91hjAOxaDziz+sunC41Zm5jGgNExUCP7wD7BcKlLs2MRlc4
	SzYCiu5xodaxUmN2LQxDAtAG8XpND9kWa0KJ/WfJ1L5lPYivzDssw30fIpASxmL+Zf+dsvb829rlT
	+u5RFG0KyhWvEWVtp6L2CXD+ANla5omxiDB9lYes/AaoQVMHmyipuVDEYZcFa1BrKeHSanYLsyl1T
	BMPlVxjTKWz6ak07zX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKCx-0000000Gfvo-0BsW;
	Fri, 10 Jan 2025 18:58:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKAf-0000000GfHt-2x38
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 18:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 281A7A4291E;
	Fri, 10 Jan 2025 18:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B38C4CED6;
	Fri, 10 Jan 2025 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736535348;
	bh=tCtONWTWROFgtfV5iQsHsFPs1yAGEXlWy4iUihCyqqg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qr1IGsz/E++bHHmPyBpnzUWYsGPpMBySwW+/K20SQQGpJpmiGUHV80Xn5Bdg1z013
	 3nFYN9NbcJXR8Xj75aGPmcaCyjRaIDPURgSJVixOPHH+81NP5P46ZI+J48sQrP/6Ms
	 zduK5jh07tF9XvxmG6J2Oy+Mdwd+HTsf871rd5/G79B0U6VvHoP+Tf43VCkLm10NGS
	 tzbP67O/TtUdqQHJNz2LHdjpuDgO/1ztIIAkhJinpWRjTpgW4fCtcmDmBhyXEQhYPe
	 dKl7XliuGfIELxP0dcJZjzroGFiimjySPZZ7Pb/lWJfox8+np122ryorDyazp/mR/s
	 leeYfA6NkiBIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710D9380AA54;
	Fri, 10 Jan 2025 18:56:11 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-80978f72-8f45-4e7f-9518-8b12e7fe8dd5@palmer-ri-x1c9>
References: <mhng-80978f72-8f45-4e7f-9518-8b12e7fe8dd5@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-80978f72-8f45-4e7f-9518-8b12e7fe8dd5@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-rc7
X-PR-Tracked-Commit-Id: 6f6ecce59d99ef95a31a137c51e61c3d7b4ab278
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f8c6263347e1740edf159584775332f4abf693a1
Message-Id: <173653537015.2174915.15242854062544665198.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jan 2025 18:56:10 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105549_799858_B360AE93 
X-CRM114-Status: UNSURE (   3.59  )
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

The pull request you sent on Fri, 10 Jan 2025 09:05:16 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f8c6263347e1740edf159584775332f4abf693a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
