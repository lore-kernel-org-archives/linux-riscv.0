Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F6FC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkpXTwTNBGPVuISwf8XZc7r92t8QBNORKTocUUGgkOI=; b=jrcBSj7Erag/gY
	N1wHAiPPnYNjPQuugD9tnzGw/q3YXeonparln/SHaHS7mYMn67/EYq+DgAKHMWs+auZWGA8X//Xf0
	JzYHEEe3ejD+plN7fmw78m147v/RlLmsdl9ahXo9n/ewAxYNHr5kYk3HDwsawGj94GD+E0iJiMI2P
	nf0j9+BbaBNnS3iOQbRocSh65ZmB4csPtyhGT0qrWSia98PUFjSrpRjLi+lUbn1HbQlkqUbxuR0Uo
	PxOHq7wBu47HSSJtF4ktUH/fGsxiITXxXEHYjUdMK2rofVZQMmPSLCVzUX4WF9yq+F7YquGM0U7Pj
	ywypkArmeJFEUaqz5Aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7g-00000004k4L-1z8p;
	Tue, 22 Sep 2026 08:45:08 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7P-00000004jmw-0gjQ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:53 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e249c766bso1633160a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066690; x=1790671490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=RrpOP3wMwE/gvQ2ht8MVLIUCSMhHzDLRcobIWuhHbY0dc5xj12yCo0CzGmdKzQaSzi
         pVv03e2loFdIBl2ChBiEZn7PP7iqPLqTHH0f9+AFubeSZZXYn/UsCxqxh9DEoMc9+olS
         octJfxhUf/Wp8TJHid3bVLr/fjGz5vZQ3aSvWOUINl/AKG/HvVjFPW1vqvvqHMCclfn1
         kIXJG9OqJA536V0Vv8qwYW2xqZ0JFUExpFnlYZmzrF8Z2cBOXc2aeKWK3qPVJJ0tsuOn
         TUrAzN6SJW99EEIRi8zrw/4wo5Sm8XlK+ZmIGkEORkXaUc86uZtntumo1DCLqhFMphRz
         GuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066690; x=1790671490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=WwXKPg78Ip8N7CGRObI2fsmhyABkKFBAkNp2NzzJ1nJpGCEubR0sKbzH5YiFzYaNk2
         FUf5kzLf0aigucbh043PZHKAsW96wmXffrA640p/MhVMVhfEGSnxChTN3OOfVLJGLKc1
         Rw74GyPGxvlAktwfpbImPi/G71VD0nW5CZFYlfjiC6amT49x9CSHQJMVZPv/00Y5gUkO
         hiET1dyZjJ/dq6gh0XdihV1gaeA96iNHy8DoABwoIFp22mwbyuDC87BTSK8PCDpBKGVB
         JaCKCA3JqH5oG8DWNdV60vGrE3VW1K4m4tbVQG88p1lQAMX+ot8P5wvdE75g8J44hW+w
         WgHw==
X-Forwarded-Encrypted: i=1; AKwUvBy+Jr8QOfia2fT8c5HymtLvqjysGtwHoxq9tFlIzgTpIswuRZnIhfXKqWkSxAKXJ3+zZg2PKmPlRhTeCQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nOVZT27aYmyguOTD42yjJpJdx6vtPceHMgTxf3rDeVp0s7IFX2
	x3Q+aJxLxJVYvBLmxJgofqmfYvjEBM7DfAy1Nd5xAxkEeWfBp5eQH7sR
X-Gm-Gg: AYBFou3rGZdQBDgFC49p6ZEvvePYFI8qjW5jTnink+Ud0oBcqGmM94flCwiwPX2FEua
	rKV3JRaJnobJIE0Dd9iOdVpPSWsAmTQ8qaKrtebghe5tb9q9k+5B4oCEVkcObymtX6zNa+RnftQ
	8IbpKSy6DVutWVMogomkeHJ7gKxr74EqdIiepk+fXclrTQ8AMg2WXqkUDpXB9IrqbSJRaaDjKZn
	RNhkAAYS/1yAQXH3YJQ2k4/57HXq2R9TLVvgtY8IhYj5bMDZNhN6//5Hw7Qralw731aJCYDf1i0
	kD96S6i0hDu9Vm3ACGgDmanIUyfo8ddfaQ3rf26fcXCqbflCo0ym0o+n3sV4khFfW1VbIcS7IdP
	RMk1Z34Pkzu9ZT+yCEDpxbWMHOIKocX7Lbkmfpx27EU8tx1zox6WA3e1r0dXHl3PL8FDhWqKA0Q
	3C/xl/10hv+6CqUQbxj/ZMM3XtXjxaHh8+xe4W9qyeCKuyTNGVY5eHoUuXyYEOf+0i1gWCVUDPh
	4XOnEeQw+oOUKwKbaT0QQ==
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr479077a91.34.1790066690219;
        Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 8/9] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:55 +0800
Message-ID: <20260922084256.1515554-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_014451_282928_BE3DE478 
X-CRM114-Status: GOOD (  15.37  )
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
