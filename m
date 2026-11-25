Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0FA606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJkDqF89;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HdAz0KN8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=egQFZPse/LdCOTmFzFDzVKRxJQ51Xltn1YyJIwH2iSQ=; b=jJkDqF89/SQkDOobWPRD7LR3XD
	JesbmGX+bIkgKGbLmODc8NW7fJSP3mv4SOUr2FqwdrbJaZefSLfYJxTyarCDroXl5oQcpuRR+Unr+
	M8lqRLiGytLykss0XIkKJD8bjhnYwqRHqw9XQa2LpeXX/xyYZZ4zXOwwOPSD54rSJtG1EIBCd6Kd1
	qTKhOdsO157lgo0E+bnCokAeQxnzr1GOCjXtVbpqNVKfIaA/rZICAZwm3cNSLASqxd8sq6xtxjh+W
	Ifb4Sq489jbm6MU/n9JOWJAUCJd2lDTMqNaQhFLt1RooyRRyR9BCGMasuN2W/1o0yHO7c/FGqJZhW
	l+hxpHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3ow-00000008JGl-3u1I;
	Wed, 25 Nov 2026 03:37:22 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3ot-00000008JGL-0EXO
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 03:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dn
	4Pl/vSqDKbDCHRYWbo1ykykLKkAdX5FKT7AzFEyp4=; b=HdAz0KN8YcOpEFxeAn
	kU/BtjfQ52e1uqChW04umz8GrHSd1NLSo+VlhqS2A8ZFmZipSoilauKkuz1I2SRi
	Udskl9fnFvAXJXqMvR8DGCzE2xHVea3qZNOD1DNQ+ztBa5+FYpLQK3jxZqtkmV2S
	e8YYStnvZ6IsG3olO883TAw5w=
Received: from atx2 (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_6jGVwZrc5xjJQ--.15963S2;
	Wed, 25 Nov 2026 11:36:50 +0800 (CST)
From: Xionggui Chen <evers_chen@163.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xionggui Chen <chenxionggui@lanxincomputing.com>
Subject: [PATCH] kcov: Defer PC canonicalization until tracing is enabled
Date: Wed, 25 Nov 2026 03:36:35 +0000
Message-ID: <20261125033635.3990-1-evers_chen@163.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3_6jGVwZrc5xjJQ--.15963S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1DAw4DJry5Ar1xKFykKrg_yoW8CFyUpr
	s3W3srJrWIqFy2y3srJ397uFy8G395J3y7CF9rC342ya1a9F4Fq3s2gw1DXFyqqr4kZ3Wx
	tFZ5WFy2y348ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzpB3UUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7BNmcGsGV9OXZQAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_193719_506463_4CD22182 
X-CRM114-Status: GOOD (  11.61  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xionggui Chen <chenxionggui@lanxincomputing.com>

When CONFIG_KCOV_INSTRUMENT_ALL and CONFIG_RANDOMIZE_BASE are
enabled, __sanitizer_cov_trace_pc() may be called during early
boot before the kernel's virtual memory mappings are fully
initialized.

Currently, canonicalize_ip() is called before checking whether
KCOV tracing is enabled. On RISC-V, canonicalize_ip() calls
kaslr_offset(), which accesses kernel mapping information that
may not yet be accessible.

This causes an early boot load access fault even when KCOV
tracing is disabled.

Move canonicalize_ip() after check_kcov_mode() to avoid accessing
the KASLR offset when KCOV tracing is disabled.

The comparison tracing path already performs this check before
canonicalizing the instruction pointer.

The issue was reproduced on RISC-V with Linux 7.4-rc1 using
CONFIG_KCOV_INSTRUMENT_ALL=y and CONFIG_RANDOMIZE_BASE=y.

The fix was verified on QEMU and RISC-V hardware. KCOV PC
tracing collected 124 entries, and comparison tracing collected
63 entries on the RISC-V hardware.

Fixes: ded97d2c2b2c ("kcov: support comparison operands collection")
Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
---
 kernel/kcov.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 9402227bd7ba..9dc8ce9f7563 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -216,13 +216,14 @@ void notrace __sanitizer_cov_trace_pc(void)
 {
 	struct task_struct *t;
 	unsigned long *area;
-	unsigned long ip = canonicalize_ip(_RET_IP_);
+	unsigned long ip;
 	unsigned long pos;
 
 	t = current;
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
 		return;
 
+	ip = canonicalize_ip(_RET_IP_);
 	area = t->kcov_area;
 	/* The first 64-bit word is the number of subsequent PCs. */
 	pos = READ_ONCE(area[0]) + 1;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
