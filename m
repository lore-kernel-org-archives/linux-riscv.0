Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CA1CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 22:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykNvEzNphin12+PRQf14oGl7v+QprBBDUgMtHWp9e10=; b=NP+hebvzlpKJiT
	vhnlFrVA4xjZvxi2eWxRGXoY+zdQigx9LKKjbl01nvXZT3dhKiWNiBmuGj350eueJsJEkbC+GaaS1
	OiuaBrxYpxpCMuKKIC0FUuLDFI4gROHcCU/HOBLS8wigyG1SHYzv78NZTvVXP4gfoRAj8tsgJx2FT
	7dhKGxECj3obGGSN+6Sqg5vT3P/5VOpu3Zl0LStyidLNsnoIdxhTgJUZWip5r5uzN9+BETUebZI+0
	2jr80MfBpDG+l1BOdgqGNy73bx8f76Nacf2lHFAkswzziC40jDnfAoftZPalRCzJ539NisEFDgBnI
	p6ZJ9QAo+zfCtd8ZErfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsVRq-00000004Qky-0ml3;
	Thu, 04 Apr 2024 22:20:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsVRh-00000004QjP-3dgt
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 22:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F35261234;
	Thu,  4 Apr 2024 22:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 235D9C43390;
	Thu,  4 Apr 2024 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712269232;
	bh=qrAEyFoT6o3bchi+2ioxOMyxKattiEg45Vsi0QCjJUw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IvRPV+kJp5+WzRN1BoW25HQWFycjRxPonO+uN1qNV6YQxSDgYlHWv7m+xB9+cqiFL
	 ns86QvTfrou2+/M5+iQcTvPSeNCjOGRY3qM99rvLCJaro4U/2egvi0W7lbe6hc96RX
	 S4Dkcw9TFcEPMaTjwIpw9vKTTXyul7xs+HvwzbrnPJm5UvGAWQrVoqMFF+7lZhX8U7
	 hv5prmDn317MfuEO4FZ43lD5ggXgowQpK4WL7SkEq/RqT195Ixjn+ojlWEXTzbI7ri
	 ihcxFmhmEqxWm9cEJ5OBrUmhocKSI8eBUO3KxTXCp4IUIAQ7Otk4FGXLDIoJAuVeA+
	 0QqkIRKpTBlvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0FFA8D9A153;
	Thu,  4 Apr 2024 22:20:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: process: Fix kernel gp leakage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171226923206.6067.4805872086419688742.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 22:20:32 +0000
References: <20240327061258.2370291-1-sorear@fastmail.com>
In-Reply-To: <20240327061258.2370291-1-sorear@fastmail.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_152033_994097_92DBB00E 
X-CRM114-Status: GOOD (  10.32  )
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

On Wed, 27 Mar 2024 02:12:58 -0400 you wrote:
> childregs represents the registers which are active for the new thread
> in user context. For a kernel thread, childregs->gp is never used since
> the kernel gp is not touched by switch_to. For a user mode helper, the
> gp value can be observed in user space after execve or possibly by other
> means.
> 
> Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
> Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
> 
> [...]

Here is the summary with links:
  - riscv: process: Fix kernel gp leakage
    https://git.kernel.org/riscv/c/d14fa1fcf69d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
