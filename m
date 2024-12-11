Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F067E77184
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=on++HCqruFX5UZ9Od5GKgUEypncxMI0u5RVUAByvbDo=; b=YM4AYGmtS00L2a
	/XENWVqKgScimETx9eFmmdWsSlKx9r/qRYt2xmucHlXVVDo1OZdJNwKpY1Ey3SrXYYjg5XpAkdJ+r
	V6GklvgpG56Vy45HPHQPAf6icsVnFVI4SI5PMzo65rBU0rb+qdV7Y+3RmTIOvfq312StGFc1RK9pg
	yN35oaNVaSlp8LgozSk8ZKf3c9xXIqdCGPxt/MWazhw0EVzQnZDJtOdsjT7GY7kpjkZLeIIxNz110
	P/vHs/3HuhT6M2cpwAFCzuFwsuRmP2rKkH/jvgDrUw2cPdoE0gTNPMbxcSH5/2Msw7PDmZ/piI9Fs
	gnTW2GYtJf90Jg0trtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGs-0000000GLET-0vjD;
	Wed, 11 Dec 2024 22:33:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFm-0000000GKOl-2GCK
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8865EA41D93;
	Wed, 11 Dec 2024 22:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EE4C4CEE0;
	Wed, 11 Dec 2024 22:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956341;
	bh=4jV9okJoQ2ZRLdjtsTKHiCVBI+vSPd5zBDLlSBJliVE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TWkkb8OkrqubtnJxHvbNT9WqC99iA6rKzDtPnVl91aKhFXFwU+tgMsgZ400K1BjJz
	 +4puyHviFEvtYfbj+9HEgo48qJotV594GhqUnj+pt8xeUw/ePZqqTc1Hgkwps2jCti
	 AdFgkN9qS8r82/bczZaq6QPx+97vQlZ6O0rK9KYp788k7YgPrVY5Op39OsnsQAZPtf
	 p04pypWM0aZHSfULdERX4WAFpioBtOzAA8uqAYGLz+pbAKkMy89ObaA/3ERR+nyph8
	 Wd8rQ/3yIj5wAjCmw3cXGy0z3N3roSmsozd7vUZVH7jp+xsfIuUfWH+41uWwI0DhDp
	 mCt7VMeUraHfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB048380A965;
	Wed, 11 Dec 2024 22:32:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] riscv: add PREEMPT_LAZY support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635753.1729195.5240376576405200812.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:37 +0000
References: <20241010122545.7N_x3GuX@linutronix.de>
In-Reply-To: <20241010122545.7N_x3GuX@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@kernel.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 ankur.a.arora@oracle.com, efault@gmx.de, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, jszhang@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143222_659648_B10BE255 
X-CRM114-Status: UNSURE (   8.13  )
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
by Peter Zijlstra <peterz@infradead.org>:

On Thu, 10 Oct 2024 14:25:45 +0200 you wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> riscv has switched to GENERIC_ENTRY, so adding PREEMPT_LAZY is as simple
> as adding TIF_NEED_RESCHED_LAZY related definitions and enabling
> ARCH_HAS_PREEMPT_LAZY.
> 
> [bigeasy: Replace old PREEMPT_AUTO bits with new PREEMPT_LAZY ]
> 
> [...]

Here is the summary with links:
  - [v2,3/3] riscv: add PREEMPT_LAZY support
    https://git.kernel.org/riscv/c/22aaec357c1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
