Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBC5C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=MQFKbz2r8rW3t4fLyiHwAgyD02E6B38irZNwXtNZf9c=; b=LC8U+irTZiwJ9u
	XL9aCkD5kOjGvEumnVW2xarrrDgdVV8ezgt/+i5CbeTs/zo9FcmGCMd328d9mgHVglNeFTVWWmTKs
	Jr0mrGijOxrr2GCmlKQ1X3FpB3eNZDjWs8qVDM23QM9Um+FKZXI/uIpk2TCISP9I5SFM21hqE+ksi
	x8zBOjWyJVbcqiTwfXIwn9DBmCNLhGc/IhVfYcCfOP6BQnIkbDD/yAqN/YgkfX5nZoJvDZR7Rdh9k
	cV/r9aWM6pDDFmSKMG6tSXOejhjf67dGTIbQOCJoSXRkoqF2HUl/IIGTMc24siFXLS8qg676sDkKU
	TNtlK0g8IGVypbrjr1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6lm-001DxH-1I;
	Mon, 08 May 2023 19:43:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6lg-001DrQ-0w;
	Mon, 08 May 2023 19:43:35 +0000
Message-ID: <20230508185217.287533369@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=TIFcpQKDkUA3tA8gujt3zKN0CCqeTM3e8ZIS8vByT1c=;
	b=Wf4mqDxFrL1eWhI5cpdoRdFllQIJr50VWM3iPhe3WsbZ/Iw75OzzMXvNpDiX4/F1RlUka/
	FuaadHz8U/UJgoRuNI+eiueis1okBnBTdsW7K3h/5cJff54TU9cNXi2Eo25oxatOtt8Ped
	uqIwnl5vpuaeMpBtb7hOTKugxduUe8Augp4O7OKVi2nBKgfwEY926yQ5SmqvUi7xIbg97V
	fQtSCNhqHK3HwtnrdayfMk5OYNYQqF7Po1kCsNkOoJVvrU6F54wA+I/A0Pn8m/abs0ww8P
	YoKjgZ69Z9J+x/KjldafuRP3SwFynPh5Zr2/PtLG0H6Hu60gav2dDq7D6S6DFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=TIFcpQKDkUA3tA8gujt3zKN0CCqeTM3e8ZIS8vByT1c=;
	b=LftWUnhcnLdQ0KvHaFRp+CDhSV7AuCp+oemkbqukqx/mhhoAfEVrKqqXitjKTnGoiLrrvy
	h0+2Iv+MwcjSr/DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
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
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: [patch v3 01/36] [patch V2 01/38] x86/smpboot: Cleanup
 topology_phys_to_logical_pkg()/die()
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:43:28 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124332_479954_2F02D7D6 
X-CRM114-Status: GOOD (  12.16  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Make topology_phys_to_logical_pkg_die() static as it's only used in
smpboot.c and fixup the kernel-doc warnings for both functions.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/x86/include/asm/topology.h |    3 ---
 arch/x86/kernel/smpboot.c       |   10 ++++++----
 2 files changed, 6 insertions(+), 7 deletions(-)
---

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
