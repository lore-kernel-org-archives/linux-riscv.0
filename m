Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC0DC5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+TRKSv5qmQl3O6OPlkaKxp3XrOHWRYbPBWn8TTG8ys=; b=QNcui3nnHRdMlC
	J/5t0kH6CPc89tGJPTkdvV02xCQBywhp6c/QZifUbjVt6CZR1ialhVE0yrbD+yKMSlefhk3VzjV/X
	7alvwi9x4NYBg9gOrGeHl+j/+3L+YvTjFibJWU+7dVw+UsM04cw1mvpm/pY3+PNnB1LfnJjuoDMTu
	3WXjO7/xO57cZSQsEew607ShUBbmJPk/KHYtZUcMiEswIkqN6CunOgz7+n4xfO/LMfWJxb6bwkbPZ
	9sb58FJDptzC/Aer1AVY5vBpb8XgnjplBdpgw7a2dQhpOP9AAfnlaXKdEFlZcToaF1a//1uKDCJu7
	HZ9f0kpaKuMhWcp/+9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfR2c-0000000AvLx-3XiO;
	Wed, 28 Feb 2024 21:00:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfR2a-0000000AvKa-1nu7
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 21:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B19E7CE22ED;
	Wed, 28 Feb 2024 21:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2917C433F1;
	Wed, 28 Feb 2024 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709154034;
	bh=MSAWTfEVrwEWwdECtjngCmanvERiNCcF+LUfK8Are3I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hgPHfMT8OI+cOAWCtHn9IIN6athVXtYUGOB28+882FsvFGo220tulqrRArVm3oQtn
	 bJvuj9oGnbQTtxtWooAMcJBmxnii3fdIVumskFy8lLrcppYhxHF5gpNWIVVsG8+CrT
	 LZI69QH0SjcDKQN14D6r1PdJD/EsSJ63XRmeIMFN8eKFiM5YGNLemWYCQTVtceF/ri
	 xD2aZv7JZfyYLMeISrH11qR8Lws+gUl/bvjJvE958G5EBp3S8R8QeqZT2xsh0a+JvK
	 SBDC7EhS8D+6yivDMgSxeTwvzf50T0gKcxbs4Nvz9MRHVsSBKcNEmde02QcWxJXFTH
	 jVjbFQBKlTRHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D076AD88FAF;
	Wed, 28 Feb 2024 21:00:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: fix check for zvkb with tip-of-tree clang
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170915403384.31531.3005880789311750599.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 21:00:33 +0000
References: <20240127090055.124336-1-ebiggers@kernel.org>
In-Reply-To: <20240127090055.124336-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 llvm@lists.linux.dev, brandon.wu@sifive.com, nathan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_130036_680185_EAC12E08 
X-CRM114-Status: UNSURE (   8.72  )
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

On Sat, 27 Jan 2024 01:00:54 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> LLVM commit 8e01042da9d3 ("[RISCV] Add missing dependency check for Zvkb
> (#79467)") broke the check used by the TOOLCHAIN_HAS_VECTOR_CRYPTO
> kconfig symbol because it made zvkb start depending on v or zve*.  Fix
> this by specifying both v and zvkb when checking for support for zvkb.
> 
> [...]

Here is the summary with links:
  - RISC-V: fix check for zvkb with tip-of-tree clang
    https://git.kernel.org/riscv/c/886516fae2b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
