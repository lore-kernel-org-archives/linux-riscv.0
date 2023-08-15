Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E256C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aYicncAM+MC2lbBEI0v8Vk6w0GZl3EYeJuMQd/fFBag=; b=HzKqZt/7/b2Klw
	HrXt2GTBOca46an9a3oZsfifJuECjZSpi7mflAe6TD4Sw3vvYHWmEtuWPhAmrI4iMYXy82M9HRcBM
	ElLcjrceSK/rOmpvaBDXc8Q75gebFGoHuodjg+JFuCxxusqR70J1SREbgmXLr17RtuBGMMwpif74K
	0plqxZMCaZfqndwgNFYK3mW28r+KJmcPFTlVbQlm45JHyGt6ZHh2rAwNMc0gsPNn25eS/Lk5b6bHJ
	i2ffnPcnq5UkCL5/Eq651/yYqaWmDexBwUYsUDlbtcrppK1UddNPpUMBkOvVubEwYRZw1z9irHNWP
	7yUaYWR4zv+g/TCcPR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVpwZ-001Alc-17;
	Tue, 15 Aug 2023 09:02:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVpwW-001AlA-2O
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 09:02:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6874d1c8610so3332707b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692090142; x=1692694942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw0ARtvgnK9eBWm0hqqYBsE7PAKIFaPy/RiSwt2xSqk=;
        b=f7XXEf7tFaWgEoGIQtBEemyNQGodu1G427wygI3OnQe/2du59CwHn5caGSfDXLH5iC
         cOEeZqkzJgMyDQQvYaFa8KZ3I5vCZOLMchV9M76pkwkIS5tci1t/N+pztDtHMR9tKZuF
         vrjlz5LjysXbQ0sQ2eW0X4KB2n2kjfPq3Q1TscC02Z8dTZ5T2zTMIxAHrI8nvgwDUHep
         KmoajzSlvnhDZOUaR+/s0fV8URtBwioisXFXE/cv6aRU2ADulIAFmSMANQbL6MYjqqw1
         WKS81hferpTBRkLKUU+UwbonndqOhD1DWXJ59ZxnCXdDgz8bWv8coW/UjU3Io6xaRs3H
         cj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090142; x=1692694942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yw0ARtvgnK9eBWm0hqqYBsE7PAKIFaPy/RiSwt2xSqk=;
        b=OTUHlhtDJ4vSUpzPfhJoVCx4FRDtjiBEmoiq6RfDtrwdpDFmyEpn+0vAzREhS3NFw9
         Y/2TX5yH30Eu4hGA+4CTbtcAe4kJP9SP2MvDi+Sk5e3LnXsvPiASw7mhQ43PJgFcNJY/
         3lGFERN1htMJiU8ay2YH3igy60yG5I/F8qZKPU/6gUFtH1kY+kLi64KwdGI4HAddyjPR
         7L8g/6+ZTrhueHxdqyzRl2UOHyEqRUK9yC1a4zIn7StADAerOKKZGR1tkVrHpzZYjeJB
         kSAwvhgOPWNqFtkpSAiBoly5dSJMPHXfNttvVORQSo+sTRE27OHKjRe7UduJi1ZqVoSS
         +amw==
X-Gm-Message-State: AOJu0YznSxix4YjicU7TgIltGN9uTq9qZ5FzAH927MeXuIJoxD1wCnLv
	VT2sJawIsFfRkXmPliY74nBBIT7RogfpZ+11a6bmbw==
X-Google-Smtp-Source: AGHT+IENe0tU9RHLk0BkjpQbNw1pxKpJ2/NeGr23TOm4HJozI30zEOhEU5UnWi95cBI6wsaH1tmURg==
X-Received: by 2002:a05:6a00:130d:b0:687:5434:bd14 with SMTP id j13-20020a056a00130d00b006875434bd14mr9078461pfu.11.1692090141951;
        Tue, 15 Aug 2023 02:02:21 -0700 (PDT)
Received: from work.. (1-161-171-111.dynamic-ip.hinet.net. [1.161.171.111])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78c16000000b006826c9e4397sm1264700pfd.48.2023.08.15.02.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:02:21 -0700 (PDT)
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
Subject: [PATCH v3] serial: sifive: Add suspend and resume operations
Date: Tue, 15 Aug 2023 17:02:16 +0800
Message-Id: <20230815090216.2575971-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_020224_865849_24ED3ABF 
X-CRM114-Status: GOOD (  12.07  )
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

Changes in v3:
- Fix the conflicts on tty-next branch of tty.git

Changes in v2:
- Change Signed-off-by: Ben Dooks to Reviewed-by: Ben Dooks
- Remove the unnecessary check

 drivers/tty/serial/sifive.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index e2efc3f84eff..d195c5de52e7 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -1019,6 +1019,23 @@ static int sifive_serial_remove(struct platform_device *dev)
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
@@ -1031,6 +1048,7 @@ static struct platform_driver sifive_serial_platform_driver = {
 	.remove		= sifive_serial_remove,
 	.driver		= {
 		.name	= SIFIVE_SERIAL_NAME,
+		.pm = pm_sleep_ptr(&sifive_uart_pm_ops),
 		.of_match_table = sifive_serial_of_match,
 	},
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
