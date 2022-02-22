Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335C4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETxuIwHAF3XmK2RoA7kaHCJBcpaeU8oAphrRRtMCM9c=; b=xi/sHhty0eo66i
	pQAdoYwjKpIRKA65PRTtfE6gmoTnuLvLC9kBuo7DeC2q2uf2V5qCR7IRFB5e0MsAqD3pp31eUJpTR
	B/K6u1v8BVFzm76hxzY0tISX+L5lsTdOJSTXWX1zxagtrs5VF/9HQvtp4F46A424SrWmzy5SpkRtY
	nJUeFY2vKA9TEg2QOxuQsd87Si7fzd2Xtmt9Tvzbk0KtRk1bf0IigNd1zzi4U/vyYm1oy5QpSk/WZ
	Hqpqzr6QcZwcbLXmjMWeS2XsO/Gt5v3n9RG8tNVViMY6VX+fNc8SsNJ1i2+7bAnz2QENupeSByYWe
	IQrcXmK67fqr7xGRV/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMcsw-00Bh97-8N; Tue, 22 Feb 2022 21:39:50 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMcst-00Bh8X-1m
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 21:39:48 +0000
Received: by mail-oi1-f178.google.com with SMTP id j24so13917591oii.11
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 13:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e2psfHnwZs5xWnyvc67xSSoWa8E4e5UoRm7fPOvRG2k=;
 b=K2bsegpHa/+qiOtw6aYMCseSjDyn4jAZSwhVmtNo+3PvySxRAf9Ib6/llXTPoFZD3j
 0bIsGdfIDUCrZ2R6cMEpaXuCy52jmQHLJ+9Fp+Mhohn0UfMRloC8k4PurUz8UeGkez9v
 xWqoD+xGybJSPkeOkrWA/qvPlwOxKKe8ErU0rSj4MBoM9OqzxBLM83mOsSbI1d1Xnr9T
 TdnyrxcXnwO9Y9/zhh8VpYIBudJZ5EwaZpj5+zsEqWG47iqMS6pvLMZxyBusIa/5Vo7b
 3JLNlkcivqXFc0C3MzJyj74QP9PPzFPvAS9P408JgSkN6rU5Khya1g7gqXaqIKbBePBG
 RbJw==
X-Gm-Message-State: AOAM5321/LxkEz4TLZ2qsOYZ8zKSLKHyVK8JxyDjaOOhvwPITVJDIOuC
 Hr6+iKEulxEbfsneykAaew==
X-Google-Smtp-Source: ABdhPJzrwJuwkbQEPG+nVIKFTN4wDkORO0vQxGqMkcJcmKTnAAfMQGUYwq+TDGVA6kTamSiXcfTrIw==
X-Received: by 2002:a05:6808:202a:b0:2d4:df36:68a4 with SMTP id
 q42-20020a056808202a00b002d4df3668a4mr2997913oiw.16.1645565985765; 
 Tue, 22 Feb 2022 13:39:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r36sm9663847oiw.40.2022.02.22.13.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:39:44 -0800 (PST)
Received: (nullmailer pid 3634892 invoked by uid 1000);
 Tue, 22 Feb 2022 21:39:43 -0000
Date: Tue, 22 Feb 2022 15:39:43 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-gpio@vger.kernel.org, atishp@rivosinc.com, a.zummo@towertech.it,
 devicetree@vger.kernel.org, robh+dt@kernel.org, paul.walmsley@sifive.com,
 lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org, ivan.griffin@microchip.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, daire.mcnamara@microchip.com,
 jassisinghbrar@gmail.com, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com, palmer@dabbelt.com,
 geert@linux-m68k.org, lewis.hanly@microchip.com, thierry.reding@gmail.com,
 alexandre.belloni@bootlin.com
Subject: Re: [PATCH v7 02/11] dt-bindings: soc/microchip: add info about
 services to mpfs sysctrl
Message-ID: <YhVYH6vf+b9jKeB3@robh.at.kernel.org>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214135840.168236-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_133947_135590_CDD898D3 
X-CRM114-Status: GOOD (  12.19  )
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

On Mon, 14 Feb 2022 13:58:32 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The services actually provided by the system controller are not
> documented so add some words about what the system controller can
> actually do. Add a link to the oneline documentation with the specific
> details of each individual service.
> Also, drop the unneeded label from the example.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-sys-controller.yaml  | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
