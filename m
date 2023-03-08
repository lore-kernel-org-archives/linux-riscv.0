Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E00C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMteqJy0X2YXrYMmjKEi8Lslpg724NJlLJZuACyhuG8=; b=10Gx5rBW//ks84
	1LQYRMcE+7qUOS96HBSq67y5tNEt+wKr/dySHADMBb4UW0blOu1WiBXngvgneNXhPuwhnulL9+aRv
	eYlJf6cUzgdwlVGm85XLVaW/T0JGe/doiAcOOo8+NKWlFqvINbam0qWwn/MlQTQN23zAzJe5ToTbb
	6QV9uK8O1qaA4bgsLoULSHG/qe5hcD77hfAWTmz45uVT/IZqUk2O+d2L9054d+LEM5EUj4JcnP7rr
	S4mQalc4QhSrxTFxuOZGfMyVGzSLH6Jxv/EWx8US1nv7mCOep6t3TXMfZO22bWKzdi9cbx/6FDSrI
	4A6uCwUHDEii1e1So4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkVZ-003JTs-IE; Wed, 08 Mar 2023 03:30:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkVW-003JRp-L8
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 03:30:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EFB1DB81BA3;
	Wed,  8 Mar 2023 03:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A45A2C4339B;
	Wed,  8 Mar 2023 03:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678246220;
	bh=5OPrOB1Zlr48DWUViK6j0Fy6jpixegIvZul/S1eMV1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P0OewE6KImVyn+o1ovvGPT4UVpVJjaly2jOe8KkD6n/Ar8IvHlclmm9K4Li2g3IHm
	 ViY+R95z4+y9dv+k0OYHjtAPBE6F1dlPwhsrKn/lG5bRfgHeDKvO7DCkbqTUvfXNJI
	 3sPLXXlb0lomrJN2IExcW1tqHV1XpbGoIaBK+3oq8GzvapDs9EP/OrqEZOcOaYYxij
	 VaTUboPQL02V5olqVLIuq/xKEyOztzvyOW3fgXImUkGRcxMGeDGdxtjGTpYVi9RyOw
	 x8jFenZDCuIPK86kzOJq7lTYRFPuH320CqlYYQ5Xw2LBpRctAuVE8bgGOa9K7YmoaJ
	 3OuYuTAiM/edQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 862FDC39563;
	Wed,  8 Mar 2023 03:30:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/6] RISC-V kasan rework
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167824622054.6983.17538269821612408608.git-patchwork-notify@kernel.org>
Date: Wed, 08 Mar 2023 03:30:20 +0000
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, ardb@kernel.org, conor@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_193026_881415_5B78E379 
X-CRM114-Status: GOOD (  12.88  )
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

On Fri,  3 Feb 2023 08:52:26 +0100 you wrote:
> As described in patch 2, our current kasan implementation is intricate,
> so I tried to simplify the implementation and mimic what arm64/x86 are
> doing.
> 
> In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
> instrumentation: all kasan configurations were tested on a large ubuntu
> kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.
> 
> [...]

Here is the summary with links:
  - [v4,1/6] riscv: Split early and final KASAN population functions
    https://git.kernel.org/riscv/c/70a3bb1e1fd9
  - [v4,2/6] riscv: Rework kasan population functions
    https://git.kernel.org/riscv/c/fec8e4f66e4d
  - [v4,3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
    https://git.kernel.org/riscv/c/1cdf594686a3
  - [v4,4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
    https://git.kernel.org/riscv/c/415e9a115124
  - [v4,5/6] riscv: Fix ptdump when KASAN is enabled
    https://git.kernel.org/riscv/c/fe0c8624d20d
  - [v4,6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
    https://git.kernel.org/riscv/c/4cdc06c5c741

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
