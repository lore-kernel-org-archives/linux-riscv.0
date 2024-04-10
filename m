Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEF6CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAz3aj5OU6azAB/caEErigH4uCx+jJOO5yQX59EkTLI=; b=gxuJyzGzkQ9ofY
	DwyouqSb4QqC8y+QCk1F5+SBN9+fi7odgQvnd+Qd2ei3eoNzHIsdcP5uLTt0jwZQOCnk53loib166
	FJIg2G7a61psg+fpCcr0UuaNDg+rvQ0QkDjAL2axXeXJXTCCLLR+5QUxWNeaMTB5VqnIfAxJxSRwr
	BDkJLlX+On2yTVs5L1f//AmpMlKEyMeSGk7BMzBE6hUdhQbRMs9xOUtZItaTabaBre2cGqO2iT7nQ
	2eX1rGxY5/HYAzSpSma4IBMKS5cQV7wEHHVYIgfY8cidWVXThtiazo+kYjP9y6ZFU2n4mtigNg0DQ
	uaZl88MW/W+C6czIFSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGs-00000009Qax-15ws;
	Wed, 10 Apr 2024 23:22:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGk-00000009QWs-2iCx
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 23:22:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ed627829e6so2839445b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712791337; x=1713396137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtYSOn3SCnt1iF6Cpwohya7U+hEK19NDzm0dmKWZmA0=;
        b=iQC7BQ1YEJfOVhOyZzVkzcyvF2ITcGJ44YOmotaF1KOzfH3tbGvsFz/jQnkcwzyCZa
         Ncv33l7lW5cW+Gk56rlBaTQY9LPi9Yf2/0o0HzqDAop6tEfgOCTWf3l39DQeKRk3wIDM
         odCwbUrddfXnPl3anINkwycGzBHsLSc2o+BmivpLF21KnpY6ph3z4R0vcSBofn/UmJgn
         WD9vyzzt99R5Wbc4hBhitpzQD3dQ9/2o/AgMh48Y62JeoJ6Wfnji0bdvXarpH9aLMhVl
         bypySobKuM/XRox7AmQVXOiw2WJkvEO/ch1DsEPPNXt4ppTXc9wU+FtpaxfvQ9NWcwYK
         5aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712791337; x=1713396137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtYSOn3SCnt1iF6Cpwohya7U+hEK19NDzm0dmKWZmA0=;
        b=CqeXVbN1SQu+A+9s+PGeY11AIGmp3CYhVX05HfpKJGQzLLzXW8Uq1wIq3VMK8Q5Eil
         /q4YysAyNrYHQgqW3ci0P2jGAb1KT0PcFJU/rJtr0pb/9NYzIwKDDPx1fmR3Pxi3Lx5T
         WiNQvSpdIQBOajVhZJg0NfNK4G9469nOX1cpwR7ElnKYMY08ga6jUxvmpCK/8cptwkFP
         MYUaHM1LXE6l6AWxlHRV0LAQAwVlUUNilUmnp8dApJ/0Fh9t1XYfL4xgZSeOzUTBPmJ9
         GAe2JoDfdm2SfBIJOYqV1cwr0019a0ba3Cs+7Z097NM38sRt4bf+Sy/kfoQcD9RXjHfQ
         2kIw==
X-Forwarded-Encrypted: i=1; AJvYcCWx412NAFSD3vwGlKSorez4lmtVD3FeES9Bc111rL4qYekT+xSuAPVET5Z4mrIQqFSla6d09Q2H3Fj7UvFISPMyB92KSpVnPVrbkIl9it7a
X-Gm-Message-State: AOJu0YwqfGKJQ2KJwOqDHZN7DRS0S+X3XjDfMnyyRS/L+CsDKO1YnjR9
	m0u+3AkJ4RR7gHHLQFrmF5FycoAaFIAKSgBg8olF9gpjsBHEwz89qXRzRXgSlq0=
