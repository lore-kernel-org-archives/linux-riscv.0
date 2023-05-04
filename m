Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ADC7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPhf+V3QAQojPQ6f1JPjdTxmbQKg70mMgTDxUobpGMw=; b=Rk1O4jvl78SEgF
	lwvN30pvdGsow2IE6QsJc+YxVlps2xl8rvY9uiHPIW+CkGad96k95nDDOOEHP4OcXzx6gpTvhUX6E
	PBUT3GAnz7h79Wvi0e+QIrCvZ02xBe6NHC6RS6v3Vc7ZmixiGlWgt7amO5PmUfZJX6h599fxcNzh9
	qr7L5LiSj9J5+IhXQdqBNbsghJZR0BZsu5JU97i/IFoEjqrEC7q+8bW6q1Qmhx1qdehDnajo7llop
	PDV03GvjR6GdRXGCXqR0Lrng/o4Ane1nq9/suzae5LNELCxPfUs8BEJ7thqhQI1FCmSSe8N5eKEB6
	rf9UhEzEFqxSlLv0favw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudyB-008aaQ-0C;
	Thu, 04 May 2023 18:46:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudy7-008aYb-2D;
	Thu, 04 May 2023 18:46:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683225976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OIAcVs2YXBnNfaPvpuizW2PEW4lhJ1YnG6MUoZkO7aY=;
	b=3+tD+LTP2nHbLKQ6ayQSSKK8VpBIuQK3gXforAfUYbXvx4vM+fYGuufKzSpG2saVKOpTsV
	to0Q6mzIGbAQjDqsOQkje2Tja0U/TKz3F+TviP3kf+19hr3bEm6s4uGo2F+s+PdBgPIGkj
	gHjK9Yi0pM4GUZc5ZpONvd31Hppwcu+Bcbd8TlaOcVKhOuZIjToIAW5YXeXW3Go5sZpcCh
	htSi5EE8To3+PKCGlsNtyNrMRTsE8PlVdNzqWmd8pkRxZ1vMQC2VO2mXVu6cVctYauCbM0
	4H8XFlx6BIILGrhdr/EBrOtC8Cm0866nFAfWkkLlHu0QtdUMHZ2jk6jWm8xf3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683225976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OIAcVs2YXBnNfaPvpuizW2PEW4lhJ1YnG6MUoZkO7aY=;
	b=pPb8Wqh2Bj6AkjBEVHoo9nA/DLOEH7EgQ6O+EgS1RtAjQlyepgF0Tr/3dF7rDdC5tR1PRC
	DisRQOSHrsQxZlDw==
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: "x86@kernel.org" <x86@kernel.org>, David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst
 <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr
 Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Russell King <linux@armlinux.org.uk>,
 Arnd
 Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org"
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
Subject: RE: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <BYAPR21MB168888DC5432883D8866BA40D76A9@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <20230414225551.858160935@linutronix.de>
 <BYAPR21MB168888DC5432883D8866BA40D76A9@BYAPR21MB1688.namprd21.prod.outlook.com>
Date: Thu, 04 May 2023 20:46:15 +0200
Message-ID: <878re43pfs.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_114619_870674_EF0EEB7A 
X-CRM114-Status: GOOD (  17.63  )
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

Michael!

On Thu, Apr 27 2023 at 14:48, Michael Kelley wrote:
> From: Thomas Gleixner <tglx@linutronix.de> Sent: Friday, April 14, 2023 4:44 PM
>
> I smoke-tested several Linux guest configurations running on Hyper-V,
> using the "kernel/git/tglx/devel.git hotplug" tree as updated on April 26th.
> No functional issues, but encountered one cosmetic issue (details below).
>
> Configurations tested:
> *  16 vCPUs and 32 vCPUs
> *  1 NUMA node and 2 NUMA nodes
> *  Parallel bring-up enabled and disabled via kernel boot line
> *  "Normal" VMs and SEV-SNP VMs running with a paravisor on Hyper-V.
>     This config can use parallel bring-up because most of the SNP-ness is
>     hidden in the paravisor.  I was glad to see this work properly.
>
> There's not much difference in performance with and without parallel
> bring-up on the 32 vCPU VM.   Without parallel, the time is about 26
> milliseconds.  With parallel, it's about 24 ms.   So bring-up is already
> fast in the virtual environment.

Depends on the environment :)

> The cosmetic issue is in the dmesg log, and arises because Hyper-V
> enumerates SMT CPUs differently from many other environments.  In
> a Hyper-V guest, the SMT threads in a core are numbered as <even, odd>
> pairs.  Guest CPUs #0 & #1 are SMT threads in core, as are #2 & #3, etc.  With
> parallel bring-up, here's the dmesg output:
>
> [    0.444345] smp: Bringing up secondary CPUs ...
> [    0.445139] .... node  #0, CPUs:    #2  #4  #6  #8 #10 #12 #14 #16 #18 #20 #22 #24 #26 #28 #30
> [    0.454112] x86: Booting SMP configuration:
> [    0.456035]       #1  #3  #5  #7  #9 #11 #13 #15 #17 #19 #21 #23 #25 #27 #29 #31
> [    0.466120] smp: Brought up 1 node, 32 CPUs
> [    0.467036] smpboot: Max logical packages: 1
> [    0.468035] smpboot: Total of 32 processors activated (153240.06 BogoMIPS)
>
> The function announce_cpu() is specifically testing for CPU #1 to output the
> "Booting SMP configuration" message.  In a Hyper-V guest, CPU #1 is the second
> SMT thread in a core, so it isn't started until all the even-numbered CPUs are
> started.

Ah. Didn't notice that because SMT siblings are usually enumerated after
all primary ones in ACPI.

> I don't know if this cosmetic issue is worth fixing, but I thought I'd point it out.

That's trivial enough to fix. I'll amend the topmost patch before
posting V2.

Thanks for giving it a ride!

       tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
