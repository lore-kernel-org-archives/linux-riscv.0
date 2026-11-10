Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187C606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sjcik4d8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJS6b8KC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RQL3E3lPnKQGy8iwHE6vRPmdZI11QaGrPB3xyOGFtqs=; b=sjcik4d82zqldw3SpicQAHNle3
	jhu7F706YFW3y4I1HTlJcPw+2E9shJkqYiortZrkMmeaaIqEQnIgULKYjp6D6s1iw3Bq2GFUJ7DI/
	90Y8g1N/QOWFlOSSevCnMlrFp1LBG5MnO/SqepS5czkio76+O99mj95UFlwN5g7f3DPvQsntt9iBB
	fdGWtmKCH9dNt0i2zId8N3n6h+B744vCFdpb+PkhewhdxGgHbZ8p0f145h7OFOENUDNVIX50tW6CR
	jtrnZ+YblyImZc3yMGwk633kNDyYRbY6Vlg63v5tQmkScGfC/fSbhr+Gj8nHd2Z0GfUUDjFp3Tet1
	3+6Zo0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv68-00000005E7b-1MxW;
	Tue, 10 Nov 2026 23:17:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv67-00000005E7E-1Bll
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 23:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47E23635B9;
	Tue, 10 Nov 2026 23:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F361F0093C;
	Tue, 10 Nov 2026 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794352670;
	bh=gbmiIYRmaOIY16FesNo5fSYIqv3eyHrsXkU16JRHHC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WJS6b8KC1LJY2RUo9wiF5fL7kLRtABCnBxnzmLOUAlldosxNl2+W+GTjJBDvaRBvm
	 Fu2jpwZwDfWPJ2Hqn4VF1ipfVWnrZzCXNFfVTAjGpVQco5nVz9fomH48P07U7gOa7Y
	 rBitF4k71S7d2mXqcdSux3x4V1b5ZJdWi4ALo3+PHFAcr6ya/VnZyaxd6lTF/6eJsF
	 qfI6EJ+cBIAy9kjD8xtvz7qV+Zsgv9AZwwuA6BYoRf/yZmlEI1gbohNlcix4uQCcYY
	 1FlJW2JOxAPpUPmbEibgKU0ZWnYf5FOSUaMZ43Jyjnk11EMXIN9uy4Uu56EJ+DVAey
	 To4C8xAa7SnNQ==
Date: Tue, 10 Nov 2026 15:17:48 -0800
From: Drew Fustini <fustini@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
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
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <avOmHFcy/yFOr9YX@x1>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
 <20261108-dfustini-atl-sc-cbqri-dt-v11-2-33a1bf0cf01c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-2-33a1bf0cf01c@kernel.org>
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

On Sun, Nov 08, 2026 at 03:20:51PM -0800, Drew Fustini wrote:
> Wire CBQRI capacity controllers into resctrl as the L2 and L3 cache
> resources.
> 
> resctrl exposes a single capacity mask per resource, so when more than
> one capacity controller backs a cache level they must report the same
> number of capacity blocks. The same holds for the other capabilities
> resctrl exposes once per resource. A level whose controllers disagree
> is left unexposed. Other levels are unaffected.
> 
> The set of controllers backing each level is fixed when resctrl is set
> up at late_initcall. Control domains are created in the cpuhp online
> callback and keyed on the onlining CPU's cache id from cacheinfo, so a
> CPU that is offline at probe time still joins its domain once it comes
> online, provided a controller for its cache is in that set.
> 
> A CPU whose cache has no controller, or whose domain cannot be created,
> still comes online. It is left out of that level and a warning is
> logged, since bringing the CPU up matters more than controlling its
> cache traffic. A domain is published on the ctrl_domains RCU list only
> after it is fully initialized and brought online, and removed from the
> list before it is taken offline, following the documented safe
> traversal rules.
> 
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Hi Reinette, I still need to get more reviews on this series, but I
wanted to check if your expectation is that all the patches in this
series should be merged through arch/riscv?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
