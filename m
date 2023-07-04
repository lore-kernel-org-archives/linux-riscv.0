Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D49EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ynEuu/kp6ilglTeQRvR2RXrs2l4AnDPGfb6UOn+yjI=; b=5GpFWYx3gPFv/A
	tdDTSRWnxX1HXVGzgyD3ci8tUYuI7LfoYTXrYW1oou/XUQdQpFin49K74C7kDZenXp874KiWRMKt5
	s3bf3tfeGuBWgG/PhmD+KUWM81I06aiBtHaa9UF/Z2HL9Su0sr/zX7QSfnAIS7Mh1d7DUZi1jPmG6
	r2iI0IMM1FC55ygnW9rGgowUcbP26NUVebrt0VK9nCasq9xsIho5GosoqOd34xK3GiCYP1N0l4Y+q
	uXUz/Sk5VGVnrLuQRplJ90dH/zzfeEWdTWVV32IjlD58toCaXK6sVo7wSdO/luEW0CLMxcxTO5yIS
	FP6MIUSg6+9x4H13PFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhyz-00Dfbz-21;
	Tue, 04 Jul 2023 15:30:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhyx-00Dfaw-0F
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 15:30:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65DB661290;
	Tue,  4 Jul 2023 15:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBC24C433C7;
	Tue,  4 Jul 2023 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688484621;
	bh=mRq7xH15VXJDxmtW3iuqpiG4oT/4J+rHNWrZw1Vgtik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e1qvcozjIFtPVctgcHr+XcCgiqn4sGp4qer8gFrPN75V6NDv6MAEgFA3R5Z/LDFTh
	 YctrodbviObiVmgGEy8sB2S6epS+lFo252d+UViHhywJY1s2WYsBfYZVl6F5U9uBUm
	 oh0gdQK0DKylLyRIG0Lb+ybfEu+3B8KllJQlWAC47bc1Ynb5spXxfl3LBgTjEUzVdg
	 s8iofwf1UDNwQQOQg5VYH61JJ69Ul6APkK+OZhAzSpO+VmLHCTBDvXsVua/zxWAI38
	 r8Ty1zrnJOXug3psklpq6kFO7dCtkS7N/fPVEgHNriLE6xvE3h5maopNAFjFsmhkw7
	 QOert9zw/S5uQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6289C40C5E;
	Tue,  4 Jul 2023 15:30:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vdso: include vdso/vsyscall.h for vdso_data
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168848462174.9093.2909110610886712536.git-patchwork-notify@kernel.org>
Date: Tue, 04 Jul 2023 15:30:21 +0000
References: <20230616114357.159601-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20230616114357.159601-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_083023_153028_1D54D747 
X-CRM114-Status: UNSURE (   9.41  )
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

On Fri, 16 Jun 2023 12:43:57 +0100 you wrote:
> Add include of <vdso/vsyscall.h> to pull in the defition of vdso_data
> to remove the following sparse warning:
> 
> arch/riscv/kernel/vdso.c:39:18: warning: symbol 'vdso_data' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> [...]

Here is the summary with links:
  - riscv: vdso: include vdso/vsyscall.h for vdso_data
    https://git.kernel.org/riscv/c/54cdede08f2f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
