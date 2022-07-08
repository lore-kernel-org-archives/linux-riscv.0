Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82902C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Up5nAtemFSs6P0OP2c4aigcyObbneqA1UbE2Ko1jTHY=; b=FFeqHpABKC+gDL
	rtwaxovsTtdwClarzYuFZ9DjWo6ziqEp+jMZlmpQr/ecfCkY0LD3tiCW8w+1s4iMZriHYitydBhuT
	54JhRAAtkEdNly3SGaSbpiVqd1krxuKdfGIgykeV/ykhFGqQAmxdo+viBjn/LGj8/b7c4w/QlEwZM
	Xc4pmwijHWYXqoIDe9ECsKv2k70zDUNpR+4Bul/8SadrBMH06oH2A1OMxpp3ZIMWYtJ+l01q/XxkP
	KFa7T7jLUXdd+d9A5JeaVozhXIjcGzC7dxX0flPgoMlx5eM3IRKFbPu0gnbkG4zoSan/tDnL7o1KQ
	4bhAXo0ZdA5CocHsfqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9izu-002MeV-MW; Fri, 08 Jul 2022 08:05:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9izd-002MXH-U9; Fri, 08 Jul 2022 08:05:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD9CE1063;
	Fri,  8 Jul 2022 01:05:38 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 989E93F792;
	Fri,  8 Jul 2022 01:05:35 -0700 (PDT)
Date: Fri, 8 Jul 2022 09:04:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Darren Hart <darren@os.amperecomputing.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 17/21] arch_topology: Limit span of
 cpu_clustergroup_mask()
Message-ID: <20220708080424.22x2bgcbggb6skua@bogus>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <20220704101605.1318280-18-sudeep.holla@arm.com>
 <Ysd160PQdWoDIdRC@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ysd160PQdWoDIdRC@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_010542_102268_12DDC589 
X-CRM114-Status: GOOD (  28.93  )
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

Hi Darren,

I will let Ionela or Dietmar cover some of the scheduler aspects as
I don't have much knowledge in that area.

On Thu, Jul 07, 2022 at 05:10:19PM -0700, Darren Hart wrote:
> On Mon, Jul 04, 2022 at 11:16:01AM +0100, Sudeep Holla wrote:
> > From: Ionela Voinescu <ionela.voinescu@arm.com>
> 
> Hi Sudeep and Ionela,
> 
> > 
> > Currently the cluster identifier is not set on DT based platforms.
> > The reset or default value is -1 for all the CPUs. Once we assign the
> > cluster identifier values correctly, the cluster_sibling mask will be
> > populated and returned by cpu_clustergroup_mask() to contribute in the
> > creation of the CLS scheduling domain level, if SCHED_CLUSTER is
> > enabled.
> > 
> > To avoid topologies that will result in questionable or incorrect
> > scheduling domains, impose restrictions regarding the span of clusters,
> 
> Can you provide a specific example of a valid topology that results in
> the wrong thing currently?
>

As a simple example, Juno with 2 clusters and L2 for each cluster. IIUC
MC is preferred instead of CLS and both MC and CLS domains are exact
match.

> > 
> > While previously the scheduling domain builder code would have removed MC
> > as redundant and kept CLS if SCHED_CLUSTER was enabled and the
> > cpu_coregroup_mask() and cpu_clustergroup_mask() spanned the same CPUs,
> > now CLS will be removed and MC kept.
> > 
> 
> This is not desireable for all systems, particular those which don't
> have an L3 but do share other resources - such as the snoop filter in
> the case of the Ampere Altra.
> 
> While not universally supported, we agreed in the discussion on the
> above patch to allow systems to define clusters independently from the
> L3 as an LLC since this is also independently defined in PPTT.
>
> Going back to my first comment - does this fix an existing system with a
> valid topology? 

Yes as mentioned above Juno.

> It's not clear to me what that would look like. The Ampere Altra presents
> a cluster level in PPTT because that is the desireable topology for the
> system.

Absolutely wrong reason. It should present because the hardware is so,
not because some OSPM desires something in someway. Sorry that's not how
DT/ACPI is designed for. If 2 different OSPM desires different things, then
one ACPI will not be sufficient.

> If it's not desirable for another system to have the cluster topology -
> shouldn't it not present that layer to the kernel in the first place?

Absolutely 100% yes, it must present it if the hardware is designed so.
No if or but.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
