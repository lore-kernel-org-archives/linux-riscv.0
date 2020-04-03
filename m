Return-Path: <SRS0=G4ZZ=5T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBFFC2BA12
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 15:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041082145D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 15:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YazuDjFn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="CUidE9OM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 041082145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=owgGAHZSGNRil4KZ/mw3izwPWS/tP0UsXJUitXCRVu8=; b=YazuDjFnWcbzwV
	IGfpBlv3SO0HM+EoccSZFSvL3a3S1KT8V7Ix5XUpD9huMtJ3Y/g7/e4bx9mVoltNStfr9ocl//lqC
	wShUaEQTo0aOHPP3evBzMTTH7Am3pxbeLGZ2HJp4zaAKe01CpHeR7lttvRPbwy7AsHxwtZwQWlqbK
	pkC9h0JOLvfZ5cG5rT+sbHrjFHqi6/jO9kDDYbRBQW+bncPpJjMzKVq7OV/Wyn7zYMLoeJ741q2DN
	FzKHjGWQHUrN5rT1aYUJKLAtoRXAzlRx4BgYWRsu6HTF0b5/RBVVTD0CeRS1bBGrqM45cPCUPSFK+
	AGDDgqgMp3zgynGeXEiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKOdA-0006JY-Pj; Fri, 03 Apr 2020 15:53:16 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKOd7-0006Ir-Fy
 for linux-riscv@lists.infradead.org; Fri, 03 Apr 2020 15:53:14 +0000
Received: by mail-pl1-x643.google.com with SMTP id s23so2814055plq.13
 for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2020 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=owgGAHZSGNRil4KZ/mw3izwPWS/tP0UsXJUitXCRVu8=;
 b=CUidE9OMULKs/p+pZoJ2W3cCMfdlp1mq2Ce4gohC0F8wlVWB3a2pfxjRPX6bwvyA3Y
 /XTWjfyag+RP6/6ZNEqe1Q8TAQU5L7t/bRb1o7QxtRgeokfWSSziQSYnRZOgbJ+Zyk1p
 Z8s1CZWxzZxkCu1f2pMoVq2po2eaivsyY4OalQMiMGlCBH0E8DOTNIR1vBaN5fCiOJbU
 KDuIttH0EQu31c4YTJL6Rr7VTt0uUF54Ic7fwfO4wULP4dUBB3WUwAYgE37gtHNj+e1g
 MNvLKo3LECSkxcCu+jvfPhiJrbvbwXdwl3yMPovkPnSTG2nzzAcAkS8a7hGW279SogEx
 Defg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=owgGAHZSGNRil4KZ/mw3izwPWS/tP0UsXJUitXCRVu8=;
 b=J2FayBMsQ3D/PP7VFueCZqjyAn1/hz0v3L6QWwHD3LiM8fnow4ENFCEwM9nnXpO/FD
 2iHVFZXnJXs+Ws8tzRFq4YyPCOSMH4QOpCKLIp4V3bpGSCiy9lJCZpKGMPayDRL4w35e
 dYv70sB4kiTHiiCd4s3f/tMWhNPi3aU44X07Odnvwa93QSZxAtQu1PTpgYgwFFBXpinF
 19WhG111RlQO+LujH2qqgTg5tV+zRowe5B58E1G2pF2JioXAYLUyDRWhUoXq7DsMRFgq
 lW+z1gpxCfsREKx4yOZ/xLlwu0kRYY4kkEvWMGOwEuBoYX7TYfEUTWdz1pNJmcd392r0
 Gx9g==
X-Gm-Message-State: AGi0PubmllkhZgIGSHyzln72jBBV0niC6eFRc2ss2OcTul7JsWuhGEOK
 GzJHU4YtSi7L1bx3g+3h+CIY1Q==
X-Google-Smtp-Source: APiQypK44jSapqDp3oWFKb6JkHAV3VcWl7yt6FWLfum23xqW7y9mP7dvZQhTjJgPOzhHm88fn1mHNQ==
X-Received: by 2002:a17:90b:3610:: with SMTP id
 ml16mr10796623pjb.106.1585929192570; 
 Fri, 03 Apr 2020 08:53:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w9sm6122572pfd.94.2020.04.03.08.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 08:53:11 -0700 (PDT)
Date: Fri, 03 Apr 2020 08:53:11 -0700 (PDT)
X-Google-Original-Date: Fri, 03 Apr 2020 08:21:21 PDT (-0700)
Subject: Re: [RFC PATCH 3/7] riscv: Simplify MAXPHYSMEM config
In-Reply-To: <20200322110028.18279-4-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-f28ea5f1-ad10-4216-8612-f92863d20cca@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_085313_534938_D27B5B61 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: alex@ghiti.fr, anup@brainfault.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 22 Mar 2020 04:00:24 PDT (-0700), alex@ghiti.fr wrote:
> Either the user specifies maximum physical memory size of 2GB or the
> user lives with the system constraint which is 128GB in 64BIT for now.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/Kconfig | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8e4b1cbcf2c2..a475c78e66bc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -104,7 +104,7 @@ config PAGE_OFFSET
>  	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
>  	default 0x80000000 if 64BIT && !MMU
>  	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> -	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> +	default 0xffffffe000000000 if 64BIT && !MAXPHYSMEM_2GB
>
>  config ARCH_FLATMEM_ENABLE
>  	def_bool y
> @@ -216,19 +216,11 @@ config MODULE_SECTIONS
>  	bool
>  	select HAVE_MOD_ARCH_SPECIFIC
>
> -choice
> -	prompt "Maximum Physical Memory"
> -	default MAXPHYSMEM_2GB if 32BIT
> -	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
> -	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
> -
> -	config MAXPHYSMEM_2GB
> -		bool "2GiB"
> -	config MAXPHYSMEM_128GB
> -		depends on 64BIT && CMODEL_MEDANY
> -		bool "128GiB"
> -endchoice
> -
> +config MAXPHYSMEM_2GB
> +	bool "Maximum Physical Memory 2GiB"
> +	default y if 32BIT
> +	default y if 64BIT && CMODEL_MEDLOW
> +	default n
>
>  config SMP
>  	bool "Symmetric Multi-Processing"

I'm not sure this actually helps with anything, but if it's all going away then it's
fine.  Originally the 2G/128G stuff was there to allow for larger VA spaces in
the future.

