Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF194C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 23:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lziys+EQ8Pb09kGZvQiaixsnPcM9vag7ca/tD+ieFIE=; b=1Me1xbeL9pVkhO
	QesSWV9lfotP0cWowAnV1RKBmynh49w0H5d7CXaX29pHiGxqOu1oU4Kb2adS8LyZekMNZTItBQ6a7
	/7bAesHoyTWTvhVqrAPIHxE+/8tuLcSAEPY0eVbHWRkivyqBXeXVKDruDa4zk3VKqzNfrqFIvZrqf
	w1/MyRC69uTCGiUo7vCtmIYEdWSH0XCJhWfhmXG79V2W5WUBj0/xYAjNqA1wDiV99oJrcdYT2z670
	VfEhkB6XmaCvGmvJltkbGoMlg7LeFtOqF07x248D/c6uCmjw4ViVQ/ZW05dyM27qlFVIZ19ilwZSw
	tDLSa9Y5tjMm0lPGQ/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMxAV-0000000EMMe-0egu;
	Wed, 04 Jun 2025 23:05:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMx7i-0000000EM8r-1H9e
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 23:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84B3BA506C2;
	Wed,  4 Jun 2025 23:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCAEC4CEE4;
	Wed,  4 Jun 2025 23:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749078137;
	bh=7HVnavcozlAGqUoew8jM2OzrVTESgvO41Oq+UN60Jl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DEzKvAfkv9zRmp2q7hwsbAEplUDcrJY8ti9x8ZSb6l1hEvYmslm/gV17/k9EJLXnS
	 7BaVNnfVakmAdcgkANIHALTtyFp1URH6vMiN/4OAPSieJ+QUksgM4cNGFSP6cXRPIC
	 rNvSnMq8MQjhaMyvHlH4QP4apbw0EJXuyc6BJmCM=
Date: Wed, 4 Jun 2025 16:02:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: Optimize gcd() performance on RISC-V
 without Zbb extension
Message-Id: <20250604160216.d93f5b06030342ad5dfea0a8@linux-foundation.org>
In-Reply-To: <20250524155519.1142570-4-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
	<20250524155519.1142570-4-visitorckw@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_160218_413558_773317AE 
X-CRM114-Status: GOOD (  15.90  )
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

On Sat, 24 May 2025 23:55:19 +0800 Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> The binary GCD implementation uses FFS (find first set), which benefits
> from hardware support for the ctz instruction, provided by the Zbb
> extension on RISC-V. Without Zbb, this results in slower
> software-emulated behavior.
> 
> Previously, RISC-V always used the binary GCD, regardless of actual
> hardware support. This patch improves runtime efficiency by disabling
> the efficient_ffs_key static branch when Zbb is either not enabled in
> the kernel (config) or not supported on the executing CPU. This selects
> the odd-even GCD implementation, which is faster in the absence of
> efficient FFS.
> 
> This change ensures the most suitable GCD algorithm is chosen
> dynamically based on actual hardware capabilities.
> 
> ...
>
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -21,6 +21,7 @@
>  #include <linux/efi.h>
>  #include <linux/crash_dump.h>
>  #include <linux/panic_notifier.h>
> +#include <linux/jump_label.h>
>  
>  #include <asm/acpi.h>
>  #include <asm/alternative.h>
> @@ -51,6 +52,8 @@ atomic_t hart_lottery __section(".sdata")
>  ;
>  unsigned long boot_cpu_hartid;
>  
> +DECLARE_STATIC_KEY_TRUE(efficient_ffs_key);

Please let's get this into a header file, visible to the definition
site and to all users.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
