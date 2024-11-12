Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D1DD597B5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3ZUhb/wYApzrDCCo27t6z1V0HqAHoXt1yEiuGHU/A8=; b=Srh5xN9KfRp3t9
	hOMsc6SDnyabzLqwCD5E8u8qitBqcRFfuFKZknFS2peAumqY+XXmCIGsgiDtADdztOvN+JsRp+9aI
	RgpN2IhTUM1uwizBRmvW+z5xm/f+C/G9PkEdKOyMr10P8hE8bu7kE4Vyzo2pf/VFvfDXqjqbthRuj
	w57UX75ae0IJnCbGhm7ERKod1ed8spwt9Av1MShDxy2OVe5EjqIzq0uBI0SmTtFsXHHnaT33mhric
	l8UI8c653rd22xnqX3LLMB3wmTQdUfq3jwZsbrNe2r8IE3dDrQWV9ubkYyFeZiaXOTfPxzrFVXvAP
	eyuTwLev4150pv0U5Flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzmh-00000005COQ-1mtw;
	Tue, 12 Nov 2024 22:54:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzkt-00000005C79-2ZGt
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 22:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B45B1A41968;
	Tue, 12 Nov 2024 22:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA32AC4CECD;
	Tue, 12 Nov 2024 22:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731451982;
	bh=gM2fD9GKvbDRwedhwlgxqJL8AUErzeS2hOc00WVUabA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LFy+FHMFW6LdVtTsrqkuD9RI0sDFVIbBYGK2GONCqeFgY2wxRp531N6g0/fz9SQqr
	 CvIlxXQWjpRfsBedTEpDT8Czv/KaElBxKJwIbsCrkq7+pWtOn1rpy0XBWOzd4rnPbf
	 NC2/74M+LXAsnYFiy3909PAyZgitL8RnOQiVHq7OD+L4OORloAkjmwoymRYaOiLmSr
	 3XzclU356FU+uQFVs3ODaDAhQXfmOguWzNRF6XlufbFZKzrXm297wunUADLZ8c0f8u
	 PUP49+DCmEjBZJS4jzoNQD2tYNQiCZ26tD8/VQaXR9zUsvKY0uMyJDAlkMGBDNnZtH
	 Ory/FhVzi6s6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DFA3809A80;
	Tue, 12 Nov 2024 22:53:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/sifive-plic: Fix error codes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173145199270.701548.8713115624337765162.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:53:12 +0000
References: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
In-Reply-To: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de,
 paul.walmsley@sifive.com, samuel.holland@sifive.com,
 dan.carpenter@linaro.org, apatel@ventanamicro.com,
 linux-kernel@vger.kernel.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_145303_734855_DC841FE3 
X-CRM114-Status: UNSURE (   7.99  )
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

On Tue, 03 Sep 2024 16:36:19 -0700 you wrote:
> Set error to -ENOMEM if kcalloc() fails or if irq_domain_add_linear()
> fails inside of plic_probe().
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202409031122.yBh8HrxA-lkp@intel.com/
> 
> [...]

Here is the summary with links:
  - irqchip/sifive-plic: Fix error codes
    https://git.kernel.org/riscv/c/6eabf656048d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
