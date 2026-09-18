Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432F2C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTyyIaly+Jcqy0G1V6iGfEzYRlRGEDu9EFj6ddGnoxY=; b=ruTYPogOatbkgG
	P9hmOQeq+/hp0//YgEp1MBP6WPn8Yf61GUIZOtGGwLL/XNLYdvdufuqq22EO1GeXDeJ6iQJf/gOLA
	DqFa+JA4U6DtbxM8fvb/xHD2MVtb6Bwpf8jvSqBfoKGLI5j5u0mBIA2lkfFASofLcT6GUfkwJdc27
	ctsIn17IIbXxF1jrJCO9pfY045UbV2UfDAJiovBLQsIJNbr4fW/1x7UDJdbQUJUqYECgjVeeZI/wI
	2niHwRb1ll4YYMfpdS8qcgVV4RDenQOU8hkUm6tb4QdduXnvrScmCtA03X6tYumycLuKItXcdFQPc
	g+4qNcDV8CrO1rk2h3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dqz-0000000FN8Z-33n2;
	Fri, 18 Sep 2026 19:02:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dqy-0000000FN8A-2xun
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 19:02:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73D0D43B93;
	Fri, 18 Sep 2026 19:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAB21F000FF;
	Fri, 18 Sep 2026 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758152;
	bh=DOEvh1ULfZUyvbXtw8svpyW+rKR5aBJAMnEeOyZ3r/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cxcW86lSs8Ef2aWhukeCN4JfW0Hv264u0jeA13gZUd8o0yI1tLbvcJDo7g8OcaE17
	 w2eDF2xRTg4wMXp3VtW8iAUu5jB/pkOchXL0urX7tOvXSlpgp3/7jYsXEmyGd8RI08
	 /lBvQB2wHOJChpVpS5PTUkk7M8F4JapsKlvPDb1Qjyf5gxnnBBmlKM2xD/FUfGfr3r
	 rLiMDgHnFZXH5xSAVOYb1ETlM7bccAkX5aUj2McARvEyZ7ovV1hC2r1/r+updkF3CJ
	 YyG349azk18PwuTDjeSdR2oC5eCX3daiECMjfRtIYjdPHKVOKjEiDSo6OLcFy0zOGi
	 lTD2gSdBQpdjw==
Date: Fri, 18 Sep 2026 14:02:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v8 19/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per3-pinctrl
Message-ID: <178975815001.1423373.14150592960268083432.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-20-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-20-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:54 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
