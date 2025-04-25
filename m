Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BEEC369D5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 20:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4Nx8DRew0m949MyLjzyC4n3Ko95kRxiENWqcRiYP5c=; b=tN7UtiqxrGczOI
	VxKygrCwIsCvSsBfRfInmSl9n4v9difxS2zvatNxdhkRYGUdffGYbM8gMCrRRNJhEB6MyBMpTvw+A
	eqFF0NO0wp7Nui71HJGnmJcaqkSn7WPf9bxb5ZqiXFNeGMfh1GQksdwrpBlm8TfjbyV8tW4faztms
	0kJ+H5/FOz1ytMEuAaCotWSoBRC6PdgCm/0c63SNqJvunZ72XNCsObhv2XmApn5ZV02vwc5Y3Q6q2
	CHY868wtPO41MEhAjGeU6Oqd7PiiSeaY2GSd2/ROUQNFR/Vcpfvy5BKS6fdIKeaLjiaeIQn4NO4az
	GLRwyYXRcA8ERPIr/XRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pmr-00000000oWi-2jKm;
	Fri, 25 Apr 2025 20:36:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pmq-00000000oWV-0fGf
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 20:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE94761136;
	Fri, 25 Apr 2025 20:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1CAC4CEE4;
	Fri, 25 Apr 2025 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745613399;
	bh=Rzq4XA1U5ldshJH+ZeoXIXefN8TwuJz3r/HHAYi9wpo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kzwYynDuQ88aNaoxwVqL4kE5jwpzfrmncO0Y5A5OYC7vXlQKGDLky0XnwKM5lPnEI
	 N8gpzTnUPePViXWqEGb00sNQ09u3RCGg22/mTYHdpSg3B5HCMGLisLJxjy0BoX+9yj
	 kxna7Sxxn4pnSp6ICRC5Ye1DMf7Pt1cyjgRDpZHlontDkfNUMVjCzVl2LvptxDS/kM
	 OT+56ikUC6ByUMKCIHxc4nDNyj1CdOeP8WfUXn/FBgloZdtQtp4Dumrxknr/lkdjv9
	 O8rhSk7ijnEJ4StPTMNfPuevxswxt778OMru6fZxfms9y1gw0vEpxCLzIpqTVpIPlR
	 zishIMZOASD7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2D8380CFD7;
	Fri, 25 Apr 2025 20:37:18 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
References: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc4
X-PR-Tracked-Commit-Id: 7d1d19a11cfbfd8bae1d89cc010b2cc397cd0c48
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3137514f1f13532bec4083832e7b95b90b73abc
Message-Id: <174561343743.3832758.15145450281474649322.pr-tracker-bot@kernel.org>
Date: Fri, 25 Apr 2025 20:37:17 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 25 Apr 2025 09:58:58 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3137514f1f13532bec4083832e7b95b90b73abc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
