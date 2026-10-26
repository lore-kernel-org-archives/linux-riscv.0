Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459AE606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5ClS2nzH;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=KCYQ3d8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BgEoVzTIi7+FBTj7SLfIMj9m2pehf18qZC3nOPbCTs0=; b=5ClS2nzHJ1kA0vLgc7mIiazf5n
	FAi/7N/AZT86htg2lvOz7RWrkLqtHd6AnVcSyUgRaCY9sSWbhjkuy6hKYzfF5KmAai20SL8zlREHI
	jmH/w96JVstLtiNJs1bC4Jtt4NXkcY/AES1zixBiPZ8FePmnJ5U7iH1EvyIa2NZoQJo1UAjBrU+QY
	yOMqDeaEnr8ZI1P/slznmUkehUzZ+604ReKwWHjKevzr2ejD2ILgeMHaVkL/Kerljx298PaFEi+8U
	n/b6mPMgpJFnducHqK68lMA2eltNqbzmOgIw/Ye4UaPE8TfnFueOaJmiHZg3m1G2S+es0KDezAHET
	p46N1DGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGsa-000000021zG-2t41;
	Mon, 26 Oct 2026 09:20:32 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGsV-000000021yO-28fP
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 09:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793006433; x=1824542433;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=uGCeqIYPVTWeDJJfWeU+9/cQCa+F/WwI43wicP9K2Yw=;
  b=KCYQ3d8BC6LOh0U9g5HwITPm7r9BnX1sJzcDBeZ5l6L/JvUMZebjtQXl
   DYWSDuNO00kveejRx4PVjuuVatl8TGMcvI0d04BAG1toRlg2Ne8kloQQ0
   aucnJvjvITQfBye8tPGwYklkerVbT3MlmxQpF6FSTnQvG/AxbNrWejORx
   TKW9Iqvh6BYxXv19aLfjCFi2jvqgLYZleniJ//2TkenhmznntVhayDhn9
   74ObsS10DXNwCmsDn8TfeK0Z4PjEfMc+hJGCD0IctayG/vJyiumbcMkdF
   Gf80TEHiafkVevY8jKkaLV15WGyg8uQLD89kZzHXTCrNkp5QkChVW9f1b
   Q==;
X-CSE-ConnectionGUID: D3+XTIVyRBGhwyKqK8J34w==
X-CSE-MsgGUID: 190YVqLvRLaYd6P2aE8CiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:20:28 +0200
X-CSE-ConnectionGUID: CkXdoubjRnyo21NCJH6SIQ==
X-CSE-MsgGUID: pykcE/+eQSyNxiY+M3dD6w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 26 Oct 2026 11:28:12 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 26 Oct 2026 11:20:21 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 0/2] riscv: support CPUs with Zalrsc but not Zaamo
Date: Mon, 26 Oct 2026 11:20:01 +0200
Message-Id: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEEb32oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMD3Zyi4mTd/LycSt3kZAMzEyOjNNOkJEMloPqCotS0zAqwWdGxtbU
 A31/R3FsAAAA=
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
X-CRM114-CacheID: sfid-20261026_022028_072224_F0CC0D99 
X-CRM114-Status: GOOD (  14.33  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

 arch/riscv/Kconfig               | 23 +++++++++++++++++
 arch/riscv/Makefile              | 15 ++++++++---
 arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
 arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c          | 28 +++++++++++++++++---
 arch/riscv/kernel/entry.S        |  9 +++++++
 arch/riscv/kernel/head.S         | 14 ++++++++++
 9 files changed, 258 insertions(+), 9 deletions(-)
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
