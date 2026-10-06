Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E83CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUudgOeXkoNPJqzpmaV8ApBo3ucW3M+m/0QpbQIvtI4=; b=C/uwOq+llPQ7go
	oMpwXV58/CY+xzJv3cX9IPb2XbTKhc5/L1bW3L3J8qrJLWTCcHuirhBc6VxCH0zhQf94dB7rUo5A3
	+02XfcYnFjRI8NRw6wnbla9VlBp1iftMNocj+C59hYAo04eANZUJ0ImmtidPX6bqiC3oaO0A0+H2b
	lAU0Q83k5iBmZtzl+YcD6BYLZF2rYJGE7XpGPpKsNuONhb0gaLkhTCsxfl9PG8ME2SZ0pK0KLHljY
	Ha8g/AiQOTLAAUoiZQq1x8YWHo31BSH1iLOqzeXdxq2cA62LcdEpKzpScM/Jsrwo1vJZ1B2aYCeZU
	hANAFbs7nS53G13El1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1eg-00000000P3J-15or;
	Tue, 06 Oct 2026 09:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1ee-00000000P38-3rjd
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 09:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14B4560234;
	Tue,  6 Oct 2026 09:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDEE1F00893;
	Tue,  6 Oct 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791279611;
	bh=bK7XBn5Ar4KTmrahMaJF7/5gSzcjPa7jKXochafzgvI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gy8xsc+Xbqko9lQlpPjponq4rMuHzWxT5aupBsoLG+veMtRMM7wLgrfWmFi4JryB2
	 /yTCVy7jvuG1/eEWCFbKhDhsv09xIS3jAJqNhZCHQ84/kl6mzBFvcfdcApOh7xsqfI
	 arh8eJ5q1mGS7jD4pdFScZMR1OB8xeoea9POg2J/rG0XntyECXcxjhMp9+71U1eZMQ
	 B9yWnpbIG1lMyg8HNSPqP0FTdR1hv3AjpgVsC3nP3SBtIcFTwTl5KYeozJhiJ5sreJ
	 tV90eD2hrvO+oivd5oO+Z/zk0FofkR2yw2tTnPKECfNexMZRBgglHiFo8n2cvYDKQ9
	 +tV0mIDrui6GQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43123927078;
	Tue,  6 Oct 2026 09:40:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/2] riscv: runtime enablement for native misaligned
 ucopy
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179127961027.2107992.5336345145060413081.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 09:40:10 +0000
References: <20260911182402.1434257-1-tchiu@tenstorrent.com>
In-Reply-To: <20260911182402.1434257-1-tchiu@tenstorrent.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, olof@lixom.net
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 11 Sep 2026 13:23:58 -0500 you wrote:
> This series is the continued series for commit b94cec5761d2 ("riscv:
> skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS") that
> makes the optimization available to distro kernels compiled without
> NONPORTABLE config. Now, the kernel can skip the software aligning code
> in ucopy after fast unaligned access is detected at runtime.
> 
> Andy Chiu (2):
>   riscv: introduce assembly version of jump table
>   riscv: optmize ucopy for has_fast_unaligned_accesses
> 
> [...]

Here is the summary with links:
  - [v1,1/2] riscv: introduce assembly version of jump table
    https://git.kernel.org/riscv/c/57ae2ff9fcec
  - [v1,2/2] riscv: optmize ucopy for has_fast_unaligned_accesses
    https://git.kernel.org/riscv/c/e76892c7ad3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
