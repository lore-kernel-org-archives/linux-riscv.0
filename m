Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB43C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 03:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0WSdwP+oLDGG1BxhVZlslN8AlQ+ITj5mUYlwS9St6Q=; b=EWnJcFaYeDansX
	OHgNdEt+GZsD0EHyQJylosSGpaqdV7AN2lmwozLz8UhZtLSk5vp5/jhA6mpSdFJz45NlZWBinw3Bf
	mx0r2ZNQ0pnotsmf0Z4+EZwzsV6QboXpO1etdlUnJIf9vA5HghpEzGgAddP5dcA1j8rClIeYiPfFu
	+B0MJlAimJifTI9DguJSbWZZg8AB9yl7wWNswIdGP03HfQ5PbY8xyjz/ns3Z0iBcupEXttOhDN1Rb
	aKbqj7ctIdos+RgphE0J09hP9AgeEaO/fbOFJIkh6TuL2NOYe9t90bqBcefdcKRklWHLPdMBzXhjf
	iSqfS4JxsqBJ1MyHYVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZUW-000fDN-Ha; Thu, 02 Mar 2023 03:20:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZUT-000fBn-FK
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 03:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C7436124D;
	Thu,  2 Mar 2023 03:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4ED2C433EF;
	Thu,  2 Mar 2023 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677727217;
	bh=P1uDREo5uUE+DlpF9jOvJF/Y8D6CgbfPtt94/GAaTj4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PyZ7+vyV0jUKMFPPYKcHg90gQ3HrVn86vY3LmT0D9EQCgiU20JplDabTQIfBqAKHO
	 vSz3vBP8QVq5PRE0PxTNtf9PBTnVYMOEiEtG/zBvnMTw/WVXAF2MQf9vbGmJ3wmU+N
	 SqIBLi4+SPv+7Czn8x44gSIB3fOZTr1Gz+ODnkpM1zv1PB7WcF3nGYcYqsV+isK9Na
	 HFlaC7AoTJ8WYGiXdhKKw/Oz1BA/ZZbTHLVc/XsVN0uc/RXmgPXcUW5/pHQh+uhX2u
	 2MI+85EJUfTEYh9FfDX1kYbaGEJIVkc1k4MtedosXyFRW5YM/xd37tOORxVnd7xcPA
	 gBgB/V2jgOagA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B1F9E4D00C;
	Thu,  2 Mar 2023 03:20:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] drivers/perf: RISC-V: Allow programming custom firmware
 events
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167772721763.17253.3140580706696952934.git-patchwork-notify@kernel.org>
Date: Thu, 02 Mar 2023 03:20:17 +0000
References: <20230208074314.3661406-1-mchitale@ventanamicro.com>
In-Reply-To: <20230208074314.3661406-1-mchitale@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_192021_589061_8DF864C7 
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

On Wed,  8 Feb 2023 13:13:14 +0530 you wrote:
> Applications need to be able to program the SBI implementation specific
> or custom firmware events in addition to the standard firmware events.
> Remove a check in the driver that prohibits the programming of the custom
> firmware events.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - [v2] drivers/perf: RISC-V: Allow programming custom firmware events
    https://git.kernel.org/riscv/c/9f828bc3fb90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
