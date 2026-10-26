Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1D9606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRmnNdYa;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T2rEkFr9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=odu8irYWAkotmIw1ViTGQNrzGamUpFTRjLxdeyAvAEE=; b=BRmnNdYadLUrHm1Yw+InK7UbFe
	jZuhW0pVkYfEus6heQT8wiE3iwxbGtI/NTjNWNm1Tq6QHUtp+s6+iPoHEKnZ5QebffikG/6m9ll9E
	dBKiCwhJKelFuR6g4thPDBb15jZcnYMKzsNMGC2nXfRlxsjIWrqD/s2KsV0k/vdZ0/eOT1dM3NsWR
	RcABYKHmxi1eH8TW58k5kaxfLa8EK39fHrp6tw/64Drk/FaXewSBK1x/bRAX9pDiYZk92n6tNWr26
	K9bJh/KyGYY8hMAYTOLhYp6TU2gSVgQ/DJXgsZ8a55nvvfN+9YD7mg4ZV0W2RCOQ6n8tDdRmNNLwl
	iJWOejQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjZ-00000002UkG-0kgQ;
	Mon, 26 Oct 2026 12:23:25 +0000
Received: from out-66.mta1.migadu.com ([2001:41d0:203:375::42] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjW-00000002Ujj-2pSg
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 12:23:24 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oek5CFzsQMOFXzsaKjRlVhUbIAcYmVvBZKP6KqcldqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793017399; v=1; x=1793622199;
 b=T2rEkFr9di4ZamBHyg807diMfjLXnB4MFXndxFxzWcJhklTJWqFJu94xV3P8I3lf+akPHI6w
 qeU895DsxnhT46GgyzpNOKI41zp4jEGc2+qaodM73EehiUB5ROtoqzjp1S2l6kpNfg4wBcDqL0D
 jZ0P8rjDIsMWDmZvF8/zEOgg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3b1020da94ae3f13;
	Mon, 26 Oct 2026 12:23:19 +0000
X-Mizu-Trace-ID: 3b1020da94ae3f13
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
Subject: [PATCH 0/3] kfence: fix pool allocation failure handling
Date: Mon, 26 Oct 2026 20:23:01 +0800
Message-ID: <cover.1793017073.git.liuyun01@kylinos.cn>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_052322_916552_E29F4707 
X-CRM114-Status: UNSURE (   4.44  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jackie Liu <liuyun01@kylinos.cn>

Fix the cleanup address and page reuse window in failed late KFENCE
initialization. Also let RISC-V boot if the early pool reservation fails.

Patch 2 depends on patch 1. Patch 3 can be applied independently.

Validation: source review, git diff --check, and checkpatch.pl --strict.
OpenAI Codex assisted with review, adaptation, and commit wording.

Jackie Liu (3):
  kfence: fix pool cleanup on metadata allocation failure
  kfence: clear the pool pointer before freeing pages
  riscv: keep booting if KFENCE pool reservation fails

 arch/riscv/include/asm/kfence.h |  4 +++-
 arch/riscv/mm/init.c            | 19 +++++++++++++++----
 mm/kfence/core.c                |  6 ++++--
 3 files changed, 22 insertions(+), 7 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
