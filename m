Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365A9C982DD
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkwUAUvBPL3Zn9r+14mrMKhkuCpw+8kAz+n2iPEo0NM=; b=Yr5K1WTyofqrWr
	zGxrF/kLAaEVuji2o7gwvLmQ7THdbx78TO7y2d4X9ldkju1cZ/FgFeoFhVwJkjFX4/D357amlaA2b
	KcXDgEhmpAfjdmGLxJTijEc2ppCOcS5c1KyTwzvu6vEfoM75/C+oKSW9DMcSNJxKjmm1CFOzm4zwF
	2pqSB3VzS4WipJlghH7Ni5O1ueufo2wWlnFsLYkjHYwG8xVyg4OQfjmxV2ILswupRQvnfdrtHwqEj
	4dp/zfo+sEJE7k9XSORWZwxHweAL4Y9UnmhTUSS6fOqbWeSeu+mlU0QhLO50GzHJOdPFnCW1swggX
	zwK7JfVojLWNufsVbfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dqe-0000000FN2Z-1jQA;
	Fri, 18 Sep 2026 19:02:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dqd-0000000FN2K-1UKZ
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 19:02:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E9B06053D;
	Fri, 18 Sep 2026 19:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E51F000FF;
	Fri, 18 Sep 2026 19:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758130;
	bh=/5AcKAoOrP702V56tOl34K3wrnnLEnVo93rgYLxlkIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIbvS22/habDODgupl94qm1y+kJ/VkjiXfQRR0oX18uQo14moQJ/Rjo5neGrnn9Mv
	 S44qTH3OHovBWFHASvrR61wUMOjDRc13Mz39f1fKH2CknNnDkZKmu/iXr56kfs/Bl1
	 w32yUo3fatPrkCJvpG6n+TSesB7TmaBKjNJgIWR2MvxtU4XYel729EBkGa6X33vOTr
	 x9nelFdBXmSSYhWYie6nUFp5Sp48QdiBvaOlJBC/KS9GnPXC8WHODt8e1wpwju+zaH
	 p+6ICnk+LQP6b7l5UMeBBFBtREd0hBPT2DMS5kodp8Xbs7tySFmcYkIItJW9PH1iC9
	 ggVA0TfGzFC2g==
Date: Fri, 18 Sep 2026 14:02:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v8 11/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per0-pinctrl
Message-ID: <178975812799.1422072.6248117956128284886.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-12-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-12-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:46 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
