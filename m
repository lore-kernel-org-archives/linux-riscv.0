Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE074C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IV9E7iy7OcYeUGa0lvutwoR7GCt/8p2D/gy5Bcsyk3o=; b=IlFJ+Fc/VPo5t6
	4jcmA9Zt+XZoCoapSmarkoF3UiX7yAiFbwZeyaYeMXHra/yyAdH/LbAllYf+i8ZpEIJAXsyYHiU34
	x/glABCDuz7KPtTwb+oGkje3VdYn8CD6e2JYjUFyC9UE9q/9drXnHCHFqnuxlGvCQyxedzfv8e/4P
	8PQ8iq+/Yb48194H2yU17fANVX8R3UdpMNraVYjWg5vFAGhU12m8vNoptn9OXapmdf+U+K4NMLeJC
	0dPYN7GHliKJ17MZCFFN62H4quW32BLmHZPuyCSNlpgvsZmnq4jU6x3KOYYX4vZYh/Wm9g9p4IVZV
	6Afy7CnlA7Zh30EZW+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4w1-00000001NW2-2fby;
	Thu, 08 May 2025 17:21:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4T7-00000001K6F-0P59
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 16:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7279F436C4;
	Thu,  8 May 2025 16:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C240C4CEE7;
	Thu,  8 May 2025 16:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723092;
	bh=xT/fOiFfbEtx2E9bQX+adB6nV0zaucHTcEUzjfgMukA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Np96leWRr61I4LefGP0vjdqRdxi/864PpjzWwbwSBS6dAz49TLeUhg9bxAhHmNkXA
	 SzRufIcOHKorUv5VcCZXXoj8JHClPQFlZc0aPWuDWbdzJ01J2mWypjztnv5O+uR4h3
	 jsxue4ZyIVukRpSxh6qUyrinbT+p+tdWRTrYnainPVR778dzAfUIFyOKYv+3rLWc9z
	 sMiUmTcm7qJwgkHEwaTk/X0xFiPISw9Ynl+dnu/sOThOOwfMlJlcUY1/OEztF2PE+P
	 LKSx3gwaeANlVBJ9g0EmNMfuBvJSXZHREhg6chJOdS9tSqntz4UlM6PcXX+vxwA/SJ
	 ESqYSGEvdWJIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C9E380AA70;
	Thu,  8 May 2025 16:52:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174672313099.2976395.17884540800538496278.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:52:10 +0000
References: <20250504101920.3393053-1-namcao@linutronix.de>
In-Reply-To: <20250504101920.3393053-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_095133_150275_67B4BA59 
X-CRM114-Status: UNSURE (   7.56  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Sun,  4 May 2025 12:19:20 +0200 you wrote:
> When userspace does PR_SET_TAGGED_ADDR_CTRL, but Supm extension is not
> available, the kernel crashes:
> 
> Oops - illegal instruction [#1]
>     [snip]
> epc : set_tagged_addr_ctrl+0x112/0x15a
>  ra : set_tagged_addr_ctrl+0x74/0x15a
> epc : ffffffff80011ace ra : ffffffff80011a30 sp : ffffffc60039be10
>     [snip]
> status: 0000000200000120 badaddr: 0000000010a79073 cause: 0000000000000002
>     set_tagged_addr_ctrl+0x112/0x15a
>     __riscv_sys_prctl+0x352/0x73c
>     do_trap_ecall_u+0x17c/0x20c
>     andle_exception+0x150/0x15c
> 
> [...]

Here is the summary with links:
  - riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
    https://git.kernel.org/riscv/c/ae08d55807c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
