Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A062C624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHxlPBSFmTifkYHOSAA1De6A6bHZOg5ZlH/+sryVluU=; b=3K/nwUilIQrPvZ
	g9Jgc/S5dVw2Jai71IjgczDXsPH43KJQh5fgny2k9oLzQN6AOscVbI7P3ycliikntPLRuqMQgJ8ZU
	FXjxa/LltHEJVodqgl+bFkthX9qRtUQG8vX000gJBOk9zRowHxV0NDLrvCNL5fAuHLITcHoaimx/z
	vZXHrwuwbnbwyeG3QFPEsFzrWHayIIa45wc/pFT43e1UuFJsEue/AfBPOglWKmlBrvkGLrk6jJ+lq
	W7YNB3mNaEfVrRivQeDjP6zOI8myEiJ6GwXecx9TqsFQ99dHs/NMFJ0jfHeP9CZv4dntcPV5bPgGx
	NpUWfEcfC4hdNe/pqh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSl-0000000DwT2-3kv4;
	Wed, 02 Sep 2026 07:32:52 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSY-0000000DwG6-3CVB
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:32:49 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so237481a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334358; x=1788939158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDn9kL+O/DcgCowWQhzjL1E+vRjYGvPyhLWTC672vfE=;
        b=sKN6dp0xFA3KBsIyFai7kdNUjNZKjTCSeqnQEhg6IPD7/jKt6ExmPZ4N6WprLWJZ6W
         FCUUw6/lQrkY0Bms2oT8lcLrQo+9g/x+j+kF2kBbOOHQyoQwd8/MACzwkl4tb7W5kVA/
         XFXeSZ/ZUNrJQxD6szc8IyuJBdt6A4Ijwc9A/EaKeTTu2tz/L77VtXB94/7BV/edsrRc
         CNq8mF4SgCaLk1fFD0VV53sxxhZjivwE1U+k4hhIykyhkx4AVfhH20h1sAh2TaUJ1T4G
         KYM7k+Fw9GNb7V84H9vy8UHDQt6jc5w3v5FYTvnZNIcLWZin3b3KnP4hlOcmREuyrv6O
         2q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334358; x=1788939158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDn9kL+O/DcgCowWQhzjL1E+vRjYGvPyhLWTC672vfE=;
        b=gf+66xmqk6VLYswUR0IlygESFhfehp5HM2OS5tqclmvZ8UiAHntjwX6w1RNs7DB98q
         OQKLhIbk2Z09lLDhIezrRpQ4VHiSbawrgGCFmtq16EFEzA2a7UjrC0pUWBk5Ofeap0th
         eufuJt+7mY5RyDLZv8L3mb8wUDGOW1QSeSwQ8/nLjELRYvqiT4ja/4r259hDc6TzLGUc
         hhy+OThgXfKTzHulDRbBghgVu0NEPfC9NwtS0VH4esAnI4/Ol80BwJ3FCFv5RdMXv62S
         iVmv6cWJSTh3ruNrpvqjXG3v6iOrJ0vQsbutm+nnG+P8CdIOPWHaCNJgJSC++K/4Lk2/
         QTQw==
X-Forwarded-Encrypted: i=1; AKwUvByNiUQyvzahl5Kz7OamCLkaAdTNoBkubVUPWY5d9Q5Q1EXrjOMAeN9LNZkiPj98Il/O5eEWsGi35Ec5Sw==@lists.infradead.org
X-Gm-Message-State: AFuF++mt/NVrxw/6al0mfUnxE22ZxyfZDQkY0PGqKsjxVp04ymnzo2xS
	d6Ixn/Zii/YL/5mGKTINSzeutCyi5t6DKCC/5e62mXdPY9Kj85I2zvSG
X-Gm-Gg: AYBFou3tHyao/1EoGkEAokwoSQgttCgfUMd1GCREpYtSd75adyhxNANedilAT9K4Nl0
	+PHtf5IUOv/cA2mIGga4t6K7SJWbSB+469fym8F+MAZtVsvTm9QZGX680I6HA7u/cNOD9Xkc3bv
	SPtAlzxC6FuYm/T5gOa/OhOFP8tTJtRtsxkvQLy7OgER061/Elzt7dT5B3KhwMhNomb+T7+M+tQ
	fMmNkQqwhKF0DkZ7H0EYl1p/Znd7ogylqsE5lX4UOGyKFpZsdkqwCnDhinunsSm/57FFMc6QWuj
	U703CA01J6pW3k6Tzcl0lYLKgiKAKbVwNn3svsjycqomtOI5PTqPFL/eSSgSkd1hYq4wloZOB2N
	701v4Hf+nvD0KelWflATTfF288qPnuqtXAL6+kYDQVUnM4vNjDGbUNe8jxV0VdnbJA/Dk3m9aAe
	zGZD1vH97mXtYls2IPYSIl1vpiOvBp9koAmXqcng91XKJUPPrEH8P/ZESxCK9KN/HEaOFT6xtK
X-Received: by 2002:a05:6a00:391c:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-85ed444854fmr4147616b3a.0.1788334358011;
        Wed, 02 Sep 2026 00:32:38 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:36 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 05/10] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Wed,  2 Sep 2026 15:31:11 +0800
Message-ID: <20260902073116.802752-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003239_667933_1E3758A8 
X-CRM114-Status: GOOD (  12.62  )
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
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 3adee1ae120c..bd64cf585795 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,6 +270,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 {
 	struct crash_mem *cmem;
@@ -285,22 +291,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
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
