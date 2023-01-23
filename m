Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FD9C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnmO1lkrIeNN5Z+e2jtpvuQrOcA2u10w0wpMYjTuL9w=; b=z2EC9j7Zfgg5Sw
	RcMRomKfBIMP8HirCegdCyl+8PxANfaiKvQfNTyOcegLKpoVDzrDAjpCBuiv19NNcSiNaR7sLoQCC
	mOzRez1bfnoT61p7t2am6E6Xa2QQpSSVAiGjHcPPBXWeRdmt1+sKqZBfie73WuxUt79gsPO5gdYmp
	xO71rH87f1X6ub/pP953b4/o8zmU0OLbSbaDPoXwxfr/8UjAiUGEyr6VseMHsrWjkHwRInJswHFUX
	sTekMib1CmvUABNmy08YJw9cKeF6an8PlIh8ByJEBDuUbnq1mQ78Pcxp+Sd0+u/qsp0CMprdXeVoO
	sQm/BPboqcgTuCSXbWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK5so-001nSO-FJ; Mon, 23 Jan 2023 23:05:46 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK5sl-001nRM-HU; Mon, 23 Jan 2023 23:05:45 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-15fe106c7c7so9689679fac.8;
        Mon, 23 Jan 2023 15:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5K+QwMf3q1ON3JuiG+9OW2PVcrwMBDaRZk0RWszHFjI=;
        b=4K2NhRnsIalJOo21yHQgNBwZO3JOemmrDQM1Wt6LGIysn74h207jku0TwAp5060SS5
         ATUofk7Xd5YKeaUoiARvCjwESF8tvDsLMf2rZpzlGELKXyGOZJ70/Z2PyTkR6Cgzpa6/
         6qqwDvsDDn1Z+8urNeRArqaJhr3l5CctNoStU0SMbOp3nnb6RMGbvyG7+Pu/YLHjTdzy
         z8AfTU8UxVWmZeKlvKXx8IeYXae5xyrBC1WtXwI5jFb2lxVZEfLJZAM3KnNt1K5H7sF2
         TNJEoqkwS5eXhYo8kWOjfLayZtKFxctxYWsBbxRquSefF3NKoTpfFk4Og34TFyd/KLDB
         Z5cw==
X-Gm-Message-State: AO0yUKUWzb1FeAD7oaDDFv412bmp9uFZbM6WzJwp+UWBGX+yCCrTLAWo
	RuEPI95KxfKY+OgMf+52uQ==
X-Google-Smtp-Source: AK7set/h7sr6uhQW/0sGu9o6CylIQ3HnC2k/IV6qUD9neLaJawnkv+Apgu0382wuFxmdnJG73B65tg==
X-Received: by 2002:a05:6870:ea93:b0:160:346c:dd97 with SMTP id s19-20020a056870ea9300b00160346cdd97mr1085832oap.24.1674515142027;
        Mon, 23 Jan 2023 15:05:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r141-20020a4a3793000000b0050dc3c2f77asm104345oor.8.2023.01.23.15.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 15:05:41 -0800 (PST)
Received: (nullmailer pid 2813085 invoked by uid 1000);
	Mon, 23 Jan 2023 23:05:40 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, - <devicetree@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Tomer Maimon <tmaimon77@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Peter Korsgaard <jacmet@sunsite.dk>, Chester Lin <clin@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-stm32@st-md-mailman.stormreply.com, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, Fugang Duan <fugang.duan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-serial@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Le Ray <erwan.leray@foss.st.com>, Michal Simek <michal.simek@xilinx.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Jerome Brunet <jbrunet@baylibre.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	NXP Linux Team <linux-imx@nxp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230123151302.368277-11-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
 <20230123151302.368277-11-krzysztof.kozlowski@linaro.org>
Message-Id: <167451486467.2795286.1299932821783618559.robh@kernel.org>
Subject:  Re: [PATCH 11/13] dt-bindings: serial: restrict possible child node names
Date: Mon, 23 Jan 2023 17:05:40 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_150543_602807_896AF541 
X-CRM114-Status: GOOD (  13.93  )
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


On Mon, 23 Jan 2023 16:13:00 +0100, Krzysztof Kozlowski wrote:
> The re-usable serial.yaml schema matches every property with ".*"
> pattern, thus any other schema referencing it will not report unknown
> (unevaluated) properties.  This hides several wrong properties.  It is
> a limitation of dtschema, thus provide a simple workaround: expect
> children to be only of few names matching upstream usage (Bluetooth,
> GNSS, GPS and MCU).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.example.dtb: serial@1,0: Unevaluated properties are not allowed ('intel,ixp4xx-eb-byte-access', 'intel,ixp4xx-eb-cycle-type', 'intel,ixp4xx-eb-t3', 'intel,ixp4xx-eb-write-enable' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/8250.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230123151302.368277-11-krzysztof.kozlowski@linaro.org

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
