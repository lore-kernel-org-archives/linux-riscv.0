Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1343CCD5BA4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWmp9XuWFPi9PP4sUj2qU1oXbzRLVWTzSK5AHxEH/M8=; b=br+F+Gp2l63koX
	VvjI/ypdcRLEjXCmwZYtXiaheRvo0Xji57dLs/sDmEmX8VJcFFXNgLuK+tZ7UwMAWMwf8bTNsjOh1
	wuLojVuzk9w/D/A1Qonne3zXTmluqSbvllxcylAP0hdWtJyG+zJD5nHN8ovErr8DhBXJusTGds45E
	HOW3iim1V2HqgwJOiLMkfJzdsxsT1cgSTiT+eKEf6mKYv3cCgZ58Hi9hKOt2T10sKrYt8lJ9eLTxU
	hUHNLAJ9s9Bm0vyX5aYM5BAQwKbfFhcZSqJ67Yfu/MW3fYP+thD81y9FFixBSGrHfwWsH9VJmN2Xv
	tL/VDySmHKcK+6TsSz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5y-000000046xc-22mJ;
	Wed, 20 May 2026 09:20:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5u-000000046vo-2eA2
	for linux-riscv@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=42F8CHAqoHCrwDp1G0wHxf9X6caXzIhKy/g2LWPqXJ4=; b=Vn+uANxFZvcBLb10f2iEaX+rlL
	+Og1cPzUBeEl8F6rNeLdwBoCcG9idXiwjHz6Uwwp4iFmqliJH7JQQ2u0b/yyLEl+Q/SpeoOI89o/Y
	JTdb37SQj+CjWm4SLSoAVGIQ77o4vF3fZ9DYYyYMzmXe6Z1aOnohebgJgCopRKY+ROoH/PurGCiIQ
	9rSp5MWYvfnUgDo2IY7CrwCwZYAeHnG158KislTmhQNnwDJ3Qt9URUggQrxaWVgrAusJ3crMNi8DS
	VheCg8pF0iQ7LmfnnMYjK6J/f3uy3R/6LdJtd0cxrSb5GC3xgEkfSLdUzIXXnESmEAe0hVB3g76qu
	5lNezetA==;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5p-0000000GKOo-0Zoz
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:20:00 +0000
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-837b39eb078so3141695b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268792; x=1779873592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42F8CHAqoHCrwDp1G0wHxf9X6caXzIhKy/g2LWPqXJ4=;
        b=To8a5coTJnJvj0ceMQHmLZhNfjyERA3xAfLIKZrzfmj02cI+5tOP5OHqxcrgUci/9s
         5IDX2DJ2Mbij/ZL4EVebcFWJnm5ap9ngorMN29pv88dV2qtSACDVwqfWp6opA/r/NqvU
         Fi/DYi842F6jwOtSzcHyZYyIgFyi3Qhr9nNupJokgihQoF0JW+IPdaaLVZiFWGQ4yFJ7
         7QFf42tGRQGdGT0ugbIFykk5jI0+QSoVL/BMlUK5LUqL/Lw4/RMcIRsz54x9uFWdf76m
         DsJdBS/TMEGB8c/dJQsAGWu/NLa3464Agc9d9/dn7Sa7KOACKQjzv1DmX55xqWPKuTDb
         vc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268792; x=1779873592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=42F8CHAqoHCrwDp1G0wHxf9X6caXzIhKy/g2LWPqXJ4=;
        b=WZ3OTY8M7p2PlIYTWX4IFM+3UoaHJZRLZmBZyBkh1ZkFKC4purfTUoT6mHQOEihLLQ
         6Ix8VcAMQy3eG34NNvolgnWlxFOr2/m5eOrGU6gKpOUO+SI6fock6vzSPy1n76H62QVC
         rxlSVOd+RgzNGb4GolaPvw4ULrnp8lBXOebWVR+B3cTfmff8GzbMS+eijCMBx2YVgDQm
         9yDM43k3ioWMF/i5q1wBx+NxFuPiLjFQJtgxMIbYQ1ITlYmvVWg0OkuTlmm5P2D1TiiW
         rDBGJbMCGTiJkCWMDWxFAkS9DPOvPV6hzYllGrp7Hi2aHLc2LdzpZXo6Kc0SBPrSgE+O
         2y8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qm60DTtbT1gueFBsHfvA0jClFAIFlPHuBB+FDeWOjo3zB6MNqkQBm1iZh1Q/rtoUnKQtbKahubDZWBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPDu/hEGITkhP1dw6eX95tphnr1Ap/vNunsW/YTIDKjluQcsg1
	CZV1ZdPxWTaxWCL7B8Z8Pkx4SwTUzdOlxnfdOmFjaIMD8D9YI0qYhDXA
X-Gm-Gg: Acq92OHCQuwWF4XRhD+BaB/gIxuPTotGVNMIt0c7dtpBbSzA/OHZUOOLpFCVPDftrZ1
	UWuOyuVwl8dPOzCXiNX/5wC95XYFDT3sfYFv7DWa8pTTt/suZ42EeZmvvyXQ6eitGp920B/4cPK
	U/gd7WW3DC5Ma62xgytH6RVa+ZPSuydHzn0uJOZbx48L8jl3SjhNor3zTaFm8Eevh/hzFlbPLwL
	mLJlJ4EN20PqEPNaXxnVjLtknam0WkfNM1u4lciwcQiM319YCK03mv7jPNruuRGswEF5VSQDZjF
	zKctJcT6mSeT4fvG4YHRukQ43bWrIye2RLX5eiXki4VQ9zPOCA+SFwkm4YMeU1Z0sqmVKkvtDUL
	tYhlVpHs1kC6lZ4WVgskJfSPYGfXtXJA29hT5XMt9FCnFLWv3mehuwoE78uTt4/s85TudGZcIs1
	VCXvL5smrTpy4XMwoFnDJ3Gn10LS/HjKhMLqG8Ow==
X-Received: by 2002:a05:6a00:ab0d:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-83f33b34ca2mr23552441b3a.19.1779268792063;
        Wed, 20 May 2026 02:19:52 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:51 -0700 (PDT)
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
Subject: [PATCH v2 5/8] of: reserved_mem: add kdump helpers to exclude non-dumpable regions
Date: Wed, 20 May 2026 17:18:41 +0800
Message-ID: <20260520091844.592753-6-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_101958_601487_14DE619E 
X-CRM114-Status: GOOD (  14.14  )
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

Add two helpers to exclude non-dumpable regions for arch-specific
code.

 - of_reserved_mem_kdump_nr_ranges() returns the count of regions
   that are not dumpable. Each excluded region may split an existing
   crash_mem range into two, so callers use this to calculate
   crash_mem allocation size.

 - of_reserved_mem_kdump_exclude() walks reserved_mem[] and calls
   crash_exclude_mem_range() for every non-dumpable region.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 34 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 6dfe9e03c535..ef9732865783 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
 
 #include "of_private.h"
 
@@ -851,6 +852,39 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+/*
+ * Count non-dumpable reserved regions. Excluding each one may split a
+ * crash_mem range in two, callers use this to size the allocation.
+ */
+unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].size && !reserved_mem[i].dumpable)
+			n++;
+	return n;
+}
+
+/* Exclude non-dumpable reserved regions from @cmem. */
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->size || r->dumpable)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 55a67cee41ea..70db99f1fbff 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -48,6 +49,9 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
 
+unsigned int of_reserved_mem_kdump_nr_ranges(void);
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
@@ -92,6 +96,16 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 {
 	return 0;
 }
+
+static inline unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	return 0;
+}
+
+static inline int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
