Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18CBC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p7cgjMJIXOJdPoN7p+3ABvS4wtGhckFcn4h0zhdVJ9s=; b=QNNIRa+wXkmLjw
	fHnZCGaFr2VkP6Nz0mpzDCwIz42jOX3mCIQUIjss6wGloYnJQBESGN+JVDs3hggQ18CMjzV65orbF
	F2GmxiU+uHKd7Le5EVksHMDgbTEpZQ82xBCpYJSwNWMzenRmojjDeLsPIjCYPORAgAaMwkMQ00fo4
	lDlgtgcLRAFrREzyQEQazdF9H3Rj0jDtwc+sBiWBvjY7ljLFt0iEfLRGxyDde5AaffrhXr9LYXmTw
	+Gs+h8W4ylSzalJFJ+FqFdwMkL33qHv5gHLRcTGBrq8taDagEG7AGH/6as/oHmA8KFnllqhQxNOUD
	1dwZBZmgYAY085vraJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEza-0000000FE59-2TN6;
	Mon, 29 Jun 2026 16:37:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzY-0000000FE4O-2HUO
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 16:37:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8478a25f268so708767b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751071; x=1783355871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=;
        b=Vct/HXmJNygBir/JepxBAXm8Ei6WoOD/mWThqGnizaQ9xoDYN/HrFhqKFLJIKOi2uB
         gJVop+q9BVL9ptWWPV04XqtYXc3LlAbQNGoFAPKDaD08lsCgHCfNXSMOfrpsJSfa138k
         flo28sZ5A52kl7f/xTMNVKWnJVn9XuG0xCLir7iy+WvkLBYz2UcwSkUfyx+VF8U6sOJS
         xkrsrQ3ZDyg1DXZNu/fzEjrd6gMh2WK0QRStzpcBLdB5n58KwACVi1cHVAm2JX/JlR2z
         KeqTMgstllYWS62r74iGuGrH6LMmnOcEAjjZv2Yx93hX7FrFSIYEEee6DLKNcRHEueC7
         rDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751071; x=1783355871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=;
        b=JCA+Q+WeoOXf3acbUf7Q2ZqtsHzHvMwXE94fWlTz6UfJx0FBHm329uOt7SlT+kJJZL
         om/xxC/+coo5Rjz724/gwjMQw171QdY1VvwT5ksoMQUJlYeiPHSnLTKXXeaj24pyAFvN
         43TRCFqWtz27FY4XgMAxyZdW1OhwmBpWOa7htVBsYz3DuHS3Ut8GfepDHbzNI0cZR1oq
         WHL1d8djenmqL7Pt0MS3bDUUssUi1DezlnavyojEbdbjEdAubX/6Vjs9tzcm5Bh3UVe/
         1/87bbX7l86Luk6K24+9AIWkvLM6T0wGa+7QoRKsrhVoxmpBt2bDBylGtqkYgwwgq/yn
         nBag==
X-Forwarded-Encrypted: i=1; AFNElJ+W1I+4iGmvSPuKooV4o12yJHpm5KavHqvelAdYrPNDbh1H6yyz7OwFl4uQfFIX8KGIi6ZKd9QTuiyo3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQPvBIMaCS+YM4F04q7M1467WV1LW4fa7No5m4T4ROHxfScyZM
	BMott4QsrFsD8aEggDv5xqMlBIMenn416reCA3ePxb0n3HvQv/5LpOgj
X-Gm-Gg: AfdE7clsXkwfWmBFK5Lzx+0I0EqzlByX1dMKpSpg6jUvbJw+YmkEzcjoF5SZZJbYc0c
	UwBhDzC6TzhmRewSs5qlYsIvl3XjUzoiJ3vQC9m8CxAP/iZE8x6Vi2SQ6BYKoYoXBtAM1EXVV7N
	APwE7DR34oJfwAWDQo9xd/2+v5Vv5tElebEWu0LLoy6xtiqdzAvL+JvdgN9eulDUUNsz1gbXoJp
	clVSn8dMiBJDtRZN7TDt99qYCY6Sq5I0u8xvEI0aIOFpSVo2FaW5xOQDGFQhrwzTaZhRjrpiW0x
	PuPEqTFo+U8dSrit8G2Ay8K7u/8jm9HPjHiC2cDGuYwOn3jLo06cvxtYlukBLaTWVlWjg4Kngy8
	wim7Nw9UCwpXJ7VeQ+1MlhmrAXFyjewBAomqbODGVeBJDDoGEWGPM1BZXP6K33YySg7amAsQz23
	i1kVmoMDQ=
X-Received: by 2002:a05:6a00:92a5:b0:847:8337:64e4 with SMTP id d2e1a72fcca58-8479f1f553amr205069b3a.30.1782751071179;
        Mon, 29 Jun 2026 09:37:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:37:50 -0700 (PDT)
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
Subject: [PATCH v2 0/8] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Tue, 30 Jun 2026 01:37:28 +0900
Message-ID: <20260629163736.1606688-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093752_615205_35E2ECFD 
X-CRM114-Status: GOOD (  11.66  )
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

[1] https://lore.kernel.org/all/20260621145919.1453-1-ekffu200098@gmail.com/
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
 mm/hugetlb.c                           | 3 +--
 mm/mm_init.c                           | 3 +--
 9 files changed, 2 insertions(+), 27 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
