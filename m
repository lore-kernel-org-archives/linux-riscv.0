Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF4C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qz8IMJ+og4tBF41d9dblZb8hbxVJgkvcIETOntQIsQ0=; b=fj198WcIRcKvpT
	Enat9LlA7dsKMm03cAqVzCT+nH1qErKUSIqAo9SIbnON2TNhYDCaBWhQjckRZ6Rv/ANaavpbSHgGL
	gAuytarypJVGF/MXFL54gP+VUeM9HR2v0sUXFQ29iMSMXRLfQ4Q/8zD6bO6MOLbVXFPpcLx3FNs1h
	0pOjV5iJO/1FZdSfxMpJm6yzqkbkSEVeUdyJd+2Y5u4BHLSX9Rh11EXIiEMe0dl8MJhbTFZz7Zoz5
	hQOOMiiSGI1SXYD+nScurOBHK5SMNy6ctMBvlbGZxd6M3vpGdY4yefz3l1ISeK12ayZ7UnC71lLfU
	hhwOilPuzLd/p6DaXYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dVE-0000000FKpP-2y8y;
	Fri, 18 Sep 2026 18:40:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dVD-0000000FKoe-0TsM
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 18:40:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89C406053B;
	Fri, 18 Sep 2026 18:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CB71F000FF;
	Fri, 18 Sep 2026 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756802;
	bh=lNhIuqNEqFGOzX0QSlkVMyRbgM+H53S3L34j5HaHdPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pk78XB2eGxO5UvaQCsK/UjJS0gU1J32MkfyG9UcyoFeB9JC2M1/PAkOl2RZ3uveaB
	 DRP+8UmvmTZ83uhg4j/OT1iaGbEMnwGaZoF5yoJJYOAn98cePwmFjeqUuHpAhQzd0a
	 jQfn4dkPJNBZH/WnkECtuJ803meKQ/pJ9o5xPBLwmaZH+UEa40l39c1spJOS3mGOAH
	 YqiJzYtbqHx4chZkZbjAdJA0ktI5HedkO8/UvkhZflBt3qp+gDmoIqq4a6K9gUxF6I
	 g3o24e7aCi1WuZxreMnBXXJVrWLqbUiE6Kp/Q3OUt3GtElsF+jwdBcO+KQ8kv9hM93
	 MYgmBlSxuyuHQ==
Date: Fri, 18 Sep 2026 13:40:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 15/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per2-pinctrl
Message-ID: <178975680030.1349064.2429832407274267046.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-16-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-16-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:50 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
