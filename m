Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B644C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2s7baxuyLyAVfeGQ9hfDgYWXHvLc5Jd1CAcv1q60YJo=; b=OJthZMyvGNMjOA
	jB97jEbd28jbYPEdAQ+Uuip6m2R66pIkqcG9yN0K06y4Th0Bzn+lUnLcrACxVVoTuZgz6Y7Xehi5l
	1efZokpjcjJOTVC347wDaTMh3GjS2dCbj+pozmJ6KZfsrjgHj8sAdsHI+u2phedqO/vhBU5QUeH8b
	lvtIIPFbrE/+5hN1AeG7mBRGOElOXZjUKXdZUyMW/oIIxz2QzpozyHz1F5hNMEFIlboJYm0vqk3SV
	hA8vjd0hRsZdQohfawR2MsvuW0M842K7IC82E/RHlQy8UGcdXKtEDmYOmWGmjO/6wXqkVloCJC0Vf
	kZSgUpqFumrM0KL1kxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM7t-003E1P-04;
	Tue, 09 May 2023 12:07:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM7r-003E0i-0p;
	Tue, 09 May 2023 12:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L8MCFM0FDR2P5xT6w7iIAowrB6rGKJkA6dzl9HivHWk=; b=Dm59ZsYyAHgXRn2vPdCIUpjflR
	wcQjxkgbN32t8xND+u3gaUp0z6XLjHcyt6oh3f3T+ATmqkGZ79dKdbHfGCLADRhAe5yQd5+fs7yi8
	ahLwIkDQCh1qagWctNcakcs2w+Qg+OjtokPO3cg9iueKd75120It34CBJAQ+yNzW0g6LhSpW40NQh
	HS2wnZK6egngXK3HBo86tfPk8iSIlpIHlZy8Pkr0x80R7N1i8Gubv4PkxFv0XJ5wsmSgWnYYyVCig
	6Qmx8weRkxczAXw07luEPEKxLukgen3Z9ILTbQa/lSU7zliDGUDYE+NMPvS3w/lGSjzYqU9of/BVZ
	UtG0zXVA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM7n-0067bQ-2E;
	Tue, 09 May 2023 12:07:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8MCFM0FDR2P5xT6w7iIAowrB6rGKJkA6dzl9HivHWk=;
	b=WQKf9JTpFPSQGT0uFg5INijnVR8R5fqcikzHfuS5DVBLQGQ7GwJQT+EVszHAmjT/3/UBuz
	qVYnARbWYomJ6gliEb43t5la/h6VifzuO+zL/GRl0NjzHXmgK5N/FGwqL06FgLMkljqBFm
	XyfTJfmksGnqa6BjZhyerBbGE6iuFhkjn27fQrUXAQ1QApceQPW64uUNRla+fMpap+pUkk
	SWZ9l1mk0piAcuHN5EvFC700NqxfjfjIo2TZ35Uf44N6qz9M7DRMymepQA2ZWVsdTMQEJG
	ZopQRoGBKBzZCgD4GsYTMKx5vSxJBSs3/zJnl8HdNjGWI5X3/Fou00r0/4324g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8MCFM0FDR2P5xT6w7iIAowrB6rGKJkA6dzl9HivHWk=;
	b=HEbhRwUpE3y701WVF4If5EM5F8H8s6m0+F3iRYhv9+fKfUn3XmN66AS4uimVHFaZrmTvUY
	YoYD1EwiDwf+ofDQ==
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
 <mikelley@microsoft.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 08/36] x86/smpboot: Split up native_cpu_up() into
 separate phases and document them
In-Reply-To: <20230509100421.GU83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509100421.GU83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:07:20 +0200
Message-ID: <87pm791zev.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_130723_893179_3E2277DB 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>> +	/*
>> +	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
>> +	 * but just sets the bit to let the controlling CPU (BSP) know that
>> +	 * it's got this far.
>> +	 */
>>  	smp_callin();
>>  
>> -	/* otherwise gcc will move up smp_processor_id before the cpu_init */
>> +	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
>>  	barrier();
>
> Not to the detriment of this patch, but this barrier() and it's comment
> seem weird vs smp_callin(). That function ends with an atomic bitop (it
> has to, at the very least it must not be weaker than store-release) but
> also has an explicit wmb() to order setup vs CPU_STARTING.
>
> (arguably that should be a full fence *AND* get a comment)
>
> There is no way the smp_processor_id() referred to in this comment can
> land before cpu_init() even without the barrier().

Right. Let me clean that up.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
