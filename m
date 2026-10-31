Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF6606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4NmaB6Xv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=crNERP6Pji94nCV+kPzJEF15LSRqrEw6F1GLe5RFJmg=; b=4NmaB6Xv2QF/jNOAOm51ga4eU0
	NrBQWed13Ix5NNmuFXg+BVeQopSpSnwZU966bNrtGqjQjcfJYbaLNoK15Q9F0mJ20yqNfPbrMDtWX
	Vz0H6mSmZv7ffh4tSTXAPfLKlBPok1DPcZoYVT90Z8Ynw+qWnJTN3NeLbOJSVyf14MI9NQzDYw96R
	HEf/ZmZDpgzpjV5X7pz52TWVen7CJzuSy9vYS/Q3pG8YCnkWlOScP0B6md77n4T1nNI5ba8rzj+m+
	vRrh2DHqrjfQxxnZm7zQ4wUWmg85Gub4f5kZZryxaOyDjy5Tqo1bXy0lurouYAYDQmBBOCUDjJEZ6
	Ud4sCIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNBmw-0000000DTgG-3gbo;
	Sat, 31 Oct 2026 16:18:38 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNBmu-0000000DTfL-0u2k
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 16:18:37 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNBml-00Eg4I-4z;
	Sat, 31 Oct 2026 12:18:27 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2 0/2] riscv: signal: fix the FP state restore in rt_sigreturn()
Date: Sat, 31 Oct 2026 12:18:24 -0400
Message-ID: <20261031161826.858908-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_091836_247979_C442E291 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

If rt_sigreturn() is preempted or sleeps on a page fault while it copies
the FP registers from the signal frame, the interrupted code resumes
with the signal handler's FP registers. Patch 1 fixes this, patch 2 adds
a selftest that reproduces it with userfaultfd.

Tested under QEMU with riscv64 defconfig plus CONFIG_USERFAULTFD: the
new test fails 10 of 10 runs on master, with preempt=lazy and
preempt=none, and passes 10 of 10 with patch 1, also on top of Guobin
Zhang's "riscv: signal: protect regs->status RMW from concurrent
preemption" v2 [1]; the two apply in either order.

This series was prepared with the help of an AI tool.

Changes in v2:
- Disable preemption around __fstate_clean() (Andy Chiu)
- Add a selftest (Andy Chiu)
- Shorten the commit message

v1: https://lore.kernel.org/all/20261016160708.790397-1-nickolai@csail.mit.edu/
[1] https://lore.kernel.org/all/20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com/

Nickolai Zeldovich (2):
  riscv: signal: mark the FP state clean before restoring it from the
    frame
  selftests: riscv: test FP state restore when rt_sigreturn() faults

 arch/riscv/kernel/signal.c                    |   7 +
 .../selftests/riscv/sigreturn/.gitignore      |   1 +
 .../selftests/riscv/sigreturn/Makefile        |   5 +-
 .../selftests/riscv/sigreturn/fp_restore.c    | 146 ++++++++++++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
