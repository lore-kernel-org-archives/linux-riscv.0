Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79743C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyThqhRksukf4c+FaN4938SREI3k11l1XqtXuuDgSvA=; b=lb9S5OdzgNwxkQ
	rnrfIUKf/hv53UiIXMHRvdRhA/b2mVy6XQcoqEqTLgYRGE8OxzkKnpUnyBefl3GbXraRbl/Pts17Z
	AyPUjEJk6fvOhGKSdKPk18JN08ykInea3kw20/CmCOJsBckw/NGUFe2AdW3MfM0VLkx7TCBEtU03A
	PBOiTUYiP6JoxSvSmkjaoYtnAidGJzhMHq7HD/9OFGWjINcuTchXAC6gG7UFJW+/QEoQzN95GW7IC
	sXhM56Qb2qF8tBY9Cx6+UnIF0F0DuejLhdMprHxOcKtU50HnqyC6VKTLe8hEcqBRoBkb87si2BBBo
	OQpMZhycRbW4UeiKN4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP9MR-00A17g-Hv; Mon, 06 Feb 2023 21:49:15 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP9MN-00A174-OS
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 21:49:13 +0000
Received: by mail-oi1-f176.google.com with SMTP id v15so3780023oie.9
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 13:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZFI+/lEvE5K9+MX/lX7wGVqblszW07L3zZfHhu2VpE8=;
        b=rVel24n8pulNAiP/XDASpVQsMqrkpxM+NMu/MFKTxSo9lfCzSj/1Ew5iOpfj3oftC/
         oXyIF/w9mHSNchxhJnWO/h0suLa3nTKUd4BI5devNDDCo94/spa+EqcdhTagI00Da7n9
         u8uvkYkkL1uGAwQzWya4L1IBDWfi0T0RJPKa8NvOeUfL3gKtxifCjmdA7a8hhnUkEU0x
         HePbLsxpU5RoUGx00nIc0BZaMrsp9J98TELUr3jMdApUsTBhBEDkNB8f1nXdmyFC/vhi
         WiJxRt+hWIesysKokcNOf5K1eZ8Rcheta3t+vjjahlvevAtAgXwc6cx4F++H0B7g/tTL
         Dtng==
X-Gm-Message-State: AO0yUKWT+3QMUFGVCeYyVXpTGQikh0ov/SBTjvwI+lySHcMTR6l+dTyp
	K1k2nwFZZw6qhDgDmqwusw==
X-Google-Smtp-Source: AK7set/b9EK0D0dcwYXOHIkT9giyg++xP/90Rp97QYsgMQU7HZYqOVA5S9DL/zc4egmaNaVWRMDoUQ==
X-Received: by 2002:a05:6808:3cf:b0:36e:bb55:d51a with SMTP id o15-20020a05680803cf00b0036ebb55d51amr104844oie.52.1675720150212;
        Mon, 06 Feb 2023 13:49:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bm49-20020a0568081ab100b0035c073aa0d8sm4716586oib.18.2023.02.06.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 13:49:09 -0800 (PST)
Received: (nullmailer pid 1563640 invoked by uid 1000);
	Mon, 06 Feb 2023 21:49:09 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, heiko@sntech.de, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, slewis@rivosinc.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, vineetg@rivosinc.com, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@rivosinc.com>
In-Reply-To: <20230206201455.1790329-5-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-5-evan@rivosinc.com>
Message-Id: <167571795981.1495930.2331543227113728240.robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access
 performance
Date: Mon, 06 Feb 2023 15:49:09 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_134911_818317_7548508F 
X-CRM114-Status: GOOD (  13.21  )
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


On Mon, 06 Feb 2023 12:14:53 -0800, Evan Green wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This key allows device trees to specify the performance of misaligned
> accesses to main memory regions from each CPU in the system.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/cpus.yaml:91:72: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/riscv/cpus.example.dts'
Documentation/devicetree/bindings/riscv/cpus.yaml:91:72: mapping values are not allowed here
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/riscv/cpus.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/riscv/cpus.yaml:91:72: mapping values are not allowed here
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.yaml: ignoring, error parsing file
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230206201455.1790329-5-evan@rivosinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
