Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA72AC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=ITe9I+mB6gosBs4CsIqQ5fJGEwS6n8ts5w21vkHYrwo=; b=hbqCdi9nS/KphA
	ig6cqOqG0vnXLWN69T2lN4/Lkv9n+b3hBrD31b42i//nmkXi7p60A3WBXGSIpuCDRoJ0J3SIeYzWj
	i+lav8rH8s89bhUckkVvwAiDcneQnmkqEAgLdpzyoFrTdRBEoQHqXY9voQenbpe/6qj29pM+A3Tnh
	HaKs7RyCEiqKuBzf3cxhmog7USwXVg4f0KZYK5RrvsT+O+JyVar1AlCCbjHo/ZpWLoiTHPYCL1eUL
	ZKMnzVkKqXFjpxh9HhSI3d4FzAaOHRxRcGtTu9VQkDPdzDbKpJkY6N7RdtYx1a1mHMf91Kr0Dj86k
	EzNSVFTN41BLiSL5BMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa0J-00CzuR-2b;
	Fri, 12 May 2023 21:08:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZz4-00CyfB-0l;
	Fri, 12 May 2023 21:07:27 +0000
Message-ID: <20230512205256.369512093@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PMK22/HxoxSZKsTx+MtkiiSihvL00YPGs/TFPEL6TlU=;
	b=okTigxEmoNFjuISzZ3w6/Y2KcJueXtK98ysR49cIhhmzWitrnTsrr30PPjCUMPXry4xftP
	J52lH1DVgnpuG/Rfq4wLyAmr6aBgTzg3Kcpzk53VYvl1lEluUMhVlu3W9w3D8aZ28W1fnU
	FYwd2Sfv1zxIrxvZkgBRqufQ3iNj4eO+ry/ohM+Ld/vwoFregiASpdqfC0/pYtJYsd1OgL
	Vlb3BzT7+3vJnR5zuW45X4PcDsWr4so0XRPW7RLUs94CbintoxNd6G1JVdbZNrIt24RqAz
	6rW20AhO6LWDKJUuEPLhETfdZ7aGAlZBRDu8S8t35nsN64xoJdMY+fi5MrLE5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PMK22/HxoxSZKsTx+MtkiiSihvL00YPGs/TFPEL6TlU=;
	b=6Ab3fDB1sVd28x5lyL9nkWKGbymDr5R+6KRuErqPsWXwifdYJwrujMAzLpyfU/ZQhUUikY
	XNL6casob2M1EbBA==
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
Subject: [patch V4 17/37] x86/xen/smp_pv: Remove wait for CPU online
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:24 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140726_460848_9263B3E5 
X-CRM114-Status: GOOD (  12.42  )
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

Now that the core code drops sparse_irq_lock after the idle thread
synchronized, it's pointless to wait for the AP to mark itself online.

Whether the control CPU runs in a wait loop or sleeps in the core code
waiting for the online operation to complete makes no difference.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/xen/smp_pv.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -340,11 +340,11 @@ static int xen_pv_cpu_up(unsigned int cp
 
 	xen_pmu_init(cpu);
 
-	rc = HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL);
-	BUG_ON(rc);
-
-	while (cpu_report_state(cpu) != CPU_ONLINE)
-		HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
+	/*
+	 * Why is this a BUG? If the hypercall fails then everything can be
+	 * rolled back, no?
+	 */
+	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL));
 
 	return 0;
 }




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
