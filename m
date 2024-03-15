Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B6BC54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5C4dYVb0GuIBXiRAlXthiFiZnm4zqXZ+vYcLKyWJcw=; b=dsd2SvI7/XVaeb
	H4e5kioqx1kDcfFy1J8SYNyoePNjMU1pODC8obD0zg2mUOJ5lExIf38H2uIi4A91f23utLFVy9nAm
	+///fSO1dP+WQAx4wSv/Sj3U32WSE6ChBdBHK8gwi1uIO6+zul8jl+1QX1eyQ1o7ZoFBgN8FheCnm
	M7b0D/aufm3WO4IhXbv0NrT4TBubP3k8EQSsu/MS4EDODfdiiCw8Lm7Ktbew2tlJcsFqpdJMroQPq
	zm+XZ+7mJOqeOKjlbSWOXllAO5afMOyt9OT3YfV/3JkPPdOZKze6blEJ3g5rVPKT+OQtfJcLNg4xN
	YRbJqbLBv4PKvq7yS/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlB4o-00000000x4Z-1DyM;
	Fri, 15 Mar 2024 17:10:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlB4k-00000000x3Y-3DDW
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 17:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58E32CE1ED5;
	Fri, 15 Mar 2024 17:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96D2FC43394;
	Fri, 15 Mar 2024 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710522629;
	bh=IcN0xBYoNPMuv5kaV1A3idubvfeUPGuxppadM5+B6x8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ONxLMrvpedR+S5leND6Vlc5GR6gkvaZAJalaSuPV8/RkUkzDL4Svuu+LhmTc/dQ8+
	 nZuSa1ioQpQuse0AErwI+XEK4tVMMcQbq/j6/0fNULHBIRsRqKd8BIlsqE0JG2LlIi
	 4QyGOqzfFIztNb9ieh7JQyV/brRkFPQhPzh41xlSfAChQpf4Be0QGJc/UJBmgYnNqg
	 raUEjhE+rOOn5Gj+9HTXaVxbwMf87CYtUnxOBqgA40yw/r4RkAeR1bfKAtA8UwoeRI
	 Afe+ORMlx6WrqVM00P1EyRAxzcHyw/KDKmiW2NtTLlezedmfk05Odh/e0ej1+r2f9y
	 CX9xXvNSQnjpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87CE4D95053;
	Fri, 15 Mar 2024 17:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix compilation error with FAST_GUP and rv32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171052262955.24036.17671900983651280481.git-patchwork-notify@kernel.org>
Date: Fri, 15 Mar 2024 17:10:29 +0000
References: <20240304080247.387710-1-alexghiti@rivosinc.com>
In-Reply-To: <20240304080247.387710-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rdunlap@infradead.org,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_101035_001767_8A5069B0 
X-CRM114-Status: UNSURE (   9.17  )
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

On Mon,  4 Mar 2024 09:02:47 +0100 you wrote:
> By surrounding the definition of pte_leaf_size() with a ifdef napot as
> it should have been.
> 
> Fixes: e0fe5ab4192c ("riscv: Fix pte_leaf_size() for NAPOT")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - riscv: Fix compilation error with FAST_GUP and rv32
    https://git.kernel.org/riscv/c/2bb7e0c49302

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
