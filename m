Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133ECCCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 03:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaMWwlpPOfotHef0UGynCxbgrfQhRbxZVSlk/aDb334=; b=JYRFc6y7rVHLvx
	YMXeXcScQ7gse56E15QaYWA4Dy2O00tC4+VFCTQbIaDtY7+okZUWqhTZLwbVsEvDE8cRInORtHWLw
	9X70bBuSWcyiGT7ZM7Y7Ch0zpSW8F2LyEdLCViZWRHnAU9IMv1V42aEk/UOrmfs19a/iVybkSxuNS
	LpoIHX7fiWaPcXBI1CSM7P8FdM7LLhFkrqqBAmnPm/X+u6/0BLQSs0IMyA3AJg9OmkRFALzfr05yY
	iTNazoU18I+z9SqGXBBEMaL+mrDjHg94np8aU0/TnJpc2mJ32JDnLjSIBMUv+krfutK8D4JmXW3Uw
	tNFm0ztz2wStIFMBL2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKk-00000001nnF-0r27;
	Fri, 16 Oct 2026 03:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKj-00000001nmO-0rJS
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=; b=lnaPs8jf40GiM7nJk5XX99Cl5A
	j5x53p447ADjzbphULSRyDLpc7HM6ZPLvPqy6YEFADAMhY1N0CDEhCPqCaA/96/1iE4hTLORMlHkf
	ZlusZlRfKD6Ic2OvnvI+UiL+SnJax/7nG2/SvCGdOwbQQgthT3Wkucgvj3t5zeTXjsJum0Cmj3xkf
	dnFaiFBRMxnZr7de2OT/MfdVn7RUQfd327dNrHzdJ1or8DqN2k1p9ZrmwQ+A2nroF/Xm7tgiwnL16
	hU/aPFw9i8easXN95EZT6jeLPSZ1ij0nLob9/AQDrJmQZjJZeOe2IxgLA5JNxypGZWLofUhDt9TsP
	DYlM9N0A==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYKc-000000011z0-1Pas
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 03:10:11 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1533423a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 20:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120203; x=1792725003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=DByHZ0sQlqs+nOXWfNusvAxmOLHRSou5oJ/YKW/xS4lcZEwvtgK4r23EoNAKZbId9s
         EUiJS/ZAa3IGxY7kOxHV9/AJdW4DxTjW0w1ehbS7XHbWksG5cqsl9Bmu8A90t8qxMDnl
         ZVlOY1hpx8UUUoK/l9+ywqc3hr9PDZJ4ZrzuozoEQutw+gUM7Q4JVbrQu4OMFn5VPCUw
         9tLNMuF5sI+5m9GvMPlhCVGhSf+alAN78xf0tpRgpsHRyIQtonClVZxMvPw4JICGXPgw
         ygLhs4rLVgG7lIEC9+H2f2aAzjXX9vFs7QJgw7rFsofoJyF8bVaVA2xR1uRXoQrQXmUy
         vVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120203; x=1792725003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=gD4b6Dpsavz1ciMe8UXOFegV0RcZocb4QPFcfZ75Yyf3oiOnz2FvthIz6FrpMf6Qvd
         I7jIBgm0RSCM1HxZ9X8DvfTQJ2Bxul1yn51nYRby1y86f0+G55tWc0QR/gDQpLXxdmvW
         lHvC+6v3xOPTSDcqZ6l/ULw8XSlSfN49V/Nl2i8yNywa8VEIAmK3/om2K02C4vj7Z/25
         EHy1FNjglRUkXXFEKWRM3sUL03DW7YDjlqPmyhRGv5R8jtqJ/BF0NN5YFBMhbbbrHay/
         Xp/mf4Gn53jCLm168GmmJwEw/jSONKFEJJDTObyppw2X5UH3iYl843c/idffOVz/NIXH
         4k8A==
X-Forwarded-Encrypted: i=1; AKwUvBz1QA7kwoj5bGjrgjpoXlHY0e22ysCyHGAonPCmiJ6mtGp/PmMjvyb6flnnlm2aBN54iY6gu55HYoGlxw==@lists.infradead.org
X-Gm-Message-State: AFq9FYK7gslizfI39EoUVpGG7o+XI56MQAGABBGzJj9Gswz+KaFdKE5v
	kyT2/VO/deV50ugEWMEywazz/oU9aKLUYW+dPuVkrWyc5iUoxRBqLQ7q
X-Gm-Gg: AYBFou3/y7oXfyXD5mFUUZZq03lTo1qijvcaS/4bUL9d9eb+ppILj+L59CXFVAunk8l
	N9saF8uW05rDWCKf0u12qDt4yMv3e9q3jarSD5SU5ReZggwHlO8hO1kMB02uXmXdmtOmVKjdmZ7
	J98D8/u+euzRBSI7Zq2Dt1M5MCyZ831+1qT853x2W2PMCp5z/6wTBVOZ/FAaGN4KqPjyhbXlJ5j
	NiViRHBSXXo8echK4BJ4kDWNVoPu9Jc83eff9jlRJmemWQIS0AzR/P2tuSg9a4PSeDUogH555vq
	Dlen0uTixkLfosc40/gVPzMNXKexoq1AoJfewllZ1UkmhHGCSDeHGAAL8U5sJejVvanVzcuC1KU
	VxMoqCO8hmgtOeqUIa4z5cdGueTEAqw4ntf5s1Sc0NzMPxHMaEYYMsdIz2NNGF7vUaW6ZDM+CTX
	hIN2gCFWv6EqlZ6EKRBmo+DZFCsaw0JaDcINAxv5wCoOfgFA6UNatABPQGTITzlbEtB9hCif8Da
	FdYebyQUW8=
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ac7c52fe5amr6152592a91.50.1792120203082;
        Thu, 15 Oct 2026 20:10:03 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:02 -0700 (PDT)
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
Subject: [PATCH v8 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 16 Oct 2026 11:08:51 +0800
Message-ID: <20261016030855.4062882-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_041010_227352_793A5735 
X-CRM114-Status: GOOD (  12.18  )
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
