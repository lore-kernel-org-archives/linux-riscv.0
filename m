Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6D606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BypgO4qM;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UGq1LVk5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Riw67G+OP1l3DVDWZSm140IL7J5Ji4It8UQEST+RXa4=; b=BypgO4qMOnI5mq
	QcjubURbd2ToG0LpyABEwqCoNKIYp6nwsryH9B3d3uPrYy2iJ6ZGm/NshqRvpCFGzg2LtxAm+Easw
	n7uAB/ETdIqgnAa7L/S7Qb6e+I9jJ+BXgHOtKJD9Z5yimBWFAFiIC0TufKUH+GzlhTZykJRdmW7AU
	BALQyzyMOoygLukGY8nejrcUIN3GA7rp/1GWOKF4H+YiRulnEmD1h0575N3f2kOSF/l17yu0q3S4j
	zGEnvXqs87233MaExC1csyn8MhpjGJjvPkrP2MTThAlDduUZLHUP6pXcBe47xHbV3RnYm8yeIR4c9
	m9d3uGfDp2gZy8WkA9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmut-0000000DXcy-0fId;
	Thu, 22 Oct 2026 07:08:47 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmup-0000000DXbp-1e5E
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 07:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Kc
	S3uuJ2aUxEQ7xZoI70yenV90PwGHNj1xxTD8qG/FM=; b=UGq1LVk5QcMugP7u6v
	wY76UERXMcJFLAEozzv6QGymtxLkk/xYeycUBpNJ6cpFgzvmAl8b96BCvpKuJCg3
	IHx98UGz+5ndMI8oncDHDFDJpEza4tvYKz7VPpKabWQ3icUNolE8Poii3aWFiAFF
	KCmNT1cfYEEpfviu8wGid3O4U=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnz2ZLttlqamq+Bw--.15190S2;
	Thu, 22 Oct 2026 15:07:56 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: shuah@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] selftests: riscv: check all elements in vector register init test
Date: Thu, 22 Oct 2026 15:07:28 +0800
Message-Id: <20261022070728.35671-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnz2ZLttlqamq+Bw--.15190S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF47tFy8XFy3Aw45JFyUGFg_yoW8AF1kp3
	yFk34YyryfWa92qa18Cr4UJr4rWa1fJrWDArn8Aw4DA3yfWas2qFyxtF1jqa47Ar4Fyrs0
	v3Z2vFyfua1DGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbHUDUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0QzRfWrZtkwv8QAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_000843_768230_570054DC 
X-CRM114-Status: UNSURE (   9.08  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

The register scrubbing test attempts to read each element with
vmv.x.s and advance to the next element with vsrl.vi reg, reg, 8.
However, vsrl.vi shifts each element independently and never moves
the next element into element 0.  With SEW=8, the immediate 8 is
also truncated to 0, making the instruction a no-op.  The loop
therefore re-reads element 0 vl times, and leftover data in any
other element goes unnoticed.

Replace the shift with vslidedown.vi reg, reg, 1, which actually
moves the elements down by one.  The instruction has the same
encoding in RVV 1.0 and the T-Head vector extension 0.7.1, so it is
safe to use on both code paths of the test.

Fixes: 57d7713af93e ("selftests: riscv: Fix vector tests")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 91e31f185b85..7f6fb0f93691 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -40,7 +40,8 @@ int main(int argc, char **argv)
 			".option push\n\t"					\
 			".option arch, +v\n\t"					\
 			"vmv.x.s %0, " __stringify(register) "\n\t"		\
-			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
+			"vslidedown.vi " __stringify(register) ", " \
+				__stringify(register) ", 1\n\t" \
 			".option pop\n\t"					\
 			: "=r" (value));					\
 		if (value != 0x00) {						\
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
