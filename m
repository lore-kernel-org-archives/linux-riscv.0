Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A707ECCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGOmDMdF+QvKOYFo9mgcUII1rcnu889RaWkOnx/UnNM=; b=KMcMbNP/aRVjE3
	ijm4420xZgGxUDCL+1Cgd3QPnNNLBwsLonG7Iag/6z18SY/zaaSVkY+Kc9QS8k0ppeeIhUiwRXm5o
	9rJrLDNSjsAVW51RSEIldBC+vCxyd/zZDToPtkeX//CjjyCWSVKoyGG+BLMJnXkwc9LGwxGyuG/P4
	RCv1VGN5/xLWgumQoC0DcFzVpDrfmYozu3+tLUbsGS6WdDfyjnw0K5E8KDV8BPRThY872u1P8EirN
	Mo3hhGPmqj1WKzdq+B8PJrX6SZLkTXTv7DYR77j83TvT5v/xDNVYZrMqGFqvmPmFTRa71FUfo9Smp
	x1hEMNsb+LMcCJ4fYp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ki-00000000xuU-1tdu;
	Wed, 29 Oct 2025 11:27:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kg-00000000xtY-0z2s
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33d896debe5so7876683a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737233; x=1762342033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFXZa2m3ScC7B7xgAgov/Ch2E5BoKfJoACxjrPDC6sE=;
        b=V3xUGWP6RK6fW0jt4Dbsna+/PuO27zcgD7WC1NwNmAr1/aXrDrJ2qNsn6YC2JLOOft
         VV8tE/F/oCjFuhDZWmjHB7Rrht2O9TlrbWWOVHHn6oFxC8jiNjcTA74T+Zh1l1Swe9u0
         bHGXsEP/OK9Mr4rigBH7IPybCCh08sVTWNDOsNn09eLQcsO+zWv/cw9MrK/wb49QEnR1
         waMWXWxofACGnTV49315m5lg3IQisblrtgnc1rwdXLarEvfeCarTTTjMgeGfc5zxXtHK
         LCGgAFO+MNQLtg54wKdrEFlRwApViFW8C/8doYhRzXVitWoQByJTRriCBvBcbMWXcKhI
         /tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737233; x=1762342033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFXZa2m3ScC7B7xgAgov/Ch2E5BoKfJoACxjrPDC6sE=;
        b=T6uqmnduQBtNHi2ZCuNXCDZXjN1y8lumVZH7KursFWnmvuHS+Yo0BgaMPSxViDQ99u
         JJl0KbIgqr31FPtOdivlWCxSqWMa9HNewZOsELFPLayiOZm9KISSfaSYf3WUC2sH2dbc
         dM+RqZ7JztydgThPrBfBiLofMA7pk6uE5iIZO8402Yhb3p3ru8kXVyfFmXOmmgXjI5nG
         YqzLT9wQKrIgYtuEF5BP3Soiin1qWItRG7OypVwzsDoDRbuLYhIUCMzE+MNowsJyUxYv
         lY49aX+TUObGbxWEtfuEOwdFHKbPDG9digGPlnOkkf/lpgpk1llbSMSnQ3j13KnUCk2y
         F/eA==
X-Gm-Message-State: AOJu0YzHWjgEwTze4QlGIFNDr5Qgw3smOl+0RSKnTvA39k4k/FH7HXSE
	avWbTCcMCSQGK4jMxJ9zpRvWfalGRPFBW1YEptc2xh9rb6TPG6VMEYrAxVq7FOrDF8jZhF9RZjr
	RpoDvq+xsSA==
X-Gm-Gg: ASbGncvumYWpuj1D7CIB/eA10AafkFMJEXj9NFfRICqXW9u/Mx/UHp1umyYVp4gZSAQ
	n4W1gDZAGevUzEpxtQE8oBBbqyTV5gyGPgkugFmyF+7ei/WtrpxeFMowqDboO1Lee4xb1ENjMVU
	eRki6fj9gdQ5ai6ospkREEwUpAEHRkQrw4f8OBM0EVhn7Qk1XUKvXcMRZaIa67FgNYwlr5HgvGl
	tMYGN74nr9l1OrPlSU9qAy2pqHGK0A/trPMpVikGsiZw8EHLzJHIN9PjlRkRFuAP09LA543yHQP
	GhNlz4jF6mjBXbHb4UWuNgGRm5QEMIjwbWpEaUy/zquYiueAbu0WzR79lPbwBxWVGB6etkC2WXg
	4lZzmyzILH+8Df/PzcgBFtBtPKMxc6xCjT/pHtdWaVLJV61g26skozD4L/N6/6Ph9XwCbM/37ZY
	Jt2lUZ8uQOJNpO49ys1mshnQVfVWvY
X-Google-Smtp-Source: AGHT+IFGkvDWy4UC3Hg/jmsLKRMLWCVuS3Q0brKoM+EvGQYG5cGXwRa91mgG3g+8I8GSaWTf36w5eA==
X-Received: by 2002:a17:90b:4a11:b0:330:6c5a:4af4 with SMTP id 98e67ed59e1d1-3403a29bc2cmr3385152a91.35.1761737233246;
        Wed, 29 Oct 2025 04:27:13 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:13 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 02/10] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Wed, 29 Oct 2025 16:56:40 +0530
Message-ID: <20251029112649.3811657-3-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042714_274655_42EE01F4 
X-CRM114-Status: GOOD (  10.25  )
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
