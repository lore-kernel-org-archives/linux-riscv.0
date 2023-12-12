Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C77C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLiC/ffjSzb48b+c6f2SP+o2YhZxETWEv+jP+noqTMo=; b=GtA/8LeDkFlXAn
	AU5ZWxWNlXIXkbEybwwreJWU39LKOc8cRNB6myKla94cuIfI0L5WZMiybIPClpHZFQjK6OZxDRySH
	BnL4qXO5daJY68ExnfO8ItAAcS8HKZmIt9SfKRxj8u+UYHccz6Tb2zCRl89a/m7Dj9B/hnSOwaiww
	HjD8Wzk3IFktIwYAtXvwuQPUpD+hh6CQcHMqy3Q1o2vIfRBJ0UQUIf/5QTFoS7ai+K0UrYPBF9XcA
	zFq9wTNRYHyJL1RN3hEYTCtWfFO+EjD4VZnjCGEK760nk7wpGJ/IeWTm6ki9A5Fcbv6pu4iAQwJzJ
	ZkhfxFI8VAla4J4vzRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8Ck-00CZNM-2L;
	Tue, 12 Dec 2023 19:14:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8Ch-00CZMT-2x
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 19:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EB2961004;
	Tue, 12 Dec 2023 19:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADBCC433C8;
	Tue, 12 Dec 2023 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702408442;
	bh=nK/y8/qUXY7F2IgQswKtBoiDfCkV7oJ4o9v84Y/gt78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvM6pfgvzQmzHstdmAkuK7g04qLNqLvH1xnvBr8a3P/o36g8RWyNZvlarV+sOT2ol
	 2HOQ07hbi2uUiMowasK7NCK/WqLVsUgxrhzMmyJ5cH0cUcrV2VDbhbNTezyWjqztoQ
	 qMvuMaUvvtvsOSJLiZcAQlI8is871KcVoTE1cUq+As7DWKL3p73qZeIBbrety9Hmie
	 Q0nYYtjYvW4xnb/LMjFNjxhiwssgougV/xa6dvT+us+YoMKTG+wTdBOeq/EBZoJU3D
	 xKiufJgpO1Ru0miCxmWZnwtVZ32HzaOG7wdYQXfSbpF0hH926Ybpj9g9pUGjMo4aKc
	 0WQr9wkCyA9gg==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Drew Fustini <dfustini@baylibre.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v8 0/4] RISC-V: Add MMC support for TH1520 boards
Date: Tue, 12 Dec 2023 19:13:25 +0000
Message-Id: <20231212-flammable-idiom-660b1d85e20d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4ixJChM136tV/vmqI/fCZ0fGsIfqx2jkzvnLGq0g6Vc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKkVGy4vyF1R/GWzKmvcLfF7aj763g1lexT/Lf5RZ+Fzx lHnSfDajlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEwpfhn9aN/f47GEJkrgk9 m5848WjB1KNcM3ZcOpwc9cJK69uPHm+Gf5abF+6ruJpwpbiOlSFlOueShXc/csrJCk4pnm8RunF VBAcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_111403_996248_F1F7D55D 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 06 Dec 2023 00:09:20 -0800, Drew Fustini wrote:
> This series enables the MMC controller in the T-Head TH1520 SoC and
> enables the eMMC and microSD on both the BeagleV Ahead and the Sipeed
> LicheePi 4A.
> 
> The drivers/mmc/host patches from v6 were applied by Ulf and are already
> in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 was
> only a defconfig patch and three device tree patches. This v8 is a
> followup to change the dwcmshc node names to match the documentation.
> 
> [...]

Applied to riscv-dt-for-next, thanks! The defconfig patch is Palmer's
to take :)

[2/4] riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
      https://git.kernel.org/conor/c/a77f02e84896
[3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
      https://git.kernel.org/conor/c/18d92a03b319
[4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
      https://git.kernel.org/conor/c/b6b5028473ce

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
