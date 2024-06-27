Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D4C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFfiIq/L2ZdQfIlpSob4jri54uEIBE0I4a3yd/cVI40=; b=lUUfPGxXAeK+JZ
	cSKQ8dXh1iIFR5P/BJRn56LLBTe1u5c7Ei7zikEj/oieu4zdhQTzylFYHIdv82EZzNr3PyDfzMRJa
	Af3y2TUwjVIkx2u7Cc9JQ4aMGRMxvazka6JeteS/8FTF8N87id+3Go8rxfq2JSi/OE3EMR/yGyQLl
	H5j7YIJ99gXORQuz2i/3ujlqywRWv/e9mFO0C0BTyNpy1FD1zTvupbvJ3zClQyF0tiZXfcivy7RIJ
	hTtq8+303A+FCFbLROQAmM+H0fXgnaoTZQqkDOZ5Fk8lcpNP9cYKPdvp35XhKE8eUTIqA+3xDJzBB
	KfR+u9Er22FPPBXDRhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtH3-0000000BIS5-2Pox;
	Thu, 27 Jun 2024 17:51:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGt-0000000BIJk-3nSk
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE48ECE3390;
	Thu, 27 Jun 2024 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 771DEC4AF09;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=1xNe1u/aXvULtcQUTH3SvYXu4kNm78KffnqOzZDJdnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QHV9svyzahf3yrCqi8QXPqwP7zRiUAZbQFiqWK8HM/+ZV9P16PfYVUDWyJ7BUNJ7b
	 IbAR+uVQMHlr1anDnrYhx1vGkb0K9rZRcHJLmboDNT6J17AW9gvgcWSkbSkZ+Wc0vu
	 VTuKgfjLl5SRafkJYXPGUuRzRGJ43fxoKmwxAcv0GGSFITi6Gxrbc94V+qEOunslE5
	 oxPXyrYrtXAbxGSeD2r1RKaHo647/dnOgSIVyIbt/MzYtXbToM6G8yPuM4j9n4TRyx
	 me3AjXcPr6MZOpX0BzgGjHQOAjVpmah+oiu0JL55XjAYJw/H3d9xHxngGU9L8Z+BGn
	 V/EQlZlQfCwIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52547C43443;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/7] riscv: Various text patching improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065633.6762.12967635589292912560.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240327160520.791322-1-samuel.holland@sifive.com>
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, ardb@kernel.org, daniel@iogearbox.net,
 jbaron@akamai.com, jpoimboe@kernel.org, peterz@infradead.org,
 rostedt@goodmis.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105100_227389_1D73221B 
X-CRM114-Status: UNSURE (   9.68  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 27 Mar 2024 09:04:39 -0700 you wrote:
> Here are a few changes to minimize calls to stop_machine() and
> flush_icache_*() in the various text patching functions, as well as
> to simplify the code.
> 
> This series is based on "[PATCH v3 0/2] riscv: fix patching with IPI"[1].
> 
> [1]: https://lore.kernel.org/linux-riscv/20240229121056.203419-1-alexghiti@rivosinc.com/
> 
> [...]

Here is the summary with links:
  - [v2,1/7] riscv: jump_label: Batch icache maintenance
    https://git.kernel.org/riscv/c/652b56b18439
  - [v2,2/7] riscv: jump_label: Simplify assembly syntax
    https://git.kernel.org/riscv/c/2aa30d19cfbb
  - [v2,3/7] riscv: kprobes: Use patch_text_nosync() for insn slots
    https://git.kernel.org/riscv/c/b1756750a397
  - [v2,4/7] riscv: Simplify text patching loops
    https://git.kernel.org/riscv/c/5080ca0fe9b5
  - [v2,5/7] riscv: Pass patch_text() the length in bytes
    https://git.kernel.org/riscv/c/51781ce8f448
  - [v2,6/7] riscv: Use offset_in_page() in text patching functions
    https://git.kernel.org/riscv/c/eaee54875630
  - [v2,7/7] riscv: Remove extra variable in patch_text_nosync()
    https://git.kernel.org/riscv/c/47742484ee16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
