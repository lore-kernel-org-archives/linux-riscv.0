Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16F5CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nj4jWCAI7EoiwIo5Cjt1mlGdow+aIp2jsOHfdE3lrPY=; b=1goMu6fxYXe6rk
	dD81N+YDA23eXKh6zZqZqEYH+yWq2C6tmG7d66so07/zuGpGNG16dhwUJ+Hxb7v+uK+Y4RE4Wrh5A
	szj+uvXLTk3s9zt5E3IJz78Zy5puY1cmIe8tPmO7gJZwBA0dPNfEP/APQsZhOrS5Yshfrc3POOSUl
	fMsI1xCu1hilb3XXAVkfGpMfJVpE24o+htyMU0Wp1olNqpNK8lXMUvC1w064qAmpBC8kDISSW6+AZ
	UGlzRAFa9Ovc4eHNmULbmQH1m22VtDO4OXKcAGqJLFCuYSSIkw//A1Nrc311nTXbqr/0uLfWd9MMv
	45C9uxb0QJueH+nv0ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFcB-000000008uM-13Q3;
	Thu, 18 Sep 2025 14:28:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFc7-000000008tG-3t8J
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:28:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7761bca481dso949429b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 07:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758205679; x=1758810479; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRxrR61lHi8YfDjlJ2Swbohv7CSI8Q1KLjlvrovFA64=;
        b=yBkkoY/UUegYPRVJRyt16kg+/qX9nBOrqwgoYpckTdK8f5h0o1PkES/sfiI2ShWX+T
         jkDd33gfDKok6sg5tLOYsHsFY6mvQpQXfswpesod1ORWOHEMU5CX0psJcqTUAuILQAi4
         8peTSZpapytg7X2CMshIjfMjg9AhImBIVWjh0OzmHBIwJ44Fqc7QSw2tkJ2NTxuHG06B
         pPqIB2/w5Q2s0jbEb7zXGDf3wyQdWKyd4vqepdGtsbHBHwlbPlcWvcxOrTtx4odt2wcv
         OlpNd7mOqaYvY9k9/DQ59y/PuBnQFt8Wbsv6ZO8tNSWuffHILlEyKpjqNLXj+BaZaamt
         69LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205679; x=1758810479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRxrR61lHi8YfDjlJ2Swbohv7CSI8Q1KLjlvrovFA64=;
        b=WBGvb2fYHefIvWS0YaX99uYWLEGUI6qjeMzBkTgDQ17MAO+ytpt4TFz3bRCalTP7y1
         +svAngXijIlE7zmCIwkTsFKJZWJST20mjeL0qbKR32MjcpaSczOd65VzuWDr6owFxl4Z
         UC52telQNvw2+VBkSNpywvO4YRkdFol8o3G/SN5KETWlI51piXlPrsrVOwoXxld2WxUw
         SQXRagK7+mBd+0fKCdxbXVxANrbdoolAY/x1qqNnzIaaI9PQSr1Xd372TugELr4WICYc
         p2UsaC51/sP4XBm4k9qZCuNA1s6rN68hjNva/tFLlDqZrcJ1I3qM1vRSirz9l2enqc2W
         9AGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqcMSIBOsEzhL/wQ302PoN5SAzzFMConNdFo4+nlYcFxq0OIjSiytY/4QvRCEoU5Nk9BlquDqHVlstmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVV3vg/MfIQxt3FVvTFmyZe68G+5GGr9AXfspksOT8GJcJcVPa
	CM1MHR9TaZnRMrIQJTkyEVi1ADanxXOrXBFcW/6msgkCftR2K/P8AaUHEvpkS323qvK08LK5zkp
	vGasKLKlA/A==
X-Gm-Gg: ASbGncvrMC9JXUR5AFpYCcm/C0XP9r2A1s0NE296WTckD8ojgvzTxzVuB5CrZljP+xJ
	WFDskV9vUJSzTtCbf518vfV+hrzkAtOxaxQZbaz+EoQSPJq7CIlAXEl9qV8TqB+G39OFPKFAo/V
	RS9Oe3QYWZ38Tp8Y39OS0XW0RMJrgfhYJveTRiv1fm3cljmRNQcOckkVDSMNy3EuJVqBpWDuisn
	aRxrME+rgpIq0qNzer35dXDwGTm+bqAoVSHXgwb/QFsdcy364rWz5o1nxABEDOxvP0IaMAcbkYS
	Sn5MP3Ncw9m5/x21dlFZHZLC5UIGiBUG2+sojMbD3kuBhEFrepRRzlIwNZo6K6TubxcZZde4y9f
	2EjcBL6zx5rsFOWUkAVO5RQOngzqZ3APS/Of4UeCZ0w+Ih2yPkgcuEqSJR0t/56j8xsJxYmYw
X-Google-Smtp-Source: AGHT+IGX3ygannk3UQBorLwV5GVyyCXVYSV22MwTihX9JUHF1ySlKjIfi3SugfECASUEvkieA77bUg==
X-Received: by 2002:a05:6a20:7347:b0:262:23dd:2e93 with SMTP id adf61e73a8af0-27a798c703bmr9010621637.0.1758205678719;
        Thu, 18 Sep 2025 07:27:58 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff447060sm2460614a12.53.2025.09.18.07.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:27:58 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 18 Sep 2025 22:27:27 +0800
