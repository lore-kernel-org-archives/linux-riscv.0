Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14079C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV/HVlUIAf2X9rPSDnARSs14mgaiyu+tgXaOwT9MSdU=; b=YoTxtI4Lt5PgDJ
	C/ptKZdfZnPkh6ckxJUp1IkWEcOF3Q0XG1KgDxdwbr+SkOvackcb+DwCkJNVxvAtsB+snz6xXUorf
	uyppFvC/DYcjKLdCad0QKKwJJ8rf+MjqFGaYjb74t9fWN3qQAZqxlwB7mIDRWmcsfVk8yCNtaFb+w
	FrJntfd9h0PgebF8luTtdpS7UN0S/KTVt25IHkslgo36fAu9ytWAvdepUG935a/aTJ62LduaQHT72
	z7G7Jp+IZgY7+qOxBDSGBhwH3EVNYb5OwHJTpHkIkCAIYU7IZ8YT+fBgTQtrYgtITxFYl/1yw6VhO
	vUguzIfW2VVevZMPTuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLWW-0000000CJy3-3Ir1;
	Wed, 12 Jun 2024 10:48:12 +0000
Received: from mail-dm6nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c17::801] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLWU-0000000CJwW-1KIN
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 10:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAL7csR4WYvcwXsh/f+QL0nBYBDBtKjSJlfbmDUla1fkok3laOhILp9f8l/Ro0HlvY6TKJolWDnELZCPTOKHYp04P2qYxCcmzmIHlkB/t68jTxV7azuIQMWMl9aX0MYF3AwCN7z6GKTn1ynV71S6HmwNUuzy2Ebv1XeBiUjdzimU/lUHoOc6jPYiBxNu7PuYUQLnxRI68mY2k1gFstRjwWKDHXOc8BdnO/En9IvPQ3b5PXv6PBFSwUebfel4Gu6HS1EwzK3xRUO/vmLbQt+XhiqFJJAisZOHSnP55KJQ+VDjfv6qcky8Szi87cqi+lV3J5KlEwLkroNs6CaG5kLBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4IiYJoILN4oySR9jN7W9pJ2Tz2TyUZM0QvpZW80Zbs=;
 b=nN//60wg3RS4LQ3qRkbOc/4MrQaCpaPRQh5KF8nLoZHkfyp1DRctGYPVu6C93h/MUk0ID7FrMSLyWm8kDH2ADNC1Lz2W49DyeQYqw92x6jJNlM4yhySTz+2SJr5zLFBkrwSHANVz7NLEdSYdPfc7/5BtqJpR9/ujiaUa6cATQ3QwD+xK0ZY+l7vxpKoHcPjfqO0QZwhH7VstLW0uF5Vj4OxwrJC9RQYU+4ZI8o6m9zX8Nm/xPIz2bHa3dEd5AlrvH/1D0MGYm5ZkMZUfa9McV1xZ6oVn1paoJp4cCnY9yOnXZwBIwc6SwdH7Zu3XMF7bAE9UIRhjtXI4pV1Zv6IJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4IiYJoILN4oySR9jN7W9pJ2Tz2TyUZM0QvpZW80Zbs=;
 b=EKU0TrsTTVA4A1Acayf7Ydu6Y3KMpajX6XQMGEf65y7RQ+zp+/2sW7x5/8Lu2l9y9LiddZJEdvKG6NXYsiFIKkKfqb0QL0k4se3Eub7+/9qA8KNenWznKpWFdbNCS5C0zbESQ2B5cXIDJAmGryLH8Nk0j3D+BMqyEbN8XV/0p53xAzdXP9mIbBuQ0iWNfQoh3dT1QsxxH9RLQzBn8BNuvjykXCdtjTL/zRCTHZ1Y1aLtVw6oCthMkfO5Tf+ubTYBqJaUjaX4B0B5b0f+fK7vrgPZ/YSXe0RrltIzyAebn4x0qirSWVryu1FANiiTNMqq+oLN5v7na4/3hDk+vPg4XQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4826.namprd20.prod.outlook.com (2603:10b6:208:3ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 10:47:58 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 10:47:58 +0000
Date: Wed, 12 Jun 2024 18:47:47 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
Message-ID: <IA1PR20MB49534C9E29E86B478205E4B3BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
X-TMN: [i5+lZ8UEQxdqAB75jF7WXHERTo1rdMP4bKA0W2nYcpw=]
X-ClientProxiedBy: PU1PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:803:29::24) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <zhkyr5hhept33db4f5u7hvaakbbtq3dzb25khgy7tuz4vxq3cw@rpvoszywqhtu>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9f40f8-0878-496a-3b40-08dc8acd1f44
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199020|440099020|3412199017|1710799020;
X-Microsoft-Antispam-Message-Info: Znnhoy7+VVrsYAYWZ7jGqOjClF9ljizRhdpzhtW9B/0bMwwbCENimKizDeY4ydO3Cy0Y1BGrJvHUfz9FN01ZJ0zc1F6Sd+1Ia5DoA3/EfQEDiPxxBuo5NjyVPx+c6xMmF2xvi4u6boMa3T4UmNiFDHrwROUstES9XGohzKzGAjJv9sjacVhCEaJ/6hdmQYnIIGPFsw0t6yAnduRyP2CAEDYmFTWcHaQI9TYjX1Xs3Di0nqVy2noggzgiOiEPAEpq0eqj2v+T/1Sg62yaR7e64vuvARXtybdOmK6KJV+mjWO+fJ2QJmOe9HuoPqm3PmE8wLrOj7Yj0pgs1PgA7Md7jGB4WYvmyI/KgbicCafULCXNT/L1jEg6y5maTsAqxJsBJ5WjKUCHnu2dWlziBy5jfZ7jitT7sUnG7Jrd6S3DX9B8jK+rmS/Yg7teG9+bWDUQ8Pzl2wISWNgwNcPJKb6KXHZw0u8eeYn0S8wfwAOUzJmITBh/EvIvnvnFE/I6fAnAA5wE5HsjmRMusRFOOzv+HYhrQim1voz6bUqnMg3AqofcR18jMcRxj1cHIU64SmW+EXE4YvK2IqVwSCUTSlXHhLgpZlb/3nm4KlkVc0w+PFIk47wLAM2SivEi/Gkum0W3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z5WGE2vMq6S59wb9tjlW1BqPfsB8Z6xAqdSgtHE7jkcLnMVqmHEyCS95bk4l?=
 =?us-ascii?Q?dYg2Eb6wDIMTGfAQOVsKwxEX565jftQuE2aUIPXBmHA8GoL5Svo3qNDdoGHj?=
 =?us-ascii?Q?5+UaV0YvbuK9XpnxG2/vQCPjlTtAZwsZC9ypa8yo3pION18gkT5T0DmLJR7j?=
 =?us-ascii?Q?dkqL7z9lLnusVpaT3lslDaENoJThU6tmkZNbU9rgnHIChAozRZj8ylr7vrEA?=
 =?us-ascii?Q?4dQhSiDDQaKGLhHphtfZCMWArUDhW5g29sy+pGz4/QUwNwpy1UfcO0q8uvDe?=
 =?us-ascii?Q?J+2BkbowEOetaPGXZUGfmoKQfMl+B0Ymj9qSIswP2OeW5YrSgEMUgX87wHB2?=
 =?us-ascii?Q?E2goYKZQpny9bWnGw6QzqNqxDPGaUy4sFf4smKZOmKFCcZtk6La7Ry8KSD8y?=
 =?us-ascii?Q?IE7W8u2lXk1CaBOS1Ntq/+rIaTMBxKM0vKtYQZUqJ2ugQUTgV+Wb0dVoaqlS?=
 =?us-ascii?Q?n5cxcdX82g6br6hPBB5B5iBOBr7TLnYoNVB+l+VZj7hZjV9VjbN5reLQT30T?=
 =?us-ascii?Q?Pppdq24K2zVnoAaT7nQQP/JooeGIh05t0zawmklVmCB+8DVh5US+pL0ySIRe?=
 =?us-ascii?Q?+QI1yyQWKYJebZ2LO2nXwRtTUNg2ndQpdhaOBXyXljANP6EHdTzQFnx2Ccwn?=
 =?us-ascii?Q?Ddz06a8+wR+ijx8rsQde/vb/YOZvVOKyuZn1vGPnjSxeu/cjxE2LRQH1TnP9?=
 =?us-ascii?Q?77PiD2zxkrgNrAUKTqVTR8SKi3GbNhJlXgzxJVmSfxECMMyAQ/ZQB0vI4HQ/?=
 =?us-ascii?Q?2fgqcT/iwDOFpy89kl5wrVVFHDQ0cGC+qwsd5Hvktu2CMPFjfJ6wz7MvXMIw?=
 =?us-ascii?Q?6wNk7TXj0k0x2bSXOYWtjRWfIhclSc6k1pxckVRuTACo2cTbNvHa+IKN86XV?=
 =?us-ascii?Q?lZP1W5HGvWfBH87Nm+vQQBuuva+TuHAkTFOjE9gsvaG2+XyJ+nuLly+iQaWO?=
 =?us-ascii?Q?nhcOoOmpmh4ocXW57bUkvPvdX2GQ0BqXsm/CgLaUMWpRGPGV26CviHT7O1F1?=
 =?us-ascii?Q?L1rmmTd8BBpKOdRP7TFP2ygymS316iTBZKofI0CC8rzgjDeMATp+27la0VOP?=
 =?us-ascii?Q?S/fvuSlnLYPREhCxhs+jTiTB/OPHUFayXScjk82iGtjbfur5qSAutWsShHRs?=
 =?us-ascii?Q?AtKNdxGjzJoO/SBymaPMWarGyeqrJSReNcx63T6TxG4rljw7nVkb4XrXE42k?=
 =?us-ascii?Q?6/FBx4ZSWXJnR1tF4RTFsyaQXQfW2aLIrO7Vtw3RRLP1xoa12ae34FK7RCgb?=
 =?us-ascii?Q?UITDKjcynXhz7vxUZ1md?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9f40f8-0878-496a-3b40-08dc8acd1f44
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 10:47:58.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_034810_380543_1C28D60D 
X-CRM114-Status: GOOD (  16.71  )
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

On Wed, Jun 12, 2024 at 10:02:31AM GMT, Thomas Bonnefille wrote:
> Remove SDHCI compatible for CV1800b from common dtsi file to put it in
> the specific dtsi file of the CV1800b.
> This commits aims at following the same guidelines as in the other nodes
> of the CV18XX family.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 4 ++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 1 -
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index ec9530972ae2..b9cd51457b4c 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -25,3 +25,7 @@ &clint {
>  &clk {
>  	compatible = "sophgo,cv1800-clk";
>  };
> +
> +&sdhci0 {
> +	compatible = "sophgo,cv1800b-dwcmshc";
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 891932ae470f..7247c7c3013c 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -288,7 +288,6 @@ uart4: serial@41c0000 {
>  		};
>  
>  		sdhci0: mmc@4310000 {
> -			compatible = "sophgo,cv1800b-dwcmshc";
>  			reg = <0x4310000 0x1000>;
>  			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_AXI4_SD0>,
> 
> -- 
> 2.45.2
> 

Hi, Jisheng,

Is this change necessary? IIRC, the sdhci is the same across 
the whole series.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
