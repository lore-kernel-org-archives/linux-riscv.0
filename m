Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0F3C77B79
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=M9JjlV4XGK8Roz/Y72GvJJsXUFWsNdJhyhcRUwpyB2c=; b=tAwGNXQ8/EO4hN
	kfBEJ8s38H4Fnt0qTqriTmDYhdUS60D8HUg41922IqXA4Gk/oLRgwWycXN9rqm0d5BzCsfW1E8PPx
	E75TCFrJnLbjZ+mIaKNINvbXBGQMdg/UYh7XqoKPwQpgD8YRl1o9D0MxDSMsTENnNPk3tqHjTKbgg
	8mMvY6FVfkefbZTYa98WO+F+9waY6ae8RyLdLUuRE358R73LjEbzXoMlD7fT6MXCqAxnald1VtkPD
	AQZ5huWGA5LBXttrclu/ZAceszOdIST29klxqqLOOBCs3SmsqYUTYQA3xCJ+ahWndDOzoOQHXgSLW
	ZVCUS6cCg1wIigenvg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5Z-00Ak0u-35;
	Fri, 14 Apr 2023 23:44:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5W-00Ajyt-0X;
	Fri, 14 Apr 2023 23:44:19 +0000
Message-ID: <20230414232309.323016954@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=sDTci1v+H+1hOBnO3MWKNQ4KSM/+mxYEdJGIWDEKpYw=;
	b=y8O+iHOImdrEQNmtF7SapUaot3V0yy8b8Ub9SUl+OgGsTaIJZhbZjtiR4PN4V5WCNemOca
	Ob8ttIQs2lYzofVI5dy3T9RFKAux9iKX/Rkv+VPjfOqV4T6XWGHXuY9IFhwqlXBTVc5Nsl
	KK4n8ce7YmA5TsutXdcfdM52VSR98OW8mCNQWFGg6cY3Yq6KC99p69q2+p9erXW8Qg/qAb
	ceQeWzd0QJGBxdpwT1wRPfHvVdxLxyyhgH/r2Dl9U2nA2Jo/APevn/jIIjbNa3EFkc7Pxb
	zX0dOALraGxj/DlefvHJr1NZVmMqpk/+HdfNk32Kc/stZp2q/WmPtDMIe6OaIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=sDTci1v+H+1hOBnO3MWKNQ4KSM/+mxYEdJGIWDEKpYw=;
	b=HMWjVuC1heTl6ACr7VnRkYnxnf9HNU4lYZlkNOeO1jQ9uLiC6+ocCzTSyzyWZjYVjiCgZf
	cRj6X0w+T3BbGTBA==
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
Subject: [patch 02/37] cpu/hotplug: Mark arch_disable_smp_support() and
 bringup_nonboot_cpus() __init
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:16 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164418_345981_B4CE7FF6 
X-CRM114-Status: GOOD (  10.11  )
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

No point in keeping them around.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |    4 ++--
 kernel/cpu.c              |    2 +-
 kernel/smp.c              |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1269,9 +1269,9 @@ int native_cpu_up(unsigned int cpu, stru
 }
 
 /**
- * arch_disable_smp_support() - disables SMP support for x86 at runtime
+ * arch_disable_smp_support() - Disables SMP support for x86 at boottime
  */
-void arch_disable_smp_support(void)
+void __init arch_disable_smp_support(void)
 {
 	disable_ioapic_support();
 }
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1502,7 +1502,7 @@ int bringup_hibernate_cpu(unsigned int s
 	return 0;
 }
 
-void bringup_nonboot_cpus(unsigned int setup_max_cpus)
+void __init bringup_nonboot_cpus(unsigned int setup_max_cpus)
 {
 	unsigned int cpu;
 
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1051,7 +1051,7 @@ EXPORT_SYMBOL(setup_max_cpus);
  * SMP mode to <NUM>.
  */
 
-void __weak arch_disable_smp_support(void) { }
+void __weak __init arch_disable_smp_support(void) { }
 
 static int __init nosmp(char *str)
 {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
