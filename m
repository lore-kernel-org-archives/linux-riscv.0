Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293F8C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 21:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My4FoOYd/zjPM4q5RwgnYHIk17LdsCNmxODXDAi9o04=; b=2ltTuZh1SeBtQj
	h1WR/Q5N6SBHMGZq8B6vKeI22etjlcEdslnA6cO1F4lW7QGiXvAYdbB36f/fHlCrT8lH+3JueXJe+
	nfgt65AT8CJEbIGSdbXx6kY2Y/Ur5T9AWG8hwcANDUq6MfZ7LS7fSMgEb5cgcRYe+CLwuuVgm5/Ux
	eYHDRbHphdGDQpx4r204wev1b4ogURG1NTTRl0Zunz+/loXmoUaHT1FeNzrrTVz4kKZBo3xkY3qpt
	oz5K5DjlRhRXQ348rmQMGTBt8t/pzzzzTPRbA93ghlYfyLUhiiUa/gWccUzkbgJiTUfkQFCb+nJve
	wvMH/FzL35PGMnxe9SQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppyEF-00BsF8-0a;
	Fri, 21 Apr 2023 21:23:39 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppyEC-00BsEg-1l;
	Fri, 21 Apr 2023 21:23:37 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6a438f0d9c9so2023405a34.1;
        Fri, 21 Apr 2023 14:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682112214; x=1684704214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiZAysz4ov1Zo3w4aiIbPH6bfC3DcMrmLLdA2KmkpxU=;
        b=Qttx6/V+QZMncglFgjuScuDgM8Gm3Oc+LCXT5u4oWCquiIsqroelUo/EcmtcRj293E
         Xqzy2dYBfHVj7q/uFY1f5Pj9qlZTLQRLoXghCS3Nr1h4cb5/93KnmmHIKPLDMlYn/m5N
         yOFLQI8ZDBwF4qy2WS8ZYSBGnp6w2FtiI9MFrnSSJ9np5NvHiBTzMrw7lYRWk1jZTJtk
         eyuxshK0RJFHwyqUZ2kbaKEujKymuREV4IyQrDWFG5O2sS3/gRNpMiXUPDuacHTLbVXJ
         GGjT95Kgj89pWu+Ycqy+ItLwasgSVHprYSH6G18av+JJRL+DiSumAmQGWeZz9uoS6UuS
         rclw==
X-Gm-Message-State: AAQBX9ft8Xghc5PP9DmkIblpULVJ71uIf6HlkJgTlF6kO8PMEIfC4DGP
	x/zaF7NJLtrprCodjdEyUw==
X-Google-Smtp-Source: AKy350b48ps3zAKjSmhTL/aO5JoB/ohjntfoX2X2sgxbq50ruT4HmBtX84TtuCMjpYZVvHALoQq4yg==
X-Received: by 2002:a05:6870:3383:b0:184:3081:66e6 with SMTP id w3-20020a056870338300b00184308166e6mr4226118oae.47.1682112214517;
        Fri, 21 Apr 2023 14:23:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u7-20020a056870440700b0017fea9c156esm2109418oah.18.2023.04.21.14.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 14:23:34 -0700 (PDT)
Received: (nullmailer pid 1784804 invoked by uid 1000);
	Fri, 21 Apr 2023 21:23:33 -0000
Date: Fri, 21 Apr 2023 16:23:33 -0500
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Pawel Laszczak <pawell@cadence.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, Peter Chen <peter.chen@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor@kernel.org>, linux-usb@vger.kernel.org, Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: phy: Add StarFive JH7110 USB PHY
Message-ID: <168211221244.1784749.2647041758726658187.robh@kernel.org>
References: <20230420110052.3182-1-minda.chen@starfivetech.com>
 <20230420110052.3182-2-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230420110052.3182-2-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_142336_601940_1205AD24 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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


On Thu, 20 Apr 2023 19:00:46 +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC USB 2.0 PHY dt-binding.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-usb-phy.yaml | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
