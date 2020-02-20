Return-Path: <SRS0=e4Tc=4I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF6FC5ACC4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2020 00:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AB0207FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2020 00:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmhUDH61";
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="tSQPLOaX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AB0207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CJozO7atPmlLw/HucCn+YfyRqF5QgJrRKFQ1yjCbk9w=; b=tmhUDH61pGyeaT
	jIoJNXV54tMn42pWubZIXXdrx/ZX0cHydvXUR8a8O46yrzmt+GOl6aZd/GTHNFBA3QFijWyR0V415
	bWFBACtBKxwZ9YIarWzh/X8Cqd57N2qAx6iz8j+9TSp0J5/0/xbuRcB+mzMEHKSgAa3qaIjoLsf41
	5rFBS1zaXwiS1piagtOe3kPzmC1Ppjawig/UU6hsXMo6EcgD5KiRGRVopM4zMZ/mr+Hj5iX68z4iY
	WnTt3vc9PM2tnQkUrdWvVXy1D0JW6RXDfu/RJ3xdkk36kiPyOrH9xrCcXRPlnxMS7Q406Yd21X/Ur
	DBzyrW/P18T/NCWtdURQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ZV1-0003h4-3I; Thu, 20 Feb 2020 00:15:27 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ZUx-0003ga-Ib
 for linux-riscv@lists.infradead.org; Thu, 20 Feb 2020 00:15:25 +0000
Received: by mail-pf1-x441.google.com with SMTP id y5so931281pfb.11
 for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2020 16:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CJozO7atPmlLw/HucCn+YfyRqF5QgJrRKFQ1yjCbk9w=;
 b=tSQPLOaXONnvynHKki7Fx00QydkybrGiRzj8B01lgi8jn+pdrbxwDKHK1NGLrnFDnz
 lDcr16AC29GHKOWMON1ZrDaYNw3oR8b2hIwmMoehsWWljYWF9ohTYntenJUoZ/KNgh1s
 tchPkaDFSaoOBPUKm6aWXwTGjEfnwqYsUbETmimdBfT+qxWeWKooWysTv0BoIVww6MvZ
 C9CobIF/4QIZah+7sprkDXWXNa2wssaD/HHBL3Hqrm3iGXfJhbGHX2tvGgJBsSb+Spgc
 h5YGxdSoLg240eAyC+ctIeX56A/Zs11qWw6QCRiKW/b8iJ5mIdgLF9Kn/nA/ggjgHXtS
 KTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CJozO7atPmlLw/HucCn+YfyRqF5QgJrRKFQ1yjCbk9w=;
 b=d+NFHB68pIYe8j/WlDa6aVMM5vom92bgpSqkJdQ4uVpjEKIqRAZsgeoAAYOm8y4Pxg
 TdMbznrlwxSWdwDv2DsltGjvN3WYXZ8MsbnU9yrT2el/jYPLtTow3aWuBIoNyIAfZMKh
 LJ1acT1Hq1Dt0Ck2nbsWxUDRriI8GXVo9oBB+k17RtVkjHsfo+bb+76U8U3NI9whj+3/
 BLb8QcPwUCHpReJfoh9/TnXqSkq9ETfPiZtP7tQCqVAevvspLEwOZcmn8gBZ6k8VUwgZ
 ZKreCEtMCNb7D0rYlOJuUwx2YpVIFK10zAgq9OnieayLvr0+21KtdmNJgR480gqf2wm4
 0s+w==
X-Gm-Message-State: APjAAAWwhSxSndkIRRM+7VS+hu1NUZJzgGYolW9uWWhBNBhBoZaZwutV
 sZnExlgOA1J16F5+2WVbIzwcZUZ2jog=
X-Google-Smtp-Source: APXvYqzyzRzgMOKFA5yJtMyEoQUvgGloydcs4ySzKn6OwAc+RpzdCHm+E0j7zkuInnV+e8pcDdOyxw==
X-Received: by 2002:a63:4c66:: with SMTP id m38mr8287270pgl.313.1582157722283; 
 Wed, 19 Feb 2020 16:15:22 -0800 (PST)
Received: from localhost ([2620:15c:2d1:206:90e1:f7be:ea84:7f6a])
 by smtp.gmail.com with ESMTPSA id s124sm789516pfc.57.2020.02.19.16.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 16:15:21 -0800 (PST)
Date: Wed, 19 Feb 2020 16:15:21 -0800 (PST)
X-Google-Original-Date: Wed, 19 Feb 2020 16:15:16 PST (-0800)
Subject: Re: [PATCH 01/10] riscv: Fix gitignore
In-Reply-To: <20200212103432.660256-2-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-50639d39-1b5f-4384-a54d-1f719170d398@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_161523_665341_F5626C29 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Feb 2020 02:34:23 PST (-0800), Damien Le Moal wrote:
> Tell git to not track the compiled boot/loader and boot/loader.lds
> files.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
> index 8dab0bb6ae66..8a45a37d2af4 100644
> --- a/arch/riscv/boot/.gitignore
> +++ b/arch/riscv/boot/.gitignore
> @@ -1,2 +1,4 @@
>  Image
>  Image.gz
> +loader
> +loader.lds

I've taken this into fixes.  Thanks!

