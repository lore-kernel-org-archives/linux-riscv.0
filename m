Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A06C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBT+Yr56i+lFkr1M2NJiCYYF1iD5syFJEL0vDWwgCDU=; b=hCs3jLlgS4GuWW
	oxihR0MGqlNzS2XiKC7cT4NFzc5KrcFGQQH0Lii//If4gEJtrCl3uqzIE6PhhOYTItSEu0Q5ypJMI
	CvsrfFIvEcB/U2yc17e/0BOGjOwM/W6S/1qKdh171cKQHJ+AfdDV14pielleo4SUrzqRW68a6Negp
	tHSWvY17lbgO+85zLbR9P+DSW5WeDlbeOt0AhVZTshzigWDVPqO70ewoKYsZCD75FovuKOpsZ4X4W
	KNJvjo3r003j3MzC8AtkFug7zAUijF0dLGlOOoUeNQ28HEQJke19BMOQogN9z5wk5Kv7iojzS+GH3
	bkVYSiKWBySpKY/kKing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udk-0020qb-14;
	Fri, 26 May 2023 10:25:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udg-0020jc-1l;
	Fri, 26 May 2023 10:25:42 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E400724E206;
	Fri, 26 May 2023 18:24:49 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 26 May
 2023 18:24:49 +0800
Received: from [192.168.125.108] (183.27.98.143) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 26 May
 2023 18:24:48 +0800
Message-ID: <5124e6a8-8ca6-71a5-19d6-8c15e954c458@starfivetech.com>
Date: Fri, 26 May 2023 18:24:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 5/7] dt-bindings: usb: Add StarFive JH7110 USB
 controller
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Mason Huo <mason.huo@starfivetech.com>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-6-minda.chen@starfivetech.com>
 <20230525-shopper-handbrake-27fc06aede32@spud>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230525-shopper-handbrake-27fc06aede32@spud>
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_032540_751077_55C2F720 
X-CRM114-Status: GOOD (  13.22  )
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



On 2023/5/26 5:34, Conor Dooley wrote:
> On Thu, May 18, 2023 at 07:27:48PM +0800, Minda Chen wrote:
>> StarFive JH7110 platforms USB have a wrapper module around
>> the Cadence USBSS-DRD controller. Add binding information doc
>> for that.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../bindings/usb/starfive,jh7110-usb.yaml     | 115 ++++++++++++++++++
>>  1 file changed, 115 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> new file mode 100644
>> index 000000000000..24aa9c10d6ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
> 
> I think you told Krzysztof you'd rename this to "StarFive JH7110 Cadence
> USBSS-DRD SoC controller"?
> 
The previous title describe whole USB controller for previous dts node is merged. Now the dts node is split. 
"starfive,jh7110-usb" just contain starfive wrapper layer dts configuration.
> Otherwise, it looks like all the stuff from him and Rob have been sorted
> out, so other than $title this is
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor..
Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
