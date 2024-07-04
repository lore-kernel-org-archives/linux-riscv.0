Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A442C38150
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 13:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYJ4O0S5yuyeJzXyDFfYsXc+xqA6KoZBYYcDvmExERs=; b=p963wTppyoGpb1
	O47d2iZ+P9YqmSC1+wqUQXlm+LylZ4XHCXPVns6ZYghnF5D01bv9yLe31dL59/9iBp9BkrURpVYC4
	vyCzb7y2d7g/WFIKPVQkxoZdRoY7y+JlKJooblZxDHtd+JPVu7BJDE0ajAIQEdo1T+ZxOlUUxJNvr
	WQ70GVdJkLceRD0JNj2xbQ9m71zCzoCBD0iRACVIXFY2ROxDmdALrW9adfpJKZbWK9hEM+YGk0Hg7
	UzadZuvxDx8eupbaGWRju2rQzvW1FO+KVmms/zfIToNeV7pW62NJO2fu814cN0iQRG7h34SVObZkl
	xMSgtDimuBJICWD85TCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMF0-0000000DEfA-2BBS;
	Thu, 04 Jul 2024 13:11:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEk-0000000DEX5-1koq
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 13:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6716D626EB;
	Thu,  4 Jul 2024 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6BDBC4AF0D;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098656;
	bh=LgXnJFsYyRvjaEK1ntPm88fL7Wm+lyk5mTRJwn5WJdg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=paZrJQyAWMUf3S9qd1u1maQM6otdP/Ej229Xc/6APRWTyHd9CYXxmXvkow2LijCvB
	 xwXJUdLqcAM6e00HmrI8z+OpimD6hTFvVEQ2QH1kMmDAvuR/kVpGGWbvXObh28F4I+
	 HngTCDSU9HlYOh4j1BNg4tVHE8By8lZGQkdhD2D9kFmv0YmdWK6Pqa0NM8Cww2vFsU
	 LB+IwQVV4liBIt9A2TiXD3dOgmaSNr+06FKfTZzPS0wgDGCVlBraKVRjKLSN9WHybI
	 b/TqoPHrOYhLEirInV5azf06QiqZ41gVT0NKy4j6iRFwNg49nHpvTH4IxSJ+FgwVtI
	 MlPMDBOyElgBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4DE3C43614;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: selftests: Fix vsetivli args for clang
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172009865679.17306.1065674073385433619.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
References: <20240702-fix_sigreturn_test-v1-1-485f88a80612@rivosinc.com>
In-Reply-To: <20240702-fix_sigreturn_test-v1-1-485f88a80612@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, andy.chiu@sifive.com, bjorn@rivosinc.com,
 palmer@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_061058_545209_9D9033F1 
X-CRM114-Status: UNSURE (   8.41  )
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

On Tue, 02 Jul 2024 18:54:48 -0700 you wrote:
> Clang does not support implicit LMUL in the vset* instruction sequences.
> Introduce an explicit LMUL in the vsetivli instruction.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 9d5328eeb185 ("riscv: selftests: Add signal handling vector tests")
> ---
> There is one more error that occurs when the test cases for riscv are
> compiled with llvm:
> 
> [...]

Here is the summary with links:
  - riscv: selftests: Fix vsetivli args for clang
    https://git.kernel.org/riscv/c/3582ce0d7ccf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
