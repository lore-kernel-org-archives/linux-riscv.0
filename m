Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BF4C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EG4zqUtqN9eCBZRfzWP0vuu0T4Xa1ekz94nzBReUxuA=; b=TPZh9x6VhvdxRm
	+d9tTlE3AKK5uOt26/jNhI6d42zwr8ASoKRcfPTrX7YHgx8Kpc03lE9B7z799vY6CwQOlyt236Mah
	pU/JemSSOjee59n8lgEYZAz7Unln+m16fBENnU4+v/fDCMCJFLmSa1Pdwm+LKsnwv9N5M37VgKMqw
	iBsQTHAA2vR5Y4/7k941T9MpOcSWPC7RFx4NkKEgkVCw8stp8hMWOOpsnhehSiCuFnttPAZTnsJQ8
	+vzzsX1lXv635n+aaCBvGWhrMGbEVY5XOCs0rU/A2s3dIW5183T2bgJ8iIiSmDvsUmLqXGBnznL/h
	dclmP1vOBvtdpvOZwY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXC-00000005QrJ-1qO5;
	Thu, 06 Aug 2026 09:37:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXA-00000005QoE-1AyS
	for linux-riscv@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=; b=JXLxM5gqPBYsrSIefU0hzV+ved
	jEr/7ks4xICNIL+scWoMsPocZboJe7Akg07iYqxtV96ds02ISvRpexkRnbNJe5Z+g6Svi4A1h/KBa
	V/aUHTBiSItLT0VVqQIqyHPN9/76T6YE54SP7E31H6J1uOcyfoX/zBGPDjyoG4/ALOUC+MCs+yxrz
	9jkX6sBBz2sUA/UM9rQVK2mQdb5kWhzECqcbjnZ0HZrrNG6RhlrHn+N9dpRwQQYYgwgLNlb9Tkea2
	jCDs6XoXK3W85Mt7egt71sFi6g0rvk4ePsQoCJZHPpb/W60wJMaEFwoNbsFIjtoNbTY7sEYlQ5qDu
	7mi8OxXQ==;
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wruX6-0000000BNXE-3GTa
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 09:37:03 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1143351a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009018; x=1786613818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=;
        b=O54xxo+l8FLuoL8qdDPS3wXMses2/ZDQfxqvWbnFBiX2b7zkKty7vbpplVbeAbuxKV
         TmgQUj91fkTeo4R2h2arJ9MI1OyuMfRLVzWvc8/7xrpz5HQu6qrDIkrFuzfvUBWyPqAA
         kpBPBFVgU6VENvnDQVeXkzFY8Cl54N7AdsQ9snIhvHQDsfCD2VUAWFcNY9J7dB+aQ/HO
         JEObwT1vKOA+nATuqd2c7CN/QCVNiLJvN4C9+P8DlgReIJYUZ0Qg2vVuZwB+K8QZ2ddN
         atZNWQSyhnaAzXToHVRHypb07BB9NIpfITQ0a/M/9MQvTldFTpDigsklu7V9Aje90Z7b
         PCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009018; x=1786613818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=;
        b=lJuThJelb9dywuE0jPO2wYwFJbwbVlDQ/iaevrulb935keTKfLLas7k1/PPQo8rAw0
         aXRSUxBiEaspk97vDgMU8JvksL/EaB4TTKV8buWAyvEHVzkBU69jRsM1tiwebsh1Y1Ds
         z5GU5vYpkixtiUvQcOJC1DTJhCoU3zzobRJDaq/EdPcIj8plM1YAHCPkfh5d3K18mn4Q
         XgyAo3Zyj+C3IHU7inae77GbUyZNxCFeVoGZu2sGxbJqiBtYrzGCKY1ShUCyWp9MG6Cd
         v6Od9U97vzrnB7R+9hZPvDn0jt5MdgimFpPR295EsNewe0QlohRbc33FsGv/ZPQshIsM
         ZAkA==
X-Forwarded-Encrypted: i=1; AHgh+RpB3MjtReJWqZB0y1bDPiJxExWoBvFKOiQyiFoBE83ZM9aZ6hRHE2ueU9ufxQn059TSRh4ITG6Salazrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEqzn9KhMb+gmiONvNVnlV+ntlOOdNT2VRaGcB72xM/Ugoswfh
	TxRTGc0/5vY26Uq7h86d69C9H4Kzh+aJEofa5z5X9hQCGdCp95WbRrKy
X-Gm-Gg: AR+sD11HZ/GKIVQ9k44OZQw+IO5qUR9uZcuD7WKmxxKGKWMDlnfgh9S6W9rvwfAhk+J
	5y5mUi7n2XVkIazCCiYLoA0Xp520J7JucXs/2UckfA7J33jWEfA9OvfYpFKoxWYXU6eGDjYxMAZ
	srqhnD/9NrUa7S0oP0ZcRM+UITxg+pr/zV16CNl1o+NFE9kslT/y47/WADy8QUFzbAOsVA46h11
	EcU84VFlgZSOScnKG77qBsntrLM8JByadiSxw0I7FvnRowWteZmyNPaWS3boBqwm7CagkD0uOZf
	LJg7Djwfq/xCd4hHi1qltER/hDIJb0Re0RUprRrVO8jKMVeyvfpjvK35E9u7Txk8WTGFSTp4IKl
	zagsj/sz2+IMWNbqAW8dFM7+0dXZE02imrgKAifa41b/jg8EtaNx2qdAlgn7o95k1Pk+808gSuV
	41vqz3Ga5zanr8Se5/ZW6E2w0l6uA8xKs3+scFIWgTfL3yWZphJO+WNA0Kg2I2zXxDsu/Dfocvg
	w==
X-Received: by 2002:a05:6a00:2d81:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84f2dff6cd5mr14050456b3a.1.1786009018224;
        Thu, 06 Aug 2026 02:36:58 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:57 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 7/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Thu,  6 Aug 2026 17:35:18 +0800
Message-ID: <20260806093519.2907771-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_103700_971117_7663E2E1 
X-CRM114-Status: GOOD (  11.64  )
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
index 77285ae3ce60..fb78b7814f18 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,6 +269,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
@@ -284,22 +290,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
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
