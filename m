Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179C8CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aROTc9C22y4mAFoS+lKHnI2C8PIGOKbXMrebEwgnrSk=; b=SrCo8xXIFoRxn7
	BIOhp5N35yZRSAuugeinoUSqEf/DgX3338xnZT6Q5X1j0Z/pPrxVxGg9QEqcES/tEVUd6WwnHSRLZ
	KcSx8VKriSBcCEwiyN9ZvyZBG3H9QjQplK+9YVIye4ABd60Jb76uCKssGT1AfN7JIjkgiAJyqYA5s
	X1yH1aRgz2Uvf0b9MYGku3VtWgbvob8M0j9WfUMX+BUktm6KkQaVoUsbhPhvJWxNUIWL/dwjnAH4v
	L33TthOlG7OE7s3/i0kzPM6DJxCkCOBtWmf+CWOGha6jm78W2Qf2t8Y5dGdXMETknhakRmI6odJc5
	rshwhZWUMWGtbLtHYfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCdMb-0000000BHgG-1S6h;
	Sat, 25 Oct 2025 12:27:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCdMZ-0000000BHfi-1jJK;
	Sat, 25 Oct 2025 12:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h4Hv3culHhtyyL1gbJRN5A5//DVcH55czATegss/m5o=; b=Nsu2eNcnrpJ61P5crD5bN8DGef
	H5XfZBgMQOy6WGf1ckCcVf8Hn1E8GX/oaZqnQ0YP143yEX0n9awvOCKGnpCiRNzKi3lF3HXWPNXR0
	UddngkmSKBwBzdgTaa6M3j5ZoDiUzhpzNTWeWbvWzxeDC5VB932w0A4p26qY4NsOedj51k1v/zVW3
	IpMRruWM1nDR+tYvgXpO3fGhexLB5MXkVjCy7v9owxhbXz8pl2N5ERIBb/skJIs3mabvSXV/SuhYI
	QTOhEFwLzr/jHk/Myehok55d1JZyPYaJsqjocJeByLZMvwGS+II51L4qJGwQrsjzqAjrJFByQljDl
	CK3Y1cBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCcUh-000000037ZP-2vIO;
	Sat, 25 Oct 2025 11:31:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4A76230277A; Sat, 25 Oct 2025 14:26:59 +0200 (CEST)
Date: Sat, 25 Oct 2025 14:26:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Xie Yuanbin <qq570070308@gmail.com>
Cc: linux@armlinux.org.uk, mathieu.desnoyers@efficios.com,
	paulmck@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	luto@kernel.org, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	anna-maria@linutronix.de, frederic@kernel.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, thuth@redhat.com,
	riel@surriel.com, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, segher@kernel.crashing.org,
	ryan.roberts@arm.com, max.kellermann@ionos.com, urezki@gmail.com,
	nysal@linux.ibm.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: Re: [PATCH 0/3] Optimize code generation during context switching
Message-ID: <20251025122659.GA2352457@noisy.programming.kicks-ass.net>
References: <20251024182628.68921-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024182628.68921-1-qq570070308@gmail.com>
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

On Sat, Oct 25, 2025 at 02:26:25AM +0800, Xie Yuanbin wrote:
> The purpose of this series of patches is to optimize the performance of
> context switching. It does not change the code logic, but only modifies
> the inline attributes of some functions.
> 
> The original reason for writing this patch is that, when debugging a
> schedule performance problem, I discovered that the finish_task_switch
> function was not inlined, even in the O2 level optimization. This may
> affect performance for the following reasons:

Not sure what compiler you're running, but it is on the one random
compile I just checked.

> 1. It is in the context switching code, and is called frequently.
> 2. Because of the modern CPU mitigations for vulnerabilities, inside
> switch_mm, the instruction pipeline and cache may be cleared, and the
> branch and cache miss may increase. finish_task_switch is right after
> that, so this may cause greater performance degradation.

That patch really is one of the ugliest things I've seen in a while; and
you have no performance numbers included or any other justification for
any of this ugly.

> 3. The __schedule function has __sched attribute, which makes it be
> placed in the ".sched.text" section, while finish_task_switch does not,
> which causes their distance to be very far in binary, aggravating the
> above performance degradation.

How? If it doesn't get inlined it will be a direct call, in which case
the prefetcher should have no trouble.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
