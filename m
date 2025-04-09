Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469BFC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVxAyXXq33duswp7fBxrLCbR1/9E6/Pl3yx6dwtEoWw=; b=a/KmhOZdP1J6Oj
	8QOP+94jUaxXtToru1W70FyvHsO6rqa/2ew6QSZ3zTOSIkji4A0HxrbySHOXAsxUn3QDGwMCxB0O4
	8e42EeSsO7uEQlGfsbYx5naBfUq8uhbgsNMGQdQFljmhpzkpi8vfTMs+9D+bM71n/zqAbHM0KA2oY
	cyBlRiNdHx5L23CzFw3P+UX3vonQl7u8yp8gc2B8+6IAeN7qRwGNBvin1BCqGr4UqxG/c2hcmMWFx
	ZMQ6aft3xMLVPuKweJuWKyIdOvGCpDCVgGjdn4S1btxR4/gnVf+n7jB2KOYkkNAsjiDXNmgVwpkXN
	AhvJ7wPJgb9ngdNKirkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qg5-00000006YnD-063d;
	Wed, 09 Apr 2025 08:20:57 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qdj-00000006YMJ-4823;
	Wed, 09 Apr 2025 08:18:33 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1135140cf;
	Wed, 9 Apr 2025 16:18:22 +0800 (GMT+08:00)
Message-ID: <2986e9bd-0e01-4361-86ed-e4d92406c911@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:18:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] phy: spacemit: support K1 USB2.0 PHY controller
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
 <20250407-b4-k1-usb3-v3-2-v1-4-bf0bcc41c9ba@whut.edu.cn>
 <abac53a6-cba7-4962-9f34-ab2eac9e6e3d@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <abac53a6-cba7-4962-9f34-ab2eac9e6e3d@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH05CVkMfH0tOGB5IGUIeSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619a0fb7503a1kunm1135140cf
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6GQw6ITIBPD1JGVYxAS09
	DCgKFD5VSlVKTE9PSkNNTEtCTklPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUlLTkI3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_011832_211884_31E3E2F7 
X-CRM114-Status: UNSURE (   8.19  )
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

On 4/7/25 9:25 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
>> +	{ .compatible = "spacemit,k1-usb2-phy", },
>> +	{ /* sentinal */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
>> +
>> +static struct platform_driver spacemit_usb2_phy_driver = {
>> +	.probe	= spacemit_usb2phy_probe,
>> +	.driver = {
>> +		.name   = "spacemit-usb2-phy",
>> +		.owner  = THIS_MODULE,
>
> Take recent drivers and use them as base. There is no such 'owner' since
> 10 years.

Will follow. Thank you for pointing that out.

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
