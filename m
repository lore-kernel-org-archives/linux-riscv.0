Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9947C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5Nd9iES5g2E1Ug9ktt94V+utXRg4a7LxMc/Gwz89n4=; b=ExfOtHoJ3pjcd7
	EhWc8Z51KkqqO3Awa60YPZwdS0jAXJY+hYu5kh5K2xRB3QZqaZ4OIuUumq34uYO3ejYraHK4oNxSL
	33E4GgH845kdjlrsntaZhyauLsFXnsGd33jGE1Pa5yptDCqUG8da5gobIgabruvCPNkhBbTul92Zr
	Xsd5Pzs4exsAfxr46JiJSwnEIfnpUbVGF8TdNRHnp9wBqmmXR3RnKGuyveE9hs/1d5r6dLuOM0I5A
	KVjUCcs5TlwjK7sg7PX0RGbht2VcW32vouCRSeLBlJmZh6iWN+RwbT/LUN9/XvtTKwzLC/JtboaoB
	6rr0MO584+gfmZwq9dcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkML-005CHF-2O;
	Wed, 09 Aug 2023 14:40:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMI-005CEc-0i
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B47B063C4D;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 249C1C433C7;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691592021;
	bh=i1JWSflPdqOgo9iVvVkyXxpaihCf7DdLtWvHlPRFT9k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nXtqhW3DuHCFC0CYBRT0A8Ksdmx57EAdUKTtkspK8GmQ18QMimhh8OXjQxzPrIqQC
	 aK6Iu1UFsW1iimnCd2v1iF/l1uokDItgmnayW5VTy0PA/TSxIRhItHHIvUcuN0j8oe
	 DmzI/qqH/yseJ1ZkYZgWl4zPQgIZQtj2jPkNL6bJVD4KTudcZrvXJ7gb6QGu+ASP2g
	 4D/L9+omdNEksx+UceML5emstl/+WpeYzzT3wIRQsISzgHfQkA2SblXdKCln/IjC1B
	 RUIMrxhO12Lc7ZCvS5xyAUZgTL5PTdONZQ/W3PKbTMssSRuNH2zlwdZuJ59Rbwn+Gy
	 RZTk2THWrbbGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08ACFE505D5;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix CPU feature detection with SMP disabled
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159202103.17533.11526116831336443716.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:40:21 +0000
References: <20230803012608.3540081-1-samuel.holland@sifive.com>
In-Reply-To: <20230803012608.3540081-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_074022_297639_D103DAB1 
X-CRM114-Status: UNSURE (   8.47  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  2 Aug 2023 18:26:06 -0700 you wrote:
> commit 914d6f44fc50 ("RISC-V: only iterate over possible CPUs in ISA
> string parser") changed riscv_fill_hwcap() from iterating over CPU DT
> nodes to iterating over logical CPU IDs. Since this function runs long
> before cpu_dev_init() creates CPU devices, it hits the fallback path in
> of_cpu_device_node_get(), which itself iterates over the DT nodes,
> searching for a node with the requested CPU ID. (Incidentally, this
> makes riscv_fill_hwcap() now take quadratic time.)
> 
> [...]

Here is the summary with links:
  - riscv: Fix CPU feature detection with SMP disabled
    https://git.kernel.org/riscv/c/6514f81e1bd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
