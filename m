Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16079C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rw3XW3jmHeDMtNFpX7O5v8RSp1LZxmYKs7IJsnpQWQ=; b=ct7A/iAGUZ2YyX
	Zmf2qKF6pKeovqfa8rKZDKuOS1v5dy8fonswyhh/Re2fU6T8olJaNbT/CuCFPzuaWnxEsPLGrAyzM
	NUPf6gZuwNJlGnaEfzVkbB8g4UM64adnnpKNAgctyLvNcDfNIfqo1NXFfgd2W9cAZCxZoG4ND7six
	lYbQcD0LI0nKoz21Q59M1YukTbuh2kLSMVjjMtV06O9JKWWoWfuD3E9XeZsGCyQk/TLoWLSeWtI8n
	BDWO/tMTcrQDc9tj2Brx/uCQPcGuntRdv5CIbVkgt24bTzZMbpD2/2XsV/A5fd35koKThILcUjYXx
	r1cETY1D6tf4uJEthizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23t-000mXN-02;
	Mon, 08 May 2023 14:42:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23q-000mUy-26
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9377A640CD;
	Mon,  8 May 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 618F9C43446;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=koyU6f3xsH8g8EO1siPFgFEXlH+fNzXNitnViL5XzNI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=awCYICC4lIDTzYVocGfFrX/jwkzIAkAuoKj4ttekSJJBScN46uZ4EATtZdkVwHKNr
	 r692NNQMV8jYTBt2HRgkrTvuKq8iJJy0jrP7P3tb6mHlcy6J3x+E1U4UtD4Gnruwz7
	 G5oB8QXUaPWMQl1MBI8mpBQkjnIwT8OP0X9dpq+o8Hr5u29W2R+7TrBBvyHW16mBOd
	 c/7nMViOblislpE1Nd/T01KqbKQhHkiUQHyycPVGuABpYmh5eWh3nO5GI8h2AvjEen
	 CqrXkAh7bwmz9J/3qoLAxthul8kWIDhjNPhl9WCvvOFM4+bBGo3PR4xkbTqPw8bLbM
	 z4eulBWBcSFjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 392C4E26D26;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: compat_syscall_table: Fixup compile warning
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691623.25692.1628612275748085711.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <20230501223353.2833899-1-dfustini@baylibre.com>
In-Reply-To: <20230501223353.2833899-1-dfustini@baylibre.com>
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 lizhengyu3@huawei.com, bjorn@rivosinc.com, heiko@sntech.de,
 liaochang1@huawei.com, masahiroy@kernel.org, alexghiti@rivosinc.com,
 jszhang@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, lkp@intel.com, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074158_754066_63307F7A 
X-CRM114-Status: UNSURE (   8.38  )
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

On Mon,  1 May 2023 15:33:54 -0700 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> ../arch/riscv/kernel/compat_syscall_table.c:12:41: warning: initialized
> field overwritten [-Woverride-init]
>    12 | #define __SYSCALL(nr, call)      [nr] = (call),
>       |                                         ^
> ../include/uapi/asm-generic/unistd.h:567:1: note: in expansion of macro
> '__SYSCALL'
>   567 | __SYSCALL(__NR_semget, sys_semget)
> 
> [...]

Here is the summary with links:
  - riscv: compat_syscall_table: Fixup compile warning
    https://git.kernel.org/riscv/c/f9c4bbddece7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
