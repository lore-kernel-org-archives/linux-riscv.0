Return-Path: <SRS0=5c4l=BV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F25C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 08:41:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BA3206B5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 08:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzIIckX2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="DfUNFMfp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BA3206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QV4LnJzNlYbRnesHGZn2dQhQR5PHposKFchBS6PkZ0M=; b=TzIIckX2S5N/U51T1GwWfcHdp
	aporvhyBeAdMXLNb8E89Ad9xjqpt0k1zbsQvMPmo7HojH4onV3xr0k76xZHvR/qSJLPDc/iozOJ0y
	EyMWl3BtvOwB1L8RxWHtFtdXCIQGMy1YUE7x4xJO3YQLqn9XJrps53XlNToBmwMyoME7uC5z6F6ki
	ObR3G078zBAuCGpt0XzVbLl1Q6rGl/bL8NpBJ1ETGhJ33f6W+kVrskauhWKKkC0bbNDQW7px+eyp5
	tJp5Cmf28QW80AHLkvSZ2cs1vYThDnv4G/rnZWmMagg/781EByInlIdyH/fuRmfOFk6+vcXAsG/TQ
	c9bTiTqmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5Pq6-0004d7-MT; Tue, 11 Aug 2020 08:40:58 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Pq3-0004cU-CP
 for linux-riscv@lists.infradead.org; Tue, 11 Aug 2020 08:40:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id 3so2037688wmi.1
 for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2020 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=btI/X9SDKoElUv2/KbWFVuLp06+/u9czm/CWpC6NJgM=;
 b=DfUNFMfpPON2NYu/waf/PF+SlGLX8CkQ+mMAndAEpNpx87wEnHfnN27eF7Z/uUP9g3
 yyhUUT27Nr3k/s69a26aPTv+/Z/2/XIOtF9AbKAv8xf6Mypww73jtjjUPINjcrZr00gU
 OLx9q4Oh13ugyvCQbM0jh/RExazmLEbxEbQWwpVfSSnlCKgIxX1xWsk1Eq+JDbjyY5p0
 8kjY9rydu4Fa2yGMvdELdhT7S81m/LyP/BAkCw7CtYuetWlVtiPRCb5U3x1yS+KXQkJO
 9i4OVKk6eUhhiTbAnJhggCiQ41kfcaYmY1+PNoOlLkRUaFZBTODv3iK/YYybBc0jC4oC
 v5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=btI/X9SDKoElUv2/KbWFVuLp06+/u9czm/CWpC6NJgM=;
 b=Rrd1DFuA0lE0UY4akXgboZI3OkQ6cOWp1F7SdytQnh6bYmEKAj7YP4jysJaeQa+Sgb
 s2pz5XBRw6R+Grkuu3IAM4f+8JeEqhax3iNvdhusiZEPg314xERwiyOKah+Xi/Z0tTLN
 aCv+Ke0ilBpUpqtlTjXZV//JZcFSG/col0DGLt95bBD4ntX9zfj1Fy8LQ+VE1RLJKNb5
 MXJGnWsdc2pDeNf3topDJIYw4jMskVHPPnnvgqXl2mannjcmvK8KuaL8wm/B8vg7+FVS
 7DWdotoS+2HH+V6Iva566eZdnqoXzvSGYIwreLr7B/9a2KnWAEHXTCOdig/Vr2DGmay2
 aiKA==
X-Gm-Message-State: AOAM530LPvea4yMxbzTPlqqg3ZEbmPMCS6ha+FD0OJoDpR2/Si4Lua58
 OHhzhMFo9kdNMS6DLI+9C3+QoXyc4fnDHSI76/2nOg==
X-Google-Smtp-Source: ABdhPJwKFe83BF3AQ0z4SV1knXAKNB01wIW69Bz37C/c6uL0TzG5KeLfQwPSwrm/PjyYvIDjGptFuo+U3s5+nw7Kgmk=
X-Received: by 2002:a1c:720e:: with SMTP id n14mr2964859wmc.152.1597135252525; 
 Tue, 11 Aug 2020 01:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200811063659.284088-1-qiuwenbo@phytium.com.cn>
In-Reply-To: <20200811063659.284088-1-qiuwenbo@phytium.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Aug 2020 14:10:40 +0530
Message-ID: <CAAhSdy1c=R6aUZ6EOggmJ_Bqm2O0VLKEku=zyFfabExSzOKErA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Setup exception vector for K210 properly
To: Qiu Wenbo <qiuwenbo@phytium.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_044055_556638_27A0C93A 
X-CRM114-Status: GOOD (  21.01  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 11, 2020 at 12:07 PM Qiu Wenbo <qiuwenbo@phytium.com.cn> wrote:
>
> Exception vector is missing on nommu platform and it is a big issue.
> This patch is tested in Sipeed MAIX Bit Dev Board.
>
> Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
> Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
> ---
>  arch/riscv/kernel/smpboot.c |  1 +
>  arch/riscv/kernel/traps.c   | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 356825a57551..23cde0ceb39d 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -154,6 +154,7 @@ asmlinkage __visible void smp_callin(void)
>         mmgrab(mm);
>         current->active_mm = mm;
>
> +       trap_init();
>         notify_cpu_starting(curr_cpuid);
>         update_siblings_masks(curr_cpuid);
>         set_cpu_online(curr_cpuid, 1);
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index ad14f4466d92..a390239818ae 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -174,7 +174,16 @@ int is_valid_bugaddr(unsigned long pc)
>  }
>  #endif /* CONFIG_GENERIC_BUG */
>
> -/* stvec & scratch is already set from head.S */
> +/* stvec & scratch is already set from head.S when mmu is enabled */
>  void trap_init(void)
>  {
> +#ifndef CONFIG_MMU
> +       /*
> +        * Set sup0 scratch register to 0, indicating to exception vector
> +        * that we are presently executing in the kernel
> +        */
> +       csr_write(CSR_SCRATCH, 0);
> +       /* Set the exception vector address */
> +       csr_write(CSR_TVEC, &handle_exception);
> +#endif
>  }
> --
> 2.28.0
>

This issue seems to be only on the latest master branch of
Linux stable tree so this fix need not be a stable fix.

For MMU kernel, the CSR_TVEC is setup in relocate() function
called from secondary_start_common() function of head.S

For NoMMU kernel, we should set CSR_TVEC directly in
secondary_start_common() function as "#else" case of the
"#ifdef CONFIG_MMU".

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
