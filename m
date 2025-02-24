Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28049C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9XJkzeGLcqA+dZcU0v8eukjDnk6XknPEETXIqwJPmA8=; b=eEY
	lYNPAkx4yq+gGEW2FKoQLZ0DbW3/0srrsCORTn2uc8BQuLV1rmsvhXD6oUY4lpUpdaDbom8arfyAB
	TsYryU1OH7ji5gOv/0E+9KCGK3uGrftKJQf621hEoFyL2YYJCAeMmM8n14tfrSJlwj4Qdee90o3IQ
	qCVtYQeJJ+/DpmAJdzURWjEGIngoADKO4PX++WmMKGZE6XY+j2SQirk50LIDgQztTkDC6kn86wsic
	hiQ2/3cOmjtrKWSLFSsfRE8GbACt7f4iYHIo3i6VVwpms3Bu3tbFrTO1hOTNpDELO8KF5OaGbGXpA
	Gkku0a3Hbse4caM5wahot0ylV4ldoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcYS-0000000Egh5-23sV;
	Mon, 24 Feb 2025 17:47:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcXk-0000000EgYs-0Mv7
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 17:47:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22104c4de96so81458035ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740419219; x=1741024019; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KREiZn2aUeoZOCpfTgjekuUtulMZqcTrq1Q4qOlgv1k=;
        b=Sb3EOcH0GGCrBdCwSSNTw6zsrfgOFHib/L13i7Ki+apCHXbvXh1OzSzTF9cLJ5gAh+
         HY9zDPHJLxHmPrr7LD2/rL/LjXYdBVLqQ/M5vdGAByJjbOs1fIJ5adHh+14Y0kQ0srII
         aQL5BxhGC732zo8K9in09IbsiLay1uaqhZ/MWJvUpchnJ8a9dczOJlfkFp90BQ638mw7
         Tpb96xDbZlM5ealWPxb5IaqV4VCXWJMj8WamKTzGzfKSrQeK1PmCZV9Ai9Wu6hetM22v
         GFvvHkBbNVQUBzprYXzc2+kiJb73Wiu9VNok6l4EsaIz421clEEdzauVtJb9Pr/kOHLg
         Gp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740419219; x=1741024019;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KREiZn2aUeoZOCpfTgjekuUtulMZqcTrq1Q4qOlgv1k=;
        b=Mi/OCRxO2rSCsPQd3VmGb1QynCfnYlIhFIRPzumIgnIJeT6eROuGY3QNV2o+gqo1DO
         zCLDCyqGeAIBkzFkTgg+jt4v3ahNQ9wNIEwHsXiad5GDAHE7izY1w5EjDS2B3hWJLtCS
         BC7lMI0Z6rasVU8pgb0cclEkeRrOspb9r+vmia4jxMtE8xo2l3GWArmBtmVw6V0hCe4Y
         iwCGnCdKY203yJjpOa+KEbbMXT3yh717q0b3RkwqDpv3UnKz/ZHqXN8NTxrJXkRaCW7j
         597rM4bB1Z0fnGNXKUVUQMBsVXBOv0aFkkH6zBv8Fa1T/gMCgCPjGyqDPZLWAXWKAXRt
         Aecw==
X-Gm-Message-State: AOJu0YygTToS2IeypPo7xs3hKBom2CZrmgz2/m/v8akLe3nvIjPIgHHS
	KhGHEZHYfkSRarthpC486v3T2ioJtKO5dvYEKVUJ5UAFYPZbQwfzd6nilGpdRzaoN0ZoKCTH/Q+
	X
X-Gm-Gg: ASbGncuygezlTQJPrhGeq3jW2mUn/jCjc60d78tK3FvhQ04VbBriABV3lYjeN3uFJKT
	hIyQDdJd0itKpZ1vANoIv9zK8W2wNv0moI7+cxbAOCuWyfBnizSEB998jVJoDWcZZa9zSq7+eMi
	MSgpdek8jD2xcFQT/60X8N9JH7xfMOcTvlNE3Yio+cyTzJLmyb9Z41hTmtfWWHQ3goLm5lWfacv
	be1jRhlZ1w2fEBW+k2NobKaP7VOuJGiBZ9UWupaPknFydo7pv0fR9PlZwMzWWvfJCYrBm8DM/tJ
	cj8lsf9iiEYImEWhaDwI
