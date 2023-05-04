Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4BBC77B78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=n8qiJLwH0Id5CSHHV9oR6ehw7jdOVAI/qJnryHJo/98=; b=UK5DkUu25nP3PW
	1ZjtGjoZh96UXCCAZ9AsDUb6M+QUbK/XtE5oylkSytQ2gXeq9Gen0wGGwWu7n+irLanBMU2mB2H3C
	EVUlYSG/7Pg9GU+cLqdcP2ErW95B+J/loeAdwtZEwbMQpLEJV101ki275gPlHnSX7QsWilpdxIPjV
	pZM2hySHAPrClqR18xLF0X6w2MTSJhJKbbKC9QZHvs3vVdAhlIp2dAVq+x8BqH0Wf1vGH9Qh8mX0t
	QPDQEapjsilc7Y4PRqOQxl/pk6Sgwa8hqwiaysJXnIsDgyHkfMh+Eg4sdDovDCwSHduCtAATGkw7d
	1xTzBJElpbrYzjwHyWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueEc-008edn-39;
	Thu, 04 May 2023 19:03:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDi-008dYs-0o;
	Thu, 04 May 2023 19:02:28 +0000
Message-ID: <20230504185937.201611990@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8IR2ZEar7xSTX3+WcC3NFIdAp4AUTKg+YP70lXONDYs=;
	b=b5Dhpk7DXri1g+Jk4Fccefqph5HHh5m0O6WHx1dP1v8spz8TW/ZVEXRzP6Fu5Vyp4twGau
	0WJ5VSOP7FkG0YM49DJA3ab9WsH+lMCnQQToJbW5YLIvGGqyCD5SuatG+70PddmmocvInY
	sbywrL3O4QW1MGnAo6cSBXhCM/VRCDBpxMydY3h/7/ooJkjuTTpet2ZIX0gkrKNjXC4iyZ
	NM25MYCPlURsUrvY1AdwvXfa3J2aswhoiO4UsIkjW2ZgbjIhOmU0uQ9SDbhRPFEyzNsNh0
	mS7KdesNxpuJcwz0hAomc0k47L5YQTKWUQ3/pEIBgfRwzYecCD6MkvQPPrVSxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8IR2ZEar7xSTX3+WcC3NFIdAp4AUTKg+YP70lXONDYs=;
	b=dn+I2+Yxq6eST9WYLeBz7I//tSeh1zP1C4UnkiRYUPrB/Bi9OJVO0kV5NCl8mWHGp/F1Kx
	csRGXLzl80A3yQBw==
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
Subject: [patch V2 16/38] x86/xen/smp_pv: Remove wait for CPU online
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:24 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120226_477327_2CB69257 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org

---
 arch/x86/xen/smp_pv.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
---
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
