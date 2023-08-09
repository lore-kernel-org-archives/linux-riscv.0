Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D67C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72eW2GSmJ83gl8jD8VYTK1pgXjCkzElB20hUWHs6Zxw=; b=GrsNXrTEY+OfSt
	B+A8sU9FM86nBnNOhVXI7J6oM416IzDzwngpES3W44kfPok+EgqkVo9dSao7B3YyGr9gi7rAPHY8G
	Uh8xjsdxenDODOJTl6j7qWxgqrHZjL8PNhDp9XlW/P0C5ZOU8CaRuKQVEqGGUhk92OjQZ/aJfqUje
	R3hgdNHV8dLz2Rjdrm7wzuCeGX37J8ol/Zd94/NJLxq27HTs7xr0pDjqMs1q4c+GeBwupKDdIwG7q
	d9Ol7yt7tIdfAlfrl7+ikvASyDOMak8lluas9zly9TT1Zo0vn6U42Hba3ErRYgJVTiCBarsvj4HFL
	BXkwocweU9T278t6k/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjau-0055CL-2V;
	Wed, 09 Aug 2023 13:51:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjar-00559C-0A
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 13:51:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-26814e27a9eso3605608a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691589078; x=1692193878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8zD96bw4rkncguyqlSPtv0gB2rgXdSIasM/kJ2Pb24=;
        b=Dxbp2YMn7sEEInQkq3Tx3bNagvXpt51+BczEsYwWdT4h8B5cSftkC0XtHfDYAH0/ND
         jBpYPBHSCCAoV2bu3BiweHCvfH+Mc514Dwc1B0vXXbVboRfRmYsawGlJi9eECwZAgF2e
         aV9POh06RhXEIm3jLfHDBpXKeM0Jy8s8LpwNDAYdTWkxYYh3sNy/ycHvABG0AoE6WiuM
         5qWH32aJERfsumUVzLLBTManicMF7gHyJ+LMEOBi+mWokJ0/EnGJUFnaaSQvEURCPfpY
         rKFHLOyAZFZkr/xpM2sYkmBte/3qwLrhgZgltS+0voR81ELbQBfSrd1CE/rFOY3FHCTY
         QHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691589078; x=1692193878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8zD96bw4rkncguyqlSPtv0gB2rgXdSIasM/kJ2Pb24=;
        b=fYWuC/QGgKU4Srv/elhrpHteKdXQUvu3LKgDWcLvfg4dCa5ZZ+VzdkDGzBWUdAOm3T
         wBHRExtxLgd+4eNIJaNQ78kCds7f2RzKBM1rEQrSI/Aet2xoPFHz2pkTknLdXD367r0z
         pSegbetZkekPhteQ3RxY6vkgvVwiDKwP1rG8HmUslQ6iIZFqZqebvJgw3lZ3FB9WTybA
         TF6E3Oz3wsEoOg6zOP3aVc0wkzk8r0gohcp8/HfQafl50nugQHsIrl/8Gn2/FTM5bh+c
         OVKZVYUYLreDjJz7I4SlEVg9FNgn4JepuSCNZsfM5oEYlirfH44FGjkdIyEVuurbuGOr
         XPpw==
X-Gm-Message-State: AOJu0YxOTsLKX7XlqbMU89ll4j1AY9T06lVZEhI5qwvikYJ1ooXVxj6S
	VmFODExjklMucnFPgEtunGeQhw==
X-Google-Smtp-Source: AGHT+IHYcoVWEhh4an7XhURJt/MotBxsKv0tKy0BQcpQiO1VXx695G6yZqnzgZHHjn3G5lU5gk+Q9Q==
X-Received: by 2002:a17:90b:3444:b0:268:c569:f2af with SMTP id lj4-20020a17090b344400b00268c569f2afmr2005669pjb.7.1691589078233;
        Wed, 09 Aug 2023 06:51:18 -0700 (PDT)
Received: from work.. (1-161-169-231.dynamic-ip.hinet.net. [1.161.169.231])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090a284c00b00262ca945cecsm1542677pjf.54.2023.08.09.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 06:51:17 -0700 (PDT)
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
Subject: [PATCH v2 1/1] serial: sifive: Add suspend and resume operations
Date: Wed,  9 Aug 2023 21:50:42 +0800
Message-Id: <20230809135042.2443350-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809135042.2443350-1-nick.hu@sifive.com>
References: <20230809135042.2443350-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_065121_085063_05FE4FD5 
X-CRM114-Status: GOOD (  12.01  )
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
Reviewed-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/tty/serial/sifive.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index a19db49327e2..939dd351a058 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -1022,6 +1022,23 @@ static int sifive_serial_remove(struct platform_device *dev)
 	return 0;
 }
 
+static int sifive_serial_suspend(struct device *dev)
+{
+	struct sifive_serial_port *ssp = dev_get_drvdata(dev);
+
+	return uart_suspend_port(&sifive_serial_uart_driver, &ssp->port);
+}
+
+static int sifive_serial_resume(struct device *dev)
+{
+	struct sifive_serial_port *ssp = dev_get_drvdata(dev);
+
+	return uart_resume_port(&sifive_serial_uart_driver, &ssp->port);
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
+			 sifive_serial_resume);
+
 static const struct of_device_id sifive_serial_of_match[] = {
 	{ .compatible = "sifive,fu540-c000-uart0" },
 	{ .compatible = "sifive,uart0" },
@@ -1034,6 +1051,7 @@ static struct platform_driver sifive_serial_platform_driver = {
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
