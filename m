Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E267CD3427
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRWTASa+HNaRQjoLpQotFeLnQhe3BvvwdmSszcgNXFo=; b=gltp1RlXNaHQSb
	wPGspIhCV3Qfsxua+PrBOpcKngGSdxQNpGqvkSHkr3Hx9JxT9HjiPm1IZek2fZBLXUazCgm9v6HpH
	zKm5krUVyvR2FF2xN49u18CgMzoaKCG0wbTVbgFL/Xw+9uJhyXMHXxJCP6XhzFbtVwZ7YiObc1isx
	BD8EWfFjbJmjBNQ0kNB53XGh/gCyWQIiRUluqVI3P2VdjwQzS9/w3YJKDOUJD+mnblo67iPgTeSnP
	c48XlGPifYpy932zNi43pFKqjQ6BNHc4MXYNclQfoyFUGqueiCxPuKbYUglrb4zi0fZdLXicZyOhN
	9+/KwxERM4ZG1Va/LqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIwmK-00000007mKh-1MzQ;
	Fri, 01 May 2026 22:56:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIwmI-00000007mK0-0Onh
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 22:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C046640BDA;
	Fri,  1 May 2026 22:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C758C2BCB4;
	Fri,  1 May 2026 22:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777676167;
	bh=1iwI2aafpKey+TcNpyfdl6cbDQtnncXbzDesvM+TRLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVWaxZw91EPxSiL0niMsYUnvbV+iahQvNTUpd2iooPHMe2tXk4F+76ugSAQB+ZfyL
	 83MAIleVOYBCp16xg9ptRPFXaa5CCJuvu0ZZT7oNDHUKJwO13e2CEPYgPbFUQqDyCu
	 KGhC6IMSFarh6xghANHhjuz2NVGGt4GF2uKMpgc7LstKNdacnhtV6vveZoHzetcClP
	 M0hfNwdQnIFUvxOAcHaldKZsxFP3wAa74ssiZqk67KGHol/SyCHyPq0cZ1s9gtwFCN
	 dWeB8uLQgq9hWxQYORvT72I2PTp6YmIWELyLBEs7VvsM9aFg076a15zuwo1Pq2ACAW
	 FRSa9mf8D8Caw==
Date: Fri, 1 May 2026 15:56:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v3 06/11] RISC-V: QoS: add resctrl setup and domain
 management
Message-ID: <afUvhf4SdKVjLqfk@x1>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
 <20260414-ssqosid-cbqri-rqsc-v7-0-v3-6-b3b2e7e9847a@kernel.org>
 <9a8860a5-f63f-497c-ade9-6f64286abff0@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a8860a5-f63f-497c-ade9-6f64286abff0@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_155610_175518_5A1744DE 
X-CRM114-Status: GOOD (  21.47  )
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org, Gong Shuai <gong.shuai@sanechips.com.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Gong Shuai <gsh517@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2026 at 04:20:09PM -0700, Reinette Chatre wrote:
> Hi Drew,
> 
> On 4/14/26 6:54 PM, Drew Fustini wrote:
> > +
> > +static int qos_resctrl_add_controller_domain(struct cbqri_controller *ctrl)
> > +{
> > +	struct rdt_ctrl_domain *domain;
> > +	struct cbqri_resctrl_res *cbqri_res = NULL;
> > +	struct rdt_resource *res = NULL;
> > +	struct list_head *pos = NULL;
> > +	int err;
> > +
> > +	domain = qos_new_domain(ctrl);
> > +	if (!domain)
> > +		return -ENOSPC;
> > +
> > +	switch (ctrl->type) {
> > +	case CBQRI_CONTROLLER_TYPE_CAPACITY:
> > +		cpumask_copy(&domain->hdr.cpu_mask, &ctrl->cache.cpu_mask);
> 
> Looking at patch #10 ctrl->cache.cpu_mask contains all CPUs associated with cache
> even if they are offline. This is not what resctrl expects. Instead the expectation is
> that a domain exists and is online (hence "resctrl_online_ctrl_domain()") if at least one CPU
> belonging to that domain is online and domain->hdr.cpu_mask lists all the *online* CPUs
> associated with that domain.
> This is why resctrl always takes the CPU hotplug lock when traversing the domain
> lists.
> 
> I thus expected this initialization to be split between an early initialization of
> resource capabilities and then domain initialization as part of the CPU online/offline
> handlers.

Good point. I'll rework this so that domain allocation moves to the cpu
online/offline handlers.

[..]
> > +	if (pos)
> > +		list_add_tail(&domain->hdr.list, pos);
> > +	else
> > +		list_add_tail(&domain->hdr.list, &res->ctrl_domains);
> 
> resctrl_find_domain() returns NULL if it cannot find an existing domain, in that
> case it initializes "pos" to support adding a new domain in a sorted list.
> Expectation is that domains are managed as part of CPU hotplug handlers. When
> a CPU comes online then handler can check if the domain it belongs to already exists,
> if it does then the CPU can just be added to that domain's cpu_mask, if it does
> not then a new domain is created and added in the the appropriate spot in the
> sorted list (based on domain ID) of domains. 

Okay, I'll move this from probe to qos_resctrl_online_cpu().

> > +int qos_resctrl_online_cpu(unsigned int cpu)
> > +{
> > +	resctrl_online_cpu(cpu);
> 
> This is where a domain is expected to be added when its first CPU comes online.
[..]
> > +int qos_resctrl_offline_cpu(unsigned int cpu)
> > +{
> > +	resctrl_offline_cpu(cpu);
> 
> This is where a domain is expected to be removed when its last CPU goes offline.

Okay, I'll update v4 to add and remove domains in these hooks.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
