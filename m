Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E049C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEq+HT7ORNzoJfbedNPc/vKMr2BeROZa02vGjj3cbRE=; b=lNrss7uCd4psgx
	6PAT1Aq13YFKMKSzJccQM7P8UoHsz/aADR9YvuCM1v5/7PEKI27qwGQ3o9Zcz+FTnZ8R+4xfbss0D
	8nSOctx3+uxrr+U92h9ySxUIueATzNsHdhDYW9OM4tS+fyudONOGITC2xCSqHBJophrOVWCSwH/yF
	LmCrZ/FVaMl+OL9MB+wxi/CBZhfD4hqqZ9szZV7A45NKqVnGVcz7ELCGEGxnSV4WbPtnb0ID2Nxps
	bQNDgHC1ho0gH5ghDPuD7usVGNZ4tK8zUHdGMmUlypQoVuqJ6GzEvrp1lY++hjiC3Z0DGWbhdaaCZ
	GvfyNljrxiD1cXEs483w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDS-0000000GAsz-09Y9;
	Tue, 30 Jun 2026 07:49:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDF-0000000GAPo-2W7G
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kOeOq8JJcDQksJBuje0bYH/ntMqvxfxyxa0O7Jz9Ya0=; b=c7iAvSGwMvmdRVduH17p78H3TB
	sImBIYbvYjtN6sYZLJykovFwxr3kVuD3w8ISxROC5cJ1rND/jSPpGnEI7TQ0un2JJruAxueMKmaGv
	u4gvKNt+ns24zwOaeYRRRGz58gVCnwNVyjo02hJKAo7HvThVhaNQewTNZPqpWUG/QGfFVwoHCJWCH
	bASQOIBnhdK1AYqMq5sC4rKSm6fWFG3q2zOA8oD0XUtGn1t4hngShdTUyXSdjT7KuD0sL8ic7dyol
	NxBcE/1W92USRIP5vBuL0ds9cILMNr0OP7p9ib2tlTnrTCQD2X6pScuOtbYgBmqNg/Yx+LU9YtSSJ
	DguVyI7w==;
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTCq-00000001cnu-2hQJ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:54 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c99784b434so2273115ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805710; x=1783410510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOeOq8JJcDQksJBuje0bYH/ntMqvxfxyxa0O7Jz9Ya0=;
        b=CgCZTTvytgIy0DXqQznk3epUrR03i8kms9/U/IgVRmkJD33veh8y8AnAa+IE8BFXoI
         6dcZEmRiDDC3iI2XjnN/CzcCdZ4FpdBcoT2BwD7RM35JdRtdjRmykUlp98AR3n+DcP9y
         cNCkvedTYMDgxCDQCHvM6BRwFjH5rP+8RNnkTRcWlrMbZZ/vWE74fAGsld6oicP7R1P+
         3OabMkAv0jYQkMCWR1h3qij6EOfGkTL3emuCxs3Fn7461yamDYPghVw2xcmYUi5io0XR
         /oFWLHimCco2oovB6aNSb9l72KDt1ZRVSe0zEeJX4GP8UTtjfgr33JCl7ruAwQ9cPpnN
         L90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805710; x=1783410510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOeOq8JJcDQksJBuje0bYH/ntMqvxfxyxa0O7Jz9Ya0=;
        b=jtqpI3IgRpqdjzWsTQII+i1OeSe2oGj7vDklvDy3B2dXm2O2GERHQSe5PF62BcEK4i
         NWzQU1CRQDdxVASmrA6h1tuXboEgKVAMbNXvd8ZfkgsItIzE2+kJszQRMMI+M7alssGg
         RmSe1TsEHbkhbtYcA/Vh3P3D0qgpPdZeoNcu0a5pzG5AiNq9lYz+xi4af6JM5jTqLOOq
         XWKYodys9TkmJEKxLrtUn5V+JpKhPQjqOoeegfqVdMG2Ug2g4ZZgjxl3IzJyx9Bcx26r
         meAm1I0xqOEqi8UtVruIpay8ofDVhpa+2Lpxv8Gq0l8lbDMvD5pOmb1zWk5ojzw3v8iV
         yeEA==
