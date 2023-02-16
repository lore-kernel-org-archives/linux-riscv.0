Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E844C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kak9EHll09kOhbhiPyDGRSSOtqIQVyBjPBkloSLePJ8=; b=PydLPNoMo7MSm1
	PPYG9UBJ+vY46x9++nTrPcz28Obwl7f7JF6Qj4D8n+q1ben+nTVUAhbKLVoVazm/BKIqJ5CL1gZfQ
	hxFsDUJvJaUyrL7d3LhaqViolLOQiF1XMMYYmziGwYtUCloUhhCxI87Gw0i/6ZRjOZKpFKeluWaND
	dzvcO7mJY5uyzzCyXvqUkUI5oytTmz28Vrep2/NS8i6JMy4TDv2RpHlskY6fQ4E1X+51tEQxp8yJj
	N5Fo5nrB/XpYtHN6iO9gehv6t4vTu8lPriGRLPmh53UENEinLkpX9hxsvKU/5GuBJqwLhVCYuxon2
	mMjHTIIfRNRt75v2Uc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisV-00BTQm-NR; Thu, 16 Feb 2023 18:21:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisS-00BTOI-Kp
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id r8so2953701pls.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T/9WMqfcgE40kVyTz05I09P0F9v/Zdvsnucdf4/Z5g=;
        b=MBRj07iUrgHWwP/PL9m6AtLW+qb8U18eyO6/36bns9c6UoAOz2OzMnR2e4Cdh6Kv4c
         5U3H0CPnIrADmR9yLkbugn1hcLCwwqX07zxNNUuoWIr+c6fZODCF7wT2aZuT+AzlLvOa
         Q1ROw/0yRUOXRLx+2eqd2dsbqX+/BhpdhlpB5hqPlV9ELFw9Sc/nDaT/FlGczY596ewa
         V3OBgDoq6t1w7RJfsd72MzeoWGcwoO9R7yCsPe0OdQTxO/2T1f/tTd9iv2nhXTZPKIzc
         3dZUhwf3Fr6ueWe9wpMBUEMC2rqOMV0kbLLOHPkBfH84LyRg+JVQuMaOop0ElzXAP9ut
         jG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T/9WMqfcgE40kVyTz05I09P0F9v/Zdvsnucdf4/Z5g=;
        b=3nfGo6EewDUhvz8Y7VJW6iM7p9ky/qN/lhS1Lp/fSLVT4FwXTJkogR6rkVlLgDO7x4
         F4HF7Oq62/VsWr94Viyyzinl7/hr0l6xivSNqrq4J66uaqwsfxGAGqXDjZpzCe1V9qy5
         cc+XZvFIU1ezLH6H/Vvr/uK0P/yDELtoqrxhhNcho48NKrvy79unKOqOC+sSwE5YHzj1
         tLhN4Nq+sdnb3WYa+LTjwSFve16VXgtMKHeAG1thb0CkqtZXFF8TL4odtsK9EWJnAnUG
         UGtX2cZxawveYq9E7hDt23EjDsgKP++ihp/ireZhjtzFlbxhPPXiy3O1tJw7GOe4dSxe
         rtEg==
X-Gm-Message-State: AO0yUKVHfI+CU8l3VmZL7mFh3DJq10qWDGni3FYtSfyiRM19XcgOo8Cn
	qr2umM4SAmrzUxLjpVELsBABqw==
X-Google-Smtp-Source: AK7set8o22c6x1/057iVtVepqFXyS1Iug9Z7IPjx7jh1+w4cPpbGWJMNy8wLXDEg7dW4snHpwIby/Q==
X-Received: by 2002:a05:6a20:8f07:b0:bc:7bdd:551b with SMTP id b7-20020a056a208f0700b000bc7bdd551bmr9022499pzk.45.1676571661568;
        Thu, 16 Feb 2023 10:21:01 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:01 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 02/21] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date: Thu, 16 Feb 2023 23:50:24 +0530
Message-Id: <20230216182043.1946553-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102104_702606_26BA6177 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, acpica-devel@lists.linuxfoundation.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be available in the next revision of
the ACPI specification.

This patch is not yet merged in ACPICA but a PR is raised.

ACPICA PR: https://github.com/acpica/acpica/pull/804
Reference: Mantis ID: 2348

Cc: Robert Moore <robert.moore@intel.com>
Cc: acpica-devel@lists.linuxfoundation.org
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..abb700d246df 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,   /* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;  /* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE       = 0,
+	ACPI_MADT_RINTC_VERSION_V1         = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED   = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
