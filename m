Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32941C77B76
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGu33k60/fQa3Qbec0q5birrHLiY1acaNiinIAWQ5zU=; b=IzQwMpmB6Bk+Xa
	ifPe2sKfGsZ/dVh7ZeC8uZlEesi/Dr2FhYrFqqPwLmMcb60FaKPUBEyoUIrbwTWWf8JdtvTQYH6kL
	GsXX2Zt3F0thrlTPIw1kJ4THX5lTYs26DT5FODA0q/qOsxPH+Phvgc/MY3x7v7g8FzNp0b9MKGH1V
	dPX065cCSAFx+njNPkyOalJhjWbKoO62taqxtuzoWn+HIxRucLubfQ04TyZCCHMVlK094kNhbdgo6
	/jvWZFpRrNMEy58CzzbbJH+kk8BUQgWIpD9cly9+EUXLTtdNmaF530kTbxKTXqMbUfFarRUrn8X8G
	/Ku2+g/ZfX785j/7t9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTTH-0084is-1d;
	Thu, 20 Apr 2023 12:33:07 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTT9-0084eL-2d;
	Thu, 20 Apr 2023 12:33:05 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6a60460a23dso772805a34.0;
        Thu, 20 Apr 2023 05:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681993977; x=1684585977;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7z0JmwHaex/uFH0ZYyDvToigtvE+3W/gbf5o0Is7Ho=;
        b=QMc3kzH2FGouCJBURLYG4zhJqmDIdm+r8DYa/eNN/IVdLSYnjqqafPSfqQtskCsJx/
         63R52HQGkyG9kPdxlKSOuWyeQmqewmTHm36gMm/rm3wCI3h2AKPLDZ7EDJpltiaWjyQe
         tYnv48dtHWjUAEqsiLTFcQENS+tRc/8cJs+3cNQBOMEzClZgbsFqkDfnrEuBHg+qPadC
         2ISX038ad/FhDW2higav8G/F3BEASj1BUDx4VMMesIqD7jXOw1kLAHOb+Dq+OkV0NMjU
         scPi9trVVcWQi7ApBI50OWRP8k9d3O7i5NjbhNOHuUCZVHPV3CVLG3btkGyuaByLWury
         G2pw==
X-Gm-Message-State: AAQBX9crKFmokhBhFwRWj8trkXTwTOlF/rRbWdOtF9iZpp7qPFAGf2nP
	Ej104lQ/QSQFPc0Rfc1bOA==
X-Google-Smtp-Source: AKy350Y107Wu1RAl2s+KH7dc+aZ13lz9F0Ey0F68DyRy1iyrsdRSN2Bux4WCxJa0ZbDCN1BlqkUgiw==
X-Received: by 2002:a05:6871:707:b0:188:5:bc87 with SMTP id f7-20020a056871070700b001880005bc87mr1163265oap.6.1681993977566;
        Thu, 20 Apr 2023 05:32:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e21-20020a056830201500b0069f8ff38bcbsm662919otp.16.2023.04.20.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 05:32:57 -0700 (PDT)
Received: (nullmailer pid 2632253 invoked by uid 1000);
	Thu, 20 Apr 2023 12:32:54 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Palmer Dabbelt <palmer@dabbelt.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Mason Huo <mason.huo@starfivetech.com>, Roger Quadros <rogerq@kernel.org>, Vinod Koul <vkoul@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20230420110052.3182-6-minda.chen@starfivetech.com>
References: <20230420110052.3182-1-minda.chen@starfivetech.com>
 <20230420110052.3182-6-minda.chen@starfivetech.com>
Message-Id: <168199392033.2631023.325205203535545069.robh@kernel.org>
Subject: Re: [PATCH v5 5/7] dt-bindings: usb: Add StarFive JH7110 USB
 controller
Date: Thu, 20 Apr 2023 07:32:54 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_053259_853278_B328C93F 
X-CRM114-Status: GOOD (  11.15  )
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


On Thu, 20 Apr 2023 19:00:50 +0800, Minda Chen wrote:
> StarFive JH7110 platforms USB have a wrapper module around
> the Cadence USBSS-DRD controller. Add binding information doc
> for that.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/usb/starfive,jh7110-usb.yaml     | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml:73:9: [warning] too many spaces after hyphen (hyphens)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230420110052.3182-6-minda.chen@starfivetech.com

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
