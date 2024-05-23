Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43583C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnhLEQykt5BC1EChiEdxsiCaPS9LuA3fsytlKokN/lw=; b=Xs7Nqa8nY98DZh
	oZ5Tbs8MAdp2jLKRDQt4QHL4TtCTUe6SHWhdarRRl9MBIR0R8l+bnTTio3+tJqR5OuaoP68y1FHz/
	JIM0n5j/yMklpzZTPWl0hbdpdJyngicxOq/vLAkTrUxnQdXMWrQnQFo6XkQBrjlunrYcMByMvJDgE
	ujAILWVC5WmZ+OQPV12+DS/m/gzUno58cTmUuyX5cfwcIEAAZix7BLsOoG5MEfX2lQWtxat66YU6Q
	gMMFGq2bP7XbFro18u4yBXCxK943ubp/yUWSMtuLkjVqHHmchN3pTX7nVUuucO12x7DynqxNo6BEW
	GFsA2E47hEy7XSs9vGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9So-00000006UqC-1B8A;
	Thu, 23 May 2024 14:30:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9Sl-00000006Upj-44TW
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 14:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C42CD62835;
	Thu, 23 May 2024 14:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A4C7C32781;
	Thu, 23 May 2024 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716474634;
	bh=kyEDd/AlBKPnFpb2BVcpuawq/vb0mkkfXT6dC2QAPMk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DHg+mVoH1RuAbp9QivsAdXMZdA20VtYjZ2mPRRd9IRY0+pUtTbotRgZxPR7rgenp8
	 FiiI6i/u70WmaiBsygzHh+nePJmGuQJnyEE4+xXCKCInas/RsjcEnKRMkqE+rofVIs
	 N/m4IGCNbN1vb2D6uWw4eXBMGC1LBVajIh4qo9TWzr6uhBEzGTGj/ksO/fVfzKrRya
	 6XClpKzjF4fV83kaTnSiAaljr+GusgJnJpmOj8ncm8+MT9FZ2vVxyEZ+JN9ue55nGK
	 yl9R7pWQKkygal0ytNMyf5lPIy+rJL/HRgoibVIoIzeSbuSEZOc0ftghSZ8hwQN+FY
	 TWE4rey6O41dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 602B2C43617;
	Thu, 23 May 2024 14:30:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip: riscv-imsic: Fixup riscv_ipi_set_virq_range()
 conflict
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171647463438.13050.6219786365640043025.git-patchwork-notify@kernel.org>
Date: Thu, 23 May 2024 14:30:34 +0000
References: <20240522184953.28531-3-palmer@rivosinc.com>
In-Reply-To: <20240522184953.28531-3-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, tjeznach@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_073036_073877_2AAF16B8 
X-CRM114-Status: UNSURE (   7.53  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 22 May 2024 11:49:55 -0700 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> There was a semantic conflict between 21a8f8a0eb35 ("irqchip: Add RISC-V
> incoming MSI controller early driver") and dc892fb44322 ("riscv: Use
> IPIs for remote cache/TLB flushes by default") due to an API change.
> This manifests as a build failure post-merge.
> 
> [...]

Here is the summary with links:
  - irqchip: riscv-imsic: Fixup riscv_ipi_set_virq_range() conflict
    https://git.kernel.org/riscv/c/46cad6cd9b10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
