Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC2C5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiioiO77CUmczgv5xexC3o7paeB7/vFfX+h6Ddt79VU=; b=zSdBU0EwdIiJOT
	unpGRA98YaptDvEXGdsPYTXzenKG/3xORwgaDXJwoNEhUqtIGjcqS8E6HRj996DrYdMG4alVBlxs+
	xYmlfghPUXcN9GAj+cygVOJ5xbSJqh9Kmuh5q9XUO6QGeYJ2Nm9yS+ZE9SJEzHNvQUfWc2dRjBWpQ
	7Vf3mEj8Jor7KrlniNYGBiW0HXXwp7siT/uTxLeY2Ll3XmRv4HiWBNwR6037GQQeEO+ltq7isIx7J
	aXgRBbu2XrRJ0cjmjNDQtbYwdIFuACm2wUxCXSeGraNQv+sx5N8mUD32vBDqXOyfjq/Oa8tsr41aq
	it9RtJjkeazASI50z62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFfO-0000000GQBJ-3OFB;
	Thu, 05 Jun 2025 18:50:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFfM-0000000GQAG-2UPr
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 18:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E2FD5C5E77;
	Thu,  5 Jun 2025 18:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C9FC4CEE7;
	Thu,  5 Jun 2025 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149415;
	bh=ul8uGIVqoA9GqmsCC7FvzunzA9M9vAIX7VNDjF8UFo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L6EWzSXXybjJIfZY9ElfC/9OBXU6KXi7/v6dw7BB6FESbBaWoiANooF8JeKgsCNmc
	 IO1X0KqdXLnSabBa0KwFSh7O8utnqcm7zXW/ZznbzZAKPV2h92vF0vhf/34Kzk+NYB
	 CNQ+TCwVchCAtKSSX8Gp59xE0awMzASHJEv5wfLd/kkZ4eAyjmd5ocSyiNKqGWVY8r
	 4MvWf6iiGMkLSqtQXZdQcUcaUemE1dfXNKgFfKEluyLbjboSA311eRlj3+pVrSqTHo
	 i/Fp3bhQ2Jm/uTi1Hyg/Blzx6J1gAe3b8YoTVWwNMrin0mNXVc0H5IkQPVEk+9Jy/Y
	 qnihme2NuL8zw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E7339D60B4;
	Thu,  5 Jun 2025 18:50:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses
 handling in
 put/get_user()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174914944698.3195461.8348597570528832946.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 18:50:46 +0000
References: <20250602193918.868962-1-cleger@rivosinc.com>
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, macro@orcam.me.uk, david.laight.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_115016_673992_0138504F 
X-CRM114-Status: GOOD (  10.50  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon,  2 Jun 2025 21:39:13 +0200 you wrote:
> While debugging a few problems with the misaligned access kselftest,
> Alexandre discovered some crash with the current code. Indeed, some
> misaligned access was done by the kernel using put_user(). This
> was resulting in trap and a kernel crash since. The path was the
> following:
> user -> kernel -> access to user memory -> misaligned trap -> trap ->
> kernel -> misaligned handling -> memcpy -> crash due to failed page fault
> while in interrupt disabled section.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] riscv: make unsafe user copy routines use existing assembly routines
    https://git.kernel.org/riscv/c/a4348546332c
  - [v2,2/3] riscv: process: use unsigned int instead of unsigned long for put_user()
    https://git.kernel.org/riscv/c/020667d661f9
  - [v2,3/3] riscv: uaccess: do not do misaligned accesses in get/put_user()
    https://git.kernel.org/riscv/c/ca1a66cdd685

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
