Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2679BCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBMMsQ8UogLsIN2bg1Se57iPVT4gElyPJ4P7qXwOO4U=; b=07CfWLsji3yhWi
	x1Qo40kzRF/Q1P948oSdr3kA4RItx9Cw5pxPjbj7RtrR3oEcNi33BydMHXdwVhy7nDu+AzNos4FCF
	0hRW6B5T72bdP0J/zSYIePUvDfF1M/NcmV0mUW6RAu6W/3iKkd0CZzMRdoHc1YSPjM78aWbud5mYI
	WIMEVSAJ6UtIAfE1RbVEWHaH/fh9+4jwbtUp9AxzwIwoQMQyZvOqPLh4vGqStdJgskgsXC7UK/FsB
	B9LemVQi5L3WsovuZJ8rHHMTmx0BQYCGys8nCw9LSfQiRoYcaiZvIJRvwc6fcDPTBFx5kGNuQirlG
	ts8QTA3VmXP+VLk+JyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6T-000000047b4-3Ms7;
	Wed, 20 May 2026 09:20:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6N-000000047No-1PAZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=; b=g7Onznvcs0XhzERHUBYQ5fneOI
	Kci/WuD4GoqOEDksbr6f9weov2DXXKGpp7pfJCpqzuXddRJ2ReK0n501uPiXDcY8QMfNfz73sHmr4
	XGdMBMY72xbK1Bku5RLInnB0Fv5W9UrjxNNJtweTNM1fllz3f5zxf/WbstH94DrwJV70EesJgXGCx
	CA0ORTLikzX5zJWdLk6uTN9YdSUi4keiS6koGPcqhvuIvc2vZMCnFzEAB5bqowTc7tHnSlz2Ng7//
	1yH9fwOCZ7JrveVPPgyccxaoieUwaT6ZWU4CefWx7+cAwTvZJcrVwR1DHcs8jRgPckxlObUu6WqZu
	ml8JpfKw==;
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6K-00000006xPd-24hy
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:20:30 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c828daf83e2so2122208a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268823; x=1779873623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=aatzxvewVTZFD6z/0FjgUJlHl0hc782ArKybEwJhH75negObd/2TaWh+JUvNhNX/cv
         4Jv0JbE2bbrs73srqlxtZgud9lSSyVuiksd7MTpafngRc05UR4hzQCutjU++nP8zKJrP
         sD7aOZTzqpilHsAKY2NNvrRhgd3PXTdeJvmc6HpnXSrci+z1Vdphhuw9ufrSXkaqd0UL
         sQp0LBdkrNwcEfvvl/WNHIo7mz/qw+T1NCrC+kH7yU9sSctRFIpiV+uM7gtdeAN0GCRM
         gFRfZG6uxuEAsSCvdxHCiIL8qmaP41feDK0y8ur2S1YMYVzDRuTN6PGuEVrmViqeMtr1
         4eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268823; x=1779873623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=PjbJoS0YCCzTO7qaeZ7Rg2AP0jNxmLKLtyLgQnfaOkLAT/OSYCQ2ChjejUfVNUMFqR
         IVz3P3AVZ+5jas8MRM93wywrbCXrCCPV/SgyP5uJp4MlFFbheza47VFtPExjElSILjoa
         63xWj8yKAEN30Ls/zcsvRU7PzcyDWxuYYYO7h4LEJJdqi0VPyvFpKDBKXjWYpuAyvqHn
         OzpszI4Q4GpciFvacqOFD6OqnRCpwNsazkS2uirSds3+bm67MbwjMXaR4WGeG/OSLmRz
         w0FjzWVbomodzX170zpN9EXQdtAy8vW9AQlSARTGw9qo9cEmmfkChzv+PVXh4G7Y4wyp
         TNGg==
X-Forwarded-Encrypted: i=1; AFNElJ/hO6Tr6289yE54JiBRDUt2v5dDccb11ubD8EfWQbWSv7LntFe6IX/FAwnBld334PEhWwgOoKVmcj0LBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRGhxHDeqJ+5hfSdX9IkHV9xB3NX4NJc39L+Xd47AeG0KA3p7x
	PLgSvSitYTMWPgUB0vsGRFojvdHv+9Huh9jEjckaB8yi/Cz3RjhitgwT
X-Gm-Gg: Acq92OFZJHsRPP1FHUc9R1qOcF7xmqaWhj3pxr0l+IgefWsojoK5Ktr/Ua8vl0E+Vu7
	5ai78FZd4/POAbXSZxzOTGbW/Mx+8XV+HfEZiVxY/Eii1gqKFJUiG/ccgwjg4Ru27aRlTls8Jy5
	2TqAer7xvvU5I/+wfyvv8SAfoNZbOeVE/i7J4RkxJWhXgSR/na1nrViUpW+RgAXSB4FKPLrQBSQ
	OylmM0iqETlC2WoOBUtdz480IstQqMCfP7eyaWPUXQs5eJqcrzrM4Z/jNkhcdKVPPcF+dNhrqGs
	Z9zDYAf4qMzb75eHe4IYKiNnfLWVW4mBAGb3BFwYRQv2W+7wumAe9W1S0aNYya9RWGOoGQLMiaO
	d0Ut4xHMCl7iMpoa7kGz6ttK1h/TsMaCTOxnD9XIToAWD3AsXHoLssPTWYp6B46eLiNRc35LEH7
	ZloQOauBdrSaTCE3hmKGGIUvjxRaETIWlARxFn+A==
X-Received: by 2002:a05:6a00:2e9f:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-83f33c391cfmr24600140b3a.21.1779268822961;
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
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
Subject: [PATCH v2 8/8] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:44 +0800
Message-ID: <20260520091844.592753-9-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102028_838074_AF462BC9 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..c5cead362d2d 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
