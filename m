Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B57CC41535
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MY8bQVPompT/wkzmf0S/QmOQVk9VN99SFu+ru6G/Tfw=; b=WUhjY4gsXDfwlD
	CTIpl1Kux3Zg7MG/zdhrG/MmjmPa53D2JtVjnbaSCE41m4M0dsfgluO9LEGP26lGaSA0HF62AuQlQ
	IfE/hW2Wobk4xWelSt/GkmuqEn0+OEnBos0Pdt4dQhBWxf8lJ2MuCq8EDRIUbhTAjUfCaTi6qCrvH
	+8c8tYNic1Vz1MO5QITUpbRSOtrLQm4m71nZ7yX+fPrzsWq226uVYsmANAuWinQmi2ZAy5jsFO1ag
	Va6Tw0BBgHT3Yb0Dj4eo3eIiQO/TWCryD3ckTabHAzHxZXC1fmuX1gktP3AIS50P1TydTpUBO8n8t
	sw9GHufZgG+/RyKJurcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBB-00AEIy-1F;
	Thu, 02 Nov 2023 20:20:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeB7-00AEHE-0h
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 20:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8FB40B81DDA;
	Thu,  2 Nov 2023 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2432C433CA;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=6/aiuKDvOrf/kc54SvicUmukJxjwhrkThS2b09C6F3I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CLq/02a7+B7VxIfJ0B2pXUva2EYqrkG5RXD69vQTaXSd24nQtECzDn2cihGGuNHB0
	 /lEh7Fno6P/5dGUtR9RZYAiPp4ZUIYvT1nSQoO9+6Lw4BlWgAiMjRr2MtB8RuBfp1g
	 +9yjm/1REIVZBOELkN9M+4x4fEWaq4u0Kehd19TGg5AhV/u/ZwKtKfgavsSAmCb7Mh
	 V3/+OIfmapsFXgyNlZiQqSkxCjkDKSegIJCePzQt3LMIWVRVJLkJivjciltOjngmuw
	 TBaxrYWvtni3ksecZ609BpMovh7VDVM0+NSawza9naTzVlsSLBVHTk4e9N39lhvzZz
	 yPZbtcyzvFZcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7DBDEE00084;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] Enable peripherals on RZ/Five SMARC EVK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169895643051.22248.10364642768194481579.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@ci.codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, conor+dt@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_132033_407136_521A6C8B 
X-CRM114-Status: GOOD (  10.25  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 29 Sep 2023 01:06:59 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series does the following:
> * Adds L2 cache node and marks the SoC as noncoherent
> * Enables IP blocks which were explicitly disabled and for
>   which support is present
> * Enables the configs required for RZ/Five SoC
> 
> [...]

Here is the summary with links:
  - [1/5] riscv: dts: renesas: r9a07g043f: Add L2 cache node
    (no matching commit)
  - [2/5] riscv: dts: renesas: r9a07g043f: Add dma-noncoherent property
    (no matching commit)
  - [3/5] riscv: dts: renesas: rzfive-smarc: Enable the blocks which were explicitly disabled
    (no matching commit)
  - [4/5] riscv: dts: renesas: rzfive-smarc: Drop dma properties from SSI1 node
    (no matching commit)
  - [5/5] riscv: configs: defconfig: Enable configs required for RZ/Five SoC
    https://git.kernel.org/riscv/c/db38228c03d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
