Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87265C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q2qVvMuscleaNSefjArAZldl8Ced85YCqHFZ014s++A=; b=XudYpiYOtSLMfy
	XsGt8S9so+2ZcuEN00EuYwsvt3Cicn8ytYyXFseF22/3I7cOnG7osM4JkJa0pn7yozkOApPfvQvIP
	3cH6enR4OKHvqSScMA9Jj/PdqhXDGLkWLayEZ3xOREptPua/9ZhTIMx1TLmje1zoP1O/R2Ut7mUxi
	VAZpw+YNKISmCMDrXVJpDwYLvSrbbk2QNb0uH+snL3mfx5nFHz5IxNPAx4ZTzsQ6KEs12M+7Vqh7X
	7ygs6c9z3b17QfbLEbTku2A02P5wJE8eIhX22wvezMrr26l10ESQiOxWl5SscYa3spNkfx7gySEcj
	rFAe1tiNG1NDehbctWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVS2-0000000EBgz-1NEC;
	Mon, 27 May 2024 08:11:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVRz-0000000EBgb-1lol
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 08:11:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f44b5d0c50so18909465ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716797480; x=1717402280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShhWOlbRbljYcCB82u9Yc+j3xNaMQh3hMlbDkH2dDLw=;
        b=Q+pubcXJ4w4E9zx1CaykWrEKf/Qrndot3OPcPBdokWkgRfUoZK6ss854gAvm/XxRJT
         cGSHxr2ikbQkQadoIlyNTBUtTxHjRPi3qGdmhnyHtrZRKLKIji1BuO4fetZiRlrgkCFR
         cU6KlBgyxVjalsra+5VcH+yv1M4KHR6BNC2uIi9Hg0nM3KrdnDlkqlr/2v5AnuHA4qR2
         LdUkjIR+j4hGa0R4aI7Mr5j/P1Q4Y9l2AuguYex5s7c4Dbp9+IA7UCYUYey3TLl3nIpu
         zhh8d3J2cdjQgfDrV5MjOCTJhsTvREIwdgQBe27nT/39W4i73j/pbPv7UcsMqz8jvUPD
         x7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797480; x=1717402280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShhWOlbRbljYcCB82u9Yc+j3xNaMQh3hMlbDkH2dDLw=;
        b=Pwv/S8LpCQSblKlXZOZls5voPpWxr+W/PQYB8J2Z/naVjKGUVAB3j9URjv1Yf8Gqqu
         CI8Xl2WwAKdgZkx9j4wkKbYQ+Zzt/j+eWHf5Gx4i3I5annZsh42x+o+39Vxxx4XiMjXQ
         DSWPsuWGQz0ROrcgIutZWo+lRqlV7kXIprGoI0iVxGERjNrXgtiqQ0fVAkn7NeUl9dAG
         tTm58+FzMilQ2CC97q/ZCpHojoUZ7JDgKFdx8wnZ7IEt+2BYXSVcb8XBe2KVSZ11lQQi
         f4KW5/UXAJQ96Qmn7r0IJGPa8f/ds9wPDutUXGHVqKOjMydWGy+zK8De4ZGGxL+6rwyD
         5NLQ==
X-Gm-Message-State: AOJu0Yzh6CovxrW3hCU/bpuiXwm+RL4cAoV3rDOpUGXPl8Bn6GQAY5Tm
	u+SO0sEBbfaOlUUhLJ8Hca8IY75+CLTMaP9fpEtaI76q8IzzScVHkXvsuPEajJGM/PnrwvcUuYa
	eU8U=
X-Google-Smtp-Source: AGHT+IF3Dwp8qVbt9gAvWo9YG6a7jqOmzBDgGznW3uIcuYTMmMrN58KhaZ3iwOrfO3nFDaUzBRrQ9A==
X-Received: by 2002:a17:902:c401:b0:1f2:f954:d6a3 with SMTP id d9443c01a7336-1f4486d1cb5mr96471525ad.5.1716797480025;
        Mon, 27 May 2024 01:11:20 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7c59e0sm55078605ad.103.2024.05.27.01.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:11:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/riscv-intc: Fix memory leak when riscv_intc_init_common() fails
Date: Mon, 27 May 2024 13:41:13 +0530
Message-Id: <20240527081113.616189-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_011123_561605_87DF61EE 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When riscv_intc_init_common() fails, the firmware node allocated is not
freed. Fix this memory leak.

Fixes: 7023b9d83f03 ("irqchip/riscv-intc: Add ACPI support")
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 9e71c4428814..4f3a12383a1e 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -253,8 +253,9 @@ IRQCHIP_DECLARE(andes, "andestech,cpu-intc", riscv_intc_init);
 static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 				       const unsigned long end)
 {
-	struct fwnode_handle *fn;
 	struct acpi_madt_rintc *rintc;
+	struct fwnode_handle *fn;
+	int rc;
 
 	rintc = (struct acpi_madt_rintc *)header;
 
@@ -273,7 +274,11 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return -ENOMEM;
 	}
 
-	return riscv_intc_init_common(fn, &riscv_intc_chip);
+	rc = riscv_intc_init_common(fn, &riscv_intc_chip);
+	if (rc)
+		irq_domain_free_fwnode(fn);
+
+	return rc;
 }
 
 IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
