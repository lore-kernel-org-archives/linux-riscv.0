Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C40C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95tBIBtQidTXiYnseqQMUlDaxn8PUYhRd2kTFWND+Ps=; b=q2KtqGUk9sbPR+
	VvHmJLuq2cKskY3mRpjHNhhM7FusormFpfvupDfwOqb6pZw7RjzDWSdwfjipdxSc+4duw6R9CsU9J
	eghY1rp6+S2o4uUU7KepdjUR4TfgLGWEzFvnYN4U5UUaUgx5Sxa3rBxWxuQmrt2WaVf0NzdBPOmTm
	j10h9x2Z2WKGU3XEgBU7qfHIQeBYKmFgVRH43tduA2l75QmIJFnPfcS92erd9CDdd2yqxtshkOxq4
	lcJB5eP7bG4Ehp3iL1nTUX3Z0uDfX+QiAQTd9R16qV22t8NImkSn8D1IFtp2QfA9xCEc0v9YRtFnw
	vTLfP6IF24t3Ggi76Skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcjl-00CGup-2T;
	Wed, 25 Oct 2023 12:11:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcjj-00CGuE-2F;
	Wed, 25 Oct 2023 12:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4jXfSAs/OUT6Ayj3tW7CYh3Hb2UaHX2D+jHjYtfb32k=; b=lYi0G2ACqlktbPLMIQ3Mqzp/sf
	cy6joSVmmS/2yikTEosSVY/MI/R++s0XcXjSX7w4zZ4SCFDB6sPbjP5lhobDLhdw3gVfeCRS06MKS
	KWOaC2WU3qT/5lNPmxsZ+gsxoH9XO87+flkxO+keRCTdFm1mLFuG+OVk+vISH//hN3Ve4NGnVIN+B
	saztQZWZK7M50YEHcPhAH9A8XFUQfYqlJvCxQNdKanntFGg4+kHQA9KNjjEcYG++CL2n3cm/yhW4F
	z8Pr8syoW/k6+JdqAYY2e1oz7wAWhqw3xmcZp5AtZFoEbZD0ipetCVyeYNn0+79DalbFnTN9tgN3J
	lGZnckJw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qvcjg-008fgr-AQ; Wed, 25 Oct 2023 12:11:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4EDC30047C; Wed, 25 Oct 2023 14:11:43 +0200 (CEST)
Date: Wed, 25 Oct 2023 14:11:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v3 4/6] energy_model: use a fixed reference frequency
Message-ID: <20231025121143.GA28289@noisy.programming.kicks-ass.net>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-5-vincent.guittot@linaro.org>
 <20231025115456.GD31201@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025115456.GD31201@noisy.programming.kicks-ass.net>
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

On Wed, Oct 25, 2023 at 01:54:56PM +0200, Peter Zijlstra wrote:

Also, can we pretty please not cross-post to moderated lists, that's
rude.

Rafael, can you please mark this acpica-devel crap as moderated in
MAINTAINERS so that it can be auto-magically excluded from receiving
mail?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
