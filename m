Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0310C982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 21:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DleovBHL/V1NErjdTyH1o8B4CVJM09RT0/dAQDL6C/0=; b=ce+aSGvzXt4Zwg
	3RjXnc4MyuRXAhx+NCEFnk81NWw/HGoWmaghd5hVAmkY85KTWDzfdyWRjbcrfpqmtCJwEje2N3LvI
	tRIaskqMDj3HfXP229mW4+DS83GaUvJCl7xADHOuSj85K9rn8P+PorZPWjp4oIvC3GrS2u500ScU5
	+EfaTCx8oOZnQsYnCfUlb3R8WAmasUIsMpZoe0ITuuU5pQJEEhijy50GPCbc7kLDuKi3/lBKK5E78
	bS2KWAHvvVXvu92mI40K6j77HIKwbfjhvHrJUek/l7kXo1OX6WEJaTetQ3SXy+Gbtck36RFKXpr3R
	rOIcs8ON1yoW0R30QEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K6E-0000000Cc8O-0rZU;
	Thu, 17 Sep 2026 21:56:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K6C-0000000Cc74-3xHO;
	Thu, 17 Sep 2026 21:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 016B060202;
	Thu, 17 Sep 2026 21:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681611F000FF;
	Thu, 17 Sep 2026 21:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789682215;
	bh=kuBtV4+7ALBPAyy2nomafqxqzWcbcsqKb3dSOrzTp7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bE+Lz4BpzH5TSV1jWou2OBtlqHsC//L3WyTj9bXi6va6c8nZfLJ4ol68JuU+o3r2M
	 TAu2icEvroIVO5OuYcPgJYCAhNQXTzOAIclO3FED1OglGnXQvoVgXQi9NkcPaNCm7C
	 NxCHhu8wntvOtj4LO509qvBQvss+eZM34/jEYGD2HXc7uGKovRY4ujMtUk30a4EgKF
	 zPD0eqlpLObbbLfAP2BCbHPLwLZz0rgjBIedFlBVM78LXQPEzVbz5SKMMk3kZSKLLI
	 Ww16aNzudepZDNF3jG6O0DxZCUHUXGJHhXcE+1AZc6MCWnHl/xvccdOs6+sET6/9Sd
	 Dca8d8QUwinxQ==
Date: Thu, 17 Sep 2026 16:56:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: m.szyprowski@samsung.com, hpa@zytor.com, chenhuacai@kernel.org,
	pasha.tatashin@soleen.com, devicetree@vger.kernel.org,
	linux-mm@kvack.org, tglx@kernel.org, robin.murphy@arm.com,
	kernel@xen0n.name, mingo@redhat.com, saravanak@kernel.org,
	loongarch@lists.linux.dev, dave.hansen@linux.intel.com,
	will@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	iommu@lists.linux.dev, mark.rutland@arm.com, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, pjw@kernel.org,
	linux-kernel@vger.kernel.org, baoquan.he@linux.dev,
	aou@eecs.berkeley.edu, kexec@lists.infradead.org,
	pratyush@kernel.org, linux-arm-kernel@lists.infradead.org,
	ruirui.yang@linux.dev, catalin.marinas@arm.com, bp@alien8.de,
	palmer@dabbelt.com, x86@kernel.org
Subject: Re: [PATCH v6 08/10] of: reserved_mem: mark /reserved-memory entries
 with MEMBLOCK_NODUMP
Message-ID: <178968221332.3991643.14928206071521736133.robh@kernel.org>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-9-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-9-chenwandun1@gmail.com>
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


On Wed, 02 Sep 2026 15:31:14 +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
> kdump can omit them from the vmcore.
> 
> The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
> pay the cost of splitting memblock.memory entries at NODUMP boundaries.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> ---
>  drivers/of/fdt.c             |  1 +
>  drivers/of/of_private.h      |  1 +
>  drivers/of/of_reserved_mem.c | 15 +++++++++++++++
>  3 files changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
