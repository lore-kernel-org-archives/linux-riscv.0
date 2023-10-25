Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC0C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRT6d4d+ejUuoAAV8xk+wpxf/eFVzLU3fs0U3XqhuxM=; b=ZO6LoHp6rLdzaT
	o021vPFN0rPp3/q2cBwf90RQtho/T71qEAoJenf+3f/XlG4wMeEAIY7Pxf9XsgJ3rFUQOAibziTXm
	lzXc9OwukZLyzHMbitmufb9QGBZjoKX78yS+yBR3cSJgBqH38cyqPrzNa25T5UwPG7ZK0cysekn4X
	IC6+0V4vPYx1r1jYRy6IcScyTEfiTTzEwEaa2jBYossz7r9ohxsqx1t56CZqFHONZq7bE6vhojmhR
	ZhDyErF0S/DgYNUb6JW74SWLK5T3TZO6gjw1bEYngjIxTes5yamk9MyLvxVnNr6xmt1M6Lw4Pf+5L
	nvX9snMwvmBzRiKl7VdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkSd-00D4J9-2j;
	Wed, 25 Oct 2023 20:26:39 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRu-00D3eK-03
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b9af7d41d2so155565b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265553; x=1698870353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwZ9IOYC0gRC/owt7RZ2EBdGuffYJiDuVuQ5+XRLwVw=;
        b=A29Lsk3Dp8yvUaiPTCI8GGv+26UDURKHfeDy9faoLLTuL1QiAhXtKJSAC7LUWAFQH5
         XUCyInZ8jJonQILzi/18Q7PnVYMqV784Hl+kXh2pyJ5kVzOF4iDWdRQgcEJn/2s3mD52
         geAKhMyobGBglWpSL0eLQSI1nkptJxfDEHdGj1ujT9boFq43af0KfRORlsoob3lAuqwz
         999sijuNJxZGv76uuHxZqj8io7U3b2hnCXWwsAsaJ0YEUWDuMqnLWr/gWbnckym9OLse
         I7DGb2orm/d1SLi5v4oRK8tzVSIs4DR3gxJUWeMFaeakASyfkCa2bqZcwuj9/kA94DkK
         viAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265553; x=1698870353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwZ9IOYC0gRC/owt7RZ2EBdGuffYJiDuVuQ5+XRLwVw=;
        b=NcpGUk81N+YQ/xF7c9rYa5NHaTFxhMdj7A791FmjX3Zl6Cs+d0TQSZQuGxA+UiLGes
         KMUsbQDyiCqMuUVGH9GeKzocdQHRB5dvLvfKBYHMHYARf7GD/rCDkEwVLtu+caGd2XQa
         ewzqB2IQQFq10fiKS8ClHCUMig6vBhpmU7hPH+/kyU97+V2w5MZ0g7SVX7LMYQ0n79NF
         Lx2L3laJNNLcaZbjaUPLLpgjwSsyJpYthlCU522Azj871cpbUoeeLRhpdeCQZA4DMtbu
         vbUAPpxwIwT2A0WR16u+Pc8FuUtySSoooA+bbI/ajgV2miwXRAr9j1uwp4GRj7GPSPzP
         zDng==
X-Gm-Message-State: AOJu0YxCbWnGG2umzNn8FNSdNrUUQA/pJ+kSld2VAmYGl0RUJecYa8t5
	cxkBZta1lpInyFBSO6TSa2UaLw==
X-Google-Smtp-Source: AGHT+IHkn2z1G+Hl0DvKFF4S04ijeypy9mwQD0HYMK+syY66BONzs/0zW1LpSVQhK3aml5xBfnLnBg==
X-Received: by 2002:a05:6a00:17a1:b0:6be:265:1bf6 with SMTP id s33-20020a056a0017a100b006be02651bf6mr14834736pfg.32.1698265553494;
        Wed, 25 Oct 2023 13:25:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 18/21] irqchip: riscv-intc: Set ACPI irqmodel
Date: Thu, 26 Oct 2023 01:53:41 +0530
Message-Id: <20231025202344.581132-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132554_082368_9988C69F 
X-CRM114-Status: GOOD (  11.30  )
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

INTC being the root interrupt controller, set the ACPI irqmodel with
callback function to get the GSI domain id.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f3aaecde12dd..627723d72b01 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -273,6 +273,17 @@ int acpi_get_imsic_mmio_info(u32 index, struct resource *res)
 	return 0;
 }
 
+static struct fwnode_handle *riscv_get_gsi_domain_id(u32 gsi)
+{
+	struct fwnode_handle *gsi_fwnode = NULL;
+
+	gsi_fwnode = aplic_get_gsi_domain_id(gsi);
+	if (!gsi_fwnode)
+		gsi_fwnode = plic_get_gsi_domain_id(gsi);
+
+	return gsi_fwnode;
+}
+
 static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 				       const unsigned long end)
 {
@@ -318,6 +329,7 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 	 * unsupported. Once IMSIC is probed, MSI support will be set.
 	 */
 	pci_no_msi();
+	acpi_set_irq_model(ACPI_IRQ_MODEL_RINTC, riscv_get_gsi_domain_id);
 	return 0;
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
