Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE792C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGn+6/CNO/xMdasWf7J/yslFop5iijqQp7cToKQL+EQ=; b=WdAp7R5QIQgUya
	RCxnTaio4NBi3RLuDveZf1jRREyVIJnyvbad3ZwWJI1UOVmC3PVRxKZ2XG3yxiAygGSnhqMD0mAVD
	jubQuTfUnkuscMRxU5xTIhApS/a9JfBa42GiWs7e/uBUQlISRG4ZqUf2r3GuTp1Xoyb5uj6wQcr9l
	hV1qDxd/zDOVZYaDdIHL0gK678VlXZMLZ2XSyEpfbw6MnXSoS5Xl04liIVweVODMi2+F9XV4cP4qQ
	bOGgZNYjdytcLC3BWLXXN22Q5zfG5OUMBKFSpXW8ILA/o3IuLnrHCgyP+dbr0l47c1OgJ0fc3fPJN
	ePLtoeWuYFHOi4yZDGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNC1-003Nsd-01;
	Tue, 09 May 2023 13:15:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMAR-003Egy-31;
	Tue, 09 May 2023 12:10:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VtDcNKByG3QGqBaMWteEmBlx8o79YaY4wIW5CrphOKI=;
	b=ozV/VUOhCbdvdcwqxdtfXZdcaA90ARKwOnYQBRouWIahnMXGWDMqDNjRrHC/BBYWjq5SZl
	0zVkjwMN1HrH8Nj5PlcDw7JkrmEq1wl2opWaW4iHlUWYz9rS55vTCEV7bvHci0YQS0msKe
	OiKR9k0tA7izR2CPXGYcFUsQfK7A+x/0KRvkRZX+qrF7KiQIDhvs0oyXBpq1rxJdGhfGCh
	MYC6WnITSxgPyRjiVJDU49KaDy0xrS7hBHILcujYL+/hxIaH+NoGh3k9eNjkZ5FjVDbyZQ
	FdCg0ek5JAc2T8OI8FHkzUUTTsC4j7rKC+fqFmbcQZsqVeexs2oybxw7tmiGyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VtDcNKByG3QGqBaMWteEmBlx8o79YaY4wIW5CrphOKI=;
	b=ZLjODydBGy8cvSTodcStIAcmZAy/XrGuM8TLpXQA6c10hgPy1SCLXFLe3hFmS5CqBcJDXp
	pZHsXusMPUdgkGCg==
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
Subject: Re: [patch v3 14/36] [patch V2 14/38] cpu/hotplug: Rework
 sparse_irq locking in bringup_cpu()
In-Reply-To: <20230509110223.GY83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.013044883@linutronix.de>
 <20230509110223.GY83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:10:06 +0200
Message-ID: <87ednp1za9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_051008_125152_F60E65FA 
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

On Tue, May 09 2023 at 13:02, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:49PM +0200, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> There is no harm to hold sparse_irq lock until the upcoming CPU completes
>> in cpuhp_online_idle(). This allows to remove cpu_online() synchronization
>> from architecture code.
>
> Uuuuuhh.. damn. Can you at the very least ammend the comment near
> irq_lock_sparse() to mention these extra duties?

Will do.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
