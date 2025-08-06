Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B86C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SNWkhdPS7iPKmU3ibIwiphh/OQQRJbTAc0RvtV/2zw=; b=CSDo9nc22j49bR
	nxQNNjLPUqzBhYp2o3vWGeKPH+j1kpKjy8c7EvA2I7VcdR9aqXrQ6iIXcwpFFSiVA+LUctr8fXSiF
	NtuL6Q2nHICi11KYBKGa/MZv+XTJV3qfT+4uGez2ispNHp2uJYjP/CTVAV2YvlaGfg6QyYrbAE6tO
	MctkDpoxPsmvjgN6E9hum+KVE0k4+TA1RmJ6hcVT7KBiObNty6LHQPxqYOiCiq3Sm0c0grDzXSlzH
	6v3Cj+gh0yEjV9iYmzWClTDXt8KGMWCs8/l17xSf5U7D45/kQJtnMCOmiORLwte42f8BUNeMQlPbd
	DNhfxF6VSxFOE2z0XKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnt-0000000FtKO-25h9;
	Wed, 06 Aug 2025 17:19:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjg-0000000Fs9K-45lZ
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B570B41A76;
	Wed,  6 Aug 2025 17:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A0EC4CEF1;
	Wed,  6 Aug 2025 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500532;
	bh=OzPZZZJi1pVXgGVIG8cpBKsbVNQulHiuq38zkRzTI2c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kZ+mFBaL/1w6jfQaSj8zmVTAh92n616XWk9KiJKFrNtnOOEr7Qw9WRQB3NpGxJv88
	 C4zz/Fb1D+AnlpNTwZTfq42WABoJKeIH5cIeERvwY3XlKfVQxN7nHxJUrKNYkcvvze
	 KFCb96HeMlH5sKf9IihiggA55VgnWDQsmBhiV1gzJ6nNBVpv2Yal163kWaRiwb8r8/
	 0wh5odLC/mr4S26UNNgvOsrWZXhNUDv8Ikn+SKtEJAjA95TRHKGrgi1aoKCvH3qLX3
	 ds+RgKd7g/ardfBsYU4Rc+bY2uQsXmcVvcv691RNpT5YQkoTYv2KnwiT8NgEVtYIP4
	 Q3E0SN44pJ4Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED5383BF63;
	Wed,  6 Aug 2025 17:15:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054624.2863135.16531031076393006761.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:46 +0000
References: <20250713155321.2064856-1-guoren@kernel.org>
In-Reply-To: <20250713155321.2064856-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 alexghiti@rivosinc.com, paul.walmsley@sifive.com, bjorn@rivosinc.com,
 eobras@redhat.com, corbet@lwn.net, peterlin@andestech.com,
 rabenda.cn@gmail.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101533_034395_4B4C4B3A 
X-CRM114-Status: UNSURE (   9.57  )
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Sun, 13 Jul 2025 11:53:19 -0400 you wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The early version of XuanTie C9xx cores has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> [...]

Here is the summary with links:
  - [V2,1/2] riscv: Move vendor errata definitions to new header
    https://git.kernel.org/riscv/c/736d67e4f0d0
  - [V2,2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
    https://git.kernel.org/riscv/c/b7f09bd30ca8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
