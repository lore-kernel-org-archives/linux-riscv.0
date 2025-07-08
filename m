Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5163AC8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIfcDJAoJztYf2FHLrq9GYaUBqb8Y2oKUeZD4nnMmcw=; b=F4r4v6jxWwDjf5
	VJA2N9XWAgJGUhfRLwkBHcwSK8km/3VqTm29vE/vkfKbfmaE7gc0XaRWB8TNyDBqen+XSGgvMGQtx
	J4v11QJh/dJpr5GyP+OBK6VUZH8gb55I6lYSyX9LDD3zCwAO5Dr6mrXaoEdG/87RzK1aKIaSTov7z
	InW0e1UrM4f+9Lmyj22bPg+UAXXVEr4vGXIf0xcVa+FTarWA55rLBjePm4zIqTwOalP/vQ0bvVYmr
	SxoZj1kGMAdjOJlb4Xt1cY6qOyH/6wBfIRCvvM1dT429YuIY+i8L//vIDtOfaEoG5r11ZWCW0JZaE
	1m7cKCq6QVs44Sr9YjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ95F-00000005YJu-231O;
	Tue, 08 Jul 2025 14:14:09 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ95B-00000005YIS-41i4
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 14:14:07 +0000
Received: from ofsar (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2077F341083;
	Tue, 08 Jul 2025 14:14:00 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
Date: Tue,  8 Jul 2025 22:13:35 +0800
Message-ID: <175198385024.26233.3929868919272228663.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250612224856.1105924-1-elder@riscstar.com>
References: <20250612224856.1105924-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_071406_019283_EFE7492E 
X-CRM114-Status: UNSURE (   8.78  )
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


On Thu, 12 Jun 2025 17:48:55 -0500, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> [...]

Applied, thanks!

[1/1] clk: spacemit: mark K1 pll1_d8 as critical
      https://github.com/spacemit-com/linux/commit/7554729de27daf6d54bcf8689d863bbe267828bf

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
