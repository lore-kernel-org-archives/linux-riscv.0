Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8B6CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piylAKhcYbvoChs13b+67gimFCfoKgkw5s46zfqDDh8=; b=wBBPXYSqR4GpWM
	Eh1CXtoE+tHy63/lBjBnufEREAd2ngDbHKDLcUc/PqOk5mjOHs6qZVDTiBMumDLb6CLOEbpNBCwBV
	rOKOs32BkO6Q1AhYpWkwTWzWFHZGk2VqAayzMBi2ZwmvC1wnledR01Stce2OgYkXiOU6Rg5QMJQ9N
	XnZl55Hu4Ny2HtNbV0NgfR8kV5J8VV/s4aqcezE6oPCuU8w1EsMcoDD65fatX5xQynj4tJoQtPvYG
	6KvzRQk1Cy1r28MwbfG5aDO68HMyF7PX39XgPQ8TuXuk5dB8QUS4BYH3CEjGAXhzsSyr4B7uUmFIu
	6iaPuX9TC+UkWJAJy1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup2c-0000000Au1j-3ENI;
	Thu, 11 Apr 2024 07:40:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup2a-0000000Au0C-2fKA
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB55061FC7;
	Thu, 11 Apr 2024 07:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597AAC433C7;
	Thu, 11 Apr 2024 07:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712821211;
	bh=LA+wn9kfgecU++lwedY9kqi1RgDT6C7KkTtw8hPYVz8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jhEtD+8gQsJCMDWmXcnrfLyAeM0K0uK7O8o1zvkj3msA7C1JgMCODIWZjTFB5esOI
	 3U9Y8LMrIZLETrO9tXP6GSmI+5qKB3YW6aEpQrWAiIWg9lEw6e2GSNAvmCx1wYMLpZ
	 SUrt1IvS703nMUllbwR4ItAp/3t1jEjdymKbQgAWZJpbaEMVwjOsEoPND8Cw8Tdg0b
	 uubiieQVjmUiVzX3JPe/92++s8VMG3/nyf9lTjzDhwFw8TiJpA3eRBMeQLCiogohUX
	 OaePVeeYoESA0VXSlkOm3OBnTlaHvK2stUG31Y9lGEaWxugWeUycE2v8nEcfuHF0vG
	 V3LMZ7Obiv4Zw==
Message-ID: <a83130157adf70f6f58f4d2e6b9d25db.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240110133128.286657-1-jeeheng.sia@starfivetech.com>
References: <20240110133128.286657-1-jeeheng.sia@starfivetech.com>
Subject: Re: [RFC v3 00/16] Basic clock and reset support for StarFive JH8100 RISC-V SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, aou@eecs.berkeley.edu, conor@kernel.org, emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, kernel@esmil.dk, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, xingyu.wu@starfivetech.com
Date: Thu, 11 Apr 2024 00:40:09 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004012_765398_03585CD2 
X-CRM114-Status: GOOD (  10.39  )
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

Quoting Sia Jee Heng (2024-01-10 05:31:12)
> This patch series enabled basic clock & reset support for StarFive
> JH8100 SoC.
> 
> This patch series depends on the Initial device tree support for
> StarFive JH8100 SoC patch series which can be found at [1].
> 
> As it is recommended to refrain from merging fundamental patches like
> Device Tree, Clock & Reset, and PINCTRL tested on FPGA/Emulator, into the
> RISC-V Mainline, this patch series has been renamed to "RFC" patches. Yet,
> thanks to the reviewers who have reviewed the patches at [2]. The changes
> are captured below.

I don't think that's what should be happening. Instead, clk patches
should be sent to clk maintainers, reset patches to reset maintainers,
pinctrl patches to pinctrl maintainers, etc. The DTS can be sent later
when it's no longer an FPGA/Emulator? Right now I'm ignoring this series
because it's tagged as an RFC.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
