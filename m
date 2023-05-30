Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2867EC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APJFdUm83vD8xe4DUCpO7oRP1dzzKx/UDHqu+i2ERgA=; b=uj1k3Nu8KZ5fF1
	BHq1pj4RJgupe4t2QKl+UsukfnY5q9nfVCcVYCYv+FvCtBSyhzHM3K5Z7oQGglTq85c9o2ebiLm9O
	hGh7H/4M2pDmNK5vZpeJAOS6Lz4pU3MFc6Nsb94DKQejk14N5zqmN5iAEMTptL345lW5Ief1RCfdu
	BXDgWT5vhwlh5zxDNF1NvtTju1e7HSgK0CAfOwXomO+HyJV9Ur/qFXAa2M8L4DeS303wGU/ottPST
	dbXulW7ahSM2eupMmFIDoJbsCFnV9sI1lWbDyYfa/MWvWrhFo6BVUlk5/eXPTdTd8phhubKr73ohy
	mcW9eUMSzi3x7ckRHB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3w8s-00DHZB-0g;
	Tue, 30 May 2023 09:59:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3w8p-00DHYG-0z
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 09:59:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58C1A62CE1;
	Tue, 30 May 2023 09:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3FCC433EF;
	Tue, 30 May 2023 09:59:44 +0000 (UTC)
Date: Tue, 30 May 2023 10:59:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] riscv: allow kmalloc() caches aligned to the
 smallest value
Message-ID: <ZHXJDevEVwUEoOq4@arm.com>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-6-jszhang@kernel.org>
 <20230529-fidelity-booted-0d4055d1f559@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529-fidelity-booted-0d4055d1f559@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_025947_403658_53CB05D1 
X-CRM114-Status: GOOD (  13.92  )
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

On Mon, May 29, 2023 at 12:17:46PM +0100, Conor Dooley wrote:
> On Sat, May 27, 2023 at 12:59:57AM +0800, Jisheng Zhang wrote:
> > After this patch, a simple test of booting to a small buildroot rootfs
> > on qemu shows:
> > 
> > kmalloc-96           5041    5041     96  ...
> > kmalloc-64           9606    9606     64  ...
> > kmalloc-32           5128    5128     32  ...
> > kmalloc-16           7682    7682     16  ...
> > kmalloc-8           10246   10246      8  ...
> > 
> > So we save about 1268KB memory. The saving will be much larger in normal
> > OS env on real HW platforms.
> > 
> > [1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Fails to build chief, with loads of:
> linux/dma-mapping.h:546:19: error: redefinition of 'dma_get_cache_alignment'
> 
> And for 32-bit there's also a rake of:
> include/linux/slab.h:239:9: warning: 'ARCH_KMALLOC_MINALIGN' macro redefined [-Wmacro-redefined]
> 
> At the very least, reproducable with rv32_defconfig.

Have you this it on top of the KMALLOC_MINALIGN preparation series?

https://lore.kernel.org/r/20230524171904.3967031-1-catalin.marinas@arm.com/

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
