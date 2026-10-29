Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE6606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvWmoVaF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r4Dl88Vx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gpkh0x8h+zhNlrwaeeJlzoNIincPyoj7i3bxED9731A=; b=nvWmoVaFGIyiHltycaFP4TeTrM
	OAJgQHwTwb8Q2RaSyG0xLp5gpRZ6oAhfXa4K/Hw5G8cmKyrTnUbjr5wE/LbWMgvO+N6uyNR0fodm7
	kCSPW4uqTvI2AkldrY3DJjKx63hmzJWymW/LiYYAOR6WgYa5kbWk+A9qCsvqJXMO+/aJKyOosjpBu
	Y4n6X7fI2GJXp1eYLBfm14J1jWqwhTrlNQKYDhxDrl/GeZCFMkA7f9QPMMtghUPGkkJZoiCpbGvyA
	1r9+/Qxh6hMBn/KyChEx3hC//wtQyK7602HWG68PrjWYo/+GbM21rUhxXSoQUoSs9PVchnDCxgiBT
	jluNuwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGLE-00000008E3e-27wp;
	Thu, 29 Oct 2026 02:58:12 +0000
Received: from out-234.mta0.migadu.com ([2001:41d0:1004:224b::ea] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGL9-00000008E3L-3TvL
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 02:58:10 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2yJPhEA+osB6DVRCw5dTasiq5meR1ZntSgNLQBMw2zo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793242683; v=1; x=1793847483;
 b=r4Dl88VxHTQ5u7jfJcN3OerbImh7YLUfp03Qzf2/uF9HvKKphBxtKAyThluKZm3Vvrcxm2ej
 kNsqTTdScf/Qw0NAxC33y05z3+Zis9c4snvQ3p9vLc/ewE1MzMuxchj8WGBBRa4anebpdjtVi4M
 J5cOlHNz3mlr3EeeoMlZXSrk=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14de6ad10eb9457f;
	Thu, 29 Oct 2026 02:58:03 +0000
X-Mizu-Trace-ID: 14de6ad10eb9457f
X-Migadu-Flow: FLOW_OUT
From: Jackie Liu <liu.yun@linux.dev>
To: glider@google.com
Cc: dvyukov@google.com,
	elver@google.com,
	pjw@kernel.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	muchun.song@linux.dev,
	liu.yun@linux.dev
Subject: [PATCH v2 0/3] kfence: fix pool allocation failure handling
Date: Thu, 29 Oct 2026 10:57:40 +0800
Message-ID: <cover.1793242457.git.liuyun01@kylinos.cn>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_195808_381425_78868012 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

From: Jackie Liu <liuyun01@kylinos.cn>

Fix the cleanup address and page reuse window in failed late KFENCE
initialization. Also let RISC-V boot if the early pool reservation fails.

Patch 2 depends on patch 1. Patch 3 can be applied independently.

Changes in v2:
- Add Marco Elver's Reviewed-by to patches 1 and 2; their code is unchanged.
- Drop the unused asm/kfence.h include from patch 3. Sashiko reported that
  its unconditional inclusion breaks RV32 and NOMMU builds.
- Credit Sashiko and kernel test robot with Reported-by and Closes tags
  in patch 3.

v1: https://lore.kernel.org/all/cover.1793017073.git.liuyun01@kylinos.cn/
Reports:
https://sashiko.dev/#/patchset/cover.1793017073.git.liuyun01@kylinos.cn?part=3
https://lore.kernel.org/all/sashiko-outbox-186543@kernel.org/
https://lore.kernel.org/oe-kbuild-all/202610290904.wbrEL97y-lkp@intel.com/

Validation on AArch64 Linux with Clang 17.0.6 and GNU ld 2.40:
- RV32 and NOMMU: reproduced v1 failures; v2 init.o builds successfully.
- RV64 defconfig with CONFIG_KFENCE=y: init.o, mm/kfence/core.o, and the
  full Image build pass without warnings.
The existing NOMMU warning in include/asm-generic/io.h is identical to
that from the unpatched base. No boot or failure-injection tests were run.
All three patches pass checkpatch.pl --strict and git diff --check.

OpenAI Codex assisted with review, adaptation, wording, and validation.

Jackie Liu (3):
  kfence: fix pool cleanup on metadata allocation failure
  kfence: clear the pool pointer before freeing pages
  riscv: keep booting if KFENCE pool reservation fails

 arch/riscv/include/asm/kfence.h |  4 +++-
 arch/riscv/mm/init.c            | 18 ++++++++++++++----
 mm/kfence/core.c                |  6 ++++--
 3 files changed, 21 insertions(+), 7 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
