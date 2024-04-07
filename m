Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48595CD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZB+8+wsnqjjeHtS9cWoWRo0ETxqaCt3vB6mP4U7DpRo=; b=cY8gqknyZ3f2oy
	nEKIBcOYtRzPhHkiVsuigml7BEg5iSj3666Fgf81mfCsavFU5I4V0vfyfEQYLzydCYY0LaK73e7AJ
	S6KzJTSuoxWa6meyNT3onw52oFvGcKNVcK3IjKSbn09KjK4J+1Bf9ZacBbASh3TuCGRCbxCy4JL5b
	RvdFTgGNN8+pChvX6ZGYaxe3PK4ju5D9UeEZKdY7HIzgo/F01fMdGFDZcwEE5e/DmXFMrYSoWXWSB
	9pVUi26FxRe2mut7OBkGmD9sk815vB0VwLGspt79Oe1Hu6LgSGbRo6sDKd2pAqbSZfGaRfKsRDFg7
	OQjR+MuBeWzwwvBB+row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRoN-0000000CY8E-2qpc;
	Sun, 07 Apr 2024 12:39:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRoK-0000000CY5l-3ppN
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 12:39:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e3e56c9d2cso7149905ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712493585; x=1713098385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6IuRa8hdLZMnRGRnTZb4QaetvYCU2DguTsJIRtmhQg=;
        b=fWXMoVg7mYF0mTSl/hZn69Yj3jTq+DbmnX8oP9SvugImtqbFMTTjl7wgG8+SW1dHDG
         UFC7z+TGl6xqOOBLOsMAfMBSYMVU6HJoyf6YXmOc3y9+k9VTikwyozFDC4P1BjdryHC+
         peZh5e3u/V15EiVh9QneP3PHCUdNUnPEERLs/8NyKGh0qtBF4hVlkwwPlgePfYNpxcAU
         sLRAMZzuX46qoVsptaMRjYtuxIyJzOvc+Dd+MKuOlbwG9Hy34/YdIZPmt2h31UOCFhhk
         5gIFxubsywLjlPrU8C+G6wksi1QiHEsxPqly5u+HbDNiS4gLXuVyJxis/uMv4GIbbjWj
         0hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712493585; x=1713098385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6IuRa8hdLZMnRGRnTZb4QaetvYCU2DguTsJIRtmhQg=;
        b=Mg9WCnZp9GiY7FzUBNd46tOXRovTVPp55cGppu/TsCPNVroOnt5f6vIjPX/qtyVV7u
         RFjzor2nQQSxKfYfpWxUcatJ6PfWrecqV7ZGz2hUlq310cx+9z0h6jCbSmR+EFyz0O2X
         ZI0DWyMs7N3xOBvxrFoUDib9ylvjhzXrCJz3zoqMW1fGCH4N/9FejK5IpamKVjgdIyyZ
         EXZjSpgoyorOMUOxFKZ6zYk8v6WnVzLe6R3FGTS2iVZc0LBOtGJxuZ4rw+egFanVgWUb
         Ou99uXWbotfc1vcv9KM4j4UPIn1SfPZo9p9jJrKGfRXFCaZaVy9CSuTF/voLDI8+mbY0
         4ImQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjFvC5oZ/4wH58aPUmVPey8cED7tS/R4F20gdWEf9FNjcHmsnMfcmA+8Ry5dH9pdnCIrKwAiCC30U8gYDe+N96p5NSxkWCO2vMw2T6e8Nj
X-Gm-Message-State: AOJu0YxUz64V/v3TnB3kSiK6arBgMk/JlzudtaPW7W5UnLoYVJdHIZOF
	ROk4bygl/rrgq9EZ7ennbKNnk7OP5eUc+y2cZ0yLKCF40xOA5LSbPvWoQVwCc40=
X-Google-Smtp-Source: AGHT+IES+scM9i8kf42aC/wFRIZyb6jz0P0Ddi4JaOD3Ny9vmXFhRZbHDQ5wSOLAP8Vf/nUtTo7nbA==
X-Received: by 2002:a17:902:6f08:b0:1e2:ac0e:b0c9 with SMTP id w8-20020a1709026f0800b001e2ac0eb0c9mr6349701plk.24.1712493584797;
        Sun, 07 Apr 2024 05:39:44 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902784700b001dd578121d4sm4933210pln.204.2024.04.07.05.39.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Apr 2024 05:39:44 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH 2/2] RISC-V: Select ACPI PPTT drivers
Date: Sun,  7 Apr 2024 20:38:29 +0800
Message-Id: <20240407123829.36474-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240407123829.36474-1-cuiyunhui@bytedance.com>
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_053948_983358_ED8E7CA4 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RSIC-V currently does not have a set of registers similar to ARM64
that describe cache-related attributes. In order to make RISC-V
cacheinfo normally supported by ACPI, through the optimization of
pptt.c, RISC-V can build cacheinfo through the ACPI PPTT table.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8f10a2fb5f86..cc516c12cb92 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
+	select ACPI_PPTT if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
