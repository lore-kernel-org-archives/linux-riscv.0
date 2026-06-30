Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95381C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cfeBa0ZejyeDluaMa29wANWI2WftUA5rYHInVZuLow4=; b=fZFRirDRGZ5/FE
	q+NLWtSSrdxLISovc6HOPQbn9e1zPUzIvA2hUoiZAOwTolkt+dI5gPsneiElcleBdHMRySDs8ZJJe
	0ae7rfpZlju5xTylq2zksMjLZcZ2B8tcWrPtKEClI9jEyXVsE8LTX1/vOWvQ26/hr9YHvg4dk+NUp
	EJPBsnSdRptHo+1iRH/cMyH95qAldpGCMKeMfF19cSq5Oa1KH96NXk0zzg1/bbAWFi60gcdgC8OVH
	TEYdQIMTMZSgJtU4C+Od7wgB+wHx5uMSnM27tzGB6Hv4GV6osplLI0xtrf27v2WP4KAJuvQK6Mlso
	SZFxkFVhotI/DI1ov5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea0j-0000000HKMg-3Rl5;
	Tue, 30 Jun 2026 15:04:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea0h-0000000HKLr-1HB8
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 15:04:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9c1779fc8so11332055ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831866; x=1783436666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkhDPMkIn7o4S+p4EJjWg1/vRnrXI2zfxcLsfb3CwqA=;
        b=JZNSfYAcVLBsnN+kmTtrwmHbIcfQwc/wqMDNXUbw3q6iv7S5sNuHWd7/LUxNm4E1h/
         tlDA2cLBLkBIrqDAXbjMd+U+zKaAH4l/zp0kuvC5pkg9IF+2ZjVpWSOJke8ANw0ixpId
         1mRpj2vb0c8kGSnf2/JBkdqu9fya4gd7osVZEZQ+3KsBZkhPqxdgQLZervC0VrmP7sV3
         BTNOEHK+4pddIT1v3qfdL0LdbPWJ9yrfj5rsN+U9ZhKjgTI6Lyxo3achPidrmh+NV/77
         SQVglXAHIMwqNunMHhGM71dSTE7+k5PPwpXlG2QHSRJUseWjVM0Ri48g4q920MpVXs91
         Bcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831866; x=1783436666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkhDPMkIn7o4S+p4EJjWg1/vRnrXI2zfxcLsfb3CwqA=;
        b=VH6KPMnDBsEAXm2W0IFjHxFYJGUR/BKIomMIVBjB/A+PI9mlMcwRbUi7NuRLzkpgY1
         RVM33i4ijEQiKCr7mnNFp/gw/cMwaSR39YAJJ1749iRuyVfpDTi2P4p0+1XRYXlryejU
         XtHz87nNirdzZR2Log1wuaKna62V+aC3xZLFSTGpD6Ic5VeMMowUm55xTtWweSx3xlud
         gZlBi/jb9lEg50kjscGdl8e1+/clOJFiT5TBlW5e2mjcGMMs2Ldid0/vRJQu8yEivNMr
         vxDYc2MqgKyd0T/2cvDLasxMdoUwx8QGcNKt7yPqkfO9XPVpYOD5apRiTMqqFHfmJQkW
         DLIA==
X-Forwarded-Encrypted: i=1; AHgh+Rol7V6HP/KIAGezHzMiM4cdEuGFdcRen9sCO+7fU5DPjK3reqCixJTHVXPwiLYWZ2xl9VzL1nMqqdSbyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWDW89SRndCYVgFfQB6CgDS4dlr6dCXzmBvMnv/qrwsT6/gL1C
	N7AYcWBOVspIhuigN/kSvCgHtqFbXPjdjRwQ23Pnl+JKVRFn4rm3jyL7
