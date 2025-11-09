Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB2CCFA1E
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52/7PO5/WSpvy7YzuWyaQo8aPPZtO4Yh5e0U8nuMqkc=; b=TnwcjI6ghQAtbx
	AXR71SNvWETlkAvvn+EO1Vmgo9mDF2JW5FFGNUaft4eF0xaC8VnEq1WWOI2u4ylntUNmOcU5kQ0Wl
	MCNbUu7Qe+UrpEqnhVTo57EVjhlYbe+FpFIgw3rk39kn5Sq2yrKRjE04J1fFluJB4TGoxeLpDM4EO
	FMIQabxPpnbrErSqN5wjhnDQ1BBqw4grEYXLfhUX2opwjIgqTB+C+v9CtUAmkRom2jnEWq0znzYWm
	8cx/8pxRrxIpu6JVun36/4Su27D5vEzRWGRd143bT9e0CRysKnDB11duoV/MWuSS5Wg/ZjYp72pF9
	EjKvHC+3r0eVfenZwcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3xf-00000003yfb-0dun;
	Sun, 09 Nov 2025 11:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3xc-00000003yfV-119Z
	for linux-riscv@bombadil.infradead.org;
	Sun, 09 Nov 2025 11:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IrXO1X7s/FvF2yB8F6me169g9f36OJ6/LkVLYuvSSMo=; b=PgWp5Gwhf5GnRl3/BOaXaulpFA
	OXkZATs/SHRJQTUoZeROFDYov/No5gfPjlH8G2v8EEGgNilZ6QOHu9mAznoS8GJd6E3h4C7PFhTMn
	1ts50mxrAxcR+4Zn3jL7H7G4pNv/Otc5+OqQcBg4f19QnZnCctSTOM7VgRfZbhMg222rVxVk80vf6
	60Dk0k2rG/ywx0Tr+hAvzNJI1tXZMqvtksaTzMWp4+eJYnTy/OD6hZOFWuQyhm7hGFYbFM//7huaP
	ckkFEHallmLK9nH/GdN8okr5MMAkYhnYBrp7+gLK6QCUY6ybbSfqMzeJN3hKuhUJOJl57eTUNsOEO
	/hOSDBwA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI35t-000000090QN-08Wu;
	Sun, 09 Nov 2025 10:56:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 968E9300230; Sun, 09 Nov 2025 12:51:52 +0100 (CET)
Date: Sun, 9 Nov 2025 12:51:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Xie Yuanbin <qq570070308@gmail.com>, david@redhat.com,
	tglx@linutronix.de, segher@kernel.crashing.org, riel@surriel.com,
	linux@armlinux.org.uk, mathieu.desnoyers@efficios.com,
	paulmck@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
	andreas@gaisler.com, luto@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	anna-maria@linutronix.de, frederic@kernel.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, thuth@redhat.com, brauner@kernel.org,
	arnd@arndb.de, jlayton@kernel.org, aalbersh@redhat.com,
	akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, max.kellermann@ionos.com,
	ryan.roberts@arm.com, nysal@linux.ibm.com, urezki@gmail.com,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
	will@kernel.org
Subject: Re: [PATCH v2 3/4] Provide the always inline version of some
 functions
Message-ID: <20251109115152.GD2545891@noisy.programming.kicks-ass.net>
References: <20251108172346.263590-1-qq570070308@gmail.com>
 <20251108172346.263590-4-qq570070308@gmail.com>
 <04CA2D22-4DE2-4DE1-A2BC-AACE666F5F93@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04CA2D22-4DE2-4DE1-A2BC-AACE666F5F93@zytor.com>
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

On Sat, Nov 08, 2025 at 02:14:44PM -0800, H. Peter Anvin wrote:

> >+static struct rq *finish_task_switch(struct task_struct *prev)
> >+{
> >+	return finish_task_switch_ainline(prev);
> >+}
> >+
> > /**
> >  * schedule_tail - first thing a freshly forked thread must call.
> >  * @prev: the thread we just switched away from.
> 
> There is, in fact: you have to have an always_inline version, and wrap it in a noinline version.

Yes, but all of this is particularly retarded, there are exactly _2_
callers of this function. Keeping an out-of-line copy for one while
inlineing the other makes 0 sense.

Also, the amount of crap he needs to mark __always_inline doesn't make
much sense to me, is he building with -Os or something?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
