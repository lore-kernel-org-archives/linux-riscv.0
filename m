Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98215C4452D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AX0caTKikwcwaFNlNCJqvHRS1azX/GA9wlIxnUAqXAA=; b=Z9DFZuy6E8KuoR
	kv4yrilmti/WNSRVoB2jHuRqgIfEU+mvaVkbHvbZxttBvKK0vnU7Lr7ZcWbNkIFW7fDwKbRNrZaSV
	r5TzEJG6kKG90IFhMpLdEB1y0k5qJSM4KJNWGY31k2/+2tgjTkZrGFns+S/bQNKqVWnJbayetdXvh
	jSPcgdr+pjFrXjTzj5iC0290YNnNH3t+SnicuVv0Cnu0JCEz3iA+ITn5c+gvfl77Bqpo1IosUkGAY
	zur6jw1LsxXre6hZGjpkHQMi7dYyP4Ri88prtrJiEFi+H3PJDhGKHh7c2MWegOEDQtrQdabGT4jiy
	bY/rf1kYxkpZNq3UwziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJSU-0000000AXb0-2E2k;
	Tue, 21 Jul 2026 23:01:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJST-0000000AXau-0E2j
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 23:01:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47FD9600D8;
	Tue, 21 Jul 2026 23:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EEE1F00A3A;
	Tue, 21 Jul 2026 23:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784674864;
	bh=MGbzU3rXW1IbCyqsDLNTfiEd5EcdqQM79u5u7bcXVps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=bC3iLC6mA7hkMPadwh0cG/Po+ri1uUxF3ZMgLDxUn83L4BBO0bgPjmptJzngzCjgU
	 +TnJx5pYGK42zz9tCx1a+uLZjpe8JIAxfm1PSnCvbDjUhgTc2gjnFoNbBN7uLkrpwL
	 JO8xiMttfQT0mF4dh1MbfTYHENfm1rzxr4gzURqNdW4YCPt54MlViaV8CGz+NNYWIn
	 lgsaly7k9b3ViQ+XpObbUAx/txLbskWAvsay7kXAKTUOgx7HuFhJlIIvreVoKQJg2i
	 9CfB5bWOchRSCDuolDw4s11Ay6VPjh4wR7+wG24My/KWLQwZWr1pIUroBtbDATUDUA
	 wW0m/BE9m7bTg==
Date: Tue, 21 Jul 2026 17:00:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Eder Zulian <ezulian@redhat.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Move dma_contiguous_reserve() after NUMA
 initialization
In-Reply-To: <20260714185648.1082483-1-ezulian@redhat.com>
Message-ID: <b446e77d-7e69-31c2-f438-555a61934198@kernel.org>
References: <20260714185648.1082483-1-ezulian@redhat.com>
MIME-Version: 1.0
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

Hi,

On Tue, 14 Jul 2026, Eder Zulian wrote:

> Move the dma_contiguous_reserve() call from setup_bootmem() to
> misc_mem_init(), placing it after arch_numa_init(). This ensures that
> NUMA topology is initialized when reserving contiguous memory for DMA.
> 
> Tested with CMA_SIZE_PERNUMA enabled and two NUMA nodes on QEMU:
> 
> qemu-system-riscv64 \
> 	-machine virt \
> 	-nographic \
> 	-smp 2 -m 512M \
> 	-numa node,nodeid=0,cpus=0,memdev=m0 \
> 	-numa node,nodeid=1,cpus=1,memdev=m1 \
> 	-object memory-backend-ram,id=m0,size=256M \
> 	-object memory-backend-ram,id=m1,size=256M \
> 	-kernel arch/riscv/boot/Image \
> 	-append "console=ttyS0 earlycon loglevel=7 cma=16M"
> 
> Unpatched kernel's log (one global CMA pool and no per-nodepools, 16 MiB
> cma-reserved):
> 
> 	[    0.000000] cma: Reserved 16 MiB at 0x000000009ee00000
> 	...
> 	[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000008fffffff]
> 	[    0.000000] Initmem setup node 1 [mem 0x0000000090000000-0x000000009fffffff]
> 	...
> 	[    0.056397] smp: Brought up 2 nodes, 2 CPUs
> 	[    0.066135] Memory: 449288K/524288K available (12279K kernel code, 5980K rwdata, 6144K rodata, 2467K init, 482K bss, 54504K reserved, 16384K cma-reserved)
> 
> Patched kernel's log (three CMA pools are created, 48 MiB total),
> 
> 	[    0.000000] cma: Reserved 16 MiB at 0x000000009ee00000
> 	[    0.000000] cma: Reserved 16 MiB at 0x000000008ee00000
> 	[    0.000000] cma: Reserved 16 MiB at 0x000000009de00000
> 	...
> 	[    0.054251] smp: Brought up 2 nodes, 2 CPUs
> 	[    0.064082] Memory: 416520K/524288K available (12279K kernel code, 5980K rwdata, 6144K rodata, 2467K init, 482K bss, 54504K reserved, 49152K cma-reserved)
> 
> Signed-off-by: Eder Zulian <ezulian@redhat.com>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
