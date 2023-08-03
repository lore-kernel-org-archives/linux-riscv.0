Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6EEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqUeQ/gqHeByMRRW9qQ1d8O1lLPvFjqctdM1cbEnQ9A=; b=K1UrZE7+qiA64P
	nolPIP226BcaiOJF/6fielwSQD3TbkUCoKm0erZTaVY3ldXgn7D4uAOLqzwx4dESh6PUwN0zFkH/x
	CjGur7vX8CfMcqWm/FY7bzK/afMenhnGsBqRLdkf7g3jzDvX2ajp3tCVjXDe360PKA1yNmBeXlz+6
	6XoF95QPLPBFYqtUxJj2qwOKTXqOiEPxchBfxb53SwcjC1WIgd0hZ9knbKTCv5LXFE1XrjK4qyzEP
	Av6cDDezOOd2JEGD0kt/UvXk6gXERFeyen8TlOCNsC2YTeIZkAUIay+L03etYGe5g2Rug1pA0JvoF
	gsfwV4O2occdRJZ28/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcbx-00AUMK-1i;
	Thu, 03 Aug 2023 17:59:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcbu-00AUKm-0l
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 17:59:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso1089782b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085582; x=1691690382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFiDx4yUD9M5LLDSVyQwmi0hMurmb+i35a+0GaoSwmM=;
        b=gzSCFSr/G3waueuE9A6zvWLt6I+my76zCgzC+Cixi6x1rcZmEeUXOSYMURhNyw6A6r
         J49EhGgoE3rXRkx6/8YpidVkV0MDlLQRzHN5khGbW0Z6Le7dX36yRwInwPOpY3NUol9K
         VFZda8kXmQd0g/+Bcy87pAQkGHttASe2PqLvfoe/rAFLFu56gnJi/ypQPQH0DfBUZLvh
         rumXtVJlEMOPyX69tNEq170gumWAvTBB487kSAKUPQbVWxjTEwxI1l6eSwdWgp1IXmU2
         EXNHu9wR+N4ak1DbuoMVvmyGwft7HubO+CSmircw3jRVDj5DBYF+Ylw9aBGU2GW71/6K
         aTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085582; x=1691690382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFiDx4yUD9M5LLDSVyQwmi0hMurmb+i35a+0GaoSwmM=;
        b=YP64SCG7uoKHcTE2AVDyEhh535z35ibVJqm0w1WNAmEjT5Naro+fraFNcyO61GCuYP
         GRbeWbD8S9tHX3O38EpUmTMsuCPF+Qm8t4oXBiXlHdM42TEq6U5IUFSyiEd3AYIB0nsy
         Ro/SUt+EZKcnFxXoc8pEG94pScDzbAR86BAyO+Zm0nGh3bbHa4tdV+4Pcn8wm1Pv62WQ
         F69QRKXSSUdaJwcaN1dOw7D+zVBqKTt15AEYIcaDfb2cfj9G0P7ZouMCZUm9w5l9NejF
         LE185GHa0ec4KbdREc0iUSArN/r0mKuz003pyo45z8LbFPEUdaubHt+1ai++nAzFRbNu
         dJ3Q==
X-Gm-Message-State: ABy/qLZa28FCDrXek8EinT5fPkn4zLrXW+D7YJSJojtY4CijBGMFbzaI
	1tfV9Wh6m1nsDZLwqVpbVmk9ZQ==
X-Google-Smtp-Source: APBJJlEYFTsZLTq9I40pUpD7LIXiH3Cg29Qi6vfE5k5jpjtfQAYsVuB8uUL66kNJTqe85l1gopgFEA==
X-Received: by 2002:a05:6a20:7d9c:b0:13e:82ae:483 with SMTP id v28-20020a056a207d9c00b0013e82ae0483mr11419977pzj.31.1691085581732;
        Thu, 03 Aug 2023 10:59:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:59:41 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 01/21] ACPICA: MADT: Add RISC-V external interrupt controllers
Date: Thu,  3 Aug 2023 23:28:56 +0530
Message-Id: <20230803175916.3174453-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_105942_275868_8928D060 
X-CRM114-Status: GOOD (  12.74  )
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

ACPICA commit 8c048cee4ea7b9ded8db3e1b3b9c14e21e084a2c

This adds 3 different external interrupt controller
definitions in MADT for RISC-V.

 1) RISC-V PLIC is a platform interrupt controller for
    handling wired interrupt in a RISC-V systems.

 2) RISC-V IMSIC is MSI interrupt controller to
    support MSI interrupts.

 3) RISC-V APLIC has dual functionality. First it can
    act like PLIC and direct all wired interrupts to
    the CPU which doesn't have MSI controller. Second,
    when the CPU has MSI controller (IMSIC), it will
    act as a converter from wired interrupts to MSI.

Update the existing RINTC structure also to support
these external interrupt controllers.

This codefirst ECR is approved by UEFI forum and will
be part of next ACPI spec version.

Link: https://github.com/acpica/acpica/commit/8c048cee
Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Bob Moore <robert.moore@intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 include/acpi/actbl2.h | 50 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 0029336775a9..280ab4c7f77a 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -893,7 +893,10 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
 	ACPI_MADT_TYPE_RINTC = 24,
-	ACPI_MADT_TYPE_RESERVED = 25,	/* 25 to 0x7F are reserved */
+	ACPI_MADT_TYPE_IMSIC = 25,
+	ACPI_MADT_TYPE_APLIC = 26,
+	ACPI_MADT_TYPE_PLIC = 27,
+	ACPI_MADT_TYPE_RESERVED = 28,	/* 28 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1261,6 +1264,9 @@ struct acpi_madt_rintc {
 	u32 flags;
 	u64 hart_id;
 	u32 uid;		/* ACPI processor UID */
+	u32 ext_intc_id;	/* External INTC Id */
+	u64 imsic_addr;		/* IMSIC base address */
+	u32 imsic_size;		/* IMSIC size */
 };
 
 /* Values for RISC-V INTC Version field above */
@@ -1271,6 +1277,48 @@ enum acpi_madt_rintc_version {
 	ACPI_MADT_RINTC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 25: RISC-V IMSIC */
+struct acpi_madt_imsic {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u16 num_ids;
+	u16 num_guest_ids;
+	u8 guest_index_bits;
+	u8 hart_index_bits;
+	u8 group_index_bits;
+	u8 group_index_shift;
+};
+
+/* 26: RISC-V APLIC */
+struct acpi_madt_aplic {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 id;
+	u32 flags;
+	u8 hw_id[8];
+	u16 num_idcs;
+	u16 num_sources;
+	u32 gsi_base;
+	u64 base_addr;
+	u32 size;
+};
+
+/* 27: RISC-V PLIC */
+struct acpi_madt_plic {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 id;
+	u8 hw_id[8];
+	u16 num_irqs;
+	u16 max_prio;
+	u32 flags;
+	u32 size;
+	u64 base_addr;
+	u32 gsi_base;
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
