Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D0AFF8873
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZ3oLKNqNvSdn4ix7vDu2TDIRr5DduIne2jL0Gu4NzA=; b=rBn6xBFv44z7X4
	34Ycijx0ciWSvjn4vcZFBPYh0pnKNEy6Jlu1ea7JYFFa9Bc/xe1mv9jIkUaUzZGxLP/PnFixmcJlV
	YHU9k2ne0EVA7Pvp/UT5tWvBwhl2bgNEIjeOZSe1nMwE4bfveHnoxqsThKSFVMSacQKmPWJ5dubEO
	+Q+Toh2PGQjWoLeV2KemMfQIKDDd1jLwoDMLXa53npnH1nrNp8D2Ea4FLnz7XFGGTEvyto/v3xPYR
	sl70dWkxXQWmtqjkK7khUGoKEGnV7hxAHEpgFYAcIDB6JnbhFczm8CvaBRiXCgSEX4FEi14VGHaFl
	Pwl/GaShw66dtq3BbQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytX-000000035O7-2Gim;
	Wed, 29 Apr 2026 06:59:39 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytS-000000035ID-1Cia
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:38 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso389078b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445973; x=1778050773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=;
        b=UTu2oixlGqRGYxZ4LCMzwJEzB4VnaXbdUkh2QceAPsDwx5icYaL+uJ7snt9/QINbTX
         Cu3b8jvgfQ9HoaPZhyi02ZAL1HCDJKkjcRu371yu8+wyran1aWIQky9dHEayhbyWbjKD
         QsV6Rgly7Z0CeBUM70Tdn7fxb6PYlUDW1x7jex5WGLpiRgQ0pVd35SnArzspAT0JnP9D
         Q5qVOyc12koJKB8+gvjaJ4HhZCHUMZOzdxeDaRSyeOAxd7iosQZaQwrXPjLEjQefEvAa
         kTxKuJ+hkBoVEPcWnGu//B2Zj8+VFl3+dUAHFL+ca4YNL+kpm6jgZhmGd+1QcB/QQbbJ
         sy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445973; x=1778050773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=;
        b=JKUnEqWE/NU5k2GyGJfghWATLrJGk3z4M4ETbwinbTFHn+nRlhJxD4svWBVwSIHrLH
         FYRZFu9Us3cGLj/VEg1stgpOXNeWchRMzdN5dYdnJ+LyO3ScjGLSe7V1ZFiAk8X7JksQ
         /UPipTmnC3ZWJGmXiL1FPeiMhoTWzvUmYmuw5zzf8IL6x2+UYcdGPPanF96DhBv99R4p
         4nsdRVN85LxwI3mPrQXnUgsAp00BGfsVP9AKHZKXdVc5i1xgVtDjNn0X0Fd6kaO1rs2y
         WjAnxn8+njFcPiU5SE+TRrnmbJAea4Ypc3N3N5NSHNuGa3b1XOvU9RBLYz+/tdV3ZJ/4
         XQ9g==
X-Forwarded-Encrypted: i=1; AFNElJ9KD3hiSr0UVQHcGc4xG/1ZKcJ1lxaPTGvBNoAVZL8UbUrLqpzujFLMsjcU3nihLlwScyZMB9vb1DflOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt3wJoOnmgBsvQTa6XeSguOTAWDE3+KxOpDO91o8LsAgDsLv9r
	aUVvs7OFI0+HIrQrjh18B/3/5s374s+YeUV/qcIHkFDWm41FDlN1atXopUBG9unH71mUUG+P
