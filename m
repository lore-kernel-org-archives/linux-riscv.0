Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6492C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNpJxcf7DxeAzp3FmcKTkO8BGI7W9oPey9XjnL3deXw=; b=WWA5ijaf/lE8VE
	9hvYcOluhCGese94XXRteEDHW03GxaXytn427EzEyxCFQkeuQdsRInxFX6h/ql5VOmGjiw7ONI/iJ
	uRR2cqNVaoHUrmfiqed9TG3O9ku/hPI2qJw6zqIcga/kObcCRR+uPsCxPGppmMbX6GwzBcjZOw5QY
	b24yj7ArOBsCIJ0vYcvhCl3MXhdLWqQJUSMT/pmRm0NpZWoThCE/b5neM990+94qX4gy9kfwo65gh
	P3UJaLR5op6+v4iNgcm1ELbQtpgCSjwA7zoJuDyhyZFEPYwHRiP/gNS6rwxM77LE2PhnuzbbS53v1
	iWWID0YNjF3nYWKBgILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GO-0000000GiHd-3KMU;
	Mon, 03 Feb 2025 21:45:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uz-0000000GQKI-3iZx
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7EDCA41C1A;
	Mon,  3 Feb 2025 19:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F09C4CED2;
	Mon,  3 Feb 2025 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610136;
	bh=bFHEjxAFUuenB9sN+HmVABGDf7gISIBleG3ZK2RKRRo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IZwxreFq/t+9hEYofNuBXmm8bjTzplV1TNx8BMEhL4N/snE+Rjq2uisLonSCUVifX
	 knFQs6si5mpZnPkXB/0mxHeoCiq7K05u99x4FAzBi3M5Ss9tBy81g9qQoQaayu8DLq
	 PmypNv9ZCd6WnSB7jGz7CaCB1GM0JYndV4sq1IQVaTGVjBqdCg1FOh/JuTin3m7PBh
	 wqPwy58Zp8rzaY1etPBShYN7/dk5u0upCTXlIsnZ3/ol+r6fdm3nYaHU3UO79UNJp+
	 6VTRAXUV2AGpqygKn/p4AXZKW7SX5WkzRP/HKyLobiAZWwdtxeFePh8GjT+uexVxAZ
	 SVIEMI7iwZUyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2EE54380AA67;
	Mon,  3 Feb 2025 19:16:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861016376.3409359.6278098615754721919.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:03 +0000
References: <20241210083029.92620-1-bigunclemax@gmail.com>
In-Reply-To: <20241210083029.92620-1-bigunclemax@gmail.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-riscv@lists.infradead.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, mturquette@baylibre.com, sboyd@kernel.org,
 frank.li@vivo.com, jszhang@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111537_984666_83DD5DA6 
X-CRM114-Status: UNSURE (   9.20  )
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
by Stephen Boyd <sboyd@kernel.org>:

On Tue, 10 Dec 2024 11:30:27 +0300 you wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
> 
> In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> is 198Mhz which is got through frequency division of source clock
> VIDEO PLL by 4 [1].
> 
> But now the AP_SUBSYS driver sets the CLK EMMC SDIO to the same
> frequency as the VIDEO PLL, equal to 792 MHz. This causes emmc/sdhci
> to work 4 times slower.
> 
> [...]

Here is the summary with links:
  - [v2] clk: thead: Fix TH1520 emmc and shdci clock rate
    https://git.kernel.org/riscv/c/f4bf0b909a6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
