Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B7DCAC5B2
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4qlbfTB1K158Ecwu+J9w4pnbEdm2SzF0lkaSNcqizE=; b=G34j1EaeYQqUy1
	j3B98e7Wgsfov9V1jqXTvQBIoQaPSuzGIz5Hn5dKzMTHENhRcNdh/Hg4TS/zURi3xEr2Z9CsIf0j5
	wCSxsY0gxXggEyAdQNPma2tOErY+7GrleroCipHy2iaRKQBDydbJwFhhnqd0jd1GJfhgt3+esyAnK
	iXN0gu2Sl+r1jjibIUR1+cPxOVqjdKQ3RbP0jwjl6Lsx9QRoJJD3+ml1TAMEgfnACbEhFGZ8ROIAG
	43OifQ2ruz/c8eA9zDng6clZg0Zv9k3e73F8BQr8V/ry0tYvitz8lkXUU4cLvx9V2N+Q2dgak7+ys
	GnCwwZqnNdrc8FadMqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MP-00000005tXG-1gPk;
	Sat, 20 Sep 2025 20:39:10 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04ML-00000005tQF-1lIk
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:06 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-887745ee814so105352639f.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400744; x=1759005544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyclL1XhlEcYsrqgE10jIhLpC+mtwJUT0A78Decqu/E=;
        b=DYJvsgG7ULNIrNbWQrKSI3BMU5hl67ep30JQ6jBhstCnDZHYaO9/Y8+4f1wldSdbJT
         z/unSz8oSkVkHwOvkXNdtJ9h4VtVQTT3UNAkpPuGTC0yCGyk1yXgGkPMvepGIyO3etXF
         zTNL6XaUfXh/x5a6t7W16nYUu/JHpeuGKYKaw9OC73Ztl+1qbNjkWHfiPDjkfed9KLVV
         AuaQuM4oQkiKoTXtvtoNHrmOfM9QIYrcF+JUlxgRTpcyDASDHwTGEeKJQ0B0MDw7Irth
         IRC2Oi7MLlVFgXO/2aneIX61MIOVIBJZulmIPb4tdvW3E2bFUo0ivI3GQ+400qojaDNF
         OU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400744; x=1759005544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyclL1XhlEcYsrqgE10jIhLpC+mtwJUT0A78Decqu/E=;
        b=kvxAMyZzNIOk+liV1Tvgv2GAdy8rus0923ilD7dJKbWuoBVokiKb9EkPLuW2pNxP8n
         QZMAbE2SiBGMXo8gpjAluUn4kES+1dz0uC7xby/7bi55pM0vH4veB0iyJwP3YwrJVlaC
         OfjQw7LrHgm5vwSkhBAaaYg4gOgnEfR8Dx+Xca3oL3qRjxx+ru8oxfYvGoXiXQrJxc/h
         K9xeHpdeaqMW1AaGVY4TMpmLJHmHhCHHAj/4JvT4xXMMOuaEEG8ONR29VcfsQhA5A+cf
         /2Y9OZnpEv/rw2cj5DaEnF/fnx8FpNTVZp2SjVDrvv6qgRJ1BqpnNho3ePrU7s48VMAD
         nbmw==
X-Forwarded-Encrypted: i=1; AJvYcCXSgIn0Jfx4gJGTkTb/wQwUFzRRZFbgDRGJOueHYdt2o4ktd0MgG/qVNDS1meYHE4CD0GBnBxigvN+3dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3R/a+/whYRXWtrva3Maq5ibQZdxSlgJOUz5WVunepi0VhqlJB
	BsfJs1c9cN0AAnD0YkusfucUZ9xjOezitSytvpHnOvdj8BMrso25iXL+HF0oNsE8o8U=
X-Gm-Gg: ASbGnctWWK4ptuqvHlwLA4+8GznVUpMVokZQFw0xeKe9zfZOEX2YyhNPr5Y/JyNBwEw
	BgyTLOfOYhHKlygmWQ/xY0mWzLq3Sa0EpQBdU4gkTQDtcS+0RovX6No4n9wybLIBVTseXizyyrL
	4QsksyN0yBQdgdySGUuJM2ZVSv2zGLHwtaESCHqASnQwbGcITqCVhyYGNUWgNaF09A3pfh3gY14
	QxL+F9cZKv2VtZ3fRruxlDPMT4ajeiaQJh0+gybi2KyQpCZh2yMGVkAo5dL0iiObAxB7D014Lwk
	GTBh2dseydBOJU2zsxYqg1JQ2EsSmHtDOi0mBK7L/yZxQCDo2oOOhI4jIh0gDCBBQWN1C7NhndI
	U//oQcSTF7vCwG2D6KyR7uyQV
X-Google-Smtp-Source: AGHT+IG40gGHsXsi5eSQylQi3Zsm0ULLvlAN1CN/2lldqNCL8Ji0Ye7gijLwVVX5LjTNRaDqmRWawQ==
X-Received: by 2002:a05:6602:6d04:b0:887:788c:d345 with SMTP id ca18e2360f4ac-8addc8a1170mr1309874539f.12.1758400744491;
        Sat, 20 Sep 2025 13:39:04 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3405sm304724039f.1.2025.09.20.13.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:04 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 09/18] iommu/dma: enable IOMMU_DMA for RISC-V
Date: Sat, 20 Sep 2025 15:38:59 -0500
Message-ID: <20250920203851.2205115-29-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133905_517592_A479FC10 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

With iommu/riscv driver available we can enable IOMMU_DMA support
for RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 70d29b14d851..9d8c90690275 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -150,7 +150,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || RISCV
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
