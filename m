Return-Path: <SRS0=2rL4=YD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC01BC47404
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2019 00:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EF6206C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2019 00:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zq7KO3xw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZxD4EoEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EF6206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xPRD1MiV86UTpyTv3dzQiwWMow1+naqInsJzhPAV2c=; b=Zq7KO3xwmOa7Vd
	RZ2rfOwi0dL5Qh1trmL/xqdrc9MVggtbqa8Xp6iHBug9RpFTLnsfTz2LcRYrxBYA2jkKmwT/Juqcp
	zxkKY9MIz66W14L8/YDG0IGNuIXtl3zeWt6a3TnxHQR5v/cewo7eUzv5Kc5HBaQDKU3HeoNVBij5L
	V1occRTfMBBwW85u3FogmPN49i9DmDwqgzKkV76/ysK855zoygzwgBniIKliFnIJIKkaJnmhLJZaC
	LIa4jUr9ynkgeIO9K4g80MVNuJyjisePn+TwYvougps3h2UYBYm90ocvY6Z8v+aBtMQDX3GMlKsYw
	u3WvlrbGnN4nXGgpOsnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIM0g-0005Yh-Un; Thu, 10 Oct 2019 00:08:50 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIM0d-0005Y3-Il
 for linux-riscv@lists.infradead.org; Thu, 10 Oct 2019 00:08:49 +0000
Received: by mail-io1-xd43.google.com with SMTP id b136so9690135iof.3
 for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2019 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=27bPZ5AjHbkAvma41N9WmP13swNHgshH29767ZOGwvE=;
 b=ZxD4EoEu6a0XX57fQ9vuCr2Qdbqb486Yy+eIELlgZpMWd2I1HaiX7iC7Jq5ct1DnzT
 i6A1uNstnxnfaoLOabt8dbFoPCAUoEmXI0aSSZduZw5ByiVNKjG9ayG/ksg0vYYuGcPG
 JC79MRCqUSPJM/BY2C/Vsfya1TawIGSSndPMZgAvaxG/M9J4OkJM5LYCwwtbp8tlLzyA
 O3l39mNFN6sRktrkV1/gU8eAIFxT0MELDrPLBjI6eB9+cHbJANLr4tQSnreXsnNpbMfO
 1/VFr2dIiqCzhh3YWpSQhne6zKR0hlqfH03njxQcCAvNPPAe7wMKVLHAPh8ePGOw5lSr
 IFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=27bPZ5AjHbkAvma41N9WmP13swNHgshH29767ZOGwvE=;
 b=PfN/2TbKS5PqYvx0EVRd3oUJhyc4/4lWE7KvdiHZZdWOiRiDBjx0/K30O+FO4PtCEB
 gwOD4odtCTPQ3brTy4Z8mOFfFMJKXQf2kEc0KRUfmsG66WDPFYYUtFIHwimJMs3mXCr2
 6Mjf4SmOlyLqF96lo5kgS8lOAclffGL/XsiyuoXudL3s24vt2DYzzGxOjoqe/cRY6p+b
 9Y76ePcyXmvBLvbn8+2OAUGtSvdt5UJdmrg9BtXvHvSEATk4EU2RYCpTt40ec74q91zN
 p8OTMzPF2Lg+QuKza+Tsir/5/u82dkuG7NSmviMQSoYJPYSTrSoZRGqvmQLuuJypN5pm
 DNng==
X-Gm-Message-State: APjAAAUxvrh9/7atqWxcURyRTkKHiYn9OOq+9r20ENyLjvLNTIYhQltN
 S59hpOFIW7YlV/NdOCswcwJOQQ==
X-Google-Smtp-Source: APXvYqx8WLA6LKnMW9EfBeEKRznNEk0nJV0oAheX1NZ38rElDZ1PT+oHrJ0dYK7NlOJowD+Wsbrqlw==
X-Received: by 2002:a02:6d08:: with SMTP id m8mr6621388jac.34.1570666126079;
 Wed, 09 Oct 2019 17:08:46 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z20sm1627289iof.38.2019.10.09.17.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 17:08:44 -0700 (PDT)
Date: Wed, 9 Oct 2019 17:08:43 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: riscv: Fix CPU schema errors
In-Reply-To: <20191009234648.2271-1-robh@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1910091657240.11044@viisi.sifive.com>
References: <20191009234648.2271-1-robh@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_170847_649809_03E94464 
X-CRM114-Status: GOOD (  16.40  )
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
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 9 Oct 2019, Rob Herring wrote:

> Fix the errors in the RiscV CPU DT schema:
> 
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@1: 'timebase-frequency' is a required property
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible:0: 'riscv' is not one of ['sifive,rocket0', 'sifive,e5', 'sifive,e51', 'sifive,u54-mc', 'sifive,u54', 'sifive,u5']
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible: ['riscv'] is too short
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
> 
> The DT spec allows for 'timebase-frequency' to be in 'cpu' or 'cpus' node
> and RiscV is doing nothing special with it, so just drop the definition
> here and don't make it required.

The RISC-V kernel code does in fact parse it and use it, and we currently 
rely on it being under /cpus:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/kernel/time.c#n19

The RISC-V user ISA specification also constrains the timebase-frequency 
to be the same across all CPUs, in section 10.1:

  https://github.com/riscv/riscv-isa-manual/releases/download/draft-20190608-f467e5d/riscv-spec.pdf

So the right thing is to require 'timebase-frequency' at /cpus, and forbid 
it in the individual CPU nodes. 

> 
> Fixes: 4fd669a8c487 ("dt-bindings: riscv: convert cpu binding to json-schema")
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 28 ++++++++-----------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index b261a3015f84..925b531767bf 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -24,15 +24,17 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sifive,rocket0
> -          - sifive,e5
> -          - sifive,e51
> -          - sifive,u54-mc
> -          - sifive,u54
> -          - sifive,u5
> -      - const: riscv
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,rocket0
> +              - sifive,e5
> +              - sifive,e51
> +              - sifive,u54-mc
> +              - sifive,u54
> +              - sifive,u5
> +          - const: riscv
> +      - const: riscv    # Simulator only
>      description:
>        Identifies that the hart uses the RISC-V instruction set
>        and identifies the type of the hart.
> @@ -66,13 +68,6 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>  
> -  timebase-frequency:
> -    type: integer
> -    minimum: 1
> -    description:
> -      Specifies the clock frequency of the system timer in Hz.
> -      This value is common to all harts on a single system image.
> -
>    interrupt-controller:
>      type: object
>      description: Describes the CPU's local interrupt controller
> @@ -93,7 +88,6 @@ properties:
>  
>  required:
>    - riscv,isa
> -  - timebase-frequency
>    - interrupt-controller
>  
>  examples:
> -- 
> 2.20.1
> 
> 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
