Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514CEFCBB3
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q21l36AnC6FPy6C/zypTdDCVMC71sCY64Od5TdjOo1A=; b=D7BOUyVR01iAK2
	rO78GDCVHUqpt2jEx/TzDz3ucXxMFJ1ZSEVHaDjHMbDnBDatK5wIdOhFRFnKFrfY2HgHdHviHjWbn
	qViTfkhxe1DXfTRHrk8/X4WCGHm8FF+5PXiIrATRIWg8Sl9d/67FMcFAAdZ5U4dLTIBENhBYUHByO
	JxwxqeDypXUGDuyIJ7Hg4/6K3imspDR/cINdL8Yt9JhqrkmbHMRL658BG6PqAgamb0J3xccJ/AL85
	X8i7LCa8yH9YBnGaycmKosxVkuNHsUZz9PaWzJQMvSE9tIip+prHWhl40XUhH0GO6iQjpkeJn5yb3
	eB0fz6KHeproOllVqvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21WJ-00000003Q2U-1Iha;
	Mon, 16 Mar 2026 06:33:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21WE-00000003Q0X-09C8
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A58A43E6D;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71524C2BCAF;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642815;
	bh=/cBRAudR782PfI6JZqOVzrGeBpkRDlrf5iNN8lqsEyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kamfbimK8WbBFJvpa9J4Mv6xtNo8mTh14NWAPg4Kf6ivrOcIdkH3MeiQIS3qvTOQE
	 YpnbosRb4+KI5gYXZUOnIAdNkM+marUjK6HiIyAjSGLDqXm5BUTPmRr+QMjCwnOxIw
	 v9YA6J5RiXqXwV3fXaYHGc/XZz0+WfMGEPs0ns9lp0eRSeuvxDFDVawcbxnz/hfbeI
	 0VyysXFMvQTEIdJojs9m9hOw6CDFYUPVbX3K2mU8Scks7VvP63VME++i5SypZdHZbO
	 2qjqrgAUWymv90Y7iXs2NACzlb6/UwY7Lx5NhEUNkjMTfzHyLnBy+4CU0zVXHX14yo
	 JLsqvqIGDh3RA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63775EFCBBB;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 16 Mar 2026 14:33:23 +0800
Subject: [PATCH v2 2/2] riscv: ultrarisc: 8250_dw: support DP1000 uart
MIME-Version: 1.0
Message-Id: <20260316-ultrarisc-serial-v2-2-6ab3e7fa891c@ultrarisc.com>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773642814; l=2191;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=gRRSp55pRniZyx6sAoUvfL+vjmmUJve5ICYBYJttQq0=;
 b=lE6icoO2hEHbQKWQ48OM1Kw9YZjvib5LhszrMykHhbDQX2zTvBfTYY30YIYexqWCM0knHf563
 EmfvFVXAzMeBO74xu2ActGmCwxHWYHjEe8MkxIad730zdn+FOFn4xUH
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260309 with
 auth_id=682
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233338_151098_9DB95DAA 
X-CRM114-Status: GOOD (  11.12  )
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Zhang Xincheng <zhangxincheng@ultrarisc.com>

The UART of DP1000 does not support automatic detection of
buffer size. skip_autocfg needs to be set to true

Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/tty/serial/8250/8250_dw.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index db73b2ae17fa..6a2acf173331 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -56,6 +56,7 @@
 #define DW_UART_QUIRK_IS_DMA_FC		BIT(3)
 #define DW_UART_QUIRK_APMC0D08		BIT(4)
 #define DW_UART_QUIRK_CPR_VALUE		BIT(5)
+#define DW_UART_QUIRK_FIXED_TYPE	BIT(6)
 
 struct dw8250_platform_data {
 	u8 usr_reg;
@@ -514,6 +515,11 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		data->data.dma.prepare_tx_dma = dw8250_prepare_tx_dma;
 		data->data.dma.prepare_rx_dma = dw8250_prepare_rx_dma;
 	}
+	if (quirks & DW_UART_QUIRK_FIXED_TYPE) {
+		p->flags |= UPF_FIXED_TYPE;
+		p->type = PORT_16550A;
+		data->skip_autocfg = true;
+	}
 	if (quirks & DW_UART_QUIRK_APMC0D08) {
 		p->iotype = UPIO_MEM32;
 		p->regshift = 2;
@@ -789,6 +795,11 @@ static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
 
+static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_FIXED_TYPE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
@@ -796,6 +807,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
 	{ .compatible = "sophgo,sg2044-uart", .data = &dw8250_skip_set_rate_data },
 	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
+	{ .compatible = "ultrarisc,dp1000-uart", .data = &dw8250_ultrarisc_dp1000_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
