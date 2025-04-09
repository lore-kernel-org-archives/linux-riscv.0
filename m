Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18D6C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5HBiY684gRwng2ni7W5m1tt39aURRLK+ysximMOAls=; b=WxJ/LHK/xNV/Yq
	obgk1crCcYMoKn7aWeRhqv1QnfV7oSIEB7fbQpCKUjPft6xOy2P1Q5PVGrQEyrlMTbSZqMtw+dEaa
	cXGCEK7qKSnLpsyMk815YvnRQz/OhxSJHU+JA7a3ObQuOL6U+r7qBgkw0Bitauqxyz2HSFTR7DxU8
	rfkbRYkOYmzi65+V8IicY4FqbvGGCzzegOSG4lmFKPDAYtUC6JKHK4C6h5vra7etYujR+c/Vow9hq
	JZMAjlBSupNCgownkhATpM72TXpWTJ7kXsmoU9Xa2xaY3TvIvL2N8q7SKT8gfv6BDpHToy8kztgN1
	zU67326R7HsC7t5BPebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QYM-00000006XYD-3S0G;
	Wed, 09 Apr 2025 08:12:58 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QNE-00000006VOh-1aMy;
	Wed, 09 Apr 2025 08:01:30 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1133fc98e;
	Wed, 9 Apr 2025 16:01:09 +0800 (GMT+08:00)
Message-ID: <2a862d73-2aaf-48ad-8e01-2138241d9bea@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:01:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: phy: spacemit: add K1 USB2 PHY
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
 <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
 <02157e96-9524-4590-9ca6-e4390176d74e@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <02157e96-9524-4590-9ca6-e4390176d74e@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhkfVktMSkJIQxhPT0gYHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619913a0703a1kunm1133fc98e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06Thw5EDJCPD0DMD8PLlEU
	ViFPCVFVSlVKTE9PSkNOTUxMSUxJVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUpDQkI3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010128_613539_B4C46121 
X-CRM114-Status: UNSURE (   6.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/7/25 9:18 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-usb2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
> No supplies? No resets? Are you sure hardware does not use them?

No resets are used for the USB 2.0 PHY, but there is a VBUS supply, which
I included in the DWC3 glue nodes.

>
> Best regards,
> Krzysztof
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
