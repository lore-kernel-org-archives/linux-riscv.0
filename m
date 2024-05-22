Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F28FC25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFUqVB5Tiu5uD7j1n1niSEO3WyZhra9gRhE0lo4EHwU=; b=jrLofpIKj9yrts
	521uRpFrrscL6jmQhMGKRBtuadIoMz7Ol6VEIxgUwh0rVf7aJY3hJav4LoKjusznX9vdmLRaXlLcO
	g6aBsI+bfTTHkJO/BPS6nXCKdIVt/3+7unK5WHz99YvUaI7DPxCam4EqaxXlDZ1udtBhfrYXawOf7
	OH5/ZbcAJ1vlvUc4TLbjD5JDbH5u695PHS1HNK6y3UxmSsx9MwJz1Uwj+Qnn97oYPOkXc0++IKKy3
	i3nsKYZ1FWrJDLU1uDxea0Wp+j/BZveJ4y1FpCCnVtDNUBDyIMdJO7dBvTFnwSOJbkFhzo2RaWs5C
	YSUhLcFF9BCSYwfGKvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vka-00000004VVp-0ThT;
	Wed, 22 May 2024 23:52:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkM-00000004VMv-3F22
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4367ACE11E3;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E10EC32781;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=twsR8G5WscdioqUmw9Xs22RKtQ4/tW93gBPGJtFfYeg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S/Re7Mcmf44ueE641qccxRstYMzUWUuLPF6G6uAihMTBn8k6uC8HXzNMOeVTxJLXr
	 57ZSUx8tMD8oL8OH5yaO6fWkLlCcpyMg2J7h05jZF+MxFQZV4F8oV8YOVOiwcqi2Cx
	 uq64ewRhX5oZg/Ac4FdduTh/SBcSFf14lQD4fvtaKfUNd+bUXaAUKEtLGdHzTPbmBX
	 D85/yR8ZD9I5FEUrSlbknVz2BOR55UBRr+Q6BG+lcT6TFNMS7MGCVHyuObyBujs0ru
	 BlFA/LVO0xgFBIdNQy//4zTL6s13+BKA/Fqs2j+9P86nFc5baicTdBiiqKgTWUQNzh
	 MDiSasTEpCBcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 790BDC4361A;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: selftests: Add hwprobe binaries to .gitignore
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190748.9409.11788212835891535911.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
In-Reply-To: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ajones@ventanamicro.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165151_103491_D1043E8E 
X-CRM114-Status: UNSURE (   8.14  )
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

On Thu, 25 Apr 2024 12:58:03 -0700 you wrote:
> The cbo and which-cpu hwprobe selftests leave their artifacts in the
> kernel tree and end up being tracked by git. Add the binaries to the
> hwprobe selftest .gitignore so this no longer happens.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> Fixes: ef7d6abb2cf5 ("RISC-V: selftests: Add which-cpus hwprobe test")
> 
> [...]

Here is the summary with links:
  - riscv: selftests: Add hwprobe binaries to .gitignore
    https://git.kernel.org/riscv/c/b1f4ad94cd12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
