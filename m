Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEA0CA0EC1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4/kdU2r83HqCYSGHUbsM7urcFhEhRooQs8syQJtDfg=; b=ctzQkvgfz0tkf6
	xYCRYmME/z4A9FHy7uW1mJdr2jCeidVgFWjewDumYUtql3YZWJoSc/VVwj9tb0BSQFpupRIMwWEPS
	L3WohAcqGBtPzwSLGAIKYmBi1/qMqpe4/zYjw2oFxMxOGUOpOQXXkMqjcfMqTttIHl5Ebhi5i1qmX
	VWoMEZGy8mU7SXk6S0Cx7XTjX3dLtCqOKHy49Bsr/qwvydr4qqB+VRXuCugyV89QlZCg7KMyCfdYz
	BMHlNZ06JUIp+2saERklpFxrsXkl7RsPLTSYScgK4HPcCEz9qmub6vvN1+chxHYz6cf+PkOsKMI3u
	1SGy14EdEh51MVjY/A1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnu-0000000FtLj-3gfd;
	Wed, 06 Aug 2025 17:19:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjk-0000000FsAn-20Kj
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 056705C6A5E;
	Wed,  6 Aug 2025 17:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7509C4CEE7;
	Wed,  6 Aug 2025 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500535;
	bh=t5RvC/jgYvIhqsTqBesHXP99CEex0zEa1a7guj9tKQ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AtBUrMtmuj4L6QFpBIYTQk4BdT/sDoh/9oy8svXGi0MR8prP3/zlvK0c0XEXczvbT
	 by/HFAIiwNGd32K2qe4Z+70g6YyzKQbvz7IOQUUH/MlKlkPlBebk2VWiAWLmpFXJvV
	 wuOCZDT7Mq8IB4MSTungC6JEvbayqkIQsPGmDvJKKOc2iAkwDDqQwSS3lsiDlA2li2
	 TFvsvV5/YuYRfEzOBdJym75s8878QYlP6UFf2EsuOHWAzvvBAjE/N/FKcPQZ0snSdf
	 BWXuuiHL38f9RIBw9Fbv9rW5eqkg8sw05P2j9FfBd/yMSkIIpj2ksz+gRycFx37CNN
	 +WCYWoXPsZ7Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE69383BF63;
	Wed,  6 Aug 2025 17:15:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: uaccess: fix __put_user_nocheck for unaligned
 accesses
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054925.2863135.866620119887163563.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:49 +0000
References: <20250724220853.1969954-1-aurelien@aurel32.net>
In-Reply-To: <20250724220853.1969954-1-aurelien@aurel32.net>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101536_571040_8B037253 
X-CRM114-Status: GOOD (  11.46  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 25 Jul 2025 00:08:52 +0200 you wrote:
> The type of the value to write should be determined by the size of the
> destination, not by the value itself, which may be a constant. This
> aligns the behavior with x86_64, where __typeof__(*(__gu_ptr)) is used
> to infer the correct type.
> 
> This fixes an issue in put_cmsg, which was only writing 4 out of 8
> bytes to the cmsg_len field, causing the glibc tst-socket-timestamp test
> to fail.
> 
> [...]

Here is the summary with links:
  - riscv: uaccess: fix __put_user_nocheck for unaligned accesses
    https://git.kernel.org/riscv/c/a10ce19d93c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
