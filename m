Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8EBC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ew6lCm6OxdxR6YLM8GnJvQ1jvNUY3SQboVmPAQ2pSXs=; b=yLFu8I1zRZ8ZxQ
	8HzFst2SJyaKIncwe20aO2IBh9tg4evt1N2Vfz+GiFsjCRyNHkqZSjHLa2Z71m+DihjTnUF4giIqv
	f4zHFIIIito4L5q/fAAw8mUPX6AWG7wj4fku2sZ3QZHnvwP5ptquZ/NDNdr+YWS7eW4Uk370SuwtD
	0FEj9WZddsZ8hyk49xfPvODEwpzpqheokm4Rds/uWBlHoh1reoaq5/lx9rUEn+NYEp2NiaDP5h+Uz
	oUTKd24yBdqpKnr8JYHK/Redsv/FJ+UOpvdANmu1CWYp5kcSyPBDhKrnkqowjwsr8ME0dw+w9tAbo
	6FQDcthse+l3d2OHqP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhxI-0000000177l-2c6F;
	Thu, 09 Jul 2026 06:09:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhxH-0000000177f-25Pv
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 06:09:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 435886001A;
	Thu,  9 Jul 2026 06:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A291F000E9;
	Thu,  9 Jul 2026 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783577390;
	bh=lCHi1e9QI0Ga1lXJQGpOqbkAO2YTzghw/JqNHU2bxQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hPMJlGNTj+M+nkvcEklgtjY+0tH7KNKRKyhxkrUxCNh+nZhVWgpYpqYGRA8jdMz1k
	 1lEm24UmjaPDd0Q8RlKm99Iaq4moo+WzwVWRzD1l0szmauO2L5gK6Bc1qoQjM60iT/
	 YBoRoO18L7OuY6MPebeMGA0gm3ZNeMCDCx31fphua3EPMd6hTXEfaw84DcaExg1a8u
	 d9i0Zt9be035GedCoMgwLrceOfk+vWkzPgrrehvxSd11l2gcTzC+fCAaNc5e/w1KmP
	 t6BBtzAeaAmY2vX8X4L4v0Hj84tyXSFMyaJIAIpXRgwV3zVcmi74tiElzs/8OUCGuO
	 24ubekO9dvrUA==
Date: Wed, 8 Jul 2026 23:09:47 -0700
From: Drew Fustini <fustini@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <ak87K0bIqIPZbMoY@x1>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
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

Hi Reinette,

(replying in v4 as you suggested)

On Tue, Jul 07, 2026 at 11:18:00AM -0700, Reinette Chatre wrote:
> On 6/28/26 2:18 PM, Drew Fustini wrote:
> > +   cache_id = -1;
> > +   cpus_read_lock();
> > +   for_each_online_cpu(cpu) {
> > +           struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
> > +
> > +           if (ci && ci->fw_token == cache_np) {
> > +                   cache_id = ci->id; 
> > +                   cpumask_copy(cpu_mask, &ci->shared_cpu_map);
>
> The way I understand cacheinfo::shared_cpu_map is that it only contains the
> online CPUs that share the cache with this CPU and if the CPU is offline
> then shared_cpu_map only contains the CPU self.
>
> It is thus not clear to me that this handles all the possible CPU online vs
> offline scenarios. For example, if all or some CPUs of a domain are offline
> during cbqri_capacity_probe() and then come online later. It is not clear
> to me whether cbqri_controller_info::cache_id, 
> cbqri_controller::cache_controller::cache_id, or
> cbqri_controller::cache_controller::cpu_mask are needed. Could the cache ID
> associated with a CPU at the time it comes online to dynamically associate
> it with the resctrl domain that is indexed by the cache ID? This may
> simplify a couple of flows.

Thank you for the suggestion, it does simplify things. I will drop the
probe-time cpu_mask and associate CPUs with domains the way you suggest,
from the CPU's own cache id at hotplug time.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
