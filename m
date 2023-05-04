Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8ACC7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=UsMh46WTQ6bkyAQVf4i2A1ksJ8d6xWxku/0xelz3Wd4=; b=gRa+40wEQK+brL
	juxiWjSYMbC/IsS+niORBWVFJG9E/fxpuiNBM2a9QnbTZhkLTFfeom3jiCWWL+fR3422Wc8Xs11hV
	CE5YKtqiPtaL2Qxg5K8ytUXyIclLagOaEM04DcCUiB56ZP5ds2kZ/O3CPrByDo5Z5YrpSJxx/JiZR
	nAThtr7phss9gESfoj/qq14eGXzflDqR4gKpyPjbacT5PDNmtyYeVxNVKiTW3ifqzAOBlavqtW0u1
	magx2UCPQLWN+oSDBbmVnBXML76qqgmDQGkpyxHvmMz94JzPrzopRncDp69SxcQbXhON/luKRvaa2
	j52bbrbfL8NqET1oa+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoH-008nl4-1s;
	Thu, 04 May 2023 19:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoE-008nkY-2q;
	Thu, 04 May 2023 19:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=x1gYrMcqzm40p2bz6RsOmSrXlBcSvXXbnfB8HNeCbJU=; b=oH+52N2rSQRR8rGatzAOErIjry
	SHp91y+qBTJRYRB7ZouPbHf7bZfm81liqHsn5lt7LnHgjABUmTI/lpwb/Lhb2L9u+4c5/9k4tJ5Lr
	3T/k9aicHnduixI9TSvuAJPmYpasZZj/373IvtsbOr4ZvduoZv7xRgJy3M4OzkJeSqWHDQs/q+eff
	piZehaPxfBbosFVvlv44QBWOcQPtQB9wvIza0yc21L/CR6tKAYyZAYe/CmVm72QQD5OxHZSOySNuO
	svCHYgXVYq8CG9DVaYq1ZrAcFzLJkmSbhGAKcrLkuLkDiuvxMdw1vY4a6NgO43xQUpWAQM/Xz/NIT
	gAVn8wxA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueE1-001o1A-1t;
	Thu, 04 May 2023 19:02:52 +0000
Message-ID: <20230504185937.858955768@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=x1gYrMcqzm40p2bz6RsOmSrXlBcSvXXbnfB8HNeCbJU=;
	b=F9VwenKVSYd9QFli8bXNV/fz9qUSdzJcPELJ1ngRD9BxyzaHEgcu2cC0/b4kuprOfTMBsR
	NCkyPWtTcKTi4mTU6aAeMY6PYflFdg/QnWMligdTnr5DQ53G/59w7N1RxTuaJMuxKaB+6k
	fnxGx7t6MsQx4TP0A/Wv1B3YJqsjI01JirGXHQPo53zTdX5Z488sLyftTciloBgiN9k5k/
	bzf3t4Qwlj6lxCy0qHukKPQMZGDuh3h1yP7MJWtYXWHVZt3htrK/Qtw9ul4ERCfXuX9Nze
	it6Ui4ad23Dml/cuVbhr6i6cHXzKyVbR3juE2BxVW820qfkeEJiZvG833WVS3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=x1gYrMcqzm40p2bz6RsOmSrXlBcSvXXbnfB8HNeCbJU=;
	b=PK3VhwCrlpzYLlITMOVdXxhPHsDqoA73a6Tz+/QOqHPRfKtGaiwEqnA7EtTcL4VMvMoxp6
	ebRWKW/d8KnEHmAA==
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
Subject: [patch V2 28/38] cpu/hotplug: Reset task stack state in _cpu_up()
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:43 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_200249_046096_DD43E3C4 
X-CRM114-Status: GOOD (  17.01  )
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
