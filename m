Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62FAC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc2ccAL5o+9hSaPmJ8EOoXXOurStvmLYnbRrDB0Bktg=; b=x8ENNfkr15joSv
	9nNDkB+1r9uso4UD/AvtEG7lXxSAMb/GjQ+srdTZQUmbsk5hJEyC0RcbrDD1mvL6GtHclq3o//Egr
	AhGqrdvdrqi+PuBHy8feBcs2go7VRotMJzmPqwSxh5Nga1qDBeeIg544jF6om4zu4oVvIaeMhCOgU
	1eNZ2IPJM+CRS0ltYUf0VyYrblCoW4htJTHA9LMoIy8te29P6ZuLP5SY0ptlRZLPYppWFnvuSOLeS
	kMD2VaBaXLSyl9rV3+MRkqdt2m7DkXEUcEZ3zUFm5G9n/GLV29mCahGSn5ON8SS1xGcsGC4k/XXQX
	SD0Zf+6roQuKZJUpF5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QfT-00000006Ybr-2XLr;
	Wed, 09 Apr 2025 08:20:21 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QRi-00000006WIT-4AMn;
	Wed, 09 Apr 2025 08:06:08 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1133fca57;
	Wed, 9 Apr 2025 16:05:57 +0800 (GMT+08:00)
Message-ID: <4937e5ce-8bb9-4bcf-b463-f7d1a1eb2b4f@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:05:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-2-bf0bcc41c9ba@whut.edu.cn>
 <74bb9d27-fd6f-4332-9965-e967c3a31c63@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <74bb9d27-fd6f-4332-9965-e967c3a31c63@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUJOVh9LHR4dGRhITExOTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619959d2903a1kunm1133fca57
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6UTo*ODJWLD0JCj8jLTAL
	MSIKCyJVSlVKTE9PSkNOQk1PTk1PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhIQk43Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010607_209844_6068E2FF 
X-CRM114-Status: GOOD (  11.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/7/25 9:20 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.
>>
>> PCIe portA and USB3 controller share this phy, only one of them can work
>> at any given application scenario.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   .../bindings/phy/spacemit,k1-combphy.yaml          | 53 ++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..450157b65410b27129603ea1f3523776a1b0a75e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Spacemit K1 PCIe/USB3 PHY
>> +
>> +maintainers:
>> +  - Ze Huang <huangze@whut.edu.cn>
>> +
>> +description:
>> +  Combo PHY on SpacemiT K1 SoC.PCIe port A and USB3 controller share this
>> +  phy, only one of PCIe port A and USB3 port can work at any given application
>> +  scenario.
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-combphy
>> +
>> +  reg:
>> +    maxItems: 2
> List and describe the items instead

OK, they are phy control and usb/pcie selection

>
>> +
>> +  reg-names:
>> +    items:
>> +      - const: phy_ctrl
> drop phy_
>
>> +      - const: phy_sel
> ditto

Will do

>
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
> What is the cell argument?

It's usb/pcie selection, will add description

>
> Also no supplies?

vbus supply was included in dwc3 glue node

>
>
> Best regards,
> Krzysztof
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