Subject: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
MIME-Version: 1.0
Message-Id: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAM4WzGgC/yXNyw7CIBCF4VdpZi0JCqWXVzFdwDDUSaStUI2m6
 buLdvmdxfk3yJSYMvTVBolenHmeCs6nCvBmp5EE+2K4yEstO6lFjItYfLQic1zuHD7iB+t9opx
 5GkUwloJUJBtUUG6WRIHf/8R1OJzo8Syl9RjB2UwC5xh57StE6SxaNJ6axigrVVvXEoNW6Dptl
 Patow49DPv+BbKbtO++AAAA
X-Change-ID: 20250904-mmp-pdma-simplify-dma-addressing-f6aef03e07c3
To: Vinod Koul <vkoul@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, elder@riscstar.com, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_072759_978570_289BA1F0 
X-CRM114-Status: GOOD (  22.77  )
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

The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
of declaring the hardware's fixed addressing capability. A cleaner and
more correct approach is to define the mask directly based on the hardware
limitations.

The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
all of which are 32-bit systems.

This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
field with a simpler 'u32 dma_width' to store the addressing capability
in bits. The complex if/else block in probe() is then replaced with a
single, clear call to dma_set_mask_and_coherent(). This sets a fixed
32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
"spacemit,k1-pdma," matching each device's hardware capabilities.

Finally, this change also works around a specific build error encountered
with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
ternary operator is not correctly evaluated in static initializers. By
moving the macro's evaluation into the probe() function, the driver avoids
this compiler bug.

Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Hi Vinod, Arnd, and all,

This patch fixes a build failure in the mmp_pdma driver when using
clang-20, as reported by Naresh Kamboju [1]. The error,
a -Wshift-count-overflow warning, is caused by a known issue in the clang
compiler. When the DMA_BIT_MASK(64) macro is used in a static initializer,
it triggers a long-standing bug in how clang evaluates compile-time
constants [2, 3]. Thanks to Nathan Chancellor for providing these links.

While investigating this, Arnd Bergmann pointed out that the driver's
logic for setting the DMA mask was unnecessarily complex. This logic,
which was inherited from the original Marvel PDMA driver when adding
support for SpacemiT K1 DMA, could be simplified. A better solution is to
set each device's DMA mask directly based on its hardware capability.

This patch implements Arnd's suggestion. It refactors the driver to store
the controller's DMA width (either 32 or 64 bits) and generates the mask
at runtime within the probe() function.

This approach also avoids the clang false error reporting.

This patch is based on dmaengine.git next [4].

Thanks,
Guodong Xu

[1] https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com/
[2] https://github.com/ClangBuiltLinux/linux/issues/92
[3] https://github.com/llvm/llvm-project/issues/38137
[4] https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
---
 drivers/dma/mmp_pdma.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index d07229a748868b8115892c63c54c16130d88e326..86661eb3cde1ff6d6d8f02b6f0d4142878b5a890 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -152,8 +152,8 @@ struct mmp_pdma_phy {
  *
  * Controller Configuration:
  * @run_bits:   Control bits in DCSR register for channel start/stop
- * @dma_mask:   DMA addressing capability of controller. 0 to use OF/platform
- *              settings, or explicit mask like DMA_BIT_MASK(32/64)
+ * @dma_width:  DMA addressing width in bits (32 or 64). Determines the
+ *              DMA mask capability of the controller hardware.
  */
 struct mmp_pdma_ops {
 	/* Hardware Register Operations */
@@ -173,7 +173,7 @@ struct mmp_pdma_ops {
 
 	/* Controller Configuration */
 	u32 run_bits;
-	u64 dma_mask;
+	u32 dma_width;
 };
 
 struct mmp_pdma_device {
@@ -1172,7 +1172,7 @@ static const struct mmp_pdma_ops marvell_pdma_v1_ops = {
 	.get_desc_src_addr = get_desc_src_addr_32,
 	.get_desc_dst_addr = get_desc_dst_addr_32,
 	.run_bits = (DCSR_RUN),
-	.dma_mask = 0,			/* let OF/platform set DMA mask */
+	.dma_width = 32,
 };
 
 static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
@@ -1185,7 +1185,7 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
 	.get_desc_src_addr = get_desc_src_addr_64,
 	.get_desc_dst_addr = get_desc_dst_addr_64,
 	.run_bits = (DCSR_RUN | DCSR_LPAEEN),
-	.dma_mask = DMA_BIT_MASK(64),	/* force 64-bit DMA addr capability */
+	.dma_width = 64,
 };
 
 static const struct of_device_id mmp_pdma_dt_ids[] = {
@@ -1314,13 +1314,9 @@ static int mmp_pdma_probe(struct platform_device *op)
 	pdev->device.directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
 	pdev->device.residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
 
-	/* Set DMA mask based on ops->dma_mask, or OF/platform */
-	if (pdev->ops->dma_mask)
-		dma_set_mask(pdev->dev, pdev->ops->dma_mask);
-	else if (pdev->dev->coherent_dma_mask)
-		dma_set_mask(pdev->dev, pdev->dev->coherent_dma_mask);
-	else
-		dma_set_mask(pdev->dev, DMA_BIT_MASK(64));
+	/* Set DMA mask based on controller hardware capabilities */
+	dma_set_mask_and_coherent(pdev->dev,
+				  DMA_BIT_MASK(pdev->ops->dma_width));
 
 	ret = dma_async_device_register(&pdev->device);
 	if (ret) {

---
base-commit: cc0bacac6de7763a038550cf43cb94634d8be9cd
change-id: 20250904-mmp-pdma-simplify-dma-addressing-f6aef03e07c3

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
