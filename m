Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CE5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnOSER/O5ffY2+2eZGzNRpsI7rNQ4Dnh3zooTPeQDLU=; b=NwI9IQvjNLeJ5z
	moDeltStus4pjugk0kQB/6M10R79B6sysk83OOLGs0wwd6ZqAT7hVLsubZhZMtUHPMRrRCChuW5VO
	ANbP1c+3SAAQ4bUdeWuydysFYh1HQu8LMEUUp+pOwb4IFSH40eNFlMMJrudZl6eDJ6f/Ulc+ZhcZb
	SMWlQA+p1Pwxi9Qn42V8swz1Ei8zmZeqnvEZo+P6Q4ZWTTM/ycJmpX+E7nkWRfgDi+iWVBE22xqTm
	32Zz5H6q2QA2ZfVPM6cANRotRa6OhXGK1vHFX9w2tUcPXBdRddhou/dQ9/BeY1GTEnSk5FoXoo0x+
	JQRNAMLM51E5OAALoFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rWm-001nXE-Rj; Mon, 27 Jun 2022 16:23:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rWM-001nJA-0p; Mon, 27 Jun 2022 16:23:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 060381758;
	Mon, 27 Jun 2022 09:23:24 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106C03F66F;
	Mon, 27 Jun 2022 09:23:21 -0700 (PDT)
Date: Mon, 27 Jun 2022 17:22:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 00/20] arch_topology: Updates to add socket support
 and fix cluster ids
Message-ID: <20220627162211.t2dlu2no2turnc6r@bogus>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <Yrm2lG3uskxT26Of@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yrm2lG3uskxT26Of@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_092330_198167_AACEAB51 
X-CRM114-Status: GOOD (  33.92  )
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

On Mon, Jun 27, 2022 at 02:54:28PM +0100, Ionela Voinescu wrote:
> Hi Sudeep,
> 
> On Tuesday 21 Jun 2022 at 20:20:14 (+0100), Sudeep Holla wrote:
> > Hi All,
> > 
> > This version updates cacheinfo to populate and use the information from
> > there for all the cache topology.
> > 
> > This series intends to fix some discrepancies we have in the CPU topology
> > parsing from the device tree /cpu-map node. Also this diverges from the
> > behaviour on a ACPI enabled platform. The expectation is that both DT
> > and ACPI enabled systems must present consistent view of the CPU topology.
> > 
> > Currently we assign generated cluster count as the physical package identifier
> > for each CPU which is wrong. The device tree bindings for CPU topology supports
> > sockets to infer the socket or physical package identifier for a given CPU.
> > Also we don't check if all the cores/threads belong to the same cluster before
> > updating their sibling masks which is fine as we don't set the cluster id yet.
> > 
> > These changes also assigns the cluster identifier as parsed from the device tree
> > cluster nodes within /cpu-map without support for nesting of the clusters.
> > Finally, it also add support for socket nodes in /cpu-map. With this the
> > parsing of exact same information from ACPI PPTT and /cpu-map DT node
> > aligns well.
> > 
> > The only exception is that the last level cache id information can be
> > inferred from the same ACPI PPTT while we need to parse CPU cache nodes
> > in the device tree.
> > 
> > Hi Greg,
> > 
> > I had not cc-ed you on earlier 3 versions as we had some disagreement
> > amongst Arm developers which we have not settled. Let me know how you want to
> 
> s/not/now :)
> 
> > merge this once you agree with the changes. I can set pull request if
> > you prefer. Let me know.
> > 
> > v4[3]->v4:
> > 	- Updated ACPI PPTT fw_token to use table offset instead of virtual
> > 	  address as it could get changed for everytime it is mapped before
> > 	  the global acpi_permanent_mmap is set
> > 	- Added warning for the topology with nested clusters
> > 	- Added update to cpu_clustergroup_mask so that introduction of
> > 	  correct cluster_id doesn't break existing platforms by limiting
> > 	  the span of clustergroup_mask(by Ionela)
> > 
> 
> I've tested v4 on quite a few platforms:
>  - DT: Juno R0, DB845c, RB5
>  - ACPI: TX2, Ampere Altra, Kunpeng920
> 
> and it all looks good from my point of view (topology and sched domain
> hierarchy).
> 
> So for the full set (after the changes requested for 16/20 and 20/20):
> 
> Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
>

Thanks for all the review and testing. Much appreciated!

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
