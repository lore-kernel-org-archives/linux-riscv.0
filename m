Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAD2C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZuRwYaDezwwgNTjQu5h9WdQ181nkZEXBet3d5W+Buc=; b=ssf374ptaq0UWx
	Y/jm0jSfDgLtrjRZpY7mixAwXuQ/OPYflGLnmV4j5COllZYmf0iQZ9Bi/KVD8ug4OsXbNjrsCAbSW
	Zld9v5qdoIq8/ldQdBo2/EqCJh09HJ9YCvxtIf5RgBVHb9tjVAk0qZRmtYCL1If8Hj+6cSgi2YUYr
	f/Jf7gYcYe5uv14DdNmLCcLAaxTW2kCf64ja1AFYFO8lzQ1gDRUrJ0uQk345oIJfsOl6hh7wIjQ38
	ngKNuiIeAj8EjdkLbm6NNZx5iRJZj2vNOlPv+ZN1FWLLlRSW/MknEJ+5hH15g7w/OTgim3F9RgD7d
	Z17He6vK0Mfv93D11MPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEu3-00000008zk4-3ivX;
	Wed, 11 Jun 2025 06:25:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEu2-00000008zjc-2zmc
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=; b=VPFRUB3nv6PVZQqLtiKKnqt/Sh
	OxJ8NaDEwJxzAih+fA5UMQ7nziTDTBKnozPT/zoDh6RBc9JFJELSvGeNuZuAqCdf5cOuPWcEB67zs
	CyT3WqhsKAGgtG7u75/7y1FGqGlhh3taLfqaaX++b3oI5ermu8xS3Le3bNwEU5BnEV0so///Usysg
	KlNw+hZM160076l9bTHqtjSY1qX9SVSxVX4u8k2U7oMQwC2akiz8FqBfDAwbD9BLJiDCMNV66YQQb
	EfM/dlcMB0RHaGD0UGqIEmBDOYTJHDyRMpl9ssoROnvvta6QtB+M6nIUg+BWxCh+SdlgcaxQCDLGu
	5tZbi0dw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtz-000000028Ly-3Mb2
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2349f096605so74900915ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623133; x=1750227933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=TBanIOmd/DQEFtUii9VKoEDBMzNolCA+aRTj9iV8V0ssT+EZSPAD+mF4OtXTqOuWDq
         gRS3hXPjOMEiqwg6qSZrFAOt+B0MsMtdfCIZ+yjWw9pKJgK0qkQVgxUNE4ZWLDpW54vF
         nO0MHkPSjLXjigLKye/hYb3mYlb4w3U0iNIc13tCOnT3W/bvU+N9iUaYgveV79zFmDRN
         c2MfTl+38F0j8NvvKaDkd331aLJnNK5JMcrueoExK0FZnc1H2QsYqYdzPIsp74GLAkXs
         00HIs6rxgNN0dJpH7q3ucXRG0eepCPM+JDhDKNW/1wQbIe7f2BsMd2M4RISE5UP53x7N
         EK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623133; x=1750227933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=bgAWIOHJC880/HtUrE87qv3RvxSM6SZSJ7xSMe4U0AjMKjlQ0UCC5i0JAGV8Bizv5Q
         eSXwEJKrZUEfkD4+3vaAyt3ChjhXceZ646M2uNY0vzR9+yAdUeCss9ta+UWO5WMpTbVz
         OpNrEd4LXd+oz8o4nkK3W9sNcbfMccoY3Y6qJz95T5WIh4N/vi5P9uONfrgNBB8oa3DD
         LrrkDtbpZuqij11Injozvt3u1AdUtbe4Zb3gUlu56awKuqBHhQU8HljdEdS0qwC8+dDG
         1bd/KwcSl2k3j05u3Cjitqw3lmA8nUIeKfW7YGjGKWvClgjBz0Gmq88u5i4GUE8n50wJ
         KLzA==
X-Forwarded-Encrypted: i=1; AJvYcCVtx3s2wPTMpqv5huiVNZD2EuWY1GrHfVQsjqY6UDJatufLxdX4UIGb6cfBziDA4OY7Yc/2IKjNczt8GA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww55fIgdCDDISqrc2TDItYJ5yfOdS9TZjNMszzLq4/keYNo4h/
	ylutB0tDrFbvnuMiwJy05HfWRZUAr+Elu4RJXAJMJwNryxx20P1PZht42ORdwo5bYqQ=
X-Gm-Gg: ASbGncugEY3SgUCuY+YhuO02169P7WzPWye/+eXr1R6uKatJn9VSamz+kh6fce31/Gq
	ydB0M3CWRj70MvRIYl6FCM3bONhVdcdWqwSD6HqRx39czjd0GV34/8Gvv/oz4u2/kX7knp3JtHY
	rTcJt0ZQokq4u8FiXufaWHxU/IBPY3e6mYePg0E7Ll+1wR+tQnC9sMRa6Wh0yZnDbYMnmUs5lzd
	+YRA3oGGfWEz3T7ltMIklbV6PKWAAI09mYPY3VCkdtvMkKrYHaU93FjYaxSlUrgcQu1D8Su4/zE
	9Tn2bFTOwzyPKeUQzEHA4FbMe4gm1zHPEWG8acBLz0k5MQrwFPnIprMLpqjArTE3ntx8+mttJdR
	DdyhEYbJkG/8NepMz25TYGeGinDefjvt4+rJF
X-Google-Smtp-Source: AGHT+IEwIvq+MzJvJvKzSGNR//1g1SyAHTIWb/Bau/CEh4PRJwyomTrDPbcTXddUHnHcaNXUPycI9Q==
X-Received: by 2002:a17:902:ccc8:b0:234:b422:7120 with SMTP id d9443c01a7336-23641a8bef9mr26337945ad.9.1749623132858;
        Tue, 10 Jun 2025 23:25:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v5 18/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed, 11 Jun 2025 11:52:33 +0530
Message-ID: <20250611062238.636753-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072535_925250_1769C34B 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI device will provide GSIs to downstream devices
(such as GED) so add it to the RISC-V GSI to fwnode mapping.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  1 +
 drivers/acpi/riscv/irq.c     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 2caf049f09c8..9c9d22f5165e 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -30,6 +30,7 @@ enum riscv_irqchip_type {
 	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
 	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
 	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
+	ACPI_RISCV_IRQCHIP_SMSI		= 0x04,
 };
 
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cc1928422418..d9a2154d6c6a 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -168,6 +168,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	return 0;
 }
 
+static acpi_status __init riscv_acpi_create_gsi_map_smsi(acpi_handle handle, u32 level,
+							 void *context, void **return_value)
+{
+	acpi_status status;
+	u64 gbase;
+
+	if (!acpi_has_method(handle, "_GSB")) {
+		acpi_handle_err(handle, "_GSB method not found\n");
+		return AE_ERROR;
+	}
+
+	status = acpi_evaluate_integer(handle, "_GSB", NULL, &gbase);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to evaluate _GSB method\n");
+		return status;
+	}
+
+	riscv_acpi_register_ext_intc(gbase, 0, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
+	status = riscv_acpi_update_gsi_handle((u32)gbase, handle);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to find the GSI mapping entry\n");
+		return status;
+	}
+
+	return AE_OK;
+}
+
 static acpi_status __init riscv_acpi_create_gsi_map(acpi_handle handle, u32 level,
 						    void *context, void **return_value)
 {
@@ -222,6 +249,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
