Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D3C48BCF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98365610C8
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98365610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BQF3EpY0iqDkXub4SeFDZv/R9+i1knrGIf+tegx7OX8=; b=nhoecUeBK5REeQu8qalricpcGG
	DAItg3GqhgO6kQFG5tHtpj4oQHKihh7QYr7vGIMarla3ApvJCYNsqfilW1buiHjGNlDvAp4FftbrS
	gWrhV/iFB591/edXOsJhg+MqWBPFVZ4SZaU+OAmuyzS7y37gqvMhwQ9h6FNMBau4VMBBLx4wKDefZ
	Xj+EUW3ab2ViF752H65VQI9cZh5SVW8R3UzLyoaCY323pVfZENaQFEqbngK7863IVY4fsnWnS8/fj
	mJIQYCABBZ8u3qWMqMOg+GwsvHEZzAXB6kxBHJ47H2/Ya0WoKMlN+dAOLlqxQsKXcRUQ4MDcoURBT
	67GsbmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsDvn-009MVh-Tl; Sun, 13 Jun 2021 00:24:51 +0000
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsDvl-009MV9-Jv
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 00:24:50 +0000
Received: by mail-pg1-f173.google.com with SMTP id t9so5636839pgn.4
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+DnhDur6UO6peo7MWX+uMeYegAyCwRrsb+stuIcOCRM=;
 b=bm0JwNVeXikV6jWHec5jgYGVSmDC1Zg/qY27RDduehzBuvccsbdPtGz9kvUZ/P7q15
 S1qB9SXHBv2jidz1MUuY0+QEXWU9t76zp4AJ+Wjly0jXvqPqdVNjUSC/l4syPXDA8qxx
 2YwN9NAXevG62NxLAJdeOmPLCnjh4cHDL/Wij08gBx2zH4Yu84Wi5nwxIFKNYqClsPve
 luW1Cudvsg0z7M/vm0lE341oXGaP4DLRLXdr3A3xNA3WSFR69iRrinkTN6YBjEkqW+Jq
 SUa0GWgXW5ElYWIgaEq0XVOR6U8Us2O74IEZQvUGS9OCpN8oAoJVZxF9wZ+mtiP4LLiT
 MYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+DnhDur6UO6peo7MWX+uMeYegAyCwRrsb+stuIcOCRM=;
 b=lSlme4SA2PqYgI9sdkKyIfOTwYR9kLp3NTXHRxW91/hI8bbXGDfMRqwnUqwcO99N38
 wFUYpayO1VLoguB01x0EW+5xofLlxCaB3RYnsrOq6eNkb5s2hi/dvu8siZ2Om8a5clU2
 rshRfnI3cLLvuEFLTUTcLL1VnSHn963nF11H+hhwxRvCKoLHFBHy6GK0nYGPkS7f8i9+
 f94MejUp8wkR2o9DFw7MvUCg331jI4EELMgQUZBNjomsrahRqFR3u55s3v+5aN4Nsc/X
 JQN86S8AoK9S8pCw/HfT/fEGh2XYQ7SkrqMQZVFRUj4+ygibr672+KO+bYWdap0K5x2x
 IVJg==
X-Gm-Message-State: AOAM532qC2rZcU8uYvD5lwBPdlDzFIHfxkOGfturQ4NdKcoJOU/t4JGj
 4sbMeFalcUxdfhLbCWACO7dnPTJKXH49yU4C
X-Google-Smtp-Source: ABdhPJzNWJrlQt10Fbg9K3sewVwxkAB11K1CX195gVn8ltcRwwKmoO2zW9KDfgAzywOZcXtFuPyrsQ==
X-Received: by 2002:a62:be18:0:b029:2aa:db3a:4c1d with SMTP id
 l24-20020a62be180000b02902aadb3a4c1dmr14117041pff.58.1623543828329; 
 Sat, 12 Jun 2021 17:23:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o133sm8978167pfd.49.2021.06.12.17.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 17:23:47 -0700 (PDT)
Date: Sat, 12 Jun 2021 17:23:47 -0700 (PDT)
X-Google-Original-Date: Sat, 12 Jun 2021 17:15:24 PDT (-0700)
Subject: Re: [PATCH] riscv32: Use medany C model for modules
In-Reply-To: <20210606220940.2494315-1-raj.khem@gmail.com>
CC: linux-riscv@lists.infradead.org, Khem Raj <raj.khem@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <mhng-0cc428d5-6823-46a9-8c30-82dc56007ec0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_172449_678848_B6A0B126 
X-CRM114-Status: GOOD (  17.83  )
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

On Sun, 06 Jun 2021 15:09:40 PDT (-0700), Khem Raj wrote:
> When CONFIG_CMODEL_MEDLOW is used it ends up generating riscv_hi20_rela
> relocations in modules which are not resolved during runtime and
> following errors would be seen
>
> [    4.802714] virtio_input: target 00000000c1539090 can not be addressed by the 32-bit offset from PC = 39148b7b
> [    4.854800] virtio_input: target 00000000c1539090 can not be addressed by the 32-bit offset from PC = 9774456d
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 4be020695428..99ecd8bcfd77 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -16,7 +16,7 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>  	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
>  endif
>
> -ifeq ($(CONFIG_64BIT)$(CONFIG_CMODEL_MEDLOW),yy)
> +ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>  KBUILD_CFLAGS_MODULE += -mcmodel=medany
>  endif

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
