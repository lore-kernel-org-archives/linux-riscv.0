Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B39C3ABDA
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZPT+DDHdmvM73rWVP/0LvWae7MaQqnqR2pxUVIpuFY=; b=LJe2olaXVXB5TF
	4+J4PPgJz7/bjuSB/jItaCbWskajsTcWS6oH1V6hHLgIMHjFSTkPVPB8c/QQd9UPVr0DJ9rrXwNRo
	sPVLk/tJQScNJlZi9lU9pDeFDowUVkBwa1XicS5H1HPOJnFaTMD7OWO5lp/sUwlsXW55I127YmzB6
	t4GbfCs6H3El+n28s91EhD/+s0ldzPqaM1EI8rM7+/ryunofwThwZt7RviKJkrf0Z0ApBZ71yPzmW
	Z91QCk6NbXC0GvbAIjGGdT1KCSq/CcDjj7QWY0eJmySet1Z4TR4KLzAE1iRbJxC8UA72LwhsA+M3s
	XGzXR0o/3CpU5qv6IUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKYi-0000000GVbG-1IIX;
	Wed, 14 May 2025 22:26:40 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKYf-0000000GVau-3Xcj
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 22:26:39 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c5675dec99so25243985a.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747261596; x=1747866396; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8WzUMbK9qDOEyYdDVvObbmZCXxUEIqd+QHrspXvgLY=;
        b=Y6QuRpbvJK9wRP6tqOBFOiLZNC54EURQ/vt9a+6ePR1UjJt8JHxkmNA1Ac6JUO4AQ0
         wLmV1x0TvZ1RNvxsmrTizx9ws8CQsLpcZYN67B54IJLbJhQVJxLZpIDv+pwYi2azsVqA
         LDc0ZNI7Prcf61MovAF0SJmGtsSz0GmvwedC2zwphOGrAK422HvqYo1OkTb/BYs9dC36
         4kDWxIv0zrLDFwoJ4zWL/9HqSsbJgp7G5euGnJV05J/xafHHhgiFHyi1wJAVIY+1ErK1
         EloKeXi1szkfzrNZmLoWaObTE+KAzUW6EFOYtL8mms6V9SwK3NMLjoxHjfR9K+DqML4r
         fFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261596; x=1747866396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8WzUMbK9qDOEyYdDVvObbmZCXxUEIqd+QHrspXvgLY=;
        b=mJGQZsPjDcilhL7ZVBy39yXJqH+FBgMZ7pWBYF4MLoHp1LIRvz8tle0wPRugOpnWJX
         F0h29Nq71uZn/R1BirT5dPpGxDZx61N79Mn3O+M8BiFF2/1wUVOhJ55Ra2aRIIRNO3P6
         LETbZWeVDjXVqf7+Y8gJTXhzuacLV/fG2qaXnA4st6pqBUejfg5lCbtqNtQwrcZxGpiP
         jelgV8DfLCNgwpFkPk9Rt0xYGSYcpK10ZCFJ3b99oXIU63J/OZ91G3yPKgGuUcQywZzQ
         AbP46jr1iHzlAATr2xqZksO4QZ9rvCOTO1ZWCiamIKoN/gTJRtcjqDU0t8uNfi1s03LD
         WUSA==
X-Forwarded-Encrypted: i=1; AJvYcCWlymRwTY5Inaw2zG2pX+C/sLB6my+FABPwPfwIYjcAP1QQb2jZ5WnGW8pV4jsqcv2iQ+sTcPpUy0jS3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXayO4Hu52qrMbcqd9BFaNaJOt479+uKIfTyuYT/xAWtczpQ4G
	7TBkQchrD9FjrYlCsWf+vovfnLO+wAczm9QPr81DWzsL1TGAs0oh
X-Gm-Gg: ASbGncsEcCVa52/+AfCProlk44wW4PJcHtihz0SwmqirZ7HwNn0j7SCQjXPR0aow6hC
	O6CiSc7hjfY4rR3UKL/QPm2Gn+KUiFQATTL18czCKQNolujajfL91cwuq3BGONbxr+ph4w1SNTV
	PxNYxtTyYFGZ6N4uvj2nI6IEBOF7VfvBNdbjfN0N2gyeAol0d139mimgqcGLbDUE+bl2e0uu5C5
	lerbndg57L1orgfh6Ypz0CR+tz/Qgn1E+fjkDwoL/RRFADBuhSdHuSRe09Ovh6kbBTKGf0YVqsJ
	/ASrQqcDPUstUQSFx8SB+Bu/ZZ8=
X-Google-Smtp-Source: AGHT+IFCPVi/HY6nkbeTe3GAvpoQfv29BrlN1iWGz0H9o77nmmRTrZnt07gCTVHpLkHuJ4hlKEVttw==
X-Received: by 2002:a05:620a:2904:b0:7c9:4d96:24ce with SMTP id af79cd13be357-7cd28846e7emr739361085a.44.1747261596342;
        Wed, 14 May 2025 15:26:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f4e0f3sm899305485a.16.2025.05.14.15.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:26:35 -0700 (PDT)
Date: Thu, 15 May 2025 06:26:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] riscv: dts: sophgo: add more sg2042 isa extension
 support
Message-ID: <qz2kywcmxx2ub4bycso3y4qodiaeddj63nclissppy5morsjqt@jci4bapl2afc>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_152637_892220_3B771824 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, May 14, 2025 at 11:15:49PM +0800, Han Gao wrote:
> Add xtheadvector & ziccrse & zfh for sg2042
> 
> Thanks,
> Han
> 
> ---
> 
> Changes in v2:
>   add zfh for sg2042
> 
> v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/
> 
> Han Gao (3):
>   riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
>   riscv: dts: sophgo: add ziccrse for sg2042
>   riscv: dts: sophgo: add zfh for sg2042
> 
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 512 ++++++++++++--------
>  1 file changed, 320 insertions(+), 192 deletions(-)
> 
> -- 
> 2.47.2
> 

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