X-Google-Smtp-Source: AGHT+IEqwoMOmZ5jmn9mB/+E7cZKw/Jpq0fEXvB/J6j6P9smWjlAXhhBE2c8WtKUt9TrKsEvhEYJdA==
X-Received: by 2002:a17:903:188:b0:21f:3e2d:7d42 with SMTP id d9443c01a7336-22307b5ad60mr1717165ad.23.1740419218777;
        Mon, 24 Feb 2025 09:46:58 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d473sm182695845ad.166.2025.02.24.09.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:46:58 -0800 (PST)
Date: Mon, 24 Feb 2025 09:46:58 -0800 (PST)
X-Google-Original-Date: Mon, 24 Feb 2025 09:46:55 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.14-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_094700_126479_C331CC11 
X-CRM114-Status: GOOD (  13.79  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0957481849254235511=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0957481849254235511==
Content-Type: text/plain

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-rc5

for you to fetch changes up to 245aece3750d3692ae7a44516c1096936bded7ab:

  MAINTAINERS: Add myself as a riscv reviewer (2025-02-14 13:06:55 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.14-rc5

* A fix for cacheinfo DT probing to avoid reading non-boolean properties
  as booleans.
* A fix for cpufeature to use bitmap_equal() instead of memcmp(), so
  unused bits are ignored.
* Fixes for cmpxchg and futex cmpxchg that properly encode the sign
  extension requirements on inline asm, which results in spurious
  successes.  This manifests in at least inode_set_ctime_current, but is
  likely just a disaster waiting to happen.
* A fix for the rseq selftests, which was using an invalid constraint.
* A pair of fixes for signal frame size handling:
    * We were reserving space for an extra empty extension context
      header on systems with extended signal context, thus resulting in
      unnecessarily large allocations.
    * We weren't properly checking for available extensions before
      calculating the signal stack size, which resulted in undersized
      stack allocations on some systems (at least those with T-Head
      custom vectors).

Also, we've added Alex as a reviewer.  He's been helping out a ton
lately, thanks!

----------------------------------------------------------------
I've been sending PRs on Friday mornings, but these days the week seems to just
run away from me.  That happened the last two weeks and I've been meaning to
try Monday mornings for a while now, so I figured I'll just give it a shot.

Aside from that these all look fine to me: they build/boot like normal, aside
from a spurious Sparse warning in the cmpxchg code.  That might be worth
working around, but doesn't seem like it's worth delaying a fix for a nasty bug
on it.

----------------------------------------------------------------
Alexandre Ghiti (1):
      MAINTAINERS: Add myself as a riscv reviewer

Andreas Schwab (2):
      riscv/atomic: Do proper sign extension also for unsigned in arch_cmpxchg
      riscv/futex: sign extend compare value in atomic cmpxchg

Clément Léger (1):
      riscv: cpufeature: use bitmap_equal() instead of memcmp()

Rob Herring (1):
      riscv: cacheinfo: Use of_property_present() for non-boolean properties

Stafford Horne (1):
      rseq/selftests: Fix riscv rseq_offset_deref_addv inline asm

Yong-Xuan Wang (2):
      riscv: signal: fix signal frame size
      riscv: signal: fix signal_minsigstksz

 MAINTAINERS                                    |  1 +
 arch/riscv/include/asm/cmpxchg.h               |  2 +-
 arch/riscv/include/asm/futex.h                 |  2 +-
 arch/riscv/kernel/cacheinfo.c                  | 12 ++++++------
 arch/riscv/kernel/cpufeature.c                 |  2 +-
 arch/riscv/kernel/setup.c                      |  2 +-
 arch/riscv/kernel/signal.c                     |  6 ------
 tools/testing/selftests/rseq/rseq-riscv-bits.h |  6 +++---
 tools/testing/selftests/rseq/rseq-riscv.h      |  2 +-
 9 files changed, 15 insertions(+), 20 deletions(-)


--===============0957481849254235511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0957481849254235511==--
