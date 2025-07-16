Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956EEC83F34
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssseQclKhT4w5xdhsf0OBe17aNiyldtw5vs609vlN1Y=; b=zcL+YM+t7tTCCA
	wV24ZULBdbST3FDb93eN4CfpDBz3bixkkAV4BvP94Bw02wxvVclFIVNkVQ2DpnAR+JJVswELCU8Wf
	2Fo7HbC09qknLhXeRYsmSRfW5pFNRM4gy325GV21SDlFQJaTd7Wsx7BhUDES02Sgyoophi/A539BU
	R4C9r8AW8YHCgTB4HkxPp+CLdosXo1w9au0zkgev03Z2yKe5fCVW1UuYkx36wLKTtjCmJS0YUyVY4
	jYi1yRmxnVpMHAiyQ5+eptwtZtuqdcip4/oV02aU4Y1boMHnzWr50KrqcACubwWPTa7G7mlQ0qB2v
	EJdDTdNk0qgt30PFCywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc41d-000000083P4-25vG;
	Wed, 16 Jul 2025 15:26:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3wk-000000082Nk-3ubq
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 15:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314E95C6606;
	Wed, 16 Jul 2025 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0214C4CEFD;
	Wed, 16 Jul 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679286;
	bh=hArCQNpeer8Btwx6Mc8fEsoOKg5ua9BNHWdaLPcW2+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cbb0VlzaNqARHun1kOkS7sIFQnweTvmyDsC6ESZA0opz9qSKNQy5OOkazAlll8AfM
	 bEhmyZt1FCKz2RL1Y2UIiuf6+qaNv+3Q2TeyOM4OILXfJpY5+R+GCz3+EDVWKSsOiS
	 bYJN+sSX7k9ujxo+4CXROgDKLzvNns+9A8F+nOKfdMb/WrrX+2BHV5xY0aUEvTltJD
	 n2bjXKWWzBQUgxDesUGs2VZrlRzAwfxero0qliYHxe30OjtIq3B6seWxxrB7nMG5S+
	 UdxqOVg0jyLHVEJEPBAnv1UFMohovCkB4iMdca4c3doPyqF9m1KdYVhZW9zy3c45PI
	 IH2uAKY/kxihQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 80873383BA33;
	Wed, 16 Jul 2025 15:21:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Stop considering R_RISCV_NONE as bad relocations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175267930621.1224517.5170044226873875267.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 15:21:46 +0000
References: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
In-Reply-To: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082127_009096_B93A0E21 
X-CRM114-Status: UNSURE (   6.93  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Thu, 10 Jul 2025 08:34:31 +0000 you wrote:
> Even though those relocations should not be present in the final
> vmlinux, there are a lot of them. And since those relocations are
> considered "bad", they flood the compilation output which may hide some
> legitimate bad relocations.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Stop considering R_RISCV_NONE as bad relocations
    https://git.kernel.org/riscv/c/82d369b48a6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
