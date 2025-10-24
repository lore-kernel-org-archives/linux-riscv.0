Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DABCCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxDzjDvAMoAZirbcoYjQzLoUnOHxHzzYuF8hEBAWAsE=; b=qX6LaYiuV07XIU
	KAPRIIMsy39wZ3J/g3PY8YnwFAvyf/S2owa/xLjR7vda8syfFIYBFHhN563HN0qafuafD42unksc3
	rA9YmBn90ItvWonDp29khDfObOhLOO6M/sHrG3Ey/3MYfn+AHOjY4PQKbarSHIo5ZLUkqu4WQX4qg
	EFQopDnuKlmqaGsnFi3Hi+dhQd3xmMxtesOXDzrUl3JYqZKME5HuX7k9pdKXs238sk6XtiEgLZToW
	H5wzCtALeaqpDYpeVg7QbpsLLED6f/NDnZgzxXMf/co5UtiQI+jcLa5a3q9X1OqSjMDArPuuUFz2R
	LpyhmohTZe0CeXgqo4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNhz-0000000AOhi-1WVr;
	Fri, 24 Oct 2025 19:44:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNhw-0000000AOfG-2II2;
	Fri, 24 Oct 2025 19:44:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761335051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j1tfRYGYM66U+KpSa00BpGxDI+hyT7SSps99obN09Nw=;
	b=mV9PV9ddpcoU02So0SXkS4ZFsu2V7qAr7LEgSfPB2WToEgUpusnbyDadgwVWZmbRTkyXGp
	xvX0UNKOV52ySDi0s+OUqSFEjqwtQ3Fp3XT2KXtNj7xH/noSieu7qQOSb0twLqPsuQdu52
	W2PSv38g55SZ107p2MYvIYFIfSG0AV4Ewb0llS3O3Q67LebNBdkvyw1t5kOWxeQINrrY8B
	C8rRWxdkMOnEatj0FnKC2APzd3PznfAfj8C8OdFbrVF6/FaJX2T9wcnIwKDGZ3u/WFdrfc
	nyEjip3DXjmNs4Vo88BJmJaGYic+FCBz4AXwhPL0pYDclJkETSnxhof/6+A92g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761335051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j1tfRYGYM66U+KpSa00BpGxDI+hyT7SSps99obN09Nw=;
	b=XOTtBc1YJh7Jq5lFhBgh4lK2u78F4KjnvZsO7hd4iln28ghgXC9efMVHBaCCiM8FiD7nn2
	aO4ycaAyDVrtNpDg==
To: Xie Yuanbin <qq570070308@gmail.com>, linux@armlinux.org.uk,
 mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 andreas@gaisler.com, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
 anna-maria@linutronix.de, frederic@kernel.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 qq570070308@gmail.com, thuth@redhat.com, riel@surriel.com,
 akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
 segher@kernel.crashing.org, ryan.roberts@arm.com,
 max.kellermann@ionos.com, urezki@gmail.com, nysal@linux.ibm.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-perf-users@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH 3/3] Set the subfunctions called by finish_task_switch
 to be inline
In-Reply-To: <20251024183541.68955-2-qq570070308@gmail.com>
References: <20251024182628.68921-1-qq570070308@gmail.com>
 <20251024183541.68955-1-qq570070308@gmail.com>
 <20251024183541.68955-2-qq570070308@gmail.com>
Date: Fri, 24 Oct 2025 21:44:10 +0200
Message-ID: <87placw0dx.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_124416_720346_6DAF203D 
X-CRM114-Status: GOOD (  10.55  )
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

On Sat, Oct 25 2025 at 02:35, Xie Yuanbin wrote:
>  #ifndef MODULE
>  #define finish_arch_post_lock_switch \
>  	finish_arch_post_lock_switch
> -static inline void finish_arch_post_lock_switch(void)
> +static __always_inline void finish_arch_post_lock_switch_ainline(void)
>  {
>  	struct mm_struct *mm = current->mm;
>  
>  	if (mm && mm->context.switch_pending) {
>  		/*
>  		 * Preemption must be disabled during cpu_switch_mm() as we
>  		 * have some stateful cache flush implementations. Check
>  		 * switch_pending again in case we were preempted and the
>  		 * switch to this mm was already done.
>  		 */
>  		preempt_disable();
>  		if (mm->context.switch_pending) {
>  			mm->context.switch_pending = 0;
>  			cpu_switch_mm(mm->pgd, mm);
>  		}
>  		preempt_enable_no_resched();
>  	}
>  }
> +static inline void finish_arch_post_lock_switch(void)
> +{
> +	finish_arch_post_lock_switch_ainline();

What is exactly the point of this indirection. Why can't you just mark
finish_arch_post_lock_switch() __always_inline and be done with it?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
