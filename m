Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6360DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QdaTSVM5W11pxD7jBzKngTHNqM83PadMbYgs374ozC4=; b=Hsfhizf+I4XfI+i6Ug9nRDYgLp
	Xft692WsAtqnmLUMs/JwcHArZgxvTQx92JP9lZem7DPqagLWzDAml1ynkqXRUN55/eiCx6/rA3xSH
	YBgG+IaaHn0LGOUUyY3anKaCjqKdUwOTr1zTHzxJoW9s2p0dqJvtKYaIFTc6/1OtcSMWWsUvrwHDf
	QOnNKsi7i6YgRLNl933hIrWnxLHBp7949T+8lQSZ+M5rleaCeiwLdGKUBkKyGvvdn0jGkPejBQ1RN
	vfYzkiJhuq2Pt4+cJOnac8z/rxX+omSvJj4/yWV8MoZoXdPyZN1d3V2gTOQv7TBKIIG5grzUbvTOB
	s2JdXKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJf0f-00GLvZ-Mx; Mon, 14 Feb 2022 17:19:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJf0a-00GLtX-97; Mon, 14 Feb 2022 17:19:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id z16so8459880pfh.3;
 Mon, 14 Feb 2022 09:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UlEoY4gUMCf+dGZF5OFEMsNszRaKi2NA9sVTb7hg2Q0=;
 b=Ae4U2rn/YgQgOSiyBw4kGAmri+C7D120xX2o4jTRqLmVZIwA9orrp82PFXVyOLe88t
 5T5LS8Yywqq1yrpCVB7G4GG5FYZQUDJDm53OLiwGHyGy8+PzEh/ltOv9sdjQsLOQ37BW
 K9jUAGGyAGbO8m/d9ADpTfTiEDDicGmysucCnySqoNkUDMyL2sf0KwApIjlpCOBKh7LG
 PwLn7yzu096BJFsZbMkywa8qC5bLUChdLXtHANsVKuws7eixe2FC3CD/XVIIbRv0GFH4
 8aL24++hGBw17OPlB9PFW8aJifALKZ5y0EbTPSEC7kOrBTt+Y+9DY5uTdqXJzHsuvFjt
 Fi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UlEoY4gUMCf+dGZF5OFEMsNszRaKi2NA9sVTb7hg2Q0=;
 b=EJNjc6sf0LcXLw/hIgabjMJ3nPAJ1Ci1VW5uaVKwl3IcjVefmRC4vZnG9WB/vqPuZt
 tlvJRySG/hq7QIuuzumNR+g9vOFOs08qFgPXxUnTcLIkuwnAvDDSBXDBatvP7/voOoLu
 zvJE4fJiDKFT7VBj2D9sCmqJv+lZD5ViYjtyjqo6oSlZD0T5i4tCCAixBn4cUjpMhLOF
 EYipZj35kJRrbyT7djrnyfXL5uqAE/5QNB3xzqTYk5v+RhtPQqX+hpzlBbOqsBFxcdtL
 VNbZG+nhYLP0QWBWv1EzPE9kwBLgpr3Y5epQ5QDEcKU2RcMxMqCREfXO34GRBKv3KlcE
 fg7w==
X-Gm-Message-State: AOAM530n2wdQCQlEZsmAOvSV4KslIiqHiu1YESre1QsqqhPV7B0WzvXD
 oPHk5F9LwMWmKSP2aEJNR7bq9HCCtr0=
X-Google-Smtp-Source: ABdhPJzbAW43zE1Qfnv6bnjeH7rBFCX7yXcNUn2pVO8yLoL7oe86rRsSHL23eDM2HIDNmODSHPh2sQ==
X-Received: by 2002:a63:2a51:: with SMTP id q78mr4148pgq.239.1644859166687;
 Mon, 14 Feb 2022 09:19:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id bd34sm5276481pfb.73.2022.02.14.09.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 09:19:26 -0800 (PST)
Subject: Re: [PATCH 10/15] dt-bindings: pwm: brcm,bcm7038: do not require
 pwm-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
 <20220214081605.161394-10-krzysztof.kozlowski@canonical.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a8d3ea6e-c9f8-e5e4-7cbd-71e0c814db0a@gmail.com>
Date: Mon, 14 Feb 2022 09:19:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220214081605.161394-10-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_091928_370276_38D3EFAB 
X-CRM114-Status: UNSURE (   9.18  )
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

On 2/14/22 12:16 AM, Krzysztof Kozlowski wrote:
> pwm-cells are already required by pwm.yaml schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
