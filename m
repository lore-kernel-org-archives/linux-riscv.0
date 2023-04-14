Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8029C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=04QpFmPsyeQt/AX2PwRE+tZdJ4Y7Xw/DS2pdSah38UQ=; b=LZzqW2UmI1Qyw/
	fbVw3wgITyORAj7+fpRUifsxLVCdeYf7b3+9TvcSSVguWWCF38q5MOvBIDD1JViSqeV9VsnD0kesr
	EZhST8DeVvbjXarPRFHCLajNMd+9wqY5Upegbta3rN55i7I01GTlqlqUdkkFfSmd/Bp4iS9NN1HXG
	apongeblDeFTJHj/GRHk3Xr4ZmAWza60/6bFer4hRjVq1/4xguofnDuiEQofYGjk4xQIu2kB9KHEt
	lliMHGA8mHG1+KmusURaYvFXsyl6amJbcYOchXxj3FvS2Rnp3nhHLiAkyiqvXdLMl4MZMFWemfnd6
	QP+E8QVqZLoBTD9gB4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5l-00Ak9D-0C;
	Fri, 14 Apr 2023 23:44:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5Y-00Ajyj-1H;
	Fri, 14 Apr 2023 23:44:22 +0000
Message-ID: <20230414232309.261127575@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=IlHV62TWgKh1cdgK7stl2AzD5yScRMLzrcA90zGNlOQ=;
	b=ZSJ2jYDTvrOcSfB+q9NW+WGp94J7gVM5nWU/8DuwnoZDMu+XBZCbSUvTxL+DR4BvKxavFN
	jhuRONKx7L6r94CMMXtiIONzHNo1K+Igs8Z0LLNxD99J31QKLzvq4MDfPqPJUdJy0who+d
	mKrkRcfXkOBt5Idh86wWBXAvBPESGtEj994l0Sk8+em2iAJUZAhObLDXX+j3oXrngnpCuw
	zyRT6xozBWS7ZDWw8BWKkQqW6Qlj1eCTnFv9dCNIQazSMGDnTo3mcHwD/wv9ccqLmI3o2G
	GJGLBHoc9N7XmTNB1GAm0gwQkaNsttkeRSqEESmeoHEEgOdQdWWA8b6V/dbDuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=IlHV62TWgKh1cdgK7stl2AzD5yScRMLzrcA90zGNlOQ=;
	b=5y7iOO6UN0/F9Na7fC7zsih/Bs+dHvWN4EhYECYw/BugXKR0lZggZtmRr+wdRcc8V09+nR
	evNcawtvhTVqcwDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject:  [patch 01/37] x86/smpboot: Cleanup topology_phys_to_logical_pkg()/die()
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:14 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164420_593013_FD008A28 
X-CRM114-Status: GOOD (  10.46  )
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

Make topology_phys_to_logical_pkg_die() static as it's only used in
smpboot.c and fixup the kernel-doc warnings for both functions.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/topology.h |    3 ---
 arch/x86/kernel/smpboot.c       |   10 ++++++----
 2 files changed, 6 insertions(+), 7 deletions(-)

--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -139,7 +139,6 @@ static inline int topology_max_smt_threa
 int topology_update_package_map(unsigned int apicid, unsigned int cpu);
 int topology_update_die_map(unsigned int dieid, unsigned int cpu);
 int topology_phys_to_logical_pkg(unsigned int pkg);
-int topology_phys_to_logical_die(unsigned int die, unsigned int cpu);
 bool topology_is_primary_thread(unsigned int cpu);
 bool topology_smt_supported(void);
 #else
@@ -149,8 +148,6 @@ topology_update_package_map(unsigned int
 static inline int
 topology_update_die_map(unsigned int dieid, unsigned int cpu) { return 0; }
 static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
-static inline int topology_phys_to_logical_die(unsigned int die,
-		unsigned int cpu) { return 0; }
 static inline int topology_max_die_per_package(void) { return 1; }
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -288,6 +288,7 @@ bool topology_smt_supported(void)
 
 /**
  * topology_phys_to_logical_pkg - Map a physical package id to a logical
+ * @phys_pkg:	The physical package id to map
  *
  * Returns logical package id or -1 if not found
  */
@@ -304,15 +305,17 @@ int topology_phys_to_logical_pkg(unsigne
 	return -1;
 }
 EXPORT_SYMBOL(topology_phys_to_logical_pkg);
+
 /**
  * topology_phys_to_logical_die - Map a physical die id to logical
+ * @die_id:	The physical die id to map
+ * @cur_cpu:	The CPU for which the mapping is done
  *
  * Returns logical die id or -1 if not found
  */
-int topology_phys_to_logical_die(unsigned int die_id, unsigned int cur_cpu)
+static int topology_phys_to_logical_die(unsigned int die_id, unsigned int cur_cpu)
 {
-	int cpu;
-	int proc_id = cpu_data(cur_cpu).phys_proc_id;
+	int cpu, proc_id = cpu_data(cur_cpu).phys_proc_id;
 
 	for_each_possible_cpu(cpu) {
 		struct cpuinfo_x86 *c = &cpu_data(cpu);
@@ -323,7 +326,6 @@ int topology_phys_to_logical_die(unsigne
 	}
 	return -1;
 }
-EXPORT_SYMBOL(topology_phys_to_logical_die);
 
 /**
  * topology_update_package_map - Update the physical to logical package map


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
