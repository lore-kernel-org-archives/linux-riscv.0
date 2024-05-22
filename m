Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772E1C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgVdGJgnUWnztNK7ZMCD68J6GNwrGxIFiZzAwLZ2wlY=; b=ryc9I+zKd6VzzV
	G1fyJl6tvS0CWqp5JcNYI4Wmfn3LyoYt6AhdpkRr1BJYWAm/APKYSDndmi9hMvGUIwJZex86j6zjF
	UujrVzIUauoEyE2szugWEMIm0yKkg2ZGPruA/HNRdsLCNsnG2JEuCQy9lIhk59LhW4z6bkqB2eYy3
	qXhCJC8SAM7mOQeHuhnqvCAxkcsfFAmCKAT2Zx80cP1q6dkFaFuefH9gq+4TS3TLQhgiHDmiYbCNQ
	ZzHrODaP9ERmoCgnS3Y/pcfNfRsHlW8mLk+l3Nk8up6stqEs1x2rCSXOlArCNEhyNNn1rj2OEICDK
	96pNs3lwfgDNXkHYLfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkV-00000004VSx-0u4Y;
	Wed, 22 May 2024 23:52:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkL-00000004VMd-3Eqt
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E23462BFE;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B399FC4AF08;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=TDaB1nKc+MxBvpO+Za9PJH0cIp+1S891erTFOL0RME0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D+rwHtvCdJh9jv2oAUness9TQVv+cysyk/nNly+t/EoeeHAhLstDeY5ELWWJunzbS
	 bT9X8seWwsieQw4inJczsbHHHT9Aap9ZpIj3KmsqVSAVvrwUXFnw+v7ZOQ4Ln3swYL
	 qs/pJrd4YZmqgkwi3HiTe7C/8FgDu57XnSfKI6gFkrGOrp16Qg0geYm15wMcq5FMVL
	 YAtvpxmxDMYFF3FBPpwPuCumgaZJaJwKqjllc5pC//MdgqsPZEviF00iP5WFoBriSv
	 P/fTgnI4SwXytPaA8cW5bfQqFaz43YtIBhG+ucoVqCYe4C0T4h1j+3rGasi5o+wi99
	 UwldgHMC+O42Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1C43C43619;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: selftests: Add signal handling vector tests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190765.9409.15264560939296767259.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
In-Reply-To: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 andy.chiu@sifive.com, bjorn@kernel.org, vineetg@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165149_885731_6A2B7B11 
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 03 Apr 2024 16:50:29 -0700 you wrote:
> Add two tests to check vector save/restore when a signal is received
> during a vector routine. One test ensures that a value is not clobbered
> during signal handling. The other verifies that vector registers
> modified in the signal handler are properly reflected when the signal
> handling is complete.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: selftests: Add signal handling vector tests
    https://git.kernel.org/riscv/c/b2a2e892cdbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