X-Google-Smtp-Source: AGHT+IGvaBONYQY7M1Nm4m+yg0Dzz07V09Xf33DgGd+N0sJJ6Z8nDrAUEytLry8/LOFs+9OnJyibVw==
X-Received: by 2002:a05:6a20:9145:b0:1a7:136c:c940 with SMTP id x5-20020a056a20914500b001a7136cc940mr5052313pzc.17.1712791337472;
        Wed, 10 Apr 2024 16:22:17 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm161865pjq.40.2024.04.10.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:22:17 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] cache: sifive_ccache: Add EDAC and PMU as auxiliary devices
Date: Wed, 10 Apr 2024 16:22:06 -0700
Message-ID: <20240410232211.438277-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410232211.438277-1-samuel.holland@sifive.com>
References: <20240410232211.438277-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_162218_727395_2F59B333 
X-CRM114-Status: GOOD (  16.81  )
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

This allows the child drivers to access the Composable Cache device's
MMIO space and ties them to the lifecycle of the main platform device.

Currently, the EDAC driver is probed regardless of whether a Composable
Cache device actually exists on the system. Once converted to use the
auxiliary device bus, it will only be probed when needed.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/cache/Kconfig              |  1 +
 drivers/cache/sifive_ccache.c      | 42 ++++++++++++++++++++++++++++++
 include/soc/sifive/sifive_ccache.h |  4 +++
 3 files changed, 47 insertions(+)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 9345ce4976d7..08e0415eba80 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -11,6 +11,7 @@ config AX45MP_L2_CACHE
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
 	depends on ARCH_SIFIVE || ARCH_STARFIVE
+	select AUXILIARY_BUS
 	help
 	  Support for the composable cache controller on SiFive platforms.
 
diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 42dac39c41cf..c7aa6f360967 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "CCACHE: " fmt
 
 #include <linux/align.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
@@ -249,6 +250,39 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	return IRQ_HANDLED;
 }
 
+static void sifive_ccache_del_aux_dev(void *adev)
+{
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int sifive_ccache_add_aux_dev(struct device *dev, struct auxiliary_device *adev,
+				     const char *name)
+{
+	int rc;
+
+	adev->dev.parent = dev;
+	adev->name = name;
+
+	rc = auxiliary_device_init(adev);
+	if (rc)
+		return rc;
+
+	rc = auxiliary_device_add(adev);
+	if (rc)
+		goto err_uninit;
+
+	rc = devm_add_action_or_reset(dev, sifive_ccache_del_aux_dev, adev);
+	if (rc)
+		return rc;
+
+	return 0;
+
+err_uninit:
+	auxiliary_device_uninit(adev);
+	return rc;
+}
+
 static int sifive_ccache_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -274,6 +308,14 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, rc, "Could not request IRQ %d\n", g_irq[i]);
 	}
 
+	rc = sifive_ccache_add_aux_dev(dev, &ccache.edac_dev, "edac");
+	if (rc)
+		return rc;
+
+	rc = sifive_ccache_add_aux_dev(dev, &ccache.pmu_dev, "pmu");
+	if (rc)
+		return rc;
+
 	return 0;
 }
 
diff --git a/include/soc/sifive/sifive_ccache.h b/include/soc/sifive/sifive_ccache.h
index 85fd1ff1355a..034dc8b6e4e4 100644
--- a/include/soc/sifive/sifive_ccache.h
+++ b/include/soc/sifive/sifive_ccache.h
@@ -7,8 +7,12 @@
 #ifndef __SOC_SIFIVE_CCACHE_H
 #define __SOC_SIFIVE_CCACHE_H
 
+#include <linux/auxiliary_bus.h>
+
 struct sifive_ccache {
 	void __iomem		*base;
+	struct auxiliary_device	edac_dev;
+	struct auxiliary_device	pmu_dev;
 };
 
 extern int register_sifive_ccache_error_notifier(struct notifier_block *nb);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
