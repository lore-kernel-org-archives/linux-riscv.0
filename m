Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184A5C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 15:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D102075B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 15:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R5vPFZE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D102075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enST+yHUCdJdvtUhdPa51i5FFKXGctA+k5QX900quno=; b=R5vPFZE8aVUWKO
	jrjEaLGXzYRjhJo/Ej9CBw3nhX2SbR9qdxXtngZHnehPwfvtafy5PvImpDGee1Nn2uhrSpwCh4qMi
	x81x3xK/qfhIQKh0TInry2lQ8ywC2ED9t6md+UqJiWEufgwDjn6loOFJRY8nCS6BU/TOH5HpDw0h1
	+MM8tq6nyyMpZv9cHenTo8fNqBL20DAQIWv3FJYOhHUAIOvmYGIJTh6+HvXQs2PTfNozCUQPv+ogR
	GUozjRi4KCYjY4GfI2E3tmKNOqrMlW/pgBpKRH37CmTlPrd19rB781Bg021V1qSgKdE/FcKQcxrik
	lF3pvn6wC7A8arApYo3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG3WU-0003lO-1K; Mon, 15 Apr 2019 15:27:54 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG3WR-0003kw-Ux
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 15:27:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 123B9374;
 Mon, 15 Apr 2019 08:27:51 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D6813F68F;
 Mon, 15 Apr 2019 08:27:47 -0700 (PDT)
Date: Mon, 15 Apr 2019 16:27:41 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT/RFC PATCH v3 3/5] cpu-topology: Move cpu topology code to
 common code.
Message-ID: <20190415152741.GA28623@e107155-lin>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320234806.19748-4-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_082752_005118_C6CE19DF 
X-CRM114-Status: GOOD (  17.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-riscv@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
 Anup Patel <anup@brainfault.org>, Morten Rasmussen <morten.rasmussen@arm.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

Thanks again for doing this. Overall changes look good except a couple
of minor nit, see below.

On Wed, Mar 20, 2019 at 04:48:04PM -0700, Atish Patra wrote:
> Both RISC-V & ARM64 are using cpu-map device tree to describe
> their cpu topology. It's better to move the relevant code to
> a common place instead of duplicate code.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  arch/arm64/include/asm/topology.h |  23 ---
>  arch/arm64/kernel/topology.c      | 303 +-----------------------------
>  drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
>  drivers/base/topology.c           |   1 +
>  include/linux/arch_topology.h     |  28 +++
>  5 files changed, 330 insertions(+), 323 deletions(-)
> 

[...]

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index edfcf8d9..6cc6a860 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -6,8 +6,8 @@
>   * Written by: Juri Lelli, ARM Ltd.
>   */
>  
> -#include <linux/acpi.h>
>  #include <linux/arch_topology.h>
> +#include <linux/acpi.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
>  #include <linux/device.h>
> @@ -16,6 +16,11 @@
>  #include <linux/string.h>
>  #include <linux/sched/topology.h>
>  #include <linux/cpuset.h>
> +#include <linux/cpumask.h>
> +#include <linux/init.h>
> +#include <linux/percpu.h>
> +#include <linux/sched.h>
> +#include <linux/smp.h>
>  
>  DEFINE_PER_CPU(unsigned long, freq_scale) = SCHED_CAPACITY_SCALE;
>  
> @@ -278,3 +283,294 @@ static void parsing_done_workfn(struct work_struct *work)
>  #else
>  core_initcall(free_raw_capacity);
>  #endif
> +
> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)

Why can't the above one be just GENERIC_ARCH_TOPOLOGY ?
I may be missing to find it myself, but would like to know.

> +
> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)

Ditto.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
