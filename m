Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2584C77B79
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=KhoN2TuyJG/L4rB+RrEvurVlxxoy9VHk9M5tvn+70no=; b=sG0V2nA0U0U8vG
	anzAWoB5nhVxhzNjeaR6wrq+XWr8j1PBjNPX4NGFde4ZAyqtH097NOmSr5tKMOeQK++E6ROtng+Ta
	oGMopK3bewOlryl2OaiOLBLE9quxM7Sp99iZDBL1ovI3lLj4+EJy7KCXqnHtyafb/CZ/X1eg7E+yM
	fNq457NeCQcyEIRbJIfbMTio9vHNuzSxvHToCF7SSddj1ANMy6fkw4RFxIXMNMPYOiIPsRLU5z2pd
	tlhR96GJTfjk9bXzxpiGJHUWwy5vo5U3LzhxwUODXz49Oxsd8g2ox9DoGwtBQjQ9fzokz+yqPz+52
	gWD5EPaTGyGEocpSHY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT8U-00AmWZ-0R;
	Fri, 14 Apr 2023 23:47:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5u-00AkHp-3A;
	Fri, 14 Apr 2023 23:44:44 +0000
Message-ID: <20230414232310.256412375@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=e1FMo66EmKhD6c9vNMbCMEr10b7nb30z1HTBJhSwsws=;
	b=gZ0HEhv3acCl5QBYyuBxsWswUfiT2pTSEiPx8KAuYf607AwMRXvsLBlYW5dljp8oWs/ntm
	Rl62blc06B+wdYag6mxiaHF4d6UazbaaiGafHMeetJ/A7Hs5RVhUzMngs/dEe59idC0O2F
	aA4jOVKszqOh4s2mn+PKplYpnPle5vYAOnMKw27lKXhJvIh/kbhLy4lRj7cXXA/G581Bej
	PsarGBYF6AEmBjKJMVj8L9q7SGw5rle2qMtTuVh6V6kezaC/bwaovVLX9d1Zsm+GX8ANmu
	PhMCi/IYxY/Oqm30JTDcZDBgs/Y7EGdHwcz8miDR/Arr0Wrr//IGKwmjd5YAMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=e1FMo66EmKhD6c9vNMbCMEr10b7nb30z1HTBJhSwsws=;
	b=4fNwIQeLJaYUXs5/LQAEGEGLbWkObI//eYOHt1swXrTx799wwKeZFlTzry5MJCiAr70s7q
	ypFOiCNeSLElyzBg==
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
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>,
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
Subject: [patch 17/37] x86/xen/hvm: Get rid of DEAD_FROZEN handling
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:41 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164443_187285_FE296C3E 
X-CRM114-Status: GOOD (  11.48  )
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

No point in this conditional voodoo. Un-initializing the lock mechanism is
safe to be called unconditionally even if it was already invoked when the
CPU died.

Remove the invocation of xen_smp_intr_free() as that has been already
cleaned up in xen_cpu_dead_hvm().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/xen/enlighten_hvm.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -161,13 +161,12 @@ static int xen_cpu_up_prepare_hvm(unsign
 	int rc = 0;
 
 	/*
-	 * This can happen if CPU was offlined earlier and
-	 * offlining timed out in common_cpu_die().
+	 * If a CPU was offlined earlier and offlining timed out then the
+	 * lock mechanism is still initialized. Uninit it unconditionally
+	 * as it's safe to call even if already uninited. Interrupts and
+	 * timer have already been handled in xen_cpu_dead_hvm().
 	 */
-	if (cpu_report_state(cpu) == CPU_DEAD_FROZEN) {
-		xen_smp_intr_free(cpu);
-		xen_uninit_lock_cpu(cpu);
-	}
+	xen_uninit_lock_cpu(cpu);
 
 	if (cpu_acpi_id(cpu) != U32_MAX)
 		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
