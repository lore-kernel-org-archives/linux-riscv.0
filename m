Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46195C369BA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHavQWzwiKer+VxihAmtpGs7BKydQql1IjwHjm/9kfs=; b=Enq8vZuWbGy9RM
	sVffxW1fHSBUI+IkH8kTf7ndKMrn0mEjG31HyaMWDKDUwFPBpZrg9gui/LFXbrgbxSdip7CCZbTrV
	68n3LSo548SGhdWIIqO4b3b65cu1tppUDFBlMDDGTJaK1aaXtZVP7g13DksAYCGuotVSBfeNJM9IN
	1ua8XnhgP0nUn+sJzl2k2ST7y7T1J102plPbnRs7Rf/ANB3UQwoQN3d6pxBe2AcFwpROv/Amjye1J
	X7w1pFetrtayXehbKYK4a74duGwwjFIf0JYn4XVhr2woe1cHbyCfZ9TV17oXpYHy9gHYM4c3TXfC0
	NkURrYu2SxtfViq4FKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iT-0000000Ab0H-0iAG;
	Wed, 16 Apr 2025 18:42:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57hs-0000000Aar6-1j7n
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 18:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C95986156A;
	Wed, 16 Apr 2025 18:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3495C4CEE2;
	Wed, 16 Apr 2025 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828915;
	bh=ME49ZF4t0jmo7uSiWyuhCwsk8DjPh8JuS9vPdzAOw2U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QspY0plgC0EsxNYFniyQyWi0YMBGfIo+bd3SiQsmoTj91jehPUBYocMddP1yL0m3/
	 lvijYIQ4Scbj+M3BZvCAUvAn4QFmScOstM1uncU9xTDkdq3yEIgsm0Yr77iQh8b7nL
	 aeQzaR9DJYn+w5aG0cbyo5nWDzVOz9uYc94BaRG8636OSc0qt4t1eKwkM/T12uWgq7
	 FOPES/LKOOAFeFLBb8dFPiRnM9Dthe++jBNzM8QfoBc2klcnxtH43IcU/wugGBSdAQ
	 BFun8QQE0IViVTgUjZYxHSU7p0bNeJ0lIiQobm751GPzCELja8ftO2656BOFg2pUzB
	 ZxVxwbM+w8sQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB83822D59;
	Wed, 16 Apr 2025 18:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Provide all alternative macros all the time
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174482895352.3460781.1754432437296144659.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:33 +0000
References: <20250414120947.135173-2-ajones@ventanamicro.com>
In-Reply-To: <20250414120947.135173-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
 conor.dooley@microchip.com, oe-kbuild-all@lists.linux.dev,
 charlie@rivosinc.com, samuel.holland@sifive.com, lkp@intel.com
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 14 Apr 2025 14:09:48 +0200 you wrote:
> We need to provide all six forms of the alternative macros
> (ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
> __ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
> from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
> ensure all configs can compile. Define this missing ones and ensure
> all are defined to consume all parameters passed.
> 
> [...]

Here is the summary with links:
  - riscv: Provide all alternative macros all the time
    https://git.kernel.org/riscv/c/fb53a9aa5f5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
