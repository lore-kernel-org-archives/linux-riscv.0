Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD7C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsUWMnGXPQGVVb/Sx8q+CqwOB1I/Vu5EzDbunBudS1M=; b=Qcn3l7jV//TMD6
	m47D5YTDtD9SzKGa/5+lp+vxnOj3b+ZvhGxCsfSYlWDCOqjMhQLcJO8Rf3EQBi5J4AfHJKcIje/S9
	wewLgfdvVJsmVhevl2OPBVmn7jOCeyTql7ouKkLmsCDVxfX8Xqz7PcUJyWU7Uk8BupAFxZJGXCDOn
	3orSGwswlesjYyRxAoKpDTjoOnGBrLTdIUSWUFPBWmJS4TDE1xpLcguSuZkNmwyXte8qeMmFYq0Me
	vvYBP87EGEnSZ2RfZyT7gnslclf3Z/0CYeUDE6F3dyD+6oUqDozdvbPwldgm/D/914GMMccg44/Hb
	c4dY6Ri4Tj2jfeO1J1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTPU-0000000C4jx-0WLX;
	Mon, 29 Jul 2024 16:39:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTPR-0000000C4hn-0aFr
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 16:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22C9161B6F;
	Mon, 29 Jul 2024 16:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA6D3C4AF09;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271179;
	bh=m90q8tD1m4s7iECDYk9EUq95K3zb56APHXrZaj71gMc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rSj2CWn+vMWoodkNt86xJEMMXGGky5NUYZaRGcazMUnSyTSMXrjTvqOG9NbQjtzti
	 m+/rYibOABDs37AHkzaS+0753kwsOsyGxoEbkmJ0C/F+hZtZ7VoqQ6zfgyAP+Lc/yA
	 i4p/IUQtFoZvCap4pMydSOVcRN9VF0JxKwgM8vVpDhK8wqWEjbJdgmCZx5/6fxllpK
	 RDjtZ4rwnDVqcT3SETiTSPVgMWIpkFKaGbdv5qKz0pYLFiinGL+HKiViyW4YTx9POV
	 12jgw0utzjJmn2gmTBlmm4nSFSY/JmK8lttp/ZruMbjtZdNOoi7LHKQto7mvrka2qI
	 eB7pckuWcYZjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B0D97C43445;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.11 Merge Window, Part 2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172227117971.3603.11962630794224395786.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:39:39 +0000
References: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
In-Reply-To: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_093941_256438_F4CB5F1E 
X-CRM114-Status: UNSURE (   6.67  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 27 Jul 2024 06:29:14 -0700 (PDT) you wrote:
> merged tag 'riscv-for-linus-6.11-mw1'
> The following changes since commit f557af081de6b45a25e27d633b4d8d2dbc2f428e:
> 
>   Merge tag 'riscv-for-linus-6.11-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2024-07-20 09:11:27 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.11 Merge Window, Part 2
    https://git.kernel.org/riscv/c/c9f33436d85b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
