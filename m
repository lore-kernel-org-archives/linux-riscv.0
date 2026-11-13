Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A8606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqGBm8Rf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ZKjZ1/DZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7njNwGQjbk8gz6iHjdffg5Yx/1pWzEpr0PwBSSI9hRE=; b=oqGBm8Rf9B94gEd19x+1EwvWHn
	J5NNbzyJQ0wsDaxQThtP7EqlpPxhjRYP7XqZG/KdssBtDA12H0jhPHNW6ljOqOjSyXJkS1zNEgbTq
	iy/EgIQR7PCULkSQ4LTGMQiLKvH7XtdjARFXme7eq0TVi1bJdkvx8yTCbF9iH64SCFcY/M8y5hWfO
	cXBbCL299hi9q9L2kHFHpLjp3+Ht9VpDBXDgt1e6DbUPBJXdG8uhaP2NVmr8xPJM9VMrBAZfSUHrb
	4hwmR4YNVC3s/XwX8+aUW8eyL330x/j01IGu3iy3xqWR3vIu7quC1OAj3qP/y1noX03YA3/9nM75/
	LZYUKyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBw-0000000CsFy-0Vcb;
	Fri, 13 Nov 2026 13:19:44 +0000
Received: from smtpout.efficios.com ([158.69.130.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBY-0000000Crtb-0oWM;
	Fri, 13 Nov 2026 13:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575951;
	bh=uKCrPR60jaWb2Zhk534ZCZD0Kw22aJy6wHHdu9KIW1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZKjZ1/DZ+BbeqkXr02agu+P8pZdpihHKuQ0XAT1QoQwv8CcTezyVrjKPoNObytxzg
	 ns09pwr2kdmkE3cdfcO60ogsBCpDXvl3CTO+i5kEh8WsasY9QeuWFW4r9+IBTX3c7o
	 /gthaseC16IfnekPSSS9mO0ZQKu+j2xBewoW1tMjb4uSQSHhiW9JJu/weuCT0PjpK3
	 rYOVYQuuQK29EbONku9W21tZ9NTcyx1UAUzi4/f/vQKf5yAXXYzSsAktQAPAHe9Swl
	 r86jY3miUpVYBwYe2XD6xMO9kvo3JTK+G24t7AYcCvdlG7y2pJtCPY0dAqoiChFvVE
	 4cEP7H5ydYEIg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWz3y7FzQ2m;
	Fri, 13 Nov 2026 08:19:11 -0500 (EST)
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
Subject: [RFC PATCH 12/16] x86/entry: Remove stale membarrier sync core comments
Date: Fri, 13 Nov 2026 08:18:59 -0500
Message-Id: <20261113131903.157186-13-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051920_648982_8750E321 
X-CRM114-Status: GOOD (  15.04  )
X-Spam-Score: -4.4 (----)
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

Two comments state that the membarrier sync core command relies on
the IRET which returns from the IPI handler. This is no longer true
since commit a493d1ca1a03 ("x86/membarrier: Get rid of a dubious
optimization"): sync_core_before_usermode() serializes the core in
the IPI handler.

Remove both comments.

The comment of sync_core_before_usermode() lists the instructions
which return to user-space without serializing the core. Fix a typo
in it ("sysrel") and add ERETU, which FRED uses.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 arch/x86/entry/entry_32.S        | 5 -----
 arch/x86/entry/entry_64.S        | 4 ----
 arch/x86/include/asm/sync_core.h | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 92c0b4a94e0a..d47bb08afb24 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -954,11 +954,6 @@ restore_all_switch_stack:
 	RESTORE_REGS pop=4			# skip orig_eax/error_code
 	CLEAR_CPU_BUFFERS
 .Lirq_return:
-	/*
-	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on IRET core serialization
-	 * when returning from IPI handler and when returning from
-	 * scheduler to user-space.
-	 */
 	iret
 
 .Lasm_iret_error:
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 253f0a585927..b8661064232c 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -626,10 +626,6 @@ SYM_INNER_LABEL(restore_regs_and_return_to_kernel, SYM_L_GLOBAL)
 #endif
 	POP_REGS
 	addq	$8, %rsp	/* skip regs->orig_ax */
-	/*
-	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on IRET core serialization
-	 * when returning from IPI handler.
-	 */
 #ifdef CONFIG_XEN_PV
 SYM_INNER_LABEL(early_xen_iret_patch, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
diff --git a/arch/x86/include/asm/sync_core.h b/arch/x86/include/asm/sync_core.h
index df22113db9cd..0ab91f7e2020 100644
--- a/arch/x86/include/asm/sync_core.h
+++ b/arch/x86/include/asm/sync_core.h
@@ -91,7 +91,7 @@ static __always_inline void sync_core(void)
 /*
  * Ensure that a core serializing instruction is issued before returning
  * to user-mode. x86 implements return to user-space through sysexit,
- * sysrel, and sysretq, which are not core serializing.
+ * sysretl, sysretq and eretu, which are not core serializing.
  */
 static inline void sync_core_before_usermode(void)
 {
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
