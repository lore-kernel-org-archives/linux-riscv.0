Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034D7C71137
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfZnmlywkqzkistUqVVzEE0pKcMkVv1hM5pUerOreZc=; b=JR1nBNeXkNTWx3
	NaGHwzhjhHTd3r29IL9rKn3j6vYgGFZyJdN6rc+1eqmAGUuwWJf1um6qNrHHwkquh9oC24AFbXYbs
	oqDpnlL/cl1YMW5UyeYnsK7a3ODK0sUD4boEO9iQg+ccq0jBjMhaBcSobbi1/gBVrfG0fr3C9XuMS
	oRwpMLjHDOjQ5c+qY9457PxDzYxuR6y8Wtn7TXX/c0XfjZZaPqLCEdZS5zEB2qdeaydZ3UbnvArcx
	hOu96G1LKecdi/tajeLKV8HyXB0VxY7QNNTDrLCwXn/3kaRAFPWcqfXEiiR4W7w3W4ept1FZxkakV
	r6als8VVUZE6Iv7NDuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57J-00000007z2m-2BKR;
	Tue, 10 Jun 2025 19:58:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pT-00000007T5A-2VFV
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BAE34A8F7;
	Tue, 10 Jun 2025 16:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F46FC4AF0C;
	Tue, 10 Jun 2025 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572883;
	bh=SkPBGvkpgQ3nFCxLZOT13cN8O1yX5EiXJoXMRQriIeY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HRiKtcfFwLVXbkBo0HoIfLKEGThJUdz0o8YHcehAF7WXLRjgQHu9TMx4gMuBoJphI
	 cKUDSaytEbodsdBDsOctGOcCtlo3Tior0YuUzPLZlwOYYwBl091j4cYMAG3519+ZbO
	 yK8ytlOWYh9OEnnmoR5QhgTPfJar8RChkl+whcfKLJ/auSeLDLWiHtPqNNeVxfC6O9
	 LS3ZI23bykLMzDhH3kshZZ9+T0wk0JDPZ4BTr+Nz3dAGAQ7YQrHQ8QfdAwt/qsX5Z4
	 snCzfl37916BOuUyohc3AUYEE/DkdMJaA5jSTlhC3W0sTToFo9mWKhwWzOFSb57S/j
	 JGd2uudTPvpRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC9439D6540;
	Tue, 10 Jun 2025 16:28:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957291349.2454024.1402673095899933089.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:33 +0000
References: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
In-Reply-To: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092803_651821_C7FC30BA 
X-CRM114-Status: UNSURE (   7.76  )
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

On Fri, 06 Jun 2025 11:10:37 -0700 (PDT) you wrote:
> The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:
> 
>   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
    https://git.kernel.org/riscv/c/119b1e61a769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
