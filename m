Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF94CCD1AA
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzEjsWNherBs99vDgOw637foyXASYrZAmYwGg5syKF0=; b=NQK9TxKP41yCup
	QdWb9CPuxsYANnH9UpVVtJeq5NFer1BVZkvJZtkuP7Ymi4a30McSsPmHbfO4l3O+3x0Eq+sloXTZs
	P6JCVc+61e4cHbdL0LpLsBXPrZbScGH2hjJck7zJZMc2wGH0sjKEYDciuLGW3Xr3QA7Xrw75eh1nf
	LJ/Zou1zsqQoBmpkcwR2DsPs7u+mP5hpnWxrtTKkEbcyGQnpjjxZfkRX803gXEEW2qxnKUQWGkECS
	t7gtWGrT9DCmK7oUHzOxKtZF9GaT/EgqLnW/C20UgQHSpKaUeDYifkvv+l4tn0T2HDoad/utvhvOU
	09axNc3/im4WG2TOwkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NU-0000000A78a-1tAh;
	Sat, 18 Oct 2025 16:01:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NR-0000000A76y-1I5H
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 16:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3B5E47A8D;
	Sat, 18 Oct 2025 16:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B7DC113D0;
	Sat, 18 Oct 2025 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760803312;
	bh=lLadhCwqOLJRn4OyFyRaasmCVbJKXcR31WhZ+tQbsJE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bhy7gmjuYCl3k2qycHStnMR7Kz6A/tV6FoFM99CM5lnZsVkb62xdrYH+ikrSEfGgY
	 aHgAsJCMlGNVEUuxjnOnvZnOa6g+XTKxZME/YA489aDA0lRr2X7q6Iwcb6xWaMRjuW
	 hVBT6+AYPYyLNJK5eK+p08IGvdfCwJOsHeWfcd8kPb8nBMJ6ERqlV7YXIFUPYQ8flQ
	 dj5sPQpoUzOxEXm38QPojA6uur8/rNQQ3BmMc3RgO4gI5p1Xm5wru6cVBw3DctKkPL
	 yizQJ+QIck7YRkGHq8lLAb3WkBStuw5+0cyvHRv/DXSEFVNmpuS+Po6UG1hslpzVDo
	 R0jCws6Fo2lYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D3439EFBB7;
	Sat, 18 Oct 2025 16:01:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Don't print details of CPUs disabled in DT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176080329574.3028979.687307160089751894.git-patchwork-notify@kernel.org>
Date: Sat, 18 Oct 2025 16:01:35 +0000
References: <20251014163009.182381-1-apatel@ventanamicro.com>
In-Reply-To: <20251014163009.182381-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, alex@ghiti.fr, atish.patra@linux.dev,
 ajones@ventanamicro.com, anup@brainfault.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_090153_370509_8B601830 
X-CRM114-Status: UNSURE (   9.76  )
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
by Paul Walmsley <pjw@kernel.org>:

On Tue, 14 Oct 2025 22:00:09 +0530 you wrote:
> Early boot stages may disable CPU DT nodes for unavailable
> CPUs based on SKU, pinstraps, eFuse, etc. Currently, the
> riscv_early_of_processor_hartid() prints details of a CPU
> if it is disabled in DT which has no value and gives a
> false impression to the users that there some issue with
> the CPU.
> 
> [...]

Here is the summary with links:
  - RISC-V: Don't print details of CPUs disabled in DT
    https://git.kernel.org/riscv/c/d2721bb165b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
