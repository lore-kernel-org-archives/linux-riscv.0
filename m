Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AD3CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kYA/hysw/BonieVEej+ub6thpTW8g3F94NP1ALc55Lw=; b=rUlzFkTaiEhfuU
	bL0IlNWlR3zyXQx/7INIW+R9f3/LWYKbx3h243h4X2MEyyuATz0sz/a58JpVBnCoEJzmIV6Tc0xA3
	97XvQPESYzNk9bpZCG/ErgfUZePbBJilqO4nn0Y3vLYHCa7zC/dGT8F+FV1tgr/YNsJh4q5W9PtBe
	MCs5/yc9Q3sAYs53wOFlHGhq9WrIFRUm9EpnFC6y/m0W3CEvGaL7tJLsq00fWXXhkEb6HIjc08njg
	wUyMOOZGOb6g93AfY385dyOaK1jA/uU5cLFFBW+Uf0cfERvQFKh0EhZ+P0wfF6M3oP593dFs4BNQR
	yUlXR00Fy7NmX1XZlTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtFQ-00000008XF7-2AWw;
	Fri, 15 May 2026 14:10:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtFO-00000008XE8-02Jf
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:10:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b9358dd7f79so1500104466b.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778854236; x=1779459036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpAbwEPMmZHunefUXov3BCvB1DVZ1pCLobl0y+AYsyw=;
        b=AyWkL+AL4fZaIF5uAhx+zr0pd6beJjaRO8VQ0zu1QrtD5/lT32ZNbVm1K/c9gcUGrk
         Jh9Btm7QoK1dDhOrrlsIEvOkA900femVJxLyWD6zmG9nhYLa2cG6hnVqqXekN/t45xVH
         SbJHmYtSh8wAb6H6ULDCNH1QsMMzNp+hhBpHjHoZJTiTY6F0qarW5DQDTtG4AHmohY6V
         FEorlJJtApqSiBWKQX9y2PDvM8LsL5DNnoEBIA7FLgonmURq3/1OGIAvPhXo4ilkSYhp
         1MQhWFSPUA2j1O8996SZac06jOrxykAaeqRp8Af67nKhTAnN4myqonHR4qdhhmVj/ekD
         xHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854236; x=1779459036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpAbwEPMmZHunefUXov3BCvB1DVZ1pCLobl0y+AYsyw=;
        b=aemsCxyktGhn5BeCE9D8Ory6Mk4s9WNSbZtPm7G8P8hSBkbtTldIzwzTVPzTdEhey5
         npFX2o9E+KvueTORrx5q9ktCLvJCe03W/Yv2MDMaRxgUNr9o/DnwCgl1UPvuoaEU58A8
         pkktOX7LT6tMlK9nWoSGFhT0NeautrU6+sJKzncaDfQeGNEyvh7AgdWuJmDQhsvMh7lH
         ezsmC8hgGbZbZ44bps+kM+nPuzyMMkfPruxae5S3VlLPwgApWimHqABNpv7nLzbuTgd7
         WmubMR7DxhxSjTG+gSEbPfMCOh/KqfkpazSELxEelTHyWJjoJke6i9QnJ4eK3BqV4gE1
         Omcg==
X-Forwarded-Encrypted: i=1; AFNElJ/5U0f0fThIMxYrEtrYU6pf3gKSg+NrxzSuO0LapCKLUY14S0msvi0J9Yt4AD5ifwRX/WOOYVDHALaoCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx0k2SXXmlrpvqXR4CqGGhyPJNRaHnGKj4CMgUDiueCgNJN1Lz
	IAwJxlchA2PPy6s9h0pxSbey0kKCu4fEElxvGnACSMsOczj1iIpx06Xh
X-Gm-Gg: Acq92OElcc3iI2IcD901pOpyQ78q2molyrtCU6s9jd8oyRzB2cElM9ru1+rKLOye/D1
	0QzQY1z24OvAskcZun0ad9/SQFCVNYZPHKCF4URvZtStkZ1DEFfJ35iUHihtPPTpbwkthmaaoIe
	vVobgYOmSMQCI98hyexvatTWS/qfxDkTo+8TqIezEubBT0U+P0DQ3BK4jJjK6u1pHtI7WDhNkfz
	S3j6MeV0zEE7qLE0xXoiJO4rHMx8LW7rSCGFAQ0KKiiFiGz7rveNZ1c/auWDk7My7WDYK/nOsF6
	7QtE5Plktth1QdrZvqTB1w/2kEgur1HOPt5LERjedrsfPgtL0G8UGRZfv8BKT66VCewgobvLNyE
	SPha/EZNI3qCevjB5J3x3nPDPEpbxEVW414Fc5z0pxMmzhWcqs8ODJ3Ma1rfsmTKToXum2a/9vH
	xesyn3osWnPAROMex5VvgbPtGDKvqa8oNcYulBU0vxtw==
X-Received: by 2002:a17:907:9483:b0:bd2:bd43:b46c with SMTP id a640c23a62f3a-bd517979775mr242223566b.43.1778854235491;
        Fri, 15 May 2026 07:10:35 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.23.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm2115768a12.31.2026.05.15.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:10:34 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kees@kernel.org
Cc: alex@ghiti.fr,
	andy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <milant2002@gmail.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v3 0/2] riscv: lib: add optimized memcmp() and extend KUnit tests
Date: Fri, 15 May 2026 16:10:17 +0200
Message-ID: <20260515141019.1234037-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_071038_079949_ECC09A79 
X-CRM114-Status: UNSURE (   9.70  )
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

This v3 series introduces an optimized RISC-V memcmp() implementation and
extends the KUnit string tests to cover functional correctness and
benchmarking of memcmp().

The memcmp() implementation incorporates review feedback from earlier
versions, improving alignment handling, loop structure, Zbb usage, and
overall correctness.

The KUnit updates add comprehensive memcmp() test coverage and a benchmark
mode, with v3 addressing structural cleanups and style issues raised during
review.

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

---
v3 changes:
    - Split memcmp benchmark into wrapper (string_bench_memcmp) and worker
      function (do_string_bench_memcmp).
    - Removed all C99 mixed declarations; moved all variable declarations
      to the top of each function.
    - Converted len, iterations and loop counters in the benchmark to u64
      to avoid implicit casts.
    - Cleaned up spacing, indentation and minor style issues.
    - Added #if defined(CONFIG_RISCV_ISA_ZBB)... in  memcmp.S
    - Link to v2:https://lore.kernel.org/all/20260514121359.931999-1-milant2002@gmail.com/
		
v2 changes:
    - Added alignment checks for buffers to avoid expensive misaligned loads.
    - Optimized the loop using end-pointers to reduce per-iteration overhead.
    - Implemented word-aligned tail handling using ZBB shifts.
    - Removed redundant pointer equality (a0 == a1) check.
    - Retained BE support via #ifndef; ZBB rev8 is used for the LE fast-path.
    - Fixed KUnit build failures for Clang and non-benchmark configs.
    - Link to v1:https://lore.kernel.org/all/20260512141007.1193033-1-milant2002@gmail.com/
Milan Tripkovic (2):
  riscv: lib: add memcmp() implementation
  lib/string_kunit: extend benchmarks and unit test to memcmp()

 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 125 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        | 116 +++++++++++++++++++++++++++++
 5 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
