Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB88109190D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SzlLh19bttIkfkEI6ZSOGIBxLz5ZTOLZVN4fgqY99ss=; b=Kx7I503GnkayDd
	ILUf4RB6GSp9/FcItw51ilpyW5uRin5akDVxeu+FFP2LQp9uHKp6E+vq1w6YufhW0Rh9b9WRoKUXk
	lW16FlX9JMLdniIQ/nKxUFcWp5NC6tKJaGs6IAd09SDwWRCIO9l/JfB4MyGC/LZvpYHHYSSDmmvpA
	E6cbMIgmH8h9KD47OK3ywili3XxK3l1CRHfbN/sYzFA7nifCKEM3MjVRol1xp+A+IZpdJd/ry8T9z
	h1zVuTd3AHgimGPbUtKM6n+gJbFzlNVaXQ4/FtQzmlB3Tc4XbohIoWWZt1qdp3N3N2LMASkYecQPZ
	bw6GVDAYx2nh6KsBjNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I54-0000000BLGW-3MNx;
	Thu, 19 Mar 2026 18:26:50 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I52-0000000BLFh-0ut6
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 18:26:49 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-64ca6595c8aso1327766d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944807; x=1774549607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox9Bm2DTgdL2bUs58qghbxpirayQX0irvQhOZ6BdA4A=;
        b=KSO84kZpyEjG7Wcwdv06vDA2blY8Dr3+xEbuyYg4bw0tGJEgrRLlyBo09/P46mUUVY
         1lTtqWRnmd01pq2B3lqWozcNlgmQ8pthREIzf96QG4m89UtZGx2BIiwx8/iLyJa7g5Du
         T7sPeMdxxAoI3f5imt4hEx+LV25WIkx34FG7FoAlXNDZcKI54FHF+jrm9KXrYtQC8hro
         CP2JczcaPKdIHNQDVnY/XyFuXkFpwP/HB0B4mnlCqCgI3A7fMzRFw2AfTS0SgE9rUTRo
         KcIgoX/SKjZwdPpW8m2N+Dr6tC8dqG3P3Vw4gY8AxI431Q30DCI6iEYt0X0q4enNDBrP
         7srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944807; x=1774549607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ox9Bm2DTgdL2bUs58qghbxpirayQX0irvQhOZ6BdA4A=;
        b=WtAQexWujRuSs6tFiOTLM2/xRr+ExyPq2GF5dZlf1g9im6P3yQAWEfri18tRHkVxIp
         4vY44HYhMBHDQXPKv9DX78V5cu+1LxCiCb1ayfcpEN2jlK8gjC0HWShcqvqMURvPQqvB
         oBPU8liMr06vA/IxT6G5MyXB40Vc2z+dt3fDVe3iMMW5bty51vJ/li4a+mtLPDW0vcrO
         8nP6h1qFzHVH/ZBxF8ZUa0yo6Gf9J6Bhi04l6ZvjlhHW/LZnFEEe2zKEkVg2UxI7AVrr
         cavOJkJV420gUe5cmiWE8Fge0DRwP3uwEj5Uc4ajYRHuKcLn0Z7qoNVE6liXp6KQlunk
         bh6g==
X-Forwarded-Encrypted: i=1; AJvYcCWw4Cd4XXRiaxRFIHDv7hPJCp7+P+L2f6a69ZGJz8BRn0oFptvSK77AVdc/lmXC/TwL103BdXQAb+bxsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpvdY58K+vDpGXqpz4BNrbIhPLdBXwRQtVrUr+7rBx6HI563hx
	m/NoXzyihl3yLQTupgZIQmaADSXXpNrQqiv/i0yfKR3PsyCioAlVnTuc
X-Gm-Gg: ATEYQzxrPKJbyfdCcBSU/6+Q5YgIQ+Q0S7ANfwMXlVpfvFqnrF/B973mMjtM/hcV2Dd
	+X1xJGa1sFkqO+2mczyL4mATVZTYDubt6x6cafrxX+qUZmxFz37OO1HPZ+DWJ4CuBk3zwWikB6k
	+qTKSXT3kbSCSsUzW0H2PfAgOfv5vfLVPuJpPivygkkHNcum9PS1tKNhgfIkqTHY7GRGrcqEsS1
	Eba+I6mMDIikxfgKLuhlYnuQmKrlv+ABoo2D6SrgzNAcykDM17xAoWLzlf+aO7IKD3RaaO945Nq
	Sz/DT7sxJJ1MW74p+F4OQCxkfUydkpucX+QuVO4fdO5cfL398n5nlsjeYHScx7uzVuML7/JSzpy
	7AhpPm+vvXHg5m2la9eFzqW6H8SwcbALuKNUts2wtPp2o8mO6LDae/kZyLn0Gd9zunGhfkStMrZ
	/jUDbDFC+ERmRaY20QX77q7nY8WyY+FzVpLny1PW72oUCrgDGOr+Xp4uax3I9MzqNSNBAwCcPnp
	lWN3+xSsb6p+f8sHImwX72T
X-Received: by 2002:a05:690e:439a:b0:64c:bfd0:ad6f with SMTP id 956f58d0204a3-64eaa718e40mr465746d50.33.1773944806815;
        Thu, 19 Mar 2026 11:26:46 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a97003sm3904920d50.9.2026.03.19.11.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:26:46 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yaxing Guo <guoyaxing@bosc.ac.cn>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] iommu/riscv: Fix signedness bug
Date: Thu, 19 Mar 2026 13:26:44 -0500
Message-ID: <20260319182644.1082740-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_112648_260953_348CF8EE 
X-CRM114-Status: GOOD (  11.65  )
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

The function platform_irq_count() returns negative error codes and
iommu->irqs_count is an unsigned integer, so the check
(iommu->irqs_count <= 0) is always impossible.

Make the return value of platform_irq_count() be assigned to ret, check
for error, and then assign iommu->irqs_count to ret.

Detected by Smatch:
drivers/iommu/riscv/iommu-platform.c:119 riscv_iommu_platform_probe() warn:
'iommu->irqs_count' unsigned <= 0

Fixes: 7217cee35aadb ("iommu/riscv: Skip IRQ count check when using MSI interrupts")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/iommu/riscv/iommu-platform.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 8f15b06e8499..399ba8fe1b3e 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -115,10 +115,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 		fallthrough;
 
 	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
-		iommu->irqs_count = platform_irq_count(pdev);
-		if (iommu->irqs_count <= 0)
+		ret = platform_irq_count(pdev);
+		if (ret <= 0)
 			return dev_err_probe(dev, -ENODEV,
 					     "no IRQ resources provided\n");
+
+		iommu->irqs_count = ret;
+
 		if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
 			iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
