Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE9C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GNektOVxyjzSQO/HZBfqqkB2flDoHYNOxTd1+GjVm1w=; b=qUx8gzpnFctXAv
	d/gHgByX6qZnJpJKQtHh83a8/KDHQRWIiP+ztknkXqYRASyBxir1T4OsJDzitWVLFRugORVyyEmkH
	3ecpaN2qhGuv4PRr1K0CBcC7veNFSZoxOts1hXR0dOZvcTacSteQeQHsu0KDUgg45YbuOxeg/9eBU
	aYW+toukHEwKXyGDGf2U3rooF76zdrvCRYhV0sqzt9Oxzqj26SaBP3id+5uKR2uw/01ma0/Jc3jJd
	2I6GBzTpUg2SBOqsn+66z8TesxoARJUoTGN4+WT06sUJlvLyGWhgrnloZ99tHUaKzWrBytpKNZBfG
	O4+6S3bUHFjgKVG0odtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvXFR-00000002aA6-17YX;
	Sat, 13 Apr 2024 06:52:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvXFO-00000002a9K-3dGC
	for linux-riscv@lists.infradead.org;
	Sat, 13 Apr 2024 06:52:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ecf406551aso1251204b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712991141; x=1713595941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBFHuV2LVuWEjmAN/8ohS4VG5ENeR9bBP+jEkNcVGnY=;
        b=URf6vdFPgeud61bEHEixgb288Qb9tQUe9vOxRLzW3OgTGMJxHivD+g1h48PWnV3bJm
         wpD9rPdPSgbNsszHy+PsJWAJ9Q653ctPOlnAaE+IoqicXHrgYhNOOxkUlwjuFooxRw47
         cmr/Syiv+xwROVXjEl8Gni0I+DrDZK0Vx9oGPVqAAQpreIGl/xiVHl1E+pFwLDQc//ys
         uf50mFQMvYoWjswLvrFxakxf1TGUMKBROVsuM3bNbMgjY0bUcmd54FpQCQbuaczNp8/o
         BBZwwMqUCOu7gJ8FEW8RBQHG6mYVV7Xw3XaQ0SYTk5AQJkBF19hIZerECq/MWhF4Ntqv
         rymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712991141; x=1713595941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBFHuV2LVuWEjmAN/8ohS4VG5ENeR9bBP+jEkNcVGnY=;
        b=Ub/bq4BzT1FZaq4HqVStSfUajGkq8yyKTid4zFYJPsBwBeYUZrjqitJN8iYbVMaW/V
         OXRSXSEx0Ij6ac+rbfvtm2kw3XxlZvVkJOU8dHxUnX78ULzhbSA+xRJU07Q5G9uyX+M7
         HjlTIiBdSd2+GnQVkscp4yWgyYUA4GCd8ab2NVvUjDxJszetdtrImE1lu0+AwekQIrXH
         MncGDFMJwkh+Mvgb8UGrtrsvJ9gkw4cAOQ3qPpLUwwJm/DVNMWTOaEnr9PObkZvSb6bJ
         T5UtI7JCIHse3J72fzC2U1TBuRo2XJ4hsh03HXmr8vNbErIuQQ2ewjdZZvKNv4rU9L/Q
         P1ug==
X-Forwarded-Encrypted: i=1; AJvYcCVCwhpFpKJQY0KkbaZD0m29gO3vhEJqO2fieR0Tlmut1xVCFH76SLr+v61dFIs6Qm6dXFwgJyFkFMPS3uqYpuj5H2QeNHyhbesrJs7JDAr5
X-Gm-Message-State: AOJu0YyDuZ+LpzrNGmOuUzOSvZ68wim9KixtaGSzSoatwVidx+WbBJGG
	m71+Mylu4dPt5IdQnsmbu4FjXvaaTRtgkfi1W0avZvdg5aDKsnUkXk+uY4xdBvc=
X-Google-Smtp-Source: AGHT+IFxF4jJ0GHS1OMnmsjR3+db1ACxvmt66Yi/yXJeY5lDM1hSf5pmrlBnuOLCRIE4LCxRJNPrKQ==
X-Received: by 2002:a05:6a00:2183:b0:6ed:cece:8160 with SMTP id h3-20020a056a00218300b006edcece8160mr5221682pfi.31.1712991141027;
        Fri, 12 Apr 2024 23:52:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v12-20020aa799cc000000b006edcdb08d25sm3895634pfi.91.2024.04.12.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 23:52:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] irqchip/riscv-imsic: Fix boot time update effective affinity warning
Date: Sat, 13 Apr 2024 12:22:10 +0530
Message-Id: <20240413065210.315896-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_235222_937506_79938855 
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, the following warning is observed on the QEMU virt machine:
genirq: irq_chip APLIC-MSI-d000000.aplic did not update eff. affinity mask of irq 12

The above warning is because the IMSIC driver does not set the initial
value of effective affinity in the irq descriptor. To address this,
initialize the effective affinity in imsic_irq_domain_alloc().

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 1e6dddfd3046..11723a763c10 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -157,6 +157,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 			    handle_simple_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
+	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
