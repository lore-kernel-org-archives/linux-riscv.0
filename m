Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229CFC07E9B
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 23:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E019661CAA
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 23:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E019661CAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0CplPrCY0CBmTJkg85b4lueJuFW4js0FlMc36W+wT6U=; b=2o/976NZ9dWCi90C26GftfP1NS
	ZFjsXA/8RM7zt5dI3JPYQWUSNhnTOfWua5GTan4g8QARddmaQMFuCTZ6FmL+gWym+RIsn+D08f8q7
	kNPqdRtIqFm6CboFTNHoevp1k3aGvxg9VjMewgtAuZvvYkf2H5oyCg2v1krYQy2rJW3y5W00xbx3a
	qZSVYf/cHHb2JaNL6Kkm1jKzp46g0mhfLoBn8M6BM2g0iWKsvCzN90lSsNWAHbWm3b8xv+4ZwKhh4
	droAykAFTAanSfzkLjwdjMbWADdJatvpN5KrpBmn7k9/nzEzKAPkmO57SznTEmKTyllgk0xAPU2bM
	oqd6okuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0uJG-00D0gh-Lb; Tue, 06 Jul 2021 23:16:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0uJE-00D0fu-Bo
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 23:16:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id b5so28077plg.2
 for <linux-riscv@lists.infradead.org>; Tue, 06 Jul 2021 16:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YB0aJ87kDhO/1B2h0F5KDySwNSSX3rvAy/FYrFFVQlc=;
 b=iSZbpF1Xsl1ngnpX0FGs6yoICy3udzry/XyJ/AIEwYcIcs/ZJ4AKAOVmCam8QH0yzf
 FRi5GfEN9HXueX1jHSjJvRHgkdFnWO193rJGFDZnCKRFftHevQ5H5snY+uNDOiWf4hZF
 tzi/CnM/aQ6KMiUKeYtSoDElHYhVWr3H/JLFXKCLpE8BauxEk1hfsmgMmxhLyDONG7iK
 0ZxlNOc1Wy+/LgfPYHrU/4eOjmqr3ouN8id8q1nuBIm9P5EaI1dTnr0Fre4Pky5tiznY
 YKYaOwXfup6MRbBdIRmNdPUWGno9F7iEO5ATLEVo9m9oin1UGHWKbtOdfymYK0bCWMPP
 TmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YB0aJ87kDhO/1B2h0F5KDySwNSSX3rvAy/FYrFFVQlc=;
 b=LfEy4/RKOC2/JjTwsM3Nbn0SJLJSMivdIkKZSZBmzjfUswrEhPqHLY2UmCP2iBWJyO
 2DuIRVlEWRmaIgsXfZoAQHRfwqp0TdWwMSsETfngmyM3eNxSm0tGNw8U0HzKygvSsL4R
 gZo+akNRC3FQunuJhYW4FBv1KIpJ6RB3sNJUUEwD8mN2s4l+pNRPST+Y7IsTdVCxLHEQ
 K9KkH9KhkEp6/FAa9MQea1IY34w7/ngOvejEq9+u5VwpdmKq5ZzYmDmy2E5DLO0/4/Uf
 owMhTwj0OzlNjHcH8Ss0/92mHCHs2vw9VLA7/0DOjPWy2TPpYzOl8qgcFhD+qAVjVbqE
 mBOA==
X-Gm-Message-State: AOAM5323/D0hUrPXiE+kN7lS3NuNc3mK9WqwmrcNjVuS4DZD5UldGObp
 6gOVasFd2aRI6O25xjn//oUp3Q==
X-Google-Smtp-Source: ABdhPJwbPQYkennidxUbwzkbwmIxPNQx7Gpxejgx5Bg4l/zKoHdMRGzrfsVL+jNN6ypruCBkhit2Dg==
X-Received: by 2002:a17:90a:f2d7:: with SMTP id
 gt23mr2664215pjb.21.1625613415584; 
 Tue, 06 Jul 2021 16:16:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y13sm18527251pgp.16.2021.07.06.16.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:16:55 -0700 (PDT)
Date: Tue, 06 Jul 2021 16:16:55 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Jul 2021 15:52:09 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: Fix PTDUMP output now BPF region moved back
 to module region
In-Reply-To: <20210624121721.2828421-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-fe8bcaf3-d184-4584-99f5-6ea4b9144934@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_161656_447675_65B4057A 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, 24 Jun 2021 05:17:21 PDT (-0700), alex@ghiti.fr wrote:
> BPF region was moved back to the region below the kernel at the end of the
> module region in commit 3a02764c372c ("riscv: Ensure BPF_JIT_REGION_START
> aligned with PMD size"), so reflect this change in kernel page table
> output.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/mm/ptdump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 0536ac84b730..22d6555d89dc 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -98,8 +98,8 @@ static struct addr_marker address_markers[] = {
>  	{0, "vmalloc() end"},
>  	{0, "Linear mapping"},
>  #ifdef CONFIG_64BIT
> -	{0, "Modules mapping"},
> -	{0, "Kernel mapping (kernel, BPF)"},
> +	{0, "Modules/BPF mapping"},
> +	{0, "Kernel mapping"},
>  #endif
>  	{-1, NULL},
>  };

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
