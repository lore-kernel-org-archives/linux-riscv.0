Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679F2C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo9SadVaaIEM5eBIZwfB7mgJBwVfVUNZb3oTajki3dM=; b=fFPtJYcJXV5YW6
	1VgAcEA7RPrrScyO0Snnb+NAMK0XD629pMXfXn9hbxc2yEpQvR9N99+CGHCkzUs9hAkXbCeNcasrW
	h8a4Y0q2rlTPmpA9qDJgggqIOtQ1pNxx9IGrsKwReYczh3mtaJIQecsS43+RFomzW7k388Rf1tPwH
	er3kAWMj87rRVKs0FZ+Yv5IkIDV/pcuH8DJ6TVanKCks6fOutgamf/00w9Sdegq54XbrBbE0ot6cW
	Xvl2k3Kjtbw+aOulNkFZnmfXkwLOZ+Ff2P8hq2ie35Q5LohVd7vlatmg7vQpZD44mejyMULjuQw0p
	E0q4pAp1ceN/JCklIsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vdD-00D9zK-1t;
	Tue, 30 May 2023 09:27:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vdA-00D9xD-1f;
	Tue, 30 May 2023 09:27:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685438823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1NMbaaXeWKdobW1XvAcSDK/dQsnYJNRF0z8NSxF7l9g=;
	b=3WlfyRf4MaHC/vnZ5XtmVOPXOLK+ZAlD6lhDlx3nxtYIx2aAF4vsyl4Fynj3non8rbgMrN
	sNrp+9JQLFYFbN/XqXCv9byGDKlv0RHWDCZwas9ku3sVJVgKghH6SR2F8V6+xNDQOkLcyD
	5qqJAyewlvw6f3Z/VcU7uuPM8NAolzMZEkhAvRU0VhntTSbYmIp8ge4zTpPWzrBil5oYlf
	DgeSLbc5m4g4ajmFKq5V5ym/tqWGbgOPaXXQPMUx1NtL/3KwVT8w9aL6e8LA+TS2nYZbmJ
	Q7LfBFEK9KhVtex48u51MPzAYtklC43xcJIdIGSYeuPXzECaBk3uOeXt5h/Wqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685438823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1NMbaaXeWKdobW1XvAcSDK/dQsnYJNRF0z8NSxF7l9g=;
	b=GRvc8oucVrh5HH/FHNK9eWoRJUeKKRlfRG0kkGtIqetJQ9TTAPtqn+q5w5PfQy3yr3tFYY
	syTijd9671JLttAA==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name>
Date: Tue, 30 May 2023 11:26:52 +0200
Message-ID: <87mt1mjhk3.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_022704_701485_4F5360F9 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, May 30 2023 at 03:54, Kirill A. Shutemov wrote:
> On Mon, May 29, 2023 at 11:31:29PM +0300, Kirill A. Shutemov wrote:
>> Disabling parallel bringup helps. I didn't look closer yet. If you have
>> an idea let me know.
>
> Okay, it crashes around .Lread_apicid due to touching MSRs that trigger #VE.
>
> Looks like the patch had no intention to enable parallel bringup on TDX.
>
> +        * Intel-TDX has a secure RDMSR hypercall, but that needs to be
> +        * implemented seperately in the low level startup ASM code.
>
> But CC_ATTR_GUEST_STATE_ENCRYPT that used to filter it out is
> SEV-ES-specific thingy and doesn't cover TDX. I don't think we have an
> attribute that fits nicely here.

Bah. That sucks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
