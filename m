Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9A8C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSJJ7SW4PMJxaFI9hdsdUXmNkvzYLK4EQANC3g6zmSo=; b=GIcF+whV2+IocJ
	AO2fkZyRbfmcmP0pgpjQvDPCDdemAqc/b0tJ3bS96PDO3WTIRTU+OJruQ1SdIzCBrtBqQyAHFyZhh
	U3nxoJQvhax1+W+KiJB7nFbi4sgVuWDxKf0QW6Ei9C4OKbuy3fcAHs7PhD3sKJgBuAw7l1dZnMO5z
	dQHVbq55JigSOI+jT8jekxZ39txagDiMVEKhKR7rhRi01XQOgw5wk5/VcZcadn9SKMUnT9WUMp7t3
	iXnKWiUylb/fGk24tun623NSDWmwV21o3UQLrheOp3cY6LnCuKR3c+fcnS6EAUgJVOOoN3HLQO6uD
	QhPPTRl6GzFJwnoF5EKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ep8-0000000Bs1k-04gC;
	Thu, 17 Sep 2026 16:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ep6-0000000Bs1Y-2k3Y
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 16:18:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FEA0417EB;
	Thu, 17 Sep 2026 16:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8198A1F00893;
	Thu, 17 Sep 2026 16:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789661936;
	bh=2jEOc3IUaWpEptPxBD1NNzuR1movYWlBS7awSPB7Q4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cY3nYvCyD9HrXa5qVJ3PLvFVXSuFd78nKJ/jl5Z2ffitnwON9A/CvYfafWoZAWru3
	 e1g9GT/T+mbjkk7BlzUehpjLz7Rnx3tOM/RdfmcDYLuhWYpY5fDgJSG3AFhhnkNgGq
	 tKZChLFM8S1yKkvsAttH2HxkmC/F+jv3/yH4BQk24fxq+Dv0lGv8BFfhBqYyca3w/v
	 jRT7MyHACmC4adgf+zAkBOcC+T1xCx0tWIgNo8E/8dL1P3uGgdXEQELZJgYPim+8iL
	 FpjTA/TKh63AWW2wZmvRThKx708mVD9b5FabGFZwdyzHcBcza8AniDzxfvgfrPN1HL
	 W4+Q1OOS6c/Bw==
Date: Thu, 17 Sep 2026 09:18:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
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
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <aqwS7qgGNkSHxoSz@gen8>
References: <20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org>
 <20260901-dfustini-atl-sc-cbqri-dt-v7-2-ca2935d85622@kernel.org>
 <8230dae2-2cb0-4b46-8cec-dc4e281d4e4a@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8230dae2-2cb0-4b46-8cec-dc4e281d4e4a@intel.com>
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

On Thu, Sep 17, 2026 at 08:37:43AM -0700, Reinette Chatre wrote:
> Hi Drew,

Hi Reinette,

Thanks for looking at this series. 

> On 9/1/26 3:31 PM, Drew Fustini wrote:
> > resctrl exposes a single cap set per rid, so when more than one capacity
> > controller backs a cache level they must agree on those caps. A level
> > whose controllers disagree is left unexposed. Other levels are
> > unaffected.
> If I understand correctly, while attempting to translate to resctrl terms,
> this means that a cache resource with several domains may support different
> capacity masks in the domains?

Yes, each capacity controller reports its own number of capacity blocks,
so two controllers backing the same cache level can have different
maximum capacity masks.

> I believe the "single cap set per rid" you refer to is
> /sys/fs/resctrl/info/L3/cbm_mask and /sys/fs/resctrl/info/L2/cbm_mask that
> exposes a single capacity bitmask representing the maximum allocation.
>
> As you know, resctrl is in the process of changing the way in which schema
> formats are described. The most recent PoC [1] added new bitmap description
> files but it kept a single value "max" file to describe the highest allocation
> possible for a bitmap schema.
> 
> To support asymmetrical cache instances it looks like changing the interface
> to describe the maximum per domain (instead of one global value) could address
> the gap?
> 
> For example, if there is a hypothetical system with two L2 cache instances, one
> with a 0xFF max CBM and the other with a 0XF max CBM then resctrl could expose it
> as:
> 
> 	# cat /sys/fs/resctrl/info/L2/schemata/L2/max
> 	0=ff;1=f
> 
> The schemata file currently and will continue to display the allocations per domain.
> 
> resctrl will need more changes to support different CBM per domain internally and
> until then all these CBMs will be the same, but adding this change to user interface now
> may set resctrl up to support these systems in the future?

I think that would be a good change to the generic schema rfc as a max
per domain would be helpful for CBQRI. The hardware I am working with
right now (Tenstorrent Ascalon) does not have two controllers at one
level, but I think it is reasonable to assume other RISC-V platforms may
do that in the future.

BTW, I have been meaning to send v8 with some unrelated minor
improvements based on sashiko comments in v7. I will go ahead and send
right now in case you are looking at the rest of the series.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
