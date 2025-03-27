Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C843C36017
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zk4pQbmaeDqYOld76j1nfY9EpCbhoAGOMiSBdSAFMqw=; b=ysephZN25Vgv0J
	PSCeI5oOcCQRvrl7bZWqQ1r0S29HcXQVdnFsELntoh784zFvOyRcCdHACLvZ376NhEgQpUmOj7RhA
	+wQxBgrDbjjI6iQ/z5rq6FE73I0KE7MseuTE3tsZaGh1iEy1xq3n1FUtfUxyMqoYGZzJGYrLyXBJj
	jat64J9zziW7jNosmdF8H8sxBVMAkZjki+IT4MYmlgjt6yB9C5J39Q6dI7ptb5lXD1zzU481yPgu+
	/ak8NNQyYEebmv0XFJcQxs6OUN5ibVq3zg2yFiQUxil91x5pf9nUHcRTj7Ui6jYqZtVSSJFGLeP1L
	xLRY1E1DR5Y9exn7o5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf19-0000000A9yH-1xjW;
	Thu, 27 Mar 2025 04:38:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrL-0000000A4qw-0PPn
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Mar 2025 03:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PoQOQUAYXvu76FvvYwlBWIXxKFr1oDwsxu89r2LsF7k=; b=HgOZ/P28BO58Y/Vm3ZePm2+xhr
	x1OUePc8U5UoYxzI/CgPm0MWBgBGgqXOaTonDEPPk9FOh8iTKfdEnNEZTxdndffqxCTwBWQaOT3aY
	1XIvqFS3PlB2SKj6TlrU3QYyeKNgi0+39XEvEEUFTsvDCLlQ8bRONuiPIkLU9Y5v0pUNX7oT+Ip2l
	MQM3ehzp9JRat//GVmMEXMB7gQgnZM3hHIrfmCIN7ijuC/DoXMU1zVL7N1rY5M4hOsXAFP53tXV0u
	H62jtTYEti7lJvFHKW+NY2XtBqJmGQmsY0RuRwEyBPb9WFNmerfd+G5XqacdyEUuNeUV2XHngiCQ9
	cy7NF3wg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrA-00000005tKd-2Yk8
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE62843A8E;
	Thu, 27 Mar 2025 03:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F1AC4CEDD;
	Thu, 27 Mar 2025 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045875;
	bh=/OJJeZ4hgbOUjdEsw1lc25y/Fsk9US9a7A9SZCDywMY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cz2J5gWk1QZ45eNADchRsDOIuUSbZhC/4o7YJvItkM3VpBoH4rILRLmMcW1n2Afk6
	 mMCY2q07Zy2W5aeY2mdt93ouQomYchzsU4bL6x/0f6xjswc68cA/u7wj4lH9LA48kq
	 Paq3tCFxH8PJxKD9Rfkm+AAjAOvG5vEhsp0sBnA6Ai4abcJmtVL0lu1gnSsxKXxPZv
	 sm3CP1nCVfM7TCLHLqhC9CQVSHYLzJ7x1FUcYa6qbEGQU92G8TDYpMgTpmrY2T3QA4
	 tlqWXUELUw2cVSLFoLVUHRo46gCn7LK3i76SCgn8EOwcPDPA8GyIfj//rSJR2IYhve
	 IphGHCWg4x3/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE33380AAFD;
	Thu, 27 Mar 2025 03:25:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: Implement smp_cond_load8/16() with Zawrs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304591124.1549280.8617793475801522686.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:11 +0000
References: <20241217013910.1039923-1-guoren@kernel.org>
In-Reply-To: <20241217013910.1039923-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com,
 alexghiti@rivosinc.com, christoph.muellner@vrull.eu,
 linux-kernel@vger.kernel.org, parri.andrea@gmail.com,
 ajones@ventanamicro.com, ericchancf@google.com, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_032437_306722_D5D6FDBC 
X-CRM114-Status: UNSURE (   8.32  )
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 16 Dec 2024 20:39:10 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> RISC-V code uses the queued spinlock implementation, which calls
> the macros smp_cond_load_acquire for one byte. So, complement the
> implementation of byte and halfword versions.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - [V2] riscv: Implement smp_cond_load8/16() with Zawrs
    https://git.kernel.org/riscv/c/d9708b1931fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
