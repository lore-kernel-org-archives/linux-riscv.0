Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1193C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2258C2250E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2258C2250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SdECECkEwc2TD5tymtiEBhrnUsitFmz9wTDpDGLmhdI=; b=OOkcpg+C38rw1i/Rw338VRWJT
	WKzs0s9zg5VvhLk/7QPQIoZYoPaG+iFYhgf10Txzp25onkDmLfq//cg14LXrXAcaMNcFkAlz+KQYT
	O09cpyh/DHAfjaXwc1QPhxA+vj/I0NczgsAqwNDE6XaF5gGrEdQpBOPaXEko6SdXatWEawHFD2EOg
	0RUHcdDWLyyfNndJoDJTdF030VGRGSXPYSGMKh0/8bzYOdCD3d6peXqYietpZsrRr9L/tRSsonDdd
	+zi3MWqKCTalzlGLQOGWwi4zAoQtBNud+R+qzf6/NfrJexmKFnnKkAlIpnaMV3FF2+2HnBpRIwCAp
	NKPbvIDHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmJ-0000CO-A6; Sun, 13 Dec 2020 13:51:11 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmC-0000An-SS
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867465; x=1639403465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AeXALpcFI2zXhzG/wZi1dKZAPJWbKG/DcS+NIXfB8/U=;
 b=Edc3NKVyiWEmTXUYJ/r/4SwvA3I1tEbmVLk3y3y0QQLU4fMQddAVktDW
 vu7NMaGpvdDncPLt2lEoN1wPJumItGBu1JMdqhUlptEBX0QO6LYNl75LK
 GDlrtz38R0G6kaogxx5O9hBw57E9VZ0pUy15NAMaJUsD4ApmDtCB2cBSt
 WteyZ/zpvr2xTKcRd+K6JxopIvHLXiD8x+9M9+ZOjuy0IZxHlh3oIQ9Js
 TPK5gi8xg0uSgoaHMR4QxEc+npzn+1oQYoKGLXS6F2AXIDuR7Sia/t1+1
 vCL3fzj1gzp+Q8buEpZY0Edft6Hu1nSgS4f+PXiI9oziFu3xz2+zFDX9d g==;
IronPort-SDR: DjtkD1LwibN95tskWGuc2d6LxKlncUeY4Jer2o6JQcdazJ1YH017VX9ovhai082ix40fYFw017
 WES9+uxNBGwMrxEcxFgFs4JPVUyDbZDA2sZI3QQ95bHudXdx3ROI4waLJvmHMHLUQRoH/4FAha
 3uUk5idf9taD5NdWPfF/h6DxNNVXDPcjGS+3YPeru2epQc5WquGVFp5JpiKTcpMnOX5hvzZjcg
 N7Z5wVRMM279y+z+LQGjzg3hSx6CbopDeO13JRUpLdwDFK43Inyrwbj9LIQ1W8+KXgxWEMsCyq
 cSw=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242550"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:05 +0800
IronPort-SDR: evcdk5dsR33pbgU3Tkabz7Axy95LDBPCh0FWM2k1aQDSU6JnhTp2qCNyPfkMtQEwKl9262+71Z
 jF9E+DaIr9upQVBYRJMacI5JmBdNAe7gCxllfad60gAnSsQZj17rjcPZjSYvZ+i/8URTaMcSuH
 mkZ+o9Wdpx22tIpYr6FuyFZwpk6JmgrTf4z7mIyHSO31/03YG4MsbPcdE/sjoM2EJ/BBGC60WJ
 izXwXz1sWcFMQf8y4t6bba6aORA3/Rr5KwpaWsgnHj9yE7q9+njjgS6/FfjdaOMqAn1ELP2AZQ
 Itvdfn/f+ljLCWzqhDCh9BAw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:34:49 -0800
IronPort-SDR: 1gUr4xZ26XKIGIcViBs1bDpgOXVGiLU09iNUovfjUS0XFMuIGuEK0TKWEtXCpZcr0wO8Au1tk2
 NoTjEOYPwSOM+YA0ANBvVS+lVrh9bRddCzC5hRCvgQQKh9NW3P2rzXa1piT4Dk0T9eMIYgaLcY
 sBPz12BeZ/0Cd2bCoN9yupyeBKrm9rO3MQD2vs9atpCpYyOTVYEJAZXYUngHg78rTmNkSKGWGW
 jBdUN/F3l94N/PZZB2B13mE9JcydffqxZT1KtEjGNFd6IGrBPAYzsB+99emhafBtmBUiVC+p3R
 dXA=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:02 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 02/23] riscv: Fix sifive serial driver
Date: Sun, 13 Dec 2020 22:50:35 +0900
Message-Id: <20201213135056.24446-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085105_059203_5141BDB5 
X-CRM114-Status: GOOD (  13.32  )
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

Setup the port uartclk in sifive_serial_probe() so that the base baud
rate is correctly printed during device probe instead of always showing
"0".  I.e. the probe message is changed from

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 0) is a SiFive UART v0

to the correct:

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 115200) is a SiFive UART v0

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 drivers/tty/serial/sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 13eadcb8aec4..214bf3086c68 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	/* Set up clock divider */
 	ssp->clkin_rate = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	ssp->port.uartclk = ssp->baud_rate * 16;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
