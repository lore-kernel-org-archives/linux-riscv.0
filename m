Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E62DC77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RBIzeAkJmfaZ5JHkCoekqyfJFJa00H9/GHuSoIEzc0=; b=Qo+NnhgKyLkGB6
	O4v39EV7L8zMBmEWiYlCj3wiF7uX9ErKeTKqHpiRWvSoDLGKJho4bceHYLVvMypVUT5kPR8KyWGWj
	dS98jTIl2pLd6xe+HjjR1hWHZf68e0MQnvlvEx+ExKnubEWpU4XqF0XSSe0PBARzL+oK9KK/xbjmA
	9q6s8xyOI9UAcLTRD5gfE/GB8gCMG/1Q0zWhwKI2RkXL7d1NjGc9XGdPLwowFriKQql2zZxARhZ2B
	g1FEwoGpWMPlCb066b0hdpvDaHdcKGZCjM/OBYz2aWuHOYDE37qeMIwWaWsJQhuEfb4sRf2Vib7jf
	dZV3fmaACNyMcofI7XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn86x-0081nt-1Q;
	Fri, 14 Apr 2023 01:20:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn86u-0081nI-0k
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 01:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F47862B6E;
	Fri, 14 Apr 2023 01:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B2C3C4339B;
	Fri, 14 Apr 2023 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681435218;
	bh=+mGU8LvAZW8m7fj90vpPY/gIjF8LyNG9Tk6TfIjRLj8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DLSA+HM43trQJjMeZ+5Kar1a7wrKhAsShy2AiA04YR1mhKNqwOGLO8lBuvRa/zY+Q
	 a2PS6nXlPC6LcS4Wrbko/i64qRWpOi6OZf7pHfiL0I0YlJzheyxaHT4woO0QotdJbo
	 32mhm9J+vWxjGNUQoCjOne8qhenMUeBcuMEtCJRaXypTu4VK6CpQnD/igTq4mZrxmQ
	 oWVBc2sVgfpZEJY/adMA28tRUzqyTpq0JtIzbeljD9/PD7ldfEAfZvPJtDCrvEII13
	 sLFPDpI3yReuSLfA0KYDizVbLTtMb4balB82cOGkgW4Y7CWFM/zfvkcdU3WU5lxyRL
	 tabL96NKH4eaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C328E5244F;
	Fri, 14 Apr 2023 01:20:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2 0/3] Fixes for dtb mapping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168143521837.16022.279979629741476730.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 01:20:18 +0000
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
In-Reply-To: <20230329081932.79831-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_182020_330930_B935695D 
X-CRM114-Status: GOOD (  10.64  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 29 Mar 2023 10:19:29 +0200 you wrote:
> We used to map the dtb differently between early_pg_dir and
> swapper_pg_dir which caused issues when we referenced addresses from
> the early mapping with swapper_pg_dir (reserved_mem): move the dtb mapping
> to the fixmap region in patch 1, which allows to simplify dtb handling in
> patch 2.
> 
> base-commit-tag: v6.3-rc3
> 
> [...]

Here is the summary with links:
  - [-fixes,v2,1/3] riscv: Move early dtb mapping into the fixmap region
    https://git.kernel.org/riscv/c/ef69d2559fe9
  - [-fixes,v2,2/3] riscv: Do not set initial_boot_params to the linear address of the dtb
    https://git.kernel.org/riscv/c/f1581626071c
  - [-fixes,v2,3/3] riscv: No need to relocate the dtb as it lies in the fixmap region
    https://git.kernel.org/riscv/c/1b50f956c8fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
