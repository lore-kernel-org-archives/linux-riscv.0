Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C98BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYpnOAZOeVqXnDwhOSyZMjikWXvghRt5Ow1TdBgbN+M=; b=RjHedBggBxg/Fx
	vpLgqCdKgB9xPlZCkNsCwMfF8dsotEGVKBD1nTityvbzRjnVz5aGvdwmWh8aftyX+Q5T/SiO424L5
	J++hoQZDVTHl/YvWlMoxfXL1klzekQJGEkkbrb0NaQtmJmHns8zq/2YWTm3bhIwi6FeTjv1qH7Krc
	K5/DHhxi+5Maxi38/NuiclIwoVWBwmEUF2Ai+YoHhj1LAeuqAXQNDHn3gaYy8olhMjZPN8vIKTKB3
	7vjNMUp/t/52dZC5T7Fpd/aj+m14MTFyVfN+XhqDYLT0gJNAUBxlYcXIOOJDH2iBRgPYcJVndXf9E
	1yZ9PwkLly8e71Z6YLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD6-0000000GAFk-1GUd;
	Tue, 30 Jun 2026 07:48:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD4-0000000GA9q-0vJY
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=; b=Y2Bot9TANQTPSPTKWpN+HHBMEJ
	Kh+vj+fq5BHms+dprZrHtcw0IYn/OP8yxQMaLN6Ju5iVP3gf0WcYxz45YkrpC4Dox9S+YePwwz+BS
	c1Xn3pNi7nl8X3exacJzG3iX5y3G2pF6IO9GRyXVoowBwUDE9qVAgcU57i+3DdWzqRD2lt4aJAw6V
	Ns27pRS4j0fXnXj3GuFZ3DOXZ8Ch8qrFM9EdO7KpNWqX+DVUNwN6YWs1NuSwBa0qbgs69g4r8sow1
	RQS1VatXrMEV2ANEpk+s2bN2fEXKkDWESbu18F+DoaUi5eY5MEVBIHv6S4hFMs/xYJ2QyTHkhSrtO
	Wvpzs9ug==;
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD0-00000004XYT-34Ah
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:45 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2c979d03538so13168685ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805720; x=1783410520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=;
        b=PJhn2Hq2sx31wkhsPtNucYJx+zE2iibLxk5rr4zXMDzeMt6dzpRslxdiuTaULiJhHu
         TGmMnwvgdLtPEkYzVvjbBIyBPIR1okLCFhrTr/MlbzCvLJM6/CIx0uKxjk7ca67nxVNu
         hJUqG1GjdTp0KgZTw06M8s2u07At0L11URpS+i/j6lHxP3V74Xgrj97Tp6WSaCFLF5cV
         AhKGGqRF1zU3COwkvvh+NYn735xo8Cu8AQDqW2iA7mEEUo/Rc8O6eGvCEdhGwWwyi3GX
         OMiRz3MlkseA7M0TCFnibSrh7+QoYwiwAU337qc9p/WjBPgOceTx0VsOGMmGheFV2A5s
         pV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805720; x=1783410520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=;
        b=kUMWRgkwJSwmyTZLrwUa0RiunQLF29+Pj77REgOOx5QH3Z9HrhC29e9112Ln1kKE79
         o0pu3Jgmf1auPrw6AYwTsJ2LkJqTa7UhqfpyA6JhdllM1tavZWdPXslUhq1aLzBZWqTa
         s5Vz9XFYiyPbvTPv3BLdIaZTfcH1kn494Q7SZ8C3Ezc0vCXMcrS9OrpJdAa1t+GfAHrL
         Q56tf1U149U6xCFkNKV3IRWwTks3iTY9L87LGVay+GkEe9qqYH1coyU3VrGiwcE5VtcE
         ajF9d9j+lPM4uSBN02nCil3xhKJwOfyzf31okCqwBknDod5olV6KIDMETP2WXaWLtAIA
         6WVw==
X-Forwarded-Encrypted: i=1; AHgh+RpC1eUaX4+eZ2ABdZ3UO0Jfu+NQah/6OFx7/YoiQWwtvoeqUPWHe/FkHbZGiqVVFz/TFmvVNfIkYyE5YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRzXG5F4ixlp2MWEZTcR69i84p1tHfpOSH2wsNBumg3cxyBGus
	q0nktUxa+2AxuXe7SmyZ66f7fm5a2ajP22cJ/cDwaBUWEOiMxh6MM/am
X-Gm-Gg: AfdE7cmmAlfxzLHVDsXLNgpS8/9szqKsEhq8rcPaSXrMZb5n9H0hX5QDWkX3oWXlcfo
	kIKG5USYMABa8FLqqT8tmhXr3yQj32KcuSUBvcBMme+yW+h1z5FdpeFg4G7bbJRwoB4UcpfbW39
	oO+Y9iIH8tccGCOm/Ixyn1uP/Gf9yaun3I/XIDILX7wVyrzgBVvt7/q0V7Qvl4GSuNrYxUN8lJh
	i3Imr7l3ItHcWa4RtbqQHFifjEm4NUTAFssNRpeBZDDh8JmWqX35woNvwgeJwuk4Zo2kp1DCcFj
	PLX3dfwXzXHjv8LioDnLV7FgqdjBQ64H/MkfXH1g3CPmTESDwBE4JRMmhSodO2eWvAjoqGNQatx
	rHTL4Ek5O0x8M4yWc1mZMu7XHyZvT/pNsrYikSI4LhaY6zXYY5qA0qi/51KWHs9Nuxh2BMjVpOo
	w+Bgn9FPVWh7fsqLjBEIRhBA+7Yw==
X-Received: by 2002:a17:902:ecc1:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2ca2d52aa74mr18805135ad.4.1782805719998;
        Tue, 30 Jun 2026 00:48:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:39 -0700 (PDT)
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
Subject: [PATCH v4 07/10] of: reserved_mem: add kdump helpers to exclude non-dumpable regions
Date: Tue, 30 Jun 2026 15:47:11 +0800
Message-ID: <20260630074715.4126796-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084842_967481_D990D4D9 
X-CRM114-Status: GOOD (  15.65  )
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
index 9db0502989c3..c83ef88dffe2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
 
 #include "of_private.h"
 
@@ -856,6 +857,39 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
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
