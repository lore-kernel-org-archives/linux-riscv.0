Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD514C25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9dHnR0zmGUDWwSi7ufUSid1fhpS8vi5CjeYl82qgWI=; b=zy0kY5GNjQ3YRF
	KF0SsdABtDHNFoTbK/OerPt8R5cUsjSPcwqam1GI4YQRyinWAVB0ZGX7NlXHp4BtUTtk4gPie8EnH
	Y6CgEple9rz641TnOor5qOkhCTv+5M23HDN1tpkOs/+1+xcrV1usG/9pS4HNxAajkqR4DoVb4lZk0
	3oi6oVtbEVyfhZ5WzLKjaEszk/c0BRA1lczwxHdXDPgaZjdjlY+2skPUamhyX35lFgh3QEF7Syj5B
	cwunkpJj7vVANcBbMoHZRvbYxxdgfiruus9VDpC5ocqbs1rFCYYC7mVsRqzWK292j6xFFfG5xKosx
	aPRmRe7K1uI/zLVwI2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQl-00D2in-0W;
	Wed, 25 Oct 2023 20:24:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQa-00D2bo-0k
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:33 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso125176b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265472; x=1698870272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XsFHpyMSXpsQo/vHxUfuExbd7P0HKVdbzIKlbRfdpg=;
        b=afNWlEVHpheGtqGo1J1FPqepXTBScaeyCKoTT6/FeMsMWcA699iB6jEaJQV47u+24Q
         N1+KyGaA/ZgFoOftp/ywx60k2R+FqrGWze2xV0r6NTxx0Axz0oOLpZhP827wMTSlPOVF
         CQrYKr6h56VrWoMVPwz4re5Adzp0uIgYR8DJ82OmnFrqu3xI7Uo8ufUbweq9HxKH2d1D
         cP9z85hOky+DMVhk0UDmZ0x23VcRWFpNp7/D9w5S9Q3t7tpPmyFHjdn5MDA/0KRBVGrO
         X1bUCiocs5f6tHEQQ6sCml1uP7wFFYE1rDfbUnjE0NzOgW36Y/7G1mtUoRr++2KyyjDu
         STqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265472; x=1698870272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XsFHpyMSXpsQo/vHxUfuExbd7P0HKVdbzIKlbRfdpg=;
        b=NxnPEen0xnz63GQ4RQNjXTaWt7pdc/QPpG80V3+1dYPwu86QmTT6GhXeqpeBpLhMZy
         oOV6HgDO2efSoymgN1yJP+cOUMcNmALXYLMW3cOh4T9A+qZWMRWMYBjbPXFGmbvMgIAT
         E/COqnsFKYyhcu06KjknLask41eczhgZUJKz/BJdN57c2djd8sLySHwhr9raPe3/UCvI
         6gg4B1iPhzGnh4N5BkoW2enyIYcBBxc5diA3l2DHJw/+MZJ4R1ESQxN6D7nbM/xJogXE
         riKV8y0Js3HYE4Vvn+breQCfJBmZp7NrRCKMTqAKZkAcWKJX6kT5e1x01f44QMXuIlj7
         0EfQ==
X-Gm-Message-State: AOJu0YyowSd3TlJy0m3wTF4hTTw90Cbmtxpailzey06rcVjdXhpHJT1K
	QnLeMaUMdO/57KYmvoA/YuGb1w==
X-Google-Smtp-Source: AGHT+IG17/2PVfDmNtmjstcH9/wp6PkDje8IYgLOfv4MBT6NCYwfFeoyShSprXc6RSlzfPVHtacKoA==
X-Received: by 2002:a05:6a00:2d86:b0:68a:59c6:c0a6 with SMTP id fb6-20020a056a002d8600b0068a59c6c0a6mr18973480pfb.24.1698265471729;
        Wed, 25 Oct 2023 13:24:31 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:31 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 04/21] ACPI: irq: Add support for deferred probe in acpi_register_gsi()
Date: Thu, 26 Oct 2023 01:53:27 +0530
Message-Id: <20231025202344.581132-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132432_263934_0567AAA0 
X-CRM114-Status: GOOD (  13.24  )
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

The chip which provides the GSI support may not be initialized at the
time of acpi_register_gsi(). Return -EPROBE_DEFER to support deferred
probing similar to acpi_irq_get().

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/irq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index 1687483ff319..c06cfc9725cb 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -51,19 +51,23 @@ EXPORT_SYMBOL_GPL(acpi_gsi_to_irq);
  * @polarity: polarity of the GSI to be mapped
  *
  * Returns: a valid linux IRQ number on success
+ *          -EPROBE_DEFER if irqdomain is not available.
  *          -EINVAL on failure
  */
 int acpi_register_gsi(struct device *dev, u32 gsi, int trigger,
 		      int polarity)
 {
+	struct irq_domain *domain;
 	struct irq_fwspec fwspec;
 	unsigned int irq;
 
 	fwspec.fwnode = acpi_get_gsi_domain_id(gsi);
-	if (WARN_ON(!fwspec.fwnode)) {
-		pr_warn("GSI: No registered irqchip, giving up\n");
-		return -EINVAL;
-	}
+	if (!fwspec.fwnode)
+		return -EPROBE_DEFER;
+
+	domain = irq_find_matching_fwnode(fwspec.fwnode, DOMAIN_BUS_ANY);
+	if (!domain)
+		return -EPROBE_DEFER;
 
 	fwspec.param[0] = gsi;
 	fwspec.param[1] = acpi_dev_get_irq_type(trigger, polarity);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
