Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB87FCCFA13
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkuwSWzS1B8HwuE0YRBxmGhyPGx8GECnnsM10DN28BE=; b=qd4LrSD7SUO8Ch
	xl3Qxkk3PyxiV8pQSo78RX94bQf7IK0uDRG+cXkY76zjYn87ltqqJVtf9EN6D6Q270HCVt7derMng
	6/VRnJqRW3BtVk96aRpKvm36iJR0AL9P/ifdlBhSZM75XmXc7UMqULTNJS9e9RhvhcBVV1hG+JycP
	V7pmUVJX6nUyrQ0SNKaqzt+KGER6pCVtimUtIR4O5JPGrRAcTJNgDtDDC4WQRnvHV97Dm3lmxS25s
	4xJkTlPHQY0L5WyuLusOmdsnhvDpGCpWYz7lM3/nzEm0WtE5+Enhdavxht96178UCw8lXF9AkTIAK
	bLU6pPkVBXn3HNX6+zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3hp-00000003xxT-29bl;
	Sun, 09 Nov 2025 11:35:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3hn-00000003xxD-3WQq
	for linux-riscv@bombadil.infradead.org;
	Sun, 09 Nov 2025 11:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E7of+KRv5wtg04L0riOBm6jlSGoN8qeuSNDj0ONKyk8=; b=v//DKtfCaZRI9e4pBqXwSbKMej
	oWCDzCjkUmFRPg8JSGmmfuK3xTyilDXMwVK0ar294XzQFipwkQXHrh4hNjL/si8UBknNzXMBVFTOv
	/WtQyPfSMqTrtm0iisaAwvfug7nMfu/j/rAzQmmwJcC2HeXeYcsOl9DLOKyvZHQ3YFlo/Vku4om13
	GAf4Ud2TUeikWDwOOv36oKpt0CVL8CgDg1KKsG0q2B5xyqVXUBbWP5yyStdVMfCqEp0B9LtigB3gR
	VG+SgnhIaEEsLOWHJnrFmwc87Zo5zMu+/W+z59SxJppKAgU7LvUlrtHdOvXu0BzZ6GFr4PNi7TJE4
	bb8Idpow==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3hm-00000006Sil-0zub;
	Sun, 09 Nov 2025 11:35:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BB27B300230; Sun, 09 Nov 2025 12:35:33 +0100 (CET)
Date: Sun, 9 Nov 2025 12:35:33 +0100
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
Subject: Re: [PATCH v2 4/4] Make finish_task_switch and its subfuncs inline
 in context switching
Message-ID: <20251109113533.GB2545891@noisy.programming.kicks-ass.net>
References: <20251108172346.263590-1-qq570070308@gmail.com>
 <20251108172346.263590-5-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251108172346.263590-5-qq570070308@gmail.com>
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

On Sun, Nov 09, 2025 at 01:23:46AM +0800, Xie Yuanbin wrote:
> `finish_task_switch` is a hot path in context switching, and due to
> possible mitigations inside switch_mm, performance here is greatly
> affected by function calls and branch jumps. Make it inline to optimize
> the performance.
> 
> After `finish_task_switch` is changed to an inline function, the number of
> calls to the subfunctions (called by `finish_task_switch`) increases in
> this translation unit due to the inline expansion of `finish_task_switch`.
> Due to compiler optimization strategies, these functions may transition
> from inline functions to non inline functions, which can actually lead to
> performance degradation.
> 
> Make the subfunctions of finish_task_stwitch inline to prevent
> degradation.

Yeah, try again without that _ainline garbage.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
