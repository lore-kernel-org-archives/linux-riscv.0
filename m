Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98993C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 15:16:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C00E613B3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 15:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C00E613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1jqWsV9RReDbT27pDhYVDAvHZ5ZFbneFM1ADrQXMF1M=; b=db6cyBWE8URg8eU0DDRn4oSGi
	qagoObfVRq50GY1UDe7DQrjCLm+fbJES+lZ9AfcOM6WECI0CPJfaA8eM0znuUYmbhpHCtKV6hqMN6
	gyHv/dpzrl4ae1Fs5qomfpnA4WD8NAT1o7wKaJo37sX8HZ7nloejprImSnYRqUVbGBdpZJEtNfMjX
	ynBAIsJD22j9bUWrtnwOJi/ygOu9LOnewWNsJnVFwDiW4RiaJcYXp2Q55ku81j+8nCtyxYVbOnkEJ
	PM3f2yNSRbkliOYZCcFp15jdwtUeMyHho5sta8tB86C+I5T5O4sVcCJoYJ9a4tEji5dtKH9OF1PNe
	K1tH3lDsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKlf-009bts-6T; Tue, 13 Apr 2021 15:15:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKjR-009bcK-Ox
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 15:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8VTg94yIfoIthkvMvtbySIlQx+UdB8ppHyDAgluhSXY=; b=FVlBMoL57h0X4I55AS9MlF239K
 yJYARWOCdKsrRCIyyzmc9tImoaydZgCedt0CRgQNx1VE1LYeg388DnijAUVvP+SO7N70mpWFM0HZQ
 0ZCja6dQ2G9V0m9Y/70ezKzUoG8dku4SdBLat4jH1d2hfboujj3LrzX8AQLsaWlABsCKzOsmG18JA
 D+TJCKtGYaz5NLY4OLIVz0sk/R0W+oQf0mn8ksfIshe77CfuOcNJ5GWq6EuMHgpKc/V3jnsKPnlko
 5eSOiXYCecBRkinMQUmoZ8kq7+v3XEN62wqdTSVz4BARBp08Yd1b1YrR6pSEsBBfv16aSezLw2Ckt
 XLj8Arzw==;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKjP-0078K6-Bo
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 15:13:36 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so16426187oto.2
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 08:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8VTg94yIfoIthkvMvtbySIlQx+UdB8ppHyDAgluhSXY=;
 b=FMgOnMu5kCHV7VIgD9/srCyHqFovteSl3C9VfVc2jRwZub4KPytH50URGVxTLB/OEA
 aXZyOy9wUGuOTYsmSE+mxbU9cR6x1gDbpJADE3F1iadox6qgRNieo7iNAHUdxz6nJOkO
 TC8NL0fWEN+FRWoPzOPxsTny+W2kh4mxOC1trVocH7diL0IvPYRbv06xFBldW7nUlQYH
 JzP69O4m7Uilly/1MfYWACT6e0Zr8o/crwE+SsFWvNExokulYJLc4c59ZtYgv/ArkVOk
 987qDnIldHDtUYjYLCVRIKW9adgAcDTIk2FD6VKYo+NQLQRfhcAfBMAoDRHeTzefqGi3
 bUEQ==
X-Gm-Message-State: AOAM531eutu1336QfUDutLJd5D2MoWH6Wlgqf1aNst2RFEKtmOXJR02c
 IalfF0hf39i/yOZeGbvs/w==
X-Google-Smtp-Source: ABdhPJyS+3D+v5QmaG+bOc9NyXiIxS/c000wvsFkzFlRO04+UgdtFNNz35dM4m96bnrOK0msIz9hyQ==
X-Received: by 2002:a9d:550b:: with SMTP id l11mr7625096oth.369.1618326813119; 
 Tue, 13 Apr 2021 08:13:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t203sm2970383oig.2.2021.04.13.08.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 08:13:32 -0700 (PDT)
Received: (nullmailer pid 1690980 invoked by uid 1000);
 Tue, 13 Apr 2021 15:13:30 -0000
Date: Tue, 13 Apr 2021 10:13:30 -0500
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: cyril.jean@microchip.com, anup.patel@wdc.com,
 linux-riscv@lists.infradead.org, david.abdurachmanov@gmail.com,
 devicetree@vger.kernel.org, lewis.hanly@microchip.com, j.neuschaefer@gmx.net,
 robh+dt@kernel.org, daire.mcnamara@microchip.com, damien.lemoal@wdc.com,
 atish.patra@wdc.com, paul.walmsley@sifive.com, jassisinghbrar@gmail.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v5 3/5] dt-bindings: add bindings for polarfire soc
 system controller
Message-ID: <20210413151330.GA1690933@robh.at.kernel.org>
References: <20210412160407.19462-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412160407.19462-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_081335_420424_818E9B0E 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon, 12 Apr 2021 17:04:07 +0100, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...icrochip,polarfire-soc-sys-controller.yaml | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
