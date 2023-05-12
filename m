Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DE9C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 22:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=8/q3AQcdDs9NXV5Y0Q0NrQN/GXOssxji54CsDke6uK4=; b=MX7Ew9wZY/KhYI
	0ciymrYufUpT4O+UWshAQyZqc9N0EQcCJBI5lNczm6o28+iVoYYWuYxjigXbAHiMSFvGEyJgGk8Cv
	cxwkTwI6yRbHMxJYA8tN+LMwgqltI733QKRp4uMg8j5QNoZJ4VRn5v6yXAu0ZWgB/y1v2ZRHgMqN/
	uaPT++FBnBXGxMfbsetrKE7QlThD3CfeGl5I2alJTkJMvhgejIvs8sY0gkpUDCXeim0o10iYfQRVF
	0K3CDiftwOgzh6sucmUaM2hMs8NYtzj7K7Z9gPTCbPwSGS/P/ai85DJPv+QnOrDcfMuYf0SvnqQDk
	a3nBCqudThyxjdCfkUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxb3o-00DAbG-1J;
	Fri, 12 May 2023 22:16:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZyo-00CyLb-1r;
	Fri, 12 May 2023 21:07:12 +0000
Message-ID: <20230512205255.493750666@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=s6VYVqWXqkUTfsBItuhC7K5jhMRHOO4jS7pH6HBneyQ=;
	b=D8Bi7VzTkuViWKmMifMnim1UAY/BXTvSuSeXwEuTUeLAvarTwWc9SV8KqlElC0pgUFTjWP
	2jbw6QOOcurfoCC/WTzJxcK+XMQbkO3EARTs1kYAYqGIivOYxqP7phYyepd0BKzmfTwpU6
	Fw27scx120Ouaogv6XXjSnLZ9E+e/mhGz0dBUDIWJbMwJM56liQqcXjp2J4SP+zDoj4UTD
	RkPo9Y/fmZ/WujXo2Jf2gMUDGJZzU645UEoHLJ97eXWUzvUjxZ2adQMv8d0FDDOk5xDpxw
	JWIBF5jgEjyZJRTxuuMA3y82/EpNmPxEMuOLMXTOL5dXeVw9uM4RVrDqbMI2mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=s6VYVqWXqkUTfsBItuhC7K5jhMRHOO4jS7pH6HBneyQ=;
	b=LJpoYetOuh1jVxtlimZvIQSZscCqqjHl4hpuECjN5kaXN60+ti3C/hqHH5CB8z82fLbd2o
	Blu2a904F8bPRxDw==
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
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
Subject:  [patch V4 01/37] x86/smpboot: Cleanup topology_phys_to_logical_pkg()/die()
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:06:58 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140710_755864_3D5A69B5 
X-CRM114-Status: GOOD (  11.76  )
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
