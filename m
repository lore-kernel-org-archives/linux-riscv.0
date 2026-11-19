Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C220606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 05:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xahbh6gP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I8VeSSrv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wjRkGDg0BUUycum5ZfAJAPzKC5wETSiIHB2ppY3Ae44=; b=Xahbh6gPU/hvEBTl5PShNF+0zx
	5o7l+L3W8j3BjxaEghzqPYkRNDoHL4nF7eh7X+Gpg04aZblbQRK6vlsaqGj7bmz1mLtsEpwf4yDvN
	X9PKT0VpAw37il/CtA36BY7Jyk/GAmouPXi84BKi1ysmYG/48MKfJ6hNqHCyFJdm/sXFQfYN/Bdvc
	HvYJCIdni7lU3hhCYa0jHA5OckgQXDHnHsciVKvJyYr0P+ZOtDJF5HVePIIyq53v+tdTyRWMZkzfJ
	XDs9/DHDApmjjwtbKizBKHTBYkTBVwKkVHJOGJx5NC7BgyFhKk9Qz8OSTD2i7lTBkiDJgdFzHDsgW
	EmwsSQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuHv-0000000Ar4O-2w2U;
	Thu, 19 Nov 2026 05:02:23 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuHn-0000000Ar38-380c
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 05:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gM
	Hu40HPB2BKy7MquzF3lmOkVTKUayEImgeIr9c7qLA=; b=I8VeSSrv/NomH3j4d7
	hc20yi8TVjYVNmVTJlakLrWEcPlrdgNAwMR3umALxhMMwYNRsm/RzwWCjgbRBOes
	yM+Tp8n62ujI5NGAH65LnisjHUUIE6iHStSyShEKT7Wj9LsjvnPyTSCistxGR5jP
	j2stBUFYbIhHpbTqMf7DctoAw=
Received: from 5219-2604 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_1CEgv5qfDulIg--.27439S2;
	Thu, 19 Nov 2026 13:00:55 +0800 (CST)
From: Xionggui Chen <evers_chen@163.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Xionggui Chen <chenxionggui@lanxincomputing.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Muchun Song <muchun.song@linux.dev>,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Disable GCOV instrumentation in set_satp_mode()
Date: Thu, 19 Nov 2026 05:00:41 +0000
Message-ID: <20261119050049.174124-1-evers_chen@163.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3_1CEgv5qfDulIg--.27439S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1fXFy7GF1DuFWDWFy5twb_yoW8CFWxpF
	WrCan3G3yUXrykKFn7Cry8XrW7J3Z5KrW3CrWDt34kWw4qyFyrta1ayw1Yv34DWrWxZa4r
	WayYgry3uFWDA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uq38OUUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC6wccJmr+goc2rQAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_210216_284480_3912EDBD 
X-CRM114-Status: GOOD (  10.54  )
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

When CONFIG_GCOV_PROFILE_ALL is enabled, GCC instruments
set_satp_mode() with GCOV counter updates.

The function temporarily enables an identity mapping to probe
supported SATP modes. GCOV instrumentation may access counters
outside this temporary mapping while SATP is enabled, causing
a Store/AMO page fault during early boot.

On QEMU virt with Linux 7.4.0-rc1, the fault occurs immediately
after writing satp. The faulting instruction is an amoadd.d
updating a GCOV counter in set_satp_mode().

Mark set_satp_mode() with __no_profile to prevent GCOV counter
accesses during SATP probing, while preserving GCOV coverage
for the other functions in init.c.

Without this change, QEMU fails during early boot. With this
change, the kernel reaches root filesystem mounting.

The fix was also verified on RISC-V hardware with Linux 7.2.0.

Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
---
 arch/riscv/mm/init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 070ee69eabb3..f1c778a82157 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -833,8 +833,11 @@ static bool __init is_vaddr_valid(unsigned long va)
  * The maximum SATP mode is limited by both the command line and the "mmu-type"
  * property in the device tree, since some platforms may hang if an unsupported
  * SATP mode is attempted.
+ *
+ * GCOV instrumentation must be disabled because the temporary identity
+ * mapping does not cover GCOV counters while probing SATP modes.
  */
-static __init void set_satp_mode(uintptr_t dtb_pa)
+static __init __no_profile void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
