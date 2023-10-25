Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37529C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CprFl5pZ43NHVMX67VdFeoXC8bIhj3j0vgaqlTZLTCE=; b=dI5SXqT9kyPEq6
	sn6eClBF3VEHFupcchpHKsHCXjG0yvFFd8Mej2S/G/kpEwmLxacm6Slrw8T6dAdfG9e1oYYlY1Nm9
	i9DeW3gGcjHqxDI6yRfbVqKNK7ftJxXPi2yQVBx4iM3svFE5WdQObCqThCMDJvlQExTTN+MA93IYh
	vD8ZFmkrJ06JzLXEza3zehD9tsy6cGJwUH8IJvWmAJFaW6D9E8KZqYD7GlymuK8XtDq3yuYMQCu/+
	SOR6BJC6CnLGKKuoClsBCYFfV/kNKi5V7XCtXGh7uByUWCbJBZ3RtNk917pbnQqDhqFGJXpdVa87g
	e6sBBm8QN7ShZ/hciqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRM-00D3Am-1U;
	Wed, 25 Oct 2023 20:25:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQz-00D2sG-14
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so132191b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265495; x=1698870295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdOBYbLR+bXetJ+YmrkOyswglZ/H3DLDZKjYZYq4pUE=;
        b=b8e3cYC+TqvhyllKRkiZLEEyLIj902xXMm3Qt/q24W9X7Vbw15P4hyfd1C/XUbMg8p
         E1vSqtJ5QqyutRo6xfxpvk4fX0v0H2m47+i/fBk5A4Bn+jrxHrV1exgMwqbh2Z/Ulvay
         Kb2141Vxe75DSBkKibNJXZk+J29eHTiVjB3TR2zVjAixcnrG98AY4l1jfrNmHkNNdDdF
         KUCJ3+cZ3hAV/q2H7JOhCajn2xZXD+6Kfo5+DA7TVJ9ALD4VX6aDZbJA867lfkSCgvw2
         hugRLKA7fuf62iwovZNJ21mRqX5mg+RqkY/R0X8crYSW697W7XxQyG3d8dzq2UYJGNGh
         NwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265495; x=1698870295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdOBYbLR+bXetJ+YmrkOyswglZ/H3DLDZKjYZYq4pUE=;
        b=QNkZRE9QNI7Jsz+O3JJ5Dtwov+AaNy4lJpZXa2Agx4TjNKbtXiqUyHwG6PCFEOtMcE
         GHXxcpmqL2RszZIm59Rmt4SQUEva5uSHHIsAawUWWaye/S8VN9q3j6o7bcmzI2MXEBW7
         GubViT0/kc00bIQhRWsrJx/u0TcbrKARJ6naU25GlVnBEaQRaraNTHIUOGW2acl3v2/v
         y434MxiK2hpU51D62k5ScJfCuovnaZdG84eP6jQ4+/b6LgEb/jfxP+PrKZN0geHYe/oe
         J93V6mGi09kFLaWclzi9IjklMsSojLdGXQgfRKCEaCxnWbPo8ex9jUmhJeoEcOwom0HW
         voeQ==
X-Gm-Message-State: AOJu0Yw7yB5ypw6Rx1c7KNxljMa92M2hdTjSn/w2aWwajs54si0hg9uI
	H3GmOYZc9l9xCCXg1z482jUGxg==
X-Google-Smtp-Source: AGHT+IGOtWmx7Z9hH5AFpr5sZFQnzIJZNuxwJNKWTB6+enKWMWr67WgjO7Vy6dwjrSM8D50mINvLmA==
X-Received: by 2002:aa7:888b:0:b0:6bd:9281:9446 with SMTP id z11-20020aa7888b000000b006bd92819446mr19185035pfe.10.1698265495348;
        Wed, 25 Oct 2023 13:24:55 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:54 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 08/21] ACPI: pci_irq: Avoid warning for deferred probe in acpi_pci_irq_enable()
Date: Thu, 26 Oct 2023 01:53:31 +0530
Message-Id: <20231025202344.581132-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132457_373745_E12A2E03 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the architecture like RISC-V supports deferred GSI interrupt
controller probe,  acpi_register_gsi() can return -EPROBE_DEFER which is
a valid use case to delay the dependent driver probe. So, avoid printing
the warning for the deferred probe case.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/pci_irq.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
index ff30ceca2203..f7d0822da08f 100644
--- a/drivers/acpi/pci_irq.c
+++ b/drivers/acpi/pci_irq.c
@@ -452,8 +452,11 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
 
 	rc = acpi_register_gsi(&dev->dev, gsi, triggering, polarity);
 	if (rc < 0) {
-		dev_warn(&dev->dev, "PCI INT %c: failed to register GSI\n",
-			 pin_name(pin));
+		if (rc != -EPROBE_DEFER) {
+			dev_warn(&dev->dev, "PCI INT %c: failed to register GSI\n",
+				 pin_name(pin));
+		}
+
 		kfree(entry);
 		return rc;
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
