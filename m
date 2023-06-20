Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01EEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axa8fEwSo+2fvydnbFKghoXfGAH1+Kai8fZYfjrjY64=; b=rfU40Qs9mVXl9X
	SClVAXOuy1Yw92+NahRYAYataF0PSoYnGWGgaFRPnZZjlL4Xv8OGTwhg2CoiXCG9N5HptEIP9h+xI
	FD78hS/jqoGE9pXWOWZ7/9jUzOSvx0IXURNSn/DewQEJa/h2/gUs7lOJbsAdOTb3FRTj+vmIN4PaH
	itf+DaLE37m3/T/R/PLZnyxVHH2TWO4pBd/aXaRdriTGEYauNNyjBXXT52CF2L7E0VW3SZmd0ypSD
	K3yVUjKzz2J9KXTQ3FCcfAfK4rB3+78Nf0Lp0p/h6zW6C6hoiWnBDgEFSfwWtAKBB8F+/OugI6lg5
	jNFTSx8rXFNNslHgvfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjW-009pad-1z;
	Tue, 20 Jun 2023 01:00:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjT-009pUY-0p
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2367660F70;
	Tue, 20 Jun 2023 01:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 193F8C433CD;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=mGh3gLTaDGrGvROv15Q2QfAPdhKQZa/YqomrnytzirA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GTqaVbN+vWc84aq5GCPqfy/3EydClkGdysSoEmktHg7l/RGSGh6L0JzrUfa4O1zG2
	 MoE/t8FezR91D3eXtYjgxxys36CM4HWAxL1Q2xj97rdJkW5+s8mEPUMybwjCA64gzq
	 yV1qY+fJQOCmc8T4H4SuEEKNwM7OQe3x5+WEZBlOGahlYqLf7Avux3sPUpUBuZTOMQ
	 cph985S8072ydSIOaOS4f2cwK1yEyBy+57M58SbXSOEvwZEKQK9nMXPH0ecXz0gC3B
	 vtYSJdDeSQdXqr16Q82KceI41/p7kKiQqkM1ahOunannVRgqrpK5vwqQRvCGbNBxm+
	 cUwmgKCk4A9yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC158C4316A;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282396.22807.1023067349151086213.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:23 +0000
References: <20230522025020.285042-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230522025020.285042-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, suagrfillet@gmail.com,
 mason.huo@starfivetech.com, leyfoon.tan@starfivetech.com,
 ajones@ventanamicro.com, jeeheng.sia@starfivetech.com,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180031_345704_CA142251 
X-CRM114-Status: GOOD (  10.01  )
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

On Mon, 22 May 2023 10:50:20 +0800 you wrote:
> The suspend_restore_csrs is called in both __hibernate_cpu_resume
> and the `else` of subsequent swsusp_arch_suspend.
> 
> Removing the first call makes both suspend_{save,restore}_csrs
> left in swsusp_arch_suspend for clean code.
> 
> Fixes: c0317210012e ("RISC-V: Add arch functions to support hibernation/suspend-to-disk")
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> 
> [...]

Here is the summary with links:
  - [V2] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
    https://git.kernel.org/riscv/c/c6399b893043

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
