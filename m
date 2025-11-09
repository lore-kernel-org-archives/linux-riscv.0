Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDABCCFA1E
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTtUfFNvdqVGmzLdFS2b3sYEXdq+c7QEVx5UbZwoFTQ=; b=Nrh3+u/1ittVhj
	M7z1QHTcbsWWgqEnHqcev3qNEeLowh/fYJU6+0ClIn5WYAmItVSV7/ZJsZkfBOOrdHY0noaLQCRTJ
	PeQ37dT1nVqBcb/Kvl8gta+alJCR2SPJMECOoaDylLoiIVmMIVpv4PRp+8tgsRyrRHkTqZh8m4XBM
	Wx/tifZc84R7C3/0Xe/uwc11GExIVrPm8LduYeP0P4BAVkgPna1HIjMi2n7mKRLXq6MXcDntZEhjw
	UDw/HIcq9Zzhk2TT27BrRcm6N59CLEopq79plb3CrsY5uCVsKO7mkXudJ7DZKuF8E51H+juDhlc8W
	OcHNLY0+VrWLGcqRi1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3eH-00000003xiO-1dBK;
	Sun, 09 Nov 2025 11:31:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3eG-00000003xiH-2pMB
	for linux-riscv@bombadil.infradead.org;
	Sun, 09 Nov 2025 11:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sj3yBmlxQ4W38p/wAx0e8hgiWkvWvoSbutcbd+syeP0=; b=c4ZDBlUNMfG/ytvuBBlTq0qm8S
	MlKl4d9JFxUzGKZpIZOMpx0+JgdVe/RmU1yMEU452I9Vnniqav6Pr7VhJm/Z+IIa52V8Ekij4WRYL
	B7uVz/Z+d+SAaxw3HmtziAoj52Vd2kU9m20p5mhVCJhPJKt5VrZuJm7doI5DyKqpS51TID5MgUeIr
	IEN6VtLEcJ/WpbaRg28JXhBFV+8G9Z6VeTFfpNNLq+wrB72dH9ZiZk6/fvGRCNrmoLUSp4dhYuvBr
	T8YxnjBsPLj5B6NBjr03Nz34bcnXmjZDwdSWsWre059/mkuo/SM+FbHID0xz0HrbVNlU+6DtFi7VK
	+C8gMYKQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3eE-00000006OuP-0q3c;
	Sun, 09 Nov 2025 11:31:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C96F9300230; Sun, 09 Nov 2025 12:31:52 +0100 (CET)
Date: Sun, 9 Nov 2025 12:31:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Xie Yuanbin <qq570070308@gmail.com>
Cc: david@redhat.com, tglx@linutronix.de, segher@kernel.crashing.org,
	riel@surriel.com, linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
	andreas@gaisler.com, luto@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
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
Message-ID: <20251109113152.GA2545891@noisy.programming.kicks-ass.net>
References: <20251108172346.263590-1-qq570070308@gmail.com>
 <20251108172346.263590-4-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251108172346.263590-4-qq570070308@gmail.com>
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

On Sun, Nov 09, 2025 at 01:23:45AM +0800, Xie Yuanbin wrote:
> On critical hot code paths, inline functions can optimize performance.
> However, for current compilers, there is no way to request them to inline
> at a specific calling point of a function.
> 
> Add a always inline version to some functions, so that they can be chosen
> when called in hot paths.

There isn't a single function in the entire kernel with an _ainline
suffix, while there are a ton of _inline suffixed functions.

On top of that, this function was already marked inline, and your
compiler just chose to not inline them for raisins. Just make the thing
__always_inline and forget, dont make thing extra ugly for no reason.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
