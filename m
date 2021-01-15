Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B1AC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 16:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C6272388B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 16:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C6272388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0tSIvdQsJnDR8bUklqqVOnJcaFaLuz5zuKTv2nHxrSA=; b=DEVGDpwlUlpQnhsdtz0rFiZdI
	WoS4bFZezk1JAqI5qrnxm+vezVHLj00IHGjGiQg5NQG/TBzEpaoiK0uWm1ViwvRZYXcJ2kwReDiuu
	6PtDsiz25aYZGjTcU6/wSYED2mA0zS9xjGxiDq/GpbaslW5IQQeKcmmyGGFEIukYGSKsnGW55yk9G
	4UDunhnnLXytSmhEN4ZKYm5RBpBk0RczGykO2O371hnWT7OaMz1T+QWn9TTujqnTJhwVqOKoD9+3F
	ye2CbD0Cehn+HX5+R3uIT9iu0wv9FXmzg0kq3uTEmLM8RRMq+OQdqPDLOijK+rdbKJcvMxgXn8HcH
	OIBr/A/6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Rd7-0001MS-M4; Fri, 15 Jan 2021 16:07:17 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Rd6-0001M3-AL
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 16:07:16 +0000
Received: by mail-oo1-f54.google.com with SMTP id v19so2312870ooj.7
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 08:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/QRrPepIueUPUGgyuQRPWTiWrdA5KCQ1xLVEAMjrH2Q=;
 b=I7Lnw4qKY8BbSco11Koboxq4pRf1SOygCoXPGv+fwucPDywvwBQbvjIwUtuaSsn1iG
 gL7AySruP5suBEEfMYRpBCuH9nMgMRpLg9vQneU/9H8Evm9E0mzbYmosF+JR5JAC9BRA
 OJKdSYBT5knzfb5+ucNmo3VB2D+RIFKrcUm/xnWQ4aT624w5nG8rdLxzQ0W4Gr//SFdJ
 GVw80k5ttlsk3V+VbKsWxBkT75d9aW8DI7iMCjJHoJZmEaUTXaxWnvwm2JduD2zQNjXn
 edn3HhoYe7K8dYLAhtKrMfhMQYJmiv23bBnV3DlUTdcVW9XqPN9mWbJKHgxO9nbRR0+/
 10nA==
X-Gm-Message-State: AOAM5332WQTnME8t6PEU1syBrwo298m1ybfhrkdVaotxIKNMULPkUFMv
 BlwPn40NPU2SJI9uDni5lg==
X-Google-Smtp-Source: ABdhPJzmtO628wZGK4ysGymnUa/InhhVBJu2jhrxrq/nbI0GRacS4TTBdVHY0BBkp+TPbot63YlHuw==
X-Received: by 2002:a4a:a7c5:: with SMTP id n5mr8653884oom.9.1610726835465;
 Fri, 15 Jan 2021 08:07:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m29sm1883035oof.20.2021.01.15.08.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:07:14 -0800 (PST)
Received: (nullmailer pid 1357977 invoked by uid 1000);
 Fri, 15 Jan 2021 16:07:13 -0000
Date: Fri, 15 Jan 2021 10:07:13 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v12 08/17] dt-bindings: fix sifive clint compatible string
Message-ID: <20210115160713.GA1353145@robh.at.kernel.org>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
 <20210115140352.146941-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115140352.146941-9-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_110716_363683_891C5549 
X-CRM114-Status: GOOD (  14.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 15, 2021 at 11:03:43PM +0900, Damien Le Moal wrote:
> Fix the Sifive clint compatible string definition to make the value
> "sifive,fu540-c000-clint" optional, allowing a DT to specify only
> "sifive,clint0" for its generic implementation without any tweak.
> With this change, a Sifive clint node can now be defined as explained
> in the compatible string description.

NACK.

How do you know you'll never need some tweak? Adding it to the DT later 
defeats the whole point of not having to do DT updates to implement 
work-arounds and/or enhancements.

> 
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 2a0e9cd9fbcf..c6b1f37a2949 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -22,12 +22,13 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: sifive,fu540-c000-clint
> -      - const: sifive,clint0
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,fu540-c000-clint
> +              - sifive,clint0
>  
>      description:
> -      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
>        Supported compatible strings are -
>        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
>        onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> -- 
> 2.29.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
