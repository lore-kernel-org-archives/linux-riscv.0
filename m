Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5C5C001DB
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0qG3ukvXm3CmK7V81hbrSN+8rAZvI75Eg/ewk9M3uU=; b=F/VQj+Qt2gokNz
	Yvm1FOtSEtpXd9o+I0lY0DS/l/aL+xRohrQ9fe0Mu/+aIkVCucnuKissOIG3tw6+fREyAXqDxA5ZC
	+fgPzwRBtiWGcDhp0N6O3lc7eL6sX5nLLbK6gOSNIdb7CUkxBJxSld37j70Sm1WxHj6CC77FwATVt
	IUrcA2rCGSBLUs4DxCZYx4940ZUYrk7X2h6RuMs9UPdEQqMX9c3sWFMqng6LI36RE8EfSwqIEw46r
	Ino86DCEriTks+Me5AtGacGeHwjR//9jZoHdLx3jc8lPSDVboMYdHp7Pzlwhp8zfYIgISOaWtcULf
	wy8CgQ5EjrEr97YSFcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015h-00Gvfd-3A;
	Mon, 06 Nov 2023 15:00:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015c-00GvbX-0J
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 80B48B810B9;
	Mon,  6 Nov 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 587C3C433AB;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=ECVz3lGtxGBADvHCPjD3ljOMk1SrC44aHNctP69FqWA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ve0HWqsYZ7iBWx1g4i9SnchJy7OTfFLp4Q+idNXNM6rEFU9GScI8crupJ6pg61cGY
	 rx3MKzC+p0hXHS4POrC45Ywjlx4mRdUxKcwNqOG4jbMi26LR+Vd/oEKaQg9X5YEaHH
	 bFnJdDYqDKL60+9RECyLH4Hnopwio4tTRSX5lfTXib9P4ORNUhV/8zQFP6vT2xX1BG
	 sNflCSWy2/VoNneUMpcJ1FL3a25Ptq/5RJoiEOVTRtxwWVXqo+MzgG76yvY3VVQkHX
	 wLRGGhiJVp+rBBCtu4LkkuP1evMYodX9As2jk3pEXuKjn368w12BXvBx5w7/S3ens2
	 lP2qltjeez4Aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A455E0009D;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: provide riscv-specific is_trap_insn()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282923.16503.13448855296252108096.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230829083614.117748-1-namcaov@gmail.com>
In-Reply-To: <20230829083614.117748-1-namcaov@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 bjorn@kernel.org, guoren@kernel.org, conor.dooley@microchip.com,
 bjorn@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070032_287822_EE503C64 
X-CRM114-Status: GOOD (  10.31  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 29 Aug 2023 10:36:15 +0200 you wrote:
> uprobes expects is_trap_insn() to return true for any trap instructions,
> not just the one used for installing uprobe. The current default
> implementation only returns true for 16-bit c.ebreak if C extension is
> enabled. This can confuse uprobes if a 32-bit ebreak generates a trap
> exception from userspace: uprobes asks is_trap_insn() who says there is no
> trap, so uprobes assume a probe was there before but has been removed, and
> return to the trap instruction. This causes an infinite loop of entering
> and exiting trap handler.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: provide riscv-specific is_trap_insn()
    https://git.kernel.org/riscv/c/b701f9e726f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
