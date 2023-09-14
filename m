Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D00EEAA74
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPJk3darLVPFYbFREfoOd7mvlNVHnxmekkejSEDQAAk=; b=28SdYrgYSSGold
	QTF12A9baSSoQrbg65pxtMaq+ntmUtI773CIlKI82xsiofEfQVbdNhsSAJSE8yCrAoqSATsvg5kWm
	vmuQffyXDq4gj3+Z4Y+33URpDx1LMNTqYi61C2OlgNQVUVn7MLnELF0xg7YcYurVyU+qR9Eq8Y6Zb
	lXVrZqXx/bIC9YxqYN29tdhpLyalYiLZRTD7N3PgCGZPruFEU09NREZYildLDqrqc/ZkQjDHEcPIW
	II8Jc0qHUyYYGyLU4RZybctWVAhm1Zsq9d9BCkKppYVKwJJhB26qjKqU0UV+6Qrox7j0YbWBTIOmi
	DFqX7yLJEZ5OXFiUut1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtE3-009FSD-0X;
	Thu, 14 Sep 2023 20:46:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtDz-009FR6-1K;
	Thu, 14 Sep 2023 20:46:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9C881FB;
	Thu, 14 Sep 2023 13:46:38 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1F0D3F738;
	Thu, 14 Sep 2023 13:45:57 -0700 (PDT)
Message-ID: <be527eb1-d253-b9fe-ecc9-4c7b04da9efd@arm.com>
Date: Thu, 14 Sep 2023 22:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] sched: consolidate and cleanup access to CPU's max
 compute capacity
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, viresh.kumar@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, lftan@kernel.org
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-2-vincent.guittot@linaro.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20230901130312.247719-2-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_134607_517020_7F36E1CD 
X-CRM114-Status: GOOD (  13.45  )
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

On 01/09/2023 15:03, Vincent Guittot wrote:
> Remove struct rq cpu_capacity_orig field and use arch_scale_cpu_capacity()
> instead.
> 
> Scheduler uses 3 methods to get access to the CPU's max compute capacity:
> - arch_scale_cpu_capacity(cpu) which is the default way to get CPU's capacity.
> - cpu_capacity_orig field which is periodically updated with
>   arch_scale_cpu_capacity().
> - capacity_orig_of(cpu) which encapsulates rq->cpu_capacity_orig
> 
> There is no real need to save the value returned by arch_scale_cpu_capacity()
> in struct rq. arch_scale_cpu_capacity() returns:
> - either a per_cpu variable.
> - or a const value for systems which have only one capacity.
> 
> Remove cpu_capacity_orig and use arch_scale_cpu_capacity() everywhere.
> 
> No functional changes.
> 
> some tests of Arm64:
> small SMP device (hikey): no noticeable changes
> HMP device (RB5): hackbench shows minor improvement (1-2%)
> large smp (thx2): hackbench and tbench shows minor improvement (1%)
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Next to util_fits_cpu() which uses capacity_orig as a local variable
(which is fine) there is sis() referring to capacity_orig in a comment.

Documentation/scheduler/sched-capacity.rst uses the term `capacity_orig`
in chapter 1.2 to explain the difference between CPU's maximum
(attainable) capacity and capacity as the former reduced by pressure.

Not sure if you want to change those refs as well with this patch?
People might get confused about the term `capacity_orig` pretty soon.

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
