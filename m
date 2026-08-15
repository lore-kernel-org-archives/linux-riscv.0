Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC807C5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 01:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNzc9x3MzeSrYgJvnJ/Q7gaChrgrcLPwkMZf6jUwLIM=; b=T7UYkzV81cS8AF
	+h7FMNvAfgcdUm8/g8aBKjHofIlj9B/BCKAvqv92AIaQZLIOpPDMqTAbFKBSmbxxs7gele6O3/+uC
	BniIvlqOOIVkoT24CTjcEyj0bahi0odM9pdaaG44F/buuT+f9MiggtmincInPR0yfauqoA6jgaP2Z
	bRLgCQYXL2ngB3iYfBUu0ObKvJOtmPeX3bQ0vqa0YWSkaBhF8gdpu+kvxpxEKi0xAO+I7V9dTWt0C
	BJIFcY13MdTIMlORHq8zd76pk05clETl2BPU0QUi99lfjhEAtEmq1PiitZBsWgpJlWWOrT7wxsAoL
	YVGNe0lDpLXxyHxWGkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv2qj-00000003M6O-1Jrg;
	Sat, 15 Aug 2026 01:06:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv2qh-00000003M6G-3N1c
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 01:06:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3529843855;
	Sat, 15 Aug 2026 01:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65311F000E9;
	Sat, 15 Aug 2026 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786755971;
	bh=s3SBIDYZYqVz8IpQT0BUtfXzl58Q73xKJzr9I/vhl/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZihN1M63NuX81H09rkVxzzxN5JJr86Vm5tp/gmeINFEg9xVRXYw8RbltJrAeaj4vx
	 32+3ID+3bUnvzlJXx640+0k9bmStX4GJkfgFzo3vTqjBzCFveaOW3/GZCJ70JNExaZ
	 ZaYouRwnHh9BH7tNwgfdZ9AmtYdxIyB3mYxwMLiAzDG/bfSRb5ffhS5dCoLhgnVb5P
	 YVgr74Dsbz0MGfXNs5fvYPL8AQMJ+X4qzNl1GJHR2TVkF52GE6AqghGLnXzltIhAQ2
	 NnwjIi01n3nm3c77tNfCMVnCYQ8sJoufSbyj+Gv760cuTkUeQ1WRwTWjfFb46C+ApV
	 befRvykwnsP2g==
Date: Sat, 15 Aug 2026 02:05:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Paul
 Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cache: sifive_ccache: remove debugfs on driver
 register failure
Message-ID: <20260815020558.2b4adbd9@jic23-huawei>
In-Reply-To: <20260814081334.25771-1-pengpeng@iscas.ac.cn>
References: <20260814081334.25771-1-pengpeng@iscas.ac.cn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Fri, 14 Aug 2026 16:13:34 +0800
Pengpeng Hou <pengpeng@iscas.ac.cn> wrote:

> sifive_ccache_init() creates its debugfs entries before registering the
> platform driver. If platform_driver_register() fails, the current error
> path unmaps ccache_base but leaves the debugfs file and its write
> callback reachable.
> 
> Remove the debugfs directory on that failure path before unmapping the
> controller registers.
> 
> Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
> 

No blank lines in tag blocks.  That breaks a bunch of tooling that 
runs on the kernel + tends to get you a message from one 
of the bots that is there to prevent this getting merged.

> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v2: https://lore.kernel.org/all/20260623015527.32846-1-pengpeng@iscas.ac.cn/
> - no source-code changes
> - rebase on current RISC-V sources
> - add the coding-assistant disclosure
> 
> The error path was reviewed statically. It was not exercised on SiFive
> hardware.
> 
>  drivers/cache/sifive_ccache.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d5..3b7a78fc7feb 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -338,12 +338,16 @@ static int __init sifive_ccache_init(void)
>  
>  	rc = platform_driver_register(&sifive_ccache_driver);
>  	if (rc)
> -		goto err_unmap;
> +		goto err_remove_debugfs;
>  
>  	of_node_put(np);
>  
>  	return 0;
>  
> +err_remove_debugfs:
> +#ifdef CONFIG_DEBUG_FS

It is stubbed out in debugfs.h so no need for guards here.

So for that matter are the creation functions used in here.
Ideally follow this patch with one removing ifdef CONFIG_DEBUG_FS
from the driver.  Both calls will return errors but that is
fine as they aren't checked anyway (common for debugfs
as a driver is almost never expected to fail probe just because
debugfs isn't there).  Note removing those guards should (feel
free to check) result in no overhead as they dead code should get
removed.

Jonathan



> +	debugfs_remove_recursive(sifive_test);
> +#endif
>  err_unmap:
>  	iounmap(ccache_base);
>  err_node_put:


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
