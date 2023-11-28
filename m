Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BA6C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZVz9W2CZL0c6w4wv8j9tp5ihMAO8RJp81I5jQdVtIbo=; b=yYXwVlDDM6UK7Z2kCcaY2K6SLD
	YnxLRXFd1tJ/fgdpBUaALyOn+HAd4edY1w5yaioVPfEjQHBK+ObEKS5PuDulvE/EHJJC+xK7UAHrA
	NUhuFJOzY9oDgqeuPODnnLiZg7Rp12LD3f4XLGQz+Ux08kGabV6ghCFFuuYv2H6kRJ4RaR8cvwaLm
	ALmvqApx4W5FwzruAqp/EbnZEurbC6f36r9CmvL00CExEOikrK4iCruXbwNW8ZepwgKv9zLcx/Mdz
	F1d/emUsM0DW6Wqs4JK2Sf9EOCDIKD1vsuRvDUOTnhMl9+iT3AlIhazkNafZpmlO5rg09BPbpOgWp
	2rpx2sOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7x3x-005Hki-32;
	Tue, 28 Nov 2023 12:19:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7x3u-005Hjq-17
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 12:19:36 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 81CB742239
	for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701173967;
	bh=uYedx1kMhUbEA+kuU9UITe5MKMdsTFO44y0m5L3etwk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MWL0UUoBPU1CjgVnx8hXY8UMawBiK/VYSljvGu7PRI09t1cKAh6bufouxxjYt70gT
	 4oMJ7XYr5ddLPKRuw8OKMhEecVeR0xSLsPaUyvq+6zQWICoqQrNnduB2r36NL4IrAi
	 PIgfSHuzUHRYXeEB+1nQvYhajtpdWg4Pf0AVk7qPbbrY+VMxDKo+YgFkL2+HU13mxv
	 G6dKBJhLu03Z+HJyGLV9vXxb5859OhnqvgSOXxbYBfH8rczIt6xSPmfGOFNAYJoHWo
	 eMqMyoudBfHHDG3yaIFfnFOSBtGkjDNm6lDlESIs6GfMfmV+qtyL/g6lRHLsg25gYJ
	 KPTwnitrqswPw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cb4d6744bso66309661cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 04:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701173966; x=1701778766;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYedx1kMhUbEA+kuU9UITe5MKMdsTFO44y0m5L3etwk=;
        b=w0IyI2xVd+OVndLdXSG2OFO7xBcY4P6CZjXJTFYIK+WBtpZbgtbleUlTl2vAIijgum
         Uhr46/elNcrikGRvHVbYMwMgz1WR0+HJQ4famVEMzaVLgH7MvKLhoMcorIgPWkMf+AtC
         n9A8HmIuSr8VBPZmOgdf4B+1SHcKmE9PVHb+EOndDJE3uOx+Mlgse0mYTg6ub0L2OKbs
         VFii8LjrHUIvd8wdSLbkC/LfYVkKWKZysXxKEn7zHH53wZYv0BHvWhRUb+wa1+ybfLLP
         av0AFzsfLGqcG8JfiVjYhHlWK/dCzme8if2UsyYaiHyiGBSw0fgS89pK6cD+HK26tieE
         xt/A==
X-Gm-Message-State: AOJu0YygCvBfxfUDHRecvYKionHtnwgDgRr7pYIP5pM+moxe6XRZUaZU
	YkOLM+vesIjRLRe1BwAyPEq8uJY+N3/CGZrOMm6Lzk3ScCVcDVynCD2F6d064yOIVJVUI1v5MkW
	Yn3W1WpGLrdVOzDrehbeAHxya9UorIKUAczU4IBiz2VN6W1y/E1SC/c0mCVCZOg==
X-Received: by 2002:a05:622a:1822:b0:423:8b9f:3a03 with SMTP id t34-20020a05622a182200b004238b9f3a03mr17334983qtc.26.1701173966547;
        Tue, 28 Nov 2023 04:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJjoyHA1G7hnpvnK0Yo2j5wPzeLGKzyoXlUzlcjPEbCIr1AWDnb7cMjq2gi5zvUeuWdkCX9ZH/CjM2tNtpp/M=
X-Received: by 2002:a05:622a:1822:b0:423:8b9f:3a03 with SMTP id
 t34-20020a05622a182200b004238b9f3a03mr17334960qtc.26.1701173966287; Tue, 28
 Nov 2023 04:19:26 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Nov 2023 13:19:25 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231126151739.1557369-1-masahiroy@kernel.org>
References: <20231126151739.1557369-1-masahiroy@kernel.org>
Mime-Version: 1.0
Date: Tue, 28 Nov 2023 13:19:25 +0100
Message-ID: <CAJM55Z80u-0kmMkZDXxiiSOxktSHcSU_7CC6BwnK+3O2P-4=QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: remove unneeded #include <asm-generic/export.h>
To: Masahiro Yamada <masahiroy@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_041934_796331_8438DDDA 
X-CRM114-Status: GOOD (  12.10  )
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

Masahiro Yamada wrote:
> There is no EXPORT_SYMBOL() line there, hence
> "#include <asm-generic/export.h>" is unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!
/Emil

> ---
>
>  arch/riscv/kernel/mcount-dyn.S | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index 58dd96a2a153..952233aa273a 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -8,7 +8,6 @@
>  #include <asm/unistd.h>
>  #include <asm/thread_info.h>
>  #include <asm/asm-offsets.h>
> -#include <asm-generic/export.h>
>  #include <asm/ftrace.h>
>
>  	.text
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
