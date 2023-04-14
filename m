Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D27C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=yJw9Rw0sftolosroci/ylXZfpxv5UZZ7PWM/1wrsGI8=; b=VFjngilaj0Y+td
	Wp0pusZM3qcqCAsX5pw4H5B79BJv/4ndq7aCb3em0i8EwdbixPbObjk/29A1wQyNJ9VwpY1Ms82kY
	moQwWa6thnGTHQcJDuDSj/jPii2WCGnfliQz2iFyk78FSnJDiGVch8av4EbAZFFXoEhfshCDe+LQM
	/yaZuOz27nXJBNbCOrgx8LjyjiRjPFHktlf1SF0VYjAP3fQPpEpLzEjs3kqvy/L0mpSx4epgIklst
	reXNlbY5yHd5HXR2saN3qQPX0nL2YTSKfOxSG9tkUpHeKxcGzAWzFIYIxZvxxaJVlNaQRCV4GHP0X
	YRuoa8dvx2f9nReLnQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnTAp-00Aonh-1W;
	Fri, 14 Apr 2023 23:49:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT6L-00AkjV-2n;
	Fri, 14 Apr 2023 23:45:18 +0000
Message-ID: <20230414232311.254849089@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=qlj4H3ejL+vBUDG3NY1lMMcGFIiTzrSNA2aqLKlihDE=;
	b=1GQ0vgasLWqRcJWgIXPbXDmKUvXohkJnXHYow4+Gk18ZVkMCsGTyrDjPv1CmK6RbyQU3xy
	sZOnCBi1gUZHMhyRrfBhTMtqyNFDPJ6vIKz6V9GUUqs40cNvVEv7vD+CBHvRT0wd1gUl1d
	6b2tSiphU+RGH9LMrzC1SBAlXe4ncrHHHmvCSojPNfdfYrCZOS3cqdN5dvg1mrwkF+zHKS
	ZggDxsStwqH0PgeAnVkNUSmrn0NxE/MFHr8xTSF8rH/8cE10sWA0KKqw6/zjLrvWcuBEms
	WRc4LjINHUoNtUJjSQE1O0a6vHatkwkifR+Lal+9Qf7z5SXlNpUbZu7h4WPnRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=qlj4H3ejL+vBUDG3NY1lMMcGFIiTzrSNA2aqLKlihDE=;
	b=QX/aw2ZRTXXvpaXqpLyn2DL7d4KHZGqZGPQ3AUK084YoY4i+oS2d15EjnpvV8yHLp9Q5Sc
	902bNwcd/YuBSyBA==
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
Subject: [patch 33/37] x86/topology: Store extended topology leaf information
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:45:07 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164510_119613_C9915695 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Save the extended topology leaf number if it exists and is valid in
preparation of parallel CPU bringup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/topology.h |    1 +
 arch/x86/kernel/cpu/topology.c  |    3 +++
 2 files changed, 4 insertions(+)

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
