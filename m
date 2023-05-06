Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B54C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMCFkzQTozhi+/lSjc6GuxwO2zdCacz69ISR9HtqnmA=; b=I6pb9Dqlw4je35
	jwludFx99f0lDdjh7+5SoM3btOAWe5Pe3mKLTkdiQclEsDMPgGHjh/s/QUOBnY9DIFlhmUevAA5pN
	xtfYJYtYy3W3rB70xZt4h5Mr00AdVwMMfLY3qXgEvdQsml1VuWsvnDcfFyGMqOImzEc8Tgc63B0HG
	xX8BJu9Cx3UtZ5vPmCb4geI9VH9iYovDx/V4WfDVtbqVIjtL1u/qzAJfIHvf2ZQuRr6VzYka/v9Ki
	Lf5dq7wk7CWcFXMVYSlqNc85uw9C4MDR2Wz2xHKfQbwUBvtKiqIX6/crXEDCl3431PgZYEJZUZeKP
	TVmpOxiCFP06RTVQ+vXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvKgJ-00E0iV-0P;
	Sat, 06 May 2023 16:22:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvKgF-00E0h9-0n;
	Sat, 06 May 2023 16:22:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683390158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXHfBgcGHt/ZfPwa+T595dnepfFJKJnpLjR3JhBl6Q0=;
	b=1czMZh1cRjeqiQ2TZA6GbMVHHXEF93eQIVvQioB8FE/pRwMNCJ9iNbT002o3Vf8Q1PmjjT
	pMzD7AC5NROe0zWPr/xkstx8tP21FQigIYhXnCedHf48++FNK52empvCyZE4IMSf7ryah7
	wwDm68n14K3LZeFvyQ99Fwubq6JJjmTxOyIllycil0ZJfXjm8tULzw2/ivE/eeRZ3vZ2Ce
	eFzoWJEYtyiUQ3YTBmQpXzsA8QFgMuJS8CeTY8f2OfEh+NvACDq69zDAubztHsM41nl1p1
	k+Q1vY7kiaQqTaWRFrb4KJC+127qTmzlxib6lozIfkeM3gQq7L3F5SIRCIw/xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683390158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXHfBgcGHt/ZfPwa+T595dnepfFJKJnpLjR3JhBl6Q0=;
	b=qtQ0xS4FhuHdv2/qWAJNtp26GqvWQxksH6Mo/Q1MgLXE9WE0n6Pih7C913p3eWGR7QXk2c
	rCYD41DUjLVIXsBw==
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: "x86@kernel.org" <x86@kernel.org>, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr
 Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Usama Arif <usama.arif@bytedance.com>,
 Juergen
 Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Russell
 King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark
 Rutland <Mark.Rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
Subject: RE: [patch V2 38/38] x86/smpboot/64: Implement
 arch_cpuhp_init_parallel_bringup() and enable it
In-Reply-To: <BYAPR21MB168869144087644F89BAC89FD7739@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <20230504185733.126511787@linutronix.de>
 <20230504185938.393373946@linutronix.de>
 <BYAPR21MB168869144087644F89BAC89FD7739@BYAPR21MB1688.namprd21.prod.outlook.com>
Date: Sat, 06 May 2023 18:22:37 +0200
Message-ID: <87sfc92zw2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_092243_441804_7C6513BB 
X-CRM114-Status: GOOD (  17.08  )
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

On Sat, May 06 2023 at 00:53, Michael Kelley wrote:
> From: Thomas Gleixner <tglx@linutronix.de> Sent: Thursday, May 4, 2023 12:03 PM
> [snip]
>
>> @@ -934,10 +961,10 @@ static void announce_cpu(int cpu, int ap
>>  	if (!node_width)
>>  		node_width = num_digits(num_possible_nodes()) + 1; /* + '#' */
>> 
>> -	if (cpu == 1)
>> -		printk(KERN_INFO "x86: Booting SMP configuration:\n");
>> -
>>  	if (system_state < SYSTEM_RUNNING) {
>> +		if (num_online_cpus() == 1)
>
> Unfortunately, this new check doesn't work.  Here's the output I get:
>
> [    0.721384] smp: Bringing up secondary CPUs ...
> [    0.725359] smpboot: x86: Booting SMP configuration:
> [    0.729249] .... node  #0, CPUs:        #2
> [    0.729654] smpboot: x86: Booting SMP configuration:
> [    0.737247]       #4
>
> Evidently num_online_cpus() isn't updated until after all the primary
> siblings get started.

Duh. Where is that brown paperbag?

> When booting with cpuhp.parallel=0, the output is good.

Exactly that was on the command line when I quickly booted that change :(

The below should fix it for real.

Thanks,

        tglx
---
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -951,9 +951,9 @@ static int wakeup_secondary_cpu_via_init
 /* reduce the number of lines printed when booting a large cpu count system */
 static void announce_cpu(int cpu, int apicid)
 {
+	static int width, node_width, first = 1;
 	static int current_node = NUMA_NO_NODE;
 	int node = early_cpu_to_node(cpu);
-	static int width, node_width;
 
 	if (!width)
 		width = num_digits(num_possible_cpus()) + 1; /* + '#' sign */
@@ -962,7 +962,7 @@ static void announce_cpu(int cpu, int ap
 		node_width = num_digits(num_possible_nodes()) + 1; /* + '#' */
 
 	if (system_state < SYSTEM_RUNNING) {
-		if (num_online_cpus() == 1)
+		if (first)
 			pr_info("x86: Booting SMP configuration:\n");
 
 		if (node != current_node) {
@@ -975,11 +975,11 @@ static void announce_cpu(int cpu, int ap
 		}
 
 		/* Add padding for the BSP */
-		if (num_online_cpus() == 1)
+		if (first)
 			pr_cont("%*s", width + 1, " ");
+		first = 0;
 
 		pr_cont("%*s#%d", width - num_digits(cpu), " ", cpu);
-
 	} else
 		pr_info("Booting Node %d Processor %d APIC 0x%x\n",
 			node, cpu, apicid);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
