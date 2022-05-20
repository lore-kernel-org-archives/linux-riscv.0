Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C156FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viVFl3UcIFcafsjbhpC+1xOBvyEcUGkAyH8WVmAAn8g=; b=YGND2ZxniUNuvZ
	x1CxgtvOhkCvr3HxCWCL4qTRg8MvvKM3QqyHQHMFdZPca5MSoZvHgb20tIZVqI0s/oRaXeLLX+T0L
	Y6wn079bUZIfsPzB43JfMBNfLq+P9pqAunH81PQqBH8SPnVwq9miR/Bb7RK4raYOv1/smQCVo1B3V
	xAkuhU39OrM2vdPnV+FaWWBfC6ZyOgQD2D/8saNqWCLkBBFnTzWKtBbLBNM1qR7KV0084xNLUz2ci
	Yh3QmJ96FcfWrA3TqMkQGBvq/N9b2rhFi+jbDDRDJxqBqMwMx7ogG0wH1DGBZSGWVyw3d92pld0dS
	+pj0HPuyxrGtS8aoQ8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2Ew-00CXGh-SF; Fri, 20 May 2022 13:00:22 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2Ej-00CXBi-DB; Fri, 20 May 2022 13:00:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D731477;
 Fri, 20 May 2022 06:00:08 -0700 (PDT)
Received: from bogus (unknown [10.57.66.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECDCE3F73D;
 Fri, 20 May 2022 06:00:05 -0700 (PDT)
Date: Fri, 20 May 2022 13:59:59 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 8/8] arch_topology: Add support to build llc_sibling
 on DT platforms
Message-ID: <20220520125959.wlxz53cfqldljxjy@bogus>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-9-sudeep.holla@arm.com>
 <CAL_JsqKig8U4hQEtHW8ct1Pd0a29ZtoTp1HuWQv389yb+SuW_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKig8U4hQEtHW8ct1Pd0a29ZtoTp1HuWQv389yb+SuW_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_060009_572055_D843C956 
X-CRM114-Status: GOOD (  21.70  )
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

On Thu, May 19, 2022 at 01:10:51PM -0500, Rob Herring wrote:
> On Wed, May 18, 2022 at 4:34 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > ACPI PPTT provides cache identifiers and especially the last level cache
> > identifier is used in obtaining last level cache siblings amongst CPUs.
> >
> > While we have the cpu map representing all the CPUs sharing last level
> > cache in the cacheinfo driver, it is populated quite late in the boot
> > while the information is needed to build scheduler domains quite early.
>
> Late is because it's a device_initcall() rather than late in the cpu
> hotplug state machine, right?

Right. The expectation is to run in on each online CPU in CPU hotplug state
machine for some architectures. We may not need that on arm64 especially
since we get all info from DT or ACPI, but e.g. x86 uses cpuid which needs
to be executed on that CPU.

> The late aspect is for sysfs presumably,but I think we could decouple that.

OK, not sure when this sched_domain info is actually needed. It think it
could be decoupled if we can wait until all the cpus are online.

> Do all the firmware cache parsing early and then populate the sysfs parts
> later.

Yes that may work on DT/ACPI based systems, as I said x86 relies on cpuid.

> It's not a unique problem as the DT unflattening and init code has to
> do the same thing. I'd assume the hotplug and cpu sysfs devices have
> to deal with the same thing.
>

OK, I will take a look at how to do that.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
