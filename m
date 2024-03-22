Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743D3C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQBRHD+kBrH32TLjE/pyzYytKnbi5/H+e5KYJ14fWGw=; b=Zf3QXtMTXBx+/r
	iDcE4aGdo3oIJ4Qf7Nsux0qjHKyxi3cQX0pH5WUoZpxciOq8AshcH7FwnrZbaoJJydeEhhQpYuXWo
	d6b0mv6X2SSBpNLFUxGti2X/IxnzwoxVw08ENXXWQodfHnjTQSg5drFFZxCokZlMrBX94TLTwKxcg
	aER+vz2k3FxAIJcUvjarRuggKVwV7twZwdgnbRkvb18rapZY+IXEJVcmTeV6swUT4xMAddexCzTxC
	OXb2MnzNiaLWXAXrqsO1oKiZ3VJcvfhSVsLtoN8SgHV+BefTcduQQRJAeJJk73pW1tu8dmWCSm4++
	pNpsjeep9SAmb1vjy5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnew4-00000007Im0-02Se;
	Fri, 22 Mar 2024 13:27:52 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnevK-00000007IIm-11Sl
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 13:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pVA6WDf6g9/z8AGBcr1q1z0H9ceUAD/J3z3hoNEhDL4=; b=mcEMV1
	/QvfbwmXZCuOmcBG+YtKHi2v2j8xLgFoFDWW4naekAG8tUAkxvHcrotg5HgWkBcY
	4uTnmOnfpIh+MKA+o7PntGhAAgbmbDm2dRb/xfMR+1uRuxLuIxnITDIzTg+cGnc8
	zUyVxoW+hdIvP9rvwOI367bbUJBVF1DtOsHD7Y5muQwP1UjkEMaEfrJ6i0Rj5RE7
	xIHk8/vg6+opmBWlEYwh1E4l7G4emXOkF+LyERCXOS2Gz4J1VSpuQeunbAZl8sHv
	s45c0A/pvpebeF8Wojg/454bxYah/qOVKzYn05E4nsUGGVLS8ANDSBpnyeh3OXzU
	xJ20u+1VaH0w4ykA==
Received: (qmail 3871141 invoked from network); 22 Mar 2024 14:26:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:49 +0100
X-UD-Smtp-Session: l3s3148p1@CDeuxj8UBpVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/64] i2c: microchip-corei2c: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:27 +0100
Message-ID: <20240322132619.6389-35-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_062707_006129_F7725191 
X-CRM114-Status: GOOD (  10.99  )
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

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 0b0a1c4d17ca..53a7a1bd535c 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -100,7 +100,7 @@
  * @bus_clk_rate:	current i2c bus clock rate
  * @isr_status:		cached copy of local ISR status
  * @msg_len:		number of bytes transferred in msg
- * @addr:		address of the current slave
+ * @addr:		address of the current client
  */
 struct mchp_corei2c_dev {
 	void __iomem *base;
@@ -359,7 +359,7 @@ static u32 mchp_corei2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mchp_corei2c_algo = {
-	.master_xfer = mchp_corei2c_xfer,
+	.xfer = mchp_corei2c_xfer,
 	.functionality = mchp_corei2c_func,
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
