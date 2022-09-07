Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF14FC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Z8HasSupleG02i9+IGppXW2saIFF5VyFtnctEc53Cg=; b=pwWRbQeilkmEnw
	fliow4KJsyHwNr9Fpx0s+FUKmlHIAL1CA+64390PGiBpFJo0M5/etdnllHXtThx6j+DMSjdzzvyQd
	sWXHQgKF0adr9RZdBuHAekNQqvpAlR52bpaql/yRlQyZG63IG5sbYW2mEkXkETS6/Oc0OGj9CverA
	dtrfy6YU4Q2/Y1GDyj1qD2qQ/8ccfZ8tlozXYALQ8ZUF6VG1LrwaJehzvwHXUcvksPJZATarOWlxs
	Jl50UaTC79ptsr/K38JU0kNZN6yubEnx4fPJIe4ljmuo36qEIFpSLePMcQgfAl3Dh2trhggS4acwA
	/BkSn1uyHOFAWaMmV1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW1pp-009gZF-Ug; Wed, 07 Sep 2022 20:39:45 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW1pm-009gW0-NL
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 20:39:44 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-127f5411b9cso7635339fac.4
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 13:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=heUVe4bRCu44NED+njQs5QT2thfyuCxnA5VKZmd6Yd4=;
        b=iHusxObMxuhSwnGPWuyi7iuwM1V6XV2M8wg3qx8DaMUaZhF84jZbnR4NdV1ojv7gdO
         uTBPrfiHeXFTKjnJvsQ4z5m+bGjkiCcTpnLGV7t05GrIoENbS9Uv+k/Jb31LwPUlVitk
         LRvMCz/IRdJ19eFIwy19woxgCjIoG38dm44yB46ySnSBDQWE2qC6DlW5vuhwYPIrsz3z
         p+fr/i3qZ6sw76SAChOXpMtfNtgptlL1d0DnVVpi9drGc2O0e2IHtTH1rgfqLH8DbxTM
         wmXlyQIB/6RlnfVbqRRZHqvBmm8FbSF0JbvsJ2UKDaWRQ4rktvPZ+VYiAAiCWjda3gyI
         x7iw==
X-Gm-Message-State: ACgBeo3Pe917pOBe/Gh5hiunjPN1dlKrErLNlQpjRispvIE0e3Y2JZpB
	3kIU8BXsUDng7T+9AS8wRw==
X-Google-Smtp-Source: AA6agR65JGHlKOOKvfsF5K1NUKfwTdscAu+V0quceiqJzTkZS+AyhWeUnObuubMlBFy9P0bLVCYI9g==
X-Received: by 2002:a05:6870:f69d:b0:10d:81ea:3540 with SMTP id el29-20020a056870f69d00b0010d81ea3540mr129518oab.257.1662583179316;
        Wed, 07 Sep 2022 13:39:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w9-20020a056830280900b00638a1c49383sm7416310otu.78.2022.09.07.13.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:39:39 -0700 (PDT)
Received: (nullmailer pid 301426 invoked by uid 1000);
	Wed, 07 Sep 2022 20:39:38 -0000
Date: Wed, 7 Sep 2022 15:39:38 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Lewis Hanly <lewis.hanly@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vattipalli Praveen <praveen.kumar@microchip.com>, Rob Herring <robh+dt@kernel.org>, Hugh Breslin <hugh.breslin@microchip.com>, Shravan Chippa <shravan.chippa@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Wolfgang Grandegger <wg@aries-embedded.de>, devicetree@vger.kernel.org, Cyril Jean <Cyril.Jean@microchip.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Message-ID: <20220907203938.GA301364-robh@kernel.org>
References: <20220901133403.3392291-1-conor.dooley@microchip.com>
 <20220901133403.3392291-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901133403.3392291-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_133942_774150_59F0B7EC 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

On Thu, 01 Sep 2022 14:33:57 +0100, Conor Dooley wrote:
> Add a compatible for the Aries Embedded M100PFSEVP SOM + EVK platform.
> 
> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
