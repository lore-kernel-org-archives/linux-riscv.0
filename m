Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186C8C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZuRwYaDezwwgNTjQu5h9WdQ181nkZEXBet3d5W+Buc=; b=loL6EYY1FO+HT1
	d7JESTTn8feZsalW1nOmS+lZ/aXqLL24kXc1LjnKQae4Q/D8+QYlq3nTEcIM8/GLc6BkveOfSY9Dm
	RInJw25VB2V5gmDvMkOwFnD9F0j6+Ii97rqoEFmEQV8s+H47iEK/ptf6J4U56E7tyHoPH0NLZ0s2T
	2EThVSbjT776Wnkopf/xseT4kTMS78qhiPaquBi7vm20TuiL9kq04LfHWfY6ZXLlVZvZYZKNkgCuk
	5HQoQU9zt6KMlQVNDV+qUnxkHMKETDi03WEU9zVaeKOIlsnWbeATNoKIk3qrPN48NK0fumk0BS3Rl
	UBk9PDbZWDAZgzErGxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbfm-0000000DiKo-0Iae;
	Fri, 04 Jul 2025 08:21:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWg-0000000DVyX-0Nh8
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=; b=G7ZU0FOyAkIZT8JQIeb4kKLPEx
	221ZHUZQybwZvhi2s3rRqoDULgyFbGoEPsT/UBJ99XWiaYvjdNFs3iD8Qdw+JovapvU2/Pu/b3sg+
	0zKW5cCSU+j/T/JDDEmtlztZx2ddDhWzH/RS03Rxd54+U2iluNq2Am/4aPE1YD/dmhlhbPXt18qj1
	23PKXu+cHQztTgjssfqWNojkSMBDg468ehAXmz9l2anwxR6uezaXDorbBPLfgd51oKxp668iHd+zv
	lkZRaG8zfUoWrfcbFRSAy1ovtQ4AX7QmDvZ7kzSWCBIb8WkBewLRGalhQ/gVd0TjYwjaGAclCPFlB
	SvbrMISg==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWd-00000007nYU-020a
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:08:01 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso600250a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612876; x=1752217676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=X5hMRPR+egS0scmIJ8Eo8cLV/AucX5GAEavcoEIe5c0XhFF7suS0Jq2FOc3BLo2iHj
         wowzuprxFQLU238NLHJzTDby6VvzO3+aUN7v+hvVMPPFOyc206M7LCRvDasV8sdQqL5p
         3V2Eqj57oSmc0Gt9AaNgkSOZeuE5xMDmoWYyE1EXm+Ga53+drjYicH+IBVNHzSwhC95G
         B0wHm7rQggGRUPbu3yV5DpWLetTJDvGgjuUUhOLQUWgMiKsbtSdmN6eNhCkkFc961kSr
         w5HTbChp4UEPPDNbBlYgiI1nxfV/YO94KLK/jCf/m0nS3w/KcREP2Our+lXxcQfAN169
         KJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612876; x=1752217676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=nI0pj+yiyLDQXsktNf24iuZmR0ttrgsjr28+8tPKeb1Ftfj+F+J30eNGu/uG7r9GDr
         qSv694C693WCSpGt4lDBbZx4k15UZumz1tPGsr8yasjrAAf19vwIeK9rO9vvSFeR+n+7
         Q1qeBDiTcBehWiT0uDocuVU9gOvLYgCwvnKbx4/0BzD3TVbGUwAw9h5UuSjRRP0RJv1v
         yisXJPML+6z6HrC8IsTr9ntt6OKE82Fb3vZW+4SmGELak81WIgqKPLyZEokQqLwOKDjt
         0k/Zmc38iCG2DXHP0W6jUpJ35AgQBLEdsMSSn3pv2Rku+24JHnfiDpV9J4MJFZPoMIf5
         O9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWN7oO2A79umfZ2chhqzL7OguCBjfP1y4vsvsienFmjdEyL7ZMiJ9b9HRn7zY4d1AETx31ddtpvh9qPEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyddS0qWEhe+wG7udyDiIZROdmwjlg0mH9Uhf8kg0+73cr+p2K0
	+YIaQrlC+0vZgfM59FH5JOGYyGOBxBipQZFQERffov9rPgsQ8iosPAiwshfRs7FVJa0=
X-Gm-Gg: ASbGncut0TLh+hxHXdnlK22M5Bid6cpaPiRtlCDRZxkHNa7trsyY4v+QEgV/0xt6QkD
	t2I7Gir4K0gPevADMEUzKsNac69zoUvMVNEX7/2nnj44E31ZzBJw9e53qQy7ZoEiJYFq6+x3oxn
	2o9+5GK9vXdfv43K/lkusAWRtk15H2E6C+qInc1DK3CMQMs0aeN7TWeoqavyZZ/SC21+swDQeaV
	AmP+QCT2/efg5Z0UD77dDvApm/xAHOVfY7DwQXbXL2hJ7kWc5mzSIMutRD4g0CedBwV6kxcbpqO
	r0RopjoDTgp9v8v/NBsIP3qXLMDO99ohsrBYitECrQjA+H3BVpH2lSdIGSE+I0tAc3Uv6L60r0z
	P19YyFI0iaZoa5w5A3/nymB9T3A==
X-Google-Smtp-Source: AGHT+IG/03mTyIl4ACwrZWxyGTrvcF6TGZgw6cqAkHeGWIoJt4VduhRgTNhbrtOhLpJY/IUYJNAMug==
X-Received: by 2002:a17:90b:3bcb:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-31aac44b7b2mr2197771a91.8.1751612875556;
        Fri, 04 Jul 2025 00:07:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:55 -0700 (PDT)
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
Subject: [PATCH v8 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Fri,  4 Jul 2025 12:33:51 +0530
Message-ID: <20250704070356.1683992-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_080759_225867_AF2D016E 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
