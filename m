Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09815CCA479
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CfFOCgdtpKanZnKDeARmm/Ric3PF4Uu3wTC9YwKirtc=; b=wBZej/xF/yn6KV
	/BeCsp/1Ig7bLhdBEWD0jy2qaG8PFProsMkE1qt0bYK33RzGCHTz3edLcmURHOjOouccYEtZPGPSj
	C0AjBX5QU86f3ZoWnrdqxu0VMODxenRoVXjN6BASrYgeishd3jVqrPFfL+mHGkaA2QU3P9T4kbnXE
	dDDVtx3ZbS5bvcF70NUCHV24kHYXOURErZJ00KDWCPC50p0zt3hNhyVCZwOZkPVsx0KVfjQSQTPWI
	4D2z0XFXRgdPN/i4zJPlfqXId5Bl9vvC7lZUqt5/BSmmg90nm6cajk7TF7SnqGL+komJWm5tKb0J9
	WPRFpnf1G7osnOcU+iGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCgSr-00Ftag-Ai; Sat, 16 Jul 2022 12:00:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCgSo-00FtYP-Bm
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 12:00:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C50B7B800C1;
	Sat, 16 Jul 2022 11:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E2AC34114;
	Sat, 16 Jul 2022 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657972798;
	bh=uWknjv9iyysb1D8/c/tCyynwCW0YgY59rWbTdulggO8=;
	h=From:To:Cc:Subject:Date:From;
	b=foj8ufD3mzyY0cPeeBMtmcpy130fINHKTmg/JHrjJckrv+XUpIQm2H+3OSwpCkz4Q
	 vUNArejhY6g8S9RMuRwrElGWpjeaGjyj6dE4SIpK88TGAluxNBylvzBAInpkXGRBrV
	 0EuifgSSI9rU7G1koYXCKhMsWpV2THBk/7+sihyGHeFaKIegW7KZH90JjDJ/MWmp5F
	 JDrSe90nTHuQonBnE3+clROiqf52Du93+ho6Kt+USa2r7Dgl+GD/pFaS4ZoIfjimFO
	 D+N1Z4m5qSUhHsPQVcoekoJ0UGOlJDcKVw0HNKOdsidUygvlgCeRyB9EVdKugSEZR2
	 tbbFN4B5gCdzQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH v6 0/2] use static key to optimize pgtable_l4_enabled
Date: Sat, 16 Jul 2022 19:50:57 +0800
Message-Id: <20220716115059.3509-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_050002_573601_60043A2F 
X-CRM114-Status: GOOD (  11.91  )
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

The pgtable_l4|[l5]_enabled check sits at hot code path, performance
is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
boot, so static key can be used to solve the performance issue[1].

An unified way static key was introduced in [2], but it only targets
riscv isa extension. We dunno whether SV48 and SV57 will be considered
as isa extension, so the unified solution isn't used for
pgtable_l4[l5]_enabled now.

patch1 fixes a NULL pointer deference if static key is used a bit earlier.
patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
[2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t

Since v5:
 - Use DECLARE_STATIC_KEY_FALSE

Since v4:
 - rebased on v5.19-rcN
 - collect Reviewed-by tags
 - Fix kernel panic issue if SPARSEMEM is enabled by moving the
   riscv_finalise_pgtable_lx() after sparse_init()

Since v3:
 - fix W=1 call to undeclared function 'static_branch_likely' error

Since v2:
 - move the W=1 warning fix to a separate patch
 - move the unified way to use static key to a new patch series.

Since v1:
 - Add a W=1 warning fix
 - Fix W=1 error
 - Based on v5.18-rcN, since SV57 support is added, so convert
   pgtable_l5_enabled as well.

Jisheng Zhang (2):
  riscv: move sbi_init() earlier before jump_label_init()
  riscv: turn pgtable_l4|[l5]_enabled to static key for RV64

 arch/riscv/include/asm/pgalloc.h    | 16 ++++----
 arch/riscv/include/asm/pgtable-32.h |  3 ++
 arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
 arch/riscv/include/asm/pgtable.h    |  5 +--
 arch/riscv/kernel/cpu.c             |  4 +-
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
 arch/riscv/mm/kasan_init.c          | 16 ++++----
 8 files changed, 104 insertions(+), 66 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
