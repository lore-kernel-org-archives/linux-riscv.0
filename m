Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756CCC0018C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZKrJZeUdCsCfcCKxqrhgiGlj1wRM6umqvvxwNB90YU=; b=NlkNzEl9s1DX97
	PjrlL0dvBalMqpFlqeZMIzFj8ZGAhB/l886KQLJvJ2KerUEcjju5B0+0FDLtFX77XyaJlVhrZhGFf
	MsDa/lchOuHY/j2IYyFZZAIle5T66JNX9KDos1qwCdDtVQ1EOL9EQFhpWou5PRY8TrNLwXYYsGNIm
	3OKe167tJyLn4QJ7rGUnGripReaaaYNY3knmOdUdx6mYVOmzULD3Vexv/BfDikHd2YoqBbMM1YtzN
	hdU/BctCjimZXd2RjFai8cZM73gSWjVpV+NXI/p9620+sxcdYyd62Rj5bdi3+jXmR9nyW5cp8Kmka
	VvjUqOog+ZH78vW+e17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fv2-000fFC-01;
	Tue, 07 Nov 2023 06:50:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fux-000fCS-0J
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 06:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98B1960FF1;
	Tue,  7 Nov 2023 06:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5025C433C7;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699339826;
	bh=5vJFCthJBHnqzQsMTJKYhKI5Gq7pc6ns3CeZeQFkjmE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sQB4ahFDb5uo5bEqJaXoFZtULW/ef/6vzARSKTAB8E0jSrPKyS3A1VeZ77TLqPlwE
	 zFv6663hCUS3shgvT1qdAcHTDhQJr5cPN/qpynC6uSroI97sCXbCmstYGA06hQI7ni
	 3432KmUtiSiErARGdFCQKvXaKySIDrgDD+xUMO5OdA9tRHS5JP5tN5BWpJtTODfi9A
	 4jNg0NX3/rmCq8RvJvmM1w3hE8w/o/vYwmEWC0AQ1jt1SzgoXF7ahsq4dp8o7jFrEU
	 iAe8knlPXP/Dc/rlSGGtiNf0uSLF8maNjpw33CGsJutIlgNnJe1tt1/YmoeA6Gt4QP
	 P4jI7sW3jB+zg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7B73C395FC;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: select ARCH_PROC_KCORE_TEXT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169933982674.6233.7158351943021387815.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 06:50:26 +0000
References: <mvmh6m758ao.fsf@suse.de>
In-Reply-To: <mvmh6m758ao.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_225031_174574_04E5222B 
X-CRM114-Status: UNSURE (   9.14  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 31 Oct 2023 12:40:47 +0100 you wrote:
> This adds a separate segment for kernel text in /proc/kcore, which has a
> different address than the direct linear map.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - riscv: select ARCH_PROC_KCORE_TEXT
    https://git.kernel.org/riscv/c/e0c0a7c35f67

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
