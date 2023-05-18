Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4061C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guyf2Sqz9BdtZ7dWyTRQ9zJY7mH8PP+xxu5etxL/Bu0=; b=KvlcaIFm9PYe3V
	5IkmmZhsyOVjjcJRtp4SpJIMZ5kmhd+zuheh6iM514qONdiNKPQDsrWqXnoA9BR1Xkw50DYGRSUjL
	AanA4UqBDWq99Yo/0F+gDoi6mtXVJgDl7920bRtA0vvAG2PwSMl0PA19U7LaN1ikHWhNSjubS12e+
	vFkizMXe06kD1PWc+SpMorRln0WbvpD+88gc3oueKYlqxsGGonupt9jqOzZU9Cy/zPEmq2K4Ta2JE
	bGO6M2iEn2vJcIGuKeNTiRAkLQKNeutuYbIuTlfhrw6ndpn/Z3DgxIXYjYObs1sHvpd8f6ljVzT0H
	tbmGJqYO9/wrMrhLKzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjTU-00DzeM-10;
	Thu, 18 May 2023 19:39:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjTT-00Dzdy-08
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 19:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MDn5p8Ib+y9CgNrg+FXBfqG/I7AiFjWJTabxe3lq0Yo=; b=KGhjtBIA1zT1qXAsbVLOvip0mA
	X/rsH9IotfY315FA2V0PVUpu3gZA8MQRmjh+MeNgMzpGad5blAbWDuKjRhqajYEVoPTpGWZal76/8
	N4rV5SNM/jkNURmRvPtfF1E0br6n3WzB07JBaZkHe70F5a11nmzPHcBbaR6mTro4Ne76B68QXPF1D
	Jf+B8vcQrPcIb8HDrRDQ/SQjLldTKuEh3cBjGqnqPB1MAaLbrhzjdnbRXMllh1gWKuEVBvtFNc6iO
	8i3ExvrxbxBHloMYkGSNHLplxyoq2BQW2Nr51nlL5GXbAS+5KzNNcNt3ui0Bcl2dz1OzbVIZU2T2Q
	QVieZy0w==;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjTO-00EuHd-2l
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:39:41 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ab0a21dd01so998369a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 12:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684438771; x=1687030771;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDn5p8Ib+y9CgNrg+FXBfqG/I7AiFjWJTabxe3lq0Yo=;
        b=J9Nl9TY+EVoBFY1O6wu712qwBrBCC7uLyEMU+pHhSb8XnyDVcHKc7zwDhCOCg3LJXW
         FMiRcX/CpRaFmDOlswZ3A+lBhHJn39NrWA+xa86SSd0XcD+vmOePgOrScwSx27VvV9ty
         L0jwYj7sz5QAGxxoEIPDCVuyWwo1Wojx66tofo4WzjS7Y8oQQ1KqBQ8tJ170n/06vRJS
         jshn/HAzH5fjnEXM0gMLx5mD9ecwSCoo1rUd/5IuvUU8BUAi468Kp+PDudjSmmLFzggX
         E1BNJORKZLVeOLEqOUUj5zcdW/pHAd8bjcGz99TCNWxkshJ3vrjmGX87tbJG0obXHdnn
         O/Xg==
X-Gm-Message-State: AC+VfDwGIc/Ke4sf43lJD5Ws9yJt3+TgDDUYTaxEV/00eVq28RcW2qU4
	qQNP8Lf38YarUw7Fcrl0bg==
X-Google-Smtp-Source: ACHHUZ6Z5ocjGCz/xPSu9pMLuSMlz+bPgbUY8RawLZcETmIHHgksQOd/VkJV/2yOqFSssJd7wa3JJg==
X-Received: by 2002:a05:6808:308a:b0:395:df6e:a845 with SMTP id bl10-20020a056808308a00b00395df6ea845mr2002207oib.4.1684438770739;
        Thu, 18 May 2023 12:39:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i4-20020aca3b04000000b0039208555951sm983744oia.29.2023.05.18.12.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 12:39:30 -0700 (PDT)
Received: (nullmailer pid 2547178 invoked by uid 1000);
	Thu, 18 May 2023 19:39:29 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20230518184541.2627-5-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-5-jszhang@kernel.org>
Message-Id: <168443876898.2547162.12784151548808128613.robh@kernel.org>
Subject: Re: [PATCH v2 4/9] dt-binding: riscv: add T-HEAD CPU reset
Date: Thu, 18 May 2023 14:39:29 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_203939_473406_1CE79928 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Wei Fu <wefu@redhat.com>
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230518184541.2627-5-jszhang@kernel.org

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
