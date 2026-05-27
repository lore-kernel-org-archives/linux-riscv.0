Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F43ACD5BD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4I6X4LadMEAOQSaBc0nhXuBQlvudlM+Bl+opwYUEKI=; b=Y0bn3Y9vgsP6Kg
	+7r7H2pp1QkdJ7gzqaE0ZPkhF/R8ctf6Drzyrhuh2z9+ccWhZkcLboYSA1IQsiy2u1tkYtzZcdHEp
	hf5utzFD3SYIR1hdXQgci23ft6d27iuWwL6sCayOQD3XTxWn9ROhvGk6zqeDdddOdp2CadM4Le4B0
	kQBtXJf0wlPG7uIUatVGVs2WX5ulcq8guNtP6b1d3iKix8Auuvb8AgQTHZ0K5NWjpLf92whbQbnKZ
	jVQAQMN+ZgkouRt5ncAmF10AhWB93fnKgY7HBbbyq5D4MHJxXMnrNAurzI82BVjT0ScEXJ6pyxRMw
	kkBw2UtDanIE2Hhj9d8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yt-00000003FVX-46TS;
	Wed, 27 May 2026 03:30:55 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yp-00000003FSD-13sa
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:30:54 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-837dfccd950so5231564b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852650; x=1780457450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p28EH8R5CXtCwys+lC44uig9HB9HdXcu6ohyUKifVw=;
        b=HLev4TSZuILLlLhS8SR0cR0L23fxKAvMBWHT7ndPeu4X/iiGFKV0AOVYpFzPn3c/5P
         h/eGEZ5IlEX8Ra5zRTbegsmmXfsftsEDZ22WEEz3zmUrsoCe+Rq9vUE+GrvxdAbPFYE4
         gwuh2aQdNNilVNIUjhMGzFA3wa3wpm0sF93dFJbZ6DUAV8V3tTdV+XRnWx/p7fpGSm1F
         pGbb6qZEkixj1Pw643y66ATQT3x5R55cQfpn1tY1708EXx/sRD6tvB68HSx7iXhBuJ1b
         6jHXby/9UscLkCXOga+G/DxEMFSioW9ky53ZWzWiPm0hcfq6NLdj/XqtzrujASQQwfkl
         sBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852650; x=1780457450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/p28EH8R5CXtCwys+lC44uig9HB9HdXcu6ohyUKifVw=;
        b=ejsesr2a8WQFo/R9x8CyGoCUWfsV0NhTOZTCGZNUGaY7T2UXluruHpw9TP+JCK0GnP
         wjXc2Ttgyak/V9b9Da3Bzq5NiJLS02g4ZEI/zxcEXLBHiVUlX+GmSnuuUOotvgVwj4Bn
         Hb+aaxtBm8XVO27tM9E7haNcLXEDrkp1DVY2kgYNA6ubqeMLDxQs/rW0dJ5lP6P+6DkH
         nVmEwG5pILArTceGY0NG8ve3usxTfe6PR/f2B9O/Ap2NVmOgfGLHKRX4X01n+Qe2uI1X
         X8Jhvj6/z398j+Jwu7FE22JQXMemF0Ag0k1SzLI6vccSKA7Fq9VC8UoXVl0VqgHBMVjv
         rGDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LBgosA6HxYw8vdPRMLeqaQoWwhCp2N5FuNNG6T+lp1vW46O+oeMC3v9feDjYgEXgD9H+glA1Tm8p4kA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUSJMdBaL874TIA75POrQakiZISIXgC/mx8YxqVYg8Uj84wwcr
	SRm3jhJMRvYiQTVpirbD/bGjbQy2BY5QdIgfT5IaBP9D2ziWMyiqXuEx
