Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F1EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEK82crdneKCPgnL5MMBFA+UVZ/2iuLF+c059xRswdI=; b=Z0SBHRO0Bl0x9V
	XvH/IVCtnfGrmxlCWSyfXPSd0VfXeKJnjPqZXFZl3vKwnRPUi+t6ug666ugeQ9JbkoEBa38Lx2urN
	Uc3EBsbCPhl/IHxZp6MYSVazipdHaN+jUFZ9flBskNtuVvVmRzDT8HZT1rO9W6nWR4/l9jl+prxnt
	T4olKFupR1HsVg5TMkVRA9vMy1ZxELCgtfLZUsIll37DpPQ0FoOocqMNNqzfOoZgrAJ+4oypU1hDf
	HB0yBf+DwQYp2NRLbQfkRxkC2Jkwp2wl/CMm0atehpjy8tWbZiWnfT7mRudl3k/rJGAVqk6O+chlS
	M+jT7MD1ui/L05X7eERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns441-00D13o-JZ; Fri, 20 May 2022 14:57:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns43d-00D0t8-2c; Fri, 20 May 2022 14:56:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0AB51477;
 Fri, 20 May 2022 07:56:47 -0700 (PDT)
Received: from bogus (unknown [10.57.66.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 989AE3F73D;
 Fri, 20 May 2022 07:56:45 -0700 (PDT)
Date: Fri, 20 May 2022 15:56:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 8/8] arch_topology: Add support to build llc_sibling
 on DT platforms
Message-ID: <20220520145639.xb33e2z5otdu264y@bogus>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-9-sudeep.holla@arm.com>
 <087176fc-1018-b107-06cc-055d7926b500@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <087176fc-1018-b107-06cc-055d7926b500@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_075649_244109_9F92617A 
X-CRM114-Status: GOOD (  19.52  )
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

On Fri, May 20, 2022 at 02:33:46PM +0200, Dietmar Eggemann wrote:
> On 18/05/2022 11:33, Sudeep Holla wrote:
> > ACPI PPTT provides cache identifiers and especially the last level cache
> > identifier is used in obtaining last level cache siblings amongst CPUs.
> > 
> > While we have the cpu map representing all the CPUs sharing last level
> > cache in the cacheinfo driver, it is populated quite late in the boot
> > while the information is needed to build scheduler domains quite early.
> > 
> > On DT platforms we can use the pointer to the last level cache as the
> > firmware identifier for the last level cache and build the cpumap sharing
> > the last level cache based on the same.
> 
> [...]
> 
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > index 58cbe18d825c..d8a36b0e27c9 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -69,6 +69,7 @@ struct cpu_topology {
> >  	int cluster_id;
> >  	int package_id;
> >  	int llc_id;
> > +	void *llc_fw_node;
> 
> Would be nicer if you could set llc_id directly to avoid all this
> addition sync `llc_id and llc_fw_node` code. ACPI PPTT has this
> ACPI_PTR_DIFF() macro which IMHO lets it create distinct ids.
> 

Indeed, I initially thought so, but they are 64 bit pointers and choosing
one reference is difficult to take some sort of diff while in ACPI it is in
a static table and we could use the reference to the top of the table.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
