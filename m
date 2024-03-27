Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68085C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5LZDZd3/dtZ9QCMELzvIjALPaRK5tiEHgaEzX+QgEs=; b=jCqA8iS8Q1uWLS
	HWJjV1DvnP3akgkoaEW2kiOUlsn6GCXZK7A1Zu6dcPie4T48ORkNot4fluTzruJTvcMAkECk5I9fn
	PW3C/jPbzJW4LJckWJLS26tgH5PLls6Djm/EZs7XeN3YtEIA2dAWT/xoO2+VQfBcUnHVGa2+8e5ix
	rMVu1PLV9XEcHrJ7dhG7fpgIb0JQLuwPtfcwi+ll36d5ZQgjvE1NwF6f5H4BSGWNbCY6hufzSM9WY
	Z32PxHuvr0Ljng91RXnmUAf7CkC1bpO7Z+s2UogiI/poz0UU5piwRHdoxDYwJ8QLfl4i5Xe9GT9k4
	GyAeMslE0U6yyFj1oRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTpZ-00000009LJb-0k7d;
	Wed, 27 Mar 2024 14:00:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTpQ-00000009LEb-2Prk
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6767BCE2643;
	Wed, 27 Mar 2024 14:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A32DEC43399;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711548029;
	bh=Tll+aW5UzZK8YuZZkR7WzGfMayybv0KNwJ35XBtg264=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iZydgAPJiAxrATGtcqgLHPbZOX6sT0pFQmn0g7mCn4hqM10pueEU7b2S2taaIm3CH
	 YSFJkpMB34qGgjVQ7l5nFqE0YAThCVWE0upVMd4HJhX2jXLYIH90qe+jigXCRAcPQt
	 VeL8cqclWL2glzQJSY0wNf2kIAuRKpAJc+xIRsdoxhX/g0fmWrY6nmcsFwiMDolP9s
	 rEPiUPY71B+P6kfDrSDO3R+ghvaMeN8sP3HMWCAI+yx5amyEMqrbX3XhjVsBjEpZH8
	 +XDzjj2zP6iRwhsuu6zZbY+YWNoU//UOEhcIyrcjY1NV3PbsVy1eMbrm+lmhTOn22+
	 t3Y1RPIZsIBvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 944D3D95070;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171154802960.9827.16527899722264043993.git-patchwork-notify@kernel.org>
Date: Wed, 27 Mar 2024 14:00:29 +0000
References: <20240326153712.1839482-2-samitolvanen@google.com>
In-Reply-To: <20240326153712.1839482-2-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, lkft@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_070032_897123_AD530789 
X-CRM114-Status: UNSURE (   6.35  )
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

On Tue, 26 Mar 2024 15:37:13 +0000 you wrote:
> Clang doesn't think ___se_sys_* functions used even though they are
> aliased to __se_sys_*, resulting in -Wunused-function warnings when
> building rv32. For example:
> 
>    mm/oom_kill.c:1195:1: warning: unused function '___se_sys_process_mrelease' [-Wunused-function]
>     1195 | SYSCALL_DEFINE2(process_mrelease, int, pidfd, unsigned int, flags)
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFINE2'
>      221 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
>          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/syscalls.h:231:2: note: expanded from macro 'SYSCALL_DEFINEx'
>      231 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/syscall_wrapper.h:81:2: note: expanded from macro '__SYSCALL_DEFINEx'
>       81 |         __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)                         \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/syscall_wrapper.h:40:14: note: expanded from macro '__SYSCALL_SE_DEFINEx'
>       40 |         static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
>          |                     ^~~~~~~~~~~~~~~~~~~~
>    <scratch space>:30:1: note: expanded from here
>       30 | ___se_sys_process_mrelease
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> [...]

Here is the summary with links:
  - riscv: Mark __se_sys_* functions __used
    https://git.kernel.org/riscv/c/653650c468be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
