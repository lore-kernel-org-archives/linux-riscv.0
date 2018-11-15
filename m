Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEBDC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 14:59:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DF02145D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 14:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aw36m16p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SEk+Wt4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DF02145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vs73hPDrnJWzIsGpdRqhnbv74dw3OQN0HGUiipwKvww=; b=Aw36m16puI24vCChV3mRzFCPc
	xIsGy/yAkMhnuh04ZmM+sLSsf92UKUF1u2Xhknys4TV7PumT+0RX1Q6PddBA3aalzEH6eKAvcjTYL
	jYcZd0Tak87rjG4Hum87kfN0MAddU3A7AhXnt7/Yz8wvh/8hgodRElHQtmAuIPp15FDRUZXUXBL+/
	o/iZR++5N8kF5BNqLGZYWB9LkMIV3FQZuFkXehq1X0X/w1MhmXX+MwuwluvAAudtzR9qU5m/XFk2J
	hHpyyfNj3jjrbcS3uXrRqFb+hQ8kTVaeZDqWPEFVewOhObOmx6Ey+N3Ib4suMDY1eCJXn3J5EMxvQ
	dhAd5cHCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNJ72-0000LH-30; Thu, 15 Nov 2018 14:59:20 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNJ6z-0000Km-9c
 for linux-riscv@lists.infradead.org; Thu, 15 Nov 2018 14:59:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id v68-v6so9832812pfk.0
 for <linux-riscv@lists.infradead.org>; Thu, 15 Nov 2018 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=24JG3cUKzQWrcKQyIOLhenCWTe3cRMt7frjOX9/e/2U=;
 b=SEk+Wt4WCYLIr1NCgAvQlQB97RcZg4cCG5VKofuQ3NE1+GDriRyCBm/xgY+uLLsnt2
 IO+miovqipaPJ2Hz3fT2L5KXCc6HYr1rWAM7JtRQe0h0SiGBSwbIWrXnmgZiKGJaXPJy
 aiEybmsg95bXcrBeKNwMdfbZta+v3nz8zQsSJeeGJ0K523T0hSGV1EHGsyYBzOIksaIE
 g/WvFh6LrnAco18uNvzDAJVEJkc7eD9dB7Wn9fjjUEdjjWChOOoi0L4LFj2zOa8I3a10
 gnq+msRduQHYJnildlvMAXEMIVxTEwGqYFcalh4RutEev7g2feee3Y8GTvmJEQhiYG/g
 xCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=24JG3cUKzQWrcKQyIOLhenCWTe3cRMt7frjOX9/e/2U=;
 b=m/76V43el1ViHLNSnVwoRX0wunI+/TqdSgyppj0IsSFpVKlkSgbu18tLHIAORntiji
 Etv/dtFVPC74leNDr61nmkcurLI5w3Fe8yGYKr1UyYclh8v59wTS70QmyuPs2PLkzhZ2
 1D06zYUJOK9SgDx5RW53hyMfwhmSLVnxLnHSAH/sEd/yW4eMbOXeHmILhXvCwnrmD/Ah
 /HeJES2qV8ZImPMXNLiWbZssNu8OF/Al1l82NzzEGpJBm3pQlbNw8l3Gf5Rcz3MOiKEM
 gfkCn/dB3eppIAH/WiHsl0pnjOnfmPRmChRWLtPWtVfJNHWecnMIG4J4INXlJjTV6s1A
 t8+A==
X-Gm-Message-State: AGRZ1gKgDi16zo/LS908547AJ4qZRHfhOuF9NHSQEVZiFevQis914cEp
 hmsoXme0DTM59kAJvzHosebmog==
X-Google-Smtp-Source: AJdET5fikEuezpg+8evxWbxaEoQI4neyR57oXZ0MoazVwAMbfZoTNas87zquQZ6VLDC/WpZ0imazwg==
X-Received: by 2002:a63:af45:: with SMTP id
 s5-v6mr6101120pgo.125.1542293946495; 
 Thu, 15 Nov 2018 06:59:06 -0800 (PST)
Received: from localhost ([64.114.255.114])
 by smtp.gmail.com with ESMTPSA id g5sm23690020pgu.57.2018.11.15.06.59.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Nov 2018 06:59:05 -0800 (PST)
Date: Thu, 15 Nov 2018 06:59:05 -0800 (PST)
X-Google-Original-Date: Wed, 14 Nov 2018 16:50:43 PST (-0800)
Subject: Re: [PATCH] RISC-V: Fix raw_copy_{to,from}_user()
In-Reply-To: <20181115002755.24195-1-olof@lixom.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <mhng-4c28d7f1-e034-4506-9ace-40fc2abd1668@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181115_065917_356815_A4699A3D 
X-CRM114-Status: GOOD (  16.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115145905.hQRshc_lJDKB1pQ3_cD-ZzFhuAeWpYzcB7KMvpi8Aug@z>

On Wed, 14 Nov 2018 16:27:55 PST (-0800), Olof Johansson wrote:
> Sparse highlighted it, and appears to be a pure bug (from vs to).
>
> ./arch/riscv/include/asm/uaccess.h:403:35: warning: incorrect type in argument 1 (different address spaces)
> ./arch/riscv/include/asm/uaccess.h:403:39: warning: incorrect type in argument 2 (different address spaces)
> ./arch/riscv/include/asm/uaccess.h:409:37: warning: incorrect type in argument 1 (different address spaces)
> ./arch/riscv/include/asm/uaccess.h:409:41: warning: incorrect type in argument 2 (different address spaces)
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  arch/riscv/include/asm/uaccess.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 473cfc84e412f..8c3e3e3c8be12 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -400,13 +400,13 @@ extern unsigned long __must_check __asm_copy_from_user(void *to,
>  static inline unsigned long
>  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return __asm_copy_to_user(to, from, n);
> +	return __asm_copy_from_user(to, from, n);
>  }
>
>  static inline unsigned long
>  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return __asm_copy_from_user(to, from, n);
> +	return __asm_copy_to_user(to, from, n);
>  }
>
>  extern long strncpy_from_user(char *dest, const char __user *src, long count);

Oh, no idea how I missed that one.  This looks like it's been in for a long 
time, so I'm surprised anything works at all!

I'm going to add a stable CC and PR this to Linus this week, assuming I get 
some time to at least give it a minimal test.

Thanks for catching this!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
