Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC8C47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3i62JYhiajsEN3t/+gcmyFOBoUet0tT0xMPFyzKeFlk=; b=QlYHmmh81bflqa
	OEhHWbm8l9bgLhslwXmQVC164ZdZiY7cifvnk57vp1uwzhLnsYrEX/GJotckIQEVv+KUbpxZP0sUz
	f6cbTIPzpo+DdTmQt04A2mpHQ0LSupLfXa7OsI0y/QGyfOXQK8WK1qx9AsBPdo9n8znS4qWRv8JpE
	83cht1ZM7nMxqOehx8fAgT0EZIqkTq5sLG7u3YD4LLTKLh62hnIrB0jRSq17MvCnll6FDWMRCnaCO
	rkxZuHTB8J6LWKooHvVo/pieJYnxxDpfLVs3i8t1Ist/4hiros2Yl2TpnmG7P0u7Z6ge1hVElf3sV
	jQj0EkL4IN00u1GpqKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbc-008OYb-0d;
	Sat, 20 Jan 2024 21:10:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbJ-008OFC-0A
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1D77BB80949;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECB1C433F1;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784998;
	bh=q+nub84U23nvD+cn7YvgYkoUGFiaXs85dZdXJ4xFhpU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d6RpqXL/1LZrgglNCxscGX37U9C04RSJDlu9mrU8bupnby5ZS4JKTlFT4eeYAlWsC
	 Rq9sXv9czypfWp6lI5AP8UmCHdyVB/BU1/0vRAbpo3oUfmrKIDev9To7g+kagjcGwt
	 DPecFerWRld02oOeW9OUjgHXT8uCI5bt1XlZX7+o/HaLB4YZb058QLztbDYN6wjLmk
	 rtaf91Q6Gp2xnO1AdFujjlrTfI6f1N4QzRCUm47BRCqcSpvyzqYt6Um9rrSsiIzMLt
	 AW3dUIOZalnqBPYOn0FSC8c7gz007wJU4RrazDsq/0hR8JM06FSCGxYcYRQKLNlv00
	 rvSGfy6pM1SUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE98BD8C96C;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: dts: sophgo: remove address-cells from intc node
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499871.24348.8897896227923136554.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:58 +0000
References: <20231024-maternity-slang-fd3dcfb211c0@spud>
In-Reply-To: <20231024-maternity-slang-fd3dcfb211c0@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 chao.wei@sophgo.com, unicorn_wang@outlook.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131001_370261_A9772FEE 
X-CRM114-Status: UNSURE (   7.65  )
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
by Conor Dooley <conor.dooley@microchip.com>:

On Tue, 24 Oct 2023 09:20:35 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A recent submission [1] from Rob has added additionalProperties: false
> to the interrupt-controller child node of RISC-V cpus, highlighting that
> the new cv1800b DT has been incorrectly using #address-cells.
> It has no child nodes, so #address-cells is not needed. Remove it.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: dts: sophgo: remove address-cells from intc node
    https://git.kernel.org/riscv/c/e80ed63affc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
