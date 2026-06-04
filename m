Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F8ECD6E6B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 06:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yw0ZJdMQynOVFUeFiZGW9wmAO8pTfi5KDo3bduizo+M=; b=OQelU+DDXIqnrL
	LqcG4QbBar/TQDquP9XnSnnN8h0ImTXy/vWADQALSbsb8jP26JrPqVZSzNWlgs4zhrNJWK+QJYqXE
	yYJyzyyDPzPe4wvECDqDXXVZy33RGM+3BmuP1Awehg1FVJDIb35ga+ugKNNKgVS+ivJXQdw0hXZpK
	oaizAv8gj/bfdShEQNafKthEzxnaQmj1u8d2DtoWzcfCjQRVPY/4kjCtkmiQve6mpv+VU8Dd9krWn
	zKY6qGA585F4BufHDOuyKtgEyyy2LI/TGK3lbFLntwiSU43yIZ3/rcn4kvYDhs/YXFB1W6XcM8g9C
	RwnRMwhWAxJkphbA7ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1zA-0000000GFvl-3MlD;
	Thu, 04 Jun 2026 06:55:24 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1z6-0000000GFv0-3sb4
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 06:55:23 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gWFgn4Mv7z5B13c;
	Thu, 04 Jun 2026 14:55:17 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 6546t9Gn017570;
	Thu, 4 Jun 2026 14:55:09 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Thu, 4 Jun 2026 14:55:10 +0800 (CST)
X-Zmail-TransId: 2b066a21214ec27-b4cdb
X-Mailer: Zmail v1.0
Message-ID: <20260604145510898G2kTwM2Pr25QE5H8T4Wh6@zte.com.cn>
Date: Thu, 4 Jun 2026 14:55:10 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
Subject: =?UTF-8?B?W1BBVENIXSBpb21tdS9yaXNjdjogQWRkIGRlcGVuZGVuY3kgYmV0d2VlbiBpb21tdSBhbmQgZGV2aWNlcw==?=
X-MAIL: mse-fl2.zte.com.cn 6546t9Gn017570
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 04 Jun 2026 14:55:17 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A212155.001/4gWFgn4Mv7z5B13c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_235521_332214_95F9555E 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: aou@eecs.berkeley.edu, tomasz.jeznach@linux.dev, alex@ghiti.fr, rafael@kernel.org, palmer@dabbelt.com, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Wang Yechao <wang.yechao255@zte.com.cn>

Commit 9156585280f1 ("ACPI: RIMT: Add dependency between iommu and
devices") adds the dependency between iommu and devices on ACPI
systems. On devicetree systems, the incorrect removal order also
occurs.

It can be reproduced on the QEMU RISC-V machine if the kernel enables
IOMMU_DMA:

[  635.081530] e1000e: EEE TX LPI TIMER: 00000000
[  656.100306] rcu: INFO: rcu_sched self-detected stall on CPU
[  656.101374] rcu:     5-....: (5250 ticks this GP) idle=d774/1/0x4000000000000000 softirq=5173/5185 fqs=2625
[  656.102237] rcu:     (t=5251 jiffies g=36825 q=101 ncpus=16)
[  656.103801] CPU: 5 UID: 0 PID: 1958 Comm: reboot Tainted: G        W           7.1.0-rc5 #31 PREEMPTLAZY
[  656.104127] Tainted: [W]=WARN
[  656.104182] Hardware name: QEMU QEMU Virtual Machine, BIOS 2.7 02/02/2022
[  656.104339] epc : riscv_iommu_cmd_sync.constprop.0+0xb8/0x148
[  656.105352]  ra : riscv_iommu_cmd_sync.constprop.0+0xa8/0x148
[  656.105433] epc : ffffffff807ca980 ra : ffffffff807ca970 sp : ff60000085dbf960
[  656.105475]  gp : ffffffff81e0d798 tp : ff60000084b58e00 t0 : ffffffff80021048
[  656.105514]  t1 : ff60000081b18400 t2 : 45203a6530303031 s0 : ff60000085dbf9c0
[  656.105554]  s1 : 00000098c92a567c a0 : 00000098c03986f0 a1 : ff60000085dbf970
[  656.105594]  a2 : 000024bb5cac6aee a3 : ff200000004f1000 a4 : ff6000008140a040
[  656.105632]  a5 : 0000000000000669 a6 : 0000000000000000 a7 : 00000000ffffa000
[  656.105669]  s2 : 0000000000000000 s3 : 00000098c0398308 s4 : 000000000000066a
[  656.105706]  s5 : 0000000008f0d180 s6 : 000000a8d08b8de9 s7 : 0000000000001fff
[  656.105743]  s8 : ff6000008140a040 s9 : ff6000008484cb00 s10: ff200000005cc000
[  656.105781]  s11: ff600000814652a0 t3 : 000000f000000000 t4 : 0000000000000000
[  656.105845]  t5 : 0000000000000003 t6 : ff600000841666b0 ssp : 0000000000000000
[  656.105883] status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
[  656.106072] riscv_iommu_cmd_sync.constprop.0+0xb8/0x148
[  656.106321] riscv_iommu_iotlb_inval+0x120/0x160
[  656.106373] riscv_iommu_iotlb_sync+0x48/0x60
[  656.106422] __iommu_dma_unmap+0xca/0xf8
[  656.106470] iommu_dma_unmap_phys+0x58/0xc8
[  656.106517] dma_unmap_phys+0x15c/0x248
[  656.106564] dma_unmap_page_attrs+0x1e/0x30
[  656.106915] e1000_clean_rx_ring+0x1d2/0x200 [e1000e]
[  656.107668] e1000e_down+0x168/0x1c8 [e1000e]
[  656.107995] e1000e_pm_freeze+0x94/0x128 [e1000e]
[  656.108328] e1000_shutdown+0x28/0x48 [e1000e]
[  656.108652] pci_device_shutdown+0x34/0x48
[  656.108706] device_shutdown+0x104/0x1e8
[  656.108752] kernel_restart+0x46/0xb8
[  656.108797] __do_sys_reboot+0xc0/0x1c8
[  656.108840] __riscv_sys_reboot+0x22/0x38
[  656.108882] do_trap_ecall_u+0x236/0x3f8
[  656.108947] handle_exception+0x15a/0x166

So move the device link into the iommu driver to fix both ACPI and
devicetree systems.

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 drivers/acpi/riscv/rimt.c   | 7 -------
 drivers/iommu/riscv/iommu.c | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index 906282b0e63c..229c4a0d47a3 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -263,13 +263,6 @@ static int rimt_iommu_xlate(struct device *dev, struct acpi_rimt_node *node, u32
 	if (!rimt_fwnode)
 		return -EPROBE_DEFER;

-	/*
-	 * EPROBE_DEFER ensures IOMMU is probed before the devices that
-	 * depend on them. During shutdown, however, the IOMMU may be removed
-	 * first, leading to issues. To avoid this, a device link is added
-	 * which enforces the correct removal order.
-	 */
-	device_link_add(dev, rimt_fwnode->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
 	return acpi_iommu_fwspec_init(dev, deviceid, rimt_fwnode);
 }

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index a31f50bbad35..f9368e977346 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1385,6 +1385,13 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)

 	dev_iommu_priv_set(dev, info);

+	/*
+	 * During shutdown, however, the IOMMU may be removed first, leading
+	 * to issues. To avoid this, a device link is added which enforces
+	 * the correct removal order.
+	 */
+	device_link_add(dev, fwspec->iommu_fwnode->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+
 	return &iommu->iommu;
 }

-- 
2.43.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