X-Gm-Gg: Acq92OEm0wUfWd/8PXrUyh681EGdviCGMyZprgUriwSKGX68THj/CbYg/dmCF9YnpK1
	YOUaFoq9MZJ4iCLNwqXNAal6ZIFdD0SJloNO0ctHDMbq5PtA8gLbKDa8Njr8zsFDf3NLWNF8FJq
	GajSswG/vDYm0y/CQtLV3a9sasko1PvH1LBJdlQnwqlJrK/snvOX5JXg+canne4GFCXiJdwbVpk
	60qIMzqaxbHt92g25vvnm7vzU9r50czpbpJFtziwUtvJnzCfSwr8yk8pTJi2n7Ard4dgq7L7Q4S
	4dQitecoWlt4lFHnajXengaWc6c9dkJONLRl7A9KsGzSQVoEAfpuMtFkFF9z2Q7kgjKSkSvu+ng
	3VrKwn2Gd6MJNQ/1wND7E+D8tCJLHmM+MNH5rO+ddayq+Kwu/TGvYk8/BND7diohGb+d6Hvw+Bu
	RuNM0eblFcrguXevjulW7p815aKgPVg8HQh1Xh
X-Received: by 2002:aa7:930a:0:b0:82d:24f:2509 with SMTP id d2e1a72fcca58-8415f0e26b7mr20587500b3a.1.1779852650451;
        Tue, 26 May 2026 20:30:50 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:50 -0700 (PDT)
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
Subject: [PATCH v3 07/11] of: reserved_mem: save /memreserve/ entries into the reserved_mem array
Date: Wed, 27 May 2026 11:29:13 +0800
Message-ID: <20260527032917.3385849-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203053_731376_EB21840A 
X-CRM114-Status: GOOD (  17.92  )
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

/memreserve/ is used by firmware or bootloaders, such regions hold no
useful data for crash analysis, they should be excluded from the
kdump vmcore, so save /memreserve/ entries into the reserved_mem array
for later exclusion.

If a /memreserve/ entry overlaps any dumpable reserved region, mark
the whole memreserve entry dumpable as well. This may keep slightly
more memory in vmcore than strictly necessary, but avoids splitting
entries and never drops data that may be useful for crash analysis.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  4 +++
 drivers/of/of_private.h      |  2 ++
 drivers/of/of_reserved_mem.c | 55 ++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 83a2a474831e..745e53b1c564 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -499,6 +499,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	int n;
 	int res;
 	u64 base, size;
+	int nr_memreserve = 0;
 
 	if (!initial_boot_params)
 		return;
@@ -516,7 +517,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 		if (!size)
 			break;
 		memblock_reserve(base, size);
+		nr_memreserve++;
 	}
+	fdt_reserved_mem_account_memreserve(nr_memreserve);
 }
 
 /**
@@ -1288,6 +1291,7 @@ void __init unflatten_device_tree(void)
 	if (fdt && alloc_reserved_mem_array()) {
 		/* Save the statically-placed regions in the reserved_mem array */
 		fdt_scan_reserved_mem_late();
+		fdt_reserved_mem_save_memreserve_entries();
 	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 50e5a533e059..30954e859689 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,8 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 bool __init alloc_reserved_mem_array(void);
+void __init fdt_reserved_mem_account_memreserve(int n);
+void __init fdt_reserved_mem_save_memreserve_entries(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 888dcb6bdce5..5e27f9403786 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -248,6 +248,43 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
+						   phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	bool dumpable = false;
+	int i;
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for memreserve regions.\n");
+		return;
+	}
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+
+		if (!rmem->dumpable)
+			continue;
+
+		if (base < rmem->base + rmem->size && rmem->base < base + size) {
+			dumpable = true;
+			break;
+		}
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->base = base;
+	rmem->size = size;
+	rmem->dumpable = dumpable;
+
+	reserved_mem_count++;
+}
+
+void __init fdt_reserved_mem_account_memreserve(int n)
+{
+	total_reserved_mem_cnt += n;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -305,6 +342,24 @@ void __init fdt_scan_reserved_mem_late(void)
 	__rmem_check_for_overlap();
 }
 
+void __init fdt_reserved_mem_save_memreserve_entries(void)
+{
+	const void *fdt = initial_boot_params;
+	u64 base, size;
+	int n;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+		fdt_reserved_mem_add_memreserve(base, size);
+	}
+}
+
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
