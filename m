Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E79C77B78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=iGvG7zVqF43VSSanWM13kjZRAhbZYWRSIqk+kaDG0nM=; b=mGxQ2yaetmGUAX
	78itm8RqGTVYZ6BVbKh5u2aA8rWCO7Ww1+47X8ffoMFcVn/VpouJRl4iEmpUxI3GpQ5hqmyFs+DSF
	PZ6USu5V0ZfSBliqIWyMruIIKdhB3zRm/Cyx7WtGii3rd7yYgS9bXFZcJakuWAAwucbBZIk/FpPa8
	b8RnFs8sSL9B6jG6Lcygx86C4aJbd7LIHiqeZb/ebIJKvP03W9W48SmFV/6pEkPNht9P76Fh1HrP2
	Kn7UiyigjXPZbg2AWM35s+nvRTQ0dRus5NHLWpbd+mFBRagaD1rPy/Nrd0tDftDJhvQdRRs6yURNp
	yPeiFRbZg0AGyQM1zcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoM-008nmB-0r;
	Thu, 04 May 2023 19:40:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoK-008nlh-25;
	Thu, 04 May 2023 19:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=PaGuo8GAZ65ZbtTn7wzwCB2xmjp/8CcdVtBqqK3zJyY=; b=grKV0r2Q7hD5rep2ubOwb2J0Wv
	Qx9mZsYVm4UZLA+/WBpNu4QPG/YEupRz+eZiHXv/VUhM5uOL/g6swKkxxxrbCu+uYEfcscxTs5dvE
	q/4cgHWtJfirec5x3W5K3gwF6/nSBesavPP5YWbdowZVjTXaTwy6c6Agnf8N4NcrI4Z8IGMDCSK8l
	02MqHkipZ5H6OXSMSr0Aes2sj9U40ZTtgpkeCMOSWXTQCC/EgcJO327VYHG8IQ40yIbOlmkJ9lh1N
	JgyLrcFWyQmWByp6OW1StBpWzgxBu6h2KxUx+fYk3VwkZMX4RqkEkEmpzeGDEFjrHcDuCOPATcmqi
	0qPiPjGA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueEC-001o5Q-29;
	Thu, 04 May 2023 19:02:59 +0000
Message-ID: <20230504185938.232336513@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PaGuo8GAZ65ZbtTn7wzwCB2xmjp/8CcdVtBqqK3zJyY=;
	b=WBrmRYfVh8Hf7VAtaZM+773NG/l2NaZEQY2PbsMWpwgijTHlkaPZNZwTTqZqSePaJs28Tp
	huH2qX95r4oDUOSFSd9zA+6+RZv5lgr0xa0QdgDkEncw9LVXBvKPVIlHpBCwardNQlPmIT
	cajVqbzngFG+dnpn2I0UeA+RYWcEBwo1QkYYSYABAtHiWYiay4DXWTSDKMd3/FerfS7z8b
	xwX6otdMILDZ1YbCULvPsUARGQzswNTUUkZzB3iKqcysyV9JxG2dUxCWqjPi7FUYFLn/3T
	jkRxQ4LmxpZMkrdtxeZw1NAb25wiC+Tx1duuJ885D0xawxhq7zhP9DRXxAmkFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PaGuo8GAZ65ZbtTn7wzwCB2xmjp/8CcdVtBqqK3zJyY=;
	b=G0tsDBn5b6jENP+Wz6pMSYtlj20+hRg4V3sQlU3KTcd+8sMa78JVCQNTfSLn2dU5TfjS5i
	VD5uznhB/0z5zkAQ==
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
Subject: [patch V2 35/38] x86/apic: Save the APIC virtual base address
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:55 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_200257_367877_66962E51 
X-CRM114-Status: GOOD (  13.59  )
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
