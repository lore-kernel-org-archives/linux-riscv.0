Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58271CE8E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuDJiHY/UPr7ROsLGsGQi83Geo7ZyBxuhcpOkH2K44U=; b=OU5If0YIvCfYhD
	zqZLvviSxSxDrpbGCfD0DjjLAHYtMUWFDugeun8NEQNAy0/6B3QWt3/eZlEaMovMaGV3r/IYsgJLE
	dKdy9vBEiRxO7x605+dQxBP8K4dWjX4xPkheAYpmM2bXIJCJ6lVQPxW9WpIIQ76+gckGrxpQCmQP1
	Y7kO+hg4MJcw+chhrpzeZJSpfivV0idaN35l3NTCSMvd6yM7rHher4xHsbZ7GxbwA6xI1ugI2QWY/
	uWuM/3Zl4aM4guPWFHi7h/Jn0ANu2wQdSVxOQLIjcq/7wY19mPYlEMb5QJnkTOD6OwrU33PDLKfwD
	71umi0JNUEvTpC/EQOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42BR-00000001OqI-0Bw3;
	Thu, 24 Oct 2024 18:03:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41yi-00000001LYE-2GzN
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 17:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 698A55C53DF;
	Thu, 24 Oct 2024 17:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3FEC4CEE4;
	Thu, 24 Oct 2024 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729792231;
	bh=ptSiFDe2P85iu70FwjRoR12tixmT8CMtJdplcGQaHEY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mAnsUGgN6FJtIw+d9l1/gyUOeEN4rHsY24MKideem7pSGKkok1MntlshY9IJHK0DC
	 SsFaifEKtK9qyORVb+RZvjjG8Lnp2JWFJtyVqdM+U8YqNsiCsOCD/wagcVrshpVfRi
	 VDIKAbuSWAAOO3YtPpSYPsQIkrasoLA9IZx2IQLnBFmd7OIigJ01ygR7yjCDCa7Qh7
	 TwlS8toqpYvpcyIKgAN4vDhXgrGoJALKpf3VRZnhhvuW4CZQ4jfjSN8TOvbK5Is6CK
	 G+by3pgw8IoOakbhE8vpKhAd8fbLVpq2cAFT2BOZkrpssCt/bugv60C7CpJ5vSxPXG
	 9tFrJDieNhqVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D1B380DBDC;
	Thu, 24 Oct 2024 17:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v10 0/6] RISC-V: Detect and report speed of unaligned
 vector accesses
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172979223826.2327357.18000385603028507418.git-patchwork-notify@kernel.org>
Date: Thu, 24 Oct 2024 17:50:38 +0000
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com,
 evan@rivosinc.com, corbet@lwn.net, palmer@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, jesse@rivosinc.com,
 stable@vger.kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_105032_647113_AFC03037 
X-CRM114-Status: UNSURE (   9.26  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 17 Oct 2024 12:00:17 -0700 you wrote:
> Adds support for detecting and reporting the speed of unaligned vector
> accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> emulated all CPUs. The vec_misaligned_speed key keeps the same format
> as the scalar unaligned access speed key.
> 
> This set does not emulate unaligned vector accesses on CPUs that do not
> support them. Only reports if userspace can run them and speed of
> unaligned vector accesses if supported.
> 
> [...]

Here is the summary with links:
  - [v10,1/6] RISC-V: Check scalar unaligned access on all CPUs
    https://git.kernel.org/riscv/c/8d20a739f17a
  - [v10,2/6] RISC-V: Scalar unaligned access emulated on hotplug CPUs
    https://git.kernel.org/riscv/c/9c528b5f7927
  - [v10,3/6] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
    https://git.kernel.org/riscv/c/c05a62c92516
  - [v10,4/6] RISC-V: Detect unaligned vector accesses supported
    https://git.kernel.org/riscv/c/d1703dc7bc8e
  - [v10,5/6] RISC-V: Report vector unaligned access speed hwprobe
    https://git.kernel.org/riscv/c/e7c9d66e313b
  - [v10,6/6] RISC-V: hwprobe: Document unaligned vector perf key
    https://git.kernel.org/riscv/c/40e09ebd791f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
