Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B4606EBFB
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hLHNdBvG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BwjQlAo3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0CczssE0h0+Hgnt2f//LDyU8vDQJR78OJRKnmd5kIR4=; b=hLHNdBvG9f7x6y+LAZhng9PYVQ
	3VIX5HmI6qFVIm/CMPNA/d0wtNXaL7Sooy3w1Xkhpxmg9PmFlg/6cqJ8z31GNLTS2mzKpAfRnOCLQ
	Xng1Lfp0mZ0MfpWWW134lMbvWClQrDCQ2yYPiBwx5ezab9tNw4W2MBtXd+Ri25Y0B4q7ahEcFjMQ5
	UI4FObnHVlyFU/3YBRDzra4kFKZe9M0Y7cty899pDrm6xq6j56SV0MxFI3TD/IcRfRMXRuJ3VVZLG
	cTov3tcIrHW5SuXhOmM3Kd/5HyQ6Khaku9P9flCslY8Z3bO46YySvjiL8sBRzefISBJ9egGjGyadZ
	lJfGNqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBd-0000000Crz7-1ruL;
	Fri, 13 Nov 2026 13:19:25 +0000
Received: from smtpout.efficios.com ([2607:5300:400:ed00::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBR-0000000CrmN-0PuL;
	Fri, 13 Nov 2026 13:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575949;
	bh=Aa+Ay1/zkX9mW1dHapCcJ29KkN3LrR+HogZO/SC57M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BwjQlAo3LP5/9O8aYqc8iir985kQXJphrvkxKSX6WMEBk2P8Uj1wC+ES6Q9U5yjCc
	 kfzBHW4ky7CnbsIvv6sL6aqYizwNscb+MuzkiBZ4CVqc2QmoWC74Hil99Gka7InJ8w
	 WjEtGpv1Sk1S0QJLdMffA+QolJYPlIiCjbL2XJwPT5m/AAFmMOUuTT/aux+wol9Im+
	 ntMtSPodsJ+i9VdYiXA5fb1wGFs9lak33v0MAvwj18n37WjbCaYDix/byQt4sQSfyA
	 K3jaG/90Ic5SLIZtaMIsH8ZB3yMyuTjyzfQNHmtuzuihy3Ypuh8bdlSq2Up7g9ZqYp
	 TAnnGGRfwsuiw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWx39HJzQ0V;
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
	linux-trace-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH 04/16] selftests/membarrier: Issue the sync core command in its test
Date: Fri, 13 Nov 2026 08:18:51 -0500
Message-Id: <20261113131903.157186-5-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051913_203802_24C230C9 
X-CRM114-Status: GOOD (  13.85  )
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

test_membarrier_private_expedited_sync_core_success() is meant to
check that MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE succeeds after
its registration. It issues MEMBARRIER_CMD_PRIVATE_EXPEDITED instead.
No test issues the sync core command with success.

Issue the sync core command.

While at it, pass the third system call argument. It was left
uninitialized.

Fixes: 460e8c3340a2 ("membarrier/selftest: Test private expedited sync core command")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/membarrier/membarrier_test_impl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index b4dcbb32538d..4b9d1771916e 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -13,7 +13,7 @@ static int registrations;
 
 static int sys_membarrier(int cmd, int flags)
 {
-	return syscall(__NR_membarrier, cmd, flags);
+	return syscall(__NR_membarrier, cmd, flags, 0);
 }
 
 static int membarrier_get_registrations(void)
@@ -221,7 +221,7 @@ static int test_membarrier_register_private_expedited_sync_core_success(void)
 
 static int test_membarrier_private_expedited_sync_core_success(void)
 {
-	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
+	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE, flags = 0;
 	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE";
 
 	if (sys_membarrier(cmd, flags) != 0) {
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
