Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF611F532DF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/cTY6XRWl1KrNX2p05VurE8t9pYEmi1P4eiOUXirOI=; b=DYxUAcOsFqoIcZ
	kV0CdtupQYWb1O6562F4RVAn/G4rf9l9ca6TmSSDEKsg+fRKZDshelHXMw/mqaj7Z5ruuN8JcjQhc
	VLtJSZFKcgUjW1iHxLpClIjY61leTSKbg95CaTa6M9c5ztiUc5mIFZAE/Vgc93JcexlWrXiRsUbtL
	UxCiYddhWzOQuRPCba5mtd5wR7QStj8MuKEAhoWOmog5hsRyuHh3t+3sQSSo3YHX9IPo+v7sLj5mV
	Inu09J/YjZ9PQ4fKQCNecgeJ6ZgWhffyS3GpYTjP2MalROj9sJ0yEdexqyq5HNdSebhZ94ckWed3u
	XZMTKdSHwE9NiPJRzBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvk-00000000das-1KZF;
	Tue, 24 Mar 2026 06:07:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvd-00000000dRQ-2xTE
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 282ED60132;
	Tue, 24 Mar 2026 06:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3E1C19424;
	Tue, 24 Mar 2026 06:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332469;
	bh=ND595YyMEj+N764khRxHYO4gmu5yX7yiQ2iSXasJtQk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HrWNOMyLyxxUzSUi7E7tTF6M0CXK5O0YYqR7toqRLmHejXeAMw52RBkNNbubvcVOH
	 V2SqE1G76hII4ixd/ZXaxw3zVsaDhSeUpMLWOuE5BpfLYwjmJVENvolStPfgaL1hUK
	 esVZ+XZ02anTdzLQIYvvZdiNOGcdbDOMp4XkF6hsD3VlS2L0Rmb42wH0dSvkH/F5Tj
	 yg8MQFBjnF8W06wSJVGyPToVUEcbjcq+mb9EJ3WqrzLbgfCPmkQFg2gJk2ePjGuFBw
	 BSf7p043tehEYpzPa2An2FVoCR0MDLCa11zXdbPBEQRTfVXCzLLpLmt949D0vVx+JB
	 aDpxr0A4Cz7gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE5D3808200;
	Tue, 24 Mar 2026 06:07:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Fix mailbox channel leak in
 rpmi_sysmsi_probe()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245704.469836.2707356125930087876.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:37 +0000
References: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
In-Reply-To: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
To: Felix Gu <ustc.gu@gmail.com>
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, alex@ghiti.fr, anup@brainfault.org, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, rahul@summations.net, palmer@dabbelt.com, tglx@kernel.org, pjw@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Thomas Gleixner <tglx@kernel.org>:

On Sun, 15 Mar 2026 15:17:54 +0800 you wrote:
> When riscv_acpi_get_gsi_info() fails, the mailbox channel previously
> requested via mbox_request_channel() is not freed. Add the missing
> mbox_free_channel() call to prevent the resource leak.
> 
> Fixes: 4752b0cfbc37 ("irqchip/riscv-rpmi-sysmsi: Add ACPI support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-rpmi-sysmsi: Fix mailbox channel leak in rpmi_sysmsi_probe()
    https://git.kernel.org/riscv/c/76f0930d6e80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
