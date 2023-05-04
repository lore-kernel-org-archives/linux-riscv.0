Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB57C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=4vGaVyHcFlGgeazOStXJgjHTZw2OMlxZh1QhmetK/J8=; b=EMgcgLumg1ecmS
	uUMsaS+ZXKymn75umkBI7qdYboo9NxhF28pEHFJhX6s0tS4N9/JLhNfQvM5G3gCiuEt3aLO7ap+nI
	cQu8CivwqBz0i6qrBCeKLMw5ZzHmz/WewUORFVB59XnY14cc5F0jQkAj4zuzLupLzI7/+YNd+jfSn
	hChqVf80ReBf84BftUjfcOu7pkCi3ykeaDXJECTNzsWr1oFr7mCiL12gNLv9xPbzz1hFb1y7hgfDU
	qu6sgRRYyNg+CXAhKN73DZYkjOkss0QoIf4y/IiHjNAAtMwFU3pM1cLHcP3aWbPw9iz0lKhYNM3fF
	e9vzNJsaOyWElucOocDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueEW-008eW7-2u;
	Thu, 04 May 2023 19:03:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDg-008dWO-1l;
	Thu, 04 May 2023 19:02:26 +0000
Message-ID: <20230504185937.145906075@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lJLvACyWoTrqBZOps4v6XbP7wlJ3d4Q7defz4e+9Zb8=;
	b=M3KgFVyzFkR4ccZ70dYavQ5/yqmJzYsNUe2w4AYa1zmqPGpOGfvnO2dLe+bqfdSYVxHNmg
	UzxBYDkuh0vO9FnTUv0U0boU0E1jTAuFuEPxGvjM1vNFxZkY4+YKEIRoL7asL6MLh7WY2k
	YHroxEZc/MyAi6EghJhWG+wOe//5AznxGGSpRWucK1h/BnTyT75KngcAYt8WZjiMtq166b
	mZZvUfn/tKwnN+lYf/c6UiDK6atXikbDlaDBZ4sMT8u+PU/SPukxmYsr0YlXnC0aFBugr6
	4bUgvijH50TXxyxKZ9qydiyNaQwVfzl3UXTSijqX2pY50ezKH3gbSbXO2Pf/Zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lJLvACyWoTrqBZOps4v6XbP7wlJ3d4Q7defz4e+9Zb8=;
	b=YUlyUuTQQYH6MyD4cTuFQt3gYiD8H4Dxlm3l2cVGkFebVjVj9D7krF98nosGppSH1sXEJ5
	189JeF0cp5TwVnAA==
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
Subject: [patch V2 15/38] x86/smpboot: Remove wait for cpu_online()
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:22 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120224_798412_0CB14064 
X-CRM114-Status: GOOD (  12.92  )
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

---
 arch/x86/kernel/smpboot.c |   26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)
---
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -281,7 +281,6 @@ static void notrace start_secondary(void
 	 * half valid vector space.
 	 */
 	lock_vector_lock();
-	/* Sync point with do_wait_cpu_online() */
 	set_cpu_online(smp_processor_id(), true);
 	lapic_online();
 	unlock_vector_lock();
@@ -1110,20 +1109,6 @@ static int wait_cpu_initialized(unsigned
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
@@ -1170,16 +1155,9 @@ int native_cpu_up(unsigned int cpu, stru
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
