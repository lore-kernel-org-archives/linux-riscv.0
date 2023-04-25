Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C242C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atEkkMUkH6RWYQF6nYqCF2D9Bl3dgIx7S6iC3hukX7w=; b=tx7SJinKjWrTJ8
	KGKFtuxKx+yMAtKfyEVsVksnoReztELT5Ui9xHRsMY9N0tgU3WIy3cbsI8SlL8ytQ0cV8ZibTlEnj
	SJCtnld9gNuJxANnqL8TQTd079O+RSZfpVR9Ot59ogrTvHs0La19B11KYt6bAlE/EBkONLUzc5J6a
	MmuzBd700PV/HZbBQQTlMUv/tr0WACt9IXwf4Ix2ykTXO4OdUVeUpBkZIRaL15v7M0gOu6cA1NH3z
	gUxNsCf1JYTCSf6Wmoy4NfT0SWDM6LQrwRYMdCgUQpkQt42y3C67B6ws032zzQAH0yKMv5tf8mkVC
	/ZUkH2UnNMx+sIsPzhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prOhC-0026b0-1B;
	Tue, 25 Apr 2023 19:51:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prOh7-0026Yw-2D;
	Tue, 25 Apr 2023 19:51:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682452273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epqrrIP9XVMR1rQYOgUv6OMHFSXsoKyAhdvov9JTG3c=;
	b=hcfCyrdfQ/+yHnKF3T+I49mLvnN7Y7S69gBRQL7PhhKJcZIQM6dUY5pvAbw4x5UtKBksj5
	+gNdAWyqbtppxTS6xk/OOGkQEgCKZ50daZMUpYiSsjHUolnRQ63od8fRIwCIy22iqsL7Jz
	ptuYgLF2Vyi6TxSoYJlRddHoLRBh0aBb/2ut263viqoCn4L8IM34OuGeUFz0vHjf3uDsn9
	kzIwMYp79iEd+cDm0M3l/TvJoQ8Ebljb98ttQPEip+uioS6jdgokPZm34PxDLgh8kTLkX7
	Tk0Brm7tWOMbl31MYKpF+X1fNVmxtHUKna8IUJdeJdt+TiqryaL2tjxt/WxUaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682452273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epqrrIP9XVMR1rQYOgUv6OMHFSXsoKyAhdvov9JTG3c=;
	b=mlbSRhNUu/9kpluKPqwDbDiOM+hdImwLPmR+/CiZOtx2CU7HgipiQ7bg9V2pgBimVEqMmi
	qqHiWR0zzWYsg/Bg==
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
In-Reply-To: <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de> <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
Date: Tue, 25 Apr 2023 21:51:12 +0200
Message-ID: <87ttx3zqof.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_125121_863542_4926A57A 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Apr 17 2023 at 16:50, Mark Rutland wrote:
> On Sat, Apr 15, 2023 at 01:44:49AM +0200, Thomas Gleixner wrote:
> I gave this a spin on arm64 (in a 64-vCPU VM on an M1 host), and it seems to
> work fine with a bunch of vCPUs being hotplugged off and on again randomly.
>
> FWIW:
>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
>
> I also hacked the code to have the dying CPU spin forever before the call to
> cpuhp_ap_report_dead(). In that case I see a warning, and that we don't call
> arch_cpuhp_cleanup_dead_cpu(), and that the CPU is marked as offline (per
> /sys/devices/system/cpu/$N/online).

Nice!

> As a tangent/aside, we might need to improve that for confidential compute
> architectures, and we might want to generically track cpus which might still be
> using kernel text/data. On arm64 we ensure that via our cpu_kill() callback
> (which'll use PSCI CPU_AFFINITY_INFO), but I'm not sure if TDX and/or SEV-SNP
> have a similar mechanism.
>
> Otherwise, a malicious hypervisor can pause a vCPU just before it leaves the
> kernel (e.g. immediately after the arch_cpuhp_cleanup_dead_cpu() call), wait
> for a kexec (or resuse of stack memroy), and unpause the vCPU to cause things
> to blow up.

There are a gazillion ways for a malicious hypervisor to blow up a
'squint enough to be confident' guest.

The real question is whether it can utilize such a blow up to extract
confidential information from the guest.

If not then it's just yet another way of DoS which is an "acceptable"
attack as it only affects availability but not confidentiality.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
