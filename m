Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F084DCCA47B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajHRlkeaxv0CpDkO7c+EyJAdQszh17OBr2xz0wtD8N4=; b=yY0BDyUEjnaGpL
	pNCds8AFr33Zg330E1Uyij8dgBQYYjyoUZ5mVYLhfsBXWne+xcWUmo60eZkJMRFLyxCHx/nwhnLq2
	Ft++Vcc2QqESePcL1uuAqOYaK5skUdFVPC6XJICzZ4FMdW28+Q0Kns8HiVc23t9O+9PayqHmuhYoK
	J1ZIHhRkMa3sOSxOfoCG5p2yUZWdTT/niZillnOPG/gERm/ECwD8zhyPzpuvCS8jUTB08Zj0THbmf
	Tr05oXmvi/GxjRyu1STAYTkwwa/vc8LFqb3rYRDDDxi7aoH4Is+83ZF8jBTx2hbmd6e1Vhb5dfO2i
	ZqPFy0sles34PIOcHjFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZNV-006YLW-P2; Fri, 10 Jun 2022 07:48:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZNT-006YJz-0Y
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 07:48:20 +0000
Received: by mail-pj1-x1036.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so1428203pjq.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwNedQtGOZXHXrHclp0knXCOxOkJDdvfjVXBpc4Ke9U=;
        b=hHvfCnoUqcNw9dd11VWopU7ksI+F8D23d4JnaKSbox5rgaZkmf2VLMPCHqGARu8NNa
         gkPmi16g1BpC5FYyqRX9uMYMxgBZXNVaWYaKagHQt5oz4YhEFQWV9K6LYxLOn6uRHrCP
         t3nmi4VUckKKnfAHYuvqz+TehSlBLUTNP3hRa92w9QV5YgG4Uoa/9dpSKhNlNm8XDr87
         icJUK+94cWYSIRC1TtengKcmhKayBMgoBN7g7qQXDe72gnMI6Q2c2hdKvN70WbDjEZ9p
         aRAioCdmdQNm3cNP6alX6Mt5r+dJRjI1pOL+zZ47SxgrPIFzc6K3hjYzrnIK8GtKbqIR
         SkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwNedQtGOZXHXrHclp0knXCOxOkJDdvfjVXBpc4Ke9U=;
        b=IzIpB3l+sYcEz+ReLJt+NfrjTeMTOgQRI0Q1dMRBZniyeUWGqVZiijIfJv2LcRIvqB
         DSulaP7BAx/cR6Ij3uVy0Ms3OQLAwL2IMg6mE4LFd3xxsGG3Z1NP/6a0Bna5ZzZ+YU8m
         V6fJsvNDMivvg3oMyBwpnk77RwEZzImJ642sLFSypwnAe8SecN+NWR5g4H0SqkSc2mYL
         8blgqHcggBPluPcMKqKz8aAOEntWzW2p9YkoxZgfEbAQlrfQZWYyJ3VEPVysULkuWPDQ
         kodqRTw/M+d76RVB4/pGnuHtcoRu6kku1c2IqdcdsneOtPQV8Y1yVhkRaGSEsJSyRtHc
         iwuQ==
X-Gm-Message-State: AOAM533OouWMzrMWgnjceuXEHTQykpShagJ3g7S7fi46Ljy3q7ygyhLv
	VYW2fxPaCb/MUH6rFCYy/XmTmQ==
X-Google-Smtp-Source: ABdhPJwJWAfaspiqoR+Yu/SQptPCml+Zlui2mwQ9BihL1m/z6FGRlh8JFZn9PaBqRFOeWBrle3fHaw==
X-Received: by 2002:a17:902:ea0b:b0:164:595:affa with SMTP id s11-20020a170902ea0b00b001640595affamr42313653plg.22.1654847295344;
        Fri, 10 Jun 2022 00:48:15 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id r72-20020a632b4b000000b003c14af5060fsm15902394pgr.39.2022.06.10.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 00:48:14 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: broonie@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH next 1/1] spi: sifive: add PM callbacks to support suspend/resume
Date: Fri, 10 Jun 2022 15:44:59 +0800
Message-Id: <20220610074459.3261383-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220610074459.3261383-1-andy.chiu@sifive.com>
References: <20220610074459.3261383-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_004819_090032_6DF4E3A9 
X-CRM114-Status: GOOD (  12.36  )
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

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/spi/spi-sifive.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index f7c1e20432e0..e29e85cee88a 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -427,6 +427,44 @@ static int sifive_spi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int sifive_spi_suspend(struct device *dev)
+{
+	struct spi_master *master = dev_get_drvdata(dev);
+	struct sifive_spi *spi = spi_master_get_devdata(master);
+	int ret;
+
+	ret = spi_master_suspend(master);
+	if (ret)
+		return ret;
+
+	/* Disable all the interrupts just in case */
+	sifive_spi_write(spi, SIFIVE_SPI_REG_IE, 0);
+
+	clk_disable_unprepare(spi->clk);
+
+	return ret;
+}
+
+static int sifive_spi_resume(struct device *dev)
+{
+	struct spi_master *master = dev_get_drvdata(dev);
+	struct sifive_spi *spi = spi_master_get_devdata(master);
+	int ret;
+
+	ret = clk_prepare_enable(spi->clk);
+	if (ret)
+		return ret;
+	ret = spi_master_resume(master);
+	if (ret)
+		clk_disable_unprepare(spi->clk);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(sifive_spi_pm_ops,
+				sifive_spi_suspend, sifive_spi_resume);
+
+
 static const struct of_device_id sifive_spi_of_match[] = {
 	{ .compatible = "sifive,spi0", },
 	{}
@@ -438,6 +476,7 @@ static struct platform_driver sifive_spi_driver = {
 	.remove = sifive_spi_remove,
 	.driver = {
 		.name = SIFIVE_SPI_DRIVER_NAME,
+		.pm = &sifive_spi_pm_ops,
 		.of_match_table = sifive_spi_of_match,
 	},
 };
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
