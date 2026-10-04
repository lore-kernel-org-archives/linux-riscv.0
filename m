Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF78CA5FE6
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0n6f/7NjDsrCV0gL1FpatTbwVknUHud7O3RxmrwrCIM=; b=b/UIsr454UiBlS
	b/WNEXe1/d1vLlqJyJA0/IoSxDJs+jvaOEO5dG5qHOgTcm7RD4t6MnWl+cg/ZG8YLqvSW4vJ0w4oY
	ySqFAZ0cFtADYjTSmjI15zwS0hD7X3orH1Z+XxKoup/RwHQpunXXpROs7LU4zEVWP7xaH8ssaXTDh
	ZBHp5HTU7TGAvLNXrpouCNL2oEcuEDNe60TSmTbtL2Qc9/0ySXtuBZcif37Vlg4qi2MpDkpi5BUMs
	ntYDmH6owql9AQDh8p26ZU2PLAa23ZxRv3LM3+VCJ8+1KVD2Q9Zo6AcDLLjNKxOvnxOQJ/Os2EVnl
	kEt9q2JSSnpyLNhW+D5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKBN-0000000EiQc-3WL6;
	Sun, 04 Oct 2026 11:15:05 +0000
Received: from mail-24417.protonmail.ch ([109.224.244.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKBI-0000000EiP7-0gqx
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 11:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791112496; x=1791371696;
	bh=axUuY6R+xPUQ9WsKqWZyN6vKAeBDZjWnfhApo6LvrFU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IO3RWP4MxsoympIGLuMgbYvzs9IVs1H4h4EsImXO+KDAGmiMm81gXPq616RUv4pyV
	 ggy3fdn3B1uimqvqorZcmf+qI98ciJzr1bgAYUSxyXC7UxeaI80pKFqxQD3jg/VIxn
	 yHonCeDb115PBvkfjUGx6GIifZYHjiEyg/8FNF9vi2HTjprUr4Q2Mvm9qnvxv/Febi
	 GOkZofTu0EYjJLfFWclkELv5rALS8Rzyacmu4qht+nbVA8iRmVS+G5BBTU2P8RHd3n
	 qpLtzBjgXdNwsBQtR8DjlHZSW85qIUfycbCeVl3tu19oVcg3Jnc9IH5StFjEjeerUO
	 cwh9aunD2WP7A==
Date: Sun, 04 Oct 2026 11:14:50 +0000
To: wens@kernel.org
From: Norman Herms <dockseed@proton.me>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Subject: AW: Re: [PATCH v5 7/8] clk: sunxi-ng: a733: Add bus clock gates
Message-ID: <TEcOYCDcz77vYtgXxuHGwhVo6AFFgV2M5rIDAsLiG4T7fD6J41La8o19hf2iMQhaMXd1wHsvqeDardYv7hjy3TbV9oCkfzYKRMn0EGlh7Ww=@proton.me>
In-Reply-To: <CAGb2v65Lqo7NiFhc2GYdfY7+jkC4Y+p6=Zy85HOFmXJzT0u1fg@mail.gmail.com>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-7-11175b41cd2d@pigmoral.tech> <CAGb2v65Lqo7NiFhc2GYdfY7+jkC4Y+p6=Zy85HOFmXJzT0u1fg@mail.gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 24affaecb9b426f52699549cb7abbc8bb40c0be3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_041501_786186_622B995E 
X-CRM114-Status: GOOD (  11.44  )
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

On Sun, Oct 4, 2026 at 1:03 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > +static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
> > +                         0x5c0, BIT(24), CLK_IS_CRITICAL);
> > +static SUNXI_CCU_GATE_HWS(ahb_cpus_clk, "ahb-cpus", ahb_hws,
> > +                         0x5c0, BIT(28), CLK_IS_CRITICAL);
>
> I suspect these refer to a AHB-AHB bridge for the various subsystems shown
> in the memory map. That would explain why when the "ahb-store" clock is
> gated, the storage bits stop working.
>
> If that's the case, we should describe it as the parent of each storage
> peripheral bus gate's parent. Same would go for the other types. I haven't
> checked what the BSP does though.

Two data points, in case they help.

The vendor BSP (radxa/allwinner-bsp, branch cubie-aiot-v1.5.0,
drivers/clk/sunxi-ng/ccu-sun60iw2.c) models no hierarchy either. It
registers every gate in 0x5c0 and 0x5e0 as a keyed gate on the
oscillator and marks each one CLK_IS_CRITICAL or CLK_IGNORE_UNUSED, so
clk_disable_unused() never closes any of them.

On a Cubie A7S running our own 6.18-based tree, with the GPU power
domain up and ahb-gpu0 (0x5c0 bit 7) and mbus-gpu0 (0x5e0 bit 16) both
closed, drm/powervr still bound, read the core ID and loaded the
matching firmware, but the firmware then failed to boot ("Firmware
failed to boot"). With both bits set, the same modprobe initialized the
GPU. So for the GPU, register access worked with these two gates
closed; what failed was the firmware running on the GPU.

The measurements were run on my boards by AI agents.

Norman

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
