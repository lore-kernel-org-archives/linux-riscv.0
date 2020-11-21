Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D5AC388F9
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 23:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6481220A8B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 23:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ug50LuNv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6481220A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2sLMj2EqGKrcE4IBUo1yUPybwVLg2p/Z+S1ob0bZLr0=; b=Ug50LuNvFlKATlh4ZuIG3Qc6Z
	bunmh/+PQmqK1X10c9RXGEa8LoTK981s1scwE3PQskj8IAN0glkzf9zylIR+g8l6meORsi+5xm+IU
	FE2A+1z++gz/WIJDrUaD46r2X57pPZ+GHkOzMqJ+CpY488y7jSaLr2+8tM+1qhsCbCFW0/vQXNkG3
	aOFkBmj6smXyjps0w9TfbfH3OfVJRw+lgLpEyAMkqfJPtPaMUhX7/9lHF1LUS7KP6obOOdJv9WvIZ
	4LVPiGaRSO5Qul+8aHZKSJX4Ap3SRdsoy5ysmbw4ejlsp5M5Tkj3mvJ6RCkipr7flMw3htso5vFJ9
	fXGaz+JXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcTN-0005g0-4k; Sat, 21 Nov 2020 23:39:17 +0000
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcTJ-0005ez-Oj
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 23:39:14 +0000
Received: by mail-qt1-f195.google.com with SMTP id z3so10051878qtw.9
 for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2020 15:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i2ejWjSwcsPIE/JaW7yGyr3QkPvl0CuFfocLUWFS4q0=;
 b=eTW8wzpt2HINxmX9mef5owF/C7RznrhORbi9vsSfPgDywjASZMjGYN78N+M2Ah+VOx
 cEOaNhnmfTUSg/FBRShaS4nRbltFPD0LDOa2UppneSQxyf5Y68AoA/E6qVm0Sw/bCx1I
 scL1kQ46vhmQET060LrEqF38OBVGDFMno2In6nMWeBDylzFWGD/8cTzhhrttPvXvj/5w
 uBTHtIgu9O00V7D54ExT5FMhNxZPkaZOlpXUQYd8o+p05ZTNLXTVnHSGG4A114MqF8X9
 xHnmxbK9mGu0YbB5mq3u399e9ZpPffiDCUuDOb4meYti1xj31iElbq83vL4t7Q20sAua
 ImBQ==
X-Gm-Message-State: AOAM5320xNcfrbbhv1bR/iUtTqP7ez3zb6K1UiOKACNH5ATjTygP0iLE
 qBea4ctTKl0UvHM0WcTMmVnh7v1g5Q==
X-Google-Smtp-Source: ABdhPJyI4dNE34z1SUnPBQWVLYdjgLqPkdV2CupYPMB8yoQfkzgp69+njbLGZoagfA+JOBlg9NQeBg==
X-Received: by 2002:a37:a481:: with SMTP id
 n123mr20961708qke.114.1605963288811; 
 Sat, 21 Nov 2020 04:54:48 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
 by smtp.gmail.com with ESMTPSA id s134sm4045140qke.99.2020.11.21.04.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:54:48 -0800 (PST)
Received: (nullmailer pid 2081252 invoked by uid 1000);
 Sat, 21 Nov 2020 12:54:43 -0000
Date: Sat, 21 Nov 2020 06:54:43 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] RISC-V: Update l2 cache DT documentation to add
 support for SiFive FU740
Message-ID: <20201121125443.GA2076465@robh.at.kernel.org>
References: <1605172274-44916-1-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605172274-44916-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_183913_900538_94D30C11 
X-CRM114-Status: GOOD (  18.46  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 sachin.ghadi@sifive.com, palmer@dabbelt.com, sagar.kadam@sifive.com,
 Jonathan.Cameron@huawei.com, linux-riscv@lists.infradead.org, bp@suse.de,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 12, 2020 at 02:41:13PM +0530, Yash Shah wrote:
> The L2 cache controller in SiFive FU740 has 4 ECC interrupt sources as
> compared to 3 in FU540. Update the DT documentation accordingly with
> "compatible" and "interrupt" property changes.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 33 +++++++++++++++++-----
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index efc0198..4873d5c 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -27,6 +27,7 @@ select:
>        items:
>          - enum:
>              - sifive,fu540-c000-ccache
> +            - sifive,fu740-c000-ccache
>  
>    required:
>      - compatible
> @@ -34,7 +35,9 @@ select:
>  properties:
>    compatible:
>      items:
> -      - const: sifive,fu540-c000-ccache
> +      - enum:
> +          - sifive,fu540-c000-ccache
> +          - sifive,fu740-c000-ccache
>        - const: cache
>  
>    cache-block-size:
> @@ -51,12 +54,6 @@ properties:
>  
>    cache-unified: true
>  
> -  interrupts:
> -    description: |
> -      Must contain entries for DirError, DataError and DataFail signals.
> -    minItems: 3
> -    maxItems: 3

Keep this here and just change maxItems to 4. Really, what each 
interrupt is should be listed out as an 'items' entry.

> -
>    reg:
>      maxItems: 1
>  
> @@ -67,6 +64,28 @@ properties:
>        The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
>        The reserved memory node should be defined as per the bindings in reserved-memory.txt.
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,fu540-c000-ccache
> +
> +then:
> +  properties:
> +    interrupts:
> +      description: |
> +        Must contain entries for DirError, DataError and DataFail signals.
> +      minItems: 3
> +      maxItems: 3

Here you just need 'maxItems: 3'.

> +
> +else:
> +  properties:
> +    interrupts:
> +      description: |
> +        Must contain entries for DirError, DirFail, DataError, DataFail signals.

DirFail should be last so you keep the same indices.

> +      minItems: 4
> +      maxItems: 4

And 'minItems: 4'

> +
>  additionalProperties: false
>  
>  required:
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
