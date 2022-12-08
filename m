Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D254FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 23:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0WHD9GM9bLZ9YbildfXfzCJMjvxe8Bzr5rX1/J+muM=; b=yk0ZuRLFlA2jAY
	dUEs0dGLX/ksDil6Md+WCknIZ7mij/KfktJkJVGzlgHSGTk/USQ7rj5QAwxDP0CVAlV44FtMQkzNZ
	uCMW8jWivSv95fPzxILw8HNAkBt7vQUZnEoAiVXaLN1SYu20+v0D3dum4C3ICcY299COIiwEMH2VH
	yySeN26AwTU+8pGz5+8obTpe+qgwIGadZSl4lUZnLaI8HJCxLzKrgPiMp7tupQPvlc+Ce2dPfu7eb
	W1HXa3HiZf1Y8IyB7A7rsjuhWKQrHJT/1JUnHGuBKuNUiW1iO73VIZ0Qu1eOMGCLOcLS98mWtPmhZ
	TTGmbfuPl/a4LDxS+NTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Qel-00FdEs-Jb; Thu, 08 Dec 2022 23:50:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Qei-00FdAx-QN
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 23:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C63E620CE;
	Thu,  8 Dec 2022 23:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9481C433F0;
	Thu,  8 Dec 2022 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670543415;
	bh=YEg/kqUiMcU5Qvfb4M+IRYn0TXWZlyRJBxtS+d/nXXc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fGdZtnqFz6beBEyysnoTt2npctzN43nHJUoyg9RiMsBxoL3VnR275JwPW3xYazSG5
	 LxcUi+oqKGq+M+vCnwElDn67aCOzQTOJNUDOBSXUksEl4EsTh9Y+fOQZJ71NdAaiM3
	 qd6tzDoKvhfk5KlcbF6WJjS8G7EeDbJuPd6DZAO8/FpyPMm81TN0ZZerFS10X+0N6M
	 JcI+wc0hHK+5u0ubY3oc8hWQuiglqbi67ogiAnm6UG6ZYFA1PsW1qJk4jjO+hmalQ9
	 Hrisdhhh40rF/kdMuzn3MQmdjQETHqwp0yDte8F1F4eWWQYFOp+EM8eE8jpU7DlHON
	 CAQ+OM0XbGFRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96397E1B4D8;
	Thu,  8 Dec 2022 23:50:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Fix unannoted hardirqs-on in return to userspace
 slow-path
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167054341561.16966.16448595920168997874.git-patchwork-notify@kernel.org>
Date: Thu, 08 Dec 2022 23:50:15 +0000
References: <20221111223108.1976562-1-abrestic@rivosinc.com>
In-Reply-To: <20221111223108.1976562-1-abrestic@rivosinc.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, atishp@rivosinc.com,
 guoren@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_155020_932006_7E17C136 
X-CRM114-Status: GOOD (  10.55  )
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

On Fri, 11 Nov 2022 17:31:08 -0500 you wrote:
> The return to userspace path in entry.S may enable interrupts without the
> corresponding lockdep annotation, producing a splat[0] when DEBUG_LOCKDEP
> is enabled. Simply calling __trace_hardirqs_on() here gets a bit messy
> due to the use of RA to point back to ret_from_exception, so just move
> the whole slow-path loop into C. It's more readable and it lets us use
> local_irq_{enable,disable}(), avoiding the need for manual annotations
> altogether.
> 
> [...]

Here is the summary with links:
  - RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path
    https://git.kernel.org/riscv/c/b0f4c74eadbf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
