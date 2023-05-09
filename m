Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174E5C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/kqcG97tdyu7IoV+vV5SAAbsoP7+XHdx11tcqiRgJQ=; b=BZr1sNgRYKPuR0
	hKqgyEEm3wZLvBS2Kjb4QfFehzpy4hOWQD9ZbLbu2j1m/HXFJoLEXJ2dNydbGIGOanNLO19KoXPXg
	eaW3pkLWhDMD16IBirnEBI866Z2ex9BfeoU1Smu4qaKp910ajj/zedbABmSj6g4HM5GKMh5+/W0g3
	8CdRxbpU532liKT3qwaY0tvmtqHjQ0Xht6zaApbeoLnAoSngwDKP0iUsvumimTAvRZomDhFBw9eCU
	9L42IOOLcJ/IREy2hEPXQB9xT0/5nhB7Gil35YyfoPwwub3SMH3dmbT3l1qH8eLDgPyq9eROfhdh+
	MQ89MshHBo+AfNwESp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMCa-003F9U-0y;
	Tue, 09 May 2023 12:12:20 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMCX-003F8n-2i;
	Tue, 09 May 2023 12:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OeDWxrG4XUYobVqWgAe3O2JPVJDj89o+5jrCfskGJg8=; b=A1ahGd99UonxauNKx/XIsA68V3
	Fs8bEDmYlwexibvdeuYRdGPFOfBOUhTzwCbG+GC74xQWGHKDOOtBB9Cy2tnSyAVz1P7vhcuhOzV2e
	/SAQ3TNf4XLbmKnK8IC9BwY0/J+qWSoC3niImBOcbERWW+2TKCxC/T3UNMX7FTVP3wCaC36v7OUBx
	d5UXiVt72SHzQ317c40XegBY+DLFcW6roDulmpnqZyQZN4emfKu+zj4oeGj81qLV9apTFv5gfEJ25
	3UXin/AK4bxArSJtfeHph1svNR/vtSGFVDbDfGXE9idpTA83C2eoJdXt8j9BtB+MbC+YQFV51if+S
	GHXTVZ8w==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMCU-0067j2-1N;
	Tue, 09 May 2023 12:12:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeDWxrG4XUYobVqWgAe3O2JPVJDj89o+5jrCfskGJg8=;
	b=hl/TK4RBTejer0s1ss/VQWoTE3DJHIErNy5ObBMt3F35AuGijMu5SQIYqEXIyyWfguIJ74
	IuVIsOwOjI+DOYpi1oyZvtSrA4xy0VqeURht3o6yDrYLZd0dCj9sQmFOFO0ByR3FGuzx1X
	DX/4mqvZ8z2EcTfmL6YwZj0AheRNPYO2Sw/CFuIRodeNmQ9+fMov+UrbzmNB3mOPDT4LpP
	XixRF4zedTnImudhtqeC8vGLPe0PN84sIltm+fYhikFa7xWpApb8aT+EKAws94oS5Kw77W
	ZD3DPvNRfQa9kERCm1KsnYEOdLoCE866a9iJjH9pstUyHznEaCqcjcX+ulrAEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeDWxrG4XUYobVqWgAe3O2JPVJDj89o+5jrCfskGJg8=;
	b=C/RxUkGIvC1trkLde7ELOcrRJTFX/YyTBVeqxDPOcpgYwMXYyUXrtmmSUhQ5qz65ax/jQH
	CAvGiAfvhE+ZmGAQ==
To: Peter Zijlstra <peterz@infradead.org>
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
 <mikelley@microsoft.com>
Subject: Re: [patch v3 18/36] [patch V2 18/38] cpu/hotplug: Add CPU state
 tracking and synchronization
In-Reply-To: <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.240871842@linutronix.de>
 <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:12:12 +0200
Message-ID: <87bkit1z6r.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_131214_758149_4529274E 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, May 09 2023 at 13:07, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:55PM +0200, Thomas Gleixner wrote:
>
>> +static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
>> +{
>> +	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
>> +	int sync = atomic_read(st);
>> +
>> +	while (!atomic_try_cmpxchg(st, &sync, state));
>> +}
>
> Why isn't:
>
> 	atomic_set(st, state);
>
> any good?

Good question. It's only the other side (control CPU) which needs to be
careful.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
