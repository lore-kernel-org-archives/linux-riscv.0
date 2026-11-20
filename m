Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822160A2625
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 00:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qyB0pH7f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zo6RDrTH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o8YNNztpdD6e3hxgiTwdflvlvNg6wiIBurZLxIdWmpU=; b=qyB0pH7fJjgnTdyA7bLs+dPiAu
	VgsCv3c45PnbrZ6zTzU8CpMThl1c6RHyfFq3zeJs6EJV7DY9HqZEdtwaT569D2W+M57ThwhdgYXRL
	L32oDU01KOGLEXUwUBYECqxF9NHsEee2PKU1D8XN/xUzAZuaTU0mkaQK6R4q4NbRHyFvz5c42yws9
	Km2F4cTZNwDbtdNci648mob2uFZcy8bI5YBZfSqY9safTjm+a1AJKJC9ksaLAJ2XArIl8MZakyXXd
	zO5rPICInRRk8Z71Bs3hJq2P3y3zLnoBDj2/HXjYZM8KpPF+Wkc94nCSHvjIDBe8Ld9tJaaJ0NyX/
	pr5JWQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC8Z-0000000DiW8-2oh6;
	Fri, 20 Nov 2026 00:05:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC8Y-0000000DiVc-2dC6
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 00:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17B544352A;
	Fri, 20 Nov 2026 00:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725A61F000C6;
	Fri, 20 Nov 2026 00:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133154;
	bh=aPMvV6uAMyUnxRWvODLxRgeAeThvvI3YGxLfT12eNJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zo6RDrTHjY6al3VoeDmjDNSMCEZL/DL0AE39Hi6ZO2FvCCzWFtyPdYkGQLH4oAh/m
	 BbVgYDQvNI8/q9/WJ7pU/wq6pyZAQ9Ds8IfqMifGTUeAmoNt4im7fEIVPHsF2ZwouF
	 DzIwYlkdTOuo48OOr/mNwBKzFc653k7d+qknd9W+G5PIm7K+/03IY8rV30/R23vvhL
	 7ZWpBIaQhlCs7UNmMYw4QhvSENWMVYqiXivFhLUxIJ7VE2DzxdqbJBnonf8ATdJjVj
	 ov0rXmWw6HlhvN/iyvkW70GrjAxAT3bY+heZ9xKz6Y/Sq1xaRjqN/nlcY0YPtTgKgV
	 fQ6cN4FzhkYBQ==
Date: Thu, 19 Nov 2026 16:05:52 -0800
From: Drew Fustini <fustini@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Zeng Heng <zengheng@picoheart.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Samuel Holland <samuel.holland@sifive.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, Dave Martin <Dave.Martin@arm.com>,
	Babu Moger <babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Peter Newman <peternewman@google.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv_cbqri: Bind to RQSC platform devices
Message-ID: <av-O4EoModkN73WK@thelio>
References: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
 <20261117-acpi-rqsc-v1-3-381ce645751e@kernel.org>
 <20261118234904.0f6a0f17@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118234904.0f6a0f17@jic23-hlaptop>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:49:04PM +0000, Jonathan Cameron wrote:
> On Tue, 17 Nov 2026 14:11:29 -0800
> "Drew Fustini (Tenstorrent)" <fustini@kernel.org> wrote:
> 
> > Let the capacity controller driver probe the "cbqri-capacity" platform
> > devices created from the RQSC table. The cache is named by its PPTT
> > Cache ID and the PPTT gives its level. Select ACPI_RQSC so the table is
> > parsed and drop the OF dependency.
> > 
> > No change for device tree systems.
> > 
> > Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
> 
> Has the DT support landed? If not feels like a few tweaks in that
> would make this less noisy.
>
> If not, see below for one tidy up I'd make here if you can't push
> it back to that series.

Sure, I will roll the changes around cbqri_capacity_of_cache() into a
v13 and leave that out of this patch.

> You almost never want to do manual device_node puts these days!
> 
> It's one of the nicest places to use the cleanup.h magic.

Good idea, I will use it for device_node.

> >  	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
> Whilst you are here.
> 	struct device_node *cache_np __free(device_node) =
> 		of_parse_phandle();
> and drop all the gotos. I haven't checked but if there is
> a path where you want to hang on to it, no_free_ptr() that.

Will do. There should not be a need for no_free_ptr() for this one.

Thanks,
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
