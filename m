Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B28C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:48:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F33B64F3D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F33B64F3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rlrbVWL2Cd9ptxD7NU7q12G/mMhdmvixxyjelseoOUE=; b=YTxCDpmVrTcnV92TvhlbZSNvH
	9eVZALqTfIRmawo0kyMdJbiQsYLMJ6x4+9Lg2KFiNW2XIStwqcwuPgFHxbec0p99s30sx7zCnsJW3
	TBGoz53qwUjRulUk38Y9rWQjfOEbzRNm+SdarriBPZayeIhJxSJp0hsO4yUZDA6633KgXzaJK8B9w
	hPLZOWz9qI/kVpAq7iaZ0zglBKwUgHnARFp9VxgLNtAr29xwDlbcK5aG3R/tZAXKhKSk8SBf7aw1k
	Xxq2Kac8Vf9F1O/0ofFCWx7SS6HB8TXy19vDNsyAnVoHGaATO5jZ61LdutZ8OJz2R/V99CSzoBne2
	nV677Sehg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7oML-0005ns-M4; Thu, 04 Feb 2021 23:48:25 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7oMJ-0005nW-OO
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 23:48:24 +0000
Received: by mail-oi1-f177.google.com with SMTP id y199so3640736oia.4
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 15:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=11/yMWgByTqPQ9weDtZWBZUCQwidOO2D/gNIb+qEPA0=;
 b=rSAp4+QfVoMU9uTQ0IVPAvU3XZ61idP5/AZDpV5sQq+ViGGmLq3BvI6K6rCuCffOm0
 srH7tvY6KMbNWk1zSAeOWTLtOkm46zeg21eN/XfSpna68kVMDUtJ7R0R6lJQ7AtOFzDq
 yZdGFBANXnwOiO8NoNgL0no97vEDQ04hAEfbf/raoouNC60EiW01N3BdhvUys5MAWfsS
 Lr+UdRImg1H4bWRNruceHZYUj5V1NHqQLlLRTxlzvgSs7RJl4Ip4RK2D8Wo3Ts2N0O08
 rRdVkAXgIFPxfKShOKGaCdt00+t+VMsMp6VApidWH6QQ6fHuH7gczbQ/LBP13/4cGMty
 vDHA==
X-Gm-Message-State: AOAM530TgR4qRYHiGxCL3R9kVRnbgY48nkdJ3Oh5FdiMfsze2T2cX81J
 WZoOheTL1AWBH5fKj1YObg==
X-Google-Smtp-Source: ABdhPJzEKNvcRP/gBap1YCoizQhQGD6VDBVxF79naB9mCenOK0QmnSW6cmSGWhUCEOtNlJFZGci5ag==
X-Received: by 2002:a05:6808:8fa:: with SMTP id
 d26mr1376841oic.6.1612482502087; 
 Thu, 04 Feb 2021 15:48:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m22sm1408338ooj.43.2021.02.04.15.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 15:48:21 -0800 (PST)
Received: (nullmailer pid 1351403 invoked by uid 1000);
 Thu, 04 Feb 2021 23:48:19 -0000
Date: Thu, 4 Feb 2021 17:48:19 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v15 04/16] dt-bindings: update sifive plic compatible
 string
Message-ID: <20210204234819.GA1348461@robh.at.kernel.org>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-5-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203125913.390949-5-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_184823_838228_9F82FC78 
X-CRM114-Status: GOOD (  18.52  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 09:59:01PM +0900, Damien Le Moal wrote:
> Add the compatible string "canaan,k210-plic" to the Sifive plic bindings
> to indicate the use of the "sifive,plic-1.0.0" IP block in the Canaan
> Kendryte K210 SoC. The description is also updated to reflect this
> change, that is, that SoCs from other vendors may also use this plic
> implementation.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../sifive,plic-1.0.0.yaml                    | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index b9a61c9f7530..04ed7a03c97e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive Platform-Level Interrupt Controller (PLIC)
>  
>  description:
> -  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
> -  (PLIC) high-level specification in the RISC-V Privileged Architecture
> -  specification. The PLIC connects all external interrupts in the system to all
> -  hart contexts in the system, via the external interrupt source in each hart.
> +  SiFive SoCs and other RISC-V SoCs include an implementation of the
> +  Platform-Level Interrupt Controller (PLIC) high-level specification in
> +  the RISC-V Privileged Architecture specification. The PLIC connects all
> +  external interrupts in the system to all hart contexts in the system, via
> +  the external interrupt source in each hart.
>  
>    A hart context is a privilege mode in a hardware execution thread. For example,
>    in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
> @@ -41,9 +42,14 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: sifive,fu540-c000-plic

Change this to an 'enum' and add 'canaan,k210-plic'.

> -      - const: sifive,plic-1.0.0
> +    oneOf:
> +      - items:
> +          - const: sifive,fu540-c000-plic
> +          - const: sifive,plic-1.0.0
> +
> +      - items:
> +          - const: canaan,k210-plic
> +          - const: sifive,plic-1.0.0
>  
>    reg:
>      maxItems: 1
> -- 
> 2.29.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
