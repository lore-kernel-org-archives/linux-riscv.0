Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBC0C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2JwHzFBpROmY0bxDUtjqUPP93fEqPEL38ejLYNqTRhc=; b=11cREejC+79KxO
	czCap+AJV9Qgznn+e4iw8Rm2CdJQ7zXX2KddW9TZOr5sgapIR+ijRc7OTZU/FEbbrUCRHi5pHK6i+
	S1Y7rpqRfCcRxAkxdS6LGd+pigmK2BtSvr86vemg1BkV/NkFBMWYoddZZ18zzuUvDibBxLc3nObOT
	hzuzUNlUr1DP3D+L9oZ660DsUehjCQLWAQyYCxP9dyaFZerXTmqAONB6W4dZCZcgvC+1ykVuxrCUc
	gCjz4UwQp8+H6en1QRg2Tgm0NmEyjry+MQZLUuTb6AAZw3zZkdiOsJ0aL+chPXwEvjdxzX75M+4RV
	Og7JbqKSjkAqxKUan2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTgv-0000000FgRG-2jKQ;
	Thu, 16 Jan 2025 17:30:01 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTgt-0000000FgP6-20ID
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 17:30:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1338688e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737048597; x=1737653397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViLKbyt11DNyX+6T9thmb1jIo9G0NlwfQwRQiKi+WKY=;
        b=jvpHAsB0hSbo+RWEq3A6NjrVakfFYID/O0Vqa0lDmDUMRUnv2Gq5DzLK17yK5IgBEw
         lLCmpD84axaLSfshX0GX69bbjzhKviTiWKDQL1qTqvGkXarOIx/FzEkrTDdfx9La0IIz
         NK/C5g8d6iMm46BbO0cdp0mOycXcFAflsIwgqx0A4RJtl98oEnAYCkqVbqIshTvwthfF
         Bor3RwVqBAtoLj8qozUw5ofW1rIjV3gUGEIPEbNmLNVRoWkcwlgd4j/w89FiClspV9bE
         2CYjF8gg2XPzmE7dsYv03XMb/VTSPCirMIVtIcEqO5HBErnqfp2ZLnS12j6eFATkQcJt
         Sx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737048597; x=1737653397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViLKbyt11DNyX+6T9thmb1jIo9G0NlwfQwRQiKi+WKY=;
        b=PrpNMkEFz4ZOttY2OWXAbZTAwnRPGBJ48bXKCGOmNGXW5kq83mB0KvlLJT5WbZSXps
         8xJJDlnvVj0AmyFEDuzAsWpZxvQoYS+Z1+Sclh6O1AQISHfQTSz027K17wQOJko2WmJk
         iRqynm8LWTOIZ91DQYN3Gl8Kw5seCD3zN42+lTCAkCPpIoOO8GkALVzQBB4tIHN+2EvA
         g2rChj/mr6jB340q1Dw6Kw7QF0k5gyXQnW41qZmSrHPvbLtioCCVFzzkjHpWWnKAGR2s
         +p0w8wwzA4R67CL8TJ6+z3Qpn0L1l/01WVFk8zIDoo6eF4oKJQ6T2b/nXtlD3w7a6SRf
         A5lA==
X-Gm-Message-State: AOJu0Yw4rcqVfA5Bi8OlKbha9zKvgXxsuFEXlw5ItpSDpznu6SU4qFbd
	gK9WLSwdzTCIkJxGBvpFnn/JOflNsonwKtjjunfd02cKIRS06JPV1VBN4qOpUKM=
X-Gm-Gg: ASbGnctU+gt5WG4nRwesPYA/RJyxQBp5f23qOm2/MMfRzMzEuKBjphiUxWzvzevIud7
	Q+l5MfUr1W30heSdDSm2nlb1s6znZelxaIcIyndzD7a9VvK1bMV8iYiDY8Cg3cC44j0zBQON1DE
	H2RIGpTI0G/yS0bS72yD7GdD3ARo3PeSg7Inedp26N9kHu2hOuCZSZ2mj8KtrhktK5yXjRw9WQB
	7QWRa+UUafi4wdDC1lFaYayecWmSUfzVFIkNrGkYb6wipNNhmsTuSVIviakUbk=
X-Google-Smtp-Source: AGHT+IEroMWPt+4XJo5361FYvGbc+j2+mYG5KlQ5nZlJYDkXdfQ+/kZmCPJ7+2MWrqFWtBwtX4ddcA==
X-Received: by 2002:a05:6512:23a1:b0:542:223c:30f5 with SMTP id 2adb3069b0e04-542abfda953mr3237348e87.24.1737048596358;
        Thu, 16 Jan 2025 09:29:56 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm51125e87.76.2025.01.16.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:29:55 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Christoph Hellwig <hch@lst.de>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and ERRATA_THEAD_MAE
Date: Thu, 16 Jan 2025 20:29:35 +0300
Message-ID: <20250116172950.1989748-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_092959_515689_3D2175F9 
X-CRM114-Status: GOOD (  12.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Select DMA_DIRECT_REMAP for the RISC-V extensions that allow to set
page-based memory types in PTEs according to the requested DMA
attributes. This is the purpose of Svpbmt or XTheadMae extensions.
Zicbom or XTheadCmo serve a different purpose, providing instructions
to flush/invalidate cache blocks.

Fixes: 381cae169853 ("riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT")

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/Kconfig        | 2 +-
 arch/riscv/Kconfig.errata | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..a5dabb744009 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -603,6 +603,7 @@ config RISCV_ISA_SVPBMT
 	depends on 64BIT && MMU
 	depends on RISCV_ALTERNATIVE
 	default y
+	select DMA_DIRECT_REMAP
 	help
 	   Adds support to dynamically detect the presence of the Svpbmt
 	   ISA-extension (Supervisor-mode: page-based memory types) and
@@ -787,7 +788,6 @@ config RISCV_ISA_ZICBOM
 	depends on RISCV_ALTERNATIVE
 	default y
 	select RISCV_DMA_NONCOHERENT
-	select DMA_DIRECT_REMAP
 	help
 	   Adds support to dynamically detect the presence of the ZICBOM
 	   extension (Cache Block Management Operations) and enable its
diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 2acc7d876e1f..3bcae5bd3231 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -86,6 +86,7 @@ config ERRATA_THEAD_MAE
 	bool "Apply T-Head's memory attribute extension (XTheadMae) errata"
 	depends on ERRATA_THEAD && 64BIT && MMU
 	select RISCV_ALTERNATIVE_EARLY
+	select DMA_DIRECT_REMAP
 	default y
 	help
 	  This will apply the memory attribute extension errata to handle the
@@ -96,7 +97,6 @@ config ERRATA_THEAD_MAE
 config ERRATA_THEAD_CMO
 	bool "Apply T-Head cache management errata"
 	depends on ERRATA_THEAD && MMU
-	select DMA_DIRECT_REMAP
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
 	default y
-- 
2.48.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
