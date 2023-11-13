Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DEDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 02:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sUlIk1ACj4VILvf0dn3S3ZHsC/SWE8d+lAtfHmcms8A=; b=Kn0Z3JI4B7yp31
	vqPd6dI5Mt9D0hM6k1bal2H0nxKoSj6x+T2Ttw8rDVgliijwXx2tHjvvYiscZdTIfT0X2WT8GRLwP
	/d5T13HAnqPxZ8a99A8G7x+DwwjkX+7qR4uE3q+Yb8+xG6uUzqYpC3yxZBKnwcUb4fm3V935CZ88r
	Pw2zV0omGp8u4pcmKB8hPoQ8ariF2Q6gAdlpZXYSKo3P5U0YOAdyG8Oph4xAZSuQ/faJY0QiEvj+X
	5lG/Qxuc0Dy1aDZsJLpWdQh5r5um+5Dky93fMzNH+1SWZV+gJLliJ3e11QiDv6nHjwWpVBGuoo2xP
	yPXUIwa9+rkkzKQXsLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2MjZ-00D4sL-1x;
	Mon, 13 Nov 2023 02:31:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2MjV-00D4rv-37
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 02:31:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc30bf9e22so29534105ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 18:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699842685; x=1700447485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sd10hTgpNqYujYyn3UZDz1YnF+lDmSTrk9YJNSbPP8c=;
        b=Y2c9NEvVx1lZgD3PJLOtrYISEkCu7YEcep6WGDqHImqGTfylX4Xuf/o7yX8hCo5SIW
         dMKi8vNw/Gj4H5tAHpgCvBfJHBn8POAupT/bl4Zb3QhSVcveGxmGdNW7/lhY+JBpgI3q
         8QpL/zgsZlc8y2GOTFXrW6L3W4qug9aN0G1FCGvYN1XgqkeMG9A5K0+hIISPC05AEfh4
         eWces9HeowSOZtymkJxlDBvJmrDaLqH4K3bGCPjjvKf039rEVudullcMt3QfyHnOFNcB
         /pVEjqHljJL/8QITu3PQZgD0zgHjnEcU66FJmHc1YWzbmrCbcMB+z3GFRN73Iqc/AZlD
         1opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699842685; x=1700447485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd10hTgpNqYujYyn3UZDz1YnF+lDmSTrk9YJNSbPP8c=;
        b=QuRZxOCy0djmTooAbciBuzX+hqZGjja/YNrWICQ7ZzI2OdjUW+gS/zDiZo5sfp7Ufg
         FHe+RyqJQCc6LduHqSOeS9x7c8pL53zSwjlyfa9rMlAzk++++Yb6tk5XkVawCbkkrwcB
         l/SsnyN+Wmp9u8ou3k5pW7l9Hvd0kOJ5Psw+Cy3VZhw5+tr0KINOHTZic0PkLiDJLsvs
         2Hijlqtpe3HPSaZWX0xJ9O029nRrPM8g27RXWGky9KcTZxpjd+hPcrr09vSTE7KhPH7W
         vO2JiiWRNpJoDrwdymhUzEH0yXEURAcar4getXV6jc8Fbyh5R/jH1Ypqmbr0+vpIsUAW
         DIfw==
X-Gm-Message-State: AOJu0YxtCeewqZ3wr8eHCDARecd/x0yr7O1hwi2CvVavNYJ8EcgAPBgs
	D+681RRYuB+2IdUGViDrsOFwiA==
X-Google-Smtp-Source: AGHT+IGH+R3Li3avmxjpcVqHSD9l7bHR0YYeJvyXAI9k1LPViN5lzWQ03fiF6Iics7iinolaM2XpYw==
X-Received: by 2002:a17:903:32c9:b0:1cc:332f:9e4b with SMTP id i9-20020a17090332c900b001cc332f9e4bmr8122899plr.1.1699842684834;
        Sun, 12 Nov 2023 18:31:24 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id ji19-20020a170903325300b001c9c5a1b477sm3143643plb.169.2023.11.12.18.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 18:31:24 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nick Hu <nick.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] serial: sifive: Declare PM operations as static
Date: Sun, 12 Nov 2023 18:31:19 -0800
Message-ID: <20231113023122.1185407-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_183126_040423_E79497E9 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

They are only used within this file, so they should have static linkage.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/tty/serial/sifive.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index b296e57a9dee..3babc6c3a527 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -1033,8 +1033,8 @@ static int sifive_serial_resume(struct device *dev)
 	return uart_resume_port(&sifive_serial_uart_driver, &ssp->port);
 }
 
-DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
-			 sifive_serial_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
+				sifive_serial_resume);
 
 static const struct of_device_id sifive_serial_of_match[] = {
 	{ .compatible = "sifive,fu540-c000-uart0" },
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
