Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CACFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 03:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EtT6usdQ5m4RO54X+uRutlXVDbzVCkqjkFKUNsT/RoY=; b=LSqhLPUmHIgi9+WI6PATj9lrN2
	7B2pD+4j7ARvCpS6OogFrOFbADpbTsiSmR3i9+ixlsaIKYVhWgkDMfdJQv6RjHp9QXNqqOwFaIUdd
	6W5AB5v5xz15aNCQQhwxCXYS4KkVRJ+XriVfFfrhlkV6LoEaIZaZWvIsJzFOlMTujqR4MOpIbVrqz
	bzK5WAH5KHr4JSTZGVlCG45oJ7ux96sP68cAOtzEydDN9Md7w8+qYaK9+XtwT5LjUgkYfDr2p1tfz
	3S+wxCGfUDC2/7tjesKJ6d6TGWNuAGMMUAPJJHet9cyTWTMMmBtsZ9erVo/+J6phJO/JVsIKk2nwX
	1TW/v4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNRjp-003Dwd-JX; Fri, 25 Feb 2022 03:57:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNRjl-003DtN-Ie
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 03:57:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id ay5so899344plb.1
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 19:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gte7TsbRO4nf+fP8nFuN0FeNHFuILouaQXYqckPERGY=;
 b=XW8XGsI87u9y6vGgXqhrEifhrtPILzQ9bHu71P+3AGToT1GuX5X0vf6jOdJSkZyqqA
 OL1BywmFdva8s3+MCkgNZtS/Zr886UKs1+2iFhs+xxRoBnSYM+76afVag3NbAQKrebEo
 FnV2rngVMyMKhynfy0ih4FFzxuhxO/CBKacxGKQyO6sr3NhVIm5MH18BQK+0FERcOPNJ
 +PmP9lif3eUfZ2YyxA9mOCipFbUW8zelofMcfVKwAAb8O1PBzrNgIR2TEkqYOy3hWQVV
 59MO40XjoWp30P4TOwl7jbwqXVimn1WMuvdQ7FQYnoJocK/r1Hz91SAuir6e7r/lyr+0
 hnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gte7TsbRO4nf+fP8nFuN0FeNHFuILouaQXYqckPERGY=;
 b=6rEibVtzUn7WR0HQNC54Nk0ZFAurrLzA5/FXdlP6TEzt+5DxDdEyWC/hIJc/qqP8V5
 vm/koc0ZoupY919SUy+Yml4t02NVniLR6l9thCk6UNoQjD532GRsml1PtJ0uQnkbS2i4
 5IpSF+D3E8ZHENQ1RcjF/00BTIX+JcX7nIUVlSAduTkKi3TH8xUVvixxBnKAqOFsLtNC
 FfglRsREoOnEocGGre21z4PGAmiejqacB1qrtT2fmrZZVE4f95L1L1Jo5kLhUzrOzxrp
 mID1NFjpNgQ3QoejsEIylUjDhZDiwHMj5qCq76Xq4QBIBqiG4E0O/4mSv3p5hJI25hDJ
 /Z1Q==
X-Gm-Message-State: AOAM531MtF1XeI0MU2QWEpl5AnBUxpWieKugMUZYEAxEa7JymLiFILcc
 QSob+aiIPdVx+JIn8ryQQEBh4tRcTd4F8Q==
X-Google-Smtp-Source: ABdhPJxpacaMeJ5yQCNQsJMC6/AYl23+JwAwWepKztxOZ+J3Q2xpOXmi+U1tBrINW6AC/rGVAPgozA==
X-Received: by 2002:a17:902:b210:b0:14f:d0ff:46bb with SMTP id
 t16-20020a170902b21000b0014fd0ff46bbmr5571195plr.47.1645761464115; 
 Thu, 24 Feb 2022 19:57:44 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 r19-20020a17090aa09300b001bc5fb5886asm7425850pjp.5.2022.02.24.19.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 19:57:43 -0800 (PST)
Date: Thu, 24 Feb 2022 19:57:43 -0800 (PST)
X-Google-Original-Date: Thu, 24 Feb 2022 19:21:01 PST (-0800)
Subject: Re: [PATCH] riscv: fix nommu_k210_sdcard_defconfig
In-Reply-To: <20220209035623.243675-1-damien.lemoal@opensource.wdc.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: damien.lemoal@opensource.wdc.com
Message-ID: <mhng-5e36528e-e71c-4ab0-8b2b-36f6cd4e6cf4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_195745_709058_91B194F2 
X-CRM114-Status: GOOD (  17.76  )
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

On Tue, 08 Feb 2022 19:56:23 PST (-0800), damien.lemoal@opensource.wdc.com wrote:
> Instead of an arbitrary delay, use the "rootwait" kernel option to wait
> for the mmc root device to be ready.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 2a82a3b2992b..af64b95e88cc 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -23,7 +23,7 @@ CONFIG_SLOB=y
>  CONFIG_SOC_CANAAN=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
> -CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
> +CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
>  CONFIG_CMDLINE_FORCE=y
>  # CONFIG_SECCOMP is not set
>  # CONFIG_STACKPROTECTOR is not set
> -- 
> 2.34.1

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
