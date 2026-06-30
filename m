Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94303C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtgjUkgYuEZ3tNPkuvKK/2l1sPxadNVxFg1KPidDbpw=; b=GK8udtElcxPiwM
	G6hsDPzrUq5iEPJmEREcsc7plY7EyyNDaLhqwnKy+at9GTUKCccFbbjcQ1+vsMSwE/kcc28z8v4YB
	R9tR35CTYEhXOuJ2xT8A16PP7q54MRQbxhs7DPqiXTtCgVGS/0SOEOkL8O6SgTnPuwlKjzZfdEK43
	sEzPaoOazJnJJ6/eO+3aiI24MTQBzrYuoFp5SG8uvfejwBYi//MJkkyT+F98vRoOwML5mVk53dtxK
	fS8rb9PJGetlpLaQIVM6I/5WB1Mplml6wQ1mwx8En4SwrOfpqjLVIZDp3qFxGzKpTZPjau+HxZF8J
	7ULN+A1XtMwlwbMRNffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCY-0000000G9iD-2b9v;
	Tue, 30 Jun 2026 07:48:14 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCU-0000000G9cy-17Fv
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:12 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c80ff1bbb1so3652315ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805689; x=1783410489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=;
        b=T/5i3CGlXSB3okos35ZQP6tdPlgHt7+wWwOkLIyM9zyETdHwurEoY6qVFVTvXG4L4d
         Ej9IyHzmuyij2dRhKdFkicytrEVmiQNjJjRrGPShRgbsAj0VlXUcw8kP++LXY53Chrwr
         hWcuRm2o08GezqApArOjEjegY3NfwwmswWQa7lPLRptxzVwMMAcCozjItTvz9/ru4SQK
         Cim/eHMLAUuUhq0heiegfg2WOYby4Vj6PnzL9GIMi86RLHJisahcTEgqTw5IAAmuY743
         hTaNYuzruIOZrnXo+KwoHDmG8duHS8BLLp2/vmM9NDm50oOd5Td7fAZj9U2s26F+Dwce
         2noQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805689; x=1783410489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=;
        b=Hpgkik58dYOK/xyPtnWXYO99AaJOkFirllGW8asZiHbwuxMrLx8mfZ3cmce2panG0q
         Rx1mlWVBBfv54yJ4YQrVnkZ05ollb4iO9ZClbcx2OcCHEU7dN0d+XXR0yzayytFeq1x+
         5wGNDgT5EvTdYOqvp8bV2+b64kvsRCklw/kHMoMkaTseqE5zcpbLUXCG/qBxVgPGuNWN
         WykG351/SCdnVz5kW1xOtRggVh0mjMxOPspDAv/jX9AlyZmcyqSD87CTLf8Iv8gcdxFc
         WgqkQowzA8rl1JGcQQKecJxrNvz4uFFE/Osp0WK5RhmEuIfQQuGENhOGGQQ1fpfDMsWm
         SJAA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7DDdsaeFJphShJv+tcNC9JmKl75FZMv1fOpfsHH+nf+NCMtFasvF/p9qFoWPGfbPY4dcAaM01nkoxJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw2EiaKTvPhlno6dUsOwpbiJ/hfD9tjshCc4SF7Uv4EQwvOKLv
	CirszzYmEi+HiyyxTOwLrdJuoYVneSycdiB+dX7iW+sguThm/7X8axPb
X-Gm-Gg: AfdE7cl7zT0i6ls9syYpUJEi2x0MirA4dm7IESjc2XrJLzZ5s46jrCJUyv8ade+RA8P
	aO2XA26O61IFpzYQu4BBPBBG9CZRCYPcCSOds+PeP6G3DbAq1pfTQ+TKsyDw6LexdgJ/oCJhcbJ
	SjTyZczpwLvlEViLdk0uH5kIWF7SJsu5YCYEmNeOmPAZgOoRCP3wtNGa+bkAj6LY8eFe5mEQ299
	wsXZH/04OavlJ58yzKcER9Lf5x5tBkZe06bydYMpVBvd8HYzcyPLnH0iKX9bm4o0NgO4fbuA6l5
	97x6BlTx4C5UkSBb0qxsSVbBI2POpKAg8AgLceLicB22lteo8WFT8Srq8RBLoz+vKu+zyUEOuMF
	z/opDrpt/e1Q5xUV6LhE91LQ3yFpiwOKsbmmk+hhCbtYT1XxrHKQh75cfodwVxfpHLkmQ5Fiwqw
	s16JiOg6SpfbDSAVVmw4IxOnyUXg==
X-Received: by 2002:a17:902:ebc2:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca2ec34870mr20905945ad.47.1782805689451;
        Tue, 30 Jun 2026 00:48:09 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:08 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 04/10] of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Date: Tue, 30 Jun 2026 15:47:08 +0800
Message-ID: <20260630074715.4126796-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004810_311551_4CE01B48 
X-CRM114-Status: GOOD (  17.42  )
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
alloc_reserved_mem_array was skipped if the device tree lacks a
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
 drivers/of/fdt.c             |  7 +++++--
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 11 ++---------
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 26f66046cc32..b97775f6c9d4 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1282,8 +1282,11 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	if (!alloc_reserved_mem_array()) {
+		/* Save the statically-placed regions in the reserved_mem array */
+		fdt_scan_reserved_mem_late();
+	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..81c8ec9378b9 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+int __init alloc_reserved_mem_array(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index e1bd35115cc1..f6c02b37deb7 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,13 +69,13 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static int __init alloc_reserved_mem_array(void)
+int __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
 	int ret;
 
-	if (!total_reserved_mem_cnt)
+	if (!initial_boot_params || !total_reserved_mem_cnt)
 		return -ENODEV;
 
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
@@ -266,17 +266,10 @@ void __init fdt_scan_reserved_mem_late(void)
 	phys_addr_t base, size;
 	int node, child;
 
-	if (!fdt)
-		return;
-
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
 		return;
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (alloc_reserved_mem_array())
-		return;
-
 	if (__reserved_mem_check_root(node))
 		return;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
