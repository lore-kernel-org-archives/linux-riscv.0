Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95B0C433E9
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 23:10:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A9623A5C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 23:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A9623A5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=DD7Qh8Qf/wuMyy88udSe/EZQzMqWXdgC75viEXrctOk=; b=BsAxEF4QxW+Eb2q0Ww1EoRbSS
	/VUf8Q+QIt/hvzIYsU1+dPVV3eyWkk8e8rn6eiLSBr93LRLy8Jt63nGh8z8UVUHx1cNvnmPGHWCbD
	Gq+Hl33mwQR3lZJZ3A7sslgv+ToGKY2yGyIL//eoL2ZIYANJ2v3wjf5bbh4mmfEo4B6H6cBBtxkTH
	OHV53hBOzS8HBNcs/x71b4L2GDOWsONGYAL3L23vwQwREZ0J6WZthgOmYjnW91nDl2+A0VKqvvVLI
	HFIFqF10595NtAamqLXqA+AsnqgTRlM3T2a6q21/jru2ul/XpwVTyI7LXanq0B3A1hwNM3UL5SF+l
	Ow2m0WQWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Bkx-0004s9-MQ; Thu, 14 Jan 2021 23:10:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Bku-0004rk-Qb
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 23:10:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id p15so3882789pjv.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 15:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PEdAYNlbbRvqr+8mIjpsxzkysb4V7qTNuITBkJys0Lg=;
 b=YjWZOhByjKZb9ZBspUTnUXw9Cz6DpgKd56dmvAdvtZuBr+fjmujrLmr2srOVLgCNYH
 Fbge7k8Ac8c8rUJv7UUN19ipz/kqOphl/aUZoXs+6panwpcJIyCY5QhNDUm6miafZZxE
 3uV2PfVmBU3WTn0buIW+pYYEMDfw8zIMrWQj8+SoAs1DDL/dS7GcPrqUHDr63PvuGbwh
 TpNQqTuzxIj2cC3YkCB8T0l0gmdwsrrY8a7s5pDvV4UoJg/2i3WhHLOsc6JgS1lX6T3g
 hgKsypqwu5uKnX2A49ki/QjOQuWq/rDX7MlKOvAS4ZZBGsrNhc3/9Xz0lBZ7voH7NkcL
 UN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PEdAYNlbbRvqr+8mIjpsxzkysb4V7qTNuITBkJys0Lg=;
 b=A+cK+VZirqzLrYV1ztaZ891yh8fqNQpqjBfeMda1KoxmE2zZmMUV0KFAwi8e/V45la
 jY29eHUG92KnXhJcZe4yFogqlP5pZO3JV5Kk7OGpMEMt5SnRrr8QF/w9TkBDlCwMS0sF
 qI9b6yxI2mEtLJydwO6MnVYZWjhDCfkZvikdaekECrD3J9sRq361cvw9ES6lQ5Pljo3y
 xrzHxsFvvJ3zKWP5+In7wmLqTjTzKtSopdjKkYM+OTydGgzUUsjUIBp0vomWnEVMSCTh
 yvnuVGgEi4HAk6ZRj0OEc5rkMRuATHiipuoz7Xuw9DrJ2I2wRwEgVdoduOwe41A1Yo1Y
 5U5w==
X-Gm-Message-State: AOAM532Rde3MYHWWXmz2fmE0Jt1qDelnefZz3cAjKcWqiS1DowNPgBGn
 i3DEwW5heIj/sGitfEty+FDBIn0GUINRyw==
X-Google-Smtp-Source: ABdhPJwgXJpLzNnkxoac+STrEReYQvi22iQxU22Q3Wsfk+JFSwALh9Pq8Ov9Se2HfDAeg65t2VBScw==
X-Received: by 2002:a17:90b:e96:: with SMTP id
 fv22mr7311666pjb.92.1610665814285; 
 Thu, 14 Jan 2021 15:10:14 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x10sm5950911pff.214.2021.01.14.15.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 15:10:13 -0800 (PST)
Date: Thu, 14 Jan 2021 15:10:13 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 15:10:10 PST (-0800)
Subject: Re: [PATCH v2] riscv: fix build failure with Canaan K210 SoC
In-Reply-To: <20210113094353.401690-1-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-348218f8-fc84-4615-9f90-975904466e7b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_181016_983116_F842234C 
X-CRM114-Status: GOOD (  20.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 01:43:53 PST (-0800), Damien Le Moal wrote:
> Fix riscv dts main Makefile to avoid build failures when
> CONFIG_SOC_CANAAN is selected but CONFIG_SOC_CANAAN_K210_DTB_BUILTIN is
> not set. In this case, the SoC device tree should not be built.
> Avoid the failure by changing the canaan subdir inclusion based on the
> CONFIG_SOC_CANAAN_K210_DTB_BUILTIN configuration option value instead
> of on the value of the CONFIG_SOC_CANAAN configuration option.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3c54e3125dcd ("riscv: Use vendor name for K210 SoC support")
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
> Changes from v1:
> * Add missing CONFIG_ prefix to SOC_CANAAN_K210_DTB_BUILTIN option
>
>  arch/riscv/boot/dts/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 4da40691c55b..7ffd502e3e7b 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += sifive
> -subdir-$(CONFIG_SOC_CANAAN) += canaan
> +subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))

Thanks.  I squashed this one in so we can preserve bisection.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
