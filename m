Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1A3CD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 02:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctJPkLH34wTNUgKdbVMleLEEAsNN2x1H/2mMCmwl3ho=; b=hXf/r8gn/UfRdw
	5D/SDCCD9h1S1srpNndLGEtajtTyrcwPCI0HEtL0JTa6TzqVprhAH82I0+9oeU7ni7wifPPM5PiBI
	/o2NoQbOeRk6l7xDvDHsG2zYObbJgg7Rze+ZU28Cl2nNmeh1kWhqCU8XcxmR+QZrfQchI4ZyNDXqX
	Hm8UBr8D8yWJzRdM4XDjsw9rb4+smZfob/sYn3Wj+YSCnVIn0BrBCs6j5qzG6We5ybi3YaFF9oiee
	k+dyEOmys2/8ntOF+OXA1gMM0pVcPfx6d5RZuntfgbbaErsTbz3fznIbDJzWfgT5bdBziBol6mOa8
	aRpPJlFmW951YzWUF+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtf0P-0000000E5Cb-1XN5;
	Mon, 08 Apr 2024 02:45:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtf0N-0000000E5C4-15s7
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 02:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 342A8CE0B4E;
	Mon,  8 Apr 2024 02:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697CFC433C7;
	Mon,  8 Apr 2024 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712544303;
	bh=zOcI/UJNgVpdplBO9a8CzD53CIl24xf01xvaj26Ddzs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ix8iBs74GbMER3N197bHAgFr8QMr2bjO9qYtsebIIs7N4xcJDTMuFX6oRZSbx6oB8
	 T9hzT0kXSRgAM/Dl4crrID9/Xr3/05wtfH7EzbDY6wsmewdjW367zUgS3N3A4thA/x
	 S1cLxM9Gu/UYiaWiVSjY1UXzuFFJRb6q/wjSHaU5WmYc4FVvkKHF3vkDC8XkwFeV0r
	 AqcceuQsuuGIiaz3Xmj2fic3APmlHfsWpZa4UBkzGBqMPFxegJqlMBiVDLI60x/JrE
	 JS9DOvGw7NvoMLWkcNMvAvF0UVvYgqRGJ3isoN6NxKcHlki6GNwx8EqQFM2ZnM8Kb1
	 AsHoDkBEMaXgA==
Message-ID: <a755bf7d32d2482a6318fab614f669f3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <2082b46ab08755b1b66e0630a61619acac9d883f.1711714613.git.geert@linux-m68k.org>
References: <2082b46ab08755b1b66e0630a61619acac9d883f.1711714613.git.geert@linux-m68k.org>
Subject: Re: [PATCH v3] clk: starfive: jh7100: Use clk_hw for external input clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Samuel Holland <samuel.holland@sifive.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Andy Shevchenko <andy.shevchenko@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Hal Feng <hal.feng@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Date: Sun, 07 Apr 2024 19:45:01 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_194507_508601_547E353F 
X-CRM114-Status: GOOD (  10.17  )
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

Quoting Geert Uytterhoeven (2024-03-29 05:16:58)
> The Starfive JH7100 clock driver does not use the DT "clocks" property
> to find the external main input clock, but instead relies on the name of
> the actual clock provider ("osc_sys").  This is fragile, and caused
> breakage when sanitizing clock node names in DTS.
> 
> Fix this by obtaining the external main input clock using
> devm_clk_get(), and passing the returned clk_hw object to
> devm_clk_hw_register_fixed_factor_parent_hw().
> 
> While name-based look-up of the other external input clocks works as-is,
> convert them to a similar clk_hw-based scheme to increase uniformity,
> and to decrease the number of (multiple identical) name-based look-ups.

Why can't we use index based lookups and clk_parent_data? We don't want
clk providers to call clk consumer APIs.

> 
> Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
> Fixes: 4210be668a09ee20 ("clk: starfive: Add JH7100 clock generator driver")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> After this is applied, the workaround in commit 7921e231f85a349d
> ("riscv: dts: starfive: jh7100: fix root clock names") can be reverted.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
