Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C52EB8FB0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G70jSaEJcok+gvvPqZIgBAHb4aJ2WqGxuXfLLFSwwjk=; b=LbjCkoiVhEGIa3
	eROKo5udQgfDmgq6/5iJR+aCnMzrsiCgMIz17s5G10rj0bxIF3CyZIAHPXTeoj/aoCDNI24Xusi7E
	PA8wY6uGobXGSyZ6D2ShTEskFWTfopXDRxATRqSrO/EP6LlFVLfq9KxuWfB+MO6rVim0b4EEqmR8U
	6cPu9ZrEKRlqo6nlZnz55sZ30wPOeURacWDPrdd7Y3LErpP4INsSDqrzfWkyMilMtxaAgHjuuWI37
	0ZdiXBNZCHdIp/Q+8mhdALlfluuwyGpQ5YQ3DvMbE+aztr7eeRxCX8QiS9Ji/TW3J0CXiitoCrXkV
	jDFphRiBLX2ln5fx6hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdici-0076Dn-0d;
	Wed, 06 Sep 2023 02:50:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdicf-0076Cu-2d
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:50:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C39E60EEE;
	Wed,  6 Sep 2023 02:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D3A5C433CB;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693968627;
	bh=30LuX3f0g4pEHuHxv4dasxqe3hauX0TBet9EsndxE/Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kvq786pQ+RfbITbEEr+TEuFR50UJEWnEEjQet3KyUriFjSApwAYhWaA8VDGU41FIv
	 Sx2xQB8qUnaiA3tOWMjMbLJA3JP2yrr23EcOBsGjSaWXS3fp4r13/Fd7MMoPBay+J1
	 hxoW65gUj0BC2pi8r+/j+Gqjf0IClE4lRAbDPSZGycaAzXKFGm0hY8QMiDYmYLc1nk
	 Ol2mmpaJzIpEB7O4bPX3zncH2HYcMj0TtK4TXQDGB08wtogQ0nuxKOMX88pIuk2j4k
	 lbprYBucpd8kQXbAs8VL4bjtcJpLeGyEAit4VQmQlDAIx2mk2ND9lqPMNYF2f/BakY
	 7NhZ5irHdEDwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83833C595D2;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] soc: renesas: Kconfig: For ARCH_R9A07G043 select the required
 configs if dependencies are met
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169396862753.1987.16610028486614506767.git-patchwork-notify@kernel.org>
Date: Wed, 06 Sep 2023 02:50:27 +0000
References: <20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, conor.dooley@microchip.com,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_195029_904495_A901F3E8 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri,  1 Sep 2023 12:09:36 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> To prevent randconfig build issues when enabling the RZ/Five SoC, consider
> selecting specific configurations only when their dependencies are
> satisfied.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met
    https://git.kernel.org/riscv/c/9e2864968816

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