X-Forwarded-Encrypted: i=1; AHgh+RoaiAOmN9XjdbBbHMZObLJwNnSp+o4WQzbDYi8IlNw+9vioR7+zrWkgcf6nfZ8cutiE4s8MVXfxFc1BEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw83e2H2g0lG9z6bvQPshfxjoqKun9NY6PMg/6CPj5SB/fn/v5D
	3wRLpmdqP8y/dqNQnDjktr/5J2Q25kfzzuGikn5zaTU+QrGkhiMohL73
X-Gm-Gg: AfdE7cl97TNfjU4M0TJwp8+PAp728aEinWohuCib7jiZRmd7fQdyEShBI+K2GYXBgYH
	d1guDWXe9lWzKJVqkJ59N/KYq/HzHn93F8wxEIlwClawTzafd/ECGa/Vb4Sm+RSuY9bGRopObHB
	tfLQV8ef0+lnZSyWpxsIrbKaq7zOML2m1lRXiYnwU4qFEn3BB/ugKeYC+gvejpB8ENeJl/TXsnr
	xhzjYLRknN4TBfvUv61R7PAhqULwXVw7yuXly+Q14XyA3oCF10OeuhZmzuRBjliy2eHRDRymcMW
	7iA8W1UeMMM9zfBP16K/s6xx90UUR4CfnygG/xbkgtZ58fWSTCsjira5R8dVg/+AGav10L2CWKn
	irfA1PW7Yi3rclwxQ+Km3p2l39poVJMoO7DZuM3n14zfKsO2eddNrDqruXUt0pPbpEegzI4+UUJ
	gKLvrP8MWZ24B3pDg08Jndi9sMJg==
X-Received: by 2002:a17:903:1a26:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2ca2e714d17mr18921635ad.28.1782805710141;
        Tue, 30 Jun 2026 00:48:30 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:29 -0700 (PDT)
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
Subject: [PATCH v4 06/10] of: reserved_mem: save /memreserve/ entries into the reserved_mem array
Date: Tue, 30 Jun 2026 15:47:10 +0800
Message-ID: <20260630074715.4126796-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084849_457861_FAED5E53 
X-CRM114-Status: GOOD (  17.50  )
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
 drivers/of/of_reserved_mem.c | 52 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index b97775f6c9d4..3e478d29e247 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -497,6 +497,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	int n;
 	int res;
 	u64 base, size;
+	int nr_memreserve = 0;
 
 	if (!initial_boot_params)
 		return;
@@ -514,7 +515,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 		if (!size)
 			break;
 		memblock_reserve(base, size);
+		nr_memreserve++;
 	}
+	fdt_reserved_mem_account_memreserve(nr_memreserve);
 }
 
 /**
@@ -1286,6 +1289,7 @@ void __init unflatten_device_tree(void)
 	if (!alloc_reserved_mem_array()) {
 		/* Save the statically-placed regions in the reserved_mem array */
 		fdt_scan_reserved_mem_late();
+		fdt_reserved_mem_save_memreserve_entries();
 	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 81c8ec9378b9..a67929c0a6ec 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,8 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 int __init alloc_reserved_mem_array(void);
+void __init fdt_reserved_mem_account_memreserve(int n);
+void __init fdt_reserved_mem_save_memreserve_entries(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f6c02b37deb7..9db0502989c3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,43 @@ static void __init __rmem_check_for_overlap(void)
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
@@ -305,6 +342,21 @@ void __init fdt_scan_reserved_mem_late(void)
 	__rmem_check_for_overlap();
 }
 
+void __init fdt_reserved_mem_save_memreserve_entries(void)
+{
+	const void *fdt = initial_boot_params;
+	u64 base, size;
+	int n;
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
