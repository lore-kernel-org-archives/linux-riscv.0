Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8CCC001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9eWCFjXfmlnef6TEicmEhf7zuboY8gzHKZktGOM7xf4=; b=c3eL0WVbULnAK1
	kwn0TOqeN9IwdJJ1WwRbq/7NRo2zt9LqwM1ehrw9ByIzlk76LGCwRmX2GDIqKgsX+Q0NriaA+ih+l
	DIh8BOLsqQYM6RZSZABPqMEqYE3jGga7d4nEkkNen48A9WYVRKHg81nEt/K8bWN16uQU/xn/giNO9
	ZhriLTQFTtF1zqFsUctSiiFIa2KGTl8MrubBxfxj7kPVNLgCuX+vxKDDOanLno3SIgufoA/yzsVjL
	ubTlZZepRt3xyZi5AUHA32hShI6JyQVkmbtFF1cCf8Ug4DNEakoEcZHdTeLqDs7jkuM3z8g1/XpP9
	Vc5U5weB8NO1Ni4EMrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTH6z-001svE-17;
	Tue, 08 Aug 2023 07:26:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTH6v-001suo-38
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 07:26:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bbd03cb7c1so34387805ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691479591; x=1692084391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQFUtOqa2Nuhn55ogQXJygZpI6oY6Vmrz17l7AHTGDA=;
        b=I5EbRpgO/el/y9etxETVMqe05Qd7ByOsWkG8KqmvFphGyYUo4lAj43s5W79y81pXku
         65XDaPmQUl5j43Xd0q5VddW2g0eVdADBTv9x703OOgngSw76A4j6NmCEDmV1nzLOhd3h
         YHivlqnFTVsWBEzKJXlYvEh7XaNCHPPZTa3cotiiEZQB6jO1Jemahvm4UqY+UOmBhegq
         HOFwEyyKq0YSI2WUP/yY4ao+lSV2BCjDc2GIzNJrHKu16JrgDRW+zGEJeEnz4wQIAizJ
         h1Von9YZ0URSebB/UaW3GxWtT8a8ZGNTUoiKDoLR2QH6XomBIRl4C94UNAvK+h91V6rj
         eAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691479591; x=1692084391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQFUtOqa2Nuhn55ogQXJygZpI6oY6Vmrz17l7AHTGDA=;
        b=YxyU6qwbXWjyYR9uhh+OhDuVkVDps4jjIVxTfEOepz7XW1Hqa+xxG6TQZaD8Sbmyb1
         jwxLkn9ttacCw8dk9aQdtRhQfTuchnIc4hXFa34frDfc0/zpbTJ60V51aolV5xtF+SHl
         +5E1+9cyUD9r1TnXhCjwCiLBU2ioO/pKhJFG3BH1ZQMZacYPho7pvd7idhncK6+26c4y
         uf/jLvGIdw0MZYwwxd11PqJsxWjo0LsQdnh6M7E9s7YyzzPrFadpW595U7ugaUxFUibZ
         4FneD+rCXDOXErKwL+UfgGXg2mTbyT5xNpdbbZwwNZFB1JNJedEOasSMGjxAlEloYX6A
         FQgA==
X-Gm-Message-State: AOJu0YzC60qBfRQNMMz6hVjEc+OK1TXZV8E4LwmM1j1D8QiVK4K0CW5G
	XqmoICVuqoIcjt9oRy8rTeiHZw==
X-Google-Smtp-Source: AGHT+IFn9Tv/1Wua6tBM7YiRpsrFK5gtBkXS5hRzWJuEds2zGjCrzk2Zh5O6jxInrCtOG/wLVGM/yg==
X-Received: by 2002:a17:902:c20d:b0:1bb:9bc8:d22d with SMTP id 13-20020a170902c20d00b001bb9bc8d22dmr9696186pll.16.1691479591137;
        Tue, 08 Aug 2023 00:26:31 -0700 (PDT)
Received: from work.. (1-161-169-231.dynamic-ip.hinet.net. [1.161.169.231])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b001bb24cb9a40sm8357436pli.39.2023.08.08.00.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 00:26:30 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: nick.hu@sifive.com,
	zong.li@sifive.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/2] serial: sifive: Add suspend and resume operations
Date: Tue,  8 Aug 2023 15:26:25 +0800
Message-Id: <20230808072625.2109564-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_002634_070194_E31A1E66 
X-CRM114-Status: GOOD (  12.64  )
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

If the Sifive Uart is not used as the wake up source, suspend the uart
before the system enter the suspend state to prevent it woken up by
unexpected uart interrupt. Resume the uart once the system woken up.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/tty/serial/sifive.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index a19db49327e2..87994cb69007 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -1022,6 +1022,31 @@ static int sifive_serial_remove(struct platform_device *dev)
 	return 0;
 }
 
+static int sifive_serial_suspend(struct device *dev)
+{
+	int ret = 0;
+	struct sifive_serial_port *ssp = dev_get_drvdata(dev);
+
+	if (ssp && ssp->port.type != PORT_UNKNOWN)
+		ret = uart_suspend_port(&sifive_serial_uart_driver, &ssp->port);
+
+	return ret;
+}
+
+static int sifive_serial_resume(struct device *dev)
+{
+	int ret = 0;
+	struct sifive_serial_port *ssp = dev_get_drvdata(dev);
+
+	if (ssp && ssp->port.type != PORT_UNKNOWN)
+		ret = uart_resume_port(&sifive_serial_uart_driver, &ssp->port);
+
+	return ret;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
+			 sifive_serial_resume);
+
 static const struct of_device_id sifive_serial_of_match[] = {
 	{ .compatible = "sifive,fu540-c000-uart0" },
 	{ .compatible = "sifive,uart0" },
@@ -1034,6 +1059,7 @@ static struct platform_driver sifive_serial_platform_driver = {
 	.remove		= sifive_serial_remove,
 	.driver		= {
 		.name	= SIFIVE_SERIAL_NAME,
+		.pm = pm_sleep_ptr(&sifive_uart_pm_ops),
 		.of_match_table = of_match_ptr(sifive_serial_of_match),
 	},
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
