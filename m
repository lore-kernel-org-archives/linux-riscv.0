Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A37C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=LOK1T0Aca8VQ8oKjK8Tb6uO3lk9md62bJFG0+6brvds=; b=v40RFvhrCgU33s
	L0G24u0J0iqhU/8IbQAL+8uk2QOLhGKEYYXedAjuxCCQsXHjQ3DppsAvtyauEKa9gSUgFfhcLew0S
	jARn1/J8xQhhpz6rXgCCLz5+qHPn8B6326GqDIT5jOQKt9J7NReo8qEht1ysqz3fOnqaSpXE7Yt5J
	9XWUNiChO24ESP+DOlVdp1mDLxQLFym2IyLs+riVbrhMfpH1QW0CcgqeuKy8OtKSh2rKQvsKSZk1m
	pCqHZNGawwNbzQD1htyv4hqKIw/qsZYJd6TzwtoqzSkqcvr1m0k5oiTqWjrg+tuQG1iIOWQXX+rEy
	Dok+/wd5MoCP1oHvsKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6nX-001Ftg-0E;
	Mon, 08 May 2023 19:45:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6mV-001Emw-0x;
	Mon, 08 May 2023 19:44:32 +0000
Message-ID: <20230508185219.070274100@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rNSjycztoby2JMftnREWdlBREDazVhJLVJwM8M2fPkk=;
	b=OpZe9lLKyKO6h5IfhQv2j9WvmIn2yf65zqaHV7y3wQleqSqr+f6etMGdIS9Efc2LFhQWS0
	5ftRjwED05+6AZBpiAUMBSD+9Bs4XI7ErbN7ZPJB/dWcAHVXO0162v680HbB1xi5BIj6b6
	2VmnddYXWQAy5QrMp52rjUb0ug4Nu5d4+araY9u5t682iYzuMEwChigCf9eS54/VMeAbyp
	FHpBHrvUOTNlGmggxAiWaYQoqPnvlTGipZEoQY9ETwz7wg7cLp6+qhnkF8oJI3QMQlbXXd
	MwefEeZHkRCA3XHukRzDC06izW3/O9wI5c+MU2Y7YPlYsyj6psxCoZFPmRCp2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rNSjycztoby2JMftnREWdlBREDazVhJLVJwM8M2fPkk=;
	b=L+J15yNAu9kuVnMklFhkCkOJaiMb9jA+tCWcI3g0yk74oGzDCt/9UexPGrZp3cttAT1h/e
	UE8ijpRbZRAquYDA==
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
Subject: [patch v3 33/36] x86/apic: Save the APIC virtual base address
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:44:20 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124423_548924_48ECBB18 
X-CRM114-Status: GOOD (  13.67  )
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

For parallel CPU brinugp it's required to read the APIC ID in the low level
startup code. The virtual APIC base address is a constant because its a
fix-mapped address. Exposing that constant which is composed via macros to
assembly code is non-trivial dues to header inclusion hell.

Aside of that it's constant only because of the vsyscall ABI
requirement. Once vsyscall is out of the picture the fixmap can be placed
at runtime.

Avoid header hell, stay flexible and store the address in a variable which
can be exposed to the low level startup code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/x86/include/asm/smp.h  |    1 +
 arch/x86/kernel/apic/apic.c |    4 ++++
 2 files changed, 5 insertions(+)
---

--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -196,6 +196,7 @@ extern void nmi_selftest(void);
 #endif
 
 extern unsigned int smpboot_control;
+extern unsigned long apic_mmio_base;
 
 #endif /* !__ASSEMBLY__ */
 
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -101,6 +101,9 @@ static int apic_extnmi __ro_after_init =
  */
 static bool virt_ext_dest_id __ro_after_init;
 
+/* For parallel bootup. */
+unsigned long apic_mmio_base __ro_after_init;
+
 /*
  * Map cpu index to physical APIC ID
  */
@@ -2163,6 +2166,7 @@ void __init register_lapic_address(unsig
 
 	if (!x2apic_mode) {
 		set_fixmap_nocache(FIX_APIC_BASE, address);
+		apic_mmio_base = APIC_BASE;
 		apic_printk(APIC_VERBOSE, "mapped APIC to %16lx (%16lx)\n",
 			    APIC_BASE, address);
 	}



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
