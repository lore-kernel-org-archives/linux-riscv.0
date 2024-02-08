Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3532EC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDyfKMSJnEExW1oFmX+jL0cuinFFjMyU+O+Nz54xQ48=; b=HOySZjvJVgHCTd
	4grqplE7g1sxfDxaQzPvxCQaqcfCKub1jsGY+Me32efJ+tnXQ/Q3UTIWJfbEQuNVJmYTth5l41Cco
	5BuqoHlJwDCulrRec4zq9zmrnMBet/z+75p64LUi4aguEvDgV539qN8RPEY50Ip9okGtalqPJjksA
	4asBsz7mHcxpGUZqLqwiZsgv+lNzM+7Zpt/iIcSBuS6qvO0/FwNuCEbNP09JraZYSM/fKGC8tD0kw
	bSjMtn0dxP29kD+vvTFjkWvSL6MqwSYkGKz4axdHU1OW/A5kkr79VNF5GQtsZxRGC20UJd/hj2j6o
	e+N6RaXTfF8HhpJL9iFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFM-0000000COQI-2eHE;
	Thu, 08 Feb 2024 01:30:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFJ-0000000COOh-1e1t
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CEC8CE1ACC;
	Thu,  8 Feb 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B46EC43390;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707355829;
	bh=eKM7cbq2LsQtT2XrjxLN0imXBewanhEf/4QaFmByZU8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hvznHYv1RguuNuXyuqydB4E7vEKoEBRsC/cwIRjaRO4bRGijC+LiiVl17Pewsgw9G
	 5AcgCGzZSS1jOkjOQp6tZSyhqRp27C3K2euzh/qxNRfQgcd8dKeX65qRki9eTL+7CA
	 Djastyta5r6eHNnR2BtUS3HdBVB2AciD06RDrBUOhnEyDAnFrAS+NP+M32GsFZ+W3L
	 gr/wld8sPg1uupwo3sINuXxtx5TBMliMVzfAN5HQrNYpd3claiyqxQ0QIOPttYvUHP
	 aLcdMTU8oJerv5/GwFDnGvKZogT0JXmbkhXuGPGqIMg11skuo1at5XGLoWaWjBRt6w
	 kFfBgpMmitDOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D7ACD8C96E;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: declare overflow_stack as exported from traps.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170735582911.12826.14792273436491773148.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 01:30:29 +0000
References: <20231123134214.81481-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20231123134214.81481-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_173033_632296_3A4AD740 
X-CRM114-Status: UNSURE (   8.57  )
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

On Thu, 23 Nov 2023 13:42:14 +0000 you wrote:
> The percpu area overflow_stacks is exported from arch/riscv/kernel/traps.c
> for use in the entry code, but is not declared anywhere. Add the relevant
> declaration to arch/riscv/include/asm/stacktrace.h to silence the following
> sparse warning:
> 
> arch/riscv/kernel/traps.c:395:1: warning: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?
> 
> [...]

Here is the summary with links:
  - riscv: declare overflow_stack as exported from traps.c
    https://git.kernel.org/riscv/c/2cf963787529

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
