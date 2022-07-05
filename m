Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244C2C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykwucRdnrKx6PxWdVFTcXrrP/zgbWxJfBUya3EameuE=; b=JWq9rLESn6DGZT
	Qlw21pv/Xo+GJRtc05bHc/nwOCmNsyqIf7hAimDAar4TdQLmenZUaGs8m6EeLZryTa1L8QtNgvvrW
	o8jLrZKZ5WP/HUiJN90Xw503iJAw/zJRvElyBTYyDv1Ew9EJnazTi3mrVMExhmGeklHzeQe4UfmuJ
	PIF+2GodgN9oEG1wphzjJ1WNRLTDn04sCgB5gu0NkCbXTClSXJ5F1ZkBmNq4y1tildnsFqu4urreS
	G9uV/amCkf0ralL8RKfuE5+R5qqpNS1ZJ0yX0EqWyTHodlm/QxJ9UbU8o33GVbfEGMPMgQgrq1CJ7
	7Pq3nxw065PFvBBDtlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8or9-002XnP-6H; Tue, 05 Jul 2022 20:09:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8oqx-002XiR-5Q; Tue, 05 Jul 2022 20:09:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3E1152B;
	Tue,  5 Jul 2022 13:08:51 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 030783F70D;
	Tue,  5 Jul 2022 13:08:47 -0700 (PDT)
Date: Tue, 5 Jul 2022 21:07:37 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: Brice.Goglin@inria.fr, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, Valentina.FernandezAlanis@microchip.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	wangqing@vivo.com, robh+dt@kernel.org, rafael@kernel.org,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kernel@esmil.dk
Subject: Re: [PATCH v6 00/21] arch_topology: Updates to add socket support
 and fix cluster ids
Message-ID: <20220705200737.unxj2hdcowdjdkt2@bogus>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <6a647b6b-c913-b9d7-a23e-b17a8034c5c8@microchip.com>
 <507c6b64-fc23-3eea-e4c1-4d426025d658@inria.fr>
 <da1cf1aa-7291-92cd-4b62-0af0d0d12277@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da1cf1aa-7291-92cd-4b62-0af0d0d12277@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_130859_301794_C2D774CB 
X-CRM114-Status: GOOD (  27.25  )
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

On Tue, Jul 05, 2022 at 07:06:17PM +0000, Conor.Dooley@microchip.com wrote:
> [Adding back the CC list from the original thread]
> 
> On 05/07/2022 13:27, Brice Goglin wrote:
> > [You don't often get email from brice.goglin@inria.fr. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hello Conor
> > 
> > I am the main developer of hwloc [1] which is used by many people to
> > detect the topology of servers. We're started to see some users of hwloc
> > on RISC-V and we got some reports about the topology exposed by
> > Linux/sysfs being wrong on some platforms.
> > 
> > For instance https://github.com/open-mpi/hwloc/issues/536 says HiFive
> > Unmatched with SiFive Freedom U740 running Linux 5.15 exposes a single
> > core with 4 threads instead of 4 cores, while StarFive VisionFive v1
> > with JH7100 running 5.18.5 correctly exposes 2 cores.
> 
> And with Sudeep's patches applied I get (next-20220704):
> # hwloc-calc -N core all
> 1
> # hwloc-calc -N pu all
> 4
> On a PolarFire SoC (so the same as a SiFive U540).
> So unfortunately, these patches are not the fix you seek!
>

Not sure what you mean by that ?

> Wracked my brains for a bit, but could not see any differences
> between the U740 and the JH7100. Culprit seems to be the lack
> of a cpu-map node (which is only present in the downstream dt).
>

Indeed, the topology depends on /cpu-map node. However on ARM64 we do
have fallback settings in absence of /cpu-map node so that it is handled
correctly. I wasn't sure what was or can be done on RISC-V as /cpu-map
is optional.

> I've sent patches for the upstream devicetrees:
> https://lore.kernel.org/linux-riscv/20220705190435.1790466-1-mail@conchuod.ie/
>

I will take a look.

> > Does it depend a lot on the platform because
> > device-tree and/or ACPI aren't always properly filled by vendors?

Absolutely.

> > Does it depend a lot on the Linux kernel version?

Ideally not much, but hey we had some issues on Arm64 too which this series
is addressing.

> > Should I expect significant improvements for both in the next months?

Not much in topology or nothing planned. I have no idea on NUMA


Hi Conor,

I would have preferred you to add me to the original thread and referred
this thread from there. I don't want to derail the discussion in this
thread as nothing much can be done here.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
