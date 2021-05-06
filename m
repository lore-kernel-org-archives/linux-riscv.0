Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF633C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:14:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251CC61077
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251CC61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Nj+pb9hEgx372SVEWyyLsD/FjlB+82rqMXKB11HJGSM=; b=axV/MP/PwfY3MqfW3Fs0jEnZm
	f771qO5pG4PuuoUF+av/qwERtFcLT6yy6Jmb/6FWVwCRKtbK/p3L/mis5Ax5wnLOWJeg9w179FAVA
	5G0d7tOGHfSfe01etBqhEmgrgOa2UFg4rR160pErDY6PGoNPfTCtdghdP1FpCqgZfEMifGCSw/kpM
	ZC57B9OBYyGEbYkykUcGCqS/jP7u8nLYPp/bgiHkjMjQj6NOAcAA/iABbJxH2qzcTbT7Enx0e9hwg
	FQlk6kduwARAow8ALCm7evj/BI08r3rbPr7x3HmH6n7+o8XC/OhTNhl57Xjs9MliIODnRVPJhDoJh
	epy4jGDPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYCo-003S7E-Jr; Thu, 06 May 2021 07:13:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYCk-003S6s-R0
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 07:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=SGYzOBTlLlpIkWRl/S/Nid0gbfZB7VB7MFOHms97XBw=; b=TDmT28ICoP2Tkq75k9uZ4tAW5T
 zrfKCQYLl1PkACEqIR6sKguW8vGF7nhCXty2hwCCaOe2kuIu3Hd/EPeI4+eJbd1Nv56zrBwy2yyvY
 ZVSJnHP6tQT8S/7goPZb7Uge2dZbq3W2VsTjhfzv2A2JeKT37b9w/Iwk1E9ngmFVuG1QhcoSuB3H6
 t75TdJS/5qIHkP4Mj2FmeBkDachYS2t4VPZhw8UvdkxRcAlQYt8I2/cNKlMN8m1CvQgjtt19vvXlX
 arHjYEK1pGs9kYqO5R3Iw/KukaSb1BAqCweYEM4HiP7k5liakRgqyWYgRteOb639Iwcsqf0uE8meY
 ZGKzBfcw==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYCi-005er7-86
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 07:13:49 +0000
Received: by mail-pf1-x430.google.com with SMTP id i13so4577692pfu.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SGYzOBTlLlpIkWRl/S/Nid0gbfZB7VB7MFOHms97XBw=;
 b=lg14LhDG4yWolbJkKiQS2KXKA6T4ECkN0JroW7eGywkxUO/Fx3OvPdTttUkojbSP4t
 mBz8SS6ath7yb2DmTiTlJzPBu78oQgEPY9WL8GZSGr0xhe2zVaxh+y3iC2sCFQjLqNmQ
 BKDrKS+PPJMat7jyVlRSDh1b+Teh85CYs9+MCdhsdLoiuoKBo6zxi6hbv6sfeTw8TE21
 paZMvems9/0eHClEwdWpDsiXs7Uakqp+niLtG26mbUQTxuhgRy+XrwMILn0zY7Ygy59w
 wd+72s6mrbKOkrBgnlvyrM6tzd2DKh+AfxWuzcjscWbMThtsj1Jev6pO0oXj5aRpw9eD
 T0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SGYzOBTlLlpIkWRl/S/Nid0gbfZB7VB7MFOHms97XBw=;
 b=mXy3RsT32ZxFoTyY+9+EO5aODT8RQmn3SizniPPZDTJbRf5AAi3diNbBd7I+hQJB6c
 x6U6gjpIhp6hVu8jfuuqezSnkj2m2s/Gzvhb/sVuadZEMIHaI36rGD2GQokBT3eJD8Qr
 v8SpDeuweYZi8RScfkn+WBwK526KqmgfoR9g5vyxjKTLNJ5//dZFhNhjYdJp5Atf6DHD
 VSpYs1Be9Od2xzU4Fv9BBkQi9q2XCQPIqq+anFxcMHS1PKC6PHmG3XuNeFHKy6/ISUJY
 9deTHNTRXuMHTXOS6Lw1c06qzK3anZC251d/9yOYPH66skZK2W8ODbjaKI81chKrvGF0
 XHlA==
X-Gm-Message-State: AOAM533++X4TeOx/Lp0OZpWG4YLTxijyUkMd6CuLKiv4buEjMu8M6RMJ
 PZw1sOQWP44RoWNTnxmB/ZmBqyhaFGEBTA==
X-Google-Smtp-Source: ABdhPJzNaoLfE/rno5m116Dln0zHvSPydy1ER688BUAx99/BzEfhlD7HkxEcz7H5/9G2nfGTHI9WGQ==
X-Received: by 2002:a63:d47:: with SMTP id 7mr2974895pgn.400.1620285225995;
 Thu, 06 May 2021 00:13:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id br10sm9048783pjb.13.2021.05.06.00.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 00:13:45 -0700 (PDT)
Date: Thu, 06 May 2021 00:13:45 -0700 (PDT)
X-Google-Original-Date: Thu, 06 May 2021 00:13:41 PDT (-0700)
Subject: Re: [PATCH] riscv: enable SiFive errata CIP-453 and CIP-1200 Kconfig
 only if CONFIG_64BIT=y
In-Reply-To: <1619683116-196404-1-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-0ac45f93-d73a-4966-9dca-5bd058e8236e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_001348_308798_8EF824B6 
X-CRM114-Status: GOOD (  16.21  )
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

On Thu, 29 Apr 2021 00:58:36 PDT (-0700), vincent.chen@sifive.com wrote:
> The corresponding hardware issues of CONFIG_ERRATA_SIFIVE_CIP_453 and
> CONFIG_ERRATA_SIFIVE_CIP_1200 only exist in the SiFive 64bit CPU cores.
> Therefore, these two errata are required only if CONFIG_64BIT=y
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig.erratas | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index d5d03ae..b44d6ec 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -21,7 +21,7 @@ config ERRATA_SIFIVE
>
>  config ERRATA_SIFIVE_CIP_453
>  	bool "Apply SiFive errata CIP-453"
> -	depends on ERRATA_SIFIVE
> +	depends on ERRATA_SIFIVE && 64BIT
>  	default y
>  	help
>  	  This will apply the SiFive CIP-453 errata to add sign extension
> @@ -32,7 +32,7 @@ config ERRATA_SIFIVE_CIP_453
>
>  config ERRATA_SIFIVE_CIP_1200
>  	bool "Apply SiFive errata CIP-1200"
> -	depends on ERRATA_SIFIVE
> +	depends on ERRATA_SIFIVE && 64BIT
>  	default y
>  	help
>  	  This will apply the SiFive CIP-1200 errata to repalce all

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
