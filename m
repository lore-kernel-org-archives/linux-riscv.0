Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BDC83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92oP17Q94Opv6tluP67n6WYhhIXkjVyhONCWuMMb7Xg=; b=quC3GcgAkBAHZC
	X/BeX3Ht80CjSdVsQN2xypuFbVBLbU2sKnOnV6wPZEAv7MuuBAelFKGJxeIaKuJybkvqbc+6siXzK
	XomLSL9OzfTVhhjvNN29tMAYng1L8Nl/dMWsXpvf3Vid0DFDIhXJ7m790Yx/+tSwQvrybmK7xwtnC
	d3YNCB4gYSYroEBcVBbDy2M9OsjptT+95S1WXFstTF9Eg7mn7lJIeviCQiSeGysTbCO0IzVUYKxOj
	mdbLiAGhT/d8We2k0XnjotWJVPu5RIpDiuulUHai6OCkqYcn7hZhrHaQ7c7cLeLU6lRHjp9ppQWKM
	xNeIKc+gHolGfivQdmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9De-00000008eX8-24aE;
	Wed, 16 Jul 2025 20:59:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8I9-00000008Yxs-3tmL
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 19:59:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49783A5760D;
	Wed, 16 Jul 2025 19:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BE1C4CEE7;
	Wed, 16 Jul 2025 19:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752695989;
	bh=+JAJF1XNsDiacnVLeELmyTnWm99mVDlUIfSnTj/uvjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GFdViYkSuLoRUMTYiOFSqY8rc6UVxPIp8TgwDy0SveAt8ltXaOAtxmoxwuuX68gtx
	 L276evSqEEuLhWXOcVzZi8z2psPD3ZG8wjzO/BIKztWW0MPmyN0jwblEc3kko+W5Q8
	 xBCH//BDG5JUYxf1XpRI7L5WZcWJDCGzXcrdo5WH5EGFkabQct27NcOlMj3j3SOGmv
	 P82NeJACbhD8rrw8PcNsGgUqfYVx7W26AevEsU7/iq5AhdrsQU7UwjV0PQMFzkpjM8
	 5b7RSm2CIJx4QBw+lUjGLvVDG1qHlAPTbMsM+3Suqyd0PgFxJgEtYcu7CESV3AEni6
	 6uToJtiiXhrMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BC2383BA3A;
	Wed, 16 Jul 2025 20:00:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Enable interrupt during exception handling
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175269600935.1308944.5530274266993935851.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 20:00:09 +0000
References: <20250625085630.3649485-1-namcao@linutronix.de>
In-Reply-To: <20250625085630.3649485-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 peterz@infradead.org, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_125950_023680_FBD77C94 
X-CRM114-Status: UNSURE (   7.84  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed, 25 Jun 2025 10:56:30 +0200 you wrote:
> force_sig_fault() takes a spinlock, which is a sleeping lock with
> CONFIG_PREEMPT_RT=y. However, exception handling calls force_sig_fault()
> with interrupt disabled, causing a sleeping in atomic context warning.
> 
> This can be reproduced using userspace programs such as:
>     int main() { asm ("ebreak"); }
> or
>     int main() { asm ("unimp"); }
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Enable interrupt during exception handling
    https://git.kernel.org/riscv/c/969f028bf2c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
