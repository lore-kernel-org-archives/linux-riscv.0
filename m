Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FB0D262B7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 03:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsmOBXfnXEVNEi+Z590zAHcqE9p4zDbBifLL2BzdNls=; b=E/084m7mm5KOv4
	YtRPo3KHiWdO8z1xULx3uaCOg53GCoW5tzymUBrKEjn1QL2Ubqk4P+DEdwhQU0ftk8qJSE8Ugd8KA
	mQ3DN6DplPp33lIJmzXrIz3B9oYzVum3gDpkgXwfb44TASNOmb9qvjdCLH1hUccUiohvnv2+aMVkl
	o0io4pMfLxs2hnzT0cdc6wMtvQGMHQcNc17gN94n96AyAFRGHQZWm63YMQtiZdt8J8yoDk2ykDlsj
	SQVHfL3+kQjs9IhWxnmb79A8Pjt+5+4eoKGJVZvdj9nvvCzD707wJw1osVI9DA5GYnwnfb2OSiJXT
	x3MoBDrP1kM03rHDMKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPEU-00000004qkK-0l9h;
	Wed, 21 Jan 2026 03:50:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPEP-00000004qiS-0UYC
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 03:50:11 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowADXfWnhTHBp_WqTBQ--.5409S5;
	Wed, 21 Jan 2026 11:49:55 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 21 Jan 2026 11:49:39 +0800
Subject: [PATCH v2 3/4] drm/radeon: Raise msi_addr_mask to dma_bits
MIME-Version: 1.0
Message-Id: <20260121-pci-msi-addr-mask-v2-3-f42593168989@iscas.ac.cn>
References: <20260121-pci-msi-addr-mask-v2-0-f42593168989@iscas.ac.cn>
In-Reply-To: <20260121-pci-msi-addr-mask-v2-0-f42593168989@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "Creeley, Brett" <bcreeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev
X-Mailer: b4 0.14.3
X-CM-TRANSID: qwCowADXfWnhTHBp_WqTBQ--.5409S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4kGw1rtw45Xr4DJr18Krg_yoW8ur48pF
	43GFZxtrZIkw1UKay2kay7ZF15Aa18KayrWr4DG39I9a45AryUur9xZw17J34kXr1kXr4j
	qry8G3y5uF1FvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_195009_558986_95C2A03C 
X-CRM114-Status: GOOD (  10.83  )
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

The code was originally written using no_64bit_msi, which restricts the
device to 32-bit MSI addresses.

Since msi_addr_mask is introduced, use DMA_BIT_MASK(dma_bits) instead of
DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
precisely and allowing these devices to work on platforms with MSI
doorbell address above 32-bit space, as long as it is within the
hardware's addressable space.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

---
v2: Set msi_addr_mask to same as DMA addr mask (Christian), and minor
rewording
---
 drivers/gpu/drm/radeon/radeon_device.c  |  1 +
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 10 ----------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 60afaa8e56b4..5faae0361361 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1374,6 +1374,7 @@ int radeon_device_init(struct radeon_device *rdev,
 		pr_warn("radeon: No suitable DMA available\n");
 		return r;
 	}
+	rdev->pdev->msi_addr_mask = DMA_BIT_MASK(dma_bits);
 	rdev->need_swiotlb = drm_need_swiotlb(dma_bits);
 
 	/* Registers mapping */
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index d550554a6f3f..839d619e5602 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -245,16 +245,6 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
 	if (rdev->flags & RADEON_IS_AGP)
 		return false;
 
-	/*
-	 * Older chips have a HW limitation, they can only generate 40 bits
-	 * of address for "64-bit" MSIs which breaks on some platforms, notably
-	 * IBM POWER servers, so we limit them
-	 */
-	if (rdev->family < CHIP_BONAIRE) {
-		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
-		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
-	}
-
 	/* force MSI on */
 	if (radeon_msi == 1)
 		return true;

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
