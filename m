Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FE1C27C75
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3orQzYLhbqqE0bUS6KiCaYnGOS1rFr4q7HkvIZz6f50=; b=fekw0M4xaPWvNs
	mCGqc5kSWQ3AyNRsHhy/QVGYzijUcLoaLbHJXXn/tsWtfuoxT5g5CuDJGiTy9602NUopBLwh7yn+L
	vQFE1wLriONo4GreytiD8URTpZT3nXii0DSeHLyUppz2xYEuWp7DJ9xO/IuK/xl1I8dirKWKYY+ff
	n5ftFGPVVE9NR9jg0a9y4RuL1XvG9GOFVa1+dmNvh01ECsZyRFTpdedH1NHBvXpAr/CRQ+3tkIrwv
	A574OB2BL5NJXGsLRAksZDNX0eDRSL+utvFeVV4iMkYuD5CsRhMCNVSWTz/zT7l/vlBfE6Z/SxMHz
	EYlDTIgVd2V5xHMzhDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7cO-0000000A6Jf-0FK2;
	Tue, 11 Jun 2024 19:57:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7cJ-0000000A6IX-0G9p;
	Tue, 11 Jun 2024 19:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5147A611BB;
	Tue, 11 Jun 2024 19:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94FFC2BD10;
	Tue, 11 Jun 2024 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718135834;
	bh=6M1ebK5ksd8fFr0463WqM9S7WBIPDoIGj+N3XpTNpPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JXP0r93TC6EddhtLwiYV0ZjXHBBlEdNNIljuy8rPFZz9i8xvRmt12ONtRAzQCSzwt
	 3QZdLA4TSq94RabfXvxKod5pcgr5XD4hgZFDGIRsEWmQbkgIJuYCOyP44PqHjE/an0
	 pAiTbYjRMIfWLZcfyz6UK4G/Z28FKjxWfKWHmoCU=
Date: Tue, 11 Jun 2024 12:57:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shubhang Kaushik OS <Shubhang@os.amperecomputing.com>
Cc: "ampere-linux-kernel@lists.amperecomputing.com"
 <ampere-linux-kernel@lists.amperecomputing.com>, Uladzislau Rezki
 <urezki@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "cl@linux.com" <cl@linux.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "guoren@kernel.org" <guoren@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH v5] vmalloc: Modify the alloc_vmap_area() error message
 for better diagnostics
Message-Id: <20240611125713.eeef88483f5a782e3df71b21@linux-foundation.org>
In-Reply-To: <CH2PR01MB5894B0182EA0B28DF2EFB916F5C72@CH2PR01MB5894.prod.exchangelabs.com>
References: <CH2PR01MB5894B0182EA0B28DF2EFB916F5C72@CH2PR01MB5894.prod.exchangelabs.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_125715_557094_5326E7EF 
X-CRM114-Status: GOOD (  14.82  )
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

On Tue, 11 Jun 2024 19:38:44 +0000 Shubhang Kaushik OS <Shubhang@os.amperecomputing.com> wrote:

> 'vmap allocation for size %lu failed: use vmalloc=<size> to increase size'
> The above warning is seen in the kernel functionality for allocation of the restricted virtual memory range till exhaustion.
> 
> This message is misleading because 'vmalloc=' is supported on arm32, x86 platforms and is not a valid kernel parameter on a number of other platforms (in particular its not supported on arm64, alpha, loongarch, arc, csky, hexagon, microblaze, mips, nios2, openrisc, parisc, m64k, powerpc, riscv, sh, um, xtensa, s390, sparc). With the update, the output gets modified to include the function parameters along with the start and end of the virtual memory range allowed.
> 
> The warning message after fix on kernel version 6.10.0-rc1+:
> 
> vmalloc_node_range for size 33619968 failed: Address range restricted between 0xffff800082640000 - 0xffff800084650000
> 
> Backtrace with the misleading error message:
> 
> 	vmap allocation for size 33619968 failed: use vmalloc=<size> to increase size
> 	insmod: vmalloc error: size 33554432, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
> 	CPU: 46 PID: 1977 Comm: insmod Tainted: G            E      6.10.0-rc1+ #79
> 	Hardware name: INGRASYS Yushan Server iSystem TEMP-S000141176+10/Yushan Motherboard, BIOS 2.10.20230517 (SCP: xxx) yyyy/mm/dd
> 	Call trace:
> 		dump_backtrace+0xa0/0x128
> 		show_stack+0x20/0x38
> 		dump_stack_lvl+0x78/0x90
> 		dump_stack+0x18/0x28
> 		warn_alloc+0x12c/0x1b8
> 		__vmalloc_node_range_noprof+0x28c/0x7e0
> 		custom_init+0xb4/0xfff8 [test_driver]
> 		do_one_initcall+0x60/0x290
> 		do_init_module+0x68/0x250
> 		load_module+0x236c/0x2428
> 		init_module_from_file+0x8c/0xd8
> 		__arm64_sys_finit_module+0x1b4/0x388
> 		invoke_syscall+0x78/0x108
> 		el0_svc_common.constprop.0+0x48/0xf0
> 		do_el0_svc+0x24/0x38
> 		el0_svc+0x3c/0x130
> 		el0t_64_sync_handler+0x100/0x130
> 		el0t_64_sync+0x190/0x198

When sending an updated version, please describe what was changed since
the previous version.  After the changelog's ^---$ separator is the
usual place.

I'm seeing this:

--- a/mm/vmalloc.c~vmalloc-modify-the-alloc_vmap_area-error-message-for-better-diagnostics-v5
+++ a/mm/vmalloc.c
@@ -2057,7 +2057,7 @@ overflow:
 
 	if (!(gfp_mask & __GFP_NOWARN) && printk_ratelimit())
 		pr_warn("vmalloc_node_range for size %lu failed: Address range restricted to %#lx - %#lx\n",
-				size, addr, addr+size);
+				size, vstart, vend);
 
 	kmem_cache_free(vmap_area_cachep, va);
 	return ERR_PTR(-EBUSY);
_

which I assume has no effect?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
