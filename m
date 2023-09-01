Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F68BCA0FEB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QRubJwlmCd/Vx+5at0CtcuG4FOh3wx6geiS1EPIKCQ=; b=bG/EFFBMhSZPvq
	TxDylptzLiJVZXbEuvYHCzwgNXNV8GyKHuqb6YFS1EupzqFluzJj90mxNrHFbKDLcqb+gMTAw9Evb
	jz2jkGzI7uB7MYuYSycHsMvyUIkXTUJjcT0RYqEYpjydkum5X7UMgD7ge+/ERsteeEFaI1sR0kZyT
	GqbNQQESP0aqobC9OBdL9a8TXpNWsI8DQi5ECFc+hnC3x9b3V19IB17lmy2R+qkj23bMRzVmQgWk8
	eTBc5uIdM2tegZ1vi1/gxtpbZvzfGCz6cdKNsqPx1DncioyzptGhSezBXjEpECmT2MDssgrJMT2ZP
	M6eTc1zKv/GpNxL3AM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xV-000A2Y-1d;
	Fri, 01 Sep 2023 16:25:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xS-000A0e-1e
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 16:25:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25812616C2;
	Fri,  1 Sep 2023 16:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A218C433C7;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=UsrWWuGhBsfObaHsj8jo58OGQiK1tUZL0wJ+nLLR09w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D2IwhzH6BD7FOaUUtbnoy/8AckypdF8yx4e5QoAr1iDtDWR2fHUdhO2LE4wGGxvws
	 Gaf/CNiJe0bNBnXLe72e4qk2xwigJXT5U1t7icHwGOdOxIjinRLiqxyB+lgRjYhgem
	 Vi/vKbZNN6yP+Xm7+d9Z+Gg/j/VcAJ4AUVhgTPTHSHtgI9Ejv1t928vNhvIPRISP1E
	 n9xgvFCx7ifK8U1nGjPeaYrwk323HRSDT+REKySdlmqR/R5pJRcgWK6oPnel2OnZGd
	 WlL/ZOmszjlVfWdNhAwh4JAeRLP00wia+Nx3a+ykamnx0p2EA4fVA7VRSvIv032Rae
	 ZpfaJpwENV9/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D709E29F3C;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/3] Documentation: arm: Add bootargs to the table of added
 DT parameters
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169358551543.8276.13081700534673063288.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <20230817130734.10387-1-alexghiti@rivosinc.com>
In-Reply-To: <20230817130734.10387-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_092518_595642_E3AFF0D2 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: aou@eecs.berkeley.edu, corbet@lwn.net, atishp@rivosinc.com, rdunlap@infradead.org, linux-doc@vger.kernel.org, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Jonathan Corbet <corbet@lwn.net>:

On Thu, 17 Aug 2023 15:07:32 +0200 you wrote:
> The bootargs node is also added by the EFI stub in the function
> update_fdt(), so add it to the table.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
> 
> [...]

Here is the summary with links:
  - [v7,1/3] Documentation: arm: Add bootargs to the table of added DT parameters
    https://git.kernel.org/riscv/c/b4ba5e5eafad
  - [v7,2/3] Documentation: riscv: Add early boot document
    https://git.kernel.org/riscv/c/e79be4bea58f
  - [v7,3/3] Documentation: riscv: Update boot image header since EFI stub is supported
    https://git.kernel.org/riscv/c/180bb41d61b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
