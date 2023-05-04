Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE939C7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=4/9+CUJLGi0utvL/T1r8FUpPxDmfKC31+HK+oDjEjLs=; b=2MmUccaU7rCXPP
	7jVy1yzYXKT9S1F5NLcAyJR9k4WnvovI0kNkTuFSn1XD2OgXAo9dupPGhzUqAuPZfD60Y9KFCHM+n
	qUtr9ar1m3RaMTxrd8Vb8j8NGZU59W4+dDF9CfI8nm4hjO1BUmE+oPQgrxw5HpWCLzuAG7usKal+8
	LWbMEGcgoAzHx/+sIoSaticlMFOs25X//PF7vtlhNV9PXzQW8auDfUQ+/KDUpneXgAozdfpFE/kGF
	XsLTIbHOrckg5oqN1kXSrmyNVXBPHaHzZVFQ7TrJAB0R4f2wJxhOfpEvEW2b4PUYa5d2SQ4x2Yfcw
	E83AhioJxN99UJefB89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugIt-00910K-1c;
	Thu, 04 May 2023 21:15:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueEB-008e6m-2i;
	Thu, 04 May 2023 19:03:01 +0000
Message-ID: <20230504185938.179661118@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dh/52GRhLbpp4gh50fAuvfQix7j7Ih1160L/CdLI8l0=;
	b=O6cG1HBehiX74K9JFp369TIKx6mKBR2TPreNtZ0JIxAQi+1KIShpZOLr9yn98NyJ2DVeV2
	KoRI+hkYEu5smHES9pGvnLyoWtwb4Bp/4BfVhvbHAfxZcdiWB7o0B0Ira+4IzxwLMlhRJ+
	sMHMr6Be0jbWVJhRKWMRzaormlwxyZ+o2EofkewXORpIgLbjVpvUxjCQcSQl+YfTMlHZ9T
	UE8rmtHne4Y5TmubM7NIWK98QCHj+0F+rqBtOZSFGM77VBpgrVetzsILoS9DByN2vrAczS
	5+Uo3R/A6vnceg12D8eqIMTFGAGJV6sRpxtSZ3hp8//m2IPi36uIIWtNhU3PLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dh/52GRhLbpp4gh50fAuvfQix7j7Ih1160L/CdLI8l0=;
	b=2Mr8xnCCJXQNYK40wYiyDitX1rtgKVSav9FlO5VPGJbI6wVmqI0M9y1M9rUGvQKL9tG1OS
	lphjzmGYwmWjK5CQ==
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
Subject: [patch V2 34/38] x86/cpu/amd; Invoke detect_extended_topology_early()
 on boot CPU
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:53 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120256_067793_8EAF043A 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Thomas Gleixner <tglx@linutronix.de>

The early detection stores the extended topology leaf number which is
required for parallel hotplug.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/x86/kernel/cpu/amd.c |    2 ++
 1 file changed, 2 insertions(+)
---
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -692,6 +692,8 @@ static void early_init_amd(struct cpuinf
 		}
 	}
 
+	detect_extended_topology_early(c);
+
 	if (cpu_has(c, X86_FEATURE_TOPOEXT))
 		smp_num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
