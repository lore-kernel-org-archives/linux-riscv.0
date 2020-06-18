Return-Path: <SRS0=VJSH=77=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58764C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2020 21:53:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D36C2080C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2020 21:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9OoeFuY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="LTGU1jJT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D36C2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SL62Uu0LgT8DtVpQ/K6bjtvmgLWLSYUdlf5vO/HvI34=; b=B9OoeFuYZujiJr
	8uiO3+1o0nFzOJ/CMDK57VcrHwRiFDu/Q/yVOBXHj2tFqIpKJjSd2YmJuhxu/1H3RNdkYFsOzXqtG
	ipI5AS7w4qYACAA4kq1F9rE50PfT5MNikxqUK8cdqjm0RHIizZLIdxsR1SsQS6Rn848WgdI/tySWw
	ST7L8nPV7y/TlllXvaKqylM70n4xpFWNpl5deNoybFKAC4Plgif3tXbyFKb5U9btIW19re4gVLxNe
	7qATsjIx7PQAWucxdMoeCHRbO64GasAJ8JoOvr3CJC/X4XufL+tQQORpW6q+vjvDElVZSwg28mrY1
	lAF59VWYm+sgF5GkQwjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm2TV-0007rr-LE; Thu, 18 Jun 2020 21:53:33 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm2TS-0007rX-7P
 for linux-riscv@lists.infradead.org; Thu, 18 Jun 2020 21:53:31 +0000
Received: by mail-pg1-x541.google.com with SMTP id d4so3549720pgk.4
 for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2020 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SL62Uu0LgT8DtVpQ/K6bjtvmgLWLSYUdlf5vO/HvI34=;
 b=LTGU1jJTw0oLZ91IEIjG06MPqIFPLWfhDwJ2yEyAiiXtrrAsPByVLHgkbIOo4TAFIw
 RmPLzHMk2Edyw937No8I8BP06DQVmBUQOvSUMR2e+Lkb87i9gLXp1BzFLG+CaPtcN+Pm
 E49eOtEN8yuzfqqCFzlEw0mXbip0RhNsYM2wNaUabSOCyZHPYFu2/rJf3G8WLwvs9BFP
 IgwcEmLH+tID/DGrutOjcdpTf4h69OChRW3UGDPM53KRDMDdy3lxawKLUti+kdzXOqZ+
 IvwFbzs4zJcl5enNIqS8fw8GOvPxEf7/8iE+HHAcaSdsx7HNkArXhXmX8uKB+Nrx/TAY
 ivnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SL62Uu0LgT8DtVpQ/K6bjtvmgLWLSYUdlf5vO/HvI34=;
 b=FzYOVPpHS9riZe7fCjmUcZfN8N9epyjHNdJIz0RJ5LXaCvOz5lfiPfmUm/KK8VYaDE
 JSAfXiCkRD7XVEbnlL1m3OdLXEPrEV92aREid+urD550hROtii7mvbep8Z4dLe2tY54M
 IPWNyiQ2xbOtB5x3QDvCyMhzDEpYe3X1h2dDxiTb315OeOauenMa96ALm40oYVu0PsBM
 ypjen35mXAGp4gVm5jWj/nmq1s+5I42QuKgwsBEY8iwyeuX/BgI3yLvprcApTwveyOaf
 6+7JS8kgYGb9qfCgQa3hCy3eLRQtPBK9nhvoK2ND7rXFehNjUtjMC8WA142552yx0k9S
 MEuA==
X-Gm-Message-State: AOAM531ciyCMEUHLQTA2tnMhc+KKEbgA72XpdPsc15rduwH9U/Jd8cKD
 w4rBgGJ3j00Z12/EO5Bt0zAtIA==
X-Google-Smtp-Source: ABdhPJyClNRLpobqYjvvoK/HvLfe4HfcZSZBRB74Q0SEc6rjFTHhysdlLKXiISI42p5kvPX8bTLHRw==
X-Received: by 2002:a63:235c:: with SMTP id u28mr492586pgm.278.1592517209065; 
 Thu, 18 Jun 2020 14:53:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n3sm3141734pgq.30.2020.06.18.14.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 14:53:28 -0700 (PDT)
Date: Thu, 18 Jun 2020 14:53:28 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Jun 2020 14:46:07 PDT (-0700)
Subject: Re: [PATCH v2 1/1] riscv: Select ARCH_SUPPORTS_ATOMIC_RMW by default
In-Reply-To: <20200605051510.51590-1-maochenxi@eswin.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maochenxi@eswin.com
Message-ID: <mhng-14ddadff-c517-4156-90a7-86d44a2a289a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_145330_266111_CB319F9E 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, maochenxi@eswin.com,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 04 Jun 2020 22:15:10 PDT (-0700), maochenxi@eswin.com wrote:
> Select ARCH_SUPPORTS_ATOMIC_RMW by default to enabel osqlocks.
>
> PS2: Add signed off info.
>
> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a31e1a41913a..cbdc605d20d9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -68,6 +68,7 @@ config RISCV
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select HAVE_COPY_THREAD_TLS
>  	select HAVE_ARCH_KASAN if MMU && 64BIT
> +	select ARCH_SUPPORTS_ATOMIC_RMW
>
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT

Thanks, this is on for-next.

