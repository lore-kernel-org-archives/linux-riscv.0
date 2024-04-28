Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE3C25B4F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LuCfUxdL/my1oT4jTJ82LoWgFSInd6TWrkTDyd3EmU=; b=BjBdZEpVJ8purG
	1qPvueiARZBZJmbYIm153OD/by7n7SU+Pr/sXu/Qyz1FDNNuA6XEmNsH/JRszzI9d13xmH7sEhooy
	O3xNG7mcteeq8fWnS1jKIl57Ktmtr7DTfGh9rIeGQOJpXK/w71Oimiq/K/5S3E+fniOfkkYrgvq2k
	mFw+MFtAgF45XgTjTPSTHB/GT0KWq9Uc6EbKTDiFAx0RXZJ/DSMlYKqChQMEvfg9zSqa9D33TZeoy
	gFIXN8j/nODLY5yy4IVx5Hz6BHqdf1PrvEw7TU88fhEpKX2R47rnwX1EBdC7jVwk9qTjOoHVbSktA
	1/ayeX9abj1Tgjq0zhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZj-00000000np1-3uo7;
	Sun, 28 Apr 2024 22:00:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZa-00000000nkg-2o6G
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25BC16090B;
	Sun, 28 Apr 2024 22:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B635C4AF4D;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341635;
	bh=hvDaSGrdUfrxihrtEy8f7ZRBMYbrTI8GonchTutnack=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uCkCXnmI4MTKNlX+GeicRK53ttSjQCUQ/uM+AYE3MgiN/PJMWaE42g9J+Rb+4zW7P
	 auUxs1C72m5ezXgMdgaAzEEhvrnC8+M+3mRToUvljeFOS5ZwpnZkM2CPJRdCsuAnks
	 8Y6XntuKf2ZkC9zdpHqc6QnqugRPZyJw1PPPdlMuzmtLBhasral9GLDvwPPDQbVgEX
	 P+iLu62rfa3KvSTVVW21970E8c6yH6nr5fMxHZ58mrDGHFW5wrAvW8P3fr5BK8PZ3/
	 wwmv/0a7wHF0h02wz62CwUHBU9QqCZzTEUze2FrktXtL0CszMjgcOrp61gIPCB7IJW
	 LeS2CKq+NrQWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0142BC43614;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: fix patching with IPI
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163499.22130.13571396411882252090.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
In-Reply-To: <20240229121056.203419-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andrea@rivosinc.com,
 samuel.holland@sifive.com, anup@brainfault.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150038_781993_338804BF 
X-CRM114-Status: UNSURE (   9.77  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 29 Feb 2024 13:10:54 +0100 you wrote:
> patch 1 removes a useless memory barrier and patch 2 actually fixes the
> issue with IPI in the patching code.
> 
> Changes in v3:
> - Remove wrong cleanup as noted by Samuel
> - Enhance comment about usage of release semantics as suggested by
>   Andrea
> - Add RBs from Andrea
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: Remove superfluous smp_mb()
    https://git.kernel.org/riscv/c/29cee75fb66e
  - [v3,2/2] riscv: Fix text patching when IPI are used
    https://git.kernel.org/riscv/c/c97bf629963e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
