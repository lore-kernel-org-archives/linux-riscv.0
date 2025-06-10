Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7EAC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAjpruouNrm5pWS9bQvXpJ1mUtAqY+tREzd28VOMj5w=; b=VWHRT1nco+As1Y
	y0iOmQAZWUUFQEf4eEsY5nssH9GzlDdp+6yEXyfcthFq/z3wkxLwwFqe0ctIT+8e6Deb/iORPZnay
	X8t5wefGqRS+N1kL3543BB1eLBTW7B99p+kdedQzfXhDKl883wmluzTuxuQ1nyGoINhVD0zY3h/uG
	FDY95+Js9mQsI1oBC6DymMDk82+RTALF3pOb4KtVqinrLCit3YI850LSK6sAnxxpQb4yqDWWZNZOX
	Xwd06LPtQ9RbjRDE6vFbEVVAjHfBxcz2ghFJEJFy0F5oIVkTr6WXqkc25E46y/47cOFqA0EaeybeO
	LsOecsQi9/zbn7ALwgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57K-00000007z3z-3lQH;
	Tue, 10 Jun 2025 19:58:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pY-00000007T6s-1b3R
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26DBF4A6E6;
	Tue, 10 Jun 2025 16:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E6EC4CEF2;
	Tue, 10 Jun 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572888;
	bh=gVVDtdo+XEAFkN3H3+WoNAnx5w2ndueoZSJP/uuRddc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hUA1NH5BcVQ8M2fdOev8wUS9K1hf4GAu+17GC/5e4eBsPBXuNSMfZMfW9fzrdHSpC
	 RzAxDkuJTJ5xCWRLBMsWb87qO3dlp848vabbZG+M6Ztz0H7I3/oQi9VOknaZ89/0N5
	 TgFDcXUpIC/ReEveqk+qA3v3tufU3Cy7w3pRHos9cTGQgKNx36dwJ1gOiVqX/zy157
	 yVIPje/kEn4IQmpwIq6sPnXKx8VQ8C+FTI+a/hiEl/idhv0ZfAlmxPHjws2hfVUv9a
	 mOkzT7vh1onFAMFh6QAHCkBV9QvbNbb+urRr2Gp5r2t+4zON3T+B6tWMmhiUuzSRK8
	 fsGK24F4h0Ydg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCEB39D6540;
	Tue, 10 Jun 2025 16:28:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct
 CPU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957291849.2454024.7268696984666677694.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:38 +0000
References: <20250514171320.3494917-1-abrestic@rivosinc.com>
In-Reply-To: <20250514171320.3494917-1-abrestic@rivosinc.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092808_441159_AD01581E 
X-CRM114-Status: UNSURE (   9.95  )
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

On Wed, 14 May 2025 10:13:20 -0700 you wrote:
> When starting the local sync timer to synchronize the state of a remote
> CPU it should be added on the CPU to be synchronized, not the initiating
> CPU. This results in interrupt delivery being delayed until the timer
> eventually runs (due to another mask/unmask/migrate operation) on the
> target CPU.
> 
> Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-imsic: Start local sync timer on correct CPU
    https://git.kernel.org/riscv/c/08fb624802d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