X-Gm-Gg: AfdE7cl/EiP2IMX0G5SiWcrmDZPqgzGoKl47MrCD17iG5K/NpyVymGdB3ugat+jb6+g
	jYsJsb7x9INnvoaoNU9ryeODy2DABIp6h1M4xNihlBnBaVKtjnzdpEuI+8PeIH4JfPrcwnwh1+p
	W/XxXlIa8sqxlOjvEBuLPGEc6xgaY/M/2EN0BOn/2cCdmly1ozgnEygXZQ2p+mtz9BIkOw/ORRF
	lRbchQ+wXlipW/3xiRRTOUODzFF8GgSkSahcRYgXE4jympvVOG4JF8oDdewXaFQVHqTqakUwyxW
	ziWsQk6QAo2aHFA/xESiX32JeVfiihDQh6/GZ2pqn2tL2emSoY8cQ8jQbBOvAazt7SC6F58qfaV
	rc1ze5Z4s9k60MO5eLkQIT1yRizsRqeBccSxANRbB7qky1AyaQuJ7Lx3APM/Tv6VSxVmjDy8Kxp
	7ghBu4ru8=
X-Received: by 2002:a17:902:e541:b0:2c9:97a7:71ac with SMTP id d9443c01a7336-2ca2ea23674mr32988355ad.39.1782831866110;
        Tue, 30 Jun 2026 08:04:26 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:25 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Nicholas Piggin <npiggin@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v3 0/8] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Wed,  1 Jul 2026 00:04:05 +0900
Message-ID: <20260630150413.1718632-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080427_515924_F8FDC212 
X-CRM114-Status: GOOD (  11.92  )
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

The memblock API guarantees that for_each_mem_range() and
for_each_mem_pfn_range() never return an invalid range, meaning start is
always less than end.

Several memblock callers still have unnecessary invalid range checks in
their loop bodies, so remove them.

Patches 1-6 cover for_each_mem_range() callers. memblock never stores a
zero-size region, so the range it returns always has start < end. Some
callers apply __va() or __phys_to_virt() before comparing, but these keep
start < end too, so the check is unreachable.

Patches 7-8 cover for_each_mem_pfn_range() callers. __next_mem_pfn_range()
skips any region that contains no whole page, so it only ever returns
start_pfn < end_pfn and the check is unnecessary.

For reference, commit 36ca7f4be809 ("arm64: mm: Remove bogus stop
condition from map_mem() loop") did a similar cleanup in arm64 map_mem().

All these checks are in different trees, so I split the change into one
patch per arch/subsystem. The patches are independent and can be applied
separately.

---
Changes from v1 [1]
- Add review-by, tested-by tags from v1
- Add missing simliar patches(5,6) to patch series
- Change base to rppt/for-next

Changes from v2 [2]
- Remove unused local variable and braces

[1] https://lore.kernel.org/all/20260621145919.1453-1-ekffu200098@gmail.com/
[2] https://lore.kernel.org/all/20260629163736.1606688-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (8):
  arm64: mm: remove unreachable invalid range check in
    kasan_init_shadow()
  LoongArch: remove unreachable invalid range check in kasan_init()
  riscv: remove unreachable invalid range check in
    create_linear_mapping_page_table()
  riscv: remove unreachable invalid range check in kasan_init()
  ARM: remove unreachable invalid range check in kasan_init()
  powerpc64/kasan: Remove unreachable invalid range check in
    kasan_init_phys_region()
  mm: remove unnecessary empty range check in
    early_calculate_totalpages()
  mm/hugetlb: remove unnecessary empty range check in
    hugetlb_bootmem_set_nodes()

 arch/arm/mm/kasan_init.c               | 6 ------
 arch/arm64/mm/kasan_init.c             | 3 ---
 arch/loongarch/mm/kasan_init.c         | 3 ---
 arch/powerpc/mm/kasan/init_book3e_64.c | 3 ---
 arch/powerpc/mm/kasan/init_book3s_64.c | 3 ---
 arch/riscv/mm/init.c                   | 2 --
 arch/riscv/mm/kasan_init.c             | 3 ---
 mm/hugetlb.c                           | 7 ++-----
 mm/mm_init.c                           | 3 +--
 9 files changed, 3 insertions(+), 30 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
