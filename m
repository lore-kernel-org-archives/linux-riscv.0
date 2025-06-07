Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9ACC5AD49
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 01:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgAIvaUw0+09f2FdDti8T8l0qhUE56JqjvSbj+0TiTk=; b=z3xF31YJyCl5+r
	tTG5JXqPC+0KQgDgwcrz1U5YPZQoHGffWDl3iJ8i/lm4V8MBK8wG0BmgdWTdfnG5CvpROtHjTOUFU
	wRDVQ/+qBlMECcLhxtrp4PLdxmaclS0TZRohFa28C5qVG4B+TcE0JdoFxrWPGv7D0ESYGiBIAq9z7
	JTLIcAOKxYRsRH3ucstCIynhGjLhc9hWm/QfoyJgRk/WtE33exCM6QQxAO3Przzeb2bB9UtjSemji
	TfuVlYShxP9tgbu0X+sN9BYrQUNXonl4i6AWAMyfAcWNvNiKZrRINvyHocqZd+JyCG+HNZ48H/x1O
	VYP8tDtMwV/xzLBkj/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNiBi-00000001DMB-0zvf;
	Sat, 07 Jun 2025 01:17:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNiBf-00000001DLY-031l
	for linux-riscv@lists.infradead.org;
	Sat, 07 Jun 2025 01:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B0BD5C5B25;
	Sat,  7 Jun 2025 01:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5200C4CEEB;
	Sat,  7 Jun 2025 01:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749259048;
	bh=v08Aw7fkhkxP9lYqVv4zou5EaTiB647fWqJLhmsAXxc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p6dgme4ujY0zqsyQE/TdMcPz4kDXeOdT3gY73FapXi/DRRn04vOvCrzqfDdeblzUm
	 t7Af2lZOhitLpf/b3W+ylwyQ7bltSkI0i1qj5vKBj0/UVbNppjBZBlR9UITsFrTuSn
	 rO3kvOkyQKLgF8qLt70KdCEDgEkM3MsYDMh64v3opJB4XBh+qsgb4F2xtCFhK5eCCS
	 HOUnx/tTZFa4A6G8GZLTsAgS8H+LEavD/DHQ1oN81ycaYrfyGBlr4lRPPv4a2YKseK
	 D0x+Xs95zgnp8nOoNJXF61cWLam+NT2yHRdn/7bwJrRfFHLYhNkl1KQCPSDavMP3Bq
	 kp9hJ1ccF4ojw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCAE3822E05;
	Sat,  7 Jun 2025 01:18:01 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
References: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1
X-PR-Tracked-Commit-Id: 51f1b16367dfde89a4ef5bee2270f6a4d523ef3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 119b1e61a769aa98e68599f44721661a4d8c55f3
Message-Id: <174925908025.4051830.16595083287705873176.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 01:18:00 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_181731_087353_3DF1B072 
X-CRM114-Status: UNSURE (   3.15  )
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

The pull request you sent on Fri, 06 Jun 2025 11:10:37 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/119b1e61a769aa98e68599f44721661a4d8c55f3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
