Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479D6C83F18
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kht989M/r7atShJ3fcEYdkBIHw80ZHYJBY/owfuqlm0=; b=YlvtNgI6KCKFa3
	f0v9A+dsc/q+Ggfd1cONxCTL3NruAPAbpbTaeUY8z7HHy3JImtTiwzcuK7uf/8z9IdoRmVHGezIbQ
	7xjD2Sl+cl5lejFs62M4d1bklhx+e3/ah6qsIj3co1ZFp2TQoJuFuQ98vaChjtNs2EZKwIzQC1hi8
	90XTaoIgibi5DnyLd8tBf2iQlQAIVJivUaT1V7wulEHvYv5ArLT9zjXMPGd4K6+eSsTZHA2ZyLNX7
	Z3teedmXzB8QNRVZwsfu7KXBcpyBuiGS6Tosnb6kkamAkPkwSNQgxySNtEBqpCg0FOM0xqkec7wy8
	YWOnspyI5C8tILQ2GubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7s-00DXg7-1b;
	Wed, 30 Aug 2023 13:20:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7d-00DXVw-2t
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA9A862071;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2C51C433CA;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=CJBJ2HCdIV23BWEwO+d38KcZ6JefgcQDI6BR3xU4VoU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T3ICMT9Or6XLc2djfkBLwb8a8KothXh8yCKem9PNWTvsVBHojItKJXqGS7RT/vhJH
	 YJ1LQNAYtqeOoQDg5wo7dvLHFArDvh3cCikEd/tYHiIm1HPrLZSYXiYO7Ygp6uIxBc
	 xYo53fzyvqs9zYfoOxoLXnNdmRwDIEmJPbDcEKrLzijFwdzwisoUvoROT87ytHIH2y
	 mxyg6kS/BVLMES/D0gbmY+/93QYFU4/1JOJm4CKtOhHW2ql89T6E9Ogpvyl8Y2U0OZ
	 ZEACKVKN0rv/otxJw2C7DpXIfZX37nQMTur6yazgtukoYukst4l5DqW7dF/2GMw5zY
	 vgKReZJ90DbyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88292E29F3D;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] riscv: KCFI support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163454.19859.5631159121933404323.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230710183544.999540-8-samitolvanen@google.com>
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 nathan@kernel.org, ndesaulniers@google.com, conor.dooley@microchip.com,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062038_041346_01B7E021 
X-CRM114-Status: GOOD (  10.77  )
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

On Mon, 10 Jul 2023 18:35:45 +0000 you wrote:
> This series adds KCFI support for RISC-V. KCFI is a fine-grained
> forward-edge control-flow integrity scheme supported in Clang >=16,
> which ensures indirect calls in instrumented code can only branch to
> functions whose type matches the function pointer type, thus making
> code reuse attacks more difficult.
> 
> Patch 1 implements a pt_regs based syscall wrapper to address
> function pointer type mismatches in syscall handling. Patches 2 and 3
> annotate indirectly called assembly functions with CFI types. Patch 4
> implements error handling for indirect call checks. Patch 5 disables
> CFI for arch/riscv/purgatory. Patch 6 finally allows CONFIG_CFI_CLANG
> to be enabled for RISC-V.
> 
> [...]

Here is the summary with links:
  - [v2,1/6] riscv: Implement syscall wrappers
    https://git.kernel.org/riscv/c/08d0ce30e0e4
  - [v2,2/6] riscv: Add types to indirectly called assembly functions
    https://git.kernel.org/riscv/c/5f59c6855bad
  - [v2,3/6] riscv: Add ftrace_stub_graph
    https://git.kernel.org/riscv/c/f3a0c23f2539
  - [v2,4/6] riscv: Add CFI error handling
    https://git.kernel.org/riscv/c/af0ead42f693
  - [v2,5/6] riscv/purgatory: Disable CFI
    https://git.kernel.org/riscv/c/a72ab0361110
  - [v2,6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
    https://git.kernel.org/riscv/c/74f8fc31feb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
