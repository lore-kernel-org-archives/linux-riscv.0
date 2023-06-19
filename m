Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E881BEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KogUHyrP32a2/vMdB6LB5aht9cpU1i9UDZmohB+fFtY=; b=yxLfkCCPanpTZi
	dw9LoYIEZy133BBg5YuHJuxEdd5onrTiGolCTugZfEtUV4i4OXZGx1olAW/mJU7ajKlnmPe2dm2Vz
	Njkwz2ekeG5Dd8RdibkOeyGnvUmtvv05cVU3dNvocMTF/ah6/F/ixA+iA/wE4foI4CqRnVjA+2mDZ
	6nOHIVYzqH7wN8tHf/Q3h2c2K5IusE4xHKuXl2SBqf61r+T2dgs7u795oFGG/5UTV/tLZRmsG9M2X
	PFilDCICoa0dbR9NOeJdjfEPVjLtOCmVfRz/qCyL87LMC1LpJ6lP4wY22N8neXulwNKkjM8MsDC4P
	KRcnIQ9vJMQVtKfJ5L8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBB08-007xsy-2X;
	Mon, 19 Jun 2023 09:16:44 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBB06-007xrg-08
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 09:16:43 +0000
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3427426f2ddso4013545ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 02:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166198; x=1689758198;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=za65m95xf70IuUPWVqHELJbJ+80G8bzYVUTAvtx8c1Q=;
        b=kkbTo5oXpOkoQonyUPf4D08FQH7q4ol4aY3H93YPRj3NgzE9VacP+67bbRuWSKyje+
         5PGqsP5tucs3CMaGexUo6lyu3CsrbT5jWV54CcNZ9Sdz7cmP9kP5QFK+Z7B1cay2PXT/
         QrX934GTl72Uim4y19R1ntIxW9clEd9aRM5QGq8LEQfjsBvE5ORM6Kr6HHIslyPNI+/i
         Sa3gM0vQY2Mo05zeR1PHFVLPimfDTpEHaOIunwirJOuEXDdXS3bT0trZ1SIXu29uV6+Y
         nvHvRf2UsgR7XjpOxcHRIwH+K37w/+QKnjnqFEtR5sFHVKZxiycJf7Oz0QSWGVFgpL5U
         0RRQ==
X-Gm-Message-State: AC+VfDzxGc16Ilau3Rnu2GpUS0b/HrFc6N5kAWGt5pg7QHifFdl2/qdC
	VJmjwQ+OLL2VMTZr/wL2nfiZaT/3UA==
X-Google-Smtp-Source: ACHHUZ5+0qQjdkxM1+PZiQ17yggh0SpYAW17VbtorAscrXLA/VL31u4kjPfTxcJ4dTW+T253XUrb7A==
X-Received: by 2002:a92:4b02:0:b0:340:6c4f:d311 with SMTP id m2-20020a924b02000000b003406c4fd311mr5077397ilg.28.1687166198076;
        Mon, 19 Jun 2023 02:16:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s5-20020a02cf25000000b0041f62ba9a37sm8089692jar.104.2023.06.19.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:16:37 -0700 (PDT)
Received: (nullmailer pid 242871 invoked by uid 1000);
	Mon, 19 Jun 2023 09:16:35 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
In-Reply-To: <20230619083517.415597-2-william.qiu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-2-william.qiu@starfivetech.com>
Message-Id: <168716619573.242780.12121020614995223090.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks
 for StarFive JH7110 SoC
Date: Mon, 19 Jun 2023 03:16:35 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_021642_080983_48B607D9 
X-CRM114-Status: GOOD (  13.64  )
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


On Mon, 19 Jun 2023 16:35:15 +0800, William Qiu wrote:
> The QSPI controller needs three clock items to work properly on StarFive
> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
> platforms do not have this constraint.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/cdns,qspi-nor.yaml           | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/cdns,qspi-nor.example.dtb: spi@ff705000: clocks: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230619083517.415597-2-william.qiu@starfivetech.com

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
