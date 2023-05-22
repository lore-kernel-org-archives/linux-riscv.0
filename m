Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F237BC77B73
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmW1i3cshKaTGm6IVs/irYXTnGl07D8PBLCc86IXqvk=; b=kJeG76uy0mNKWu
	lRV/rzMxvCs8IAb6rtX36nBdZzwSOGoC4XgszsbuvYFGBaq1X02ZyEDmFbXQ6+H3uLlRpfeYht8NT
	bvijbuvd4QvKzDrvy6Z/H37rUvWZOOtuUyFXoVMBHzA3iSoczL/z6RaAiJUCu4u8hcI8XdB6Uw8fQ
	pWvsAadqhmgEpIa3sePlPBZ5QFc5eXW0Arff97YEzSxZd0xYzWcoVy+4oQjN+92VVtgvwoBSKxByY
	mxEt4O/bbY5JW8pf+/KdXbj+AM2lN3sf4/OIldtcVncrqFqjaFD2delogiIFn4sP4u1YkkPI9GeDl
	hmiGf9KuX04SZqxmVenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Ehd-008K8Q-0N;
	Mon, 22 May 2023 23:12:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1EhZ-008K7O-26;
	Mon, 22 May 2023 23:12:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1684797146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C7TsK7GgGmkvmWTTcWM2ucSNGAZooIPJARpsVm1elw0=;
	b=yrUtqJV10ki6ehHolL2hnu9DMcCIuWlud8kBCfHX2rWfH90kquusd5JROH50fXuSFSmQwU
	PKNQy6H0pPg6Mk5OQdYPhKYbeQI1YUR9KMUd/a7Qt8XePk2e/SyRiHPAMSjuFqp7Gvl67j
	jsYzQTS2roesS5yiUarkF8GfeI3DeGPf6Ebcoc4Ljc1KYqKx7NP63xqe3/V5tuO0wj3vfK
	JFIGfRt4eOzIcmOGPkAafZCHGsIxOB41QQ0hviBcfX4KV8V6SP+E8PZS1myMMBnon3NhCD
	iok8IPIaOi8QqOj9b+eAxWl9vgJ4JWbE94zRxWOk3/fV7mjhSGxDcyoSZunF8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1684797146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C7TsK7GgGmkvmWTTcWM2ucSNGAZooIPJARpsVm1elw0=;
	b=LsHOhlHhAmIjOmv4OFf6rm8oVhRsGLXF3Ede/E4PfuqZRooT2DLrTIb9VMr4oD66YERTjE
	beGkkZmQ8Ci6bkBQ==
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
In-Reply-To: <2ed3ff77-c973-4e23-9e2f-f10776e432b7@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
 <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk> <87bkicw01a.ffs@tglx>
 <2ed3ff77-c973-4e23-9e2f-f10776e432b7@sirena.org.uk>
Date: Tue, 23 May 2023 01:12:26 +0200
Message-ID: <87wn10ufj9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_161229_859806_071FDE77 
X-CRM114-Status: GOOD (  16.99  )
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

On Mon, May 22 2023 at 23:27, Mark Brown wrote:
> On Mon, May 22, 2023 at 11:04:17PM +0200, Thomas Gleixner wrote:
>
>> That does not make any sense at all and my tired brain does not help
>> either.
>
>> Can you please apply the below debug patch and provide the output?
>
> Here's the log, a quick glance says the 
>
> 	if (!--ncpus)
> 		break;
>
> check is doing the wrong thing

Obviously.

Let me find a brown paperbag and go to sleep before I even try to
compile the obvious fix.

---
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 005f863a3d2b..88a7ede322bd 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1770,9 +1770,6 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 	for_each_cpu(cpu, mask) {
 		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 
-		if (!--ncpus)
-			break;
-
 		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
 			/*
 			 * If this failed then cpu_up() might have only
@@ -1781,6 +1778,9 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 			 */
 			WARN_ON(cpuhp_invoke_callback_range(false, cpu, st, CPUHP_OFFLINE));
 		}
+
+		if (!--ncpus)
+			break;
 	}
 }
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
