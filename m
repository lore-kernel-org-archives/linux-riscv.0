Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB30C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaMm9CjcZabGvzV7EUf4zo+4sP0C8pm4NMgN/7DDN54=; b=20vtVPwrYeMxzD
	742VODJPbmOp2f5yykBcsQnzl4g+AvEcTH3k5U1BDdGf9/nWXAsmtJUQO3rS0A51rkSgZc9dhY/zl
	FzVKoQX79yTOzfgA/PHr8lUB7BaJQrswW5+LcFRMypbbjWzWyG1G36T2uzrsfkZ+dtCs8kPOPvFMx
	pSw1aY9jfHaPfhDTx5l6bRSs1sQufmpvM5ssftKbloE+UJQeN52zlZmq/heVQHoeTuDeuiqrqy8/i
	KWLzcONh4TzbVySJCVdhvTY590f+G+Zf0VgXST5wzKVgTMDFfsh3vIcI/90Su6jpigOuAnWKTjie4
	wHOjZq7fsWwH2P9qQMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpnd-00000008WrY-3GQD;
	Fri, 02 Aug 2024 10:46:17 +0000
Received: from mail-bjschn02on20708.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::708] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpnA-00000008Wlg-3ESk;
	Fri, 02 Aug 2024 10:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUlAAkw+imckZBknabpQC9ycK+ws4l7Jx9WYw9cJqHty31F3u77SX60lBZ8h2X7gpgQ6y+f6B009720ESrekAnayrmaMF6FLJkK/Rt7K9xSqbkVlrfzj6FwKyXvxW2hLzq4e+Bfi81J+CrLTkgnObnKU49zGdFf0PDqVPipTdXVXpNocnWWHK8cl1XteCnN2RnlZHDNf9C4C3PbsF5bwl/SGcZJj2LC9vbEo/3uedQJJ3dKGN51WpYDKJqEwtNEd3FYZiUdhqV6ImyXtTtdNHrf+Xd8J2pZc3Kim1sEihSHqHI4YJn6e2gRS9BdNALv9I46PFvMsDYbaKgbb2+EWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHL10LLLXWiRdF0hzWiED6n6yxEuw89N+osOUzCN40U=;
 b=QO83toeYGjQliLGzZtfIWjdrDZpBZE5XFfqInqIkc2uEy9knrE+l7SJd70y7Eo4BQvEaUrqjE2GAFq8u9pEXfPHklBW3ZdqnGk4kQBZ5+D+zjCaXpE2VvqV117XQwid3ILw+gXW41viuO1/L/kaZu+hXbfWiESA2IvSuspw1m4vlziQTlLpHlRrTh9iro0QES1QHnK+Een7o6I/7D6FzRCc8bOp0/JkizjiDeuhNFwlns77B0OJe62FKn5Na1WlPXlhmMUpb42U7Skvds8C7g7sdMzytIOGiFuxeyKCoL3O9mRAQIK0SbqMZKDdjvhOf5lIgdcKiPW7DaYw+yCPuwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0816.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:27::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.36; Fri, 2 Aug
 2024 10:45:27 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::bd9e:fb57:ebf7:9d71]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::bd9e:fb57:ebf7:9d71%4])
 with mapi id 15.20.7762.035; Fri, 2 Aug 2024 10:45:26 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] phy: starfive: jh7110-usb: Fix link configuration to
 controller
Thread-Topic: [PATCH 3/3] phy: starfive: jh7110-usb: Fix link configuration to
 controller
Thread-Index: AQHa44beFBe0N3E+hkqRZPdRqPN1srITyxyg
Date: Fri, 2 Aug 2024 10:45:26 +0000
Message-ID: <SHXPR01MB086373887A29C696747FB365E6B32@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <cover.1722457123.git.jan.kiszka@siemens.com>
 <cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka@siemens.com>
