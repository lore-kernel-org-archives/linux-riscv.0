Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01461C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Li8GX0urWL98kxJVjON5sL5KJrjGtDscOdsnGRtkWg=; b=MFOBiry1oBxw9G
	80SSUx/q7MuoNl2FX46YyIJYyo3rTDds8j6o1qNtqXwp+U1YvE4xZL9hJQ8FR1sMpVXF3s6SizoWi
	0nPRCW09bLUg9yFH4K0OPs7aoMpW7FU1WzOqxpkAsXzIKBn+7iYaRKkZGCL+nlGRaolpxge0P8y32
	tzOArhqwuDtE2e3w1FPu967HvOsu1zLHeO8J3lLdAFA/qwyCrS3tY0hWEqUS/nLSAMNUNeg/UrsDu
	ob35yTXBDcMxGrS3dtPImlDTP5XsD+Oz3BScXv39WY3wjPaB1oe6I/K7bPEjOMlzW6E0h8vmRlAsb
	v5xTCTvT6GM5UKHQwnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKkNi-008JvF-4R; Wed, 25 Jan 2023 18:20:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKkNf-008Jur-MN
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 18:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4ED15B81B41;
	Wed, 25 Jan 2023 18:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02891C4339C;
	Wed, 25 Jan 2023 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674670817;
	bh=O7NW1qzcvc7518X7Nz3EHWkjaBzP1VAAR59iPu7PRto=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hMDniqmzw2Vh2kAKkpHqElF/TedbZbcR90WhE2qZ5DxRhy1ZxzbjaHDd0aFI+2bFk
	 Krd5roNCa2GzghZ/9SDD/MPwm/BKYxD7kbMRW/uokWVSlSp7DrbF5dOdE3X9HF5BwP
	 pnuQHVoQUkllnQS9HTn/AlYNuLZKssUa1ZM4aWkSasmGTxOhTUv3JdvIHjTGpmaO2q
	 PP99uTFB6lmj0NCQjklWkGJuIhTtUsjISFCCF3MmhQsiTbUzOKpofNTXFlj7Qcf1hB
	 xhbTrZ51YWjadNcV5ImZyZvRUtj3XTE1+5q/qHMo4H2aNlnv4dcw946PoU+jVGd5Oq
	 WBWE8h/9UEPtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFDD5F83ED0;
	Wed, 25 Jan 2023 18:20:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Move call to init_cpu_topology() to later
 initialization stage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167467081691.5568.11613849837435850604.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 18:20:16 +0000
References: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
In-Reply-To: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, lftan.linux@gmail.com,
 conor.dooley@microchip.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_102019_923454_BD70AE73 
X-CRM114-Status: GOOD (  11.09  )
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

On Thu, 5 Jan 2023 11:37:05 +0800 you wrote:
> If "capacity-dmips-mhz" is present in a CPU DT node,
> topology_parse_cpu_capacity() will fail to allocate memory.
> ARM64, with which this code path is shared, does not call
> topology_parse_cpu_capacity() until later in boot where memory allocation
> is available.
> 
> Move init_cpu_topology(), which calls topology_parse_cpu_capacity(), to a
> later initialization stage, to match ARM64.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Move call to init_cpu_topology() to later initialization stage
    https://git.kernel.org/riscv/c/c1d610586946

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
