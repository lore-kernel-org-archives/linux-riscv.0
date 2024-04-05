Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC2EC67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rz5F/cCUe8bqJtKmMzSIR2HUZm0AmekZ5MjUBBM+1jA=; b=ZC0GZH6iM1XoJm
	/aU4hAsUa9TJlwQD5Ydh5PrOmkZdp1Kyzc70iCdury3I5VOnqgZ0zILqVJwUfiFqvjBfpunNxdzNq
	cMD+tR1RsDKFG78H//WQolBtZTy9Z+SGmnJLJvH+1/4FUCON36jYSXj8DBQsEXylcwy2Usk8+ukN9
	WdkgZ6RpnEaPOGBX7Xl79DGk7rGr41gxN2OVqIowkSvLOoyWosaoCJ2RDdYpMTwTK8vbsSjUzM9fx
	NurWUcxbBz30L8ta3hQCiXNOu25X0Y2lVtXI9mHITegRxd9jd717BXkxrf+iwR74TlD+JxI/EGlm0
	GrBNcox6gBhRfEP0kBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsloK-00000007qZQ-2SrE;
	Fri, 05 Apr 2024 15:49:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsloI-00000007qXj-1Ay5
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 15:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B12161209;
	Fri,  5 Apr 2024 15:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBC0C433B1;
	Fri,  5 Apr 2024 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712332137;
	bh=IgoFna4ozbyY4uim9EA58wTZVLELUeO04TswSLteP6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNCLxQV/d9Gm8N9ut19bdF6HDO8Xy+cMGp/jd3klpEHI9GaRqDgTpd+BEyR/Ne7+m
	 jmzc7s4ds+hI4pRDmzI0bnHMXtYvqA1G171h8rzfmeT0U4Taorij1FLbUgitNeitcj
	 HvOLoIXoz+qZzCjTnM6FpZeRSfnt/+czJccKjMFVFU/OsSGZ8tP4qz3ATyVApCe6em
	 sRKC0PXoChZKTfUOybhKGkukVeUuMeOUSif3EmyuqCNJBGtMi3xYqV+GO4gNjnmR/z
	 ua5epYOwdOisi0YLgiqbbvyai5CxnwUubZrMrUinYnVOwmr730HIb6U1tW4zMnSV8G
	 pgE01LuYwi7DA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] riscv: Kconfig.socs: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
Date: Fri,  5 Apr 2024 16:47:36 +0100
Message-ID: <20240405-revolt-food-4654ca0ac5b4@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MZ6COhcm44GicWVOSRcaxUS9DaBxroGchNqsbFCZFmg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGkCsuIr+IwaOV9x8rQLzjqXWXXzZomHRVWxd3DoOmmNX rPIwJKOUhYGMQ4GWTFFlsTbfS1S6/+47HDueQszh5UJZAgDF6cATGTrbEaGB2F7Vix9F969e0Fx VOaE7aXFhWHTlr8TvT2zZZrlUX6LIEaGlkl2b/7KfJCc8Fm175dm+YW5rlzyWkxLQ7ZzTFKa1fu eEwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_084858_446299_7FF2FBF2 
X-CRM114-Status: GOOD (  13.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 29 Mar 2024 01:03:22 +0800, Yangyu Chen wrote:
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already in the mailing list [2,3,4], so we deprecate the use of
> SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from now
> on.
> 
> However, the K210 SoC is so special for NoMMU and built for loader.bin, if
> we share the ARCH_CANAAN symbol directly for K210 and other new SoCs which
> has MMU and no need for loader, it will confuse some users who may try to
> boot MMU Kernel on K210, but it will fail. Thus, this patch set renamed the
> original use of SOC_CANAAN to SOC_CANAAN_K210 for K210 SoC, as Damien
> suggested from the list [5]. Then, it made some adaptations for soc, clk,
> pinctrl, and reset drivers.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/5] riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
      https://git.kernel.org/conor/c/ef10bdf9c3e6
[2/5] soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
      https://git.kernel.org/conor/c/915fb0e31c5b
[3/5] clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      https://git.kernel.org/conor/c/8e5b7234ded5
[4/5] pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      https://git.kernel.org/conor/c/c1556a9b426e
[5/5] reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      https://git.kernel.org/conor/c/68f41105ea07

I added another commit at the end, deleting SOC_CANAAN given all the users
are gone and it is not user-visible:
	https://git.kernel.org/conor/c/0eea987088a22d73d81e968de7347cdc7e594f72

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
