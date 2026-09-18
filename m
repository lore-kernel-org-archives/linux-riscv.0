Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13716C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ges7GDy2ff9s6LpAfClhvTF95usgZfWcJMoThbvG9Nw=; b=qAbSdXoh5W5NrW
	YZbn9TDyhK1ga5YUH4cBBsZ2dTjkEnFsIp6jnRQkW5y3JyVPBMtF3htIxYcwpnG6+C0NtIwsOvCT4
	YIypPTZ3Y2PWAO7RsQWS/o1D944POVosALxjTQMw18rTNsA4vtamN1nzfmnei8iPxyIqF7a0thCfc
	sSYr6zLJgSQAMcfnbgL+40wD/EglzZFmTTYIuF/SddZIXUDNABuF5MfstxnRJwQrXFoilWTlt6j4g
	JjgRxBUhb0m8qMKvzodX+i8RdCbd9v2sUquLOWc7Lroh09EjNvL4o6c2TS0xBpEXCFlA3jP5Z+v6n
	3dyQ6inEFoPt/Qz/gnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dUv-0000000FKjG-0aat;
	Fri, 18 Sep 2026 18:39:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dUt-0000000FKiy-2ZVI
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 18:39:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD7E460A55;
	Fri, 18 Sep 2026 18:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AAA1F000FF;
	Fri, 18 Sep 2026 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756782;
	bh=qLvchs8DOtkt8/DKDyJuDenRq4BhZmyfJc9ZGNBj7mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=my/kK6viCZdN9+2Qs8q2g66eL3pgSjRZhcq9W1g9KRRY2s4oMQ4WJRXmqIRbHq877
	 RALsG4QI+nZyMV2FYveiruUBGCCeALSl1e6KB4PbDVioEgO+iHOyf8MuCUi8Wp8/oZ
	 hnGo2IG13LyCek8TOTKuc1udPVdsbbq2KZeebiyGOS3pYPQLLkaj6wDw8My5vovYy9
	 48To0onJV5nWBwi/RFX2iaKKp+vS2tLLaKDo2Bz+0cOYr+3HuebxcNqO5RY6aRUT4C
	 6/gCwfKWbiwg9L8ATkRVHYKWptdZYY9oxw8ZCfhC2ccfMRBrf6gw2DazHzvCIJ1jC1
	 7STEp1y9GH/qQ==
Date: Fri, 18 Sep 2026 13:39:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v8 07/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys1-pinctrl
Message-ID: <178975662079.1338404.9092715281242899916.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-8-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-8-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:42 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
