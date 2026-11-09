Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C906D606A325
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbzGqvLa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9+zhOrB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tYd3HrgL34p5pifEQ8vXbKakcX7qnzzQfcTV4UM1kHs=; b=ZbzGqvLaUN1DhsKyBdwWqhYhF0
	mDsqVUZPIhYpbkkjbxMxUzAnlUGGio5oLEOEgVxphM1/egd1vokUe0QatiP19amE280vhc38i52s5
	Y9AWi76GxxfViZ9KEvLHNYWnFFroM1RaWor8PkpxNXykyvbGewtFyvikOJdUmbZ1ikkmqYAV4wjuT
	mbXIyfE5SS70X/ngm5pfgKMxw9EhdrPLZyu+PM0AgZrkWCBPC8HKTv1Lr5GGbuBcebWg5Jxv3abpZ
	gLq72RV3aD4kFEmVM2hazKakEOixwsp5bYJayc4feX4jU5J5Q0ZRbStYX/6CUocIbAm9ds+ounH7k
	0+bV99eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO4F-00000000bCR-0e33;
	Mon, 09 Nov 2026 12:01:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO4D-00000000bCI-3d0O
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:01:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19B3561CEC;
	Mon,  9 Nov 2026 12:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90851F0089F;
	Mon,  9 Nov 2026 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225700;
	bh=PKOCGL5PIUh+iIhYhoT2eo6Jh8jb4ovmpmj5cMu0mOM=;
	h=From:To:Cc:Subject:Date;
	b=g9+zhOrBYHMFIDH+YNar3XAFNMIY1Jprc27Y8kgQZLsDDW3hrnc7EzBhpEpqm08xa
	 CQES66TAbDFIC2KcmOq/FJ1NaOYkY+sPfeEOsQ8+L49DzVwsVk26xsHue5bLZBb0WL
	 Ec3WNsZnTV/VAnRGtmJFBqA/mW/VU1q7IX/NcI/MparpkHTPUYPfMwdN0ge7Y12m40
	 ov63WznnnSzH7w+f6tuDNIi1VIrxdAECCgiXUowYisKSfwzPB2+1uOFmOPMc4DgfWf
	 +qEfqPImqNGnDLxvl+HmbBb69aRlv+g7swQdxOEYZmhpBwAlTY7AhhUOHAvOZ1q8bY
	 +CjQ72hmLoZ4Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: Keep helpers used by noinstr code in noinstr text
Date: Mon,  9 Nov 2026 19:41:27 +0800
Message-ID: <20261109114129.20260-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A plain inline annotation does not guarantee inlining. In particular,
size optimization can cause helpers called from noinstr functions to
be emitted out of line in .text. Such copies do not inherit the
caller's instrumentation restrictions.
Use __always_inline for the IRQ, idle, stack-check and vector helpers
reachable from non-instrumentable entry paths, including their nested
helpers. Also force inline arch_exit_to_user_mode_prepare().
do_trap_misaligned() is called by some '__trap_section' functions such
as do_trap_load_misaligned() and do_trap_store_misaligned() which are
noinstr code. So we also need to mark do_trap_misaligned() with
__trap_section to keep it in non-instrumentable text as well.
Build-tested the affected entry, trap, idle, stacktrace and KVM objects
with GCC and CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Inspected object symbols
and relocations.

Since v1:
  - add Fixes tag to patch1
  - add more missing __always_inline or noinstr to vector.h and
    kernel_mode_vector.c, these are missing in v1.

Jisheng Zhang (2):
  riscv/traps: Mark do_trap_misaligned() with __trap_section
  riscv: Keep helpers used by noinstr code in non-instrumentable text

 arch/riscv/include/asm/cpuidle.h       |  2 +-
 arch/riscv/include/asm/entry-common.h  |  4 ++--
 arch/riscv/include/asm/irqflags.h      | 14 +++++++-------
 arch/riscv/include/asm/processor.h     |  2 +-
 arch/riscv/include/asm/stacktrace.h    |  2 +-
 arch/riscv/include/asm/vector.h        | 22 +++++++++++-----------
 arch/riscv/kernel/kernel_mode_vector.c | 17 +++++++++--------
 arch/riscv/kernel/traps.c              |  3 ++-
 8 files changed, 34 insertions(+), 32 deletions(-)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
