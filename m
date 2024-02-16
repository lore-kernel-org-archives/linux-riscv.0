Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BC1C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 18:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ELBEJnayFgZFfudjac6HxWb8PxRP8iJt8HdCo54WfmI=; b=M6mFokyfFDKGbQBEdCeh8ChiCH
	hD+57/eQffckURctL7w2AvxuBaKz8iFRAplw2iFFDDF52SJPQ3ynjiCV06IuZCA19sxFidnKHj8Gm
	rxVb5lXAwKoRH6KVUzfuA5xIqCWtheI7yoS4Y/XGo+QCxMLrzydS/yDDYijkjj/UHY1SqV4/nqP+6
	nzrqAT54fRrgSWon6vAvMVtu03sQyIEArvfTHTlx21pGV/bPgRktoSTtEt8xHal8m9RKm8vuUS995
	Seo+1hw0B8EcWdMIVrKgpeMVaT3mMU82pKG5nSDuonb8kc1LU6pAiXAbnYPMGJxYJEvoNQckgb1cQ
	25Ht5p/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb3BQ-00000003Nkt-2wto;
	Fri, 16 Feb 2024 18:43:36 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb3BN-00000003Njb-0jvy
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 18:43:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso1990076a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708109012; x=1708713812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJHBmKqDgQLAotj8Y1RBzz34tisc7RXots8Wfd3qOQk=;
        b=XQuOnYgBTSL45G8xTekJFL0K6loGXQkuvg5KZ9Q0yZSK4t02JEfRBbbBHe2hL0TSh9
         OmhmFJJH9kiSLImWtzBez5jdkvXKLB5rPxaASQyYAkzXWuT45eSQue/ArH/DRul+LIQA
         nGqRumjQmKacEk7EPVaLduino/1897///WDPxCm/3J5rxHXK/T1BUdq4V3fUcqENLRR5
         8JXmM4rUDEZWUO20XDgZpOdrTaX20qT9XhvpBneIJ/Rrx1Iegfr+WdGpX7KSYM/A/3IS
         34zaNgiEEpYjAIElfmMMRRxLwExzOVMPCszj9kT2n1D9igwWlNdQ5jTuubZSjL4pwALS
         QMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708109012; x=1708713812;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJHBmKqDgQLAotj8Y1RBzz34tisc7RXots8Wfd3qOQk=;
        b=qFXl4rmxSkTuvijQb7Da2MJtX4UdfaVqACrHloOxoOLt77T8B/0HTujjsFX6JZlSVE
         lUfQ4GzLsWV6UfdgrYt1gHCrFcvxONxQfvUMDj+krxWtCWivsnIS4d6geNQgEhpSgNJz
         6l8FDuH2jnT3EaN20oN8YQAD5zv71kYt6VrX7RcvRYMrg8jLS5DDTqLdN+yA+ELCitgd
         piviwbqNFdhPdljBCeLuKV6/BGtCoPyQ4Rd8S06fw5XA24VYkdfuoq0e3YRT/bfIangj
         luatDA/8c4Eds60aKCl9mleAzjl9F4XSbuVTe5KJRWz6yXUmAya7Y6SAxD2sL7rpDb29
         zG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6n8cgUSPyQ1uSmF0tRfubQPfD5WDrHGmxeTLltXqN09H6Dh3zQdg2NEYHXZJG+Pp5dou6VBHSoqMri/lOoqndxeJSXPW7YDAzA16R1YxR
X-Gm-Message-State: AOJu0YwKM9tdGPcRKXUpD2G1A1QIl9PzJe4avvpPjFqQ3dcDV3hgfEwB
	r91HXz4NsuEm5VAs9o+fU4V/zm1galZYTKzUGc9Z59JgXoEWAF1Fbw19qDsjQ5Y=
