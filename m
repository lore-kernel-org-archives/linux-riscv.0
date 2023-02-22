Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0FCC677F1
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17nYFTXHpUmzGZsXobcBT8fFkcvxe8dGyEi5ZT8CI1k=; b=qJBZkMFrZBXQ2M
	Moh56pMiFxhAohRk64ALMdBZGIlHh8O+aQ0tIVfgjogS5zXXmukq8yEy0RB71qQFup9+tEXO3IYo5
	9QIiXj1e/FfCvEPsyXQui3Un216O2CjndcVtHecyixfcXBF/LYDwTjcVNTLEXGBUrw8agD6Bi0AwA
	2iiDCwbEyTJSTo4LYcp+JurRnYd4Xczfza5xchVW7uzxEOJT8F85ikMznjbvsbs5yskDrboQzf21X
	qv/N7i84LajOOvpIlEzoSFlvf+Q+J2ciN0ITZ4qyci2FOzZIpfD+4D171qTai2Nqq6Tc51ds1f7ZO
	AunlQ+9t/Sja9cvtibYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbl-00CmCK-Pu; Wed, 22 Feb 2023 15:00:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqba-00Cm77-Rw
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18E8B614BD;
	Wed, 22 Feb 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E37AC4332D;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=+MRE/LAZDItpygtqfBDDWhz2Cv1d/xSdGOKWBaWGtdw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q0aCcZ1FFW3QQ5FQTzVJ6Uf0gGHxOx1pE9wTuXUUvDiXuG7o/4jjXGY9+QueQhQHy
	 8qQXbLmEVfpWfA/oL8xKyQW0bW2f6sN3M94/j6Hcxnvpw3yXLqcITu7NdNCRvm3u0v
	 llnw7bqwwbxOt8N+jFnPqptS/nzSP+fdVAiSSlNgmx2yL+TK6ZwxrrmINf6bYhOZin
	 9LWICfnQL2ihBBDTzbe+woXG9zO1wGr4ko19LDFyEP92/z97DJyHeViBNRqVyx81kh
	 N3gFS1DQvU3nWWz1v3/riT9rAJ/1DN3/wYglC2SfuK7o/Xxe67/RKUzXQ8OjYosHyb
	 4WmVspJVgkQzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8AACEC43151;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Only provide the single-letter extensions in HWCAP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802256.24438.13163769473587926363.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230202233832.11036-1-palmer@rivosinc.com>
In-Reply-To: <20230202233832.11036-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070026_982127_248429F6 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu,  2 Feb 2023 15:38:32 -0800 you wrote:
> The recent refactoring led to us leaking some HWCAP bits to userspace
> that didn't make much sense.  With any luck we'll have a better scheme
> soon, but for now just mask off those bits to avoid polluting userspace.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/include/asm/elf.h   | 10 ++++++----
>  arch/riscv/include/asm/hwcap.h |  8 --------
>  2 files changed, 6 insertions(+), 12 deletions(-)

Here is the summary with links:
  - RISC-V: Only provide the single-letter extensions in HWCAP
    https://git.kernel.org/riscv/c/2350bd192fa2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
