Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E66C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 00:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9xhEakTtRoVe51NdKP+exaQ/M8v91P7oMHStHyxoMPQ=; b=BJPAMk/Kwbt4giBsf+QXaMaBDt
	3Rn89wC2yZ9NW6Em5pbgsOKWYaDDjzWvzVr5NWS46+CtIxpZNy38s3YrcWoYJ8cbTYNwE5n05kpum
	SVBCWE1BHH8x2WEF7F8FcgoZmIUIyeLcIrrjyg7/p8B+39vTttHr1bUzgFQ60o9Ou27djDIcq3RJE
	d0l65Jv0Oxy5zuAPcBSbIXK//cIcltqKAIwTvdbQU1KwydOkg3VSsOc8Bg4SVssFYB1/q9vOygYs4
	CQsn7RmT+dkAX7nWFEUhv3gq8C8fplIqwVx6OH8oGgzklWQOs2PwFVfOQHH2bLgKHnkVKNwo7kpPr
	sP+rswMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRO0d-002D0g-Uf; Tue, 08 Mar 2022 00:47:27 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRO0b-002Cz9-9d
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 00:47:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso761462pjj.2
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 16:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=q2WsEFsrCkkzU/B5lUpkC+cQ38+qzE8NHBPBAWz7WGk=;
 b=cjYUaVWW1GAgLShT2FpEl3RjDvQhhJuGbeV2n0V0HGEgwV+36z1t89iiP4rsAJ40s1
 3VmPNb46CocptsoYxwyIUC+qNMejwMoBRNXP68E8LiTBtDJe26ON0quTuCMpUs70Dwfh
 pOJ1Zgno+W2GYFSira/Wa0KsI4FOA0ORxFa2nKgPAoKLBNjG7SvwBN3/ngahBxJoJi6Y
 J1Ybhtw69gcxaZ3M45dEXUOuPO1moiY8ZCBWOFtxjlDwJEcTqp5q3KcZjs8gNQbdQNpK
 hXfEc3ptZ+4FkpPDJ3cMPyUKBzj7CnFKYJoKhYOsWvDsA5xDDVkJ5EVuARjbyuP8cHlW
 Kb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=q2WsEFsrCkkzU/B5lUpkC+cQ38+qzE8NHBPBAWz7WGk=;
 b=kxPaz1sT2AdZTiGz5DntT3Vv1C47dHcqC1XJR1IDY1ss4xt1pg9Nmpkt4N1fQSDrda
 4HK8mwu2fQ4J0zhUf+hH/XHTkVPQAdk2i5HJVYw2up5nb6SdeqaVnoo4YfbvK041awNS
 JGywdUNQwMtoAZsHVBOo3tDAGI1x3EP0a22x7gOVIf6dSKv1EYRI4jDMJNhFzoTAoMVt
 HuuBqsbYnHsx9IUSdXDxHaNuq7KAv6F/aU4OwCDQblYyEtQ0NXDsscH7ttpIc5tzhhUt
 uIGtHaT2e5MbvE6HIcyVR7zqA31UIdm85CxsO87Eb/F8pq3z6W/WIvWjlqZy0QH9MqwD
 02Zw==
X-Gm-Message-State: AOAM532kT+1OcDyA81CCWN4kGZ6EGfRK1WusnQpcNw33fELGrzeml5ZP
 jga4DcvzN8x0XoFyidR3wV6nNQ==
X-Google-Smtp-Source: ABdhPJx00mCNVKzx0KZr8h0heAGNsLLi8xaqRn0uFWnac5NvkDSzyFLghxkVhinRifRYa+LamXOqXg==
X-Received: by 2002:a17:902:9690:b0:14f:fc09:fd02 with SMTP id
 n16-20020a170902969000b0014ffc09fd02mr14366480plp.66.1646700443967; 
 Mon, 07 Mar 2022 16:47:23 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm3275273pfi.61.2022.03.07.16.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 16:47:23 -0800 (PST)
Date: Mon, 07 Mar 2022 16:47:23 -0800 (PST)
X-Google-Original-Date: Mon, 07 Mar 2022 13:01:42 PST (-0800)
Subject: Re: [PATCH v6 08/14] riscv: move boot alternatives to a slightly
 earlier position
In-Reply-To: <20220209123800.269774-9-heiko@sntech.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, 
 anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, 
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, 
 cmuellner@linux.com, philipp.tomsich@vrull.eu, heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-3d591628-2c87-40c7-91e4-407ad313a4aa@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_164725_406383_9BBEFE88 
X-CRM114-Status: GOOD (  26.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 09 Feb 2022 04:37:54 PST (-0800), heiko@sntech.de wrote:
> Move the application of boot alternatives to soc_early_init().
> This allows to catch more generic cases of code needing patches
> than doing it in smp_prepare_boot_cpu() and also makes it actually
> work if CONFIG_SMP is disabled for whatever reason.
>
> The position is chosen mainly as it is before the actual soc early
> init runs but also already allows accessing the devicetree
> via fdt_* functions.

I think this is OK, but it warrants testing on the K210 -- specifically 
the system is in an odd state before soc_early_init (IIRC some of memory 
doesn't work right) so I'm always a bit worried about calling stuff 
there.  I don't have a K210 (or at least a working one), so I'm not 
going to be able to test it.

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/head.S    | 2 ++
>  arch/riscv/kernel/smpboot.c | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 2363b43312fc..0e1bb97f9749 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -10,6 +10,7 @@
>  #include <asm/thread_info.h>
>  #include <asm/page.h>
>  #include <asm/pgtable.h>
> +#include <asm/alternative.h>
>  #include <asm/csr.h>
>  #include <asm/cpu_ops_sbi.h>
>  #include <asm/hwcap.h>
> @@ -341,6 +342,7 @@ clear_bss_done:
>  	call kasan_early_init
>  #endif
>  	/* Start the kernel */
> +	call apply_boot_alternatives
>  	call soc_early_init
>  	tail start_kernel
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index a6d13dca1403..f1e4948a4b52 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -32,7 +32,6 @@
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> -#include <asm/alternative.h>
>
>  #include "head.h"
>
> @@ -41,7 +40,6 @@ static DECLARE_COMPLETION(cpu_running);
>  void __init smp_prepare_boot_cpu(void)
>  {
>  	init_cpu_topology();
> -	apply_boot_alternatives();
>  }
>
>  void __init smp_prepare_cpus(unsigned int max_cpus)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
