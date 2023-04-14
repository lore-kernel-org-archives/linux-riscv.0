Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABE5C77B77
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=q2GZ/0xazS6uDmVC4AdZ7uDIo609mLEIpiV71km0nhc=; b=vxNAa2zK1IXRkJ
	aINj2FAgtfKnGQwPt5QEP/1aTkPvFmGtb0iuPXda/jcqYSVfVa+VYAix/BPcVjirAB+66VJGQWTja
	8sV2t8ykRl39OyAYUGHEwYGrGxmXb7nyaCK9tyJdO0qk1DEWx4442jMoA9LNCf+ZvWvQrZYS2BD8v
	YEHuS6xj0LgjXHH85/5oIs+9cMTEZ0j7Tk5IbygcUApxj1tvV39m0ZkTn0qN7m+P6vznL0MnOHx2S
	3RQxalCbZ7UQRkUOKuGFUU2gFu8JncQFinrE/JWPETe83oAnzZ0Mv8/YNhzhwMKwrOuPv6P9GpLX9
	vdfXK6TZ0mn0mXdnUIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT6p-00Al94-0r;
	Fri, 14 Apr 2023 23:45:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5j-00Ak7J-1o;
	Fri, 14 Apr 2023 23:44:33 +0000
Message-ID: <20230414232309.823800249@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=u2pIwytrv1vZgLx+4s6Zqq6fs8EHbK9BS70kDc1o//Q=;
	b=tj9xEvgya1srEI62cuunab7v24wBazw6wpcxMtpv79720yev1kGcsEOxNFRId8qJ8lqNgr
	q1f11vM+Nc4aB4NgnBxR6tIQfQU2iMcMUeRzBxRZmT8RWJKM3p19eh3Ukgff4IpPXHAAmQ
	OLzNAKEJS2vpJEbsoOLlJHaRdWtjNT4f1mD1+bDAcp/oan26jOAxfnbm6Tpuvt1St80R8P
	dPrGNEb4Zg6w49Q/eELNuFnnuSnEIQhX8h7OuWa4y9Uk6de034h6Q46GBDo6gmOK33DmEP
	YQXfDKPvV28Xy5XOo7nZYu9OBqWv20e7LFSwhwcY173bD1coDcsMG/2Q9JSTZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=u2pIwytrv1vZgLx+4s6Zqq6fs8EHbK9BS70kDc1o//Q=;
	b=YNu0rancrP7gWuufcUKxrEH7bo8bWOmpZPxm7N3EMgjD1anaBUmHq23Qv/x7FzdBfUPs2b
	nJi2pgQCB1pCr2DA==
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
Subject: [patch 10/37] x86/cpu/cacheinfo: Remove cpu_callout_mask dependency
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:29 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164431_770668_5F7A7A0C 
X-CRM114-Status: GOOD (  10.78  )
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

cpu_callout_mask is used for the stop machine based MTRR/PAT init.

In preparation of moving the BP/AP synchronization to the core hotplug
code, use a private CPU mask for cacheinfo and manage it in the
starting/dying hotplug state.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -39,6 +39,8 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t
 /* Shared L2 cache maps */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_l2c_shared_map);
 
+static cpumask_var_t cpu_cacheinfo_mask;
+
 /* Kernel controls MTRR and/or PAT MSRs. */
 unsigned int memory_caching_control __ro_after_init;
 
@@ -1172,8 +1174,10 @@ void cache_bp_restore(void)
 		cache_cpu_init();
 }
 
-static int cache_ap_init(unsigned int cpu)
+static int cache_ap_online(unsigned int cpu)
 {
+	cpumask_set_cpu(cpu, cpu_cacheinfo_mask);
+
 	if (!memory_caching_control || get_cache_aps_delayed_init())
 		return 0;
 
@@ -1191,11 +1195,17 @@ static int cache_ap_init(unsigned int cp
 	 *      lock to prevent MTRR entry changes
 	 */
 	stop_machine_from_inactive_cpu(cache_rendezvous_handler, NULL,
-				       cpu_callout_mask);
+				       cpu_cacheinfo_mask);
 
 	return 0;
 }
 
+static int cache_ap_offline(unsigned int cpu)
+{
+	cpumask_clear_cpu(cpu, cpu_cacheinfo_mask);
+	return 0;
+}
+
 /*
  * Delayed cache initialization for all AP's
  */
@@ -1210,9 +1220,12 @@ void cache_aps_init(void)
 
 static int __init cache_ap_register(void)
 {
+	zalloc_cpumask_var(&cpu_cacheinfo_mask, GFP_KERNEL);
+	cpumask_set_cpu(smp_processor_id(), cpu_cacheinfo_mask);
+
 	cpuhp_setup_state_nocalls(CPUHP_AP_CACHECTRL_STARTING,
 				  "x86/cachectrl:starting",
-				  cache_ap_init, NULL);
+				  cache_ap_online, cache_ap_offline);
 	return 0;
 }
-core_initcall(cache_ap_register);
+early_initcall(cache_ap_register);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
