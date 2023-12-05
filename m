Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77830C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kEwz+BH3DJIELPxWcKJwdHxnU4S+dsWngIbWNC5T+4=; b=kQoJsN1z6agoRn
	L9Bu7o16MSY4ZZYjwV3L30d3POV6wkczqIQFrX005Y7P9GcqDf2P8kAAlE/xsrjh4OdSm5csbW7bO
	EenZ/WXn9WpvKNQJL62i/rgfcQpXgyzT6N8sCwDJH5ku/IVDqqeVzrYG+zogQ7bVnAlG0pYLYE31q
	8JWWluXGO3HDb1F6qSjriCDPOxsUDIwyS+iMRoPc21w/7VC8JasMBvAR/IQklvscbAFAxmxnoJUco
	Ybd4EJL5kDm+W2cbVA+v835X6UOu5rZKA1Zx+Ne4X/VwRPhY/B6ZMP/DTpxhN9qSro3Ofj+Fh46nY
	ptcDJx2Hi79CV7qPEcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARZN-006lkc-2A;
	Tue, 05 Dec 2023 09:18:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARZL-006ljv-2L
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:18:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1915034144so648772066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1701767895; x=1702372695; darn=lists.infradead.org;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyyV7FDLLTugfQIqaxP8FNjfHS3S4eEzbgCWNE04/AY=;
        b=IVjsGp1IDc7JbdeXMbCQYt7Dm8fLJeHbuTk7YwE/8NadURXoiF5QA0flA1TWW1bCcQ
         htRVrW6zyHZcbGpiLoYLLG/+7Xb5OkR9Dym5KfgAtmGucFShO4OLbso+607oznxtu7a+
         kdjGoEH60TKJCzRgiQSnIpVg3hHBNOEk+TldTSSytLOItzeGrLSZVBU6H8sCUecGk6wI
         wqd/jxLvNzGQ55PbLwlDYqp/0NIIJu+BYOZTf5ol6KIsoFszL34xL7v+g4OyfGWO69WW
         G2YsADypk0vag1VB86DS2QprpnEKdzudR9ltSTgjxLu8n4NPet+X8Sgjls4+6tXxvM5g
         5Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701767895; x=1702372695;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyyV7FDLLTugfQIqaxP8FNjfHS3S4eEzbgCWNE04/AY=;
        b=VafEy0t2o0IFAg0+0I+iSIVyBtHEfoLQlCDjMkYoDY9Qg1K+nvvc39Lm9RzkL8315R
         7LSxMvqM2geGvJnay7SS8Qoqc1zmWDnAJuEGBUBMq5JJCkgdbGLO5x9MUzrIbN3nm2/m
         /oCy4zJvzxgCG3vgdUbMowikAvK7Mxd1MEaS+PLaNym+CaW3azKyu7YTFC8V6swMc4CI
         vtflJd2OwqyaejwbJJCLSGq5bVgZEXK6WIwejwUAmUP6EN3oXIAqRdfAvyZLAoMRFjVc
         qHp4r/luswvJuiMWZ2iNXxhklaav+aA6ZK/nlpkkWiwP0Teimk4ajy4zXxWNtBBFeoso
         y2lA==
X-Gm-Message-State: AOJu0YzvvnpVCkGk5HtwOwSKv5tnbHhMSpS72gAfV9I5uePJpGw88c2b
	y0saHlZqBkoVf32Pzuwj0ZCQZA==
X-Google-Smtp-Source: AGHT+IGqyRUTu9WLUc6nH2xCm42ZpYmhyLu5VkZd6XTvkBxqfK7IGfbNYY1unAPGXa7vSv96T8dnMQ==
X-Received: by 2002:a17:906:243:b0:a19:a19b:c732 with SMTP id 3-20020a170906024300b00a19a19bc732mr3544020ejl.130.1701767895199;
        Tue, 05 Dec 2023 01:18:15 -0800 (PST)
Received: from fedora (p549451d5.dip0.t-ipconnect.de. [84.148.81.213])
        by smtp.gmail.com with ESMTPSA id js22-20020a17090797d600b00a1b32663d7csm3271996ejc.102.2023.12.05.01.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:18:14 -0800 (PST)
Date: Tue, 5 Dec 2023 10:18:12 +0100
From: Damian Tometzki <damian@riscv-rocks.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v11 0/20] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <ZW7q1LEvEpVxoI4l@fedora>
Mail-Followup-To: Bjorn Helgaas <helgaas@kernel.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <c4154501-5b93-4eaf-8d2d-690809d26c57@starfivetech.com>
 <20231204212807.GA629695@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204212807.GA629695@bhelgaas>
User-Agent: Mutt
X-Operating-System: Linux Fedora release 39 (Thirty Nine) (Kernel 6.7.0-rc4)
Organization: Linux hacker
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_011819_781473_349AB7E1 
X-CRM114-Status: GOOD (  11.34  )
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
Reply-To: Damian Tometzki <damian@riscv-rocks.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 04. Dec 15:28, Bjorn Helgaas wrote:
> On Sat, Dec 02, 2023 at 09:17:24PM +0800, Minda Chen wrote:
> > ...
> > Please check this configuation.
> > CONFIG_PHY_STARFIVE_JH7110_PCIE=y
> > CONFIG_PINCTRL_STARFIVE_JH7110=y
> > CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
> > CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
> > 
> > BTW, Maybe you can reply e-mail to me only.
> 
> There's usually no benefit to replying off-list.  The list archives
> are very valuable for future maintenance because they help us
> understand the reason things were done a certain way.
> 
> Bjorn
Hello together,
the main problemwas was  to find the rquired CONFIG_* options for StarFive
Board. It would be great to have an CONFIG_ Options with all required
Dependencies.

Best regards
damian
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
