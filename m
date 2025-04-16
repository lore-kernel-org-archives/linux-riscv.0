Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7AFC369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/SHjNrBf55VFSP3SjCha9DhFANYQOD7Twcz58OJWo0=; b=RdhXadu43o/f4r
	LoItmhPeBKo3WNPyTLE+AYZ3nFRuq1tc27yOCEomM3btZtYUCMRTwRivymY4bNDX4BW1JGgXZTDx8
	3F+UKn1fS6bdYKRetGDwzUGNAkF7+MLVNXOi2fUJ4FO9PgF7VeHgieQfKzSfvBfDU81mg58dpqeCe
	wVNViAP5gLidBPkwcjvv4nS+UFA3XHIor+JZSJXem+VqCkF6Q0sapzRHPynfcRDJcI74fx+UuX43j
	vElRs1EtO/qYSPyqWfq5nAVNe7QWiiMAZeOmPv10thQXjqguba39M+mn67O1BFWLbapl3JhVHseee
	ZmExUN4OVXZdqOdEzUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54bu-0000000A3ht-1BIy;
	Wed, 16 Apr 2025 15:23:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53ma-00000009ty8-0vC2
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 14:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 734EB61567;
	Wed, 16 Apr 2025 14:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8CCC4CEE2;
	Wed, 16 Apr 2025 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744813831;
	bh=HTXIiaPqxAY9Ro5nZpL9rj6diNfyeydNoh0/6NKpZw4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kp/kcPj7YeWKGXWQpbfQZGQ4vT80TJo9Sbx71wkSZ7cIlrVt/q48WZhQUCAJQCur/
	 2wZ/aXFhxfd4R41Odh4epb9b1p4OF2P2kc/S6iU8ttKbAYUK3VEOZOCqSqOSyZeLgz
	 f3gClI5NQAswNDZhUHWRXHoJk+Xq4P69lYVOLTM4mCIjgJhUQ1BTdG4KtZEp83oeYc
	 u2v2F5iA/f6KiZyh2V6qU3sd6NudWeupK8WRAc0302k9LWO4PfvNfA61Ex3cyj1fB6
	 zaxCyrsNiHW+4uuvQQHtoobshaxwq2MdVHr5J+9Z3g6vG96DCBwoULueCjolLms0zj
	 WsOB8MuGdVMNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D0E3822D27;
	Wed, 16 Apr 2025 14:31:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174481386901.3385191.15884470264391337876.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 14:31:09 +0000
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, ldv@strace.io, kees@kernel.org,
 linux-kernel@vger.kernel.org
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

On Wed, 09 Apr 2025 14:24:46 -0700 you wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
> 
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> [...]

Here is the summary with links:
  - riscv: Avoid fortify warning in syscall_get_arguments()
    https://git.kernel.org/riscv/c/adf53771a312

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
