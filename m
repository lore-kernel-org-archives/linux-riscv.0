Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9C1C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phSm8eoqnTw4cIOeXb90A8fiqSShCiRBP/KmOI/JyXg=; b=4WXsnBLBIAxGi1
	zWLpRpfjPfXruxLK8eroZ63GqIDL9uSTSI624MkVzUfLXoHV4hIYErAHeVBLZMi93KP7GMOcV1v/e
	HyBvb8zHYGaYe6AHEHTlp/MZkEvhE/f8/5GAnl9J7nsqfbrY5rQKi1toWAPEz+LjswGnpbnO7bySM
	j5UPXvKnvP/bkidTfbArNMEiFwNRA9u9n0paOEO7Aj9GTcqwIsa47DsJulY7yI8JfdjfgyvBe42rV
	euLiyKaa71w2B1qP3HIIPr0rKiAdJOAmGFAw+GDsJB9Ne/bGqBTe/JKqTaAP/WlaR6WMDM1iKfFt6
	WBFPD1ikqBS92BRqSb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dUn-0000000FKhB-0DXu;
	Fri, 18 Sep 2026 18:39:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dUm-0000000FKgs-1EbP
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 18:39:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0DA8438C4;
	Fri, 18 Sep 2026 18:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAC01F00898;
	Fri, 18 Sep 2026 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756775;
	bh=xTQETUzTDt6e+MU4I+eP6rVfZVdsGsIww6yfCzUatU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eo7QJoRq2YI9PHxFEbM4CrTtiV0ZWT/EDzfBk/v0St46Pcp4miQxRZ5Tl0jEPOcrT
	 0jyxNfynvSwpqJKhi8cfMiElglT/ALBxne2HBbmIYkjZ1AklKCvugXWsjIP31V088g
	 GDgFLbFSZoMz9+PQVkpB2sE9c79pgTT1Hmo3Q1iZxojN4zL8J76jVZ0lYyMP/E86Ks
	 ifg6lLftK4qXFqILfOAxEfnZXaw6OUdidTsTCxzXtuV9KMYbM+u92knVizMhoiXRMi
	 UlkIUytGEd3qbp+Clu3aPvpKjVlNELm2YvLTfXCzpGK5XvuYSfG2Gw7wN13A0QQNET
	 lGzbwpBdQNkzg==
Date: Fri, 18 Sep 2026 13:39:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v8 13/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Message-ID: <178975664744.1339867.1072081982014838266.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-14-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-14-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:48 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
