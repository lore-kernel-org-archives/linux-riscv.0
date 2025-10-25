Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDF4CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T35XbWpMZPYXUcWDb2vAc+tkhlIwW01YPlEwU20psjY=; b=2quvFlslLGpCQn
	O1Yl490qFCwaCznlkOPA29pisy5KQEnqRS7C7gdRo4/eIkmHUNtSyTPGKNYa/H2k7qSx7cacVEk9t
	sh8IdggLum/xShDKHsEJJMZz9qDH5YcwSRL0m4GuJIqOfXmi5Jh0Y5AXTgw3dwaCQuvKuIb8Xn6to
	OD0MuxEFcnC8CVL8OsAXSZ5iRxtWm5eU5KVcsTW/QfbOcbXHenBSUNp5bDaiQ8A7sbApdAbkZpLcX
	IbJpH6n8LWwgsqxcBmMfBxGR2J5gpk7uQlwsuyzHPCGdMO5NdzFIo18V/5urnkSUXlNs/u842d0bL
	FfrdYb+3GQAeOB5JRFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfPb-0000000BM7P-2Rag;
	Sat, 25 Oct 2025 14:38:31 +0000
Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfPY-0000000BM6y-0mOL;
	Sat, 25 Oct 2025 14:38:29 +0000
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 59PEaKMv770534;
	Sat, 25 Oct 2025 09:36:20 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 59PEaC71770523;
	Sat, 25 Oct 2025 09:36:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 25 Oct 2025 09:36:12 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rik van Riel <riel@surriel.com>
Cc: Xie Yuanbin <qq570070308@gmail.com>, linux@armlinux.org.uk,
        mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
        andreas@gaisler.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        luto@kernel.org, peterz@infradead.org, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, anna-maria@linutronix.de,
        frederic@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, thuth@redhat.com,
        akpm@linux-foundation.org, david@redhat.com,
        lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
        max.kellermann@ionos.com, urezki@gmail.com, nysal@linux.ibm.com,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-perf-users@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH 2/3] Provide and use an always inline version of
 finish_task_switch
Message-ID: <aPzgXBd34r2wVy8I@gate>
References: <20251024182628.68921-1-qq570070308@gmail.com>
 <20251024183541.68955-1-qq570070308@gmail.com>
 <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_073828_406452_32A455B4 
X-CRM114-Status: GOOD (  12.82  )
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

On Fri, Oct 24, 2025 at 05:36:06PM -0400, Rik van Riel wrote:
> On Sat, 2025-10-25 at 02:35 +0800, Xie Yuanbin wrote:
> > finish_task_switch is called during context switching,
> > inlining it can bring some performance benefits.
> > 
> > Add an always inline version `finish_task_switch_ainline` to be
> > called
> > during context switching, and keep the original version for being
> > called
> > elsewhere, so as to take into account the size impact.
> 
> Does that actually work, or does the compiler
> still inline some of those "non-inlined" versions,
> anyway?

Of course the compiler does!  That is part of the compiler's job after
all, to generate fast, efficient code!

The compiler will inline stuff when a) it *can*, mostly it has to have
the function body available; and b) it estimates it to be a win to
inline it.  There is a whole bunch of heuristics for this.  One of those
is that the always_inline attribute will do the utmost to get inlining
to happen.

(All that is assuming you have -finline-functions turned on, like you do
have at -O2).


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
