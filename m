Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2FCEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2y1/nVA796T5EYrpb3g8rVxtoPYMAelxgulOhoqhuSw=; b=ylHEYbsaaWNrlv
	NOfit+mxC3H1v3N2eDJwLMVAVICfE4dJRXFq3lr9nQNsefTZW8AvM6LcuCSegORA2dyt91STHTDbK
	W6938rVfxrODcYG45iw1q0EVA8is+pXQvPmj7wrkdcMhx85RYQlgFtMj5lVgpdkuTxQ/XA5DHkj6t
	B470elwVLsFTMSSz0FpTwJlxKxupebHN4tVzp/whyHT6M6VrzbpC/XkNl54XT8f8xYF0pXkGe+z+q
	9lvCm9f5QjF1Q9BXEX597HQJzcYmw9U6T63TG8ZavcvdviSMqG3SW+rmqJilT3U2x642Q2ucQ4Mpy
	QavbczCNC5z5ZNayoADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcc7-00AUQE-1K;
	Thu, 03 Aug 2023 17:59:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcc5-00AUNz-0K
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 17:59:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68783004143so890231b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085589; x=1691690389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZnV0ewqSpbZRhAC/LQ4a5BRuhAMm0ngpEEdA3S7vUc=;
        b=bnUHrvcB3yN6JHMYj1LgPtgbaxVQ2/kWyipu/UeXRJ2tHBpusAvGqpA2JpZ8jeIH3g
         SyS215bD2yhR3UKyi9XvIbGviVfviNKGBhGo/Mk/B9uovNyjuY/6JKLvXsCys19DKBzy
         PK3XjqkewPWtoHp1j2jTNsCLUY34QkGN+CYnMoiiMFGecT18d+z52RAzbiSaOEmldABl
         hBbRGcvCyS2IdMb43pHQK5fXbIjZesRZXZl+zaNJ8ai+DEh2SCarIlkd0XwjKBowE4e7
         pIqmYk0rHQaaJOnTsyBYVT8t+V9YHSEPUdcUxTvVigAA3BrS9RhiMJna4uMbinUca3Rm
         +79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085589; x=1691690389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZnV0ewqSpbZRhAC/LQ4a5BRuhAMm0ngpEEdA3S7vUc=;
        b=BsaiQF6YHTjHYXgVI1MLN5wywa2PNewSBj6F8FqVwdpjoVAmHwawvSHosu86hdF7HV
         yhiJdVu6VkImekJsr16cuxI/dOOYf25emDaber5uQQv+vFMOREBUnirawVe0C88pnyXK
         Cx2IWCFf7gDnE8sPiib60zlqX5iXQtbhybjtUaulXc8YQik3qzS0q8Uq6z/vDFe2r7zF
         7vIyGSvON1cZ1MVxkz0UXi4cvVJ8pKIKji3wSjnP0ezTiAv4ArTGSJYhZu4RXLHtZm8N
         09rR25mhmwQMY1zm+7diU3dQCOmyQ23+91MXXRkxdZxwDXNNjlW0qSR70bY0xPcvwZ3M
         Am9Q==
X-Gm-Message-State: ABy/qLYKFmLAnavZnB9I4RFNdNXmPKnkAGd+KjsO3BlLusclLMSlBl4B
	cXSCgFgY36/ZnW0v9A7ylknykg==
X-Google-Smtp-Source: APBJJlE1b+j2IWH4TbwV8C6fjO+Svt90/nwRmWf6oRPC//NYJR0B8gyqBDu4bXvcfIVaY5ldDXWYCg==
X-Received: by 2002:aa7:88c3:0:b0:687:20d6:faea with SMTP id k3-20020aa788c3000000b0068720d6faeamr17580448pff.15.1691085589326;
        Thu, 03 Aug 2023 10:59:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:59:49 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 02/21] ACPICA: RHCT: Add flags, CMO and MMU nodes
Date: Thu,  3 Aug 2023 23:28:57 +0530
Message-Id: <20230803175916.3174453-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_105953_139747_9BB50444 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPICA commit 2eded5a6a13d892b7dc3be6096e7b1e8d4407600

Update RHCT table with below details.

 1) Add additional structure to describe the Cache Management
    Operation (CMO) related information.

 2) Add structure to describe MMU type.

 3) Convert the current reserved field to flags and define
    a flag to indicate timer capability.

This codefirst ECR is approved by UEFI forum and will
be part of next ACPI spec version.

Link: https://github.com/acpica/acpica/commit/2eded5a6
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Bob Moore <robert.moore@intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 include/acpi/actbl2.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 280ab4c7f77a..3751ae69432f 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -2778,12 +2778,15 @@ enum acpi_rgrt_image_type {
 
 struct acpi_table_rhct {
 	struct acpi_table_header header;	/* Common ACPI table header */
-	u32 reserved;
+	u32 flags;		/* RHCT flags */
 	u64 time_base_freq;
 	u32 node_count;
 	u32 node_offset;
 };
 
+/* RHCT Flags */
+
+#define ACPI_RHCT_TIMER_CANNOT_WAKEUP_CPU       (1)
 /*
  * RHCT subtables
  */
@@ -2797,6 +2800,9 @@ struct acpi_rhct_node_header {
 
 enum acpi_rhct_node_type {
 	ACPI_RHCT_NODE_TYPE_ISA_STRING = 0x0000,
+	ACPI_RHCT_NODE_TYPE_CMO = 0x0001,
+	ACPI_RHCT_NODE_TYPE_MMU = 0x0002,
+	ACPI_RHCT_NODE_TYPE_RESERVED = 0x0003,
 	ACPI_RHCT_NODE_TYPE_HART_INFO = 0xFFFF,
 };
 
@@ -2810,6 +2816,24 @@ struct acpi_rhct_isa_string {
 	char isa[];
 };
 
+struct acpi_rhct_cmo_node {
+	u8 reserved;		/* Must be zero */
+	u8 cbom_size;		/* CBOM size in powerof 2 */
+	u8 cbop_size;		/* CBOP size in powerof 2 */
+	u8 cboz_size;		/* CBOZ size in powerof 2 */
+};
+
+struct acpi_rhct_mmu_node {
+	u8 reserved;		/* Must be zero */
+	u8 mmu_type;		/* Virtual Address Scheme */
+};
+
+enum acpi_rhct_mmu_type {
+	ACPI_RHCT_MMU_TYPE_SV39 = 0,
+	ACPI_RHCT_MMU_TYPE_SV48 = 1,
+	ACPI_RHCT_MMU_TYPE_SV57 = 2
+};
+
 /* Hart Info node structure */
 struct acpi_rhct_hart_info {
 	u16 num_offsets;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
