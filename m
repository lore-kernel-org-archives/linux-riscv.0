Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C72C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JbV5upDhJZKTMfTmM5G93UzSnugfajhaGtdrB9SNgU=; b=jN7pTdAEYstZFB
	FBdcH00XB2nEclR16Ed+zd6dLiguF012bfYkT7FxW7jfSb1KMBoWGlhc1HKnjnK/tmDLOal7VGBFw
	Y/JrZrPCfUAz5IClo7bzEkcT9c7n9JfxFPzAhSL4jguMNH+PzOnPjceMz4+R8KdRNEiD13+llX8Sp
	ioFBojoRYQKn/qGnwPsLERMqbpZFaUt+PTfXsFHFVCsrBcv1qbEsv986QcnOjUDsBXcekoZMnbsgI
	oIOeuNgGjSjjeGYiyCSuQVNY12Zv/+edJpnOiCyFJvGdybpdvgFUvHr2nVpyAwrwqucOTbYQdGd4v
	4kfNECRlXtbC+InuGs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8NtJ-009ftq-Kr; Mon, 04 Jul 2022 15:21:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Nt7-009fp5-GQ; Mon, 04 Jul 2022 15:21:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAD5923A;
	Mon,  4 Jul 2022 08:21:22 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD36E3F792;
	Mon,  4 Jul 2022 08:21:19 -0700 (PDT)
Date: Mon, 4 Jul 2022 16:20:08 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	Valentina.FernandezAlanis@microchip.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, wangqing@vivo.com, robh+dt@kernel.org,
	rafael@kernel.org, ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 00/21] arch_topology: Updates to add socket support
 and fix cluster ids
Message-ID: <20220704152008.pc4s2olkdqfnx34h@bogus>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <6a647b6b-c913-b9d7-a23e-b17a8034c5c8@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a647b6b-c913-b9d7-a23e-b17a8034c5c8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_082125_632921_9438177A 
X-CRM114-Status: GOOD (  26.96  )
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

On Mon, Jul 04, 2022 at 03:10:30PM +0000, Conor.Dooley@microchip.com wrote:
> On 04/07/2022 11:15, Sudeep Holla wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Greg,
> > 
> > Let me know if you prefer to pull the patches directly or prefer pull
> > request. It has been in -next for a while now.
> > 
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
> 
> For DT + RISC-V on PolarFire SoC and SiFive fu540
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Anecdotally, v5 was tested on the !SMP D1 which worked fine when
> CONFIG_SMP was enabled.
> 

Thanks a lot for testing on RISC-V, much appreciated! Thanks for your
patience and help with v5 so that we could figure out the silly issue
finally.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
