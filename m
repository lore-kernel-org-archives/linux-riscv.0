Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E683606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xl3fTXrx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=C8qj2Rj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bJL/QuBeOpF/UFbC2DuQu8D+1WUb46JuQv38+ITQdQ8=; b=Xl3fTXrxHBTwWHXSK9bbMjiInr
	5kz6/Qd5qFxNeYYelyFBtzfJ/8Qh9S8EyoW0TyJlXCCjXdhset/AKBHr4oGYpfPf3X2gLsd6xM96Q
	6Fd1pFww4FEgeo2y1bdZAtCC4D1DIm/FgZsiLl9fxOIaD1hj9PbSj9uEs3NmwGLSN2wKzGly6sEwL
	FaVxWf7LLSurUXn0Vupf1/LRwBL5WoqMn4TetEHj6WJRVJEtZRkaeUHYcgDBZ3EY18NoIv2QtMZs1
	0TMlRNADdZNoDWeCWVepbwQa5fHAKfN9UprA74z79b7ZIrQRTvq2KTP0b3NEoiuqlUMJAp3O+EPkU
	DOh+eDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBZL-00000009jZD-2EPA;
	Wed, 25 Nov 2026 11:53:47 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBZ3-00000009jW2-3hbe;
	Wed, 25 Nov 2026 11:53:36 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 32D4E45844;
	Wed, 25 Nov 2026 22:53:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795607600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlkDCg9kprZ62DwlXQd8yd+ADgwJpdD1CpbOrg8ZjiY=;
	b=C8qj2Rj+fzKog24buY1PaEC/j3+RQMketNzOBNyqLPWLhq3UVkUmXjPujBBBfT32+Ki+0s
	2Y6k9BKv4Xh6Cgdk4eNvSDniSQhzK5oRY5aaw8V03U/XkGaHoA8oZcgvXvXzrrwIhtpckP
	D7e+5pVv+l6s9ImcAxTvntnCi3d2XynmKc4m8EmxMU3tg72jdrGMswbwvB8ygFYJyyf1aJ
	HUapdsxbhWcfElKIXpTDoNlNeqEAEO3kDjc6dUakyf3z4+fSNGVWbQdDDxumfm/rnqxnz7
	PKxPPKekc+UHvNn7g/4bNwrBoIOeaE/YpnGdebkwT26eR7KAiLcsSJcNrm1rdw==
X-GPT-Reason: The email is classified as personal/professional
	correspondence because it appears to be a direct reply to a technical
	discussion. The sender domain (d-silva.org) matches the recipient's
	known personal mailbox (alastair@d-silva.org), the subject line
	refers to a specific technical patch (clk: sunxi-ng: a733), and
	there are no phishing indicators, urgency tactics, or external URLs
	present.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Wed, 25 Nov 2026 22:53:20 +1100
Message-ID: <20261125115320.3692954-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_035330_073149_0FB44BAB 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junhui,

On Thu, 12 Nov 2026, Junhui Liu wrote:
> static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> 			  0x5c0, BIT(16), 0);
> ...
> static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hws,
> 			  0x5e0, BIT(29), 0);

While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
link-up and DMA broke as soon as clk_disable_unused() ran.

ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
bus-msi-lite0 is only its register configuration clock. Referencing
ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
shared fabric, and gating them off breaks GMAC0 DMA.

Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
driver?

Tested on OrangePi 4 Pro (Allwinner A733).

Thanks,
Alastair

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
