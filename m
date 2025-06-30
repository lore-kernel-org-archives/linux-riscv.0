Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E13C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 03:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJeQbFQqzOfCBgMRkCLnoI1Z+xOfhrG0/yiq1hRYB+A=; b=gr7e6k6SeQI71Q
	DsmdxDdnoEpYeN+66D4EBEmTKFgy8sV1gBtMEwmGBZzpT1MsbAGSgPqLXYL8oP2MnzWNPXt3QkdgR
	YpL+DfwupJ3BA7oJslLD9tR45zVztjwSXIF3A7t6tcNOXVu/31DbmA7xJHKro9aNL4X+qTc7rRP0D
	Z3PxMUBnhq1oE2ApZFhUItN10KDJx64dpg3EQ4aLHzsENQGgZKiC4SI8d6ZpjLMIxTXH20ppzb+fN
	I8bUV7qrNOIXbG5Np2jQWgfKvYsQAWk3AxmkmQvCpAzu4DSNAM7AUN34OtvMWcWkMvhd2bDBKQFAB
	vdZPRBdcs/rVEzjCF+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5Wu-000000019Kx-1LBM;
	Mon, 30 Jun 2025 03:50:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5VH-000000018zy-0eeB
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 03:48:25 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-747c2cc3419so3875972b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jun 2025 20:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751255302; x=1751860102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri1e7xvqfD1xJqzMHYa8cxstKVT8liDfwJUs4Nyy/QU=;
        b=a8DS3cpAw1gmrOz6STJhq38bblLWqPermNA3AKdaesOfueMijpUJb6TiEGkS5sHHLz
         4X+GC9qJ/DLvJaB1ANhPHWt2N5ha7jGbqB0R7/6DUEomDySftBJ1u2u58gpb4Imtxdzg
         jZrkcOnRon6Sw+ue926Yy8/f8NHX/I0smrH1Z+IzERQfHSclvpmeNvMB2I6wQEZQcwAN
         fzobHeHqjpGcJtDMydoWjc0L0H0OV3DnYD1JLqqFW5ULeV+zJvQnBi/iBU8LWelwehjd
         AV+d3OR61EgVbnkMUJnFS+HwYT11y9C1qvBME9p9bvfvt7HZufnDtQUkjSpNxKPyeCfb
         ufRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255302; x=1751860102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri1e7xvqfD1xJqzMHYa8cxstKVT8liDfwJUs4Nyy/QU=;
        b=i4cQrtGyEBD5nOpn+v3bvjojRsHs0u50lX3X3MywP866ddUfz43se1qda/bYK4ECQu
         R8s7XqWsAm2aBhuVwuj2jpsVOH6JImxmkYU22pw8kv4qc2VgBPt84SmBkWBEhLC2pSBq
         uzSOw0JKelBF0eyj/9hsUX91xdTEBXb0XL7ScHuAARUHu1rVZSw8g/p3uXsBxRfjjeNU
         7ZfsHLlT0SBygBMMgn8Y47IFaFBiU7DG2jU5ldPYPqG4jJC2yolpsaN3xMPSTDHHaB55
         yjDhxVl+NO+o/Lqgn7sSL3Lw05IXFJ48fyDRICwou4yexEGE6E0qXWKs8Sh/rCiqVUlI
         x7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Khvg+xvWGejLY+lfLRX0yYvrCVlps0k9ZpPzm5seQX/DZjRI5/kmyOlHGuiU18JhBG3ChYI8Al79GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8B+Fyi3BjXllYXisdrYCxB/xgvzy+D3QjTcBSJRe/acmj/TiP
	R/evbXgeZccYR83GplWwgHIEhrvM4AToLqCFX4EuXOgGdIhncrd2+vnCaFtXABPe/r4=
X-Gm-Gg: ASbGncvNFbKWlrUAryzYM3mjBpSvRzw9//gESFqv8eKmQNTxTcv+L+arN7yI2hoQu+C
	hs8kSPi+MUWxPZG4OLx3peb1B0vOhyTe2XQaTG+/z94sZf2OMQXuDiGR3L7tSCJspe4UAcdZ/od
	zimWV+jS5m/VtV+st0gXPfxt+A3tSQX8KZ0Zf4RC89EVo4UhRvaKzVyfuDG6TMhTASR2CIX6tlL
	8C3zScMIhbwZcaER6BjwInQzJlr9E41YhXwXKJOh9G3ImDN/XnvjyJQwfnANq7Zkyfou6WWDhur
	usHi8V+zYZUlkulSEHLlrcH2LRJwbPDdECRXQbMeR0oN4ZfdgtW+edbl21crRKFnQg6WV0nf
X-Google-Smtp-Source: AGHT+IG71WwVUzest/mJtvn+9x2w5xMiAsY0zQAJe8GnER+ZaxhJXmmKNzdMlkrBD48ocwYkdyfatg==
X-Received: by 2002:a05:6a00:1813:b0:746:2591:e531 with SMTP id d2e1a72fcca58-74af6f081c9mr17099430b3a.12.1751255302416;
        Sun, 29 Jun 2025 20:48:22 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efaecsm7837862b3a.161.2025.06.29.20.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:48:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v3 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Mon, 30 Jun 2025 09:18:02 +0530
Message-ID: <20250630034803.1611262-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_204823_192514_610E7B92 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/scan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..70f57d58fd61 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
-	if (err && err != -EPROBE_DEFER)
-		err = viot_iommu_configure(dev);
+	if (err && err != -EPROBE_DEFER) {
+		err = rimt_iommu_configure_id(dev, id_in);
+		if (err && err != -EPROBE_DEFER)
+			err = viot_iommu_configure(dev);
+	}
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
