Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21DDCD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4GAJ8jGu117ZzIuyn/sR/BJJWlebuUFhx+9xxU/KW8=; b=lcIy8JZIiZ+y3a
	/jPJI0l8DdUTrPtDSN/RWBCj3TttlUrxnUN6yoh5uJBs3WNzojZaTfVCCDABFSDCEYaa5UEWjamNq
	HUDp6Uy2w7o4BXMiQCU1iJ1Z2mMSl7fKtWSZAqU8+GBcxD3RelaTaSu0WVhhQdyDpsotk3gZsOKCa
	z6apQBRuQXX3+ShXkRoS4WDjLc0wjtBVn9BqCubxBYETcb+/xg1C+K8NxhBGEt3cBiNlkCbc/5Z6k
	Z73gnU2D0pzj6zfZ+Yv4e979YPuWAZqwJmAXUSAbyPnFBtYu/fFJgPPiqcnlnQj+/CPtzQJOyGobX
	T0VzjfCV3w+AGVT2Hycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Z-000000047ld-1HKA;
	Wed, 20 May 2026 09:20:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Q-000000047UB-3bpk
	for linux-riscv@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=; b=GaZ61yC2nj6aLYGZeFCry9fDuH
	8z9+vpHkP+6Sv81vq8NB7Dzn7u2+5EQ0YC7ubT29gssdmJOowaKfq5n0zuDP5yqbkQYkW9PHSkdmU
	VeYDnGj3zfvZSmQ27BrHhW64jl4HyxQ35P+G+xB6PxSO4UHvcLozoOKOZdeDWhAIjoDkDMhyJQUv4
	9cWEbmBQqSeF7BqJkhXiQCZXpkvBI/gpcG9BlPbBhM2VzrhZJaN/ZtnQKmpamB6+ELrAz0zPySvW/
	DbLOgOPzh0cXZMUwSavJMqzwzAQtal+DKv+/58bp+K3We89jCXOAYhOxUqqj6ASiSIZtjfvkZqTzX
	DKLND4fw==;
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd66-0000000GKUJ-1AoD
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:20:19 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-839dc688d6cso1998691b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268813; x=1779873613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=;
        b=R+bzuuDuBpRsJQ6T5LJUpLNi4cHOs56qg8QtN7wIMaK0YvRs28ObcVOF+8fuxBnLOb
         Rxcito6xY2LHuvnrrIds4Ex3RkNZdkMA1Slq+DG21WW4sJF9wigNUjoZxta/lVhp/f1l
         VdLmTSyhi8xTenFc0SE1ozxy49hRVeYLYkoCd6NGBz919T84Do3Q/umy2YI147Yd4KbJ
         sLhBUOiuvwkie0rplCWYFenCahcNcbFypOyJPTmFZ+vEkd1LhT/MyCKOU0Dw1IkCvV6F
         tXxWff00/bvcCvbCUk8Fl3VrdQb/r+ZphJgYUD2NnYNauDTETT+S0wQz+DQVuf9buEf6
         I8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268813; x=1779873613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=;
        b=Y3LFfqrojkgWw3zdd+roAiu9kCP7QG9JhpLN63YkverAik7SD5slco5uS6PRMQJ4HK
         SchKuHkcCumAb8PxXpO118c8vnqZpaZNNcquIzaT4bb3rzowLanwhFsIWVnAHXuPiOoq
         ypXghGpvUyniVOePC1gdvhqgn6tmiJ4PQn3fm3i7Et7mVsBDgCjMxEP6JvA+HsPMXrlP
         7ex8DPeGPiMG8PUb9fG7I0zAa3hpWmTgN6d2nrZIYsN9yZN59d50rCVNBXAWb5IHONmN
         1s2rkOjBm7MvrVDjROugnxyiZS4D6WAdkuhUKIeQ4NOVDB0QPEbShFK7u/kSvQ2402Jr
         /CSA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZldlyYagaA4SZCjt3h5XGR/q/OlIpNpRbd2iFvtQ5wAEGHeH32NwxPCrY93OLAwf/he/MbttkbX8YIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcuw60UI6uHp6wVAVnRRJjVCWg5xMrlL/Rdesx/Dmi4OxiNIzY
	q+UdHIPTxDkNN7lT850mHybTJZEwixDAllWy/egFFAuESXo+lL8GLdNu
X-Gm-Gg: Acq92OEFSWuPapgARqyJinnbNuWAZ/S+kfPIM1r6+MQvBHq4FUsT2g42ppEgSufEMxu
	2q5hd5Ay5iLyh0KsW9Jk9SA4EJbazGIxoSx5ZqnRyszH+o/BVjY8Iqkcij3wEOmg+nnD3wLwm3P
	WXBnLvDc95VXIjS36KVVhJYxDcWE3JVOYip5voBjALortSiDzJBltQR66cWlnNyAnztEumegUUA
	xuiX6WAbZt1Yf5P9ShBZ8gsRf/RpWHSOekndtNpLOd6PQkEw1QETysnuyB8YZxqs1+f7OtJnps8
	1DERBiMytxYrJ3Q/hVobF0DqYGi3T89qhRhpQJPr90NLGJtqTEUmpyIWadqhGCs/KLGE5Zup4mi
	8gBq3GJqfJvjK+THKWBTp4SuCZK+0FO8JEy1piLUrYCqTwmtp8d/9X2VAkot+SNoVfxT4WaOaDi
	GGruugg8cRgAzkxYiukStg9vipd+PapnkSPORDgGnjFqbfV96K
X-Received: by 2002:a05:6a00:2295:b0:82f:832a:75cd with SMTP id d2e1a72fcca58-83f33d547ccmr23996834b3a.39.1779268812696;
        Wed, 20 May 2026 02:20:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:12 -0700 (PDT)
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
Subject: [PATCH v2 7/8] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:43 +0800
Message-ID: <20260520091844.592753-8-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102015_613749_47A7C45D 
X-CRM114-Status: GOOD (  10.66  )
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

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..c359cf714c79 100644
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
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
