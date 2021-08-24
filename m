Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A4EC432BE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 14:35:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2C96125F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 14:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E2C96125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJX8JaOV5+WOIhefmjBgpul9KBQZ0FQDBR+QNvqPPjY=; b=vo0FZSYMxGMr8Q
	b9v71meFcLcaTvstneg6jpWXsSHBkqymK4OeF1EnU1jj/UZS0pkCnilv7sPFlSawAF2m+Xt/waSoE
	nDBvChIy6VRS2ySg1Mf32vfS6A2VrdwcPpQ7nCweJkDCqiP8yXWaw8vwWgQv8Dxg8nShl7BAYb0Vy
	eSe51wtZASBTqFs2dXexuEGu7+ezDyvDJ9w+CYJcrfsuxF3+j0UiZgko6k5ku+MQVyWKGjxV21kYT
	dyG6bPsSuqMtSv8bui5iRJcFip+5ZEpE1mYHmeuWtCCo2Ivl9EG82h2P0lZcYhpC6cCZ7sAkxhVNb
	00xS2x5J7CZgF6oi5g+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIXVs-003Wr8-Tl; Tue, 24 Aug 2021 14:34:52 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIXVP-003Wl4-PA
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 14:34:28 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso25887187otu.7
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 07:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cjxpAdrXRiBgSjXIV19OMMUSDjglkcpFQ3o1vBWTrBQ=;
 b=IiazlnbimRdFWBM8V1HuCbIfHcD3gZdGqEug8xu1HwlkDws7uVVKTQTL5N0YT2PqWD
 orSkS1DVZzSeEJO2pKGvZK4CtuB4v3UXhNSjTJwkcP//yyD5AIrwfGjElqXnFgm2gEt+
 Npg98tmIcGl/RCeVCcp6YGp1zpXd/qYgvzb5WnaqfulI2jvcTczjbH0fFD2Cph05D7gg
 h6Vq3ft9Edjt7yzJh4yKmW6gnftwn8/2Y2CRxzBLAFyDeJF5JVcUDDK+wpGhcKp3HacI
 jbYwWfQ8LbN5fvqX6tbrTXK+nRXO7dbr24y+uq9ztra1pYr7lWucuuFRPdy1rzNom4KH
 bfZA==
X-Gm-Message-State: AOAM530enCg3JC4AbW037j2l5GZeejDpIQH1DDRgMjXU7HCbd6Svtfjw
 u0i0mHZ2jyJZq+5nY5eKyQ==
X-Google-Smtp-Source: ABdhPJwuUeEoin7xC064PUAkjPR/fiPbTso7HebfqesbrtSbFz0E3l8nUkrDJS0xNkjYJOC0E639+Q==
X-Received: by 2002:a9d:7a4e:: with SMTP id z14mr18304739otm.366.1629815663246; 
 Tue, 24 Aug 2021 07:34:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bd27sm1361645oib.43.2021.08.24.07.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:34:22 -0700 (PDT)
Received: (nullmailer pid 399601 invoked by uid 1000);
 Tue, 24 Aug 2021 14:34:21 -0000
Date: Tue, 24 Aug 2021 09:34:21 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Piotr Sroka <piotrs@cadence.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Yash Shah <yash.shah@sifive.com>, linux-mmc@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/6] dt-bindings: riscv: correct e51 and u54-mc CPU
 bindings
Message-ID: <YSUDbcN3EsMvZOct@robh.at.kernel.org>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_073423_840435_0007D4F9 
X-CRM114-Status: GOOD (  11.51  )
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

On Thu, 19 Aug 2021 17:44:31 +0200, Krzysztof Kozlowski wrote:
> All existing boards with sifive,e51 and sifive,u54-mc use it on top of
> sifive,rocket0 compatible:
> 
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: cpu@0: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['sifive,e51', 'sifive,rocket0', 'riscv'] is too long
>     Additional items are not allowed ('riscv' was unexpected)
>     Additional items are not allowed ('sifive,rocket0', 'riscv' were unexpected)
>     'riscv' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
