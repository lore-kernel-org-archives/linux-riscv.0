Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EDDC71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdRzeRQkZ8vLmatbpbOEr2cAU8S6KNOjDdmXAOivJiE=; b=ROn7WYWBTygPJ1
	QZe3uUrNUIbWnLgNMlQC+YAaetR4cjmHk+Rdo9eeQaWGQNbDuICUeLXMF4F8DMrgZcGQ1WzGQOUWK
	xT8nAKU8gpmHzTb7TZSeqjZ9xuE6WQYmMjR6B/tz7v3QtiiCvzo+w5gzUeRvvhE6i+eevvvMbgAwp
	wRwjbAMzKeW9vlCL3RzI6gtcNtZTxyRt1jqRdJO8jwZGv1TAIgl3y+L1JisptlR50pcnGWTzJem/4
	NTrqQPbZqF28HP1IeTCbxrBaSkR1YljAyyw3G1A57WTMLk2ddGF6KmR5HbEm9Qjy19lVHGD99kyJG
	8HrNQwzkmGD+ZcezdBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoFS-0000000ESdM-3Weq;
	Thu, 12 Jun 2025 20:10:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoFP-0000000ESbb-1zqz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87CE14A78A;
	Thu, 12 Jun 2025 20:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F207C4CEF0;
	Thu, 12 Jun 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759002;
	bh=YOCVmeKBRysiWnBvav6fq3qoxg1Q2XSozX9bayl8u4I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PaRAapfYLHFg16tHym4n460n8XopEwfgvrIklxbgk/lMOS0VILEXPmWFkeTmoHi8s
	 UMTyj53iGtpPhusZb4FA/eRPE2GYCglT0unNOWTU9fQd5JOCk28cmlv+kM4S4T75PB
	 lYud8qLIBFlzuJIhtNNtvFloNc865IgYfLTH/7omqGehxk/QoqRQiYgb/VARdOCeYQ
	 sU8MYDKWxklIGle1FEkcwt5vJb+wA7GhxH1cmsLd/OGLsqg9R00oAoAmqHpjteg8XL
	 OlQhC7Wt0f0LBi8GIa9Ai3kJga2a4TFHR8vjMOQJ7KJj0xexuTZ5ss5TiYdHO3eTlh
	 jp8QQrTq+XNog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B853822D43;
	Thu, 12 Jun 2025 20:10:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the
 getrandom syscall wrapper
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174975903199.88969.16808687093175866673.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:31 +0000
References: <20250606092443.73650-2-xry111@xry111.site>
In-Reply-To: <20250606092443.73650-2-xry111@xry111.site>
To: Xi Ruoyao <xry111@xry111.site>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr,
 thomas.weissschuh@linutronix.de, nathan@kernel.org, Jason@zx2c4.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_131003_538559_76747402 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri,  6 Jun 2025 17:24:44 +0800 you wrote:
> As recently pointed out by Thomas, if a register is forced for two
> different register variables, among them one is used as "+" (both input
> and output) and another is only used as input, Clang would treat the
> conflicting input parameters as undefined behaviour and optimize away
> the argument assignment.
> 
> Per an example in the GCC documentation, for this purpose we can use "="
> (only output) for the output, and "0" for the input for that we must
> reuse the same register as the output.  And GCC developers have
> confirmed using a simple "r" (that we use for most vDSO implementations)
> instead of "0" is also fine.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: vDSO: Correct inline assembly constraints in the getrandom syscall wrapper
    https://git.kernel.org/riscv/c/2b9518684f85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
