Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08950C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FcgHhgRcZtDoJqhHb6YQgzlmp1SkUIaJ/1/CGWiGdM=; b=YyijAtP3ZBjxPk
	KwmC3IuxpOM4e2bQwMvg/qdPY4kU/2ZYoqj+oHn1i8YyDO+akLC0kefujs/zQ2ngkNwq4WsdrsHml
	de31Tk14iGs9lQhh6KIgsjfEN9OclEnmWdwDwUfM4olnG9DH6knijUHJuQjmeoRff4+xOq6cBIxa4
	NVIwPImBD+sNXVbtX0Xpqofj7M92/1i60GA5xSntfK6G49YY5q6T54fG17FcbyYZ1cKmOh8G7hD6W
	OxjiJFwTNqFixaR2SdrKFhcbIbEjktYu0ohDEpyDz/AJ04t8uuUbsIdVl5Ap8c6V2a68vP5R7vi4z
	h9ZLqKZNehrj6V3olVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG9N-00000005Wsc-1A9k;
	Fri, 10 Jul 2026 18:40:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG9M-00000005Ws1-0Oef
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 18:40:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BDA160051;
	Fri, 10 Jul 2026 18:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E848E1F000E9;
	Fri, 10 Jul 2026 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783708834;
	bh=dw/tpG8KDs1wNnbeqE/R/jGl9e8uJWm1LVLJMXr3y9c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nOa0AKg4/w5beHKoFmvXenDtet1OArIJl21x8N9paGY+Cn6vZqnIkt0tc8X7TGrfC
	 Pp1gpOjlAhLP+PPcZkJMPxperycH8oE8NILFT1SAt9dURXK4H5BAPKPB+P2UCELOWl
	 AUIdanmHcX47w1mzADkTmGul1PsiRk/FUXgY3AnuZRtAmXxvq1z/ops9wjjJGco9vQ
	 gnlXZLQ/NBV98/KL4QUGODs2Yu4ZDoXr6osRXVx4oOHNRtS2PXYJli0nzSOURqcyZv
	 qVSi8koe90GU2G4t38whR8eX9txyUqK7gbAEWhnfcNP/dk91OZVoMJy2rBVZi8dqlI
	 xFziuGhkXhzHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BA23924FBF;
	Fri, 10 Jul 2026 18:40:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: kprobes: Add test case for c.jal instruction
 simulation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178370881238.810467.12745723809097187662.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 18:40:12 +0000
References: <20260627115051.3235783-1-namcao@linutronix.de>
In-Reply-To: <20260627115051.3235783-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Sat, 27 Jun 2026 13:50:51 +0200 you wrote:
> Add test validating that kprobes correctly simulate the c.jal
> instruction.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> the test fails without c.jal simulation patch:
> https://lore.kernel.org/linux-riscv/20260627001939.3847-1-xiaofengmian@163.com/
> 
> [...]

Here is the summary with links:
  - riscv: kprobes: Add test case for c.jal instruction simulation
    https://git.kernel.org/riscv/c/0161aa173c38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
