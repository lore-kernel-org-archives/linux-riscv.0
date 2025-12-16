Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC01D637B3
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In702yoS3QUNdfw3jCYF6xfq/2hJ7vR8dqSnUkwFsLE=; b=I2An1lmQuiGGJH
	n6sFD/jppjWKkh94LoH5cWptMYLDTRlBLejoq+ssJRHNhQC0UvuQpBxn7cfXptSW/QRwOYrBR2m80
	sDYlhDt/0Jgg4sNQcIqLIhhzatd9SlGtRr+5hG12u5WGtIkKEAGDDoCmPcPTfFQnwj0DZEAiT/TS/
	LDKUeDMv1KK+1aTIuXpgTnP6rWcegY0RRJWKMreXmZRgM0dmmphmCpIhoaz6lvGFlQQJ9XX0TCHgc
	lY3GuvvHsVsByLYT18g2Y6IX8wtvIR+xi3ptHYES7ofxLtE3JWZdFo9uZU94KShvoN24mJjZDXb9l
	CHa0NiOUrNFqstm5yO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdpv-00000005ucX-0Teo;
	Tue, 16 Dec 2025 22:48:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdps-00000005uc2-2gpf
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 22:48:05 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34b75fba315so4645312a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765925284; x=1766530084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9rGdkbmWGyQJZ2uzMV3zz7cGEtt/UxhE/bLykVRNgg=;
        b=lGXByKDZ//Cuuz0NNGC0MzZmni7/4r92/fACxhPCXCXDu7bEADbZcsu1LBEIYsGufe
         L5s7k3oyGC7lmaaZq3W/bkjHI0j8kFQixcMdWH539h22RsfEMVySHPlLLlVcYFRzOzQA
         pQyFkeid8lU/tadrNZCq9dAr/9Xw7fX6k2FtQAt+6iMIVCNB/Hi24I+xSpql1CwGNnki
         aJa8qGW/0WDsPorHT+X13SBaY4XODufD47hu++57bl+eRjzEktwnCvTrhDbbHOp9D8Q4
         wAJu8Bn3WNMvRru8BFZRAdjdHvURmCOID3zwVeYPrIOdmmR6WVBd36HvJ65zXZ8G7m1r
         Y6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925284; x=1766530084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9rGdkbmWGyQJZ2uzMV3zz7cGEtt/UxhE/bLykVRNgg=;
        b=Oa6fKn735Xd4wnlon2yxiiW5+V2Cb1EGKM37qrz+32+jNKp+sEohTHhpgy1NJHLP2O
         r+f6pI2CIEN4icNRbnddX1KAZwF/uApu4wDPV0ghD1y0fdRbpfm1F0PswOX6UXMyKCDI
         Nh80cNVqKeBuCh50g3pbzuoO9bSa840oDqOjNpS+IVnltwoY3jDnheyH/r9fMLC3iULf
         R16pfW0LatuFpv9GyZdGnYrU6PpJ7A7i+Ad4F+cIZ0bFguy97/PeRRCffHwcDyfTLN2r
         Qo3pCNfMr+5hFwKImfk6/RmF51UTICBfuHAvFT/EG9vw10/Ichey9zvIr2MVwmycAlJ0
         FtpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV2ax/VpwpzMXkjZ/4AZ5q3Ikfpe7Xf9X/mWMRsAnjAFTDUSifoaM8A/NqgNecuZSsUiMHdgTbma8K9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo+o75J3x1F7ZGWyaoe9RTx5u5huwdZUuFVM0vI6kCsobD9Dkp
	eaXjEChtpDCagKKPc8Bk3+S+uhWJwtqV3JU4tzj/RGR6pLESTFJMfqhF
X-Gm-Gg: AY/fxX5OFF6zVD7vP5vxQL7VKKS7L2hz8XImK2Uu2JikE/vkEAZK6cpumWlEcci092h
	t4jjDiLPXWd7hSgO5cSqIGap0tP3n6OnwzGkxq0BRFh6DnaENiYVzTgTlcsEb49Tyfej6fvU8Dx
	5yMw6Jmmi6V7htgCuv5jw5+o6mMxNeLIE75le2rYi/d9xUGNK7H/wSWN1KZJYQknD/g74bNrPhU
	stdduECZbp05kJH9vg2Wew++s9/s9umRF+AJNVlBAmtSfFFR1mgM9l7xvMJuLfWPfVWrVS6rGUZ
	/rVzBvzuFOw5jR/3V2iwAD9AZoAwV2Wpu6WokxwfDziC95lVQhmHRLby0IpjVc7IfgRYDkQH62e
	G9kx9LGtVz3E9S3DEnjmDPRa9xgXvvPYR5XaexvdFkCd/KrnHOIkRcUhfcRnN1Q0Hd43hKEOdRw
	DRFmrjD9Z4Ow==
X-Google-Smtp-Source: AGHT+IGpN9v1EcQ6pUGv0/ADFBj6VB7V4djHe72YLpgDuXNgYHZwaOdWyf2CzcAfbqYS8D3JmbWdkQ==
X-Received: by 2002:a05:7022:619c:b0:119:e569:fb9d with SMTP id a92af1059eb24-11f35484a3emr12886397c88.12.1765925283458;
        Tue, 16 Dec 2025 14:48:03 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm39814598c88.7.2025.12.16.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:48:03 -0800 (PST)
Date: Wed, 17 Dec 2025 06:47:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>, Brian Masney <bmasney@redhat.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, 
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <aUHgy0jzZk-oSUuO@inochi.infowork>
References: <20251214232938.668293-1-inochiama@gmail.com>
 <20251215221202-GYA1903981@gentoo.org>
 <20251216144845-GYC1903981@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216144845-GYC1903981@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_144804_683632_8ABCEB0D 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Dec 16, 2025 at 10:48:45PM +0800, Yixun Lan wrote:
> Hi
> 
> On 06:12 Tue 16 Dec     , Yixun Lan wrote:
> > Hi Inochi,
> > 
> > On 07:29 Mon 15 Dec     , Inochi Amaoto wrote:
> > > For build spacemit common clock driver as a module, the build
> > > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > > build will fail.
> > > 
> > > Add these missing hints, so the driver can be built as a module.
> > > 
> > > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > looks good, thanks
> > 
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > 
> On my second thought, since all functions only used in spacemit clock
> driver, how about using symbol namespaces? please refer the doc
> 
> https://www.kernel.org/doc/Documentation/kbuild/namespaces.rst
> 
> or check drivers/clk/meson/ for example..
> 
> -- 
> Yixun Lan (dlan)

Good to know, I will change this in the v2.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