X-Gm-Gg: AeBDievP5/bv7acn/tpRB+rn4m7gRiIJlDWEhmizlM7l/TTUMlUtvzEthi8YJmWSM6A
	2WrZTJMZkYlYDO/OZ38R3K++ts7xPiTemzfXNKSxM0NJf33ljxbI07dXyc8Et9GCvPYNpbR5VXb
	uQ/Y6+zLFR/8z8hH9c4KL2IZDRZUOpwV0itDO9sX+nVSDry5auezEv15HXXWngjTVy4XNQePTx7
	w9ESwIWX2ZGHiPaH/itqvZ/tExJrlPUR4O640jErFFT//Q93QPRKCQR3v8RC44HxVahlzihzOXI
	N1YPrvGVL4GrXvNGNdmqrb1CLpEA9sAFjZQ8lMP0SL0mLXT7W5SatAPQrsBc27D0OcgS8Q4cTaS
	4/Xb5hLUMeHcm7lBJL8UQVpeM2V2z2rmFEmklpZNYju6jqDMJXg5jIs6cHcN/TS6MdHzLZsRooD
	K3KdRPiTjKQiN00B7nJJqBP+KYz3Nb5+7PUEzJ9zBGfzIbeIYBRqOX2p9rMvQ=
X-Received: by 2002:a05:6a00:2e93:b0:82f:2d48:f8fc with SMTP id d2e1a72fcca58-834eb3e4d01mr1774850b3a.6.1777445973470;
        Tue, 28 Apr 2026 23:59:33 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:32 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 05/11] of: reserved_mem: add linux,no-dump property support for reserved memory regions
Date: Wed, 29 Apr 2026 14:58:25 +0800
Message-ID: <20260429065831.1510858-6-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235934_371661_AA1C9644 
X-CRM114-Status: GOOD (  17.37  )
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

Add a 'no_dump' field to struct reserved_mem and parse the
'linux,no-dump' device tree property during reserved memory node
initialization. This property allows device tree authors to mark
specific reserved memory regions that should be excluded from kdump
vmcore dumps.

Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
typically contain data that is not useful for kernel crash analysis and
can significantly increase vmcore size. The 'linux,no-dump' property
provides a declarative way to indicate these regions should be filtered
out when constructing the elfcorehdr for kdump.

The property is named with a 'linux,' prefix because kdump/vmcore is
Linux-specific and the property is an OS hint rather than a hardware
description, matching existing properties such as 'linux,cma-default'
and 'linux,usable-memory-range'.

The 'linux,no-dump' property is only effective when the region:
 - Does not have 'no-map': these regions are already excluded from
   vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
 - Does not have 'reusable': CMA reusable regions are actively used by
   the kernel for movable page allocations, and their contents are
   valuable for crash analysis.

The no-dump status is also printed in the boot log alongside the
existing nomap and reusable flags for diagnostic purposes.

Corresponding dt-schema binding update:
  https://github.com/devicetree-org/dt-schema/pull/193

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 13 ++++++++-----
 include/linux/of_reserved_mem.h |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 93585af9f8a3..ac3d8b837d61 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -654,6 +654,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 {
 	int err = 0;
 	bool nomap;
+	bool reusable;
 
 	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
 
@@ -662,11 +663,14 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		return;
 	}
 
+	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	reusable = of_get_flat_dt_prop(node, "reusable", NULL) != NULL;
+
 	rmem->name = uname;
 	rmem->base = base;
 	rmem->size = size;
-
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	rmem->no_dump = !nomap && !reusable &&
+			of_get_flat_dt_prop(node, "linux,no-dump", NULL) != NULL;
 
 	err = __reserved_mem_init_node(rmem, node);
 	if (err != 0 && err != -ENODEV) {
@@ -680,13 +684,12 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		return;
 	} else {
 		phys_addr_t end = rmem->base + rmem->size - 1;
-		bool reusable =
-			(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
 
-		pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
+		pr_info("%pa..%pa (%lu KiB) %s %s %s %s\n",
 			&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
 			nomap ? "nomap" : "map",
 			reusable ? "reusable" : "non-reusable",
+			rmem->no_dump ? "no-dump" : "dump",
 			rmem->name ? rmem->name : "unknown");
 	}
 
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..29674f572673 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				no_dump;
 };
 
 struct reserved_mem_ops {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
