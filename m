Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D72C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jt7h7YcE5mD233PJ+ZBVtJ6OnP77HsEDu+otJ+wPQQM=; b=mCUMHle6mOCFH0
	NTklX6uAKwU8zFWvnWQ3JE3MLShHp5VO1dWnrJ7WD0pVoUB4K4P/15KotU7SMvGdw+fpM9A+PrYI4
	P+xsrBwiHVtIpmBbNf99mH1ByWOnS0GAEgSMS5hpgJorea2UDOOC6dtL1xLPWftqvUa2kY9ZF/m2s
	CIfzon2TFlwVQOMG9qZfiU5Klpkh8qzhl50EC22Dm8sFYO193iCMxuPqioAkxOxLRelT8RcUzAmKE
	cZxDGbTd/+SitweWrwfs/vvnZIVc19576BwPMrlAEnmcHTpiUdKYHI/bs4o9AZVTKn0NF/lrhMiNz
	V5A+UJq+1yOKohglJifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pra43-0037B6-1H;
	Wed, 26 Apr 2023 07:59:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pra3z-00379V-0g;
	Wed, 26 Apr 2023 07:59:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 680B44B3;
	Wed, 26 Apr 2023 01:00:21 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.23.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76593F587;
	Wed, 26 Apr 2023 00:59:32 -0700 (PDT)
Date: Wed, 26 Apr 2023 08:59:26 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw@infradead.org>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
Message-ID: <ZEjZ3pHjQWn4drs8@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de>
 <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
 <87ttx3zqof.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ttx3zqof.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_005943_297025_130AF30E 
X-CRM114-Status: GOOD (  22.49  )
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

On Tue, Apr 25, 2023 at 09:51:12PM +0200, Thomas Gleixner wrote:
> On Mon, Apr 17 2023 at 16:50, Mark Rutland wrote:
> > As a tangent/aside, we might need to improve that for confidential compute
> > architectures, and we might want to generically track cpus which might still be
> > using kernel text/data. On arm64 we ensure that via our cpu_kill() callback
> > (which'll use PSCI CPU_AFFINITY_INFO), but I'm not sure if TDX and/or SEV-SNP
> > have a similar mechanism.
> >
> > Otherwise, a malicious hypervisor can pause a vCPU just before it leaves the
> > kernel (e.g. immediately after the arch_cpuhp_cleanup_dead_cpu() call), wait
> > for a kexec (or resuse of stack memroy), and unpause the vCPU to cause things
> > to blow up.
> 
> There are a gazillion ways for a malicious hypervisor to blow up a
> 'squint enough to be confident' guest.
> 
> The real question is whether it can utilize such a blow up to extract
> confidential information from the guest.
>
> If not then it's just yet another way of DoS which is an "acceptable"
> attack as it only affects availability but not confidentiality.

Sure.

My thinking is that this is an attack against the *integrity* of the guest
(since the vCPU that gets unpasued may write to memory), and so it's
potentially more than just a DoS.

I only mention this because I'd like to account for that on arm64, and if other
architectures also wanted to handle that it might make sense to have some
common infrastructure to track whether CPUs are potentially still within the
kernel.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
