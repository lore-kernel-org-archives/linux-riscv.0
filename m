Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1C5C7EE25
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 20:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=tfq6sLVK5dsUw+G2mahij0phE/E8saSdWUcTC8u3S7Y=; b=0WZN5llWtkFe8s
	PWb773X/6R4sPp3ygWHJzBnDGW2R4r2ZkpBJhM93Twb5rhzFnf3xD3XEcOrLyalg19wSfb5wJMvrg
	TdvmwVOendosNTWCVH7pgEXK1QTDIZbjiz7F/B6wyrL0AAyY/io4IaS0bf3zL34IoqCzoU4H2NH1P
	szD1QgUCQyBjm9q2GklRwXmUGnwYw4CyMN7y0hipcqW3yIjquVlqsoYbGbQWksNx1Rvp2qZoGQIlW
	NlAsqz94+rshqb3m+cuZ8UUxHA35WEkCF8dHBsmU8GDY56OAgoD5O/9yEAFUnBs9OADkqL/CG0iRE
	2SrirS3rNj+n7Ueb0Vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7el-001LnL-1G;
	Mon, 08 May 2023 20:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7ei-001Lkd-2C;
	Mon, 08 May 2023 20:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=HVjUF1EbgoHvP2JET34IHqSOI4Hcbuoi5HyMhczyA/0=; b=bIcek0mx2pDOrpfeOJ3xq+zWWS
	VMP7VHSF+f0D7U2TZitirNrntVQSEaSdgL77aRdtpbLmhVgtAUVSy/6frGDzKYjop2CPeaJtiXHzU
	KVXuXBtBX4k8NSGwBw/tjBwsLLt/5SY7SX0O0Ju3uLQOgQVlmW+Tvt4ta2J1Yr8jTa8CD5JbhM7Yr
	CEfqpbHdCiyLXtITyYRiqTpRKbhiyI2Y/9FFcpqByUXcu4GyObS76bCMoFQpYqhYoqHfpmuadbPKk
	kMxzKBnkNqJdSZGEuFmgYCLNhAgCZD1QXe6TZCAE1slP8Kkf9+qFdCrWEYf5+Eqznu5EnjV8hQ2rm
	okn7Tawg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6mN-005GpY-0a;
	Mon, 08 May 2023 19:44:43 +0000
Message-ID: <20230508185218.802324532@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HVjUF1EbgoHvP2JET34IHqSOI4Hcbuoi5HyMhczyA/0=;
	b=f87S8Ive1ie4K+DuiLg7usxJY5CRCksJCqSgCkxD5uZH7y4x+OJFuZWNm0Taip1XPPiDD6
	MNH0b+hp2o5RbiOVox1gno/kYayr67OXDsY3LQy/XL1EajtZ65KomNmMKrjSPGzPHIQ6mt
	Bc0Q0qOP9/5ItgD7CpD7wNvTDGfz7YuG1nQmd5y2Lv904N1i53sg9+MQ+HioP83fuoz27l
	K0h3votn/bkWzE6uLiONR6KdsjL/p4GqVASZ+gwe2bmO48I4HcfU9n8eyvXRqDwkYb7s44
	Njvuj3M2dK+aBiLKQsshzndlNWX014TMRWinVJi/9FwvNn2qCERvNBTYOkZNDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HVjUF1EbgoHvP2JET34IHqSOI4Hcbuoi5HyMhczyA/0=;
	b=0jP1z8zyc9UIx2xHWlL0pghnJTSR5ytXBwb/OqMmY//ybrAvid6zf5b8IChN8VPr3CVlpG
	1ard2l2bnsfXlBBQ==
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
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [patch v3 28/36] cpu/hotplug: Reset task stack state in _cpu_up()
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:44:12 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_204441_770232_3145E485 
X-CRM114-Status: GOOD (  17.14  )
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
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 kernel/cpu.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---

--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -771,12 +771,6 @@ static int bringup_cpu(unsigned int cpu)
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
@@ -1583,6 +1577,12 @@ static int _cpu_up(unsigned int cpu, int
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
