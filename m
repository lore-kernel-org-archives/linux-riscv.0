Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0115DD29C2F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZOwatbtYzS6ysbe7ibfvTgQ8ew3IS+80vjaw2grq94=; b=ZEdGhRjyDLyqzL
	DPpjwWCdC0UFh8Xh+wZeuxT8GtugiEgIYjoDwl7eScZdTnywJ7V0wv+XMh/cBTy7S6s75FFcQCuqE
	1h+mOZogUnGuORvkYu83DFtHwZtzLi4S1Rzr/egsnlwJVCMTggQzbGfZyTw0wkGF1QW1C6CqZlRmB
	vNsf6bWbrn5cd2VEc2obvQiwqKQ+baDFFJMcYCnWDo8Rc3xZT+9/wIxLqysxHvGsFJkThKl8p+s1T
	fAR3K04abw3tDcW031pr2U2D9xVV4/3xUNirqUF2E5MhfhRlt8ySpBQSBd1MSR8qDoQHHn4a8Rh24
	+fFa4Yx+CGPZgpoqk+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqBd-00000002FOL-1pa9;
	Mon, 19 Jan 2026 14:24:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqBc-00000002FOD-2SxX
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09F0760054;
	Mon, 19 Jan 2026 14:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7B6C116C6;
	Mon, 19 Jan 2026 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832695;
	bh=9kLnJHBpne2891DdEPoyhbjvuay1mdtqo+YzKVstwlQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R6jamMd4+CQe5SUkc6mNBELdpffvqL0sViD3g9nwHKhLUhnomtTCyLeaFrExBDymB
	 NlpEBkhCUQi8jfG73YXwgtGHjDIYNP6sXfAK5GCYDMU6P+kKt+yVDZ7gT209TJ+yD0
	 z7epdeXjsG6q17nfMYdeyFedDmeC6zWqBu46W/WT03H7v+C2gdqrtk5RQofdTSo7lF
	 JkC7lRiX8sY/8PnmfADKVF8qwH+GyKf9wMKka5q7R+fpD893Igbv7XaTXuPJK29Yij
	 Z/lC8u9JTM/SYsPIJvA9ej9E9II41DIdsMisE6M9yOFVPDScfHuJp9zddL64udtTwP
	 jXMXSBtYcqLEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5B373A55FAF;
	Mon, 19 Jan 2026 14:21:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Fix missing select CACHEMAINT_FOR_DMA
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176883248553.1426077.13963011396978260082.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:21:25 +0000
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paul@pgazz.com,
 fazilyildiran@gmail.com, linux-renesas-soc@vger.kernel.org,
 linuxarm@huawei.com, arnd@arndb.de
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 10 Dec 2025 16:00:45 +0000 you wrote:
> The drivers/cache/Kconfig menu was changed to a menuconfig so as to be able
> to hide the menu for non RISCV. The select of drivers under the original
> menu were broken as the menuconfig itself could be disabled.  Fix this by
> adding SELECT CACHEMAINT_FOR_DMA alongside the driver specific symbol
> selects.
> 
> Jonathan Cameron (2):
>   riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new
>     CONFIG_CACHEMAINT_FOR_DMA
>   soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
    https://git.kernel.org/riscv/c/521cadb4b69e
  - [2/2] soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
    https://git.kernel.org/riscv/c/8fdc61faa730

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
