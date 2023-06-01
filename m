Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC8BC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSkB205mSqtFEFw5OtW72nocavBqU/pwJymGZ2aFk64=; b=hhB8L6Kjn4TEwV
	+Mb7o9AHTbzaMc+Ib/tVpOQh4kOO6sdAJpCdnyqVCOdJSB6nc0u67SgMkhkzVkZ3FaromrH299X1g
	KCMkN+kL2Kn5SLa5dTVEXA+uovwANdUTgqM0rIrGU9gzpqKaINWFufrd2yoy7kQAxiQpPnCjEAqVo
	EVtDpSRtfNVsuPtXaBR/2MnUTtb/8IVIs56lAdqY6gQqMOEjbnQjwqvBnBgvOkIgxgV5t9jJona8v
	0/qlXK/BuDomwl8/I03LMwN4sjvAihQzW5lSKQfxI9U2POnSAYVouBqFhl1fI75RM7+KRvcxKo/+R
	RckQ4DaARRBCrktvwEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fKe-002t8T-24;
	Thu, 01 Jun 2023 10:15:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fKb-002t4M-04;
	Thu, 01 Jun 2023 10:14:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94CC264314;
	Thu,  1 Jun 2023 10:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F22C433A8;
	Thu,  1 Jun 2023 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614496;
	bh=3lUg4pKLSJolxc237x3PHq7j3JRxqHTB75Jbt+sEmbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdsALwfCviJo1WWIa/dDAGblbrNebHVr1ooSOhVNFz42SZfWVramT65AsKnpfP2Is
	 CT0URD0cm7Fnvp3o9v0pgo39qBTlPCCgfcs/t4hxYdD0hcJM4wGpb+fELbrGOIjGLd
	 Tv3YNe2gP8gwbrv7sTlMLUuKdfLxI9bHWF/BpwOwr1NMBKqXzx0U+X7CwxqpB2kHfd
	 6JEFo3quF0bBzmfWaSgznKHZYHGbD7YpJVHcKn+/ZdqjRrBe7Fw1eYoYDfogBz73Bf
	 vaoicdjp4SUPDhDj9TM29nKq8q43slzKRIYfcI3DU+tqPZ1milF/m+ZXRmFzBLUmh9
	 0dlpJGK3F8Y8A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 11/13] ftrace: Add swap_func to ftrace_process_locs()
Date: Thu,  1 Jun 2023 13:12:55 +0300
Message-Id: <20230601101257.530867-12-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_031457_143801_FD5FE810 
X-CRM114-Status: GOOD (  14.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Song Liu <song@kernel.org>

ftrace_process_locs sorts module mcount, which is inside RO memory. Add a
ftrace_swap_func so that archs can use RO-memory-poke function to do the
sorting.

Signed-off-by: Song Liu <song@kernel.org>
---
 include/linux/ftrace.h |  2 ++
 kernel/trace/ftrace.c  | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index b23bdd414394..fe443b8ed32c 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -1166,4 +1166,6 @@ unsigned long arch_syscall_addr(int nr);
 
 #endif /* CONFIG_FTRACE_SYSCALLS */
 
+void ftrace_swap_func(void *a, void *b, int n);
+
 #endif /* _LINUX_FTRACE_H */
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 764668467155..f5ddc9d4cfb6 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6430,6 +6430,17 @@ static void test_is_sorted(unsigned long *start, unsigned long count)
 }
 #endif
 
+void __weak ftrace_swap_func(void *a, void *b, int n)
+{
+	unsigned long t;
+
+	WARN_ON_ONCE(n != sizeof(t));
+
+	t = *((unsigned long *)a);
+	*(unsigned long *)a = *(unsigned long *)b;
+	*(unsigned long *)b = t;
+}
+
 static int ftrace_process_locs(struct module *mod,
 			       unsigned long *start,
 			       unsigned long *end)
@@ -6455,7 +6466,7 @@ static int ftrace_process_locs(struct module *mod,
 	 */
 	if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
 		sort(start, count, sizeof(*start),
-		     ftrace_cmp_ips, NULL);
+		     ftrace_cmp_ips, ftrace_swap_func);
 	} else {
 		test_is_sorted(start, count);
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
