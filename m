Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41E3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 23:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InU8afZ9TZsaxjRlbFoetp4X9W7+7Q5rMYkXT+sfZ5g=; b=qxRn0n3jixR3JJ
	oiUnm5c/hkAQiBGYvm3qbOPGvoZWpG0U81HPxAlw2J4MPI02ch9ADsIQSIoNHPJ22RKaMkJq0x3tj
	yQbbVJAjDV3tfwt+S5oMLigHnnKkIG19Vv0uTYvCI4Lw51snBvlaPl7n0p/4basuZEjxKoeSUcCIe
	gEe+0CkKF8Km5RP0+Yq1QuIsjKnx+nmvE5PXl1ozuFwKVuxq+daU3MEMsv2/VDmLz+UR8VKXVXXOc
	Eh6GqF3fTGL39JOhHiRYv32zrdZh6uaF4/1WTBF/FVBQP3yV0yBFK6UWO2QxJL0uzentjsT6wPqDp
	ZkeBGLoUdjO5jRwHC+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq1iG-0064rb-Nq; Wed, 24 Nov 2021 23:30:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq1iD-0064qn-Uu
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 23:30:03 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mq1i9-0000et-HE; Thu, 25 Nov 2021 00:29:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 panqinglin2020@iscas.ac.cn
Subject: Re: [RESEND PATCH v1 0/2] Add Sv57 page table support
Date: Thu, 25 Nov 2021 00:29:56 +0100
Message-ID: <4180445.sKpA694EL3@diego>
In-Reply-To: <20211124112021.788242-1-panqinglin2020@iscas.ac.cn>
References: <20211124112021.788242-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_153002_033699_4195B279 
X-CRM114-Status: GOOD (  14.42  )
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

Am Mittwoch, 24. November 2021, 12:20:19 CET schrieb panqinglin2020@iscas.ac.cn:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> This patchset is based on Alex's Sv48 patchset v2.
> 
> This implements Sv57 support at runtime. The kernel will try to boot with
> 5-level page table firstly when the mmu-type field in dtb is "mmu,sv57" or null,
> and will fallback to 4-level if the HW does not support it.
> 
> Tested on:
>   - qemu rv64 sv39
>   - qemu rv64 sv48
>   - qemu rv64 sv57
>   - Sifive unmatched


On a beagleV (which supports only sv39) I've tested both the limit via
the mmu-type in the devicetree and also that the fallback works when
I disable the mmu-type in the dt, so

Tested-by: Heiko Stuebner <heiko@sntech.de>



> Qinglin Pan (2):
>   riscv,mm: Add Sv57 support based on Sv48 implementation
>   Documentation, mm: Add Sv57 vm layout documentation
> 
>  Documentation/riscv/vm-layout.rst   |  36 ++++++
>  arch/riscv/Kconfig                  |   4 +-
>  arch/riscv/include/asm/csr.h        |   1 +
>  arch/riscv/include/asm/fixmap.h     |   1 +
>  arch/riscv/include/asm/page.h       |   1 +
>  arch/riscv/include/asm/pgalloc.h    |  49 ++++++++
>  arch/riscv/include/asm/pgtable-64.h | 103 ++++++++++++++++-
>  arch/riscv/include/asm/pgtable.h    |   4 +-
>  arch/riscv/kernel/cpu.c             |   4 +-
>  arch/riscv/mm/init.c                | 169 +++++++++++++++++++++++++---
>  10 files changed, 348 insertions(+), 24 deletions(-)
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
