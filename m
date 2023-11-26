Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7551DC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OWUMTG0af2tKVZHjzvZ7HnlJ+41St8HsUTM7oOdb/qM=; b=ruqWXmOAXHd2TSi36gg0j18RvO
	z6jCqLlBrr+Hk527GYgMMSJwqxpCcya0QFElUFgnbd4ojrJ/EOQS+9xc3g3YQ6j7i57egccZUbH2z
	dogBdPf0O9bJo2Q9wBNZ45/OKAw3AJK+gljVHp1JmB2TcT7KtY0OZH5jmmjxGfLh+aHIndz98GNfI
	5z2Fe4U57kxAny2DkHRYh+iCd2j6Uc5M4YSlB0viWSIO/ni8d69S+VB4V6qDqXyby/dbWqf6wIyvl
	SAS9UrLCmplbQJoMSLVETTH7XcKbYwJ0cHOXi3zTAzwumTUTKVnOo6e4vHCE40DAFDvoOgo20OTS4
	ZDIMUk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7MPI-00FOLP-2C;
	Sun, 26 Nov 2023 21:11:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7MPB-00FOEk-1Z
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 21:11:10 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C4AAF4152A
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 21:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701033059;
	bh=rvglDuo/fTyCEy2eZikNSrK0RCDTjL208TqZkqJiFe0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uxNgOXms3kTtZrV9UKovibbt5fnciZ8qdyZ4o64IQpe4AEf3FgVDO6mokn3arw580
	 qFxi1lxD8QcBJ2MKaGszWdV3s7H9T0Pzd2d36/1/bfFobK4wyZ/yBY2IDMdOZz+cBj
	 aN95HuWTNXmyMrq3WMzuqZ71tTp66X8JpJ9e81D1mPm0eR7mLqHOWK+5iCo/jQqJF6
	 Wz2LhlmkxpMopSt/remgbiMLpWJCDzqCosdN1BZGkIFZ4HFzq27Upi3QUUD6Mtr9Xt
	 6962AVK98Dm0xXrBb3CuYGkIiihffdBBZSzlb4FnvAtmFVhPOL6CjTKY3PRO+SYBnp
	 SI0plRoW99sFA==
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67a3b35f343so7189306d6.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 13:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701033059; x=1701637859;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvglDuo/fTyCEy2eZikNSrK0RCDTjL208TqZkqJiFe0=;
        b=lEEdrh4df253w6/NdJU6T2HlF4KnRWLTAiA+IkJmlxq/f+RRZMBAAK4QYPShWHDUtq
         pa/U96f2dPALzO+LhBB+2+c548wJ8w7xVby4NgsJVm32s3vqruYE7aMbdFnJKmm+yEWx
         9I5UkZ5pNRCcSWnrYDhtquImCBK4Z4SskyTeQZ+1Q4w6PqkHa8vSH0s2rnqpwhNYurO+
         yXH5dFGB0ouQWWcKu+AFDqL0zlIMBHEgEfdxu6GIUlpkPzhXql9wTemdRS5lG89nnHxs
         J89v2i1zUzuPNd+LblNgO2UxAgLQk7FmcIc+vndgkr3cNN2QpEYXAJgeeQO/oVOFUzAj
         +o/w==
X-Gm-Message-State: AOJu0YzemHSeuF7t7tOsFIk2TAGAXMLKxIRuM3CFOK5yfaegN9qnfYZ7
	/9UUyjPR0WsWnVgdS4JSxrL7x2X0xVjQH1A6YUh4KA8PDdXowRaqAkg1ZnDOTebl5Z8eDK0KuVx
	2W4qm0xTCIFXNnnhb2bSXGL+ZeowD4B4faltzmG7NhVRF23JrGvnatrwO5t8R1w==
X-Received: by 2002:a0c:e241:0:b0:679:2f94:865c with SMTP id x1-20020a0ce241000000b006792f94865cmr10212337qvl.2.1701033058743;
        Sun, 26 Nov 2023 13:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYWNxo8Vh6oRaTbtMwPUh8NeMnB/m/b1dccmMlQVlfIUn9lkEBCVo+foSjrK/Vattp6N8+q2aLZGzM4wRhZ9g=
X-Received: by 2002:a0c:e241:0:b0:679:2f94:865c with SMTP id
 x1-20020a0ce241000000b006792f94865cmr10212317qvl.2.1701033058505; Sun, 26 Nov
 2023 13:10:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 Nov 2023 22:10:57 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com> <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Sun, 26 Nov 2023 22:10:57 +0100
Message-ID: <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_131105_860980_4AAFBC1E 
X-CRM114-Status: GOOD (  16.66  )
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

Cristian Ciocaltea wrote:
> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> RGMII-ID.
>
> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> yes, add the mdio & phy sub-nodes.

Sorry for being late here. I've tested that removing the mdio and phy nodes on
the the Starlight board works fine, but the rx-internal-delay-ps = <900>
property not needed on any of my VisionFive V1 boards either. So I wonder why
you need that on your board

Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
you still set it to "rgmii-id", so which is it?

You've alse removed the phy reset gpio on the Starlight board:

  snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>

Why?

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> index 7cda3a89020a..d3f4c99d98da 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> @@ -11,3 +11,8 @@ / {
>  	model = "BeagleV Starlight Beta";
>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
>  };
> +
> +&gmac {
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};

Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
so why can't these be set in the jh7100-common.dtsi?

/Emil

> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
