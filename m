Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F41C64E90
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:48:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC925207BB
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFu54tmN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="opfO7XCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC925207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAmLwP5sYNPHyzW5qvzX1N9JB4rYQq/vtO66cNHjSy0=; b=pFu54tmN1WTCFOlxaLnMq3+Si
	FygaeqVQCQu1ffp8931/lY0ngyM9pI09RQn7DlVPyWQb0mfxsDt8z/6qMn/tWS7R99C7MVY5Le/OV
	c9i337XbgUCEJwUKcewAE+0oF9VSro/xfN68Q2YyM2eczXDS4GePlyzL3ZScfEyjMQDIFv+aVSoXg
	lfapOIRIMrfQBFPNsIo0R23xMy0NZTXSQTjHZz7kp8ttVtfkShclVTjyADzAJUhfnKzpKSs3eanun
	wixbcT2J7bpDvzYq7NDCFmDIq548RlEkhuoz1htNOAbRVLQjcUbceUUbzOilU2mTJ9NopADzeWZz5
	XaXL3dXWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsuV-0003DN-2I; Mon, 30 Nov 2020 23:48:47 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsuP-0003B3-Bl
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 23:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606780122; x=1638316122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
 b=opfO7XCaO5vcUonvWw8X/NEOJB8kvPjjuTWTCK/q6F5vpipl3x/cPvOc
 F/rPG7sawXJipM++HQxpb4e28K+HVyQUvRJvIuozS9JT9Pb8bPhannN2K
 9oTJM0brRrG2TxfJlpo2dNWMpZL1MvAaBXNyeWlg+Z13vK6jZjLljb7d3
 kZUuoKmt7IJ8bkUr8iywG3VXUcI9S0B/DNjpKcc+9/8W/jtESAPsfnL1h
 Pw/khDzz+EmDbNMhrzXBu2zppIA+guK9KC+UfPXS1zinbmxlD1H8WFEy5
 LS2HxVgNUJugY1rOJxaBIIlyTdT7+B4lddT5q7gBrF6XsVsw8UyqMnYlt A==;
IronPort-SDR: cXdZ6HqyLj7GH02WUkl87LlNeLFeP1/gzmgUr7dOxHgoKOLVLDDHmA85lj+TwlqhDYGvZREf9D
 Jf6TWj3j/rgXMyCKyoO2H1T8Xto1ddaRg10UbAHiNd9HfShgG5UUac2FdFHNN0JwbnHEp3aJ6G
 5zwyJ9OC9TwHDlZIE4qIcihgWg4ESTa/jYZdB4YUP4rOgWhKzv6iAd4C3SG0oYfsB6n5/iSL+U
 ZUCzvXXA8vRXpvd4PXknEuHPqICivk/CKgh17lYhRjVc0BSjST7kelsVQLFac4B64D4PU2Qa0c
 0bg=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; d="scan'208";a="155058253"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:48:41 +0800
IronPort-SDR: NE1JzyZttZZLiLN8VtcPQW1f2Sh8jqbL/1MP38etzvaH6EgUbmiJsJl6RspXxP/ZNdtCRMn/Da
 co2b7RoSxonWgQBjequBZFcZ8+/K4oSRc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 15:34:17 -0800
IronPort-SDR: KzFqzqX8anTpMG4dXaErAu2yqFBePyUg/u1I+TFU6bGUPJ+WYJdzcngfK90Ceo5pZ7J4nNcqTG
 KkB7x/dGM4fg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:39 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date: Tue,  1 Dec 2020 08:48:11 +0900
Message-Id: <20201130234829.118298-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_184841_548896_7E0A3821 
X-CRM114-Status: GOOD (  13.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When running is M-Mode (no MMU config), MPIE does not get set. This
results in all syscalls being executed with interrupts disabled as
handle_exception never sets SR_IE as it always sees SR_PIE being
cleared. Fix this by always force enabling interrupts in
handle_syscall when CONFIG_RISCV_M_MODE is enabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/kernel/entry.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 524d918f3601..080eb8d78589 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -155,6 +155,15 @@ skip_context_tracking:
 	tail do_trap_unknown
 
 handle_syscall:
+#ifdef CONFIG_RISCV_M_MODE
+	/*
+	 * When running is M-Mode (no MMU config), MPIE does not get set.
+	 * As a result, we need to force enable interrupts here because
+	 * handle_exception did not do set SR_IE as it always sees SR_PIE
+	 * being cleared.
+	 */
+	csrs CSR_STATUS, SR_IE
+#endif
 #if defined(CONFIG_TRACE_IRQFLAGS) || defined(CONFIG_CONTEXT_TRACKING)
 	/* Recover a0 - a7 for system calls */
 	REG_L a0, PT_A0(sp)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
