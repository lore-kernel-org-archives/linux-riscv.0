Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED91C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 16:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EC361101
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 16:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39EC361101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zr8FWzipoMkE4zZEL5tfUGOh6P0tHhzQUSOZSrnJFUg=; b=vyaYJ4nM2OlxrR
	J7/UJgjarZAhEn7kteyLLvK8qujIO3xCiuxklfSTWKdbWvYYSkr7MU5h2f2dGiWoKCUhCG9kQ8DIk
	X2F1BgEL1VzZRrvtxEjkzgLJiH+WBHkNfZH4x8krbkBWnXzLHuwwU7gww4OqPFmFxdWv/o7WjA9O2
	AgQ9jrVYjy//J4kVe7w7u/N99LuqWTSalelGUXcIMGeK+Fs92ZEzx+LAwgGW391Z1gpyVcwh4AHnl
	fQW19grvweTqYaN3h6ha9l3ajxRpLhtjWMHsZXYQ54m4TV/WXSZ4GAu8hN1d8ZUFBXkukZPFQhe5z
	GVdf40Qkb6XrvVYIn1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj1dW-00Bs70-6b; Fri, 05 Nov 2021 16:00:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj1dQ-00Bs3D-2n
 for linux-riscv@lists.infradead.org; Fri, 05 Nov 2021 16:00:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 362F86124A;
 Fri,  5 Nov 2021 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636128007;
 bh=4fTRiNDaXgUZHLhG+PBOGZ8SNrobddSUX1b5g8UISsI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jd/1+5qx1YzcvpQLcShIPW5/4yhG3i5AW7cgb9uZwyK+QNucJNMJp3cu4+QdMZkix
 4ULrdCQ+fTj1RUPUOck5m05kchi/WPdRhALG8tR9o7jnyKTDkCZqIRbqf+/DzuJNqh
 qoWRC+W3g49TwC3GfuQ203hsUlcHvaxBkZiv6R5Zy7nVLFaFXzanvlDQFvO8sK0wr2
 GZxELPViAhXKkg6UsdiuqO7a9r0c4UVHs530nb3q2RaCio4jHexmqRRxEAtIH9bgx4
 h3ENNsbgm8mKKRqdLNG0bYeexJ3qmRP4SkaQa2B+CfPCeKt8flYGTWbrNpQm0dlIay
 axbaluvb3Gv6A==
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv, bpf: Fix RV32 broken build,
 and silence RV64 warning
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163612800715.13450.14251964534648869709.git-patchwork-notify@kernel.org>
Date: Fri, 05 Nov 2021 16:00:07 +0000
References: <20211103115453.397209-1-bjorn@kernel.org>
In-Reply-To: <20211103115453.397209-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org, tongtiangen@huawei.com, luke.r.nels@gmail.com,
 xi.wang@gmail.com, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_090008_184483_99B3DAD0 
X-CRM114-Status: UNSURE (   6.79  )
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

This patch was applied to bpf/bpf.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Wed,  3 Nov 2021 12:54:53 +0100 you wrote:
> Commit 252c765bd764 ("riscv, bpf: Add BPF exception tables") only
> addressed RV64, and broke the RV32 build [1]. Fix by gating the exception
> tables code with CONFIG_ARCH_RV64I.
> 
> Further, silence a "-Wmissing-prototypes" warning [2] in the RV64 BPF
> JIT.
> 
> [...]

Here is the summary with links:
  - [bpf-next] riscv, bpf: Fix RV32 broken build, and silence RV64 warning
    https://git.kernel.org/bpf/bpf/c/f47d4ffe3a84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
