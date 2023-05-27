Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723B5C77B73
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUIKAXTMjy31XwhmGOmYkxM2EaYEynvsjqnjdSTcFyo=; b=TS0kGvuTcZ1xvP
	1/AUPY+IaYsjOqODVEFMjzrcQ1nCqtJCDDewA1CL/01u0E0vnej48rvsz29iWeElErXxrjgTC1zY0
	V3ly/pTk5T5996ZaLXvxXuRDVRcHTHQa1zH4ZvmmsLb7xT/zd/i28hHjq4jJQU0Wy6aJIuJbWunkd
	cPBrO/Ufz8/fOGFwzJhy/4UklfszfMER82LriN/3HTQHpmf7H+oYcIl6iZRr/+T9RgWNMAhD5zieX
	tXzbQIzrbM045COSRpHZgkvCpsg56Cp32/fPmIanrtDIxyoTVORiNKRH0uRT0sk/VCmkY0yyLOb7R
	LiyjRywmJvQOVjPNWcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2u9V-005p0r-1Q;
	Sat, 27 May 2023 13:40:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2u9R-005ozF-2P;
	Sat, 27 May 2023 13:40:11 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685194803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhphG4bdKEhlSrLILx8LQHUnhtq5h2kh7PjylDw7WHk=;
	b=c7tPQEf1tDSaswC+udb6n2rEFtodyCz+0hqKKRaloSAWHscsivpNExWbDw/lNzJYugWAC1
	Jm29ndY/DVZdilpSdABXMmg7zcNPlf2ipCdzoFFpOsDlGdRTaa/cDp4VQIgvIIuUN9JR/Z
	4wJQUUIDzQZJXqPtRi0VknCvN575jHF4GBgn5HyL1/e+ips0AysDA2DuVxTFjRXavrRMCR
	ErEe1ocMuKOicQKxwfjXlIfBvhnKCrT8khka2tjtWb5cZaLE3ZEkUSF51OwhE4SNq1hAJg
	OsmAHNMb9ZxT3Z/Q3tFuCRyz5jSjP+VvrhVlox0l3Z4ceASC3h0ieO88IF9MuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685194803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhphG4bdKEhlSrLILx8LQHUnhtq5h2kh7PjylDw7WHk=;
	b=IAhogYOgiDrfm9G9lFn3jmOMGU4kEEQCTcf6iURfWSFeMNN2CJaahVSnX2MzxuXmnO+mLX
	zbrDN0kZP7Q4fvCA==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <87y1lbl7r6.ffs@tglx>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
Date: Sat, 27 May 2023 15:40:02 +0200
Message-ID: <87sfbhlwp9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_064009_965204_C33A8C75 
X-CRM114-Status: GOOD (  16.59  )
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

On Fri, May 26 2023 at 12:14, Thomas Gleixner wrote:
> On Wed, May 24 2023 at 23:48, Kirill A. Shutemov wrote:
>> This patch causes boot regression on TDX guest. The guest crashes on SMP
>> bring up.

The below should fix that. Sigh...

Thanks,

        tglx
----
Subject: x86/smp: Initialize cpu_primary_thread_mask late
From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 26 May 2023 21:38:47 +0200

Marking primary threads in the cpumask during early boot is only correct in
certain configurations, but broken e.g. for the legacy hyperthreading
detection.

This is due to the complete mess in the CPUID evaluation code which
initializes smp_num_siblings only half during early init and fixes it up
later when identify_boot_cpu() is invoked.

So using smp_num_siblings before identify_boot_cpu() leads to incorrect
results.

Fixing the early CPU init code to provide the proper data is a larger scale
surgery as the code has dependencies on data structures which are not
initialized during early boot.

Move the initialization of cpu_primary_thread_mask wich depends on
smp_num_siblings being correct to an early initcall so that it is set up
correctly before SMP bringup.

Fixes: f54d4434c281 ("x86/apic: Provide cpu_primary_thread mask")
Reported-by: "Kirill A. Shutemov" <kirill@shutemov.name>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/apic/apic.c |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2398,6 +2398,21 @@ static void cpu_mark_primary_thread(unsi
 	if (smp_num_siblings == 1 || !(apicid & mask))
 		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
 }
+
+/*
+ * Due to the utter mess of CPUID evaluation smp_num_siblings is not valid
+ * during early boot. Initialize the primary thread mask before SMP
+ * bringup.
+ */
+static int __init smp_init_primary_thread_mask(void)
+{
+	unsigned int cpu;
+
+	for (cpu = 0; cpu < nr_logical_cpuids; cpu++)
+		cpu_mark_primary_thread(cpu, cpuid_to_apicid[cpu]);
+	return 0;
+}
+early_initcall(smp_init_primary_thread_mask);
 #else
 static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
 #endif
@@ -2544,7 +2559,8 @@ int generic_processor_info(int apicid, i
 	set_cpu_present(cpu, true);
 	num_processors++;
 
-	cpu_mark_primary_thread(cpu, apicid);
+	if (system_state >= SYSTEM_BOOTING)
+		cpu_mark_primary_thread(cpu, apicid);
 
 	return cpu;
 }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
