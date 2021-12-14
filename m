Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277C4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XDhnI/+zR5fgJP3fGcbM3B/8shzGK/J0mNy2/mSWo/w=; b=s9xYFVenrNcZw++qPLrSLBjHlY
	ofSAcwFX1E7xuH6AtZN/Et/RktAxea/M76ukxYqyRO0D4fjbKUNGZgJzP4d8XOeIqKbzI1qUVSsUc
	YmfvOsgCaRmUaWCN4wHyY4PxOHPXRjf45qcdFcxSKRv4AYsKDY23qF/hxEblNHE1ZdQUGQiK4IBF3
	/QJvkUMYzRpP5KQE5oxW2zZ7lAJMl4Yl9W+XiJD+6aq5/0rPEokeHYUkD7XHL2JIMbHth9VLs4FAa
	9dnPnGo5YVG7OvNHbeNNp3tPqqQqciNj2fItmX+6gFgzEzHCO8Z2Mdjeqt2iZhgLE4TtLmf7/lIOM
	l+a1I12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAg6-00EsJX-S8; Tue, 14 Dec 2021 16:29:22 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAg3-00EsH7-DR
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 r34-20020a17090a43a500b001b0f0837ce8so1457535pjg.2
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=39DaSKbHGHl7/uZlQw9m3Qmqoy9t3ZKBAe/0qF5AL7A=;
 b=J+SmqJeel8TNyygsI3wZ4ScOB2rLowFvDuzh7kQDx8iGeWQclt8jYJ8jZNIsLMTiH4
 2g+A1XFg1ewp5QmwSL+7rMhxOFKxW7ULYd/G38rooC1rMQ8sDwsEB60pyikT90T+RGyT
 A00xWoPEJfKfLnjASoBwzvG4qxF/Qx4SSryBpZFioxJWFwEi6KNfjx2K8UBcfPiq79x4
 jiSTaX1hfweF75J/xShF8o0erIGuMm7WxQkDXVpRgNbq+NpZhXXeS7oouFBKzsMZLxgI
 lqJdfq9vnx8LJNivjHKEUEAADup5do3kNQIYLDuVns+6KP9tngLYZ0ZfmcO7rz5XWLXA
 ES0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=39DaSKbHGHl7/uZlQw9m3Qmqoy9t3ZKBAe/0qF5AL7A=;
 b=AbteubzzY9e2DAQK4gr4tsISFb0xUEaKqhzv/i3sNeg3A4EwuPhrsqndXy5oGzrU35
 3NLbKUttLC4QhzetUvdEvfNixwIZeZVvqp5AH+3ZNO/P9H+BaNHMjbLRWt6NIr+O2MQU
 dT8AlmkGaScoj2sAaNsuYs74b7ZNB2risXtbYZc74UIRkdya8sIfIWnO9I0N+qs6nur/
 uXUe8jK/+BYhLu4D9aa1xx30alFHtPVIrpGrs8NLhW/fjCEQEfZCWIDyxqYK+M4+PZOH
 jfNfUuIHh0QoqbgJ7JYP8skIv4puFRJ+6P1EDLsJ6UB53pgmJShT3t4sOgEaoCccmGG8
 qLkA==
X-Gm-Message-State: AOAM531PTNINCRNmK25fILlOZqzCtkUU7iO23NOUuJuEMh8sEM3M5X1v
 qdK+AMMezv8y8Zr+ToB8g3og1A==
X-Google-Smtp-Source: ABdhPJyY8ybr7iy7kIyHObng97M3Jkf17suzvWAEqcJ4Iq5MWhD+8BDF5JHxA8iMCHmYtm3YS3zvPQ==
X-Received: by 2002:a17:902:e890:b0:148:a2e7:fb3c with SMTP id
 w16-20020a170902e89000b00148a2e7fb3cmr63676plg.125.1639499358143; 
 Tue, 14 Dec 2021 08:29:18 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id b2sm283472pfv.198.2021.12.14.08.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:17 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:17 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:17:35 PST (-0800)
Subject: Re: [PATCH v9 01/17] riscv: Separate patch for cflags and aflags
In-Reply-To: <f76b0312113bf960e114724cb578a060b3f101ab.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-24dd1554-4004-4132-abde-6142a4aa19d3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082919_557583_76EAD1C4 
X-CRM114-Status: GOOD (  14.92  )
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

On Tue, 09 Nov 2021 01:48:13 PST (-0800), greentime.hu@sifive.com wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>
> Use "subst fd" in Makefile is a hack way and it's not convenient
> to add new ISA feature. Just separate them into riscv-march-cflags
> and riscv-march-aflags.
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/Makefile | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0eb4568fbd29..37de70df4fae 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -48,12 +48,18 @@ endif
>  endif
>
>  # ISA string setting
> -riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> -riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> -riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> -riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> -KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> -KBUILD_AFLAGS += -march=$(riscv-march-y)
> +riscv-march-cflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
> +riscv-march-cflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
> +riscv-march-$(CONFIG_FPU)			:= $(riscv-march-y)fd
> +riscv-march-cflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-cflags-y)c
> +
> +riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
> +riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
> +riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
> +riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
> +
> +KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
> +KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
>
>  KBUILD_CFLAGS += -mno-save-restore
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
