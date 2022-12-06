Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A14C4708C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 03:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RENU9TKAjdGXWRjk5ZIDLil3mgR8oO8G63LLe3DQWgc=; b=hhQTy4NwoYk1vX
	LXG4VPEq/fYHnAk7qe+waFgBEg+4B1mVljQT740y+K8jEhoXwL+tYpyT/Phgr/lEbRFiU4rFy3zyE
	lImNDHuFZt5/SQFf+mCuvXR5r/KCKBz9F8OqBTWFPsTeaf4rIMkEEsFS79CHIb2p53XksPIfTt5Qd
	TqsZb7SGkNKKsDGCyHGjqKDmRzzLDqeAmdaRbRmnpVc1ctFUAQM0cKVkqC83TQynalVhgIDus2tK6
	eThzYhL8MXnRhKrGHM7ah6T5CtROcQ4wrWgTxumRzmquBjxGydRQIAaheZdQp4O2ZS1ezCzlY4N4g
	bu3qcsrcmCjEJIuRQY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OLf-00GIyn-Vl; Tue, 06 Dec 2022 03:10:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OLc-00GIrx-RC
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 03:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32D70B81686;
	Tue,  6 Dec 2022 03:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5865C433C1;
	Tue,  6 Dec 2022 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670296215;
	bh=qeizWKrMRBlX8e3HYxm64lxGx4nQAx2XYIbFJQHbZaA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qZDrQUpROzJA2U8Ya8NfzQ9pZbxg7fdmfbfTDXTgpyWVw8iMGqgpymc2c0Pv3c2ei
	 2T4G4bzQfU9pZGVPmAiYEi9fxyEoYh0U17pdglXEHL0hab0Ohlh3sE2Tgbir12mzip
	 UC0kpa+AWAo/koHQP+jYM+lTNWM312+PtCyRZDG5sWusv5wTeikHwlVAO4xc4DZwuH
	 VHwU4Uj0sWQUcSm2DC4sZV1OxH9KqlIZLtAm0Ei95UVkBld29ZzqJc904ejWdVxuNy
	 RmMgiYyLMKnLHIhhD73qsTno0Kt4RvIA0UE+HkFVNLBILrqpfmRYuUVS5KAuFH29vG
	 qDDj4x2cU6V0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B73BDE270C7;
	Tue,  6 Dec 2022 03:10:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: stacktrace: A fixup and an optimization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167029621574.4417.18172654401785175878.git-patchwork-notify@kernel.org>
Date: Tue, 06 Dec 2022 03:10:15 +0000
References: <20221109064937.3643993-1-guoren@kernel.org>
In-Reply-To: <20221109064937.3643993-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 heiko@sntech.de, peterz@infradead.org, arnd@arndb.de,
 linux-arch@vger.kernel.org, keescook@chromium.org, paulmck@kernel.org,
 frederic@kernel.org, nsaenzju@redhat.com, changbin.du@intel.com,
 vincent.chen@sifive.com, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_191021_043627_04FDE017 
X-CRM114-Status: UNSURE (   8.62  )
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

On Wed,  9 Nov 2022 01:49:35 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> First is a fixup for the return address pointer. The second makes
> walk_stackframe could cross the pt_regs frame.
> 
> Guo Ren (2):
>   riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
>   riscv: stacktrace: Make walk_stackframe cross pt_regs frame
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
    https://git.kernel.org/riscv/c/5c3022e4a616
  - [2/2] riscv: stacktrace: Make walk_stackframe cross pt_regs frame
    https://git.kernel.org/riscv/c/7ecdadf7f8c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
