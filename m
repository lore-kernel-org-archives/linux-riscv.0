Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B93C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 23:21:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AED0238E5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 23:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AED0238E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wuoZsPvFz80MIjRhUyjijT7k6wvsikAl7rK5jCMvQVI=; b=P32eaeEjr4NR9T33rVnQ4Tf/s
	sSQdUvwwu/AnvwlmLiivpIMpw9SZ7sKstDxaB+mE0mOqOxApYMyVcDCp3kvAAisWulVqAiEFjag1z
	EgmAicDmNGq9T9QJ80m5peoYvkfBXwBGhbA3Djtm++r46+34eFyZAhV4zd7+FCYv/fhAnFiOCC6ot
	F0KfcUXyMULDm6UyKHz4XBIm6IuXM2o6+zirIomDnihLrp7vnu4X5+pgOrWz2crZppFCxVJ+43RqL
	24WhxVkfA+mU7PkOq5I3IIWc8rU46n2I4F5nZRsY0zoGJAoU8hY6CROTCsFWxlH7r2HN2gYRd17DD
	zYAuopKNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmIk-0002BE-JC; Tue, 08 Dec 2020 23:21:46 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmIi-0002Ar-B4
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 23:21:45 +0000
Received: by mail-ot1-f66.google.com with SMTP id y24so450410otk.3
 for <linux-riscv@lists.infradead.org>; Tue, 08 Dec 2020 15:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eMniSFV4+130ZIEZpjALAeT/RpGcoF1J+lgVhHbcJ28=;
 b=asLmv+gAEJadjyxlsgk0x17IXeZ6SslHC4nzWtqoCJVwdEeMcA6oB+qC/k5HZUqIoG
 4fNJzlzQmLl1btvD0jlazlmo25XBB9GYj4FrwymOXrGeUQGR9hSSExXKx9KyDVOslPdE
 hR83ZTAk5ZWIziRPHBgS6tafA68gIvah9VUCCDMWI0Llxd8XdX4xOUPzL60WGRBMRO/L
 Qvp1bKQ08us2XzgGnKcw94H/uOelwuM4WlNLOBu25SN2JfQ76jCcqqn0py8d/thkTEX7
 dBGoud6Go2cN7rL0yd5auANTlO6SJM5KIcM5ULv3IbyzRb/Mo/+QONFb9yrjVbT3qYuw
 0BIA==
X-Gm-Message-State: AOAM530QiTrwUjQ3wy24BdezlULFIWTfBoAlqO6ZMJLi/IPE3gKN3Gmx
 o3tFvqcui45CyQ4z1cVy4w==
X-Google-Smtp-Source: ABdhPJyaxdlSzuLG5UOTM6JMcax7tOhiEjrsX/dso/hyIBUnZNj6th3HeOaiCH4QiM8P2Vpy0BckUg==
X-Received: by 2002:a9d:7e8c:: with SMTP id m12mr427098otp.38.1607469703203;
 Tue, 08 Dec 2020 15:21:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm67432oib.24.2020.12.08.15.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 15:21:42 -0800 (PST)
Received: (nullmailer pid 3303386 invoked by uid 1000);
 Tue, 08 Dec 2020 23:21:41 -0000
Date: Tue, 8 Dec 2020 17:21:41 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 1/2] RISC-V: Update l2 cache DT documentation to add
 support for SiFive FU740
Message-ID: <20201208232141.GA3292265@robh.at.kernel.org>
References: <1606714984-16593-1-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606714984-16593-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_182144_640669_233762F1 
X-CRM114-Status: GOOD (  18.30  )
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

On Mon, Nov 30, 2020 at 11:13:03AM +0530, Yash Shah wrote:
> The L2 cache controller in SiFive FU740 has 4 ECC interrupt sources as
> compared to 3 in FU540. Update the DT documentation accordingly with
> "compatible" and "interrupt" property changes.

'dt-bindings: riscv: ...' for the subject.

> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
> Changes in v2:
> - Changes as per Rob Herring's request on v1
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 35 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index efc0198..749265c 100644
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
> @@ -53,9 +56,15 @@ properties:
>  
>    interrupts:
>      description: |
> -      Must contain entries for DirError, DataError and DataFail signals.
> +      Must contain 3 entries for FU540 (DirError, DataError and DataFail) or 4
> +      entries for other chips (DirError, DirFail, DataError, DataFail signals)

While below is wrong, don't give descriptions that just repeat what the 
schema says.

>      minItems: 3
> -    maxItems: 3
> +    maxItems: 4
> +    items:
> +      - description: DirError interrupt
> +      - description: DirFail interrupt
> +      - description: DataError interrupt
> +      - description: DataFail interrupt

This says DataFail is optional.

>  
>    reg:
>      maxItems: 1
> @@ -67,6 +76,26 @@ properties:
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
> +      maxItems: 3
> +
> +else:
> +  properties:
> +    interrupts:
> +      description: |
> +        Must contain entries for DirError, DirFail, DataError, DataFail signals.
> +      minItems: 4
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
