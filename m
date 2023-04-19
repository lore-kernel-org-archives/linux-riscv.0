Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E66C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C11nILIu4sOi7TheQhUzDZ1UqTmm4TGsA1pTaI/t0nk=; b=YwwGntAH0ry7R7
	N0ICchQM595ZiJZQtYF2d7T6PkWgV3VnNcRBo9R1xx/PjMlgUcvpxJ90PeaRpx+MuEepqfp0iUjrj
	LzTRI8SN1l6k9SmtFsVwDyfNDSouuQfcj1QDu+s+YKwpoFSk0TY9xFx00NrRUfajm/d3u0TDSHWPH
	2gzKzRk9IZr46X613se6uK42JpzKBNDQ0YKUQvQMh72sVtnxUEJap5PkVkzoJezjaeGj4Jt6Ctjf1
	RXwEBayI7gtLI/LtjBMaXVCyEr5sdigK5FDH7RWQglPScERzwpr3jeqBsCII1Ci1kToEOeWVMAmcF
	UE66B1fsds5GUkhQGttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp85q-005Y6I-28;
	Wed, 19 Apr 2023 13:43:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp85n-005Y3I-0g;
	Wed, 19 Apr 2023 13:43:28 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681911801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFu1BiBIiZJxXn+1gDPlWVAOg5qQuCy99rAdIveUYFI=;
	b=GioJJVLP3xsJ8meXcrDWG5s5gdc8c0v+E+hPsGfax24KRpT161PXreAJ6xSi1/ffGHB7Ig
	QiBx1CCi33pppdwmwttJl7f18G3nqG0JMirkvI2B/KLs1tu2KE0oys4tguZIBjdpC698x5
	qJxDi+HpdhZXd4d+95gQdCA+EcnPYPHRun+2UdCS7FOBBh/HuWgOjO1wzT9vOvsEMfGXhZ
	Bp60sCQp4nsgLMYaR72tlHdyX8qr1HW2HBQ6txx5eUn8Q1HfGVvmcQX/+2gPF1pOlVbSvA
	J67MiipF05Kzmx+7IpQU6gIRKBAfRvBEfF5UQtkBc9rk1oQMLK4aT2yGkLma2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681911801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFu1BiBIiZJxXn+1gDPlWVAOg5qQuCy99rAdIveUYFI=;
	b=PpcgZgskhULkL7/jgakP7Wurg7G56yGaYp+uPBAUp/opltoRjM69gQ7OhILB+Kv0LHnaHA
	BEEUccjsOmhHz0CA==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <877cu83v45.ffs@tglx>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx>
Date: Wed, 19 Apr 2023 15:43:20 +0200
Message-ID: <874jpc3s3r.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_064327_387384_5DC0FBAC 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 19 2023 at 14:38, Thomas Gleixner wrote:
> On Wed, Apr 19 2023 at 11:38, Thomas Gleixner wrote:
> IOW, the BIOS assignes random numbers to the AP APICs for whatever
> raisins, which leaves the parallel startup low level code up a creek
> without a paddle, except for actually reading the APICID back from the
> APIC. *SHUDDER*

So Andrew just pointed out on IRC that this might be related to the
ancient issue of the 3-wire APIC bus where IO/APIC and APIC shared the
ID space, but that system is definitely post 3-wire APIC :)

Thanks,

        tglx



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
