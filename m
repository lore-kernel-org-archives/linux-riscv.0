Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B888FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dp+y7jKGnEoB08CrE1wz2jwAGGA/GoohUyd88JkPUOI=; b=FYZFKE8X30fDUx
	YlI/YUbQImzwMvXFkdueZVtWKjFd99kuzu5aDohcaSSYxDW84c5myw7rKJDeU4e2VRRffTWePPe6P
	fBfNPnMsEa0n1tJ+hJ5bV7ZTth/0KQyA9CcqftQgEI+l8cQah3hyM+Fc84iFO/xy+NEyRmpbMwHs1
	KGqs2l5X0kWyGGQoDDq750wEAWNE+Oe77iS2qM/O0xXHcAugSK4pFXuw6UZthdHk+TY1o6S+3CAam
	DnZi8cZrWHf4+LyJVnZxGwURjHgFEedRanYHONqWfk+nGJKK9NAVolsuKTFWFdA6M9ceKKR2Wz9nl
	+U08onV4dLWwYCz1Q7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuD-0000000366R-48by;
	Wed, 29 Apr 2026 07:00:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuA-0000000362A-39FC
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Apr 2026 07:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=; b=k49kV+W0dbGv8p1tYk7izC4iQQ
	FPyJIZ/8ktpJCoPmQXCH9cZ7+D/olMqYu0MeG8JjHAEnthhvkYa+jMnhlyA4TcG9NOVoDNi9dYLOJ
	lgHoqguyhz6Ur3FxmlSmv09a9pFtBrkIlUJQx/acW1weQT6L0eGMyzJDpgx9xvZVHa/kmVs3/5Itv
	lQHHVFtvgmTl0tHAd9wjcHkFXB5AtnUEVbK4+iqb6EpygUbS0N+buolTkULDNqGvXeoeaxHO0Klih
	5NeALxKFxQ6nz+4BmLFiPMKfDsG8Zf/8jOfFPYAtUlTB4dNRZE7c328uWMVMZhLHcfFtS2b1uHrUh
	6ATS5IIw==;
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyu7-00000004iCq-1dka
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:17 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-82f1f6103afso5714845b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446013; x=1778050813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=WmSXNrhEVjbg9XQjpcmbBweiOctow6zt8L0Yvr2TyyfjfYUFsXeGfE6hEREg4wBAf5
         ana3HJ63efBHbQlNPO7RCAs61dIhGZAuHD56oIvjBNgS8SmMwHOEU9/djVSKvG7t5OSd
         +yFthVt46Sv5CNIpxKL8GSVSe92g/VudoTLz/c6I15jnb7sRSOzUj7G8m0efRKTfof2a
         bbKZXTqhAKXwHqAul8u41L+26DaqB9kTamfgm8rYaMS0uU89dhCifhnj2p49wLyVZHuy
         hUwn9YDsbGhO8HfT0/esOlzFHDgC8M6CdkabH4My5/nnqZmsshnQUF+f0jAT7i0LYTll
         LDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446013; x=1778050813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=aCdWtsPRdeSxvp1c7oKYIECGjbUjSTuBrASwLjMg7IXxqYFVUFV9v+jwO+QtmuXWG3
         FX+zkDbPDNLXLS721lyGM/aZ+MyQG+ibYg3JqkdG0jlpEuFHaUrYj4zSMZwR6WLzhyK4
         XxSHMFjNtX1oUSQMAFrapiTL+Qb1Nif2MV8QtVF7JJ+scox0bOV67mLdCUvHxojpFCBY
         2TBa1c6aZ95WOfdB2Ya1JP62NXHktYoQD9aept6NlDLYPBC64W76L5bX0O48n2fGTOOx
         Eh7tL91MKojz91W5Vwvp1aCvvFN/q1bKsy5u1PR4bOS3+GV4Dx0ZiK4wC8E8za9HqsUX
         L8OA==
X-Forwarded-Encrypted: i=1; AFNElJ86UA4a3FRW2nxg/2vhL4QUOGFQbGQTE3WFKMTKJP8IMUrebprIxU5FUcZN+vpQOmX0h/WCbWPo25OMvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzV0R7JljAgNgI2VeJccRAr8jdQXDEIyWpn8DozYhlMz5o7tOo
	mMRCDVdRgQSEbRRiG0TC8WQKP81Qv+OayniHx68xJUCaPxqCl/KFh45a
X-Gm-Gg: AeBDietyGCbiJoooH8qk1rkwgOqG7/F4IvVyzm6G4HYC1W2ulghtPy68ByZHETqbSRu
	z4xBatjyrfI6ij18ZTmy3INKHtXRSHIUcGUaMZbqakO2uJEe8nj96dxYz7ATiczqWlAurm/xlHG
	rtbapbmQq1u65BeVPScqt+Fx5icyDocy6Q/SIcAPzaXO9Ji+GSO02wWxwyFhYV4P9GuL6wliXZ5
	8LjYc2wMspoDLn54Gcfe8sGwHIcm0vgBz9m+TxLx5+uFPfnNlKR7ZiNvl5r2gwxHIJbbvrh+ylj
	MN6UKukqMKOiqNWObFpqWT9Go37HFGZetcaGFjm76++y/6jj5QcsBfl542WJzn6V92YXlb82KUb
	D3/QANAVtZZFnpWgncY4BpiwNk6d9IWkFRcqdFhPHjZCBOM1AUwRmWOKJ/608H1TIieJjYmcr3u
	RIbnwD4jgoka9QtGg0Eprt/2rRNYB0YqHIdYJaOW7RTMUiP+v3
X-Received: by 2002:a05:6a00:995:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-834ddb2d0d8mr6649550b3a.13.1777446012829;
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
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
Subject: [PATCH 09/11] riscv: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:29 +0800
Message-ID: <20260429065831.1510858-10-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_080015_870862_EF4369EA 
X-CRM114-Status: GOOD (  10.11  )
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

Apply the same no-dump reserved memory filtering to RISC-V kdump as was
done for arm64. Use of_reserved_mem_exclude_no_dump() to drop flagged
regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..012885ac9b79 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_exclude_no_dump(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
