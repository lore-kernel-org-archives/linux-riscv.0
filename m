Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6054C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 06:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NRtEHWLL4EGC4BRVAwrlAuo6+3jVTfVY5iDnngWFQc=; b=2KMKdqrIafEocq
	vt7m9qEjjWaQOmGXwwYANEA2Jby2uI09piubto/qb10xc73UH5v6QD48y5sUETjloa4dKYYKpl+1E
	aDZRV3PJMzaWROvIuSlB75bPizirEc0iPRkkZKG+Lr6DYNoTG2yUOcO45rRxvLrFy4wt4jwVg/4sz
	YhPeTgwePpZT1AeCMbDl9VmmvRtgw1Y7SPllU9kHcxTLTofeB5L33oi4MsBSuALcbPXdgmC57UuSZ
	fYhASGsfWFY/sf/hjR4Omr0sExpDowfIYc20P2LR/uJWu+C9n9JWmoiyPcV7HGWSjLRg06gs0SIDT
	iGZcUAnPtczgRRadLDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLub-001nJr-2Y;
	Thu, 18 Jan 2024 06:30:01 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuY-001nI1-0I
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 06:29:59 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7beddc139c4so322462639f.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 22:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705559397; x=1706164197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtA1yi7bJhENd0OSwZZPO3/DRQ+e8frz78vUteV9MTU=;
        b=AqRA2Cdn2RW7fOEYqYwV4Bcrh1SKWKxiTg+fz9vzoaZjXIef4Y663QD9Z0TCLoKqTx
         4IHkQ7k7FlZm9V6SN8g2E694EAf/LE6mmu22tE4+oXdy/hUKxkKYVcFAQLESXMg/04Bq
         5N8gMU0e9bVgafAgKYYmtod4miaFzi69Oj0BVNxcOyEQOSdxDFHF+tUAjosEvw08oz68
         iuNpGXZhV8abCmBUO8zJ+1nR03Csr6RF2qD7EPXsp2zaJYSD0U+FIF+2V6LQ3UUl40e7
         WXCu5UWREej7Rmy0c8KjczDFwrRcOrJeZ3qcgfpOnMyiFjG3ZlvK13ooG7If+eXB1CAF
         8LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705559397; x=1706164197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtA1yi7bJhENd0OSwZZPO3/DRQ+e8frz78vUteV9MTU=;
        b=fYZrjSZztJQtPz/9fv/HrYs7AR80wox5nBdCa6PcpK3spV8wS5K//5tGwSVVea4usA
         5Xdw0ZL4yzq7KrlusyCFpYduoSKg7kwCLF7Q/u38y3VdaRb5sR8hO4kYsKklDRCZ/Gx9
         JaDfzEnVjmayK2Ywth3MIJ+8zbAM5K1i54H02UNEFwbv9IrGQ2xjiov/nNoGQkWFKCyE
         43MXLon7tBLkeyhr8Xe56/jCodJlezAgHaKFVX5knGgItO75Y5grJ5HomZkm59A6QUtP
         gr1PSrGw40cQ1eBXWRG1gEReoayfKGdc5jhMZf/UjPirMDF/ikDLgimMTal7i5CU80dL
         qabg==
X-Gm-Message-State: AOJu0YyqnqFhsVCxp67YTvHagNFSEOmJDrDTJ6rA7B0SwPepligp/mip
	0iXyHoQycpIhkLTXTB0sY8oe4yrqaY8cHIHpwOlqEKkkdZuHiLq8D6JxdaYRHLA=
X-Google-Smtp-Source: AGHT+IG5FtqixEBaNJDSNquSyctMTnCf+hskKjTKsUAyOqYtmHJhBUoYOvToNqCtx5vuaVjQy/gmAg==
X-Received: by 2002:a92:4a01:0:b0:361:993b:7f3 with SMTP id m1-20020a924a01000000b00361993b07f3mr523402ilf.11.1705559397011;
        Wed, 17 Jan 2024 22:29:57 -0800 (PST)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id bn28-20020a056e02339c00b0035fec699584sm4663269ilb.13.2024.01.17.22.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:29:56 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 3/3] ACPI: Enable ACPI_PROCESSOR for RISC-V
Date: Thu, 18 Jan 2024 11:59:30 +0530
Message-Id: <20240118062930.245937-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240118062930.245937-1-sunilvl@ventanamicro.com>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_222958_127556_A5A8636E 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ACPI processor driver is not currently enabled for RISC-V.
This is required to enable CPU related functionalities like
LPI and CPPC. Hence, enable ACPI_PROCESSOR for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index f819e760ff19..9a920752171c 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -282,7 +282,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || ARM64 || LOONGARCH
+	depends on X86 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || LOONGARCH
 	select THERMAL
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
