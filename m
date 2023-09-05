Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C434C83F3E
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWKUFiWofBsIvcbJqgFBIpxyOWvjajDf6PX7qm+Yqws=; b=rIArlC1TpDel3O
	c5q41YEilE7Gv4qKDDBta1EnHFyw3O0BtaPbxxdJVhTRX/Z9b4gYb1Q27QG91VrQxnXVEnennRAxM
	IrWxmi5woGG1HBoGeGm2Jxk6nBF0oxubwI2GWm5htqprjd6meICHJDF6luP5Q3Cio2o+bp1fGNYXY
	aGdi4nckjyzrHWT1TnKgoxd+mD+ceOrq3mhFap+ksCltqvmVNTqjB2FWpZ+ydZH0XVhpqyZ7Vs8yw
	EiE2v2npWGFmU4m8vsx6AjpO7yIyGkn3tvfEE4UlDojQCv64zqhJyufXh4mxeQvecYCnquo4CHOfR
	Jm7UQC3YPGkkmcLF/Abg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXzn-006GEW-2Q;
	Tue, 05 Sep 2023 15:29:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXzl-006GE9-25;
	Tue, 05 Sep 2023 15:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LWNhs2e9Iv9jGKbo5U2PTlv5NZNmT2NXwZm8hZV7Q6s=; b=G681dMzCokaHbIlui9IjVKc1JA
	aJHOIv3WiTnfz05QmGqsRr62yPSWeK5yM3efZ2x+/lTmdZ9/RnGTJbfBJbF5SJs0rgHoT+j5S6PKF
	CdX+dgI/ISTEGbHoM0xmbWGnqHLkTXIfqD1IfqTd18u0XUnuPzs0O6umFGbE4j0xE1bl1p9lB47Es
	ImgZy3PCPD4l7j/ITGOgRPfER5qAAoty2z4e6QgXkpfXSyxD9X1IFgj3VjwVM0qolb7koHosPemUH
	19pxfPkS+gPBAOclUl9szYjGvD/U/Fpt2W/K6dWpsIm/LQRBA0C+QmZtyM9FV70E3j/dLXVI8cI4T
	aaaImgew==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUIt-0008VJ-2E;
	Tue, 05 Sep 2023 11:33:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4EB0300687; Tue,  5 Sep 2023 13:33:08 +0200 (CEST)
Date: Tue, 5 Sep 2023 13:33:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
	juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH 4/4] energy_model: use a fixed reference frequency
Message-ID: <20230905113308.GF28319@noisy.programming.kicks-ass.net>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-5-vincent.guittot@linaro.org>
 <cd795543-53db-ed14-e9dd-b5738a4f3b9d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd795543-53db-ed14-e9dd-b5738a4f3b9d@arm.com>
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

On Tue, Sep 05, 2023 at 12:05:30PM +0200, Pierre Gondois wrote:
> Hello Vincent,
> I tried the patch-set on a platform using cppc_cpufreq and that has boosting
> frequencies,
> 
> 1-
> On such platform, the CPU capacity comes from the CPPC highest_frequency
> field. The CPU capacity is set to the capacity of the boosting frequency.
> This behaviour is different from DT platforms where the CPU capacity is
> updated whenever the boosting mode is enabled (it seems).
> 
> Wouldn't it be better to have CPU max capacities set to their boosting
> capacity as for CPPC base platforms ? It seems the max frequency is always
> available somehow for all the cpufreq drivers with boosting available, i.e.
> acpi-cpufreq, amd-pstate, cppc_cpufreq.

So on Intel we don't use the max (turbo) boost value, but typically end
up picking the 4-core turbo value or something. There's a comment in
arch/x86/kernel/cpu/aperfmperf.c.

Per that comment it probably makes sense to be able to differentiate
between a mobile device and a server, or perhaps we can (ab)use the EAS
enable knob for this distinction?

That is, I'm not sure it makes sense to always pick the highest boost
freqency for ARM64 servers, very much analogous to  how we don't do that
on Intel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
