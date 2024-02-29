Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE26C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 22:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxchrJFnVg8BtCsiDdrlh9MyClLbe91QMmRn1V80lM4=; b=oqZPgrv7v5CaXf
	QOfc7UICFdHsMiUhW8tU/fVurzcPpVqEE4xdGD7FdgTEJNAzDVZ7dQUTXBdjt6hiXvVTAC3aua2UA
	I/ODWFTyxc7njd7/75EfPK7gb1/ttUBbY4GArS+7hsiMBEInGXzcKPGMHZeJZfydSoFBbfH9dw4mT
	mB1lAFXoXGkjqed6GAYxKB6IUsktklqkyrsdCtar3j9s7qD4rsU13HmkxfBYG2DTTGdzYBZDLBD8S
	YPoS5zJ0Enr4D1i81x9j1t2OHqctn/+45vPl5mNtXl2+bO4aP/YLyqpK1JJ0anWNfKmWsfDyC1Rx7
	leS+9+ShQERWbI8SNhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfoc2-0000000FQAa-3xWX;
	Thu, 29 Feb 2024 22:10:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobu-0000000FQ81-0gGG
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 22:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6EB53CE1D9C;
	Thu, 29 Feb 2024 22:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4F0BC433C7;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709244634;
	bh=mEa78pmFlx7uzj88hY9fhULP5AYaPKAw9Rly9cHD/m0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J/ULrF8OdiLCmDlhOBTOVOmM8b2JDA1SNaYcKe/CZcp8T66VhPsiuW6uQGW4xH++L
	 usg+oQyTP6a5Ko2IoLDhy0LAr3Eahou/LrbJ6qG4qZYlKmGGu85yq+z6Z5Z3Ak8Dsx
	 JX/TaoBn/3g5vZ43hR60HSoQ3PrkwTbwlifZOGD5MMpx4ArB8zNx+gCVqHJy+6+NuI
	 zdzAARExjKYlOKyOJNDp9EZENAo89igAyZpKDEh1wrvtsU76JHR5PNez10JfTwo5wX
	 wxyd2zSrCvkCpD/g8mYhPJN34l9gIeYMvrtzefRPb3Pl72HqJ8G+U5jMCwCBYnySjn
	 lzvPipjaD8FgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8FD33C595C4;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes 0/2] NAPOT Fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170924463458.14902.8377993668813531698.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 22:10:34 +0000
References: <20240227205016.121901-1-alexghiti@rivosinc.com>
In-Reply-To: <20240227205016.121901-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 conor.dooley@microchip.com, panqinglin2020@iscas.ac.cn,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_141038_405409_FBBCF6FA 
X-CRM114-Status: UNSURE (   7.82  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 27 Feb 2024 21:50:14 +0100 you wrote:
> This contains 2 fixes for NAPOT: patch 1 disables the use of NAPOT
> mapping for vmalloc/vmap and patch 2 implements pte_leaf_size() to
> report NAPOT size.
> 
> Alexandre Ghiti (2):
>   Revert "riscv: mm: support Svnapot in huge vmap"
>   riscv: Fix pte_leaf_size() for NAPOT
> 
> [...]

Here is the summary with links:
  - [-fixes,1/2] Revert "riscv: mm: support Svnapot in huge vmap"
    https://git.kernel.org/riscv/c/16ab4646c905
  - [-fixes,2/2] riscv: Fix pte_leaf_size() for NAPOT
    https://git.kernel.org/riscv/c/e0fe5ab4192c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
