Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F361C47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nLMHSWcEfKIy88NMsKs1yGWuU7Bs8s9bkJOLtliFhs=; b=GEhYyXK0qwWecn
	P2N4fX410CxmlPQqLS0mxjRsfNhTiHqfo4k48YaA8dxYnXZ1PfSOdGXzrzE+YlYmOCbS27SraLj8E
	fhWejyT6E8jCWjqpFFCkW5xw7hNf6dQ7kBNvDRE11DngeQDeA29malK/emjplZxWUDEfT9GPUKdsv
	aM8DHBYZYzGhvaFzlWqNdnPhaD1KbBEZArvmxeQgTXxowdkPVe6l/OAeddD42S1t5wE8l2C86nWP1
	B6UxWBPfzo2K3bzDVyit2Mr86dnt99Zen3NvzTPJtD0eqOThIDAtL1ZjlKtyDg54wVogpKXV4D5BR
	sr7/eSE0WcQkhdQmoAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pP1-00ATRq-Qe; Thu, 01 Dec 2022 19:39:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pKl-00AN8E-6a
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 19:35:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id r26so3696039edc.10
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 11:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwb0JxDESDs5mtnW7GSBzDyyT2uzkUh2LxNi22Fshms=;
        b=joecMB3ipKXz2RuhKpefAX3tzaiSPtlNTyz7YvTkMRl+aIwcqplDkPON0gZjI79ANQ
         jBDLjVq0t/7cz3S3dUML9lfct/BLP24Wrmh1p5yJnM4YnOkrAalVh7bcLfcI7oIvkRCd
         6qpRm6gcmmP6YMvBQe/83vXxjkeMgsDOJYb8rxhuWj42AJlOTNF6g4TCUqmJu1w+Aykb
         /Z+amgnpzHOj91lLcmzAqr9N6vYKac/ozQel+QJK/Z12kOZZ9Jxc8nOXbzyZG+RpB1pm
         T0NMlTlVgwQ23lqzP7HbMOlNJQjZ3eDWezkVF09zrlD5L0RnJ9p7MrvXxdJvmpincfa5
         IfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nwb0JxDESDs5mtnW7GSBzDyyT2uzkUh2LxNi22Fshms=;
        b=QeNlsQkNotVwFOh/fZARSn71gVk86sR1iNeTfGPPsDCiyZ3jm29Pfdzb8v5JNEDgzx
         FvsRXBYiuIyWMqHyF5+QNQo166ZadfZxhjyAxYFLmj+nFSPPsQpfNFlchUDzlIKxShnw
         WfHmHnd0LgDZAvqF/naP/R9OrWruAqHbUMYGWSA7BuYqqkjfEMsOkXIcL8cPQFnNesD9
         +LujlD96KBm8LSs5pfUhWPNZCLaR2wIGUPpvR6NswPpSd4/cphiZLc65OU4Ko6/pJhXg
         O65LdYLzoU7yYin7XrpedJdUx020P+mVKsFkItdJUrNbfUC6yUrKXSR55s/lSvtfH9Pb
         rrsA==
X-Gm-Message-State: ANoB5pkMl7xbIpueDKicqWmuuffMdCxzosWDh0KhOdPR+SosHMqEVG7s
	H+ajfpQzJ7bzqTaieyAZ6Hrhew==
X-Google-Smtp-Source: AA0mqf4pNR+JAwtiOHM56a2ETbcekn87d0qG8g4MgC5pBWwzXk1cR0DD7D0wjGx4WwxpAmL/8pzSrg==
X-Received: by 2002:a05:6402:e0d:b0:466:4168:6ea7 with SMTP id h13-20020a0564020e0d00b0046641686ea7mr1391730edh.273.1669923297084;
        Thu, 01 Dec 2022 11:34:57 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a20-20020a17090680d400b007c081cf2d25sm2094018ejx.204.2022.12.01.11.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:34:56 -0800 (PST)
Date: Thu, 1 Dec 2022 20:34:55 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, ardb@kernel.org,
	linux-efi@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 12/14] efi/riscv: libstub: mark when compiling libstub
Message-ID: <20221201193455.2hr6mwm6sa6vnd3w@kamzik>
References: <20221130225614.1594256-1-heiko@sntech.de>
 <20221130225614.1594256-13-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130225614.1594256-13-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_113459_282795_631E3C00 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, Nov 30, 2022 at 11:56:12PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> We may want to runtime-optimize some core functions (str*, mem*),
> but not have this leak into libstub and cause build issues.
> Instead libstub, for the short while it's running, should just use
> the generic implementation.
> 
> So, to be able to determine whether functions, that are used both in
> libstub and the main kernel, are getting compiled as part of libstub or
> not, add a compile-flag we can check via #ifdef.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index ef5045a53ce0..777d1ab059e3 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>  				   -fno-builtin -fpic \
>  				   $(call cc-option,-mno-single-pic-base)
>  cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> -				   -fpic
> +				   -fpic -DRISCV_EFISTUB
>  cflags-$(CONFIG_LOONGARCH)	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>  				   -fpie
>  
> -- 
> 2.35.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
