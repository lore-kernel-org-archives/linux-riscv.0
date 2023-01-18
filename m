Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9DDC38159
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 03:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqxceC3vX3wtZJIkjy7lRmxhudpuEUPq2Qa2OP8wJts=; b=y4YmDVJnnw+ndt
	+67fXKe06WxtnYF4hAxYkHZJA4T0IBiu7HYIWlgOldKsGvkDh/f2kev+R7Q+Ra4J32z8BIFlxrHno
	c8SyAjKyrYAMAmCDRDyy27leaBxP4QjwYqWXXMqeKBQK7vuez1o1G6SHCBNXQ2/HCPKtxHcIHBcmo
	4e9/B8QGCR5dCT6w+D4gpxAMbJMDEUxMIaGvQprAM4PL4iMMym2Hc5zms9GyNc7wrqgWTHeM1n3ZV
	mW8QcSHcZ72HY54/IJc1aq8Cc57CuebhaxyfhC5x8ugABjbvQKtT0/rGRxiWhk8LCq7ezi/YDRX/i
	lo6Yr7dLcqSxtGjiy08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzSw-00GnvW-Jc; Wed, 18 Jan 2023 03:50:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzSt-00Gnuc-7O
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 03:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C60B761629;
	Wed, 18 Jan 2023 03:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83F84C433D2;
	Wed, 18 Jan 2023 03:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674013817;
	bh=sEd2oGqQVH8sMuJKEvcuZzEbqmsPXoJgAmGVRljE9yM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l5Ldgz7zQc7Xag6ppazc2ZE3rBzNHRjvd8lYleCZb59C2V9FNy6PeuYddc+dX0vu1
	 C/RyavVSNyb/Qer8/g5/EP/TxNJDPZG2GiK2/1mS92yen4qB7zN2OouICt3JuEhwzO
	 THkFjzVgGrW8+n5G6FDnF+Q+sO3KnTxEBm7wjBQZTJiOs2r4uegpiQQfxdK1O7BtnM
	 2NcyYcCAJ04fHMwh/0x5dxGHYtTnl4Tj7NY2OhZ1G6RKLoswFg/qQ+8tV/iqg0NXQ6
	 WEH1o1Dc6FO7PBkfLawnkP0el+E+MHT25g8tbv6fbgLKlMkjn2w9WcnFaacY/yatVA
	 af/2XP2Nq5Mtg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 658AEC43147;
	Wed, 18 Jan 2023 03:50:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: fix incorrect type of ARCH_CANAAN_K210_DTB_SOURCE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167401381741.26783.167019390951027976.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jan 2023 03:50:17 +0000
References: <20230111104848.2088516-1-conor.dooley@microchip.com>
In-Reply-To: <20230111104848.2088516-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 geert+renesas@glider.be, damien.lemoal@opensource.wdc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_195019_324387_3C03B6D2 
X-CRM114-Status: GOOD (  12.13  )
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

On Wed, 11 Jan 2023 10:48:49 +0000 you wrote:
> When adding the ARCH_ symbol for the builtin K210 dtb, I erroneously
> used the bool type for something that is quite obviously a string.
> Unfortunately, there is no such thing as "def_string", but in this case
> we can use "default" to propagate the value of
> SOC_CANAAN_K210_DTB_SOURCE to ARCH_CANAAN_K210_DTB_SOURCE.
> ARCH_CANAAN_K210_DTB_SOURCE is not user selectable, so using
> olddefconfig etc will update ARCH_CANAAN_K210_DTB_SOURCE to reflect any
> changes made to SOC_CANAAN_K210_DTB_SOURCE.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: fix incorrect type of ARCH_CANAAN_K210_DTB_SOURCE
    https://git.kernel.org/riscv/c/f1b3dc80f0bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
