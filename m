Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB48C52CD8
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ams/Clvy0j8yDE8MJjYZiJHbEJdYKlp0P2RErChInWM=; b=UmXlrJ76Gv6DQD
	qSMIgo4SP1hasN6frawTOc/eM1wjGnnqRi1maItIg2KHjmsqRPN5iE4JHOSW2slJW1CgUZc7bHefX
	YOA6N/0qKZP4vM9b0N1LHYKHXmIpvJFnEfx/C/MQQJBAdgy4n9e4bVudS/hmBqY5cZJfK/6IxYGiv
	EGEz2rAeQwdDpL1csmSTQGGt9FaRbZMjgNbpDorahOdv2UbwqLAWGfEpX884K3FTrFCyl47EkY5AD
	EgbSKlS/9fUQjfnJKrTcRbt3YFwby+fd9TrJUQticX8bGAwvfHufMdqGcjx8I6nbwbhQ0vu0wGvRJ
	dgpQCCClA9lcWv2AnlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOm-000000012ou-3Ntk;
	Thu, 25 Jul 2024 13:20:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOf-000000012is-406j
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 164B8CE136C;
	Thu, 25 Jul 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DCD2C4AF0C;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=WAxeB6xNpDOJhk2GtvF3lDer+9cUbsR1XhVgScJOEaQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T6DUOhBpOSV58MvhGNSkQh/NCeOp04CvO3vLRRO5e39aRRvPY+YWBmEK2NbHkLbLU
	 PgbDAS3On4M2FcbHAfeOqsstMgmCJ56Vr+ae+niaumiO0955+dt38qDUxI6k6f7acE
	 ItmwZG/XsMrgordwf1jNxvEh5DABQMfiydai3flYhJDiQKL5949MS9Tf/3GMNjd54h
	 3QpbRkQBvuxGMZz8cSTE8eZYjCRvd66wmkW8QxPKgutIwXY+pRxna0ieC6Vni7mv3y
	 goQfyh9OtKfo7ZJv9bzSLpNOrBFjlKYjGv/wYVhjrAvIWzyTCudBsryXj6EiOjCU07
	 iNRqP5eB4eb7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1ADD1C4333D;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] RISC-V: Provide the frequency of time CSR via hwprobe
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363910.6240.3368503310574547091.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240702033731.71955-2-cuiyunhui@bytedance.com>
In-Reply-To: <20240702033731.71955-2-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062042_197971_5AAFCA53 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: costa.shul@redhat.com, aou@eecs.berkeley.edu, samitolvanen@google.com, corbet@lwn.net, anup@brainfault.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jesse@rivosinc.com, conor.dooley@microchip.com, palmer@dabbelt.com, palmer@rivosinc.com, andy.chiu@sifive.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, cleger@rivosinc.com, linux-riscv@lists.infradead.org, jrtc27@jrtc27.com, evan@rivosinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  2 Jul 2024 11:37:31 +0800 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The RISC-V architecture makes a real time counter CSR (via RDTIME
> instruction) available for applications in U-mode but there is no
> architected mechanism for an application to discover the frequency
> the counter is running at. Some applications (e.g., DPDK) use the
> time counter for basic performance analysis as well as fine grained
> time-keeping.
> 
> [...]

Here is the summary with links:
  - [v4] RISC-V: Provide the frequency of time CSR via hwprobe
    https://git.kernel.org/riscv/c/2709e400c2e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
