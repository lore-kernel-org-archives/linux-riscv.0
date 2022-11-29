Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A65EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L01fGZQbJxKt05u8fstfuSQjwgi146B2eYQdlQM+29I=; b=aghAph0B+2L1cu
	4ISoZsFuYGbZgqQNIipHcu7I6oE57e9+Thzoqp9OAqWpFjG4lghz1gnjfW0PDUHReKs6dXhHOsEAo
	wFZtTHjyYfsv7LGf0c74pAVSAPrcVbOsbb9DYow//RvY0aDsts170ruNqhNMJq88dYK4JeuRVq0NI
	5DiIwAFyc+Mu/g90TkKswO2mHqeeR92tpGySO1pe6tg7PV1sx5Ua2tYRBloOqdgQ3rVVL+M9yRONH
	jCBLDLnEXmonZosE1OyV3tZQGizEDYV5ySOO5PDIC86P+84CaCy2lYC18mRfl1498hCD6tqlXnGiP
	HhdqQUiRtZ5Tw2ba1f3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08BI-00BOV4-Lb; Tue, 29 Nov 2022 21:30:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08BF-00BOUZ-Lz
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C15B61940;
	Tue, 29 Nov 2022 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ECFCC433C1;
	Tue, 29 Nov 2022 21:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669757416;
	bh=oMkvO8pm+3jqnGq2DoK0eZBcXo3/PnfmK5SIRv3j33A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QVvRKNqBf/A5dBZxJo19vrykiXXtea5g2BjdJ0gqxoouEDUT36j3dokwf+8sVXb4l
	 LYUdkQpk9A6slFAzq5BUYCpH/x2yMgQ3GH7vFjyWAUtTO0/et3w168Pch+nBDExIMn
	 P+vLdlKnKPq730Ls6md8uDqIcXSwPLUtjdyoCzx1pgw31/Hu/PwKCzP+XdrxcOYQvI
	 cZa7/A+uS3nB74+VMF6JMMCuCMRUnEmZZkehzZN92O/0vMQ3KY3sVa2keKQ15WeMk2
	 xNiekdXrwMaPwvmSi5BlWcBre+neT7H4e6mmWVWmRrCxsOiWOE3wbioi/8AO+alw8L
	 IGrN5x62nukNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63AB0C395EC;
	Tue, 29 Nov 2022 21:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: enable sparsemem by default for defconfig
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166975741640.31468.13398851755813546189.git-patchwork-notify@kernel.org>
Date: Tue, 29 Nov 2022 21:30:16 +0000
References: <20221021160028.4042304-1-conor@kernel.org>
In-Reply-To: <20221021160028.4042304-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 daire.mcnamara@microchip.com, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_133017_772215_39E7B48E 
X-CRM114-Status: GOOD (  12.28  )
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

On Fri, 21 Oct 2022 17:00:30 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> on an arch level, RISC-V defaults to FLATMEM. On PolarFire SoC, the
> memory layout is almost always sparse, with a maximum of 1 GiB at
> 0x8000_0000 & a possible 16 GiB range at 0x10_0000_0000. The Icicle kit,
> for example, has 2 GiB of DDR - so there's a big hole in the memory map
> between the two gigs. Prior to v6.1-rc1, boot times from defconfig
> builds were pretty bad on Icicle but enabling sparsemem would fix those
> issues. As of v6.1-rc1, the Icicle kit no longer boots from defconfig
> builds with the in-kernel devicetree. A change to the memory map
> resulted in a futher "sparse-ification", producing a splat on boot:
> 
> [...]

Here is the summary with links:
  - RISC-V: enable sparsemem by default for defconfig
    https://git.kernel.org/riscv/c/41555cc9e2e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
