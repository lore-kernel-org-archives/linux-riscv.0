Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40567C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMtsC/Y6g/IOtagHH3/GsHQaGFg9z9l01o4jSAfpPuM=; b=BGZRp5mGVuOOBC
	jI0h8piX3grbOughQ0Qz6nundFCWTuIWBZXGVfcFC8QNaIDo2qOjepKgTdr7C3SA2SDC0gKrtgM8I
	ZGRuEArPwSiFltoh8ZIYaIrM0Jlt4nNP1+fXqNsKSfh3QclSmkuELxHItETM1+HKdSGVg2mzrvDPO
	0DoVCB0b/lfaxdtFuHDV6DNgKy+LBSpwLMo+D4gNqPPU5VnxmU7PblTR79DTWtOV3JYCPY1RSuAQy
	R+ROTHC0sLlnRJueA7nL4GHycjTwmxwA/Zhk+RAik1/SZSqadpzh7b3yZUKB35IPi+9fNIWB6sVNc
	03iBjOmk6co7s1g+SjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0850-0000000AXrM-0eIX;
	Thu, 25 Apr 2024 23:00:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s084w-0000000AXpe-17kj
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9652CE1B32;
	Thu, 25 Apr 2024 23:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEC90C2BBFC;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714086030;
	bh=+N6DmoP06aDTbQyZSjImtBrn5fxRTXcATT7hsLx5MZ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ALa+tN01lNaCG4pN2PdAkHFsvI9E63ZRD6zfW7q/KXLlj2VT6gHcmwV1HV4/jnI5w
	 Og48eIFPVue51ARqP8DWkgA8AinlpUI2cBSRxxYUW3uxB90iHvu/HiRDtS3yT8M9xg
	 QzPj07XC1jMWgvE0P8lGjNTsFn0dqQbNZ70JIwf2ft24miYGJ8AUKneslMoBv5RDQZ
	 CDfOk9G13fnQzrxo32uc77xiOhNKc4WjGVUZFawEtwIi/PmdUiJku5lA/K6xZk40to
	 +GlhkZdp689IlzRme2gzcCFynvNiYtNzf4jt8AcoGNSNBywO7//FURhOnhdxh3WhRO
	 FMupqqzZSQhrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD3D3C595C5;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match
 constraints, take 2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171408603070.8761.17857789787379874348.git-patchwork-notify@kernel.org>
Date: Thu, 25 Apr 2024 23:00:30 +0000
References: <20240322134728.151255-2-ajones@ventanamicro.com>
In-Reply-To: <20240322134728.151255-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com,
 woodrow.shen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_160034_509530_DD8BEFE6 
X-CRM114-Status: UNSURE (   8.19  )
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

On Fri, 22 Mar 2024 14:47:28 +0100 you wrote:
> Commit 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands
> match constraints") attempted to ensure MK_CBO() would always
> provide to a compile-time constant when given a constant, but
> cpu_to_le32() isn't necessarily going to do that. Switch to manually
> shifting the bytes, when needed, to finally get this right.
> 
> Reported-by: Woodrow Shen <woodrow.shen@sifive.com>
> Closes: https://lore.kernel.org/all/CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk+TWSpyO5xvpXpg@mail.gmail.com/
> Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> Fixes: 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands match constraints")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: selftests: cbo: Ensure asm operands match constraints, take 2
    https://git.kernel.org/riscv/c/f6b56df883d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
