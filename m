Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9991EE668B4
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QPJeNboYmKqQxDsi1yTmupvhwG1o3rD6N2Pei4Rl1iM=; b=TD/Hh5zDHQhMe1
	HCu7zZaGBC2jgwAGiLJDP2Jsj9oIbaXnYzAq6Bn9nc+rTwzLG4tvnHbr9EXHHcvKJpGXhMOTeooWx
	1Z1rEQ8sHz+dchuGHscgNOiV35LKAiuCPSA/1VbCO5f//rIgMBFSkx3G5I9I74U8hR4ZinukAHhr6
	0SHhJAgAHE2q9WERSTH4/MQPvyA1VIgWy1P4g1dg9XcViY9X8vy34IDmem34KiztGrA1vzdE16Z/u
	aqkAFaP6KX+Nt+XxEzEBU1XWniojfNwb0akQq6fapcjT9V1v0i2TeNDjNp9NsVachpGZsPBi8oHqT
	JBmZqNzN9whEDSjgUsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzu3-0000000BkeJ-00B1;
	Sat, 20 Dec 2025 16:33:59 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWztz-0000000BkdJ-0ipT
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 16:33:57 +0000
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-05 (Coremail) with SMTP id zQCowACnPRHnz0ZpnwlTAQ--.53309S2;
	Sun, 21 Dec 2025 00:33:46 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
Date: Sun, 21 Dec 2025 00:33:38 +0800
Message-ID: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnPRHnz0ZpnwlTAQ--.53309S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try8AF4fCrW5JF15Ar4kXrb_yoW8uw4UpF
	45WF9Iqr9xtasIg3y7XFW7XF15Aa18Way8Wr4DG3sxuw45AryUGFy3Z3W3JrykXrn7Xry2
	qrn7G3yrur4FyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.166.92.103]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAUCDGlGuzwaKwAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_083355_565885_95B7F278 
X-CRM114-Status: GOOD (  10.71  )
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

Sophgo SG2042's MSI driver lacks 32-bit MSI support.
Added a msi64 parameter to skip the limitation and force 64-bit MSI.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/gpu/drm/radeon/radeon.h         | 1 +
 drivers/gpu/drm/radeon/radeon_drv.c     | 4 ++++
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 527b9d19d730..7207e3156c28 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -122,6 +122,7 @@ extern int radeon_uvd;
 extern int radeon_vce;
 extern int radeon_si_support;
 extern int radeon_cik_support;
+extern int radeon_msi64;
 
 /*
  * Copy from radeon_drv.h so we don't have to include both and have conflicting
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 87fd6255c114..53af28494c03 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -249,6 +249,10 @@ int radeon_cik_support = -1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled, -1 = default)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+int radeon_msi64;
+MODULE_PARM_DESC(msi64, "MSI64 support (1 = enabled, 0 = disabled)");
+module_param_named(msi64, radeon_msi64, int, 0444);
+
 static const struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 9961251b44ba..62eb5a6968ff 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -250,7 +250,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
 	 * of address for "64-bit" MSIs which breaks on some platforms, notably
 	 * IBM POWER servers, so we limit them
 	 */
-	if (rdev->family < CHIP_BONAIRE) {
+	if (rdev->family < CHIP_BONAIRE && !radeon_msi64) {
 		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
 		rdev->pdev->no_64bit_msi = 1;
 	}
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
