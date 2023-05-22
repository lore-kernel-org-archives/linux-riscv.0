Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A80C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbFAhOLS9XS49prEOCWIMAwvy4yVFW6ptngWLRQ8zL8=; b=Epke3zO+E98WnZ
	u5A9Vr9fwM56PI3sxrpxMhYRaaUAF4dYx16yhukMEyOvoqJeyoUF0qrjpSV2shu1Iloo3ipp9kZOv
	ozu6EyzFz3Zw9WIxO6DvXYOUMSBDVmECeV79DCSBQ54mT1ndG4KXtz+nNr4GDfA4YHuZHksp0hNXi
	TCooz63kjFtofYleYunDlaw1UGuTtvVfXApujqzGsuvso4AYlNJ5S3srpsjZMfyB/kxuBqzs57Nkh
	qI9nJCj6Ou1zTLx0nXXxrXj/ZSStZfLuUZO+uUnxk4LV67dBY5aLcfe5mNQdR+8QZ+0IYJJNkC7pm
	Q8kSN8L1a1lYa9J690Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Chb-0082UX-23;
	Mon, 22 May 2023 21:04:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ChX-0082TE-1Q;
	Mon, 22 May 2023 21:04:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1684789457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NByQKI51jy2j672ZUXdG7FihvnPAeSwdTvvAedoGpTg=;
	b=MX+9r6HXu/5QEBqc2yVGdayzLN9QC3Spcof7x6wlSwPAvG+JCGl3dIF3Tqjwo831B+7A0z
	HjgfkuU57m3Mx12VWLwF1kWcZOoV7A8fkpM0+EmI1ItXgmcU/k6TXgHZPx8IDVYMbQizgt
	tGVREPK3sLYjlK2mAsLydenhzGmSLA3xyVTQNIN837Vka6O+yHpXvp2jLe0l2HJV7Nc9Qe
	pnPkq0PwnFymxCDoDBNb/vRRCWh8VNuMos17F9fUWM3d52sMdPly/QVK6LuLIuAUqckaId
	NvxIeaxkD6G74LbIeNkj/Kr2rL0IzG/VT2eU1eqW2iuY9+IYD3SC/W2JWHiiMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1684789457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NByQKI51jy2j672ZUXdG7FihvnPAeSwdTvvAedoGpTg=;
	b=vhXfTHSmkg8sMek6N/YM9Kxa/vm8sXoYRsypyfUtGXP1dQSKCaL+3v90Q5MYWJoZJcTP6l
	6NVrzQcJMR+6yiAA==
To: Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Ross Philipson <ross.philipson@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
In-Reply-To: <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
 <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk>
Date: Mon, 22 May 2023 23:04:17 +0200
Message-ID: <87bkicw01a.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_140419_761397_96184E75 
X-CRM114-Status: GOOD (  26.78  )
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

On Mon, May 22 2023 at 20:45, Mark Brown wrote:
> On Fri, May 12, 2023 at 11:07:50PM +0200, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> There is often significant latency in the early stages of CPU bringup, and
>> time is wasted by waking each CPU (e.g. with SIPI/INIT/INIT on x86) and
>> then waiting for it to respond before moving on to the next.
>> 
>> Allow a platform to enable parallel setup which brings all to be onlined
>> CPUs up to the CPUHP_BP_KICK_AP state. While this state advancement on the
>> control CPU (BP) is single-threaded the important part is the last state
>> CPUHP_BP_KICK_AP which wakes the to be onlined CPUs up.
>
> We're seeing a regression on ThunderX2 systems with 256 CPUs with an
> arm64 defconfig running -next which I've bisected to this patch.  Before
> this commit we bring up 256 CPUs:
>
> [   29.137225] GICv3: CPU254: found redistributor 11e03 region 1:0x0000000441f60000
> [   29.137238] GICv3: CPU254: using allocated LPI pending table @0x00000008818e0000
> [   29.137305] CPU254: Booted secondary processor 0x0000011e03 [0x431f0af1]
> [   29.292421] Detected PIPT I-cache on CPU255
> [   29.292635] GICv3: CPU255: found redistributor 11f03 region 1:0x0000000441fe0000
> [   29.292648] GICv3: CPU255: using allocated LPI pending table @0x00000008818f0000
> [   29.292715] CPU255: Booted secondary processor 0x0000011f03 [0x431f0af1]
> [   29.292859] smp: Brought up 2 nodes, 256 CPUs
> [   29.292864] SMP: Total of 256 processors activated.
>
> but after we only bring up 255, missing the 256th:
>
> [   29.165888] GICv3: CPU254: found redistributor 11e03 region 1:0x0000000441f60000
> [   29.165901] GICv3: CPU254: using allocated LPI pending table @0x00000008818e0000
> [   29.165968] CPU254: Booted secondary processor 0x0000011e03 [0x431f0af1]
> [   29.166120] smp: Brought up 2 nodes, 255 CPUs
> [   29.166125] SMP: Total of 255 processors activated.
>
> I can't immediately see an issue with the patch itself, for systems
> without CONFIG_HOTPLUG_PARALLEL=y it should replace the loop over
> cpu_present_mask done by for_each_present_cpu() with an open coded one.
> I didn't check the rest of the series yet.
>
> The KernelCI bisection bot also isolated an issue on Odroid XU3 (a 32
> bit arm system) with the final CPU of the 8 on the system not coming up
> to the same patch:
>
>   https://groups.io/g/kernelci-results/message/42480?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Call-cpus%2C20%2C2%2C0%2C99054444
>
> Other boards I've checked (including some with multiple CPU clusters)
> seem to be bringing up all their CPUs so it doesn't seem to just be
> general breakage.

That does not make any sense at all and my tired brain does not help
either.

Can you please apply the below debug patch and provide the output?

Thanks,

        tglx
---
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 005f863a3d2b..90a9b2ae8391 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1767,13 +1767,20 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 {
 	unsigned int cpu;
 
+	pr_info("Bringup max %u CPUs to %d\n", ncpus, target);
+
 	for_each_cpu(cpu, mask) {
 		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+		int ret;
+
+		pr_info("Bringup CPU%u left %u\n", cpu, ncpus);
 
 		if (!--ncpus)
 			break;
 
-		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
+		ret = cpu_up(cpu, target);
+		pr_info("Bringup CPU%u %d\n", cpu, ret);
+		if (ret && can_rollback_cpu(st)) {
 			/*
 			 * If this failed then cpu_up() might have only
 			 * rolled back to CPUHP_BP_KICK_AP for the final

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
