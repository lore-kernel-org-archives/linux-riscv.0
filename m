Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152FCC47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rABa/CO+yNNKdYdgg7v21jfQ2MDqKzaxpNrXhQ6vS8M=; b=m52zTuyo1KBWvX
	whoh6Cjdve4gBGV0Zr/vvQ5NxYzMZ7AyT6iYAyUQbXpetnoVgn32hxIiwgmz2dTeEHeh9MZchQZJM
	/TltucHBlIQcbFzfq3Oban0zskJzne08R/TZ7k58VIlsdE1cuoIBA0nxVCjN3m0g2guG7xNibGnj5
	3EETCppNnjjCrPciAXcGMhZMU3BFmax4tpacQQYEIp7YSt34PfzxCpN8Cx+V7hMRp/jpByjbv2xwm
	589W8s9Q9CtL+BQad9Nbbsj0Ty+FKHfm4+E/FPbHLk+fq93dQpoNQiIeOAiAbqEH0SPgb2LhgU/C+
	VE0hrcmQ+xML0jTZCOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbi-008OgQ-0l;
	Sat, 20 Jan 2024 21:10:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbU-008OR1-1k
	for linux-riscv@bombadil.infradead.org;
	Sat, 20 Jan 2024 21:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=shCzRzaKLWMmWoYNa+3EUQj1ycFVZKFoWI1BYbmOFiM=; b=m3+a+eUAaJEj3mfI4NWCKB8aap
	6U2jrfC/aACxlKjZF1/2m1DDBlq1PVjweOFge0UH4bVx8IaigV1eOHvpHFHKGvc9bEEqH54kbQQqt
	UW11TF5MZGrrycKbFnfiwCdyb6mFUoNJE/xyU3udMQ1+vEGVdIX24zlF6QzDFDfXdEVx6tOEVomth
	GRAwqXlfQADjGhevdWXQJbBKldIpDSgMvw20QAaQyksoDv7f+kKhWUp9Tljj13m+bFwM6CG/qCZux
	oJmYSdQIHu4d9junv36wQUdZs7vr10ouzoe23ny3MOaJ+j/kt8ycBmN5Fjvg7k7QXVGbso+xHXtr0
	j+Xh1bBw==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRIbO-00000002Iwt-3eag
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17589CE1BC6;
	Sat, 20 Jan 2024 21:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53453C43141;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=5nt45iLV79mhsTfMOftM+AWycz2mQQOYTXoIRFoqOoo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YnN34gi5+oVnZY/0lS2QOt99cVY0Ihez1rMaY38jgbsgV5rQlxtESR6v1mufaZBwg
	 KdCVD3wxXWgycdTdGLTf7w8SXBOwf2pHsuW9NfFC1cDRecKDiu8VChY2W5McIn+fGD
	 5qcQptMOY9MKAqjdFJZOQsmA37YAGqCrirlYoZZQdHPFBW5Lz7bvl7qCyabz0jKwIx
	 RpvAZPIrLCYvWKql32YAsakLpDp2a/v5g9iLE39MxD8dPK+Qs3hwf9LTbZZxFHtqBr
	 fOLuFKYFstgVg7XDApia6gevkRU+XYVZe7pxq5frYDQQliXFRbb9XBGypKQlCeGQo8
	 SC8JbFbUBZpeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 408FCD8C9A3;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match constraints
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499925.24348.4221862120348193500.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <20240117130933.57514-2-ajones@ventanamicro.com>
In-Reply-To: <20240117130933.57514-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_211007_748609_CEDD1716 
X-CRM114-Status: UNSURE (   7.69  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 17 Jan 2024 14:09:34 +0100 you wrote:
> The 'i' constraint expects a constant operand, which fn and its
> constant derivative MK_CBO(fn) are, but passing fn through a function
> as a parameter and using a local variable for MK_CBO(fn) allow the
> compiler to lose sight of that when no optimization is done. Use
> a macro instead of a function and skip the local variable to ensure
> the compiler uses constants, matching the asm constraints.
> 
> [...]

Here is the summary with links:
  - RISC-V: selftests: cbo: Ensure asm operands match constraints
    https://git.kernel.org/riscv/c/0de65288d75f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
