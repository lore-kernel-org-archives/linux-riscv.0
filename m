Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC9C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My76TpCaHe0lNxcRMC9T6jmGqt1t/QWuLjNWqd5I/ys=; b=Xo5iENN5b935Ns
	XPl2kWFMxqLmBD0djrckCQBYUKyeNz9S2WoT+0/jJMkUeLCsDUIkf5v+1b3xY4ECjdRRoNZtTKILv
	BmWisC6URbFnBLFPLS8yfGbHz06VLl3/IF3tuYtoUxpGCUIkNJ/IjyeZgQ4i0CloKtbwtoIUy58x/
	fIgM+f5u7iV7sfmAfkNdpw+8lh8aE22sBivPjhIDXs9kHjxqMeOgBSiX+llXCWoBm7TovZa9lgCFF
	Db1W9LMIjnQeZyjBFNdDfT/ZqzQw4xhB9IXegCvM+6apy00noC92jbZKd86BEC/LlNxRPQlaT4jDY
	+frXv7+oxNXvSaQqpyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7r-00DXew-0L;
	Wed, 30 Aug 2023 13:20:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7d-00DXVx-2r
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D28CF61F40;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B455FC433AB;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=7gwrtueLyswihMZE2JPWq840cyLUSNmg9lpfnOQrhcA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e6k88Cc/TU9FsjqPbaaGCT3TAzQdnDwcDOCQJGAriL1cZQXOG4+kR1DdXkS48R6M7
	 Qxba6cHLNS3Ao3zXNddcWauycZsPvdoqu4L5M8bJ9ssjb33I78NaKVtyMgVwOyz9gY
	 a4/QeqIQ0Jq03INtemWCeDpxp7083w0LCObbld2ORbGY3WB67LDE0OmdVU6VaI5Mpz
	 n/nXRXvpdXcRG31hJitTpXeVjEqGZJetn0ueGsKq/0gPfvIQOm5DHGzIAjep9bnQGj
	 HOsRt/kTDI6PA54ysAZ1ss0laEbbCqT53KBmN2Xt72Pjo0djq7zRkp85DfC+IRtz/s
	 kdicHPHCKDg3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C9A9E49FAF;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v10 0/4] RISC-V: mm: Make SV48 the default address space
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163463.19859.14293662814940071934.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230809232218.849726-1-charlie@rivosinc.com>
In-Reply-To: <20230809232218.849726-1-charlie@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, konstantin@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, mick@ics.forth.gr, jrtc27@jrtc27.com,
 rdunlap@infradead.org, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062038_027842_DB31EFA4 
X-CRM114-Status: GOOD (  10.55  )
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

On Wed,  9 Aug 2023 16:22:00 -0700 you wrote:
> Make sv48 the default address space for mmap as some applications
> currently depend on this assumption. Users can now select a
> desired address space using a non-zero hint address to mmap. Previously,
> requesting the default address space from mmap by passing zero as the hint
> address would result in using the largest address space possible. Some
> applications depend on empty bits in the virtual address space, like Go and
> Java, so this patch provides more flexibility for application developers.
> 
> [...]

Here is the summary with links:
  - [v10,1/4] RISC-V: mm: Restrict address space for sv39,sv48,sv57
    https://git.kernel.org/riscv/c/add2cc6b6515
  - [v10,2/4] RISC-V: mm: Add tests for RISC-V mm
    https://git.kernel.org/riscv/c/4d0c04eac0c2
  - [v10,3/4] RISC-V: mm: Update pgtable comment documentation
    https://git.kernel.org/riscv/c/26eee2bfc477
  - [v10,4/4] RISC-V: mm: Document mmap changes
    https://git.kernel.org/riscv/c/7998abe69d3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
