Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409A6CD5BD1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTCn2YRc4w7Esacka8YQcwD/Cf67BZR2DPf3SFjUqwQ=; b=BcvLreXEcy3oum
	rLH1Nj8Xz9R4YIR7bMomkrjNsY4ism4C/ewR35d+TRTPhOEEduLY8h2iX85khctIpOn8jQk4Hqw4t
	VkaDbo69PyCjbQTz6brmjBGEkmCO1xiNIrlBOs5yz7icZ9DCZMzqpB2MsUyN7bfgzai0NNZ0XUhaD
	X8NgXHjEu8i1V9wxfwSYZ8omfz34XQNnFJkGexnOEC2UTGBo+RQkh8jxk9TvIvk9B5k1EohIu6tS6
	CEyClZB5j8WGFZt8QP8ihFkzo110bYNd3d5oRTQ8W3AzbVuOF+kHDB5zpp3iYTqNQdT9MrMB1Hv4M
	1AcSD5ncVJe1zogknzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yS-00000003F8U-3Gd3;
	Wed, 27 May 2026 03:30:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yQ-00000003F4s-0g8w
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:30:27 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso4703176a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852625; x=1780457425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuujAuF8eXBWdShhG/kW229CX67XgkUB6V+YnX45VpI=;
        b=q4hWZSCKeiettoonFVyxzyJfFK1x1pvzT3sEomlFnWnCa7DgPF4MarS8TyYcjlMfga
         dj26DTqcU69U4sKvJlYJPbNc+RvPtzSqQa8DLEhqzsKBLOxwtKY42SYFqrPEl+MMA1rn
         arglLLVzqyRPeveX0jvFCGAmU5jctr5t6DjYaO+ubWO54+O46UzWnvIdB0T9yMylZ7hO
         zPDQRkgriDKHKBuuTu3exUd9sxF5nhIs6fbhnBWl8PYEh3p8kg09C6yRggXvuy38IXWU
         Pq+FbCNRA8C2WLhyn0yWh47JbD0sBsDEGBePgczXjpdeo1GoOTpxepp1EnZBun00Arom
         XSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852625; x=1780457425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuujAuF8eXBWdShhG/kW229CX67XgkUB6V+YnX45VpI=;
        b=QiVvGhzqMfq+mA8A/pOakzi1f0Lz61b0+JvfMuobtqY2z0lad07ab5qu802C0VP2Ji
         tNXyVMI54/xkFB4S9w/6OPwi4u5s0kwmb8dYKJFASRF6f1j/83A+6atiHWIQJ4ZUpT2E
         Qq8Izu/GNdiwZiXD5hEE6sRqSDdEli5Piq7Hj+eZJabmsbiRvVlPYKsFKhQNq7T9YKc/
         50BwobYJJ7U8AIkA54i+qmByjau9z6tsIP35lztU4dEGvpcMFUO8N7hUaTuZ0LD65F0F
         n7xQAR+uOBkiszrJQJdTl27w5PIFxQYfpWy9uHrPVmAKyAfvYFgFZlTT++qN1dKiYavj
         FDRw==
X-Forwarded-Encrypted: i=1; AFNElJ8+E03kTXTajxtXay6W7MpQfOyskSXs1Tbt+2esBEQgAjMIi4oHiQUSzXBz9xW6uNqGed8uSq9YLzedZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa7cQ2SxCYb1fwz5J4YwCWWdLS+TL5epfI5raMqgGnBYa4aj3i
	wcmaQ9wEHr24gUCTVH0PCvaWiR6WdfyJWphqMgmdIURJ+Cb8mfHaG1Dt
X-Gm-Gg: Acq92OEIP0HaRWOHo3HBZ1tNh12OTOXfaZNyyag9lGWjeX1ynfi1bPYLQp+E2jO88Fr
	3XXjTeek6bLYz5UpngVemwXSxHKJSIWLio3cpDJp9VyL8Mn/1w5b/U7NASAbzl2HdPjUfYO8Wyn
	UtIxNJ8gUNhWGxPQwFAyqezP35zSvvuvJGO2nFbcHQfL1LRyTNu8BThPWVWCRyrc8ycWvACGoPc
	5x4HO+dkn1i73S0CcAaNHVuP1Xp+5t24xAAWQLve5b8vhd18waIlTeqwLUcce8WPPo/0JyVUoYu
	mvNnPLtBBjhOr5idvzfu0OGo2TUkDD9Hg032fzPfBXPuCOVl5VdMPacmhsXqwnC9xFuhfAS+A3B
	5niwEBUAiyn7XtwQyD7WJouZoqE9fOGbl9bGdeVjjb/WxoxiYtkfxy/05yQ+0CL3mNgZ/cgLfg+
	9hGS40rQ+3cgDWAy1jG4lqZeG1f71KxHGhe03g
X-Received: by 2002:a05:6a21:6d81:b0:3a3:17f8:bedd with SMTP id adf61e73a8af0-3b328cc257bmr21442620637.17.1779852624627;
        Tue, 26 May 2026 20:30:24 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:24 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 05/11] of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Date: Wed, 27 May 2026 11:29:11 +0800
Message-ID: <20260527032917.3385849-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203026_210177_5FE842C0 
X-CRM114-Status: GOOD (  16.57  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for storing /memreserve/ entries in the reserved_mem array.
alloc_reserved_mem_array is skipped if the device tree lacks a
/reserved-memory node, pointer 'reserved_mem' continues to reference
the reserved_mem_array which lives in __initdata, storing
/memreserve/ entries into reserved_mem_array would result in metadata
loss, and an out-of-bounds memory access will occur if the device
tree contains more than MAX_RESERVED_REGIONS /memreserve/ entries.

So split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late(),
and call alloc_reserved_mem_array() whether or not there is a
/reserved-memory node.

No functional change.
The actual /memreserve/ population is added in a follow-up patch.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/fdt.c             | 7 +++++--
 drivers/of/of_private.h      | 1 +
 drivers/of/of_reserved_mem.c | 6 +-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 82f7327c59ea..83a2a474831e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1284,8 +1284,11 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	if (fdt && alloc_reserved_mem_array()) {
+		/* Save the statically-placed regions in the reserved_mem array */
+		fdt_scan_reserved_mem_late();
+	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..50e5a533e059 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+bool __init alloc_reserved_mem_array(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 05defc91e901..888dcb6bdce5 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,7 +69,7 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static bool __init alloc_reserved_mem_array(void)
+bool __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
@@ -272,10 +272,6 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (!alloc_reserved_mem_array())
-		return;
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
