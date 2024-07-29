Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50272C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRMYz1tf/8dASFa0r/OC+4cHRXgD/NO+ie6UAtnGsfE=; b=xSyu354ra2Rwg5
	ySd2w8Hxn1HJNBJHBUGSrFRoteSM261maOiYxNM57hF6rw7yiF0StSOZ4rSVSPzlStVTPNmp4+UJ5
	sxbngBK0lr7u2UyMShOw4m+qfbQKoRYAMu6smFhtWXGMfPZJuMXTa+jhK7wRZPMCKB4G8DVN8G82R
	nfkFP8KKjevLnlpixa8vKVmOLZKLLPc3iFtnRzk9j4K/pP6e8z1iKQ/A73GPSajGSH9B3YZ27g6nd
	8T8ld260wcxtcpXx7/qqX1GG2o6sCDD/Rkfuylek06dGsEQ7bUK65C3X4QjhLtUY0E2fR2R5PCd+5
	TlF9cnx8nHUl0L8RXzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTSo-0000000C6Cw-1B3J;
	Mon, 29 Jul 2024 16:43:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTSJ-0000000C606-3CU3;
	Mon, 29 Jul 2024 16:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2FECCE0E04;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 219B9C4AF09;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271357;
	bh=mA3Plo9rccbKR8tQpMvqb5/37K14bOyxIOzFzkCyo2w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FQESavfQWIyHKftqPvTmy4wVhUA6HIJqwcdczB7gzKs7W9HP4VgXBcAvnS2OY1QPQ
	 6v8azN0AnBdvEUaiuvvYn24UYpSAPhOt9Kc8PnA5pAQgRzOyjZDqBpRpAggC47L+YO
	 3pDtCbTERg/BZjIP98WKxyLB+Jl8i0jRFbFjiovwHjjJOglSPdvIoPPigoU6llsN7p
	 NnUKMTJeRMcEWdczEcxBDiNNs1O1d1p7FYZtvzItkwiDmtNqDhaPHf3wXrrW8U4yYI
	 kgmuh8yjEhzjRpHcoAw7LVo1omVPzA9Do3we2wqTVe6+zyxFoijU6kc6a1Jy9HiSUh
	 MFjtM1ssSTzFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0CA11C43445;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] sysctl constification changes for v6.11-rc1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172227135704.3603.7348565051958076479.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:42:37 +0000
References: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
In-Reply-To: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
To: Joel Granados <j.granados@samsung.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux@weissschuh.net, mcgrof@kernel.org, kees@kernel.org, kuba@kernel.org,
 david@fromorbit.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-xfs@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bpf@vger.kernel.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, bridge@lists.linux.dev,
 mptcp@lists.linux.dev, lvs-devel@vger.kernel.org, linux-rdma@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org,
 linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_094239_984781_668941FF 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 24 Jul 2024 23:00:14 +0200 you wrote:
> Linus
> 
> Constifying ctl_table structs will prevent the modification of
> proc_handler function pointers as they would reside in .rodata. To get
> there, the proc_handler arguments must first be const qualified which
> requires this (fairly large) treewide PR. Sending it in the tail end of
> of the merge window after a suggestion from Kees to avoid unneeded merge
> conflicts. It has been rebased on top of 7a3fad30fd8b4b5e370906b3c554f64026f56c2f.
> I can send it later if it makes more sense on your side; please tell me
> what you prefer.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] sysctl constification changes for v6.11-rc1
    https://git.kernel.org/riscv/c/b485625078ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
