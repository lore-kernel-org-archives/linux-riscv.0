Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D0AC77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=LGSLhxRI+DLFnE8pOnJOxIZ8hWFmOG948a3NEYXH5EM=; b=3ub6dxTgdcopuT
	1OELGeALLJElEE5jsnywVuvoDC/76Dkh+LSfqdU+AGZ+EBm+lKauC8XwPqE9yhL1igDvGCr7mii64
	2UW+qxJ9b15Ux1jsfGe84vyX8QKtbwyDZDkZvYAN0ys67U6p0iy1Gfwbo/M3i639euOwI+LYh0vmN
	vesYuG/QMcEoDw1jMeDHG8IfYZ15BCqZUmpbcjFbJydWl+gR4j53CEa8d15BhUWzySYSmwB95eEjA
	Lx2va+TVZIetVvF2vRMoaunwd97SXRlzzm4QtLiVs+D0FBftqejeCfDvPyeGdGG5v+Mp9DE1iIivn
	G3jty/xcHDS5sqXMNh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnTAV-00AoU9-2u;
	Fri, 14 Apr 2023 23:49:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT6D-00AkbJ-2C;
	Fri, 14 Apr 2023 23:45:13 +0000
Message-ID: <20230414232310.941680232@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PwaT1nVbkmNxpYn2jntunVyX300rI6JOSPoxKblUFxc=;
	b=J4d36wqGXDsa4D15fuC6bgECzfAAInQki6KA3SUyC98aD0yQW6gcNLFjQOCHcXv2J+orZG
	5Qmhd0e6dbHL514sP/COcIuWz15soNEsWHzEh1yBv2+hd5B8wqzYOidLR2BE5cayvWqW8Z
	HTkU8Nrl6+H70MJnTBAZDmHlfDfKJpBLY0P7kmzee0usDqsCKruEINfZUsjihRGa5dTOub
	nsf1V7hsU0pvXa2Ve2ehvBeS9w4NMv0lT4Qar9j26QhzX8zbcfe2cv28EW7JmGjaOXAvGg
	fSx2t8XhhVFut65VN9kClCBXCqftJpibwk/DAZDt6leoEUA5kSkPTRcDM8b5qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PwaT1nVbkmNxpYn2jntunVyX300rI6JOSPoxKblUFxc=;
	b=GT9ybsNnlf8a2CqrpgJaThMxA4ODF78eIoN2mtLu9TxUz4hUltbB6uZ6jFavUSEgOGT604
	TxVe7hxr4awf6HAw==
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
 Mark Rutland <mark.rutland@arm.com>,
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
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 28/37] cpu/hotplug: Reset task stack state in _cpu_up()
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:59 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164501_938281_51D2DFC2 
X-CRM114-Status: GOOD (  15.78  )
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

From: David Woodhouse <dwmw@amazon.co.uk>

Commit dce1ca0525bf ("sched/scs: Reset task stack state in bringup_cpu()")
ensured that the shadow call stack and KASAN poisoning were removed from
a CPU's stack each time that CPU is brought up, not just once.

This is not incorrect. However, with parallel bringup the idle thread setup
will happen at a different step. As a consequence the cleanup in
bringup_cpu() would be too late.

Move the SCS/KASAN cleanup to the generic _cpu_up() function instead,
which already ensures that the new CPU's stack is available, purely to
allow for early failure. This occurs when the CPU to be brought up is
in the CPUHP_OFFLINE state, which should correctly do the cleanup any
time the CPU has been taken down to the point where such is needed.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
---
 kernel/cpu.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -769,12 +769,6 @@ static int bringup_cpu(unsigned int cpu)
 		return -EAGAIN;
 
 	/*
-	 * Reset stale stack state from the last time this CPU was online.
-	 */
-	scs_task_reset(idle);
-	kasan_unpoison_task_stack(idle);
-
-	/*
 	 * Some architectures have to walk the irq descriptors to
 	 * setup the vector space for the cpu which comes online.
 	 * Prevent irq alloc/free across the bringup.
@@ -1581,6 +1575,12 @@ static int _cpu_up(unsigned int cpu, int
 			ret = PTR_ERR(idle);
 			goto out;
 		}
+
+		/*
+		 * Reset stale stack state from the last time this CPU was online.
+		 */
+		scs_task_reset(idle);
+		kasan_unpoison_task_stack(idle);
 	}
 
 	cpuhp_tasks_frozen = tasks_frozen;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
