Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDA9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 17:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 462DF61090
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 17:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 462DF61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7QEPi8LnJJ7rFCHv5ETId5NN9UxKY+A4X6wJzkRUX0=; b=aoRRW4n6X5G4Fk
	80CVdddXyavriAoDvTtZxA7uia9L+IqFXTrziTX1aGlxilCcUZYqOaHwLkmyRqzhB8VKPcaggyd+B
	EpRnb5/I+CODX7QKHHwSP7IoT05mF1hmi/Xfefd7333EkR4AydMtmLudYfnem/K0s6zSRis39lnvi
	vDEPeP7+FDWhJyPDWpI1+c3vLuqUNMnyL4OACVwnx7irIu7YpzxFXRXFDBs4vZ8WW6hL0RLXPCH/F
	8b39W3d1kXhc+GUTUoFUtOelnYgOJ4lTLKy5w4WvO0G/n9j+/5yyWT2O7clXuyY3frz3IF/GEYOMx
	fMjyDzDA/BOK1FMMijnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTS5j-00CDV8-RS; Thu, 23 Sep 2021 17:00:59 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTS5h-00CDTw-9z
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 17:00:58 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so9394198otb.10
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 10:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=teChl1p/4EMf/WJShh1OZqgp3XvJdJ2naYCzMZiC37o=;
 b=Y2MuvgWsNPYkRYoYJvJjsAIeYOOjXarKccbzFj3tDe0iRvOhDyp7QzwzsIDqcfeYOm
 6I5kbfDNu/uTYeZRHL3bwm+X10ht+9qLa91Bk2tDhLvsq0zQJXJ06N9psK/DZ0M50IOa
 0sddi1v0GKjxSq4XMM8N40Antp/q9pWuNlovUllz6xQeicH9yJMjbOnWUIPxaQS7UGzV
 B6oHjAKPt2VcHvsboMqUVbZdgrYWpnxe+W0z0bXf/YtDog+sccjFnTOWyYnVxndUfG+f
 wYvBMTw9BeE3Lgya9scieSXHxnp7TrgZ9+4lA1r2hV0ArzUg1xC1lF4AP8+jqhXIelXV
 M8GQ==
X-Gm-Message-State: AOAM532G9gvl2PuYm56K4if7vEGndU4VYXBi+FyqtL/Eea3yUUeTth9G
 7G/oNgWMdV8zcmIFIapUsQ==
X-Google-Smtp-Source: ABdhPJzXw4Li/gy1lQs5OZieCWa6v8RMXxRDhEjXwGNg0aY+aGwWH4bmhcug7/5x6TS/we6PGqeLBg==
X-Received: by 2002:a05:6830:70b:: with SMTP id
 y11mr5409347ots.281.1632416454512; 
 Thu, 23 Sep 2021 10:00:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 65sm1444412otc.32.2021.09.23.10.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 10:00:53 -0700 (PDT)
Received: (nullmailer pid 3171462 invoked by uid 1000);
 Thu, 23 Sep 2021 17:00:51 -0000
Date: Thu, 23 Sep 2021 12:00:51 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Piotr Sroka <piotrs@cadence.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: cdns: document Microchip MPFS
 MMC/SDHCI controller
Message-ID: <YUyyw2AheXxDCAN1@robh.at.kernel.org>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_100057_405132_B82B0F73 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, 20 Sep 2021 17:08:02 +0200, Krzysztof Kozlowski wrote:
> The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
> without any additional vendor compatible:
> 
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes since v2:
> 1. Document vendor compatible instead of dropping it.
> ---
>  Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
