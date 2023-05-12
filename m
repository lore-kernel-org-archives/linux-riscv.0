Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33593C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=I6v84iqvIvs6iCvAxvCi9m19QqeSw4VRFMKGg2WM6bA=; b=NEzw9blO2g3u6Z
	f3136oOLaizcwlj0h5ELh9AeHwwgAyE3EKaDmAUmNKpc1lNi+czYf1h+xim8eRwimEpt6RKAkcKkG
	LMjmjjfInpzsrjlHEhJclXz+Z78tr4Y44Rth6lfRm42YNr7NbBseGv82UfkY1rAyMYNGtM/fsuS3a
	avlan7OQBC32gX7dTNZLWe54ekw+uoiPP/q2drrRr6Mv7wQxNqqXh++sY7BYYFvKl7CzVuXnowSvg
	mXGMjZ5rPpdgSHjlTz/G5/w9IrdNmOQt1FQk6nevjyh1/AzlLC+YWFi/O3Fz3K2jNPFII5elWFt6T
	P/m8vSca0vsIljhrCcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa0F-00CzqL-15;
	Fri, 12 May 2023 21:08:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZz2-00CydD-1Q;
	Fri, 12 May 2023 21:07:26 +0000
Message-ID: <20230512205256.316417181@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DlXLIimSUyDsLnpaLCie3XUbsPcjE+B3Y5/np73/syk=;
	b=0n8XyUqdMKHvhCV5NvBs8uq0bkyvVXbfLtaGYG0ApQJEOyilZiFp81ncYSBr6upR2FGS65
	C/nM69M5fEGpiISmkmAowedNeMh8stJLEoOo7kEL2Yn2+06PaBevfLVashkK38xEMls2k0
	f/2djYvKqyUSewvgr/tLWZAR3cGWoQ2BFlZWa6eUYCxL/R/BBbwHpxF3oihmcCNqrcO5vL
	DdSUgTidw3Y3j0rys0Ztwy/cnS3zHqjKWZhecFMnqr4ICUwW5Yz4Fvu/UCxs3vooavSjLb
	kpbMhzb9bUAKVmUd7V7KcFTAjo4mQTSyfyHcI0YMf+BOz6gUP+32KRGIcgecpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DlXLIimSUyDsLnpaLCie3XUbsPcjE+B3Y5/np73/syk=;
	b=NxwadJuaL5bNYJvtkxpDH+oWBvMqBd0ae6N3DUYGY2xW3p33/XvIRC9MwzW0Aq6/9Tjy03
	UcA8T+Ga+8Z9ZeBg==
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
Subject: [patch V4 16/37] x86/smpboot: Remove wait for cpu_online()
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:22 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140724_650325_089D1A24 
X-CRM114-Status: GOOD (  12.33  )
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

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/kernel/smpboot.c |   26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -275,7 +275,6 @@ static void notrace start_secondary(void
 	 * half valid vector space.
 	 */
 	lock_vector_lock();
-	/* Sync point with do_wait_cpu_online() */
 	set_cpu_online(smp_processor_id(), true);
 	lapic_online();
 	unlock_vector_lock();
@@ -1104,20 +1103,6 @@ static int wait_cpu_initialized(unsigned
 	return 0;
 }
 
-/*
- * Bringup step three: Wait for the target AP to reach set_cpu_online() in
- * start_secondary().
- */
-static void wait_cpu_online(unsigned int cpu)
-{
-	/*
-	 * Wait for the AP to mark itself online, so the core caller
-	 * can drop sparse_irq_lock.
-	 */
-	while (!cpu_online(cpu))
-		schedule();
-}
-
 static int native_kick_ap(unsigned int cpu, struct task_struct *tidle)
 {
 	int apicid = apic->cpu_present_to_apicid(cpu);
@@ -1164,16 +1149,9 @@ int native_cpu_up(unsigned int cpu, stru
 	int ret;
 
 	ret = native_kick_ap(cpu, tidle);
-	if (ret)
-		goto out;
-
-	ret = wait_cpu_initialized(cpu);
-	if (ret)
-		goto out;
-
-	wait_cpu_online(cpu);
+	if (!ret)
+		ret = wait_cpu_initialized(cpu);
 
-out:
 	/* Cleanup possible dangling ends... */
 	if (x86_platform.legacy.warm_reset)
 		smpboot_restore_warm_reset_vector();


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
