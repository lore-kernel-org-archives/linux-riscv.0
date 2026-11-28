Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A67606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0wGqSKpz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RbwgLavl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lsiHDDJdRqCiOuHo3arJekaWSYfFq+t4d/cNO8p/IPw=; b=0wGqSKpzhwmbB1GQYCKYhvQ5gR
	gcg5AddWy8x6FKzke+AoTSKaXVyW2phSMX4y8goXTeJVsEYtZ/VPcD8nwUoQ9sLXofPM6Sgi5P9ro
	rEaVe42RbXOkh5E5wmKulpUPqdrnxpCOz7fFohH53+WDLJhufdSsbl1/6tM+LrzmmHC/wCOePYAxc
	6F4QaIuRG7gt4fL5il8e2RzeuBfLRrkd0goDjxOVoj5Wo27PZtAS8sFINWNYeD+2GoL1SfV72/8Pj
	19L/B6CU2BkQ4K233Y0xcbgEZCDdLBT/mayVnS55TqHVvfhnmac8vfl82rIpUTrKa7BRKlE93yUsK
	WDRc9sMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXNMB-000000017DJ-0ReS;
	Sat, 28 Nov 2026 18:41:07 +0000
Received: from mail-106121.protonmail.ch ([79.135.106.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXNM7-000000017Cd-3vVf
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 18:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795891258; x=1796150458;
	bh=bD+u1GSoGUo9De3k7P6T7dy69rP9VHGiIPN7UvmwbWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RbwgLavlkVS0/L0ruPFWmBOTig4e8iD1a5xVR9C5+s4rIkNpIoUglBuN4u/D4flSg
	 xIkUh1gs6nxWjsyn7GhzR9m3P3zU7om0+Hv+qdRXbxzzb/js8wWntiKOHYP4dWuY9b
	 vcD9YFFGIABWE6vO6EmbW/GfhfuwVCsvGdWrd7mV5alaXUNop5NJJOkzmSXnSZyyTn
	 MmHToCCZ+7B7DcaT9SISvmysFETFUu9X8trbjBGGG0RkMIS4VtzFAIOHTEY/UsRuid
	 FDz/7HX4LJhJOHM10x08PMCyzRuLeaIeJ5j+/J07PjT2kcjNjBbi1rqXVij6TpQew5
	 pti8+/owz7BNA==
Date: Sat, 28 Nov 2026 18:40:46 +0000
To: Daniel Golle <daniel@makrotopia.org>, Alastair D'Silva <alastair@d-silva.org>
From: Norman Herms <dockseed@proton.me>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
Message-ID: <3226b5c8-c10b-457f-85e4-a3dc43d31d1f@proton.me>
In-Reply-To: <awroPiqKWB6Wl7yE@makrotopia.org>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech> <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org> <awroPiqKWB6Wl7yE@makrotopia.org>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: d272de9c8153ee5d3cbf5de6e19d8b3b21a01606
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_104104_470629_917D4A8A 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 28, 2026 at 02:42:06PM +0000, Daniel Golle wrote:
> Which masters other than GMAC0 sit behind MSI-Lite0 is not documented.

The A733 User Manual v1.00 groups them in its memory map (chapter 2):
under MSI_LITE0_SYS it lists GMAC0, DMAC0 and the crypto engine
(CE_NS, CE_S, CE_KEY_SRAM), together with the MSI_LITE0 registers and
SECURE_DEBUG_CFG.

I checked this on a Radxa Cubie A7S from userspace with devmem, clearing
one gate at a time and restoring it right after:

- ahb-msi-lite0 (0x5c0 bit 16) cleared: the GMAC0 MAC_Version register
  (0x4500110) reads 0 instead of 0x2053, and a value written to
  CE_TDA0_NS or to the descriptor address register of an idle DMAC0
  channel reads back as 0. With the gate set again, all three read back
  correctly.
- mbus-msi-lite0 (0x5e0 bit 29) or bus-msi-lite0 (0x594 bit 0) cleared:
  register access to all three is unchanged.

So DMAC0 and CE need ahb-msi-lite0 for register access as well. If the
gates go into the consumer nodes, the DMAC0 and CE nodes would have to
list ahb-msi-lite0 too, not only GMAC0. Whether they also need
mbus-msi-lite0 for DMA is open; I did not test DMA with that gate
cleared.

The board ran a 6.18 kernel whose CCU driver does not touch these gates.

Measured and written up by AI agents (Claude) on my board.

Norman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
