Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08E6CD129A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vG0wYUMRwq+TIKmUfMQieQAXrqKS31g90NZm5q6Z/AM=; b=4xjesxh7t5Qusi
	wy/FT/unhn9DLA5H05BfMZg+JnFh6AHAcOARhBtVHmtAU7arphF0QtyMkO1AJ3p26EgyHsRbcfNIs
	BEZjKdd4E/BRvRXMLnxSq61hL+JVJYUuvnoKOk71LHjssI37quXo2nZRpAuMDhKw1NRPDuRpatnMK
	NquDqqnQVUL5EVeXi7QXOzJnv8npnsfwdFW3pweGHjPm7YS1HKui0pfeTVhaUq8oPphl+38v1afA/
	xuq3cFD9iMAV3ivWjqA63pf7rR0lsym8x99CoEDC247Vmqhy2zI4FQRffmvXqpEy8ufvj31uxIPC6
	j+gzcNBhjX3Y+3fO91Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwu-000000045Ff-2iXN;
	Thu, 04 Apr 2024 19:40:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwq-000000045DJ-0UFh
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EC3F61761;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24DD2C43394;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712259629;
	bh=wL6xOxIQnHYILAX2319WBkm5eKkO5wAtkh1QB95emFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DXr/YNXMVomqvEkbAo47XtTSMIApKsW/3HWYrSPJcPasdB1ktdOenA2XZ0/Evn4Og
	 NJ0DxbW0vPBeVO0R6hTKK6ssl6OgsdJWJoB6g5aF8JnPSupg+ZUWQsKVp0pUavFTWs
	 jk8VqYrbhHBERuhskZJkD8fkcFlGw2W2yxeT+mfME0ZONFNPNa9XP62ExLLyID2R9/
	 46aACig6oxnTuNrd7SXlQkrXxaXniD/p96uYIaVTl8lOMbjHryS0ERrMq8P8AGKqfM
	 AT4TbUYlo72oDTfJ0p42NQWu4GpH928HsPS3pDk6kefsdvG9as85pF25hVAKUctw9T
	 6ySi0Li0nsTqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1281DD84BAE;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: implement pgprot_nx
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171225962907.17194.18344449254455951653.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 19:40:29 +0000
References: <20231121160637.3856-1-jszhang@kernel.org>
In-Reply-To: <20231121160637.3856-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124032_249460_AC3CC16E 
X-CRM114-Status: UNSURE (   6.14  )
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

On Wed, 22 Nov 2023 00:06:37 +0800 you wrote:
> commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
> executable") enforces the W^X protection by not allowing remapping
> existing pages as executable. Add riscv bits so that riscv can benefit
> the same protection.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - riscv: mm: implement pgprot_nx
    https://git.kernel.org/riscv/c/0ffe1ae7026d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
