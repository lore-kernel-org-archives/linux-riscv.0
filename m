Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D34C369A0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LVFjsoPE1AYyn5bT2WZkigrH4KOALNg0L1sBxZcfoY=; b=oGVChy6xYkMYZZ
	EXPO4CgDleZfDQZDfDXWaPMRKnSpTrtnx3mCQk2sQCKeDGExB1yefJBQ3b/f4RoI1JLiZeYPR2FPj
	Nwk8etTenmgRuT4GmTkbkTpk13uh3t4zsR5ZR3dlh7bSzWpyZFtzdbVwIak0cxGffIHhTnzghAb/V
	UjDV7N7jmKCocIt4tyxpvvYqwompHHxsblnYfcl59GJb7yaYIxpbWR7VqDaQs+O/KQcjUMLiGKFdR
	yRC1FikHIWufchFMY06rhZ7YaxViTW+cK1SG/W8r3meYSS7C9EP5bgFJJeWLkQW8FD8X4dRQmuOjZ
	a8SED1SYu64EvRGwqFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIY-00000009LGS-0XmX;
	Thu, 03 Apr 2025 16:20:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIT-00000009LCZ-2mzy
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 987FF44599;
	Thu,  3 Apr 2025 16:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F62C4CEE8;
	Thu,  3 Apr 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697205;
	bh=X5qNhLTsA4T9nteiRBiBeKwbYjMtn6kSffRtG36LJb4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wjy0pxfKBKMXqs2RbhiIcVi3a9Uisr+gB7uOvSbcs99DnZtdbLPJlLl2buiAVjDwO
	 UXC2vQ+Wgqc12Y7QA2kNZ1tSTrtVT1tachPPIXhwDlLzPLtRFbeZa9AAiRU4yI442A
	 We0JIJycDfkB9wO29B6iQHeGAVUKFRtdGJGZN2NLhEa1fsCEZwlghatDccqouBCo/p
	 rQjj+zYOv8lTeAu7dzN3K/TJv0Jru8u6aK0xNgBJLPS+kD8iCMGVrrupiGTK0hnllp
	 fNmYp1A9srQe5Fpi4PXUs0Bb3Tt16Dgphs0VPM1srx1nK3k7qEodEM1iczF/I4W2a0
	 1HoV2rXlC58Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE3380664C;
	Thu,  3 Apr 2025 16:20:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: print hartid on bringup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369724199.2563936.8945479042100583382.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:41 +0000
References: <20250303083424.14309-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250303083424.14309-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 atishp@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com, alexghiti@rivosinc.com,
 jassisinghbrar@gmail.com, takakura@valinux.co.jp,
 valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com,
 charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com,
 andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_092005_741865_F4501FA3 
X-CRM114-Status: UNSURE (   7.16  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon,  3 Mar 2025 16:34:24 +0800 you wrote:
> Firmware randomly releases cores, so CPU numbers don't linearly map
> to hartids. When the system has an exception, we care more about hartids.
> Adding "dyndbg="file smpboot.c +p" loglevel=8" to the cmdline can output
> the hartid.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: print hartid on bringup
    https://git.kernel.org/riscv/c/a3313375e88e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
