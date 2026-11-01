Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D6C606A324
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pVuYMe4J;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=c2rp+mBO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vu+EpUqIf0aMeltaCbj9Cuat7sf+sGF3tOa6h+l/Eeo=; b=pVuYMe4JaUYSY4jaV/BVjfNR98
	lTUdjH537RsLGitQBrvmhAmEq7ooBtYThb69LTtiCTxId2diy1He0IIcdnCL2+qi2NCSrZBq6/F+m
	1ik9unUY4Ra7wtZuhQlJjC9ptZVF8QG7mZJLVzoq/yFwg8iqzzyVmtTLpyBUhEi457PaA7YVQ7yi9
	SRCJdjx8bKY2s+RwT86eDi/3p7C9Grg4XyPpw6nJQjwjnpRG6KEYI9ERdM+foPCeMHe+uLx3dePp6
	BH7IQFMvJCcpZx90cz2tO5TRkpLzBdn9h3MsDZWv809kKXrELLKNzbgRlrVxJsdGSZA48HTlJRPCG
	MX650iqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV2c-0000000EDWk-1Kw6;
	Sun, 01 Nov 2026 12:52:06 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV2Z-0000000EDUx-1KuC
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 12:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793537523; x=1825073523;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=fzO6/tBvzjG5tEeJvVUYifVW+dbAyvdgAGc9/Aw6eXU=;
  b=c2rp+mBOz7Tp9b0psvsFjcbqS+JN1LTVbwNf7rycivtIXpOjQiSChC/M
   7MkWxPIkm9/Cd9Xm6Bu/0FDsJjPKbEKB9KIAiqn1UMRx30fcSatFEIwad
   TetGlYr2NXtAhvxk7BWuRmQwXRG3rNpXFX4Y8KnhUuYIXQAyeZeJFbiJ/
   VIR2r+rkPpJ+kgBX2RMvGkr8bseFbzrgP2uYS19J3QlEqHjJ6Xg/tW59g
   WtsnOZ7OrZmORrUKfW9vAEiVRZWfp7nv598ASZhzQohPsPOK12LxYjzGt
   pTS79prEg+yPZt6XJgYV9CX5w3eQEfLqmw3U+K3JKsd5Vol594Lwph5Wu
   A==;
X-CSE-ConnectionGUID: E/pjsYqmQYSnpQq2uGcVKQ==
X-CSE-MsgGUID: pyApzvqSRO6CZh0rqJSjZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 14:51:58 +0200
X-CSE-ConnectionGUID: t2vqmZwwQ1KLb1z0tZwntA==
X-CSE-MsgGUID: hNNBhcZ5R+iVMtXNsCB+tw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 01 Nov 2026 14:59:56 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 01 Nov 2026 14:51:56 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v4 0/2] riscv: support CPUs with Zalrsc but not Zaamo
Date: Sun, 01 Nov 2026 14:51:38 +0200
Message-Id: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANs152oC/03MQQ7CIBCF4as0sxYDtDbWlfcwXcg42EloMWCIp
 OHuIisXs/gnL98OkQJThEu3Q6DEkf1WYzh0gMt9e5LgR23QUo9SaSlciCj85rJAlOOgtT0Zo6D
 uX4Esf5p1m2svHN8+5Ean/vdtiqr3p6ReSEGoJzyrSVqjrqs37CjTEf0KcynlCy9OJXOlAAAA
X-Change-ID: 20260120-lrsc-only-cc06422f5bb1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_045203_851561_7165B806 
X-CRM114-Status: GOOD (  13.81  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
(LR/SC). Linux has so far required the whole A extension.

MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
trap into SBI. I measured typical userspace atomics on this CPU: an
LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
ratio applies to kernel refcounts, bitops, xchg and futexes, so the
kernel needs to emit LR/SC when Zaamo is not implemented.

Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
ADAS and autonomous driving. Kernel atomics are on the scheduling,
memory-management and driver paths of that product, so the emulated
AMO cost is not acceptable there.

This series keeps today's default: both extensions on, -march still
contains "a", generated code is unchanged. Turning Zaamo off is a
NONPORTABLE choice. The resulting kernel matches one -march, which
userspace has to use as well, so a runtime alternative would not
produce a portable image.

Zalrsc stays mandatory. cmpxchg, conditional atomics and futex CAS are
already LR/SC sequences; Zaamo cannot replace them. BPF atomic ops
still emit AMO and remain unsupported on a Zalrsc-only kernel.

[1] https://mips.com/products/hardware/p8700/

Changes in v4:
- Require a compiler that accepts _zalrsc in -march before Zaamo can
  be disabled. GCC 15.1 introduces that support. Older compilers keep
  Zaamo enabled and -march keeps "a".
- Link to v3: https://patch.msgid.link/20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com

Changes in v3:
- Make Zalrsc mandatory. cmpxchg and the conditional atomics already
  use LR/SC, so RISCV_ISA_ZALRSC can no longer be turned off.
- Check AMO and LR/SC support independently. A kernel that emits both
  requires "a", or both "zaamo" and "zalrsc".
- Put the LR/SC bitop sequence in its own block so two inlined
  set_bit or clear_bit calls compile.
- Remove the LR/SC loop that ran after the hart lottery and accessed
  address 1. Build the lottery increment with add so RV32 assembles.
- Add an exception-table entry for sc as well as lr in the futex
  LR/SC helper.

Changes in v2:
- Switch from a runtime choice of atomic implementation to a
  compile-time one, gated by NONPORTABLE.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Vladimir Kondratiev (2):
      riscv: build kernel atomics from LR/SC when Zaamo is disabled
      riscv: accept the atomic extensions this kernel was built with

 arch/riscv/Kconfig               | 32 +++++++++++++++++++++++
 arch/riscv/Makefile              | 15 ++++++++---
 arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
 arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c          | 28 +++++++++++++++++---
 arch/riscv/kernel/entry.S        |  9 +++++++
 arch/riscv/kernel/head.S         | 14 ++++++++++
 9 files changed, 267 insertions(+), 9 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260120-lrsc-only-cc06422f5bb1

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
