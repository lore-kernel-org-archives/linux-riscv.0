Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD810C25B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QRc5Pf8FyvZErcaqsGMujhvqtWQzRWgg8fc3gIVqVU=; b=VplKtAaW7AL34O
	dBFGt610RF+CsDMsjJ5ZQMi87W7PalSZK03EQ0mcwJR+aOEAOeOd2/UspAEdlbVxWADEvcCMJ9gwH
	ubhTzGhs2nBjQYimOfvyT4fnz55wCa+Svbhsxkf/RbGgIPEyV2Fw2rSYr9wyXOrA8iDiujjqa3lMN
	HY6I11pwZVd2PFji6ixdUJnvzog3Qm4r04hNNzYKz3sKKgUa5RhHSpMYthYebMIwR7bqlaQnrOvIP
	+UhvnLTY4PWf5fd69+m3akkm/XCIvhjD8eQXcNR/19p12m+vcKkyiq360NPuyFLAeVTIiL40ExBPk
	oma4jCkZ3bQ8iqaSreEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkc-00000004VXp-3XNB;
	Wed, 22 May 2024 23:52:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkM-00000004VMt-3EvO
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DAD2CE1382;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E109C32782;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=wwQWVyKo3s0RyZje7mPn2Az2NQ1iII2+E9jwjUkfzqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q5eVrd1Zbaldkiu9+ZY2Mvu/D1XeC3lfRkJD2v8uGBoroEyY/DCJ+LZEYWLmylfI+
	 Ok19CtMyehWfQJE1+lDg4ns/xY/Epjz/mrwm7W3zWFyivwpUKRXnPlRhym+wI+QAqb
	 ScrV4Mn3/RfTt9XGtVX0UEll0Hb6gqkDtDzl+eR3MsletdHP1mtsp24VfwS9l9wiPy
	 4pvogjk/2ZcI8HeO/EYG4IvPGfmThluAWlA6PxEZalYH5rW7Criujx+DIp5C+kX4Sl
	 LHqPdVgNJ2gLsQEEIwC7CfldPQAor7Sg66o7ytWQAfZJAM0SKmpNs7KY2qgncdOwrA
	 jI5Kyf7g180Wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C540C54BA0;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: fix debug_pagealloc
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190757.9409.1091588685660821042.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <cover.1715750938.git.namcao@linutronix.de>
In-Reply-To: <cover.1715750938.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165151_146929_EB2178B6 
X-CRM114-Status: UNSURE (   7.18  )
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

On Wed, 15 May 2024 07:50:38 +0200 you wrote:
> The debug_pagealloc feature is not functional on RISCV. With this feature
> enabled (CONFIG_DEBUG_PAGEALLOC=y and debug_pagealloc=on), kernel crashes
> early during boot.
> 
> QEMU command that can reproduce this problem:
>    qemu-system-riscv64 -machine virt \
>    -kernel Image \
>    -append "console=ttyS0 root=/dev/vda debug_pagealloc=on" \
>    -nographic \
>    -drive "file=root.img,format=raw,id=hd0" \
>    -device virtio-blk-device,drive=hd0 \
>    -m 4G \
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: force PAGE_SIZE linear mapping if debug_pagealloc is enabled
    https://git.kernel.org/riscv/c/c67ddf59ac44
  - [2/2] riscv: rewrite __kernel_map_pages() to fix sleeping in invalid context
    https://git.kernel.org/riscv/c/fb1cf0878328

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
