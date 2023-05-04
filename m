Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D5AC77B73
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=ER7sxzG6W8GLWNmIdI1YyVsXuVnBh6ZnwIsfMPXPnoA=; b=ygUbWQXXVfIR/r
	f92YqY+ogcpXpgd0Q1F5jbOrFXiojYP3B5RaJy58R4arv7ZtlCBa7islgz6+xa0/dDzAY+NDUWeVV
	pQUh2pZZoXuplsjvAuE+oVUShuQsYPKp4X5O4hiq8IKqF/0++rJ7UT527ch3i163fkv4F7VjUaMH6
	B3raCORHiqcq79ioojNdV2QqCSLCt+fPIIhBAYhUuwJGPh3fxfGT7xybl1iibjngP7WYTu6Wyg9ed
	JSWuevnu+iD+vcHXNdX1Jf/xukKvmZsW2Bq2o7HJyhyF5//AukMtNRbuEjaWSPsilKDDFjvy0GPnu
	chWh5qkd3H6iQry609og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugIt-009103-0o;
	Thu, 04 May 2023 21:15:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueEA-008e4j-0C;
	Thu, 04 May 2023 19:02:59 +0000
Message-ID: <20230504185938.126719312@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=C2xEv0EYOzjjBDOf0WNXDnbg3SxiEflVftHaff1ezNc=;
	b=R7TFizeMBd1vCDVjEXU0BtfNbQoQd0Q7O5Cmi/GhoH+A7DPO/eDCQYvwL8d0EzW6TZevXV
	zTSW3dCyZNMiwvAMbTbcTVfTHbY6pLve5Gv/afd1jzhLujx3f5ZspMS2zkpgXg0oDc3s5d
	kXcBYyWoHlipJH2VBBXdFP8QtRznLbAKZV10Ph92/Hk65CJwnRS+0u5oUwspH7khzqSQ/u
	SpYu0bcq4JwwE/JeCF3NwhBMiC+1RMRMfogzt5BdrL549/PBdPFpI4eEajMl9aEC63+JVF
	9zu2Vsz02+ZJpxAIfDIw2+6pnaLRSdZXjwd9Lq61E8b+1bqiBtxkam2eHoBKxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=C2xEv0EYOzjjBDOf0WNXDnbg3SxiEflVftHaff1ezNc=;
	b=L3yFFvyeaWcbSL4+w4FNUsUl3Xq9FYBhGlVedajTlxgN49PBR5/K5uqBP8Q/AEH8xz/YfX
	kk6rHy0rbLZe69Cw==
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
Subject:  [patch V2 33/38] x86/topology: Store extended topology leaf information
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:51 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120254_285436_887460F8 
X-CRM114-Status: GOOD (  11.45  )
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

Save the extended topology leaf number if it exists and is valid in
preparation of parallel CPU bringup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/x86/include/asm/topology.h |    1 +
 arch/x86/kernel/cpu/topology.c  |    3 +++
 2 files changed, 4 insertions(+)
---
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -121,6 +121,7 @@ extern unsigned int __max_die_per_packag
 #define topology_core_cpumask(cpu)		(per_cpu(cpu_core_map, cpu))
 #define topology_sibling_cpumask(cpu)		(per_cpu(cpu_sibling_map, cpu))
 
+extern unsigned int topology_extended_leaf;
 extern unsigned int __max_logical_packages;
 #define topology_max_packages()			(__max_logical_packages)
 
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -29,6 +29,8 @@ unsigned int __max_die_per_package __rea
 EXPORT_SYMBOL(__max_die_per_package);
 
 #ifdef CONFIG_SMP
+unsigned int topology_extended_leaf __read_mostly;
+
 /*
  * Check if given CPUID extended topology "leaf" is implemented
  */
@@ -72,6 +74,7 @@ int detect_extended_topology_early(struc
 	if (leaf < 0)
 		return -1;
 
+	topology_extended_leaf = leaf;
 	set_cpu_cap(c, X86_FEATURE_XTOPOLOGY);
 
 	cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
