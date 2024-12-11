Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93DFE77183
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UEXDosENarb68OkcOi/tK4ncLpbvx+erw4GguDlONI=; b=Z1sCOhEAiVQtys
	1NUnYg4qhJAyl02hKEKHvuvRxxVB9EK5x7OyTPeTdbFwfSgGLVFW7Xx0czed8QUt6zotNkKs0hcMP
	9fZ0RTFgETmT8dbJPpz9QNjh9rHXs5staE6Hlo1Ukk37DHZtIZXQuL6Ke7WJ6gHkSMBhHWHWeQ67i
	4l33Ng6M+Ka/+w9LWDu/aU6QRbypa4yQsH26w7mwwQupqVWj1isEAWSwcAaTynI7fnrOaUgfOj73j
	DyXAmoaKvFZ/EArWYMoECbjMObxoHNweaICq/6wAy31VCZmgiskQTll/rI+MCbKIXBmIIvAjpsVlR
	zYMRYl2ieCXbv3PFGt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFf-0000000GKIF-1VZJ;
	Wed, 11 Dec 2024 22:32:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFc-0000000GKGk-3iKD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81A7F5C67E4;
	Wed, 11 Dec 2024 22:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4454C4CED2;
	Wed, 11 Dec 2024 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956331;
	bh=YitCwK6c+33A6aC+Ygx3OE8d+hQaCuKW3MFcVWF5360=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uTGqiXy5bmDgJRGblbXGYidOuhp/B6l9GzJ5CwQc4h89NX0dFGFGNGyNrA8ShzB6y
	 6RT8dcqVEw1SsssusH27Ml7A/KryBQEuPfbJznOp52WKzE3alcSxFUgeDHI8F+rLT6
	 wOkne/dlATfk7333bXBjysUA4stsIyDnFqEBWD43Zf99ZlO9R+UFvENwVkvjZ5wODH
	 ieN7Jx5cicu9C5le0ZhyMjXourWjhhtmOTo0SNsx0j0kXX13WP5DXXcwfH/S00gJ/Z
	 YA7d3n3kTWyNNmmwcDdmI+4a6g2nIBHa42LyNOefUddswo6iSqQ/jsEWK6u2acokTI
	 BPXSJf66CMZlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFD5380A965;
	Wed, 11 Dec 2024 22:32:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] irqchip/sifive-plic: Make use of __assign_bit() API
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395634775.1729195.14916770545645743784.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:27 +0000
References: <20240902130824.2878644-1-lihongbo22@huawei.com>
In-Reply-To: <20240902130824.2878644-1-lihongbo22@huawei.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de,
 paul.walmsley@sifive.com, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143212_963953_300D6E97 
X-CRM114-Status: UNSURE (   6.88  )
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
by Thomas Gleixner <tglx@linutronix.de>:

On Mon, 2 Sep 2024 21:08:24 +0800 you wrote:
> We have for some time the __assign_bit() API to replace
> open coded
>     if (foo)
>         __set_bit(n, bar);
>     else
>         __clear_bit(n, bar);
> 
> [...]

Here is the summary with links:
  - [-next] irqchip/sifive-plic: Make use of __assign_bit() API
    https://git.kernel.org/riscv/c/40d7af5375a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
