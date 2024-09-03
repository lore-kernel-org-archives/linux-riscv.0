Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D05CD343D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHmUE3m+qsHvLMBBjR3PxtHhdmq6HQKcnqwp4Vieuzg=; b=VQJAajxhOnDR5J
	xwCDm4Lk8oeGPIJ3ipICrwjD5lE//8uCgt0ojJMZoNxGFxvXzQUpGb6hFHjQ5dvd5W6wEjxM1O+yV
	mLDyb+Lpw/QyIoEgfRI/tESwPRNouAW93G/SP7BKAsjGX9tuqqbU7s4BasPXwmo7HVF8gq0cQ47NL
	LOo1weVry4PPMHq07wszhIxCIRa6GDhjl11W7TumSy26nWrCyUgJq0KsWPUYpeiHTsXyWtWOPWY8o
	U1VAJ5e9cLyBv8nlF3TzW+Q2rr+t1qIqPyWjbudnTTHON7a/4fUmwIMj4ekmcpHmRXoXTh5mcyAm8
	Lbj54vnOQb9FOVx84rUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUcO-00000000c3u-2dez;
	Tue, 03 Sep 2024 14:34:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUYL-00000000ajH-3xbP
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 14:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBBB0A4370B;
	Tue,  3 Sep 2024 14:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4BCC4CEC7;
	Tue,  3 Sep 2024 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373840;
	bh=gXbykwMFgquDkN8SDMxjOjIVVBU81MHk34Ikbht7mSU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NY0GouETMhA6ixaEs0zebQd5v7X+lytuVzWSrsX+un7J9l8MbCKFjBQ9tsj3llMIn
	 2bNW4KVWrafxBjqUy1uBWpHCYTMQO2lNRQok087HJxKgOaUsgFu0Qy6LhqbXEd2Az2
	 exFQx9qQYItrxEkjQSgvRlCOVX6ebKHflhY9EaaMIna+fJaPXHQso+o1aMlh4q6+DK
	 V/Ik3nYsoEeTElmDyRUplk/g4pwHkkRowcIwWQcK977tzMiRdOPe9RMMrwgWPRPM0/
	 jtsNV7OVJqCsb6B6Bhuk7xBHEP6WxXgDI9HMEgez8NjerpNdifVBYhFG4AVKretDIC
	 WNtGxNkrUDiYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDB03822D69;
	Tue,  3 Sep 2024 14:30:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: misaligned: Restrict user access to kernel memory
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172537384152.320952.10274584984472776456.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 14:30:41 +0000
References: <20240815005714.1163136-1-samuel.holland@sifive.com>
In-Reply-To: <20240815005714.1163136-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 stable@vger.kernel.org, aou@eecs.berkeley.edu, ben.dooks@codethink.co.uk,
 bjorn@rivosinc.com, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, evan@rivosinc.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_073042_064692_741EA601 
X-CRM114-Status: UNSURE (   8.24  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 14 Aug 2024 17:57:03 -0700 you wrote:
> raw_copy_{to,from}_user() do not call access_ok(), so this code allowed
> userspace to access any virtual memory address.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c83232161f6 ("riscv: add support for misaligned trap handling in S-mode")
> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: misaligned: Restrict user access to kernel memory
    https://git.kernel.org/riscv/c/b686ecdeacf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
