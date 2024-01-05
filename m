Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A570C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtJE9qyYnFfJPJMvfuv1eaT7s00qnAB+HeBybGbi1R4=; b=N3r3npLPlwjEo6
	BCExk8pGpXQsgnzL07TMEsXdHHGIjGP9hQKRCwXUhCifvZhGfji1EyuLd5sfdd2DFdCMJglD2cChi
	7TF0g4O7ICPfbyp5JFpxCZEwkjBaKJTB43pEmnPBuAjw7tL5XxsJ9cqr4kWDmIBex3bYToHwaFeCL
	ZUd11g8jAWlPyShHJRRIf8BeO5THCyizlQVVA2JGvbr1MP7TbBHfCSf2uRikCQOBrYZLnB7T72odW
	qP7axulkV3fF2WF55B6BRFLgEkJGrpIsb4kPcugh55fco+8XgzU/Qhr+W6MvpxpmdEz8724rrcLV4
	diA4U2fQsJIykhG1zEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5J-000Ivl-0x;
	Fri, 05 Jan 2024 21:50:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5F-000Itk-1j
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 21:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2BF261C15;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0264DC43391;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491428;
	bh=0cyDa697mE7y/ypWbbXuofux9OpXkfhRnljZSUnQKFU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=imccL9Yq+l0GUewwUbu1PQhTD0VpfAWoPD3QD3zDowcOusnHttQbzGqFIfAn60nWD
	 mA+VsvF5JKjQbTVw0StUAqoVsdKSqwlvsP1NEz6mtScF5E9R64kAigXO46kDBCQ6v5
	 BNt6VMV4byNOQLdxa1ZtHeUQGyPu0MPn/fFXMJrh165YuUBFcENpw/vqK/rjuZAR4w
	 TNcjUSVZ7GVnVb/Y2G5qTSPikpuYlU+7JHdQ7lEVB/VVvKJKq4TBr9l5IFFaVc2hee
	 /7du33st99Q9eodtWRvQRC87t5FEHEQQUqG/50uGaX/N5ft9/imQ5MhJDLy+28lK4E
	 kK1m+9IKdRg4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0FDBDCB6FE;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Remove the removed single-letter extensions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142791.26226.15006137622943650743.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <20231110175903.2631-1-palmer@rivosinc.com>
In-Reply-To: <20231110175903.2631-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135029_617183_42C17BA4 
X-CRM114-Status: UNSURE (   8.37  )
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

On Fri, 10 Nov 2023 09:59:03 -0800 you wrote:
> There were a few single-letter extensions that we had references to
> floating around in the kernel, but that never ended up as actual ISA
> specs and have mostly been replaced by multi-letter extensions.  This
> removes the references to those extensions.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: Remove the removed single-letter extensions
    https://git.kernel.org/riscv/c/cbc911392c05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
