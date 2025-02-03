Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7404C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo6ivNIWoW6qSQORJZgOD2bKCD0REZqTrfoxZ9je8Pc=; b=r3B/L+J2eXYaLM
	mhCNPBl9OgldfNM+NyvVxtM1jirQp6LUVGuXJs1nMQ7KrgRETi1Jx1H7ADUqvQMC/CywZOFpe6ZcK
	QSP4IlvK8Hq6cpXGMQA33z4rb9yFjERM2AYQfKv4aRU89agZZysQfCFM3U4YN9ivpg536DLKT/UbK
	H9RsHsKBbLflVXrLMmiTH6bIA5LXXeGFgmHRi7GxoJyzkW0/vkyl6Dr9modf1+EuSkH0oLiwlb+5y
	uOpMaeBRh0f8rdx6GAPYHQLTtgzphtZz1jaqHSwQ//Ai6FxQPffC31BiiGqLA6F8svFuMo2xsHFHn
	soZz5hjryQwNM8wIxhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1yZ-0000000GRPh-2RQ1;
	Mon, 03 Feb 2025 19:19:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ui-0000000GQAe-12jb
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 479F0A41C17;
	Mon,  3 Feb 2025 19:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C699C4CEEF;
	Mon,  3 Feb 2025 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610119;
	bh=sJAddZDtrl7Dn/grqJ5XfBYKamzCFxh20mlHE9ocpd0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TEBXHW/YrzoSQA6bNyPK5hvPskWayDl9mYhOA5SpoP+yMMUbP1RdYKp9INyLXAwN3
	 /WWxT25sNqNmxq8dmYmhzlCuRARNhHIHnyfAuQ2uZH6R9Z8O3jMd52hYc4KeiveJdL
	 xt5I3E1gXsmn05Fc+JBE43I71cCg/SnfiADoZty7bKLTLOd3kYRTDu/mbqH5/6pDW+
	 wzbckyo1jnicDNXrf1cFe/0FMcrfb3O7U8i7unoac4XlAEhSR3qzi5GnPnIhpZU+Zk
	 EdncoU0qlb4+pFR4NxItaOYbs7MPlG8UEq/YOBDFFW8gidmMwsRSjpvcoVdDUwq62D
	 9puU0JnrrGUsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71BD9380AA67;
	Mon,  3 Feb 2025 19:15:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND 0/2] clk: thead: Fix TH1520 boot dependency on
 clk_ignore_unused
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861014596.3409359.5224078103636343294.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:45 +0000
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, mturquette@baylibre.com, sboyd@kernel.org,
 jszhang@kernel.org, frank.li@vivo.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111520_358655_B1D15C13 
X-CRM114-Status: UNSURE (   9.85  )
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

This series was applied to riscv/linux.git (fixes)
by Stephen Boyd <sboyd@kernel.org>:

On Mon, 13 Jan 2025 12:31:23 -0800 you wrote:
> Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
> perisys_apb2_hclk and perisys_apb3_hclk. Without this flag, the boot
> hangs after "clk: Disabling unused clocks" unless clk_ignore_unused
> is in the kernel cmdline.
> 
> In order to allow individual clk gates to specify their own flags,
> the call to devm_clk_hw_register_gate_parent_data() is changeed to
> actually pass the clk flags instead of just 0.
> 
> [...]

Here is the summary with links:
  - [RESEND,1/2] clk: thead: Fix clk gate registration to pass flags
    https://git.kernel.org/riscv/c/a826e53fd78c
  - [RESEND,2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
    https://git.kernel.org/riscv/c/037705e94bf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