In-Reply-To: <cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0816:EE_
x-ms-office365-filtering-correlation-id: 47a68594-9609-4331-9676-08dcb2e03844
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: Jq6paCtcyWPSUJV0MzRAF9ylkv9DcQfB5JlYjbm+AhQIJ/NdTQO5wgXv8eJ4yvGFRmHzY5eXkef5cTG63Y2KrmO+4nW8OHkTeTae4GFQGvg4QkjNE+5+w+6asl/d3xvT1NADce+LimEY8iO2WB5TxwJ51wFzTSk6VqkKyeSryxgB7KeWs8HTBk0f6YlUz+DI3X1dVn5tdHIDrwI/nmfPoIFKGsx20DF7Mr15Qqdo4qnAGj/TsukA18S29bPU8SCtegyNF08i27xwLieV6CFpHJyMR07uD8RdkTeBBy3ZR0CKJ5NPWBPiskHnyv3FCady/ufJZh6qpFdY4JjPlc/DDr71fTnYZx023brNSAlaMoHZTxzD31uLjDlNl71yGA9012MrIoLZpStHB8iQCtOfUk323oAfzjmIyV4n8/wMiSkcbRPD5x5F+ZnHOCr1djxz/QQvbcZdzpOSE6AX6ygqlXg26hDLbK3d2dMLtxcBgZsq8UtC3MJ1SJUm5mog16Xz4tRdkWmuMGSgoJLGnk3Bw+dcPCpsI+AGLeAx7RKJYTSWUWJ4mBrqxAYb0s8TC6Zjj4dC+pH26USW1FhxIR+IdWLkWTVpVnkPWZxKv5XL/+W2uWGZI8PSFeeBkYSWBkHN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0BgDyyiTO1EjdL2gauF+36+gbzpjDzuYOi4be1GhKqhk3ew3btE+TnX0AjsX?=
 =?us-ascii?Q?bdrCZD+4vHxvvw++oLWO41VCPJ5LaeqdyGkvGQASamPe6bdLyxjfkCo9bQ3/?=
 =?us-ascii?Q?e0imPFz0KHcNdg4x4kbMloRdFb5jUj3VaigLAPEw/IeUwY3VYqG2gqjQ5/Wa?=
 =?us-ascii?Q?HAcRP26rb0CHrAFqHlrsvhdWot8ok7Op8igN76LWpPciQrOsj/y0esEliZPQ?=
 =?us-ascii?Q?8NAOPuXv7W8ZvAlrruoiwv2bWBQH3yqpqWsWVu751at882pSJBJ9iq+LdMQg?=
 =?us-ascii?Q?fljVLZvD6w91Z25NSIQ+nEXpvTTeIshxG8M3BGjeBULNuJbfochgHSsRF3tk?=
 =?us-ascii?Q?t8h1MAXdU+xtv6PYRQ0Aw4HWpmgh2Y0ndn46pybnUnrTO29RoSvG90HEynlR?=
 =?us-ascii?Q?3rgamYxx6uNi6GNI3fHtZ/Byy21SLi2ie5C0+IJxRmhOXet8VJLvtRN2EdTQ?=
 =?us-ascii?Q?n+9+eC3b0Yhj5hMex6xLQ34cCawj8agb3EcxAcepCH7xoiFj+Ch+bpKzt2sI?=
 =?us-ascii?Q?db06AOtuNDAAjOZ1csYChOaPh1pX0t0/RyivKVMs/ejyaphgtM4GJZVhY6hw?=
 =?us-ascii?Q?uK05GqwsI6N57K0WQAVY6Inky4z0b0WsAzO7mWEDa89ex4Sw6TTx7Jq/lQ+4?=
 =?us-ascii?Q?zZAUxCkkF78n1Lny9qi3HmB9RCr/szmxifqzk+DaOEPESAtPfTYMsYXnKdqo?=
 =?us-ascii?Q?y28MeLbflJDUPqCKUg0me8pXigBoAhWrNVnkPWhpg9ULdZzAFrF2oTs0o/DM?=
 =?us-ascii?Q?WpP7QrCBPUhZJwuvXxo/J9ic31EQbJQ1OjSkHxS/LvDGCf+d9efr8hg4alje?=
 =?us-ascii?Q?IKb360BSWj39zLbfyb/wpm3Wd2mNXcN3UV7xpuKGGQfZyVk60xCbysNlgoy8?=
 =?us-ascii?Q?idvNF5QInydYP8PvUwWezka4qIqwXiPLgF0nsTrnBUaOrkzrK7Ltvs7FhNfn?=
 =?us-ascii?Q?M5ljAFT8TeA7/KPlPsrC5Q4611LHkHBwRLScE61Dc6xG7rSEUKGhmfzVvHQ6?=
 =?us-ascii?Q?hViAqvYziDJkTcb61gmcG+pWbHYzwS+hU/FflfZe59KD6YHk8VXbX/tRYN/B?=
 =?us-ascii?Q?As1aJnTU7S8KGwWyvzCutdIBepfcqeo6bWFJtiMrj4fkxMzIj6t9TDdkcYFB?=
 =?us-ascii?Q?kijwq7QQMixbetr+VGLO5BwXdOXl4qAQaAht35QD10Jh0Pa239RXK6tRbroe?=
 =?us-ascii?Q?nK/Qk2OcbcrYvURaUu7NNeW/3L56+wyNbcu97Dyw0ZxsE8bMbFweIurhstP/?=
 =?us-ascii?Q?XqyqB0vM1xBl2P06SvqLvFZiKx60qA9DS4P3lZnVjXfzPy52/l321v5/vqyA?=
 =?us-ascii?Q?BG3v6ljsDZbHqiNRdRWXrk0yExY1pKtsyV0gYzkbPjHonZYwlhI+GVoy8v79?=
 =?us-ascii?Q?VeSQ3FJ4Dh2xFuECHFI1p6VnqXGQTSyII1JH3TaIIriYcyaYp/9eA7TIQP+5?=
 =?us-ascii?Q?IAnuSNPz+zXn8pDrZKuT+YXVAwopWZvvjDr+S5nU0eIUVoqjZpvBBETX+O0f?=
 =?us-ascii?Q?byWJlbIEAj/ocGNhlxknmI8YdlFMGYP+/qaj1OMp+MvUphNbkDe8m9j6M18+?=
 =?us-ascii?Q?1eziTi5U3hI3e1ES6nLWGt+hZiGMUYU9usjNNjx0?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a68594-9609-4331-9676-08dcb2e03844
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 10:45:26.5608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jQoqXdmDKjsWgTQf04yO0KeJMsi/gFJnOqrEuDFbdjGhfjKt5lKCC57ANlTXlC+hpryNq3RHz9CR+prN2eP3BU/TdQROt+ZHNmqoHjPQbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_034548_833756_17E336AD 
X-CRM114-Status: GOOD (  17.05  )
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



> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> In order to connect the USB 2.0 PHY to its controller, we also need to set
> "u0_pdrstn_split_sw_usbpipe_plugen" [1]. Some downstream U-Boot versions
> did that, but upstream firmware does not, and the kernel must not rely on such
> behavior anyway. Failing to set this left the USB gadget port invisible to
> connected hosts behind.
> 
> Link:
> https://doc-en.rvspace.org/JH7110/TRM/JH7110_TRM/sys_syscon.html#sys_sys
> con__section_b3l_fqs_wsb [1]
> Fixes: 16d3a71c20cf ("phy: starfive: Add JH7110 USB 2.0 PHY driver")
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  drivers/phy/starfive/phy-jh7110-usb.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/phy/starfive/phy-jh7110-usb.c
> b/drivers/phy/starfive/phy-jh7110-usb.c
> index 633912f8a05d..67882bc4cebc 100644
> --- a/drivers/phy/starfive/phy-jh7110-usb.c
> +++ b/drivers/phy/starfive/phy-jh7110-usb.c
> @@ -10,18 +10,24 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/usb/of.h>
> 
>  #define USB_125M_CLK_RATE		125000000
>  #define USB_LS_KEEPALIVE_OFF		0x4
>  #define USB_LS_KEEPALIVE_ENABLE		BIT(4)
> 
> +#define USB_PDRSTN_SPLIT		BIT(17)
> +
>  struct jh7110_usb2_phy {
>  	struct phy *phy;
>  	void __iomem *regs;
> +	struct regmap *sys_syscon;
> +	u32 sys_phy_connect;
>  	struct clk *usb_125m_clk;
>  	struct clk *app_125m;
>  	enum phy_mode mode;
> @@ -61,6 +67,10 @@ static int usb2_phy_set_mode(struct phy *_phy,
>  		usb2_set_ls_keepalive(phy, (mode != PHY_MODE_USB_DEVICE));
>  	}
> 
> +	/* Connect usb 2.0 phy mode */
> +	regmap_update_bits(phy->sys_syscon, phy->sys_phy_connect,
> +			   USB_PDRSTN_SPLIT, USB_PDRSTN_SPLIT);
> +
>  	return 0;
>  }
> 
> @@ -101,6 +111,7 @@ static int jh7110_usb_phy_probe(struct
> platform_device *pdev)
>  	struct jh7110_usb2_phy *phy;
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
> +	u32 args[1];
> 
>  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
> @@ -129,6 +140,15 @@ static int jh7110_usb_phy_probe(struct
> platform_device *pdev)
>  	phy_set_drvdata(phy->phy, phy);
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> 
> +	phy->sys_syscon =
> +		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						     "starfive,sys-syscon",
> +						     1, args);
> +	if (IS_ERR(phy->sys_syscon))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +			"Failed to get sys-syscon\n");
> +	phy->sys_phy_connect = args[0];
> +
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> 
Reviewed-by: Minda Chen <minda.chen@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
