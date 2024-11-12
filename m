Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4011D597B2
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 22:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8mki4WA6ePYMe4vYF0+gl1TiHRFf//DiZP+aBmK5cw=; b=Uhax25AodiB6ic
	7AD43FcmZjdsKci3QKBZDgZ6ZGKxVUisZRckaAarS0qwSCxcjgOQTQ+5VDr352r+/FGO5+zAJiB5H
	h65DnOq23jq6j6B1chEiYqts9aEW5WRF6mRu5zbRsTRjJrm/XaDy6sVi6RxhoNx+KdPLqqIqFc+He
	iIbqDyzoH+z+wtQoflm2vLaH/HjoOqdHi9TGj0E4idXB64QW8rZrDXwn5XwBlqD5fXs4Ij4eRPSP1
	7fLzrK0w6pgba/l55bNfGmqDBoe2Lo8q6nn1KdHQNB71j2+gJZ9zjSW+96cXFZiuPoJxKKp9CymVk
	AaUM8AwtceO+WPzZwcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzmg-00000005COM-3WCd;
	Tue, 12 Nov 2024 22:54:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzkr-00000005C6R-2847
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 22:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9281EA418DF;
	Tue, 12 Nov 2024 22:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73584C4CED5;
	Tue, 12 Nov 2024 22:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731451980;
	bh=gPrcbKEkR5xI3fKzMDfEfxbVhXi4GE3kfIX4m7/OQRY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ze7rsffxypXgJtwH605Oegc5j1gP/qGYYO0jhNzjzv+Xcf0vIr+DjheOZKxqCfs4S
	 zE05OemsjPMg23jDtBy+/tNguk037Lk4UQ4VVGa75q7GCtrmxvxEf3Yt5rMmtzdWXW
	 yJiudyXUq5LeEntD+wTMYNe+WXygGac0Wa4bWz4VeYLA9bDQ0B6jmGnA3roet6HThO
	 tDEIxHhrqrf8MsspVvtMaa1ZvZHNFDOsqWf+NHw+YFydhoytExXxxIt1RhSjypY8Lg
	 SzDcosKDNjx/idPing5yKU5O7upE2JcKwqD4qpWKtz02OdajNpE66qP340E3fxQbKT
	 V+EYMqJKHseCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACF23809A80;
	Tue, 12 Nov 2024 22:53:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix output text of base address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173145199075.701548.7255466685517081428.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:53:10 +0000
References: <20240909085610.46625-2-ajones@ventanamicro.com>
In-Reply-To: <20240909085610.46625-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 anup@brainfault.org, tglx@linutronix.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_145301_632462_34F7B764 
X-CRM114-Status: GOOD (  10.61  )
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

On Mon,  9 Sep 2024 10:56:11 +0200 you wrote:
> The "per-CPU IDs ... at base ..." info log is outputting a physical
> address, not a PPN.
> 
> Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - irqchip/riscv-imsic: Fix output text of base address
    https://git.kernel.org/riscv/c/4a1361e9a5c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
