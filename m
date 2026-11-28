Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87049606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CdnKvE7g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BrMD06t4EmnpsvWwkoOyErDclAdd8j/IEWG2kPiwklU=; b=CdnKvE7gJ5lvz3kb8/TE1wJzqz
	45n5+StO/aQbYZ4dexilj4dDtheVM0mNPjLK28eouVN/4boLzsWIN+WB0Y8OF3TzxZl1QHZtpax/Q
	rXb535VAJpQAHmSL7am9Zhb8Bypox5CNGxloCCQre4xAFwweXQxyF6Wyrj8jtMMY/IhWAZ0001VPq
	7L3FGFnA5QYsoyaANNJPMyF1ZUEgmo5TXuIdAGAKwsUoFwNP3mdMoyQf2cBL+V57mmlhAN3eC/Yi0
	f7b1G4UIrFGf2YbO4e4RC5pJDWnWR/BSlMQQLQYas7LTsdPH/psm7KA0Zd3SakZGr28+4zEEBewEo
	O+49GEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJdH-00000000sFW-1pj5;
	Sat, 28 Nov 2026 14:42:31 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJdF-00000000sEX-13bT;
	Sat, 28 Nov 2026 14:42:30 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xXJcv-000000003a7-3taX;
	Sat, 28 Nov 2026 14:42:10 +0000
Date: Sat, 28 Nov 2026 14:42:06 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
Message-ID: <awroPiqKWB6Wl7yE@makrotopia.org>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
 <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech>
 <20261125115320.3692954-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_064229_297190_70A2CB52 
X-CRM114-Status: GOOD (  16.21  )
X-Spam-Score: -1.9 (-)
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

Hi Alastair,

On Wed, Nov 25, 2026 at 10:53:20PM +1100, Alastair D'Silva wrote:
> While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
> link-up and DMA broke as soon as clk_disable_unused() ran.
>
> ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
> the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
> bus-msi-lite0 is only its register configuration clock. Referencing
> ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
> shared fabric, and gating them off breaks GMAC0 DMA.
>
> Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
> CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
> driver?

I see the same on the Orange Pi 4 Pro, but I would rather not make
these two gates critical.

A gate in front of a shared fabric is still a gate that each master
behind it depends on, and the clock framework already handles sharing:
every master that needs the fabric lists the gates, and they stay
enabled as long as one of them is in use. The A733 USB hosts are in the
same position with mbus-msi-lite2, which both EHCI/OHCI pairs and the
DWC3 controller need, and listing it in those nodes is enough there.

Which masters other than GMAC0 sit behind MSI-Lite0 is not documented.
The vendor CCU marks both gates CLK_IGNORE_UNUSED, and no node in the
vendor device tree names them, so the BSP does not tell us either.
CLK_IS_CRITICAL would keep the fabric clocked on every A733 system,
including those without Ethernet, and the next master that turns out
to need it would work by accident, with nothing in its node saying so.

So I would suggest letting the A733 GMAC binding take ahb-msi-lite0 and
mbus-msi-lite0 as two additional clocks, with GMAC0 in the dtsi
referencing them and the glue driver enabling them, in place of a CCU
change. Any other master found to depend on MSI-Lite0 can then list
the same gates. As you plan to rebase the Orange Pi 4 Pro Ethernet
support on Jerome's GMAC210 series, I will raise the binding side in
that thread.

For transparency: an LLM coding assistant helped with the analysis and
with drafting this reply.

Cheers,
Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
