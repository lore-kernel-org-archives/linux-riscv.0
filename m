Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC14EEB64DA
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8VDm2sNNNqL93MPWPWShIePahUg7oa3XTBs9qiPUm4=; b=OWRS1qT+j00MHa
	gbP/kKx1+ePvwh0tekusT0b7NMNDddT1UDF8TdcCoLxMtKHYKS7hD8YX4fAHE2Hs06M8qQcVwoHOu
	a5ZfwF0lrRzmr/psNdYuHpOh4UsEgf4cFM5X64+cyRDTzTTPRt0XjpOP4lGuxRth8e/ihEKeKaoQU
	LD7fGhGe4Shb8wj748Q2thubwTDZ9cgHA7hoJWaHn8eoIpG8gcUvmYnWhmQT9HgVU5S2rxIrP4/aQ
	WzRxhFqB2lNu6h/BRnrQLwiw26IRLr/JlRXKrI1eOfuoEimYGFjFlLQH3zXGT0v030ZXKm2DpC7PQ
	hRE4p7MkHJd5NyzyZg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjX-009pb6-0X;
	Tue, 20 Jun 2023 01:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjT-009pWK-0p
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DE7660F85;
	Tue, 20 Jun 2023 01:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36611C43397;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=1K/RwqRdMYJGRKsnWfWIH8ffoYXhVtc1mk70JJe5yAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gaqmmP8xDtHDOiiYN65ZnBfMdFvJckUrWL5/Z/GSz/2aXvP+tMjIOZBCeQ1ijHL1W
	 0um/OnflXn/EGAepY1auJCwMjUy2g1khY5vnrsWUxmbFlKBpX+wFAnThEeB2l6zYXD
	 8aJiUvJtCg4f/DyErXry6mX6n0rE9qIrKTaefhhsJkd2qQfaKm7reaP43pAW8mhjnY
	 1Qy53hjdG4Rr58viVeWo/eAAneJtzdqOzrDoKapD8lhQJxvg7uZqoiLPAgGru6bTHo
	 YR/mmFtRTo3y8Nm3A4tBT7WKWBAFKi2oYzr5i1Ntdb3KbHfBv99+ZJ7xaSY4wsuvoS
	 H3Alh9F54GoJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A0C6E21EDC;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282410.22807.12971210295327480570.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:24 +0000
References: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180031_353418_519A2890 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri,  9 Jun 2023 16:07:06 +0200 you wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - dt-bindings: riscv: cpus: drop unneeded quotes
    https://git.kernel.org/riscv/c/f20233852ae2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
