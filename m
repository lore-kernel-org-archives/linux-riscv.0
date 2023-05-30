Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB577C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0cMtqrcr2S7PfzD5A2GVe01yiLhchNkVbUGJdvCOjg=; b=RTNE76NuIg+4jL
	f4hN09JeNaUJSHTbVCziAMQz+0V9I08uMBACWmwgSm+DDPWFvrR+DBQ9wPL7T5Zk4yYVjKEf37SW2
	XsKfiLm8a3UCYmm2hi9deRWP59troQXgy2Ps98NhoQRHK1/3Pbc0Eif3CPTqqPhXonj066lOYMskh
	062bRu1snl2BsEXEK2fMF+M2zq6D1v7eguQYZxT3Www7dVewPGCh/5cbTq26ovPDD9Mm2IlpzVyc1
	Lwlz9z7C/nBpWBC8+umsbq6TChIuo3Qzhoav6Jw0KRdLJlTZCDeMOJEq4SrOqO3k0/RAgfP0YlZeg
	VyZYcYvOT/uatiuTmFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q468F-00F77W-11;
	Tue, 30 May 2023 20:39:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q468A-00F769-3B;
	Tue, 30 May 2023 20:39:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685479184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulmrcImbtRvzqGgwE3a2VNEOCnRPGxt2UYSBYI3GTxQ=;
	b=4qWCcJKQCkNkGPqM/Rfcb/VSCOwDyDojxTr5YkT3yoCg+h+F4OXwKDoF2GjtKdG3kd2wY8
	L6bWsrD3kwGyYxrBlWcx8MzjAlMZB6uXNTfvj3b9vg3gdFNgUQPGfyCbjSp51zbj1DtDUf
	ZjhuZVqHtZUcqLZbFThMCPsY5zK/aJ3WXndEd7hP4OxuJTEM55rjMY4KMg2bFxvvHz6wsE
	N9v3mPnUudrr0MrxZTNc1yl0Htt+qivGdQJImDDVV7QN/OKhjJMU+C93JgoYjKHuK5xZ6E
	cCzobMUk50hG/fjlycbXB22hdFz/Ih2wozkyllmdvsLBgk3kP7tJ+RO+prCUDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685479184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulmrcImbtRvzqGgwE3a2VNEOCnRPGxt2UYSBYI3GTxQ=;
	b=OCsvGQbDF6UOTjQKlqYKNmvbthDBtxG8seNlKDn/Ru8sYGzf7Qdj9re6e3JcMKWoHbPnwS
	H9C/y8wZ1kg41FCA==
To: Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, LKML
 <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel
 <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama Arif
 <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
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
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
In-Reply-To: <8751e955-e975-c6d4-630c-02912b9ef9da@amd.com>
References: <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name> <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx>
 <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name> <87wn0pizbl.ffs@tglx>
 <ZHYqwsCURnrFdsVm@google.com> <87leh5iom8.ffs@tglx>
 <8751e955-e975-c6d4-630c-02912b9ef9da@amd.com>
Date: Tue, 30 May 2023 22:39:44 +0200
Message-ID: <871qiximen.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_133947_171879_B9D8F11A 
X-CRM114-Status: GOOD (  10.30  )
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

On Tue, May 30 2023 at 15:03, Tom Lendacky wrote:
> On 5/30/23 14:51, Thomas Gleixner wrote:
>> That aside. From a semantical POV making this decision about parallel
>> bootup based on some magic CC encryption attribute is questionable.
>> 
>> I'm tending to just do the below and make this CC agnostic (except that
>> I couldn't find the right spot for SEV-ES to clear that flag.)
>
> Maybe in sme_sev_setup_real_mode() in arch/x86/realmode/init.c? You could 
> clear the flag within the CC_ATTR_GUEST_STATE_ENCRYPT check.

Eeew.

Can we please have a AMD SEV-ES init specific place and not hijack some
random code which has to check CC_ATTR_GUEST_STATE_ENCRYPT?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
