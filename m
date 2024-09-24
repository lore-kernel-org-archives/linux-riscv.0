Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA49CF9C71
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSbPqx+/xBssvcDLorUWVGGB75s+wyqCs7l6vVyMzF8=; b=RE4zMQh0pGkY2p
	wnQtc6kCCdBXEJa7sXEwq+f2gZBFYFUEaJQQR9jZwF6HghV/zEntmCAwJVl/ea+Y8ltjVnjWBZbw5
	dyiASqznCJgU1DJvPwN4BJ9qE2w2DoUzgxANMlw/oedkMpEB1mbxQGg/rFA0yLlc+J07mwDdOJRtF
	Pv188pxWFvOFSMS0Q70PSnIgYfbg5k3hpaHxyOU7u26c8F+l/aM0IDCpH16+a6+rJXgONrCWgOZP2
	ZIW8AzoYg4CZYRlwCJy3/HVFmKCpWaXGzV5jSEebEP0SP0mBOX5eOU3vmrsp69QwBlWT9PPsonqOk
	o+gPhCwQuddU9sAMYLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszG6-00000001IOA-29sd;
	Tue, 24 Sep 2024 06:42:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDq-00000001Hot-2U8W;
	Tue, 24 Sep 2024 06:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C78A0A43276;
	Tue, 24 Sep 2024 06:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64CCC4CEC4;
	Tue, 24 Sep 2024 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727160029;
	bh=Jl0Mt0aDs2vMiWJwF95xu8Ry73OLNmqAOMUD+I7vhmw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MI+Szlgz5jGSBRGQc5JtCRrAYU5gDXMlVkKqs5i7/V5h8SEa9AOUu69soxICRpdjX
	 gpEXLOlF7Z8WbFqYEmhV86ElEhOZq0XqiD8xzH5a6Nhmelu6Se11lfL8PNaRkH1lXe
	 5+cdygAXF/Ji9D4rm0dpduMm7kGLpzBbUBYiHnhV5PJL7mmm6AIQCoMMiGO82aETt+
	 /s1uEw9WpimKNg5fVaKWFd+Nd9duDjLAz2ljZZPGoy0f16YbrtmN3cYeDgQ2ID2ZOw
	 Bvsq6xAYLSnwoX6vPIoAL0mpgybCFqOy/2elW1JVR9sVd59uJ5QABbpywIN+3pQnFu
	 WV74Y0/Cy4Ibw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B393806655;
	Tue, 24 Sep 2024 06:40:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] perf/riscv-sbi: Add platform specific firmware event
 handling
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172716003175.3899939.6074882511014223752.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 06:40:31 +0000
References: <20240812051109.6496-1-mchitale@ventanamicro.com>
In-Reply-To: <20240812051109.6496-1-mchitale@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 atishp@atishpatra.org, anup@brainfault.org, will@kernel.org,
 mark.rutland@arm.com, ajones@ventanamicro.com, conor.dooley@microchip.com,
 alexghiti@rivosinc.com, samuel.holland@sifive.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_234030_715834_690FAD2D 
X-CRM114-Status: GOOD (  12.02  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 12 Aug 2024 05:11:09 +0000 you wrote:
> The SBI v2.0 specification pointed to by the link below reserves the
> event code 0xffff for platform specific firmware events. Update the driver
> to be able to parse and program such events. The platform specific
> firmware events must now be specified in the perf command as below:
> perf stat -e rCxxx ...
> where bits[63:62] = 0x3 of the event config indicate a platform specific
> firmware event and xxx indicate the actual event code which is passed
> as the event data.
> 
> [...]

Here is the summary with links:
  - [v1] perf/riscv-sbi: Add platform specific firmware event handling
    https://git.kernel.org/riscv/c/f0c9363db2dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
