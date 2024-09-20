Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46806CF58E9
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSfx7yolK0RCCcZ9qUChGrtbxpgrWqsk6oqFb+YS9Bw=; b=cp6Y2s/z8ZMyIH
	/ItZ0yZS9OvTvF33atgRn1duiVmBiagXdKBdhtrFdgBCYwFh4sLTbuqOMr2pE+xOswKz/jPLWi7Z+
	pLzviz1hdulZPztsmoXsiLj0BqUAWoqdLXBxqlVHW0pHS/PlR/pOEcSRq6dzsZcPBKiu5IBSQdYoo
	vIumZ5F0JKknoF80XJ/iOee0+ewQErprCInXWn+OoE1E3FFg/OiGr2mLxuI2MoPj2c7FudCl0E4lI
	cvAYzsLt5TD+mMbTFgqRpWLqcyClja76YpH5DJBxUZUIO1yblnOLEA/XbaXIgHM2nXfGpD+fTv73v
	mly1FBxoD3PNLbyN+wYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ0i-0000000Blq5-3bnA;
	Fri, 20 Sep 2024 08:29:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYsW-0000000BjW0-10yi
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 08:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00DABA44142;
	Fri, 20 Sep 2024 08:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1813C4CEC3;
	Fri, 20 Sep 2024 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820434;
	bh=E1vOj1nILZ8LVtG0PKmz3Gx2hZPvwVT/rb0OTz7pKIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aF5kVU7L+W9Aj18WQinqyIwdqPJa7iinovbJs+zB5oprh4KnDcrd+O7r1NaWiaror
	 q1sVo0GHUgWinGq3QiLu7Hj8N4FCWn0s+1PDi7qhEtzbHxUpgaoxSMCiz2i6Ait3JM
	 wpMG33NcTkxX4Xee955HCDvm7L7R2VVejZEl/LBppHR7mbAcvntfeh3RhZnsYlH1xB
	 qmINUYwomMRH47LcFXnFpwHU2742AcEA5Y6NjqsYRRwv2Ak1ssvBp/UgeRMcKlzBhW
	 HqyJzGIq0R1hgqNaGxqwmJi+ovWIU7INgYBmuo8cDYrFjhGL60f0AiKa9L2gW6d4mH
	 2Lktdr1L0GByw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEFB43806644;
	Fri, 20 Sep 2024 08:20:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Improve KASAN coverage to fix unit tests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172682043622.2112413.9572431906377753101.git-patchwork-notify@kernel.org>
Date: Fri, 20 Sep 2024 08:20:36 +0000
References: <20240801033725.28816-1-samuel.holland@sifive.com>
In-Reply-To: <20240801033725.28816-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_012036_442395_80352D13 
X-CRM114-Status: UNSURE (   9.01  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 31 Jul 2024 20:36:58 -0700 you wrote:
> This series fixes two areas where uninstrumented assembly routines
> caused gaps in KASAN coverage on RISC-V, which were caught by KUnit
> tests. The KASAN KUnit test suite passes after applying this series.
> 
> This series fixes the following test failures:
>   # kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test.c:1520
>   KASAN failure expected in "kasan_int_result = strcmp(ptr, "2")", but none occurred
>   # kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test.c:1524
>   KASAN failure expected in "kasan_int_result = strlen(ptr)", but none occurred
>   not ok 60 kasan_strings
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1531
>   KASAN failure expected in "set_bit(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1533
>   KASAN failure expected in "clear_bit(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1535
>   KASAN failure expected in "clear_bit_unlock(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1536
>   KASAN failure expected in "__clear_bit_unlock(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1537
>   KASAN failure expected in "change_bit(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1543
>   KASAN failure expected in "test_and_set_bit(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1545
>   KASAN failure expected in "test_and_set_bit_lock(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1546
>   KASAN failure expected in "test_and_clear_bit(nr, addr)", but none occurred
>   # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1548
>   KASAN failure expected in "test_and_change_bit(nr, addr)", but none occurred
>   not ok 61 kasan_bitops_generic
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Omit optimized string routines when using KASAN
    https://git.kernel.org/riscv/c/58ff537109ac
  - [2/2] riscv: Enable bitops instrumentation
    https://git.kernel.org/riscv/c/77514915b72c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
