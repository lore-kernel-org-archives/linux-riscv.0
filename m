Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30686D6A22C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArkOuNQKW5pJXS0DEd+S4HdvAsrIk/i6b80LCzWOdB4=; b=nyGSJCs66ozeOa
	qy0zYeWLoOCZU1GLykcCw+gadJpNjzoWGLiN+K5sxv9q2wGpAFm5w6yTZ1N6G4UYhY7yJaa7E//5K
	sFiZw0/xaD/1FM+ZzDJ7tUyl+E8RM1ldWfvhopwbz0q+/Fh5og9xtZJACnE5tefAU2a1HXJNEd82U
	822ouZSVhaBQicNX9XV5axEBunQw6v+G9omAhRVRjMsBOHr4GLy9b46ADS2ntDJ2eQ/4+uZzNDixf
	dwhimcHktYiAoZmZaYSpZT7GuIWMb91O3hbOnNNmBHx5mVVKqN9M4uO8l5vR/FPrlK5H0jOErmy0B
	sFLg+7hqwgWCDAUqLBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg28-00000000gj2-2bDU;
	Thu, 14 Nov 2024 20:01:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg25-00000000ghs-2oW8
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 20:01:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c6f492d2dso12129965ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731614496; x=1732219296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9p95eykbRlT1WDCjV5vpfrxyrRN0UXkf09A2IQ4L1cA=;
        b=Eui1lLeLjxs1Y22NuFWu9uhPbotUBRN9hwO4YorLiUQ8mnqkMVEo8Hcz3wGTKC5n8T
         FzGvW1jvkgTIFEGhTGLBnlUZFmOrwEao88YtnOE2k3q4JJZuQZp0FngFTKa3RCXSDBkw
         ZjjCS9tq/E3nA4ItDaGtMyef2wItf19quvUIJDhmBvp/WeTkZ11XGbgKPppXXq0pCxVq
         5fyf05JHGb9ysuFfF+mb8rJam5B76G6mjz+vKyFHk/GBq9VArKobAlzHkLSROqNAr+gK
         HniN1LUUJLiyood7I3T9LJckocP8wBa3oC4PvS1FvzCCbJ6JRqtNBGCVsna0YWeuf3fe
         kLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731614496; x=1732219296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9p95eykbRlT1WDCjV5vpfrxyrRN0UXkf09A2IQ4L1cA=;
        b=vXEuLc556sJ9WdRtkQhna9Hci1g4fH4Uu6Mv4MuKAgnAzdFydCWIoNeSrphNx5liYr
         Ry76XbkO7RwWKBkQ5RasUbFtyL6FB9sxcCvavSEyKyhmXx2VcOhfnvGm6VzMIVJ7h76N
         kDcKxnZBasyzYCQb6oMqmIc87NCC8M9FQ4EzeaZFYaQEy5rfyjJhy+J4A94y66AieQUn
         A5GOhdaAMKNTIaOBEJ7Sstq/iPtPKKR44rQ0MvOcz8YIN+fvcGMFAiy/g6H8CzSQRfZk
         YNPK9SE6c2a86FZ+j9dXo0HNBQJLqd0Lm6Cf0V3s/iTM7DsisqzjfDQ0nDrbKMZLaruS
         FUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJlhP6W/KiPsfrbDAtJ+x6O1kHR296Fc5tlyBygfz/GZlbngXt6thKHD6mklVto676De5RaJEz6arxMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWk/54eVkFZmZD+JP53bUnRKdzSDLpqN14hmUGwtiJlEzbjYkz
	f9sScGNldl3Uk/LcOaXZEIwGVZR73cM77Oj095vRBLCP9y3OBvs1yyI39+XKrWk=
X-Google-Smtp-Source: AGHT+IHV1CsLdoXybXKM452VDK98CEq/bcsjexgeJSn8LVqswl7/cwUzqv6UuDfnhEWk2CdV3V0HlQ==
X-Received: by 2002:a17:902:e54b:b0:210:fccc:1c3b with SMTP id d9443c01a7336-211d0f11d0dmr745895ad.55.1731614495473;
        Thu, 14 Nov 2024 12:01:35 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f31f49sm147815ad.117.2024.11.14.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 12:01:35 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/riscv-aplic: Fix crash when MSI domain is missing
Date: Thu, 14 Nov 2024 12:01:30 -0800
Message-ID: <20241114200133.3069460-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_120137_707241_8AC4FFEF 
X-CRM114-Status: GOOD (  12.10  )
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

If the APLIC driver is probed before the IMSIC driver, the parent MSI
domain will be missing, which causes a NULL pointer dereference in
msi_create_device_irq_domain(). Avoid this by deferring probe until the
parent MSI domain is available. Use dev_err_probe() to avoid printing an
error message when returning -EPROBE_DEFER.

Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-riscv-aplic-main.c | 3 ++-
 drivers/irqchip/irq-riscv-aplic-msi.c  | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 900e72541db9..93e7c51f944a 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -207,7 +207,8 @@ static int aplic_probe(struct platform_device *pdev)
 	else
 		rc = aplic_direct_setup(dev, regs);
 	if (rc)
-		dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
+		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
+			      msi_mode ? "MSI" : "direct");
 
 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 945bff28265c..fb8d1838609f 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -266,6 +266,9 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 			if (msi_domain)
 				dev_set_msi_domain(dev, msi_domain);
 		}
+
+		if (!dev_get_msi_domain(dev))
+			return -EPROBE_DEFER;
 	}
 
 	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &aplic_msi_template,
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
