Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6EC4706C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvxLxYerZXfbYwYW5JkwXa/fWPsmIfuou/oONNBlrsI=; b=wW6RvDNLK8LYNr
	3fjAr3H7zwW+FKvhtW2hGaz4QCeSi7/btHaKBBKg7YU1LaseJFUpnGkHE8tVBcQgeVVmjeJkBwZEv
	NWw5+BsqC6tNTerQB3emzJgnlaOiEiINnoa5MPBli90LxM6dfioLJyq6LQE96nURYKKld1pK+yjP2
	Q82qHQttvdILibL8M+dDRqRXacuhjn2W9F5ovv/dZ1K+TRZnAGKY04PAf7cvy3b452eYbSa0/VLqM
	a658axlPFuTkLLOwnBBOjY6R7wg+mEWAvQHXRPkVvGCrC4fCara6P1IGlzo5hI3JukYYtoQrkz1Kj
	9Zn9/pRjJDFefvt189OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNItl-009Tgv-2H;
	Tue, 09 Jan 2024 20:40:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNIth-009TgC-2K
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 20:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8714061557;
	Tue,  9 Jan 2024 20:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3051AC433C7;
	Tue,  9 Jan 2024 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704832828;
	bh=QqQqgvArCAFMZzsCuljjBHuZF/IAw38ss/Kp6GE6Tjg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=unzhnCwNzY2FzHAIGxFYL/q2JHHWvjKjX/vpDuWLftJAH2IgvusFhXbttx4yssJdh
	 CJr0+qfrpzrjiIM/jObh5in1gvK5L3fl4SaOvxhNE+4Dbn8zbeF+sz1dXkrZK//3cA
	 aLDHvbMq53tjKk9xFBm1jKufJ/vtN47pcdkSzQldAfo3cJcvtmLtyytSwaBuCbMfrI
	 WTiWgYNwx4YPGKhF2ZudjgnBDR+fL0n5JWFOdOGw629XoRe7FWYilhxapMkcRQgTud
	 AH05MkJjeFwuPrpkT2Hi78U06Jw/wTyEt8bu0fSBPTSxzailwxeFOso0CBg2yv4XPr
	 wQwqO3LBjnd/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16E8CDFC691;
	Tue,  9 Jan 2024 20:40:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Check if the code to patch lies in the exit
 section
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170483282808.2051.14425561693362087053.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jan 2024 20:40:28 +0000
References: <20231214091926.203439-1-alexghiti@rivosinc.com>
In-Reply-To: <20231214091926.203439-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, zong.li@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_124029_827371_E60D2E80 
X-CRM114-Status: UNSURE (   8.52  )
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

On Thu, 14 Dec 2023 10:19:26 +0100 you wrote:
> Otherwise we fall through to vmalloc_to_page() which panics since the
> address does not lie in the vmalloc region.
> 
> Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: Check if the code to patch lies in the exit section
    https://git.kernel.org/riscv/c/420370f3ae3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
