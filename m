Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A47D16271
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qr3U5JSrGZod6TA7X6IUE6U087Zt+0fpFhxo/txsMdg=; b=hF4Y2qBogblF5k
	y9D453M6PVv2s9D4LrHWrO8YLDaq7PpLsdTbfy4O979t+xpDg4B0nYXP6ILZCTj6pz4vt781+geef
	VQDzrd3JBGMg/i0EKcYMa26rea6EKE+ZqEv/IKW7vEB0yE4c5JzOiaaJFKGNIBBELpdz9m33GtrVR
	IwhUv3hbp4Vq+GjrD0ABTr1NBVqDE8GqxxDB+DyzwqZsjck6kKqk1N/EZ2pryo4r599+xe7y2vfiQ
	QXe6Ur50uWi+trSFwyNFvU0etr7TvBy5BM+z+bmrARUMRSB5y8PTAoA4pOO98ATKcwCmgu7wJO9LE
	ya8h1jSkx4Cac8Mopfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LYt-00000005NZU-2eyo;
	Mon, 14 Oct 2024 13:56:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Ki6-00000005B74-12ti
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 13:02:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso974072b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1728910924; x=1729515724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQPjmbJ17ANnSKX5ASFQGSNPYugZogn5Gs1gjayADw8=;
        b=S4snci3P1DM1QcCveDexpTFcj2Gj5mgHyeJ2e4ScC9ddAF6/a74pI2PZP7psxCkF8f
         A/1g0kO1C0E332IAQ/mjA8Yry2BXijHOsS4KRUUQX6lDOSmSeSFcM/iYnBYzUa3ScEEU
         vvkjmR9Kr2UeDtFCMPztrZBfn8Jrma9KPPwHSJ52LEo0hBbHw+Ec76tocC13uVSlpLjC
         Ix9hDbkUzshVJ3U9asrbXbj9vt7xPAkPV+LcYJDvbtz6lquk6ikH6YEJVyKO2p6ZD5YU
         GRBYpWcgaUcf93ddhzTdGN/Evf4SM0SwUTxr1UEo/fq7Qi4635E32cW0jL8Ouky5ad7x
         v8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910924; x=1729515724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQPjmbJ17ANnSKX5ASFQGSNPYugZogn5Gs1gjayADw8=;
        b=vRlB7K8rSrirphzS0O5595ZISzmK1mnqe8BTKomyVWCW/hY8lgkzHNoRkVdaqM6ANX
         j5I5W84xzrU6PyPjfk4oL1NObNACyRb0r+Fj3qm87VP5+tEukpavuPOIgfU2CqB53wGH
         dyv0ztJE6M7/Li6c/6kNiLr8T6O33iYaYAdj6tCaRVHgy5Kn3atufYyerHJtBC3anj2Q
         +aEyoyygle/5N2xTg7fvoJn1ALpte9S0myrCr8dt7zVz70wNKqoYQmJYc8ZlxwVDY/N2
         BSsw/Vual9eftokE50jFni0LnuKmJOejl0dFaXGoWoebTI5qFo9lm2PXVpSfLQpVOaNv
         eCsg==
X-Forwarded-Encrypted: i=1; AJvYcCV6axHKBOwRfFQAG/qjyr31kSrm0gdK0Kw9KZhAjanT4pa/Ys5kgIzOIvZ3fqg8jEMXI9TIpZZU5AMh7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+a8rJU5bxn2NS7tn7gy+exjUyrM8EXVDjP0CytZZgTEyWVkVO
	sR5B8RPEU9w6Jkbcu5byTBm5V1qzN66xPvNvAghvJThXyr4WWGf6b3xJXcBN9h4=
X-Google-Smtp-Source: AGHT+IGY5bRY5owp5A8Ewm3iO1HNvwFWn/zOThsKSvrZ02vXYnTQ18yH7cFudlJzT7bigyD/CcmQjw==
X-Received: by 2002:a05:6a00:198a:b0:71e:21c:bf1b with SMTP id d2e1a72fcca58-71e4c17c0aemr13615152b3a.14.1728910923860;
        Mon, 14 Oct 2024 06:02:03 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e664fb7b9sm2031959b3a.84.2024.10.14.06.01.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Oct 2024 06:02:03 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sunilvl@ventanamicro.com,
	alexghiti@rivosinc.com,
	conor.dooley@microchip.com,
	rafael.j.wysocki@intel.com,
	haibo1.xu@intel.com,
	cuiyunhui@bytedance.com,
	jeeheng.sia@starfivetech.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: ACPI: fix early_ioremap to early_memremap
Date: Mon, 14 Oct 2024 21:01:41 +0800
Message-Id: <20241014130141.86426-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_060206_675267_D49D2047 
X-CRM114-Status: UNSURE (   9.28  )
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

When SVPBMT is enabled, __acpi_map_table() will directly access the
data in DDR through the IO attribute, rather than through hardware
cache consistency, resulting in incorrect data in the obtained ACPI
table.

The log: ACPI: [ACPI:0x18] Invalid zero length.

We do not assume whether the bootloader flushes or not. We should
access in a cacheable way instead of maintaining cache consistency
by software.

Fixes: 3b426d4b5b14 ("RISC-V: ACPI : Fix for usage of pointers in different address space")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 6e0d333f57e5..2fd29695a788 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -210,7 +210,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
 	if (!size)
 		return NULL;
 
-	return early_ioremap(phys, size);
+	return early_memremap(phys, size);
 }
 
 void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
@@ -218,7 +218,7 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	if (!map || !size)
 		return;
 
-	early_iounmap(map, size);
+	early_memunmap(map, size);
 }
 
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
