Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E6C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebv5TigaaSFI/TcPfPeMSJxT8D0CbYLOUGY/Hn+T3F0=; b=KJ8kU/Mr0o8/L8
	T4m9j801x83NFXwK8gAjZxAjIrDKg8IXXWcOeR3WwYwnqIRJkK767SqgZ8PUW4UAyOfkrd7eDRBXx
	NUkLF4uXx/m+Mh6xrd1Ncw8P1XUCihytupnkIOqYDAlMt3ECKXMA3GPHC/fMz/a1eoN70c6vPv8/+
	U65SHsB/1KX+QApoqo2SynA3OYyM6vLnPSO9oIoVwHSqv1ZcQLAfxw0z2i0nglTzcPvGvsE8IbSes
	+NoiARTSCI3E5+eIkUJ/CeK4NaCfDhokReHYjjwyhjjzIQZhb0VDrb3ywQlpNIHgIvcB7RmT6G4Fo
	hbE6L8XVZG4P7Al4HUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puuoe-00AupH-1g;
	Fri, 05 May 2023 12:45:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puuob-00Aun7-0a;
	Fri, 05 May 2023 12:45:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683290728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro/VOFl72UDWFwy8gwNK93pOtDrJEFznvt3NXDl6cF8=;
	b=NEssImE7oVj95z4/FBIZJnxzphr31CeA4k7oJeJinz1r5r1l9dXN1gppKxrfH844UqDO9z
	4QSvSZ+MCzWy04loOUdVFWsJabtUy+6xAHaZOnUP3kDamwQqqChUVjh6yxS90kqh/3foQl
	BxPnqXdK0mEFhXKLhgXSM8yu090mNdF9FRSITtHjxNfxijznNsQsOy0jITHZ9ajNCFSUr7
	ixcpybMXO0+Tte9hyNa1D9uPISenZGZ0GM57Wg5ua9BDE6mitsB+qwg3eCN369M6O0Jwe5
	/MuZBe8FpjmVO3WPvPxa64u3KW+r1rcVtivlIiAVpuzcTFgSsngi+McsE/7vlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683290728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro/VOFl72UDWFwy8gwNK93pOtDrJEFznvt3NXDl6cF8=;
	b=65zpCtdzuEaRqOzhfQTeNfeiCJfu8TviFjuPm0aorQPKM8pLdEAQ4DrGamxrKih4/79CxI
	kPU4Ye7GnkFx6vAA==
To: Andrew Cooper <andrew.cooper3@citrix.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Gerst
 <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
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
 <mikelley@microsoft.com>
Subject: Re: [patch V2 34/38] x86/cpu/amd; Invoke
 detect_extended_topology_early() on boot CPU
In-Reply-To: <38b259bb-050b-023e-4f43-212f95f022ac@citrix.com>
References: <20230504185733.126511787@linutronix.de>
 <20230504185938.179661118@linutronix.de>
 <38b259bb-050b-023e-4f43-212f95f022ac@citrix.com>
Date: Fri, 05 May 2023 14:45:28 +0200
Message-ID: <87354b3q1j.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_054537_362433_FBFE9A37 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, May 05 2023 at 00:04, Andrew Cooper wrote:
> On 04/05/2023 8:02 pm, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>>
>> The early detection stores the extended topology leaf number which is
>> required for parallel hotplug.
>>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> It occurs to me that this and the previous patch are stale given that we
> no longer look at CPUID in the trampoline.
>
> They're probably useful changes in isolation, but the commit messages
> want adjusting to remove the association with parallel boot.

Duh. Indeed. Completely forgot about that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
