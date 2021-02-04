Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D176BC43381
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:49:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F85B64F3B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F85B64F3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GH7dpsuEMn8YHz+ZLNt8S5WRxxzwuy67+NMeAPrNboc=; b=XMaPUrSammxKyUJLA6UKPx4Bq
	E0p+0M1Yfi4fKuCPwAC4tYR60/YlIgB9KEX9IEzq4K0ZitY9b5e6YavM5ZzzeZWE8f00oIupliOFu
	VJQRcdGz/Nt0Aa3z4NFPcI5diHKIS2NeYtwgMtdPzaCBC6CGhfuxLSogcSQuvbx1V9giEo0rfrsIG
	Wv2O2wSicL+d68N2ngKpbTGYZPrnOkoO5BtzFE42qT5j0ngpuLEEAJAGRbdvXeIrQ7t+ilNu7nxdk
	T/p5bRyYD2LzEexUplqfvTVlZZ3WgzXgDm5qW8dhZWKnmD8rpLZQhXGJhuLGRWQdqPvtub/E+Whym
	yYjrDQlSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7oN9-0005tP-8N; Thu, 04 Feb 2021 23:49:15 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7oN6-0005sX-52
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 23:49:14 +0000
Received: by mail-ot1-f46.google.com with SMTP id f6so5201473ots.9
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 15:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ujKKPyVHwip2iooxgoniPpsfzJBEpSx9nQF+FjoURTE=;
 b=d9X9A1tbA//v9wPqCBdHFQdOr7ObFGlq3d12R2yIYPS/F/RLAuSO4+yi/VpIXvO+4J
 TlR2MylpOoTIGYSLk3Mg6wpPI+MbD8TH/hvg4rXTyPwdtx0sSFknNriVPR9/BOZMEy16
 k14zE/Zx9CItxJ9+AZYk0ghkOehds8q2D+tbeMiWEghzKOkB3R/7jVeM3myeAehL2G59
 8ZHuTqxLrGmYrC8Sz06XS9NEn2pbq3bC2cqpwm2WSqugHzAps7Y6KPyAX4ZBQt1inb/x
 lD7nlcphzjqffmg9y1VKi4mG+knMzU+RTSLz68RN+EKV3Wul5uNFV4NFYh3kBGL7xpT5
 E0pw==
X-Gm-Message-State: AOAM533W5SNa0B785yCrgZErgaIpDybMKRnOR3XcSDRQOga8FV0JTglD
 F7jIbD7JWmxF7IdomwCdIA==
X-Google-Smtp-Source: ABdhPJwQXWC4FRe5+6UmvIvwWvEbR9zdYMHF0diVZ1sZNS48eDu698kJLYYfDt1Qlvp53k0tfAp+hA==
X-Received: by 2002:a9d:66d1:: with SMTP id t17mr1352306otm.163.1612482551356; 
 Thu, 04 Feb 2021 15:49:11 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u191sm1489401oif.6.2021.02.04.15.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 15:49:10 -0800 (PST)
Received: (nullmailer pid 1352976 invoked by uid 1000);
 Thu, 04 Feb 2021 23:49:09 -0000
Date: Thu, 4 Feb 2021 17:49:09 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v15 05/16] dt-bindings: update sifive clint compatible
 string
Message-ID: <20210204234909.GA1351854@robh.at.kernel.org>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-6-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203125913.390949-6-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_184913_242910_FCA9E14F 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 09:59:02PM +0900, Damien Le Moal wrote:
> Add the "canaan,k210-clint" compatible string to the Sifive clint
> bindings to indicate the use of the "sifive,clint0" IP block in the
> Canaan Kendryte K210 SoC. The description of the compatible string
> property is also updated to reflect this addition.
> 
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 2a0e9cd9fbcf..1a7d582a208f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -22,16 +22,23 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: sifive,fu540-c000-clint

Use enum here too.

> -      - const: sifive,clint0
> +    oneOf:
> +      - items:
> +          - const: sifive,fu540-c000-clint
> +          - const: sifive,clint0
> +
> +      - items:
> +          - const: canaan,k210-clint
> +          - const: sifive,clint0
>  
>      description:
> -      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
>        Supported compatible strings are -
>        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> -      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> -      CLINT v0 IP block with no chip integration tweaks.
> +      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
> +      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
> +      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
> +      integration tweaks.
>        Please refer to sifive-blocks-ip-versioning.txt for details
>  
>    reg:
> -- 
> 2.29.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
