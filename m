Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E276C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwcBkHpOwjV6C757zHWJBT4AtDPz0vgnoe2QUPyMdS4=; b=O05/OgPbsu3Vq1
	9WU1Le1tIDnqmcfjcgPwSyqaMJxXmUjtDnDhK1HKR50aCcr0cgH+ULBPr6aEjuZnmwRbrOfuItW0t
	v4r6lX5jXk//P7TO5N37sSswOFQZapczjjYNIVseqGMrs+/AwFgKBwL4GMq9i7CvHB41agkbiCCqt
	fYZpZFaRMWN69hwImr4XwepgUZaGPGuTq0N4DytMfGF9mvgk2xBgSGHthheF6JajQTU8BHaHtoRtU
	jJPgx9o3LqYpElnwF1OgA2XahTOiJciJbPDfiVkGNDayFXUHJxl7vB5YWB756+8Fna2UgaqBE6egI
	GFG7cBw4/7pGulWQru+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEn-0000000DEZJ-3mz7;
	Thu, 04 Jul 2024 13:11:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEk-0000000DEX2-0mzc
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 13:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DE33626E8;
	Thu,  4 Jul 2024 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0D5FC4AF0B;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098656;
	bh=dlHwO2nGfEIPQRND3XuHL5U3U23kIOrurw+F13qm/ZQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=InBIbUHdpMnMo7f1ektkDLglWqxh9mBUdbKu9I8TEsJvLdwk1i5Boy8crJvO30KXJ
	 b7LxBNJTKdxW6HEb0Wm3eGokL6O8gDR/fnw7iraRCRofIXZP93T5FJ1kipm67ktLkb
	 pFMTBZk9ZoAowQ7AcjjfFupZwW3nN5qqzFXIbcJtLLCdN86pmls3mRsblbUqRHDivD
	 mAbTQLzqSmAmP4WYyZ1DXo2CYtdtIXitJdFeXmiYaNRJqH5rff0YtQr4Lo87EpwVRa
	 HeqWLQvqYHmOIqgsJrPG05Bo0ARM9a36Uz0n2prZJzBn1Ie/TehuDgn05k6Fjvify+
	 pkyZbQVJNcfZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B246CC43612;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172009865672.17306.10078143988695346844.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
References: <20240618145820.62112-1-puranjay@kernel.org>
In-Reply-To: <20240618145820.62112-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 dev.mbstr@gmail.com, linux-kernel@vger.kernel.org, puranjay12@gmail.com,
 rostedt@goodmis.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_061058_314318_746D1B5C 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, 18 Jun 2024 14:58:20 +0000 you wrote:
> ftrace_graph_ret_addr() takes an `idx` integer pointer that is used to
> optimize the stack unwinding. Pass it a valid pointer to utilize the
> optimizations that might be available in the future.
> 
> The commit is making riscv's usage of ftrace_graph_ret_addr() match
> x86_64.
> 
> [...]

Here is the summary with links:
  - riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
    https://git.kernel.org/riscv/c/393da6cbb2ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
