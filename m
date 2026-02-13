Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A6BEEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AksJvNXRsjal229X7tb3SERCdgzEEylRIkiW+uT2FoA=; b=zp3Uhwm2BeJAaG
	QvjnHnKQc1flZcoiAILDWYc+cEW2tg2cBOE6KQc6fU+uMEad+uDZp9+OGleV9E00bTSyZWTvQxN5E
	FCoPBqj3WuHVHDLd08oWGUZYXEyRL6UYWkT/VL4LJ6bBcE2hMSnFEQCztqyRKSYFkZgp7tz19SYl/
	6H48M5NJl7BJkfMhyia7gD2ofW/58FgJQWGtbhuRtcuH0o3W4IhtqEvJhEPtjxzj4/hzbyGHC4xgf
	erFhA1ESoaaKBmL3YdmTfd7qE1rI6gK6olwMnond0Lo0bxJ7iZjo0D6xZvmPrv7g6HQLVo9jHkpwv
	ke9akmTmUG0oQ13Ucy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhLl-00000002nmJ-230C;
	Fri, 13 Feb 2026 00:48:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhLi-00000002nly-0SZX
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 656FC40B9E;
	Fri, 13 Feb 2026 00:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FA8C4CEF7;
	Fri, 13 Feb 2026 00:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770943677;
	bh=zfSiBcLazIynr5sXbeIkNtmCGB4aLsxJUl0aqwBD0pI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ADXZcTj4Z0q4tdVCbc69RcZZhltrgBHUD8NsDbPylatsXoPQcnwwDlfN7LkuptTu1
	 pdwdZ7bf5xdEAT12ToWZTfMWSYlcuvvfRJ/QFgVF/Wn8j3RJqJ+n3PTKgcQDdGOFN7
	 Zy3Trt73LMLtPB1rv+lQGsPwe6L9t+7vWwA/YoeiMpIgX7PKclyVJQZ9rCpxhEDR9e
	 Z1XAbDGWb7SL00qascOxKf4OaxggXD7JKKpxRrEdpAO8+vn7ab3VeaDzbEblqBiaaq
	 gmdnUyUm/cQSSMFH/BuGCisSCXotRmMF0M7uWB3S8NYb5eG0ewCUVzLaTFTNhhDNjL
	 7tvpFL4QiGrgw==
Date: Thu, 12 Feb 2026 17:47:56 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: kdump: return early for invalid 'crashkernel=0'
 input
In-Reply-To: <aYVvieviDNvoTRNq@adminpc-PowerEdge-R7525>
Message-ID: <dc0bc3b6-c470-01d8-0785-bb5a88e13182@kernel.org>
References: <aYVvieviDNvoTRNq@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_164758_189916_A61C3A88 
X-CRM114-Status: GOOD (  16.01  )
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

On Fri, 6 Feb 2026, Austin Kim wrote:

> From: Austin Kim <austin.kim@lge.com>
> 
> An invalid 'crashkernel=0' can be specified when running kdump.
> By adding a check for 'crashkernel=0', it can return early when detecting
> this invalid input.
> 
> Signed-off-by: Austin Kim <austin.kim@lge.com>
> ---
>  arch/riscv/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 811e03786..e61fec445 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1409,7 +1409,8 @@ static void __init arch_reserve_crashkernel(void)
>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>  				&crash_size, &crash_base,
>  				&low_size, NULL, &high);
> -	if (ret)
> +	/* invalid value specified or 'crashkernel=0' */
> +	if (ret || !crash_size)
>  		return;
>  
>  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);

Should this fix the common code in kernel/crash_reserve.c to return an 
error code when crashkernel=0 so it benefits other architectures?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
