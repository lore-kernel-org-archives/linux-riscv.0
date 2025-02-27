Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2AC021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGOmDMdF+QvKOYFo9mgcUII1rcnu889RaWkOnx/UnNM=; b=zhZhsXCEH0UaxK
	+jUjF6oeGbxMbQbTYNnttV4uVm8mRmbWggQ4gDRCdGFEqW3lYwbPp2FWw1UCPES689SozUohB62fZ
	zCxOwxVwRHQXi5xchlLSpoSqlWQL4xtM0iENT4aoguyDvCw6O4GcQfvqxb4EW9I43TdcAShdvRMm6
	fnJm0ql0OstzyIe17vh5wMBmVn2Esv0SCDxAYySYNAgMUdWAU1afAoUg6amnpaNptjgFD27sY5EKl
	8g5J7LmQ3REg6KPrzar0AZ4HWMVZNFBtOXGyuuZedjim0PPHtvIIDQct8nVo84J3urw/VO97hanNt
	qHNhcUmA0mtPrb00cnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndoi-00000007V82-3JJi;
	Thu, 27 Feb 2025 13:20:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8E-00000007O27-1cJz
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:36:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220d132f16dso10944825ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659809; x=1741264609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFXZa2m3ScC7B7xgAgov/Ch2E5BoKfJoACxjrPDC6sE=;
        b=L3uNoyrMDycm8rhaMg8y7OnmEgZNqOQ0o/22r7peRLnnC6V8u47KgnVkRem8FeNZ10
         SL7VS/5sZWJ73ohzdbodVG0DajgkztQzUviCGu6Q0tPbkBJ5ElVU7TEH9cvCx5cL7NVN
         r8AL1W6DN/0uAFB63/9fWkipt7bEbmpBJAhh+CFuf7YLLrcj7Stt9+mLbpHV+dGCAs3o
         Mtey6gjyQRHuXALfAYO32bjqQ3h+jB3bCeWySftEZDJpDp6icd8xl57x6qzKQRpacCZY
         Dm8M1rJeVsWuMOdXCJ0DK7kVWBRWaXOilxFxfTuOM99E2BRORoI7BgwaNxNekVCOw8d7
         vwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659809; x=1741264609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFXZa2m3ScC7B7xgAgov/Ch2E5BoKfJoACxjrPDC6sE=;
        b=YqO+npVhD8np/RJ++VfnxBoFaiCMYsVbs6DOx47WRbyBbGCji5ypzx49aGk/ZYLAha
         oD4K0y6OYbX3cZ5+jr8lTPHX0UFg0DXRiZiMl9Tm7K81TnbokwTvSIMxs8nkPvNsiwS3
         KZf+Ps/z+vdwJ1UqAOhiEzeQZvCcqOsGsJPohYGGU4ihhAh/Yt7uGxF/5ooOimsf78jG
         FGRUTNctxdVFCMTpYgxQj/IAcI7jNIEkUEscHXLQJz9uVOC5fkUrJou9alCcgg+D8EB+
         43nAIr35uwnHLJcTL1nhLkkPkypx+m3twJp+sOHH1dvOcE0vfGvsRbhMF4a1fe6B/BtH
         /93Q==
X-Gm-Message-State: AOJu0Yx/4mj2SIyalJFxHkBzoRfC+uNVM6sDbLf92/5XdgMuM/zNfoNL
	2tsivfec+y2++iahx2SkTAna/oTsI72Ew/f+WnHg2A1VVr0kaLtzU48RLL2VTKchb+1kK5R6gL4
	3Gz4=
X-Gm-Gg: ASbGncvb3Bk92ggMljMxG8NA5h2EtMORuJlDHWzF8JUYmMn2lwOZRQD4i2eFIcCHyoK
	QSHP6pDpYYg+JoqP2x9EkuZVMMcov9/elwLZnG9kAI/rvfQjR998yR70mpyxnhWDDjAXUGaSO61
	CIjOTK74zqS5uhQULpTQnUSZTIj1tvUGh+ffpX2dYpMkKISHr+gwr6YlvW6fvY1x5eCC8MVBHVV
	rD+bklnzTZSqtOZ10RwCwGc+cKvgRbydabkcEO8dr2LDjT30OrrnQHsKZRRH0+GQhNvYVGCg0HP
	2PE4my9S2AgdEx7fSDn0nPOU3VnRMA2PipZx
X-Google-Smtp-Source: AGHT+IGIh9E0vXJbqDwy2DSU2gnNrcolcT0Umoa7eQqwP9lNhXHlny+mB50OGnl9ch8jNaDBTVMb8Q==
X-Received: by 2002:a17:902:f706:b0:215:b058:289c with SMTP id d9443c01a7336-22320061fd6mr98812585ad.8.1740659809295;
        Thu, 27 Feb 2025 04:36:49 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:36:49 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 02/10] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Thu, 27 Feb 2025 18:06:20 +0530
Message-ID: <20250227123628.2931490-3-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043650_419643_806F2466 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ghes_map function uses arch_apei_get_mem_attribute to get the
protection bits for a given physical address. These protection
bits are then used to map the physical address.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..0c599452ef48 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -27,6 +27,26 @@ extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
 
+#ifdef	CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff is used in drivers/acpi/apei/hest.c for disabling
+ * IA-32 Architecture Corrected Machine Check (CMC) Firmware-First mode
+ * with a kernel command line parameter "acpi=nocmcoff". But we don't
+ * have this IA-32 specific feature on ARM64, this definition is only
+ * for compatibility.
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	/*
+	 * Until we have a way to look for EFI memory attributes.
+	 */
+	return PAGE_KERNEL;
+}
+#else /* CONFIG_ACPI_APEI */
+#define acpi_disable_cmcff 0
+#endif /* !CONFIG_ACPI_APEI */
+
 static inline void disable_acpi(void)
 {
 	acpi_disabled = 1;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
