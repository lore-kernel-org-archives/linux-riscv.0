Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57F8C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 03:54:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474B061177
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 03:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474B061177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XTIq440usQLluG64ODh/msaTBzcHFK4lNPCcMX9Bs2o=; b=cKpetMOo9nakgk2G1BR5ZKGe9
	sDAHMIEytvfaa7S3VINS0lA3/aTe8W9RH0miAzjNFokutaQ9wjtkKPDRdSJDIyg9AX/J/JPAybu5s
	gHi/Rq5UJ7nBMtnilAHNvMo88HZIHuyFWrlh97xaeaz8V5oFpULda94dAF4aXbO+DpfNJQ23MJ6cp
	EqUPA0k5AVFu2709SvL6TeP1rbTAniU3Pwu3JX2qcJyGW6if/hh2Po1SBbuKP8Bt9ijT+XD5YmjXb
	xfRLhn5jhwRIr3vxhK3hgxz7FCgGxSQ1SzyyXupdUgwd4fUJByG86RSlGdrtG7mcg8WCOgD76zuWs
	ewnRIWWOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leV5M-0034Kb-8f; Thu, 06 May 2021 03:54:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leV5C-0034Jp-Ss
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 03:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3ssKSC8n9KHORINL5Vc1/i0w+XZ3G4YdGoYprLz7Nbw=; b=Xs/hj70YmBEyC3wO2Hoz+89xUS
 0zVuG7ZGvuA4LICMkYqQMbMYaCvTBASRJcINdI7k0RoNPmnkx1YHVO3fvv2Qy1Xh7Fk5saC+7OBuj
 ZhfGIno3c7KlVH09lJtRnBWHaCWGX4fwQDvq8gUdHCixJjfH2jkHPjNXhG9bGspl4encTDKjOL3EM
 sTfpW5vstz0X6rV71raDEgHiBI1OoHNRVZOZIXHHG5MWbfSQfNoKhbQIC+DmOu5uiX1sv234cYNxL
 G4LbpbS47C8vTaZRWaFxSR6oWLpJ1qpQH4c7Sko2Hi8uLHx5AJxShlsnB7InSgbdoOui1zsQyR6RS
 swOwlIRg==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leV5A-005ZVq-71
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 03:53:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so2718420pjz.0
 for <linux-riscv@lists.infradead.org>; Wed, 05 May 2021 20:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ssKSC8n9KHORINL5Vc1/i0w+XZ3G4YdGoYprLz7Nbw=;
 b=i1HGlD/Lk+CuVeteD4vObFD67Ofvo30x/qFEQPuL1pQMtdbjSvDpp1x0E/xwKVYmrd
 jo4Eo7up56dDxNwtCSePP1Z+SRAIK3i2ZxJ6enDDxiI1Mf9uiVtr9JfwQjNSj+ePS4NO
 PGqT7KT97dvXEw/zmN3ESlqnadv427qXJZGzyPEo30nVbt0uIZAqTMRVxsU2056MaQ+v
 i0Uj/jWfN0zotoLBWNjf42kQjpXsW5K9xRuCMVg1dMVXcbrj8A9q1T+MPIAnqJhkaTe1
 kKM0Jbuu4h7DZlKu2+xDDUXKLYR9ml4repihQ6jy2i41rdntPtk+209YDIG+VHHHGM7J
 EMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ssKSC8n9KHORINL5Vc1/i0w+XZ3G4YdGoYprLz7Nbw=;
 b=lQv0d3MOXtpLF2GJBXqQ9LWTJkbFak/gw73IehcXBC7O65g7hH+8HaUyzJzdKTy3d0
 bj5+2dAJsSfHkHuhZVpEocmN4bWh0VOHRJTyvWREz6PjKE6dSsRHwo4uNxHIpjBatnMt
 8dU/vs5wessFOGrmD9JKjDc3JioGC4IfCD4+YxvJyMEWaG/KX1Xsk4H24YDSCbbdwy95
 yLropek4dOYIk2A/s90fIrfjDFHjdYsw1YXHqab4/4Bg0nTVLhybwjn1mdi9EkF+Jubv
 lwNgg2kAOCfaCZI9OYIPSZzZnv3q4Zn3c4Sz50yO6hj4pUv4vv6+x2IjDCnG8dLyZ+Nt
 zUig==
X-Gm-Message-State: AOAM531xTQ0LLS1oC1Ye/idibf8lin4oNjy0BAcjw4gJSc/H8T4qKa5d
 uxdhrTuzAUNK5Z3bZGC/QxU4vzjcYmvt105o0TU7Z4bk5DWkWA==
X-Google-Smtp-Source: ABdhPJyhEGv6lgvscLKgMbXgGY/E1B0TF6W4zJvHQ8udKuXjO53qgMkze5W6xvdihDULD2ti3s3Jz9mFBxO7gjKt3vU=
X-Received: by 2002:a17:902:8f82:b029:ed:5e45:d1bd with SMTP id
 z2-20020a1709028f82b02900ed5e45d1bdmr2192764plo.34.1620273226100; Wed, 05 May
 2021 20:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <1619683116-196404-1-git-send-email-vincent.chen@sifive.com>
In-Reply-To: <1619683116-196404-1-git-send-email-vincent.chen@sifive.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 6 May 2021 11:53:35 +0800
Message-ID: <CABvJ_xgayEE9-RfyQOeBuwKxzJ+HAmA=y0g0cbfNCZ3F9dnHFA@mail.gmail.com>
Subject: Re: [PATCH] riscv: enable SiFive errata CIP-453 and CIP-1200 Kconfig
 only if CONFIG_64BIT=y
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_205348_335066_C5289518 
X-CRM114-Status: GOOD (  18.39  )
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

Hi Palmer,
This patch is used to resolve issues that occurred in the "riscv:
sifive: Apply errata "cip-453" patch" reported by the Linux test
robot. Is it ok to use this separate patch to fix this issue, or
should I re-send the entire patch set including this fix?

Thanks,
Vincent Chen

On Thu, Apr 29, 2021 at 3:58 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>
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
>         bool "Apply SiFive errata CIP-453"
> -       depends on ERRATA_SIFIVE
> +       depends on ERRATA_SIFIVE && 64BIT
>         default y
>         help
>           This will apply the SiFive CIP-453 errata to add sign extension
> @@ -32,7 +32,7 @@ config ERRATA_SIFIVE_CIP_453
>
>  config ERRATA_SIFIVE_CIP_1200
>         bool "Apply SiFive errata CIP-1200"
> -       depends on ERRATA_SIFIVE
> +       depends on ERRATA_SIFIVE && 64BIT
>         default y
>         help
>           This will apply the SiFive CIP-1200 errata to repalce all
> --
> 2.7.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
