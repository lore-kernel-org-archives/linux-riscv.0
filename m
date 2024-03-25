Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76F1C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMwxBiOuXWl/0nEetDL2T+Squ5t3CJfS4W13R2jzRfo=; b=JU/ZbsehI7s9/p
	I9f9Py6k4Oe1qRluQ5NJZv+1pyH1ZWftqAZHjAfoWzGtbZU0iVIJZ3b2RW8lCrsecgsniLLnct1Og
	o64n5LC7YF2cDGZkEfIjvv/gozynfMIsI8cJclajn5knWG2425ljTQFfcgxhxD8HE1NJ3gUxRw+In
	mjCvNlX3j0ExyylpMpnuzJ/w6iWp1avkDEM6JNuOD/KvaqoERCgQ4MBdlWGzWQZR515VsGJpg9dP9
	ICkWwi2dXxDkVje46madBCZFAQLNonCx0cGo4P9M+3TtBGcdaLkL3GL0D/cmGCZBm9Y0wGI/w2ptR
	fN4AbdKWdYVYPFGxbPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocBE-0000000FEZL-0b5x;
	Mon, 25 Mar 2024 04:43:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAP-0000000FE55-323e
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 04:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09A34CE1033;
	Mon, 25 Mar 2024 04:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1667C433B1;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=bOCUeLS1C7wpm9pu8FD1Zt59GN4cTLuXNPaR2yCkUEQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C5Q0lIA0AlWK7xzVNsghEMI2APioXYG4HH5Y+1Y2mU0nEtw3fCA5PRb0epP6MDuSP
	 OpPj40tc1RwWtS+G3X6Fylw6q6ZgCp6RmNcRoChBtYRudEB/Sy+Z0AOXDKlBg1f3BZ
	 BXbSseLeWfZKLCAUhSy7uiRF+/IqqMEYGB94GSmPcNv+0ambj/ibblarTxwzEptowg
	 3PsG4sUDEMcT9BocxJz8U/NFBPOokp5twbzSEJ3JUGsZ1saomvFUZpAGLZLzX8dYSJ
	 OWEgct6i9Cc7V4tvqAhbPaAZi9QDOcVpUP8XXmHjIfRUPBVkC2F9rjA6Q08TnOzXoM
	 QJI+TqltJCkpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B30BCD2D0E0;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-intc: Fix use of AIA IRQs 32-63 on riscv32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175473.18749.6561888891935488179.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240312212813.2323841-1-samuel.holland@sifive.com>
In-Reply-To: <20240312212813.2323841-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214238_021948_C64D5324 
X-CRM114-Status: UNSURE (   9.69  )
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
by Thomas Gleixner <tglx@linutronix.de>:

On Tue, 12 Mar 2024 14:28:08 -0700 you wrote:
> riscv_intc_custom_base is initialized to BITS_PER_LONG, so the second
> check passes even though AIA provides 64 IRQs. Adjust the condition to
> only check the custom IRQ range for IRQs outside the standard range, and
> adjust the standard range when AIA is available.
> 
> Fixes: bb7921cdea12 ("irqchip/riscv-intc: Add support for RISC-V AIA")
> Fixes: e6bd9b966dc8 ("irqchip/riscv-intc: Fix low-level interrupt handler setup for AIA")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-intc: Fix use of AIA IRQs 32-63 on riscv32
    https://git.kernel.org/riscv/c/ca5b0b717b75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
