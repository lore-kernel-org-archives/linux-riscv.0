Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6F5C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yjx37xWr83nBb4HIbJ9Wz1H8zlgcw9Xlwwmo7yr5rv8=; b=1OPFQn3wvLOxSz
	pyD+oy+ZZ/RprN2JFx3NdXf6uC2kCxdN3zeyRO3TTnRMyom9lqQamEaI0q5rPWtuHCGhBzYLGr8Rg
	BF17Lb126E1AEilzGmXZBsnDbAGk6YZcByYqpx8MYNMStziRJHQgjaXyBZtPjMYff0798IHZXYfJF
	q9SRgaUbwbu3zQ2iSd/S/TboArxOx47/bD5Fulx0h47XdLqKlp6vtUnjw1uao4/b5QxlB2zzvv/Uc
	cPaEsxdFhedBTChFfQoL3B+Y2nCXlHDxFaN5vFDdnPdC75FN72GCwo5U0zQHjS6F7zz1dPHjWy4DD
	lyuh+HFfZ67H60m2MPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vki-00000004VcY-1fX1;
	Wed, 22 May 2024 23:52:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkN-00000004VNQ-0hSF
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E0CFCE1387;
	Wed, 22 May 2024 23:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD314C4AF10;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=n9A8B2bi1boYYZUvXlGtFezy2ShJanph4rjH8GXQdoA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rbmiGK1u/ss/abz9OJF4XgUBvyZvlMriaHA12q4Ru1tBpxNiObC7nvN+jkcz5MlkI
	 lLACip46Q71mta/ConRPspZkpppHTyAGCHWZQ/1lDYmdmpEaDp9bAX0LzgAN1HyLHc
	 iMocukrXukSwUa0u6ruWOgEvWT6pzrT48ucfSoS99kqjmm22fbjcKlsehGmS5kaaEg
	 fFNlQ6Ynj+IX+9GCo2/Cdlas7cn2dpIZU+xh+/wC/kGw9Ety/V9rsMoNTEXHsXAVLp
	 6F6OkoR2Vbth821mLFGpoJtbYOxw/kVnBUWOKWpy7dCIxyZOjWtl6EZKZEmt3iT8Fx
	 wH5C5iiFc4mNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1A5FC43619;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: uaccess: Allow the last potential unrolled copy
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190785.9409.1593588970269968258.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240313103334.4036554-1-xiao.w.wang@intel.com>
In-Reply-To: <20240313103334.4036554-1-xiao.w.wang@intel.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com,
 nick.knight@sifive.com, ajones@ventanamicro.com, bjorn@rivosinc.com,
 andy.chiu@sifive.com, viro@zeniv.linux.org.uk, cleger@rivosinc.com,
 alexghiti@rivosinc.com, haicheng.li@intel.com, akira.tsukamoto@gmail.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165151_547154_0C9C360D 
X-CRM114-Status: UNSURE (   8.78  )
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

On Wed, 13 Mar 2024 18:33:34 +0800 you wrote:
> When the dst buffer pointer points to the last accessible aligned addr, we
> could still run another iteration of unrolled copy.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/lib/uaccess.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: uaccess: Allow the last potential unrolled copy
    https://git.kernel.org/riscv/c/74362d66a416

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
