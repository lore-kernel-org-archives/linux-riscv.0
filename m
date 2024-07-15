Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBB4C3DA5E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqj/vP3TPzVRG3d5v0RHNmTyuznw5HSH/klOgr/Urdo=; b=avU7STdRjz+Jvu
	rgwNluDdwTgS/7mJP49zeoz3Kr6WtIS7LeAaalqQx8iVgOUo3xa834FQpsIdY08wbEnrvloTAPoTs
	sivZeLqpFyRYtUmsOLSZ3SC424bnrx1KXmUuGoXg7yfP/DwVRbXX08apQQtsUb3K/NTnFexXfERy8
	2nESQzx0/T3r0RO10S/UzgQmHanyOucuaZpABboI5HyrHrWhKkt8Bf78qWrM4Yruws5B0vSTotmdG
	lDziL4zrlGWHzON/6r9OMGcN9K6EVjND2bTbQrIrZ099eM5CgBhfFm3HdfZufNWrtw8/SyvHdqylg
	Lr5N9sBPjUz5wtSVoOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTR5r-000000085wv-42kI;
	Mon, 15 Jul 2024 19:10:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTR5o-000000085w7-2EV7
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 19:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E44D61226;
	Mon, 15 Jul 2024 19:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D881C4AF0D;
	Mon, 15 Jul 2024 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721070634;
	bh=i1YPP8GvnIotxIx3buh+wyZmCmdXEPtkuDjQhHiWPl4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aDmd1VLMC+Z9X3Q5GUqgh57bYNGh/33JFHUQyxiX2ol+2nYPr0XBOgCPVSPQboAy8
	 PJuC/1NOP0L6lq9hH+HHsJ/qs6Or517HUUOxXzIwNjEJtvhLr5Iwf45QePhwlAe9a1
	 se3QUDf4SlRWFqJFW2b40ykLpKgGFgOQ6Bujx6aQb4IzwWam9NyTwDoxkt2mQfwEJK
	 OUBwjV+xz33oMGmU91E0gVLgl8ydTlHC5mYHoW1jfQvK8JW3s5nKmO5WFpcxcQm8Ei
	 LUYAxEyGoaQabRV4DXKCr/zPxzn9a7ENb499PIqenQfU4MTGT5lsYa31e/+R/R+T47
	 sLpZF+Judc01w==
Message-ID: <b6c9ece6ea9a0a476057ced63669017e.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
Subject: Re: [PATCH v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Drew Fustini <dfustini@tenstorrent.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Yangtao Li <frank.li@vivo.com>
Date: Mon, 15 Jul 2024 12:10:32 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_121036_662178_F4825EAD 
X-CRM114-Status: GOOD (  11.14  )
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

Quoting Drew Fustini (2024-07-11 09:56:18)
> This series adds support for the AP sub-system clock controller in the
> T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
> 2023 [2]. Jisheng made additional improvements and then passed on the
> work in progress to me.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> Link: https://lore.kernel.org/all/20230515054402.27633-1-frank.li@vivo.com/ [2]
> 
> Changes in v3:
>  - dt-binding patch has been applied to clk-next by Stephen but I'm
>    keeping it in the series for completeness.
>  - move dt-bindings include after linux includes in driver
>  - change rate to u64 in th1520_pll_vco_recalc_rate()
>  - replace do_div() with normal division operation in both
>    th1520_pll_vco_recalc_rate() and th1520_pll_postdiv_recalc_rate()
>  - add static to ccu_mux structs: c910_i0_clk, c910_clk, uart_sclk

This didn't happen, so I just did it myself.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