X-Google-Smtp-Source: AGHT+IHupLOFRaXioovxDw1rwELdzfrPAACvtmznYDJzzO50HaIDsrCgoi1SlLUvhe4Vma9+UYI6BA==
X-Received: by 2002:a05:6a20:8043:b0:19e:cae4:7c15 with SMTP id f3-20020a056a20804300b0019ecae47c15mr4841321pza.24.1708109011834;
        Fri, 16 Feb 2024 10:43:31 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id dq3-20020a056a020f8300b005b7dd356f75sm194808pgb.32.2024.02.16.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 10:43:31 -0800 (PST)
Date: Fri, 16 Feb 2024 10:43:31 -0800 (PST)
X-Google-Original-Date: Fri, 16 Feb 2024 10:43:28 PST (-0800)
Subject: Re: [PATCH] MAINTAINERS: Update SiFive driver maintainers
In-Reply-To: <20240215234941.1663791-1-samuel.holland@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  greentime.hu@sifive.com, linux-riscv@lists.infradead.org, green.wan@sifive.com,
  samuel.holland@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-a672acb9-4e32-4a63-898d-08b10d09d8b8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_104333_452359_E7BC0A40 
X-CRM114-Status: GOOD (  20.20  )
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

On Thu, 15 Feb 2024 15:49:11 PST (-0800), samuel.holland@sifive.com wrote:
> Add myself as a maintainer for the various SiFive drivers, since I have
> been performing cleanup activity on these drivers and reviewing patches
> to them for a while now. Remove Palmer as a maintainer, as he is focused
> on overall RISC-V architecture support.
>
> Collapse some duplicate entries into the main SiFive drivers entry:
>  - Conor is already maintainer of standalone cache drivers as a whole,
>    and these files are also covered by the "sifive" file name regex.
>  - Paul's git tree has not been updated since 2018, and all file names
>    matching the "fu540" pattern also match the "sifive" pattern.
>  - Green has not been active on the LKML for a couple of years.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  MAINTAINERS | 29 +++++------------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 73d898383e51..f1bbb0f82664 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1395,6 +1395,7 @@ F:	drivers/hwmon/max31760.c
>
>  ANALOGBITS PLL LIBRARIES
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
> +M:	Samuel Holland <samuel.holland@sifive.com>
>  S:	Supported
>  F:	drivers/clk/analogbits/*
>  F:	include/linux/clk/analogbits*
> @@ -16725,6 +16726,7 @@ F:	drivers/pci/controller/dwc/*layerscape*
>  PCI DRIVER FOR FU740
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
>  M:	Greentime Hu <greentime.hu@sifive.com>
> +M:	Samuel Holland <samuel.holland@sifive.com>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -19968,36 +19970,15 @@ S:	Maintained
>  F:	drivers/watchdog/simatic-ipc-wdt.c
>
>  SIFIVE DRIVERS
> -M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
> +M:	Samuel Holland <samuel.holland@sifive.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	drivers/dma/sf-pdma/
>  N:	sifive
> +K:	fu[57]40
>  K:	[^@]sifive
>
> -SIFIVE CACHE DRIVER
> -M:	Conor Dooley <conor@kernel.org>
> -L:	linux-riscv@lists.infradead.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> -F:	drivers/cache/sifive_ccache.c
> -
> -SIFIVE FU540 SYSTEM-ON-CHIP
> -M:	Paul Walmsley <paul.walmsley@sifive.com>
> -M:	Palmer Dabbelt <palmer@dabbelt.com>
> -L:	linux-riscv@lists.infradead.org
> -S:	Supported
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pjw/sifive.git
> -N:	fu540
> -K:	fu540
> -
> -SIFIVE PDMA DRIVER
> -M:	Green Wan <green.wan@sifive.com>
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> -F:	drivers/dma/sf-pdma/
> -
> -
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-input@vger.kernel.org

I'm fine not having to maintain the SiFive drivers, the SOC stuff was 
never really my thing anyway so that's all a bit easier on my end.  So

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I do end up picking up some random patches though, mostly because stuff 
seems to slip through the cracks.  Are you going to have an SOC subtree 
and send stuff over there?  That seems more manageable on my end, as 
it's a bit scattered today.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
