Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BB2CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ4QoVcCmLHV8l69Oe/AWr8ve2LdMxvLwBvkRP6A3M8=; b=H1N+hEuFV9Ljoh
	qFPSVtU4EdreEeX0tnZzXWUy4z7LYqeIJ3MubdtTq5e7R4I+FuTgJ5FJ1abMd3O+BJrRKDO+ptCKj
	71RvPeiIn6ysvd3EU1LgH8kKo7PIQb+VkbAlOXuO1nX2ov/Ea2rKG+EL3WvgIfQdECAt/P7quPy26
	esTR3vcLA+ylRLhKSKosgfiWyoZQmk06UjKG/eCJo5b2yRsinPREhofWc7PvJwcT6RVAVl2JnvgY2
	tmMyO8jFYgYwwXKxsLa8OhPBTqVbs9+OrZ1jj1wh0TtrdWpkTOQIU32nXi9zyOO7sxUGwF++ocEz8
	jUAyIN6PBQW10lbx8BHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKF-0000000FfHt-2EeL;
	Mon, 17 Nov 2025 08:11:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKD-0000000FfHR-48BM
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 08:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26729601A0;
	Mon, 17 Nov 2025 08:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05F8C4CEFB;
	Mon, 17 Nov 2025 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763367060;
	bh=HvIKM+Mr/CbDRHmlYEyfAHAA0uJ2Fzaw6XXikAQts74=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LIZZQ2p2UzWEQSs1lRkAgc4JHQjgzmUwu3dnHpoKmFRFGwk0Bxu55xQzC7bnIvSTo
	 xnwebpoS+CLTMhn7bkPVSSxfoZxhvDT2uhNFlwq9lQGrnybjVv1z8Nb2j3imokYtFs
	 cIBcBuuVFX1S8WHmhX8+y95nN0AvVt6ceFIcWBXuVF0P/rPDt7LfrbtdWCwBMKzbNn
	 dwO7D6jXF6UhPwcuOT7thrlKKunvvOoijkE5yynIXHNr0r+Z7m/qbLBIEnU05tfzip
	 qDbRGr5nTJlYbDo4AceAMrGjLw8FpzgZGc/VEHXohyH5JK9Nv7w8sHyxXXDfRTYbMu
	 GhKCE775w6EMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD973A82557;
	Mon, 17 Nov 2025 08:10:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc6
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176336702774.2854411.7898604600703239898.git-patchwork-notify@kernel.org>
Date: Mon, 17 Nov 2025 08:10:27 +0000
References: <a7d159e4-8e75-e4be-4405-f10fee270664@kernel.org>
In-Reply-To: <a7d159e4-8e75-e4be-4405-f10fee270664@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Mon, 10 Nov 2025 13:41:32 -0700 (MST) you wrote:
> Linus,
> 
> The following changes since commit 225a97d6d45456a7627633da09cb842a43ef1b85:
> 
>   Merge tag 'riscv-for-linus-6.18-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2025-11-06 15:44:18 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v6.18-rc6
    https://git.kernel.org/riscv/c/4427259cc7f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
