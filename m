Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD4C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OdJKtS+kZEJhTenGEt4wGCR2YL0Qh1Rv7LMpcm7hO5Y=; b=F3uVH10hA4MFKr9txvyTz23d8W
	CZAMmCHDKCXDBOpkd3X3nhTXJxHF9l8ICh4TY6635qsA5VSBlOa4zxw0PikAaTDrfFAvErlBMkKrb
	v6j/LZYvQNXLfKV2g6JOyF9fNH1+eka0cxT5YKTQCP5er7hIOqO6rVurVed64nLNrpXR8zLKY8TiU
	UiFUi3hQebW5PW3b5j67NrW1Gqg17nWW0YaQngDPI2vuYKBW1M/45yPT86he+I7Nylc2YfVZiy9AC
	D4pjBbXhdWg7cwtV2ObxGeeZma8PuexOQrf3mez8N3lSFMkCSBVtGd/prsOyMj6JBkyrJsRR/p01x
	M16RX8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEyvK-009lE3-8v; Fri, 22 Jul 2022 20:06:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEyvG-009l1p-T4
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 20:06:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id c6so1341136plc.5
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 13:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=zLMtuNEKcomDL9En+iBTEL2RGFbAke6YE3hVmvEcPio=;
        b=Eig2NvAhLfj/vpfp9dGkC4QXb4hU/3IYvKdkRbtZYah9nJFIfw7QsduxCPs3GEAJgI
         Pq/geWl82IjlD+B8qljZf/fdO354mZpallnYP/YnAotuJ2oxrgu1tEgDT1g3Dz1bbweK
         +e9LaZaadoKuGVs7ehfKURTGuw2c2fgpmOG4q2hJw8UUU1EZ1PrcwOGOu9TdSuI+zWv7
         fRwpyB4vVBvp+aw3Bs3r3mIE3AeUHKLQ+T2sCg67aVvq/ET8zN3uQRzql8+n5zZD+Cg+
         VHEx4+FeBCF1vcf19ruV6MjlGoVX8DmicMdRsd/yCioaGLIkt51EobwFJNDsxoQKaJdv
         rn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=zLMtuNEKcomDL9En+iBTEL2RGFbAke6YE3hVmvEcPio=;
        b=4IYLid7UotOEJNoPXpg+r+TxjFlAp8MTs0fho64We6Qabs8DNZLcKR8P/B3V8KZmQg
         YChEwUqnjSWUNP6+YF6bECZCD+33MuqLZ+IlaytzhAjt7+1Nm3oiiMPBzQ8BssASBkAY
         npTdnOz6TzKnfgPwQFSH2XJt7MeRSbhkUMLdQTkxgA0VoT/a/SJn+M80QzO/Lxns8rSy
         3Qbpj7M0E2XWaP43jSPv38bj6eQEodRR59Y9aiHQ8VDgQhv9YEH0a67V9MWST/bUOYtx
         F9wj8nnM3GVveRuMVdZBR0p4kMuQuR58Cio8r5YEGGghBnD6l5iS4+gZT0uIvhhaqwLB
         XxJQ==
X-Gm-Message-State: AJIora+mxMzvRiyJY2+/zbuQvGoO6mU9OQLlDURigXsN6yR8kAoS1pPc
	bzTLTNkzOKpGgQqDOSuGv26GuDtmbrN2CA==
X-Google-Smtp-Source: AGRyM1uX2FdOU6xdhlNSf3B6XRXhfVe67iGwEPo/S4uLCyT2clrlec8g1WtQC/6pvHoV17nvASPNDQ==
X-Received: by 2002:a17:902:ec91:b0:16c:29d7:5e90 with SMTP id x17-20020a170902ec9100b0016c29d75e90mr1512512plg.114.1658520411130;
        Fri, 22 Jul 2022 13:06:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902d4c700b0016cb98ab5b4sm4120255plg.153.2022.07.22.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 13:06:50 -0700 (PDT)
Date: Fri, 22 Jul 2022 13:06:50 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Jul 2022 13:02:58 PDT (-0700)
Subject: Re: [PATCH] riscv: compat: vdso: Fix vdso_install target
In-Reply-To: <20220625154207.80972-1-emil.renner.berthing@canonical.com>
CC: linux-riscv@lists.infradead.org, guoren@linux.alibaba.com,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emil.renner.berthing@canonical.com
Message-ID: <mhng-f6f17824-3a4a-4461-9195-dec6695e03a1@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_130655_153662_A9524AF7 
X-CRM114-Status: GOOD (  15.45  )
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

On Sat, 25 Jun 2022 08:42:07 PDT (-0700), emil.renner.berthing@canonical.com wrote:
> When CONFIG_COMPAT=y the vdso_install target fails:
>
> $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- vdso_install
>   INSTALL vdso.so
> make[1]: *** No rule to make target 'vdso_install'.  Stop.
> make: *** [arch/riscv/Makefile:112: vdso_install] Error 2
>
> The problem is that arch/riscv/kernel/compat_vdso/Makefile doesn't
> have a vdso_install target, but instead calls it compat_vdso_install.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..5cfbef613e34 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -110,7 +110,7 @@ PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>  	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> -		$(build)=arch/riscv/kernel/compat_vdso $@)
> +		$(build)=arch/riscv/kernel/compat_vdso compat_$@)
>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)

Sorry for missing this, it's on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
