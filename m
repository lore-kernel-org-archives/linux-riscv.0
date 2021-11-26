Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4511C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/r9/a0u67HZ+5/J1wcGLoSECjnsHOtjnv8thba5dXk=; b=bJw3BJIQOouuU8
	hOqK4IewBa5AzcCCncVKBR4KpV1ynAa6G6BHpPm4SQ1ZY5cDk7ug77xKVnn1L0kK+SXfWU66ly4TM
	7ekyKN8i3qRaRAiQgOt5rc+OY1PxjdvJR1alP70vuzODsI2tBOJ9KDZBUSLRHmYGqMznNJsdXygIp
	t9RXQ2zqNmZWPFLr43aByTbKCescSjgcom66tBtnklmdD6oJztiZtOQwcgpnF/AMYBxZuuInzv5Of
	vMgr42yXgxn9HEDhNi7nlcfP9PpimIT9cI62d58KG9XEvInI3CYvWTe1BIalGda9a3jnWLpu2gaZr
	nqKjXsGAIl86VPYpMpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXwC-009or1-8n; Fri, 26 Nov 2021 09:54:36 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXvh-009oVD-TB
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:54:07 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6BD524001C
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920442;
 bh=HDZVc4uA5DqONbSrrxMjgBDAsJhsJn2CNSc45+//mZs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=AvEGmz1M6WyTwryfYrR/Mv/YO00z7yrQ6av/LuasNdTL1hqrmR57ItYHlc47ymDoh
 NyUcxiLVO1thpxH64r1GXSJAXUECtr0LQzqhVt5XtJuQnE6ueoaBbkhVYqj02j1nZz
 Dwz4hPanQRMbcGgTf3PYvtB4I0yA68lSIqqqXkuN98lKsH163UGzBg4tTgb0c6oBGV
 N8LiSOX1H7MG/YLu9MkFrO4r6m4XI+uijin9/nDT4eRGA4XBKSfhTsCv0PDAp3yrb/
 PTgxwYgydktGJT64E6z+tcIUjvpfP4VWqnRpY/6MtFAATaJWekQ9vUQZE/uS1LoG7P
 acnOcSUVL+ABw==
Received: by mail-lf1-f71.google.com with SMTP id
 y21-20020a056512045500b004162526955fso3977865lfk.3
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HDZVc4uA5DqONbSrrxMjgBDAsJhsJn2CNSc45+//mZs=;
 b=ugvdBuyG00mu0Jbt45Qxnn+r4v+XSLu4O2tU/1S5PHIePvtV+Tk85NrEn9f3UCN2r3
 6J+/5BNObkhsbIdTP+j60Pn66MSER6xtLV8qY5EKTzlk8WoW7rizj1swI/ivb/9ZwJmU
 KhD/rVUjvtg4FChbyEPBZuhAXm+DErKjATeJTC8CE/JTIaEwCZUbasCMc4hSIcjwGBZN
 txzkJzEAjUofGJGbMlG91/LzkhBoqq92awVLda5xC6+WTOCgFfZdpJphja9mpOViHtZT
 dbq4XEt7NLHajesij1T28weV/u6EevBgxC8pONT0L1J2zj4+VXVIwvdWb/NjyQmBFV2u
 Ft0w==
X-Gm-Message-State: AOAM530wkz9cnyNyrQLKh0s+ncqu7zxpSRhMkPDggKn8g9IAwJYxwaSO
 hFCs2xTkd2FsbEEBTJUOOHjK6AaqTUswZ8Slj5g3FfJtaddOiJdFqoZbm7O4VtM3CS+zK4hIAiI
 w16K28+CNb6Io53rdoFW+NbYW8hnkCcUfSc65IhvL3cPYLg==
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr29240767ljp.204.1637920441894; 
 Fri, 26 Nov 2021 01:54:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9WZsVQb6ovekXYugz3PlWjmtYmgUqfC6G5PQic4i0/9fBaW+NpvoF0J57TZIJEWIVsA18BA==
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr29240752ljp.204.1637920441750; 
 Fri, 26 Nov 2021 01:54:01 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 u19sm458410lje.74.2021.11.26.01.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:54:01 -0800 (PST)
Message-ID: <a30b5864-99b4-6bf8-2034-23a6de416fdf@canonical.com>
Date: Fri, 26 Nov 2021 10:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/9] riscv: dts: canaan: Fix SPI FLASH node names
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-2-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-2-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015406_156956_57B96BE7 
X-CRM114-Status: GOOD (  11.37  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml: spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'
> 	    From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> Fix this by renaming all SPI FLASH nodes to "flash".
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
