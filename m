Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE27606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 02:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yow3qKnI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aOb6UCz8ymTI4CXVsKaAmjbB4dSeTstMeO4YnP/x0wo=; b=Yow3qKnIaYxD2NeG+FuNP8PACw
	IhqYo09diCb1CVCVm5yBF+wvoLX7RDbolOvAv0uP8RGHo34x/y4eKzNUsq806am8GYZ4C77cTiFOp
	MQmg1xswzL1xi0B4TjGmAp3tBp7b23lHc2AVdHrNOhxsoYRyAEpOkLkDLfUWfGVYQamqFJC/TB2W2
	5aJmUjuyRZURfjENC3ALCBrTJrgyC8/cc6a/dV3WBesbahz0Mo2x5VKWTQR/lYGaiyfYhvI3q0Q1/
	FdZe3TINXLoYO5Fp8r+3zOXCwj02pBZb8uCTq2TdqaF5yJ+OgAnKv3qOLGb8N8uelqSIwCw1ObFpr
	dOB2L4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmZL-00000000x4d-310i;
	Mon, 16 Nov 2026 02:35:43 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmZH-00000000x36-0lFH
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 02:35:41 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmZC-004DmY-Px;
	Sun, 15 Nov 2026 21:35:34 -0500
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
Subject: [PATCH v3 0/2] riscv: signal: fix the FP state restore in rt_sigreturn()
Date: Sun, 15 Nov 2026 21:35:32 -0500
Message-ID: <20261116023534.50074-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_183539_226007_34758589 
X-CRM114-Status: UNSURE (   8.59  )
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
new test, built with GCC 15 through the kselftest Makefile and with
clang 21, fails 10 of 10 runs without patch 1 and passes 10 of 10 with
it.

This series was prepared with the help of an AI tool.

Changes in v3:
- selftest: load the tgkill() arguments inside the asm statement. v2
  bound them to local register variables, which GCC does not keep
  across the sigaltstack() call before the asm, so the signal was never
  sent and the test failed with or without patch 1 (Andy Chiu).
- Rebased onto v7.4-rc3.

v2: https://lore.kernel.org/all/20261031161826.858908-1-nickolai@csail.mit.edu/
v1: https://lore.kernel.org/all/20261016160708.790397-1-nickolai@csail.mit.edu/

Nickolai Zeldovich (2):
  riscv: signal: mark the FP state clean before restoring it from the
    frame
  selftests: riscv: test FP state restore when rt_sigreturn() faults

 arch/riscv/kernel/signal.c                    |   7 +
 .../selftests/riscv/sigreturn/.gitignore      |   1 +
 .../selftests/riscv/sigreturn/Makefile        |   5 +-
 .../selftests/riscv/sigreturn/fp_restore.c    | 147 ++++++++++++++++++
 4 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
