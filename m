Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7409C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEFxjz99lyHt+j2+DXFPLo5bH0CAQ+zOd3IEYJDZ0qU=; b=XKmN8My/ALqghK
	ZosRwJoaqFZWaGMB01kFxk5k35ybpYtXJrzw+0MCtPmZ8mn1PYHizdvAvWDJWST+neiLLZnEXBFMp
	rS9uM+ESPKzPkQnrRexysfZMUqga7K3CpbTMuAI4kMXNe+HQrN5La4ON+HKidef6uIAzsaR6JM7yW
	HD4wWnEZ2++hEqoPks28RT++Gctn095B8J9CfctRCV+y+7bVHj3uWLpVrXzIli1w2tAxVXzLhhOYb
	SmUlPe5Sr/xhsO7kNZP5AiZrC8WFlIw0rvdaHaYYVxzqhbokYa4XayzC4R5YBCDe9QhUtjA5WnCFc
	ZdLHlgw/R4JbrCJ7+bQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeCQ-00F2TE-20;
	Tue, 19 Dec 2023 17:48:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeBN-00F1ZT-2l
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:47:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d3ac28ae81so24266155ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703008025; x=1703612825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaVzwwT2ecLOtMDBM5TdFJiJ9XdFZ6MUpboDwIj/4ug=;
        b=jaHIrw3CtURZfDLL5CdOrgdl4XiCxao8ndPVGp1RhjL9upeIAOzFU99HIdiqJPK0pX
         z3JJ+5hsg4z3/iLjjsml+JBx8GvZLXiByALaEdwPXVzIqFmd9PeQ5uKdqdACQEaGuTK/
         CtPAmZWVhfm7FeHYcUjkb8qpgHYmnqt1/WFZDELFwnkU3aplVbTAQ83ozCdTP0cCwmUY
         e9Zb7MSyG5jhQfo5+5kuuoZRefqurKFeM8UCQR67821Ey2il/jWg4UK8MT+/dTLA+1Uk
         KuNnOBKWIfSnPbl3mGgb6o0kA1ZqixpZIIxJgp5odoshHhbg10EkSR6IrIh3WdoURGhr
         +rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008025; x=1703612825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaVzwwT2ecLOtMDBM5TdFJiJ9XdFZ6MUpboDwIj/4ug=;
        b=OUufYxvRKWtFC7XisMsd3RqrKdkK8GrO8uuXU8ZmmkE993Q21UvjkCOaVCiw8acjIF
         Xail6gCMX4JQI2HV4iu9n/eSkaK+GS3PhctCeXCpftMZ1cc2jKW8fSu4TJ3II13idtsV
         v85iLcjPC29LQ/A+OrmYe6gbN+u3q3y6ngDvT5KRpBTe62ZMZJrona+qs6b4966FYanx
         iE6mhOy49fwZXSnTDTiwwmCeGJiCy6r00sVJ+ViqbeZBs/09CFK6RlTSZe85UayU00Xm
         5X3dRZbf8AccO+4sagprBegau4XMhELu/rsqmWBOkod+1wxqscwRz/8J/2rWy986vCC8
         t9gA==
X-Gm-Message-State: AOJu0Yw8jkhmIxzd8l3Ehtw2I5tVFFsJuuo7Z9zlPHcd1BBbbho5oK1Y
	6yPnr6tWJVigBiXhNtEAuwArIg==
X-Google-Smtp-Source: AGHT+IG5x81QIwdA146e8SSr+Pdh859h/oT2VMGTgxkFKS+ftvwwQnsNNroKYOvMgeiD+AUyeRhwsQ==
X-Received: by 2002:a17:903:2347:b0:1d3:c730:f0a2 with SMTP id c7-20020a170903234700b001d3c730f0a2mr3728002plh.118.1703008025154;
        Tue, 19 Dec 2023 09:47:05 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:47:04 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 16/17] ACPI: RISC-V: Create PLIC platform device
Date: Tue, 19 Dec 2023 23:15:25 +0530
Message-Id: <20231219174526.2235150-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094705_925171_B93878FD 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since PLIC needs to be a platform device, probe the MADT and create
platform devices for each PLIC in the system.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/init.c |  1 +
 drivers/acpi/riscv/init.h |  1 +
 drivers/acpi/riscv/irq.c  | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index e7eff7ab1474..c6fd4097e8ae 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -11,4 +11,5 @@
 void __init acpi_riscv_init(void)
 {
 	riscv_acpi_aplic_platform_init();
+	riscv_acpi_plic_platform_init();
 }
diff --git a/drivers/acpi/riscv/init.h b/drivers/acpi/riscv/init.h
index 17bcf0baaadb..b4b305d83b3a 100644
--- a/drivers/acpi/riscv/init.h
+++ b/drivers/acpi/riscv/init.h
@@ -3,3 +3,4 @@
 
 void __init riscv_acpi_imsic_platform_init(void);
 void __init riscv_acpi_aplic_platform_init(void);
+void __init riscv_acpi_plic_platform_init(void);
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index d08a851ab6dc..f14ea43b0178 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -148,3 +148,22 @@ void __init riscv_acpi_aplic_platform_init(void)
 {
 	acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0);
 }
+
+static int __init plic_parse_madt(union acpi_subtable_headers *header,
+				  const unsigned long end)
+{
+	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
+
+	return irqchip_add_platform_device("riscv-plic",
+					   plic->id,
+					   plic->base_addr,
+					   plic->size,
+					   plic->gsi_base,
+					   plic->num_irqs,
+					   header);
+}
+
+void __init riscv_acpi_plic_platform_init(void)
+{
+	acpi_table_parse_madt(ACPI_MADT_TYPE_PLIC, plic_parse_madt, 0);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
