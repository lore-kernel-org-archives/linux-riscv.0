Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A6C87FD3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZuRwYaDezwwgNTjQu5h9WdQ181nkZEXBet3d5W+Buc=; b=DyqqsAauPIQNB3
	uwEyhMymih6tUXVPX3VRbGMSNzOP1UUndaYimRucs506KM3M1p4sM8UyS8yPqAcnG6fSlpMWkCIRM
	ocKeiuT2BnZwu4kaE65RTWXTDE2Lbr+qoqg5mBAWcA3y7o5iOIt15SGt0D4i0awqSMQmd/RWtz4/W
	hu/NTNb+clu1gfSAZzimemKST8wJwKsxDGb8ss49C9tPD4DCgEQ1DC+y7bCDLPmdJpSVieYrE0CZR
	CEtkLHcFTbWCiKCUjm9kYNfrMMnJawbOumArDbeLXwUEpSAZVanG6yxI7dAAO1XuRFxy5i8vG27Cy
	BQJ0J2ELSuT8XeyE23PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLY9-0000000EI5O-2or8;
	Mon, 28 Jul 2025 10:57:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOv-0000000E8so-2207
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=; b=a+fXoZ9BTWDxULe2b+txbZwT35
	UNZhJG4xWBKjsjpzeKq52t/Gy/hd7bcw5dPEeJ0HFarq+Sa9c32B5On++5nyOZpldBtF00Gy1n9mc
	DWeY4jKXpWcjdJvUuYEBJ26y+4TgMShFKeigBESTIpECzUV5fhjfxdHQOK+JNJtIDaVxLfpb9LqTX
	NJxO6iHzAKQ0sAnBqrpbBKxwL3gxeE+lwUAADbfunLdDTdz9fG2MYMfZMtB6sff0N0gdn7shZzoQl
	w4N44UjHwWlQ8YEMPYwE5tY9mIc1CgNpcx6R4K/1mEFylFgztBFr6f9+SMoiLFrD8sQjlEgiQTeTc
	DJHy2WJw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOs-0000000CPmu-2QDW
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so4517322a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695845; x=1754300645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=McfafP/t0oxpvQu3uWXWzY8GByxRBWkNZdFbIBqBOkeLZ6pVnImMIfNZp2VyQuye0m
         KH6me3mywAt3TpuMEwQOvpQaHtW+Ie0bR5vVNAqooIRf23WsqeZxOz0s4oKH84sg2ZwA
         gyVLPR1Qqv+6lCYtcGdnSU72ieG7Xhu7JGBffYKBRRcDRbElw76wD2prVkJVByTIZqYu
         bzwwSPn5EsbjV68ixmf0qwwPovRmOjb0xCFwPRzd4NvmsiE7L85QiyY8+SiyZKABGibj
         KB95YknL/B4/rigai2RpkE8a+5SRm4QO92oPU+z/xN5reqDTe8xTX/d1AVbFnwCn2+ND
         8KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695845; x=1754300645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=OTHwEpAFsy9r1BMtnFbecttEjb7L3qFoud/3e4XFRyLUenc1OdeFs2gavlfgVo/lTf
         66SIPbmUrj8IdTeGq9Rb2KLa66pGuRGyM8GDP8fCQfSKjmaYlRE2gB8oJxinbnZmJFet
         O5+XDQbte6T05fBm5HK3Dzk5Aq+VKV6pqmRXc/Rt6FtekZ+jNHxzYr+a/E6odFGezPbk
         JVSYVddTd+cCxv8dS0Wq41HM7TpqZVwTYpnMD+ecLMctUKVLr6DfkkjUwZ0aojPBgHYe
         tqcqRlBVsN+bW9WAtcMmuTL9QxBNfJBTUeAYRLZkBFsHmDy9dwp6jhzOA5rytbvI4voA
         SNKA==
X-Forwarded-Encrypted: i=1; AJvYcCVsxdqdnzFDC4eCTkTU3BPDsUnS5YdwoD9ByweeaWF8QnKSG/YNMKYI8eRWgAqzKE9Eal4pzWesloBTYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqC9wqGP0J7iXAupD8kCnzHqi6wqR5VyILs0TwNuGk1NzEMPwX
	gwtCjreUbfn7gY2AIAcS4MtpUvIlIO3EVFUzblWh41qODNlxRz8Va3AdJPrHjpFgPlE=
X-Gm-Gg: ASbGncseJ+HiwqUG8c016DeBgwQArKfp7f1NogdWBSMOREDs7fm9qIb0uF1qoiFKpvZ
	nvBIeHHPdkV7zeekdCGSjlfueWU1CqrFl/6pg8GFdx6qp5gz2JM0P2wxfCnJWJSXe5MGO3Us7Vv
	ldd2o8KqMsG0KUppbC7zRN7+7xNLrSLogWKEgBajpJqsiFYlWnIO5SAN4mhy2pH/wSvs5ahMPgL
	gJ39M3OqNP67zENWNSfAfGlXirSOKUshUwn5VGRJme1Xrzz+/34Mnwbm6PX5kn0KONjmTNTB/iY
	fxK5fibus2ubnu0oQBgHNBwIadmtTu5a4Le2KSSUpZ0o9xHygYVdl+zGjo5b/F/4Rq1Cx+3NmwO
	44uypoLPgicR5yE6hYLC94LehqLdRq23Rw9R9Zuy+N95qLKGGoeAY9S3t+RRZi319drfW31E=
X-Google-Smtp-Source: AGHT+IE4g5l7pfzIpeMkicrYGgtf68TEV55Fd+qHkkxzNZ7lt9wZcfCKxLtocnW3t1JCAeR3r08rOw==
X-Received: by 2002:a17:90a:ec8f:b0:31e:424e:5303 with SMTP id 98e67ed59e1d1-31e77b1f040mr13775831a91.34.1753695844469;
        Mon, 28 Jul 2025 02:44:04 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:03 -0700 (PDT)
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
Subject: [PATCH v9 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon, 28 Jul 2025 15:10:27 +0530
Message-ID: <20250728094032.63545-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104406_734596_AEBA16A0 
X-CRM114-Status: GOOD (  13.06  )
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
