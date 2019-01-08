Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EE0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 12:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C04206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 12:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EQgnQit5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wL+AvZqu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C04206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeLIbSjXA7R7/XGu6W3ip2v7Xcr0qeogPOlUHmsDBzM=; b=EQgnQit5b94p7G
	s82uppjTBz/qW9zYBFDNhdM6EaJ/6YqtjMkGczIhEA16PEYsYVkcWntEHevK/9FjvUHs0uxJ4I1dj
	SpWCZ0wyIhGur0EumVCDZjCBSj1ZvjwIXna4lN3FfaUDre/4xBu2/QCijLWeV549WtvI7sCJZvnSG
	78KdYtAPYdPFC7xgTCQAZwUNx4VfyYZQ3K3sjULhE06Pnblj4ujnFKbGpkgxk/5jc25wm94j54jAl
	KXmfGNSg49x4BeFaA8NfPAALEYjIcmubtpWry5DZqbQLOMniUefAYcQ1w3KHQbvmsmAwzdhmHfl3u
	gNzZubAd1/GxbbhJvVAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggq4w-0004sl-DW; Tue, 08 Jan 2019 12:01:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggq4t-0004s6-CB
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 12:01:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id n190so3900952wmd.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4z/joS18OrBx5VzkEUr1UXjVHtJ0iMM9fC/5WEi+jKg=;
 b=wL+AvZquaWVe3+cpWa6p+I7Qq5eeTQRKQgOLuwpVCjMC1pd5/PCHJV2lPQ50Gy+NXJ
 KoRyatQs2KqojE9wsH5bgtbQiY5eF5UgjY7At4k0n2qi2pfnkbMACSnxQ01htM0if6nB
 kezg4lD3DKi7ZQK2LsQgM9kiZmNXQVv39sFiq8OPgVugnP8gL2saqm8d+yd4BOKnAtQf
 O6mJW8kgiAYCB2eE1d1jJYbMwtbOELXEl4K/i+JGrrhZZZiLkkg3WNIP7WVM9ckUbnsk
 XQVweuX30Eruy5yGcg9IdnW8zbxFcn9R2SpFtbiI6RW97vQYO/3YO3i9zZk5oRL+/tF+
 Ck2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4z/joS18OrBx5VzkEUr1UXjVHtJ0iMM9fC/5WEi+jKg=;
 b=LYB5EoRUSUv4poNbwMeLIxkgiXICePNdrMPa6vp76X/7SaWX0gQ4AZY76d04qii/D+
 /Rb4FizWfwEs6/IaWFb0e8iqiTf4jQxOI0NmVUCA4O9lMcHu2IJxCoNInIiKLZRMjtGd
 gSxG1aoxixYlAST5WIHHBVHlzwQzisKEQbRTnXLkH4rmcRrN0bZQwFbD1XGtszJUO8yM
 zFM+gtA4uhPqi28JmTzASwAyM+0WVXwnaSyt8jzskq1FOlgj28YX0Qn1QbQLrGaybXMK
 GMyjZs/MLv1F7KByMDpEF/KwUu4Z5vMd/Oxzf/yVp5JwVaowfKs62aXhWGA/8tf5IRz2
 AuCA==
X-Gm-Message-State: AJcUukdc2fngN7IAodUtaG3bw4X8oTjcaeyG46oFGwBvMOmBuK0a9xKX
 i5WynVlSAQMJC2RUIJ32A2y3FLuM4U8seiMRTGoFkg==
X-Google-Smtp-Source: ALg8bN4aYf2g6YWDCTVDUmY6Gbu21QIrrBP/U9lgVysYWhr35oABl6RGoIwFWnrB6Rgj7yyrTTmkelU+TASMZy02zAI=
X-Received: by 2002:a1c:ca15:: with SMTP id a21mr1458339wmg.132.1546948909573; 
 Tue, 08 Jan 2019 04:01:49 -0800 (PST)
MIME-Version: 1.0
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-9-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1546940318-9752-9-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:31:38 +0530
Message-ID: <CAAhSdy1_5ULea-2JKYeQd8dAPbnZ+OVM-p=iP5RwWbuiZ5NJJw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] RISC-V: Assign hwcap only according to current cpu.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_040151_418226_054B93DE 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, we set hwcap based on first valid cpu from
> DT. This may not be correct always as that CPU might not
> be current booting cpu.
>
> Set hwcap based on the current cpu instead of first
> valid CPU from DT.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index a6e369ed..ed6122ff 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -43,12 +43,15 @@ void riscv_fill_hwcap(void)
>         elf_hwcap = 0;
>
>         /*
> -        * We don't support running Linux on hertergenous ISA systems.  For
> -        * now, we just check the ISA of the first "okay" processor.
> +        * We don't support running Linux on hertergenous ISA systems.
> +        * But first "okay" processor might not be the boot cpu.
> +        * Check the ISA of boot cpu.
>          */
> -       while ((node = of_find_node_by_type(node, "cpu")))
> -               if (riscv_of_processor_hartid(node) >= 0)
> +       while ((node = of_find_node_by_type(node, "cpu"))) {
> +               if (riscv_of_processor_hartid(node) == boot_cpu_hartid)
>                         break;
> +       }
> +
>         if (!node) {
>                 pr_warning("Unable to find \"cpu\" devicetree entry");
>                 return;
> --
> 2.7.4
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
