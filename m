Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F726CE8E9E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMP+2kQilFgmGEeMtAwywnjeMa3EN5UMRWfpOcZdtaI=; b=As3LKMjepZA988
	yQhOQzIHry2tBObkfyMT2utrUCxd3P+NtYSqPsCIEqH6LvVCiVDCAXlXuVpT0BYOowUFZrZ1rmEeR
	Jtwqq6molYwxAcbRBiV/MPCkmnwGx9LR3jCr7b3iZzbqXQsvp6Rxz0o8+hZUIN9ckB7wo39KHQL6e
	Xk8v36jXTDfyzmmguQUrEt7xY2GM6xLLGYsZ7FminVGfZ9380zIwskrtmByzjLP3yNGnn2hcuw47Z
	1v/cOp52IdpA/lnXT2hB6BmK2czRo5UgSHfVVLR8DS+5OoMkZJ/mqiDy1AilLKRQwp/ohLyZNBN8C
	3DzkxlHjhmXfW2nHQuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42JJ-00000001Qb8-2l0h;
	Thu, 24 Oct 2024 18:11:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42I3-00000001QFw-46ZX
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3FF25C5AEC;
	Thu, 24 Oct 2024 18:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51998C4CEE3;
	Thu, 24 Oct 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729793431;
	bh=w4fySPJv5uZgQTL4WgE6qIKYoEG3b2iK1oDC1gKHTKM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vL9Lffux6p9r7X+GSwc51QMR8ZLde4iL2RgiyjnsMLWOCsGDRa+CWu5n84RpRgRg+
	 n4KdiWLuw3RYPwogHSYon8iLAFtPTtPP5/lr52hJXKJLHeoSbYGvoes2mWpkT8AATD
	 6kkinmgyx3ulWdb21xlVGKx2i6B/YBkB/BCLiNY05jeHpTQ53WprWJnfn7sgBzjV4z
	 dens357CWvEzLpnwsTTXx3th8Pu5wH5Z95b5vapFG3/VmpQs4s7F6eMxoru5SQrkBd
	 iBpL/alUxJi6oZVsiIglkB6rRWU4gmWUC5fbFXTUjNeVP2D9oMF7r4lTccqUe7E8Lo
	 XG0M193/rrbjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BD8380DBDC;
	Thu, 24 Oct 2024 18:10:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove unused GENERATING_ASM_OFFSETS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172979343775.2335128.952260572481503482.git-patchwork-notify@kernel.org>
Date: Thu, 24 Oct 2024 18:10:37 +0000
References: <20240816101912.1049329-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20240816101912.1049329-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_111032_085575_27E34727 
X-CRM114-Status: UNSURE (   8.40  )
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

On Fri, 16 Aug 2024 18:19:12 +0800 you wrote:
> The macro is not used in the current version of kernel, it looks like
> can be removed to avoid a build warning:
> 
> ../arch/riscv/kernel/asm-offsets.c: At top level:
> ../arch/riscv/kernel/asm-offsets.c:7: warning: macro "GENERATING_ASM_OFFSETS" is not used [-Wunused-macros]
>     7 | #define GENERATING_ASM_OFFSETS
> 
> [...]

Here is the summary with links:
  - riscv: Remove unused GENERATING_ASM_OFFSETS
    https://git.kernel.org/riscv/c/cb873b28bc2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
