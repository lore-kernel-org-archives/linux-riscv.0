Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBD7CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4s5vNObAd9KnAikcZgnvXkwDQUTDKwoA1x8e/196dg=; b=X/w5UaqvQNJrpy
	nwYHd9kObD/w1v1WHwowl8a22R4R8jyaLr31A7m7owyLwAfT7h97PaSkb5SmebtBaD9yUX072V4tT
	mxxTV3qyfVeOH0n+Ml0BBR+66ABTAVf3rZnYLPas+L2DXpBWjXTzxlZ2Gxt7I5MxVlzKpObWGMNjT
	3DEqpcjL02bczTwsqANYwO6tQLili3rOrJMUBkvmp7cIBc9gKoaWIHvrTd7o+3uCE2LoO7s3os1u2
	R88tvCH1TXMeuC7QQsb6LRXnW8QI+HdMmkfSdKHn4ACLGOUVt98RJYBviGqj0laSN+HZDHBQ7inJ0
	ujg7EtUlyKyuUGjGnt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5e-000000046iT-24eP;
	Wed, 20 May 2026 09:19:46 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5a-000000046dK-1WKl
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:19:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-82748257f5fso3528564b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268782; x=1779873582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOCzBK8k01kCn1ct1tqBM3o0gO2HRIsLOEiUTag/y2g=;
        b=EJj2LVciAkRLE66sdMWqhmBubwrotYOhGjlhpomj68zsJ5n/wr/zVp66upMSS7tr7i
         Ei/De3UgrE1VjQXIGmsnGopGXHdAb1Qg3kUIVB8Yq1hKYOmV1qU1ms5jPpWLzqMhQmqR
         A6groIpD3xaVxTbwEYRV8IXLAzggyezvRKyqyX17oDTCAvUixxRBZF1vySDPWgCqkm0j
         pLD5XRxBcgihzTJ62/WRfILkNNdyOh1/QfNS7+RVVok11LeBQeXcC5clRJNW/ym44aZR
         MsrF3sVN0KfIHfUpEwgToGVH+f05g28qSz0VWyh5UtdjWnlASqv9dOcanFqWEtIKDUcR
         nJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268782; x=1779873582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOCzBK8k01kCn1ct1tqBM3o0gO2HRIsLOEiUTag/y2g=;
        b=XNZGYmnsHmmqJmxWCz+ijo5nJbXZrO2Qf4K3VxbTu8Ar/fNIDwZ1LgWn6/owA2WIDk
         N2aSHKZNGETvsTj7mtK3k6OENLpBquc+71lPZ1l8wIhFipXNlxiNXsTu+jdqy756oZML
         9fu2u9mZOvwP+N6ln5kioMdwrZrgRaCv+lBwDXlR2P0A/buhxq7E5weDIWac2gj4+nGU
         RM3e7cRteC6a22SRqYZaCb+Jv7ZMi2SP7V+ysP83R9d8UgT1OeFU85bURTH6kFBAvn9E
         GWJDJzgrNiZCvui/NTWoRtDvql+KZFBNR5LA3/z74CsxevKplip/6dtG/uwVr3Jp0Kza
         loQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yI3L3HDjCu4v8iphnlOHqc4oCB9LCiaWHBBZm1Y8rd172KQ+psKB9jspnaVD5fUnIT8+EM4TDY2X/zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCmsM5JDitJ8OtK3iJ3mYOZyhOSUd+Xj0edHrEsaqhwj9XVv5i
	XVAAIwsiuQx6lMXvIghAndc09ac5NxJNpcvt23X1j2Q8Ag0mjVwIhREA
X-Gm-Gg: Acq92OFdUph145C2gFhOoNfjF0TRoX2Qz10oq6niAT1Oug/z3OkFsU0MvQ1L8gsHE8O
	eU5qQQgJVWFjH1bLoPd1F0HD56KJg71ot4Yc9UqsWvBG+uCoNfLqFTH6dfdMIWDL69Q4M/tiHfS
	gcCb9m4LiHMNKW+Hh4iiIlJtnDm3AbILql9B4s8JfmEK9KMklq9dQYSiwvsFwVGNH76tzLgp1Sf
	PJVWaRyZTsiasbIeWT1qkm1QFRHs1aRS2zx6md6Jip7CtJDfCEZNsCieI8Kraxo9YAsUemiuAX+
	M6MId9i/Vv0pwvwJFzAyqdrK237n0pU/xP2fbFMeCi2h5LU3yBAGNVzm2JyfCvRQOIU6N0l2Cgu
	ej5xvR9bx5H51+8ePuTVOvSNM3GLFk+DxbDO1+fgwkfZfhSn6hF8iXl5EOaS638IdeOXOdefeoV
	2JEUExtliaKijtvZIZcRjmgRXkO8gCNGPYvTKk6Q==
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr21882568b3a.16.1779268781713;
        Wed, 20 May 2026 02:19:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:41 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
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
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 4/8] of: reserved_mem: save /memreserve/ entries into the reserved_mem array
Date: Wed, 20 May 2026 17:18:40 +0800
Message-ID: <20260520091844.592753-5-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021942_422563_E036DD71 
X-CRM114-Status: GOOD (  18.09  )
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

From: Wandun Chen <chenwandun1@gmail.com>

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
 drivers/of/fdt.c             |  5 ++++
 drivers/of/of_private.h      |  2 ++
 drivers/of/of_reserved_mem.c | 55 ++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 82f7327c59ea..d2bcaf149fe8 100644
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
@@ -1287,6 +1290,8 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 
+	fdt_reserved_mem_save_memreserve_entries();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..646b5f43ad47 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,8 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_reserved_mem_account_memreserve(int n);
+void __init fdt_reserved_mem_save_memreserve_entries(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 313cbc57aa45..6dfe9e03c535 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -241,6 +241,43 @@ static void __init __rmem_check_for_overlap(void)
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
@@ -301,6 +338,24 @@ void __init fdt_scan_reserved_mem_late(void)
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
