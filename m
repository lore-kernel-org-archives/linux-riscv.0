Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CAA606EBCE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQtjAihz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=s6kK13es
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qvto/UY7HuVckEoyPzY8X8hrM26s94uu4smZHYNx0iI=; b=OQtjAihzibHQqQK4gsaITVJEx+
	l/FkstBZ3xRVbwBr5voyRAJSITBl44URzPLs2kigYMAjDBxzkrbUbbMYFQWQtRx6AniF6i4+KpZkg
	56fu23I5u58OUKjlmvKQ/8lV9/jFr34HGzIfNa20Q4xtTvBX08oZbOZLEh/XSpTHFw/cO2mpV2B34
	qNJwtV/qjzO4aChnGsEgtc6K93r+86+6RnLwajzbh8D8UCjYGDgPJJKafPdlZ0i8o+9D04bUBzaNT
	sw+x1D8KFJSwXDDGjFTEG5UCNgDq8K2a9TIwHnONN+NIck7+cfRnU3elD62MmWZr0sDmyuDxwyVgL
	DLGij1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBW-0000000CrsB-0GJH;
	Fri, 13 Nov 2026 13:19:18 +0000
Received: from smtpout.efficios.com ([2607:5300:400:ed00::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBQ-0000000Crlx-3GiB;
	Fri, 13 Nov 2026 13:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575949;
	bh=fqjA7d9oxPlvdGR3cNqFBxqIEuFEPoAWBVhZCbSck08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6kK13esQe/3Dn823GifDE9YUBWlaKce/VmCWiLQ321jSAlDZzngdBqaA7Z1qxE5C
	 1whHJR1cZuzdUENomlJDksKPvI8B8+TKPbapRpahpsvcVZ34+5mnagsV1VplU/jlFp
	 5OOWfMg8+VBVCs9eVc+brs/jfyKM976DDqW7G5I5ZhFG3+GWQz5t9lYT0zMzjU+oTj
	 wud8MxwH1cCwX3De6qSdGsLiraDSdF9rp2pE0dvf/M5yJmuCc10gg+fym24Og6+mpp
	 jj72LqbVMYZfYph9MOs3pAzIRK+wwJvE/bNawaS0fVmndeXcbCHtRy4z0jrI+uiuTD
	 tyVxSGVFPUbDA==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWx19bkzPtp;
	Fri, 13 Nov 2026 08:19:09 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Michal Clapinski <mclapinski@google.com>,
	Andrei Vagin <avagin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Aniket Gattani <aniketgattani@google.com>,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Gellermann <christian.gellermann@codasip.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-openrisc@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-arch@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	lkmm@lists.linux.dev,
	bpf@vger.kernel.org,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org
Subject: [RFC PATCH 03/16] selftests/membarrier: Rebuild the tests when their header changes
Date: Fri, 13 Nov 2026 08:18:50 -0500
Message-Id: <20261113131903.157186-4-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051912_890068_194BABAF 
X-CRM114-Status: GOOD (  12.56  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

membarrier_test_impl.h holds the test code of
membarrier_test_single_thread and membarrier_test_multi_thread. The
Makefile does not list it as a prerequisite. A change to the header
does not rebuild the two tests, and a stale binary is run.

Add the header to LOCAL_HDRS. lib.mk makes each test depend on these
headers and keeps them out of the compiler command line.

Also add membarrier_rseq_stress to .gitignore.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/membarrier/.gitignore | 1 +
 tools/testing/selftests/membarrier/Makefile   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/membarrier/.gitignore b/tools/testing/selftests/membarrier/.gitignore
index f2fbba178601..031920478205 100644
--- a/tools/testing/selftests/membarrier/.gitignore
+++ b/tools/testing/selftests/membarrier/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 membarrier_test_multi_thread
 membarrier_test_single_thread
+membarrier_rseq_stress
diff --git a/tools/testing/selftests/membarrier/Makefile b/tools/testing/selftests/membarrier/Makefile
index 829f95c83515..20bb66380090 100644
--- a/tools/testing/selftests/membarrier/Makefile
+++ b/tools/testing/selftests/membarrier/Makefile
@@ -6,4 +6,6 @@ TEST_GEN_PROGS := membarrier_test_single_thread \
 		membarrier_test_multi_thread \
 		membarrier_rseq_stress
 
+LOCAL_HDRS += membarrier_test_impl.h
+
 include ../lib.mk
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
