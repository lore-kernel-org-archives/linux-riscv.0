Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB03C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWAxbOpbzmv69esBRq29AZKY3GhKcAulATBwaPGt7k0=; b=Vhioj9ZvFNa8hE
	unJqs1HUwDBRzqA6F6jN7leHtuMZ+wJOt0aOXjbeK+986mX/xV4Wm3fG0/T+bFHlAOoi9dzt7ihBu
	X75l7jbdLvHVuMFKv/+6WHKt/vZAbF40xCn06afhfpHGdf7eir5HBL1YlnUC/P+g1IjZaS/6BtRWm
	2hV6fONW49N/Cj2D/ZO3Ue9K3lY+f6SiOvAtdths452JRfVEKqnZ7KcPX2Qys2JB6b8dKDSXkXnlx
	v7LXKsK86oISJ2juNgz0Ar/oRgyv9C4l/zx4fxCYAz/xdC37qMAxOtFZOKWj7GWsxjvkACYehd0X1
	Kg9GJhb+PI2P30sfXRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMA8-003EZT-2r;
	Tue, 09 May 2023 12:09:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMA5-003EXQ-2Z;
	Tue, 09 May 2023 12:09:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdyszAQFsS8NQ584CZnckJnpEhoUaXW9tnBOiTa+9+E=;
	b=ka9gkcGHPU/F0K+ngaz5jaCDeTzITcmJantNFEH1Q/42sdZ4zT1IqtMce7W/ZjZD1bK1+j
	/LNwDssKYbtn14emuSZbyff8IjECHOj44E32PB3y66ONqTaivar6HFMvTYpEn79bGOVSI8
	sOjrIz9MvrC0jruLu+aWlOCPHHLUW+sovMocfUIwQQzie8Jw2EWX+LtwgcvbMB/fb++PT7
	3V5LLpihTVTj/4ipngAecsP92q7WSv1hEdEi47Ocn0+UqB1lNCmcxgzxFfcOzQz6hdRbtH
	MZzhHOOgMIT3YAtQVGXh4XejswO34svSG9XWtwbNWw47oZdXADP7zBo3uAbL7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdyszAQFsS8NQ584CZnckJnpEhoUaXW9tnBOiTa+9+E=;
	b=GXVTcObOnQaoFBT3flZUDZ+yT6E9sycBY79vdaY5U1FPyYZPuFxqBXtxFTxmCYvrEjr620
	6gR4tFX9TtdUtDAw==
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
Subject: Re: [patch v3 13/36] x86/smpboot: Remove cpu_callin_mask
In-Reply-To: <20230509104915.GX83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.956149661@linutronix.de>
 <20230509104915.GX83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:09:44 +0200
Message-ID: <87h6sl1zav.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_050945_981668_A0F2C338 
X-CRM114-Status: GOOD (  12.85  )
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

On Tue, May 09 2023 at 12:49, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:47PM +0200, Thomas Gleixner wrote:
>> -	/*
>> -	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
>> -	 * but just sets the bit to let the controlling CPU (BSP) know that
>> -	 * it's got this far.
>> -	 */
>>  	smp_callin();
>>  
>>  	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
>
> Good riddance to that mask; however is smp_callin() still an appropriate
> name for that function?
>
> Would smp_starting() -- seeing how this kicks of CPU_STARTING not be a
> better name?

Something like that, yes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
