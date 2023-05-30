Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAB8C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nElyJp+Q5OihDxVOSKaiH7R2vnzMQalQDN5fYQpI6Q=; b=Xd8oTGjRjqjYjq
	HUGPb/1cf04koGblWQOMYfbKMw8IfOMKfFoYCukJK22tICBaoqMQdOB3sLJYkaLTgjADhLLbOyFcA
	2ZTiUnEZ4kRr0kUTjugvzKm4Ymy/MQ5DeBdGIgEQIRS4Xkz5XuWwvHPBCvaWd5QYsoiiB0hFSrI7a
	c5ggwf7faBHDKwC6NzjL3Kd3ZXPJOY30RfJT42uqTsLsoxIfCm3ffC7GRgbvFfKkWu7AJe22GnshW
	t8U/tvGYfPc58jB7EurkQjjaY3DZN9yR0Ro6FC4em5XsQjA0GpmBkSY12+afDRy5UB63g2z+nZ4p5
	pJH7yapyCDSqcnYGaArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ysz-00DwsP-1l;
	Tue, 30 May 2023 12:55:37 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ysw-00Dwr0-2q
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 12:55:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso785924666b.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685451331; x=1688043331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBcNGihsby3nj+yLS8cmdJG0F3BB5BsBxPISYSYV4c0=;
        b=vOUygGpSI91sliwnKNGkbKUjiWID0a6Zy9yngzauWwYH5G6b/J50mnaOcyaw8kBuAc
         AKn3dLMHZlu62OOCNyWLLJ241P+sorNPfWYZUltKjsjh+4CUs7bBJRilCxQKLldsZaGN
         1Dkk0NWUd/EcHeXwQohcL9AV/k6TCJk3308LTOAarrIOytJ9zSfZEqeEhfv2QX40mwt3
         fQsfrOD0DfpbMqTgHpMdxt8qbTxm+TZsnbW4M2UaY/0LVFCI6ivoynRFqjpgwpTp+qkt
         v4jrVT3SDpl7d54jUwpMe1OD5O8EjWmrFKvz2br86YgAkFEo8qJtajItbMt81YFBPTqH
         Q76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451332; x=1688043332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBcNGihsby3nj+yLS8cmdJG0F3BB5BsBxPISYSYV4c0=;
        b=YxQW/IFLqyqIGd3PpjSDT3IjlCm5pEieBQy22WkAL+Hsb+fidyC0aKURy6oYFypYie
         FIeGeI2JdjW6JwDz5saHud1/GivqhYB0EU9ciioSsvI+irhhwcxbNc5Lvk0ayogmWFo9
         V4ohjT+Kcx+pfVP90S8bGrVxpKA0NgYeHs+9h7V4vT4Fa5AuEYCGgpwXXlJejFo2ifEm
         1m+LKrn8wkl8DXvTgmC1P7Bqw/QPl1x2GOagkcbOuAjn7LiKH3ZH8G0bZigld+tF00T0
         nIN+ydLnMNB+t4MyUKHto3l62HlUKrd/ZtEB3qHugo2K/ZbWWivJYt3WIIRkeOFOEstC
         +nMA==
X-Gm-Message-State: AC+VfDyYfJq6CL6iwiIQs9qsaboeoT7KlPU/R/lDhaRIxl7MWApnk4J3
	EY7w7lFn1e2dadLsKBCsj74iqg==
X-Google-Smtp-Source: ACHHUZ4IMgAZuXXdvozMz2uholz0ow06YVqNtFGTrdlJYmkd7L3nbEjn05xSWKVVBeKy+YB9FWdlaQ==
X-Received: by 2002:a17:906:58d3:b0:96f:e7cf:5004 with SMTP id e19-20020a17090658d300b0096fe7cf5004mr2564087ejs.73.1685451331674;
        Tue, 30 May 2023 05:55:31 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id dv22-20020a170906b81600b0096f78953b77sm7363868ejb.147.2023.05.30.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:55:31 -0700 (PDT)
Date: Tue, 30 May 2023 14:55:27 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 4/9] dt-binding: riscv: add T-HEAD CPU reset
Message-ID: <20230530125527.njppujzixnv3bbjd@krzk-bin>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518184541.2627-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_055534_918596_4E1FDBB0 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 May 2023 02:45:36 +0800, Jisheng Zhang wrote:
> The secondary CPUs in T-HEAD SMP capable platforms need some special
> handling. The first one is to write the warm reset entry to entry
> register. The second one is write a SoC specific control value to
> a SoC specific control reg. The last one is to clone some CSRs for
> secondary CPUs to ensure these CSRs' values are the same as the
> main boot CPU. This DT node is mainly used by opensbi firmware.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/riscv/thead,cpu-reset.yaml       | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/riscv/thead,cpu-reset.example.dts:18.35-25.11: Warning (unit_address_vs_reg): /example-0/cpurst@ffff019050: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/thead,cpu-reset.example.dtb: cpurst@ffff019050: control-reg:0: [255, 4278276100] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1783487

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
