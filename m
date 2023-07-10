Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E72EEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 15:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTgEbwxZYMYXAzGU1X83vT66sV4AHf37ZiGem+iM3qY=; b=yUyGFKjpowuUaz
	uyzV3Cyxcz6PrcSwPqCSORAPgGUzwR1zyLa4Pk/hUuL8Zlq33VCVU2YysIW8lZJeor/g4iRoIiud7
	EnfshXX47M802zm2XUb4O8ttxJqx/3CgEGfv4maRvsK/p0GRRZOBHjLqdXZlMvIA8W7AvpTelAR8W
	ROoCBLlO0ysziZxAIWKBo9TUzJGqvEssYWLRdx8mCDEq3lb6H4sXATdDxBeinTk6hpv9R3rQtugmV
	UvdP4RsUAgQ9xfOaFiKvxuugPQEioaNg3GCAw0aSeT0Iuyj8lHlttoDpXuiLBiyiossZIY5GTlmKU
	IKo/2akFgHTCZE+cYzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIscq-00ByrX-1v;
	Mon, 10 Jul 2023 15:16:32 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIscn-00Byqs-2E
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 15:16:31 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-345b347196cso16429015ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 08:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689002187; x=1691594187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY0GxBN2xgwjo+bXMXBJ7K5xkLz0l0SkC1bgFRQbePc=;
        b=L/G4lw5wgLljsISAkjelplR2miOwDayJX6ZO1FQ5wHSCcuUVo+Fca7nydLgDswkacP
         6XAzqB8Q7w3ifiwym53kulXN3c8FMvwggsNVaya3J8RKh0KxXsDYQBROjLKQIOVs8EhO
         Nifo//f55y5Lu3WoKY3P0GaViFWFzwDkQ7f5zCtWk+TBfcc6X0N34/AnXhx3/Rt0EHY0
         iEhFyJaJgzh29mFq/aHn7icgtxBFjQdXhitHhr2dKq+Qgj6L3Pr0M9q/LwmCZPHXRk9D
         oXG//9wLW9yD9VqrgNJEAcdGfBLCVzzr7zmnxQ2gIsyap4CN0HRwjea/rugkS48RdiRA
         XFow==
X-Gm-Message-State: ABy/qLZuYWDDgRX2a/oTb3ljCc/Rx2VFo246jop58MOCLMnVOrnnTwNF
	CpoKgOMPyAx0Zq9MSEoOuw==
X-Google-Smtp-Source: APBJJlHQ3fBw2fUWi1AJFW/AlBFt3ZRHqEH8HOO/lErk7nSvGOLZYzoYpqWfGTdLNdnO9DrDV6/6ig==
X-Received: by 2002:a92:c142:0:b0:345:775f:1a2f with SMTP id b2-20020a92c142000000b00345775f1a2fmr12648247ilh.14.1689002187559;
        Mon, 10 Jul 2023 08:16:27 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c12-20020a92d3cc000000b003460b697bc0sm3610370ilh.59.2023.07.10.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:16:26 -0700 (PDT)
Received: (nullmailer pid 1992483 invoked by uid 1000);
	Mon, 10 Jul 2023 15:16:24 -0000
Date: Mon, 10 Jul 2023 09:16:24 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, "Hongren (Zenithal) Zheng" <i@zenithal.me>, Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: riscv: Document the 1.0 scalar
 cryptography extensions
Message-ID: <20230710151624.GA1987602-robh@kernel.org>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-3-sameo@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230709115549.2666557-3-sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_081629_731420_6B342084 
X-CRM114-Status: GOOD (  20.19  )
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

On Sun, Jul 09, 2023 at 01:55:44PM +0200, Samuel Ortiz wrote:
> The RISC-V cryptography extensions define a set of instructions, CSR
> definitions, architectural interfaces and also extension shorthands for
> running scalar and vector based cryptography operations on RISC-V
> systems.
> 
> This documents all the dt-bindings for the scalar cryptography
> extensions, including the Zk, Zkn and Zks shorthands.
> 
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..361756978da1 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -190,6 +190,24 @@ properties:
>              instructions as ratified at commit 6d33919 ("Merge pull request #158
>              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
>  
> +        - const: zbkb
> +          description: |

Don't need '|' if no formatting to preserve.

> +            The standard Zbkb cryptography extension for bit-manipulation
> +            instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zbkc
> +          description: |
> +            The standard Zbkc cryptography extension for carry-less multiply
> +            instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zbkx
> +          description: |
> +            The standard Zbkx cryptography extension for crossbar permutation
> +            instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
>          - const: zicbom
>            description:
>              The standard Zicbom extension for base cache management operations as
> @@ -240,6 +258,70 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  
> +        - const: zk
> +          description: |
> +            The standard Zk cryptography extension is a shorthand for the
> +            union of the Zkn, Zkr and Zkt cryptography extensions, as ratified
> +            at commit 73de909 ("Zvk: Update AES instruction specs") of
> +            riscv-crypto.
> +
> +        - const: zkn
> +          description: |
> +            The standard Zkn cryptography extension covers the NIST algorithm
> +            suite that other cryptography extensions support. It is the union of
> +            the Zbkb, Zbkc, Zbkx, Zknd, Zkne and Zknh extensions, as ratified at
> +            commit 73de909 ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zknd
> +          description: |
> +            The standard Zknd cryptography extension for AES block cipher
> +            decryption acceleration instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zkne
> +          description: |
> +            The standard Zkne cryptography extension for AES block cipher
> +            encryption acceleration instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zknh
> +          description: |
> +            The standard Zknh cryptography extension for SHA2 hash algorithm
> +            functions acceleration instructions as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zkr
> +          description: |
> +            The standard Zkr cryptography extension for the entropy source CSR
> +            definitions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zks
> +          description: |
> +            The standard Zks cryptography extension covers the ShangMi algorithm
> +            suite that other cryptography extensions support. It is the union of
> +            the Zbkb, Zbkc, Zbkx, Zksed and Zksh extensions, as ratified at
> +            commit 73de909 ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zksed
> +          description: |
> +            The standard Zksed cryptography extension for SM4 block cipher
> +            acceleration instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zksh
> +          description: |
> +            The standard Zksh cryptography extension for SM3 hash algorithm
> +            funstions acceleration instructions, as ratified at commit 73de909
> +            ("Zvk: Update AES instruction specs") of riscv-crypto.
> +
> +        - const: zkt
> +          description: |
> +            The standard Zkt cryptography extension for data independent
> +            execution latency attestation, for a safe subset of instructions,
> +            as ratified at commit 73de909 ("Zvk: Update AES instruction specs")
> +            of riscv-crypto.
> +
>          - const: ztso
>            description:
>              The standard Ztso extension for total store ordering, as ratified
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
