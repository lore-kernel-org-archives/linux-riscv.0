Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70558C27C5E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SK+lggY1mZPcVOdIu6PO6DpDLmgLxycin6cqWC170jE=; b=jyKnw2E+qNETw3
	nZ/pCrMTSxYfDnw4ejo52ZVReEi/EhTfdSBXs+2Q/HNG4BYxOoGyZjTeP+kL3xxuzmGSUCiCS7zv5
	/7U1N8mifCokOCVOfQGe+36avt46GGJ5zkG9MlGrlson1uSkI1+Kww3fVdzQXZyhSJyxO3dUwt0IJ
	STOOKzuiHM2YQ37eiCSx6/2M1d5Q5mJBTzSFq0Dn7tnvebSiSNpNI+wNsOp+nDwQ+FybpwgOEY61C
	s8Jfj9q54qVxz5fgHMmjSCe67vDXwaKPCjC8ZY+MkP8L21wzoqr6Lg/SlkiCnXB6jJxdIbKOlHOvp
	UL1qlQJMr9UNOnof3wWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGyRG-00000008NyV-2oXl;
	Tue, 11 Jun 2024 10:09:14 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGyRC-00000008Nux-1oAl;
	Tue, 11 Jun 2024 10:09:12 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ebdfe261f9so35006221fa.1;
        Tue, 11 Jun 2024 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718100546; x=1718705346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAheL3Pbpy7JA5UqcNyCOEP7IV/L7OYe1Dlbh7jegN0=;
        b=Ka/oYYh1shzwGAOGDCoTt8CmQWly7sG0e4I5Tf7vRW+DIFekzvxIENs6PGFZqK9p1j
         R077XtiarL0si7V+WQfFRQa7iVmwJnehshjdhFQrYGF2Eb0J3uGl5s9WVQf8yBLcgPGL
         qtfa+TT1Qy4urKQbNFIla9bkC/1HPsCjWULYh3y61ixymVO/nDNkD842KxdUcW9lT5zK
         y9c3DyWJJqAInQyTdU6kdfz4+3fKpYtw2LbfUzFWILrjVQoy3ZEjPZMl7/kpFQKm5iLF
         a63W8cFOaaMpK8LFyLxMCFlV459ligKBCHBWomX2aJNd/stAOahdsPDzPn1nyyywFWxx
         kqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718100546; x=1718705346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAheL3Pbpy7JA5UqcNyCOEP7IV/L7OYe1Dlbh7jegN0=;
        b=YkBspnpBeoPU1AeYzJhJZhBrPsxooAWTLw7m65FZn0NgcJuL02mX7vcn6J0ehxtxDp
         8PAQAHZlrB9FpffM9q0/qtAXNKvtWg5nNMDXFGRUj3pF5qMpYfi+tHIjawM3wHYuidtd
         ZiNtxqBGiegBBvPd5E5XMoLY/LIKcMSKW/RQqK0D3lZMxkIPfblqJcpadcNvS0lZQbrf
         MLzWhXNKYEJZSE4Lj3fL68+OHuhis4jzo8ul5ICG4shhakD3Hg27jmvAyruYE2oJ6GwP
         8KlhdEc+hWZOrcPPG1mNJLCUsbX4MOZGCj3at3HY/oYhoevYGnSuSW7GJ9cmR0C/3MLK
         rzpg==
X-Forwarded-Encrypted: i=1; AJvYcCXJfZu2rV1yj+k3PjI4sO9tOQfONoCUe9S/BvDYT8G5Cv9OD6Djsw7yCbzqUQZTH02wgqSFq+9ZHl9RGCLmTnxNBkhMj1Cou8MHfhOUFaj3Bg+FXC46eAd2G8tp3QPeEm8wuuPjJ2X1rLxSpe8uzJuJLaXSZjo=
X-Gm-Message-State: AOJu0YwHCgG+pa04E0iFmjltVt2dOMpzo+vQTuqMzYNjNLdTHTypmchX
	02XwiBww/gmNsYkkOjwUakQvg4O0pl2JvY/Dq4KQMxUC5o6iCT33
X-Google-Smtp-Source: AGHT+IH0PjLhxIMcOmVEi1E/G0UDxaUaRfwrRjmV1duTjWtdEeQo18W5dDAK7YmkOyj35USGDzY0NA==
X-Received: by 2002:a2e:9b57:0:b0:2eb:d963:d8cc with SMTP id 38308e7fff4ca-2ebd963dbffmr57469111fa.49.1718100545408;
        Tue, 11 Jun 2024 03:09:05 -0700 (PDT)
Received: from pc636 (host-90-233-193-23.mobileonline.telia.com. [90.233.193.23])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead4131387sm21465021fa.51.2024.06.11.03.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 03:09:05 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 11 Jun 2024 12:09:01 +0200
To: Shubhang Kaushik OS <Shubhang@os.amperecomputing.com>
Cc: "ampere-linux-kernel@lists.amperecomputing.com" <ampere-linux-kernel@lists.amperecomputing.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"cl@linux.com" <cl@linux.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"urezki@gmail.com" <urezki@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>
Subject: Re: [PATCH v4] vmalloc: Modify the alloc_vmap_area() error message
 for better diagnostics
Message-ID: <ZmgiPTHGy-kHNe5x@pc636>
References: <MN2PR01MB59025CC02D1D29516527A693F5C62@MN2PR01MB5902.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR01MB59025CC02D1D29516527A693F5C62@MN2PR01MB5902.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_030910_504913_25A9571A 
X-CRM114-Status: GOOD (  25.85  )
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

On Mon, Jun 10, 2024 at 05:22:58PM +0000, Shubhang Kaushik OS wrote:
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
> 
> Reviewed-by: Christoph Lameter (Ampere) <cl@linux.com>
> Signed-off-by: Shubhang Kaushik <shubhang@os.amperecomputing.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 ++++++---
>  mm/vmalloc.c                                    | 4 ++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b600df82669d..9b8f8ab90284 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7245,9 +7245,12 @@
>  
>  	vmalloc=nn[KMG]	[KNL,BOOT,EARLY] Forces the vmalloc area to have an
>  			exact size of <nn>. This can be used to increase
> -			the minimum size (128MB on x86). It can also be
> -			used to decrease the size and leave more room
> -			for directly mapped kernel RAM.
> +			the minimum size (128MB on x86, arm32 platforms).
> +			It can also be used to decrease the size and leave more room
> +			for directly mapped kernel RAM. Note that this parameter does
> +			not exist on many other platforms (including arm64, alpha,
> +			loongarch, arc, csky, hexagon, microblaze, mips, nios2, openrisc,
> +			parisc, m64k, powerpc, riscv, sh, um, xtensa, s390, sparc).
>  
>  	vmcp_cma=nn[MG]	[KNL,S390,EARLY]
>  			Sets the memory size reserved for contiguous memory
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 5d3aa2dc88a8..75ad551e90ba 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2055,8 +2055,8 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>  	}
>  
>  	if (!(gfp_mask & __GFP_NOWARN) && printk_ratelimit())
> -		pr_warn("vmap allocation for size %lu failed: use vmalloc=<size> to increase size\n",
> -			size);
> +		pr_warn("vmalloc_node_range for size %lu failed: Address range restricted to %#lx - %#lx\n",
> +				size, addr, addr+size);
>
One question. I see that you would like to see the range, i.e. its "start"
and "end" addresses for failure case. For such purpose, why do not you use
"vstart" and "vend" variables which specify a range?

An "addr" points here on "vend". Or is this intentional?

Sorry for late looking at this. I was on a vacation last week.

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
