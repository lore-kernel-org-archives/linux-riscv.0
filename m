Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C48C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zn21nC0I740e8qRkuWzSmq3y4xim3ncTFqOUzRnkiTA=; b=u8LS6Q+3XoHDTL
	7lIL87nzqUXaFfF29m+tka9sS8jxzCXIKSrgabxlaTJlE/72L0kGTpDnSDFIIDJAB05LwFmNX0t8e
	PBlpVRqAo+shbLMN276t7P27qyknOUQSVvFWI10I0AxnhRGk8BZwLwuT9UGPIbcKUCmxjHIeKUsOV
	bO3CoPmdfFuU3q5s/YdgLamfR4ZiuVaYkrvZgY7c5ik+hiP5sPp2+e1d/s4uctmEiO9NIHfKVPVOJ
	E/vdh/uLyne0nB5i2Mr6xNMeseVMRxSZZWZBCBj9TN+Neubi89fA75TxtmsUF2o1JeCC8qll4FYvD
	aLK+kBZoKjDZg235g89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMcD-00B7jL-0v;
	Fri, 12 May 2023 06:50:57 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMcA-00B7hL-1p
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:50:56 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96ab81aa68dso4879566b.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874249; x=1686466249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjLTSzaj/aJam+P8bDF+fpLGAFitrvdhPxYkij3cdnM=;
        b=KXwh1obIMnIY9EpDd/kl96eg4glZYjziU2VDrzj0M+j00eDbKSqTPpFCJqz/DmFc3K
         H1lt58qZtQiNFDfZbaX4CIlkv8iXrcFVEOQUORaNHfCe10LzBIrN0qWDExvq7TLcGIT1
         3A+n1zC1xhJ8STMD7DRlmrQwv6oJTWTwpLuCY5GmyG1KMqMoV6XiT9mnBxy5bBqowF8i
         QNDjZPa4hVcO1f53LLBhY+iXQty6JCJPX+wYciAn8pRtq9ZcDcKH/oT7f4SHwvTtHlMr
         zbgFi/0ILZj3NLMjLAGLlcjJ3CCk/MfX6rz8Hyob51MdWu1E9uVmb7Q3HsorM+4Ydqsx
         fbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874249; x=1686466249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjLTSzaj/aJam+P8bDF+fpLGAFitrvdhPxYkij3cdnM=;
        b=FKX9xYPdDWoXWwdKriPZOXCF3VgxdcNNPV7jxXUcjaaNjQE4ButLGoXKtIUgwMezZT
         X8u8ZxZDeCz18bLfxRhg3JfWQdx5nkJ+LFdYBWEDdcVSwFQByPY59vm19PnVEDspV+v7
         t2sqSceKocBdLXcJt2qstYy7alvcGDmN4kT93C8EGGc+jmMXSwNMlPZDjXKIPoAO9glU
         Bo7sKmCejPn0Qce2s4/3VbSaLsahp9xRH8nqBFUycnDBT6yj2V22uAXvf37AefzzmvQx
         G7Lzgk3bPT5Tpb51ETR4LfE9wNPgVl1X5xsak/Dd4kiQmHpJswcIOrDV0fESKEFTx4Xc
         idiA==
X-Gm-Message-State: AC+VfDxsKSwerc8Jf81IUOLwsfOwJBjeOs1CXrkg0GIyia0tESNGP28k
	cQo26+wFQmg9VsfcOrZsOxBANA==
X-Google-Smtp-Source: ACHHUZ76mXy1zTI9i2lKsIPaB4P4XRWrjQ/x0aamkZb6fQKroHOTuJZ7C8gUN6BprZD4LBeSRMFy3w==
X-Received: by 2002:a17:906:da87:b0:966:3c82:4a97 with SMTP id xh7-20020a170906da8700b009663c824a97mr17082800ejb.35.1683874249187;
        Thu, 11 May 2023 23:50:49 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id ci18-20020a170907267200b00959c6cb82basm4974642ejc.105.2023.05.11.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 23:50:48 -0700 (PDT)
Date: Fri, 12 May 2023 08:50:46 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: William Qiu <william.qiu@starfivetech.com>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230512065046.bhblj4uci7hnjoof@krzk-bin>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512022036.97987-6-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_235054_611928_64A5AC0F 
X-CRM114-Status: GOOD (  12.00  )
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

On Fri, 12 May 2023 10:20:34 +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 67 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml

See https://patchwork.ozlabs.org/patch/1780353

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
