Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF87C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CApVTyCg6wbldCirVdr+mE29nXuhnb4+YIM18FFRQIY=; b=XhM92LYgQiHQS4
	EfmiwzkHdtd9YOSdKQX1sZNSEIqGWQS5OifuGraUl/dyMdoPb1jDuTaIfK62N5rEbJ590Q6yTcBVK
	63vSuJ1P5i/iNKpK+kZaGiu7bmgiTQ3mC6AJNW9oPS+bXEMhJIwkro+6G6rW1/eFoqCQ6EHIJzJ+3
	gVWpLKuST5fErHRTizRPOMtvj46zyRX2O0WB6SunLp1IwQgxzok8PAlIHI1xOvvfU1TpXNYmzz9cB
	CXPEbJYE/wO9cG3y9Hmhd365Nf5xUvzCgVJ9ZGYpHKx4lw0qjYQvdYHZvAjeDgg7Vgv/K1k6gWj+9
	99WCs2UObqFBazq/00mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3yB-007TCm-2v;
	Thu, 10 Aug 2023 11:36:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3y8-007TBL-1C
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:36:45 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F1BE420B6
	for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691667403;
	bh=GbiiR39UCc4MIS05Cs+xA5vgxUMTWHglh2uulV8ScwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Hkeheb4k09GzC6uApu066rW6w2wcF3p3bFXuhpNfV2tXmpZQV7tdByDLwAuFA2FRo
	 v6SPB3FQQlIp1pTEf/qzu/x56BU2/RlaZqdHlsdex5VgD/sY0MDFTHvyys/v6aXqbc
	 /uYWsHbAQoBgLD23QClmCP2c+dMecB4JHU9sWZZkjOp0HD98D6XcLQ6474UFCU57p7
	 RRN7gKwcDO/q/lJrRzxenjmBq3AUou0qc//QqRadSnyFU9zVEeq0Ireu83exytjEvJ
	 L3Z7S86ZDMP8c+Zg5y/8JO8NosFRiTWFJ3R/hbiO5keFHEjCw/zOD9ryUl5M+fovN7
	 tQoRrMKqbAKvA==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-40ff67467c9so9722901cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 04:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667402; x=1692272202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbiiR39UCc4MIS05Cs+xA5vgxUMTWHglh2uulV8ScwE=;
        b=hMOFgo5uAroYpmOtyOC1qnC4lXrOJuU7zplZI3EP7IHaOK94XUquQ6AB0VVUYY+lRh
         UjaY1xfgm6P8p5qtrUUUtPQYmXAFVrIYYrGoyQwK9TeYRaqqjOUN4Vds8qhcwD1r6C0P
         GSGGchmaakzVE5gk6aSiYFE/TG7ApElXiuAAdqj6Y3WjtbuFlIXTswu+XwFYGf2IvoZe
         8Gnf8Cek1/Za4p0oxITMJiVgamRg4zFUY6s/qN/fCdsNsUvqTMSVJ1BhT9/3n8znEHlG
         72p7tbmVPLuP8rsQ5hf51Sa1mt4lfIJ976MPoqQlzHaGv29iornVMR5U9LgGO/Kkk+9X
         gNcQ==
X-Gm-Message-State: AOJu0Yy2dlTUUSs7C/bqrLocc8RGxBD3uDtEJgUL0UlUIfZzIZPeStL/
	vJ2Gdgd7JxmD4cAU1hgvMFop0p/h3BozuG9egNubpeqGkCoLniA++eID2fJhW2YmtIZ7/1KcwPy
	6zTRIYJ85OWSla7ATuuyG1Dzn0wBxSn5edScRk/4303+CxovlcpqpxdLXMEd3mw==
X-Received: by 2002:a05:622a:1006:b0:407:efdc:7e00 with SMTP id d6-20020a05622a100600b00407efdc7e00mr3070338qte.13.1691667402145;
        Thu, 10 Aug 2023 04:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf9XiASD6iBgaWOFSh+9FqFKpaKS6+j0drjrGbYeTYSluv6VVQ44qjsbNdILTBsQv9DZuoA/egUsHGzxgkSp4=
X-Received: by 2002:a05:622a:1006:b0:407:efdc:7e00 with SMTP id
 d6-20020a05622a100600b00407efdc7e00mr3070320qte.13.1691667401891; Thu, 10 Aug
 2023 04:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230718034937.92999-1-hal.feng@starfivetech.com> <20230718034937.92999-4-hal.feng@starfivetech.com>
In-Reply-To: <20230718034937.92999-4-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 10 Aug 2023 13:36:26 +0200
Message-ID: <CAJM55Z_EdSRxriT=NkrCzvUi0phnPzTs=dMHRgOSHULOMWuvnA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] MAINTAINERS: Add Hal as a maintainer of SFCTEMP
 HWMON DRIVER
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_043644_540673_D629665E 
X-CRM114-Status: GOOD (  14.47  )
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

On Tue, 18 Jul 2023 at 05:49, Hal Feng <hal.feng@starfivetech.com> wrote:
> As he is the submitter of this driver, add his mail so he can
> maintain the driver and easily reply in the mailing list.
>

Acked-by: Emil Renner Berthing <kernel@esmil.dk>

> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aee340630eca..5056079ade77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19256,6 +19256,7 @@ F:      drivers/net/ethernet/sfc/
>
>  SFCTEMP HWMON DRIVER
>  M:     Emil Renner Berthing <kernel@esmil.dk>
> +M:     Hal Feng <hal.feng@starfivetech.com>
>  L:     linux-hwmon@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
