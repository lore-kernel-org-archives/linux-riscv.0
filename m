Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793CAEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 22:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MIKsJCaX5kfPqB10G5TMcPzEdbef/za3NBty/Aiz610=; b=gY54WTCFf1yycQ5a6i/f77othh
	9kEuizooVZDcd4yS4NPvhbREMfVsr9yDjEFlvZCRVpaRohgEjdlddtmE4zZLjVlTVEMrzls5011hj
	i2tdZ3B/7bzgawzggHSrpHh+3dJIN8qot3hTrwoXC24DAnzkNVJ7izDNaBraWA5Lz383r9aRvQw3G
	EbuM3wJxCVUSlCg5DGqxauKvnvpLcLmOwg7nqF/EdULu8HcrACXQY2em1uD/G+jPLy/ZORE4KCt5A
	yyTNbW+Rid8rwJRgVNqXyzMrPS923nXHL0fGYOi4csfoZ8ZnfX7pm776KAN+AKC4QLSXf4VA3xaI9
	e6V0cZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSkc-001x8C-1m;
	Thu, 22 Jun 2023 22:26:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSkZ-001x6x-0b
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 22:26:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b4f95833c7so42339145ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687472754; x=1690064754;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eokW7ZiNVf5rdPhD+X+NIocq7dfbxCBS0wRkL6mOMZs=;
        b=fyVEumVBwxTvQRlpTBFwGLE3+G6JqbrGtJnY4S81UhW9ihjbXm9bCQpo72EzQDCIQm
         0TCI3aBi5NEYL6az1U4r3IZr9ffryuPOPfYTX28VGfGbzz9C+ES2mPEZGfgdHUnAz6YO
         jpkHHxM82QXxgRbdkyQyxRe4t2zMstl/kxL4PwrF+da2R9+Mmh55Wj3+okfJ68LHBYpF
         DypksVBLLDFfxjDfkAHzzs1hGKbYffGpEDhGLYRKplLRonG1A8PlumI9Tcz8IYuPcP/d
         Gs/v4ckbD6wYIYb8hLhq1mipZKny9XhR3uU1z9KHrWqG/CB3tpazqi/QVjsLc69KsX+O
         Yj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687472754; x=1690064754;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eokW7ZiNVf5rdPhD+X+NIocq7dfbxCBS0wRkL6mOMZs=;
        b=Bysnn7Usd8DA2Y8UvglhtK9v3RXfDwxGu6Vdk4K9lGy97XZHrgCnH/PMwArPlbeEVA
         4XWn8cjULnB12Eu+0KdbS6xnQevah5eygRZ51AiyHkXBrjSToCRC0v8eI+2gI80pnOOR
         wsMzrFE+HeRgsDkHQmuXsJ0eygZqfszlrBXINH91HM0iap7U3X/XoirHxcQmUAF/A/V8
         sMO9iXS2gZywbC4oMbBmt6ZgZ0I4cPOmSmEgTe7wY8Bub6IDWBrzusw60zOLeDlK6jHk
         /ArOaeHVRBjOcoLWNQoj9+tM/Z3tNvG3GaDmVGuc0DUroqw/GYo5Dqg5/Rxdg5PBA/Vy
         Tl5A==
X-Gm-Message-State: AC+VfDxuBc2kRjqIjXbZcH7rZet1HlDVPy61fBgNhqDGummr+98CKgd9
	mlumi+Iya8A7zX8+xRT3PTzp211piwoFFgtxFuNIdQ==
X-Google-Smtp-Source: ACHHUZ55vqGZQVIh+y9D2lGn8wRWkX0C/N9J6fH3MwuUoSrJZOp0xMlfzgFVZUuGKjU9bunUaSvPlA==
X-Received: by 2002:a17:902:a3c7:b0:1b4:fd48:d734 with SMTP id q7-20020a170902a3c700b001b4fd48d734mr13320008plb.47.1687472754371;
        Thu, 22 Jun 2023 15:25:54 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001b3d8ac1b72sm5822043plb.216.2023.06.22.15.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 15:25:53 -0700 (PDT)
Date: Thu, 22 Jun 2023 15:25:53 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 15:25:11 PDT (-0700)
Subject: Re: [PATCH] RISC-V: fixup ISA string parser merge conflict
In-Reply-To: <20230622-smartly-gauntlet-a68b523e2dc3@spud>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-61dcc7d1-370b-49e7-ae4a-4ff79840b226@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_152559_249100_C5EA56A5 
X-CRM114-Status: GOOD (  19.11  )
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

On Thu, 22 Jun 2023 15:18:43 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Commit 6589450fa2e3 ("Merge patch series "ISA string parser cleanups"")
> has interacted poorly with commit 16252e018a30 ("Merge patch series
> "RISC-V: Export Zba, Zbb to usermode via hwprobe""), as there were some
> semantic conflicts between the former which added more users of the
> "this_isa" bitmap which the latter removed.
>
> Fixes: 6589450fa2e3 ("Merge patch series "ISA string parser cleanups"")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> As promised, feel free to squash ;)

Thanks, I will ;)

> ---
>  arch/riscv/kernel/cpufeature.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8ecd6f0af213..bdcf460ea53d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -131,7 +131,6 @@ void __init riscv_fill_hwcap(void)
>  	for_each_possible_cpu(cpu) {
>  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
>  		unsigned long this_hwcap = 0;
> -		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>
>  		if (acpi_disabled) {
>  			node = of_cpu_device_node_get(cpu);
> @@ -162,7 +161,6 @@ void __init riscv_fill_hwcap(void)
>  		 */
>  		isa += 4;
>
> -		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>  		while (*isa) {
>  			const char *ext = isa++;
>  			const char *ext_end = isa;
> @@ -323,8 +321,8 @@ void __init riscv_fill_hwcap(void)
>  		 * Linux requires the following extensions, so we may as well
>  		 * always set them.
>  		 */
> -		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
> -		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
> +		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> +		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
>
>  		/*
>  		 * These ones were as they were part of the base ISA when the
> @@ -332,8 +330,8 @@ void __init riscv_fill_hwcap(void)
>  		 * unconditionally where `i` is in riscv,isa on DT systems.
>  		 */
>  		if (acpi_disabled) {
> -			set_bit(RISCV_ISA_EXT_ZICNTR, this_isa);
> -			set_bit(RISCV_ISA_EXT_ZIHPM, this_isa);
> +			set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
> +			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>  		}
>
>  		/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
