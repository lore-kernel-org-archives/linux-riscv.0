Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307DCC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A4B23B23
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6A4B23B23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjmTXat3tuzmc+QOwSjuEPmAKfJSPQSgev697492wUw=; b=AGn1WZF7DQkhpQ/RqVcd+3xN0
	DXv1Vs2KwDgQW5s/W7Q6y7IxKGSwSUJxHPoODylRWOSwwVpgBMK/B61iyH70J3h2Q6aYkwRyGFJJ+
	iReQlML8sbNIkbV562/1MdaCvRcbMyFOBMXidQNhDi+rq0dMibnSLGhVcR36OzLpnqYnd1akEfns7
	ndgeBADF35TgPCFdHIOzsSo1GMNsC8TZaQ9MhzYMaqalL0iiTXxX+ITTcTHUAnaT2uBKu67kQ20Bg
	Hzd0PSZfGkCsWu1uTh17WcTT90tV4ptnFc1UOBGt08uF4XEHc1EO9F1PiVlj6ztz9EWroEbCmT1Tq
	CqdwZvXPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kms8F-0007q7-CA; Wed, 09 Dec 2020 05:35:19 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kms8C-0007os-1y
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 05:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607492326; x=1639028326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
 b=pZvPTBK2mnbDQjGAP1Pp0NZ4QQ62tz5lLIWkl/EB3GyqEr0O2GrI1zef
 PLBD/ulUfu3eXCOTbexg3PjVn9GgndVTHrSlHasgEHXBNwnp0OQ8SCaFz
 zjSjLT7PhgSP9Qgz/qSKgihXr8rgR4cNMcGzoZRXQc0WNP6AHvIqIyF5z
 jGAshP7Vj7g42+QMc1Q7jm5gMTMF5pBB76TRzZypjYXW0d6BdG8041m/K
 RTr65zF6pxSn/RGHiZ0qr3VeDVoNIScOq61ZLwuEaZTx6DPOhuY7ZouIL
 ijHQ1YNM1A1bNu92tJyQc3df25Pyys8QXJQ3m6+UwBEZJqFwM73V0Ojwi A==;
IronPort-SDR: WyWpIogxiUkrTLs10c/trETP+eejo1K92tl5arflst5Z9gxCBjhVCcFzOolM8/xKP2JXTWmnxe
 xEPMftWPIrme6bK1UxmNlRDfEE5xn0qK6BpaUozokseeWkDwaRjMuz1+6hJozD1OaurG//T0x5
 SgfOAS+wjLziV7l1mRhsnVp9CzjVwFKY/gaanbQSMB/qpfDxHQaJ19s++cJxCynaimaxxM7AU4
 AT2aock6d0z+athWr2Pr0kARSQnRzsNY4KDVFXUWt14YGYIKUT/RroLnr2T+vS5wYM7u+19P5q
 Gxg=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="258465522"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:38:45 +0800
IronPort-SDR: ftK/MkSWHSfAPnRXKhRrljBGrKLq8xgdJcQ0PhbopH9GTKM5Hkfz/Y5/VSE4+vOjn+Jwiebkrb
 GzoSlBCWG406MfZ+pwWHZNu8cPHlXN9VY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:20:41 -0800
IronPort-SDR: 15cYU6A2oRjFuy3GCprP+FCHXABwML/5n5KQefjjThFxQaJZQ2FX23SertLS+fiBV6pV1g4ASx
 iu4r2H31itWw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:13 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 02/22] riscv: Fix sifive serial driver
Date: Wed,  9 Dec 2020 14:34:46 +0900
Message-Id: <20201209053506.122582-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_003516_234356_4036D348 
X-CRM114-Status: GOOD (  11.97  )
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
