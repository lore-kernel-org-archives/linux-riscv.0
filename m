Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1681ACA1018
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4AP0wx5W5texYh12kvZy2pVzkfSEuYwjD9jSDP60aA=; b=raGCLAoji6WkbY
	saj2VFnAg1JNBxohiOEMODQQimqSFCPLOm8garEPJe0AVjdUB3IXyGSEjPqpw3dae2hBfLyeUcsCs
	63qqBVn/aejFK2BrjNFA7PaSyjF/eWOxTGwSVHNUGYx45yGq4wMPbQYKq382+PIwJY3AoRqsEOIHA
	9l0yyvcig2C87W9RaKR1YK6kv71wfHMpV1g+WqZ7iO4kfaphNd9N0EOA3Jcyy0m2BsF1CHUtYVbIR
	vgqa/W7Aa6YLY9Hdjj1+qAGIyhj/TFGivFHNHVf88LL2CW1Y7l90E7LuXEGnw6e/lLi9NyXUQ7ZwQ
	LuSgD4ZcthN2HOebtakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skNYz-00000009LVs-3oNk;
	Sat, 31 Aug 2024 12:50:45 +0000
Received: from mail-dm6nam12olkn2081d.outbound.protection.outlook.com ([2a01:111:f403:2c17::81d] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skNYw-00000009LVU-0NfS
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 12:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b93SAggySumWhQY1UH24Y5ObU9ErEDJA57EhR02hZaVlcSC2Bwd71e1yw2B4VpAunPM0pYfoxffgK5AeSDFMNqh9q8hciAb1q5D0ih8enmwI+yi07gHVKyN6bQIvhyWVLPWyqKjNHgD01xcFK1vuo67AxtXHiVpfBmBrQDF/860229B7p59yU9MLyG8EPfKF4tmRRSygOdntYu1aBFzz39FOIFrq9lljd+99jTsWQW7givL0VqUKhYUPQ9fmQLSZ8rUBYf3+ZX7tY66uafZ69tctWVhmYJA4zHFCZHagaj54wDUf0fPUUxMpr3BK0Bsth3PWKoZ7vydl1Na4e7NCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3Ou6QGMWo8zlhDWbSGmZohoUM3EnSPHsv1WauRXB4s=;
 b=ysQUMnDlWcBJjGlN6ec1RU4/tumHWHbRrRs9aOVALPtmRlIMMq2jvzI2Dv/JP6A+UIOQODgnfXlJvWwPJedOpAWF9HFQc3StzEUl8ssbXz1MzcqY1eIT+uJnrpNo/BtnNSzZ3ivcyMgp5ju+kFQpFB/iX2HHG+xUTZJgtm6809SXQWFV7RjoCg5zNoRwHuPW/kX4OAfgRvF7N//ejk9PuyzBVV0+WfADp0lrkBC0eff1dK9Z3WxfOc/KptMCO2WFU6HCa8SWQd6OMcWtG+r8jNtGqbmTLvKGuQ0+IozblpK/6aeXtyLhFECRwPGSgj8mfIidNgh1NcJg/KXvlTx1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Ou6QGMWo8zlhDWbSGmZohoUM3EnSPHsv1WauRXB4s=;
 b=iQRr2TVlFMPMMzLrrXwHQreMzyZr5yX1tlBN5yxymj+LcOridD/hIcOqYBkFjec40nKJOwI2GPCj6Vejsk4emuPzJGtgJLmLn+zEflhPAlN/I893X3MWeSmzZplDpomFDDAnEeFl3GRhugZuckfw9FSdD0cNASB1JNokMGzbDFKS1dy2NgBu0TF0ZpMnsw12gLbqI3HF6Q9TwX+CPtv3I44OH8EwLB0iIyjI6+GfPbua6NRdtzIWzpADa8e2zbcUC8QgqQ4vbhspoIJZTE+uKpPmXm/0VLBA4xURY75F7tgODD1S4ZOdazKaM8BpiBOEpqz/rFL71mPPqo4o0CKckA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4870.namprd20.prod.outlook.com (2603:10b6:8:a7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Sat, 31 Aug 2024 12:50:31 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Sat, 31 Aug 2024
 12:50:31 +0000
Date: Sat, 31 Aug 2024 20:49:22 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] riscv: dts: sophgo: Add SARADC description for
 Sophgo CV1800B
Message-ID: <IA1PR20MB495323339EFB06E194204904BB902@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
 <20240829-sg2002-adc-v5-3-aacb381e869b@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20240829-sg2002-adc-v5-3-aacb381e869b@bootlin.com>
X-TMN: [RTaxg5BeMszIwm92en9TJOJKa7sl1mrSYjJhS2Nu4io=]
X-ClientProxiedBy: SG2PR06CA0215.apcprd06.prod.outlook.com
 (2603:1096:4:68::23) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <g23kyccfmoatb5m4z2bnn62rwj2qapgssrb3j3435loz7xxlrg@lployqd4rg4m>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: b401b7ce-85ec-4acb-ae90-08dcc9bb7f5a
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799006|8060799006|5072599009|6090799003|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: juEnqUSxrUAVFFi2zLtcTQkOFetjPrmWAWHmOOX2wROC5olc9iWq0YcW0uBv0p7pnCYYD7LW/q8wLCMDlXQAFxnnt53l0BLd2xpmIajyaSul73EPHEGWIJe94l6d59GZQZbCOVjKTUP6fIgA7z7OuRnfnrROk1AJeZxTu4g6geNGr9LXG9zTmyD8TVtUKirl1uNbtqpZR7sbuGp/ju9H9bfBHlfS0nUg5g64OEfuMCDCb8vwusgz+7mEfucQMMoLMeFYldHQzWDx5LfrlY+LlnihOlqMO6o0+/S+2fYkALGvSHKjdwfoD4JKxGCcKqnQP6DtBq3xR3NZd7z6u6kLrkLyunh3t1NL8EFIo8licydkiYdXq1qtMwBYbadprqXlPFv+xIJ3GzAj3Ml28Fmq/ivDtGG/DGQs0WBtayLCZplAoZa9GKUxu/ehzXpzLeUlgc9FYXMHh/gvcqFDtsNVWPCxE2D3HO4I847pd2mF8kXOXtkcrVBwUtSeLgVyyKe4asIDUVoXXbfGi6zP9ZNn1txTIi0zF9afCFStauFDKaXhWRzdDt3N3ABPyL4Xvk6Y7B25vl130KvJUwYSCDSKJAdiUAm33LO8WcOFuHpRTy0TeoFD50wNnRDzpZDRbx4ix2cG6FaYD8IOzoztna5IBz+Bfk5AnSdfNSJZrLy2jE4e2hplogliVCkjkXS34cr20Xyiqtt6LW76ArkpKvkFlhjJf1mxOyMTobshdd6f3Gsy/yuDZoE6pDcPCQM5DLGIGHC1eU6A3gEy2tJhB9QuTw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvOXUY6q8Od/qS7+93T1Q/xJw8zLycQCqI3YMC8nDmcV6dyEptqRBVBxlEpn?=
 =?us-ascii?Q?G8y/BJgplTmcXoKT5COKpsjZMC3Tlfv+4H3R7ojbL+BfHuoQe7KwseS0uJWE?=
 =?us-ascii?Q?Lqij0z6lG3FeGZc0r9yQ5F7wCd0iyxvXzM2L6nApx/Paqk+tkjkLHidpXnGD?=
 =?us-ascii?Q?SUc+itNfvWVxBsZhX19aMo3QEBjPYKz3YPz+ifvNGM3qgOg4VhQ4v105XV2j?=
 =?us-ascii?Q?yxYqDvKrM6jjrSYRWKuN5BBNuN5PQt/FaOYy0ZIfvxQeDJyIQ0rQ4v2+zbY7?=
 =?us-ascii?Q?2XYaLSEwBMqUaWd5W76xrkiil/qscc4jVyW1+sumA48he6gfAz/zhwXvVsSM?=
 =?us-ascii?Q?YyFvAHTcoLX+QUwoinmQckkvFdSysYeUzKU+e4zL5YqjJZzgbDYdF5QOnq7S?=
 =?us-ascii?Q?PkALt4KcFmW4QdS8rR6ir9bL0mbxteNbjMsb7DHjAQwzx7sdli9OKyXxUW4z?=
 =?us-ascii?Q?RepVSFpZIkwaUaJNlCy79L3d57d2qOzFANiNjsubD3WpJHX0lP72xT1/9JMS?=
 =?us-ascii?Q?ERa1qFH/xEUtfmL+37k+uZ2LFGJe339O88w4pIjWBkzAwNg2jN+6UzNUE7fx?=
 =?us-ascii?Q?/I1aVC07PIvWiwtNCSa9avNJUL+IhTEmT0FyYvf1frmVWPQ6ZFG6FrqLpdpD?=
 =?us-ascii?Q?Lg1fPnTz1nTxpnp5ZprbmqbxVzUWNvl24Sw18w/6EN643IAy/wfLmgOSFfmA?=
 =?us-ascii?Q?2oFcbJ9PKhnpZ7heN1ylZVP2wBGE8mDT3D+ef+Qh2xz/uZJayQGG7ucmUfmt?=
 =?us-ascii?Q?254+vxQzSxzOr7PssirAch27I9B7Q4Wsw0tgDnA/iWtbBvqH/HY606hY8S7O?=
 =?us-ascii?Q?Z1/hANCYGTfC7ho4hpKje5l6T2v93t6PwkHep11VtlUQnGo9YFgNsN4NR+FU?=
 =?us-ascii?Q?3jrDwQL71oeoj8c0kkxXDwGTfimQL/3pU4PA1mwO41pbU/wziEKwJlVa8XS8?=
 =?us-ascii?Q?tQDCOo97XzZnec3ZJ7/Frl40sSzyZfrPt7MU10bq5h+vM+GfLb1X3kGwZMfF?=
 =?us-ascii?Q?m4gSshaIF0+zbn/Z6MO4VBusuEw5S2NWBD/q+MPVoS/Fa8YshoTpwFrQwXzJ?=
 =?us-ascii?Q?eE/nRU0FDOgnATIpeRvB8DAE/vwQ7DY9d3rkgFse5y3cYZh87n2x6IeQAFiH?=
 =?us-ascii?Q?0uJ95PVf6JofMjYo32CDDqdYMsHp4sBG/dQmbtneu99uzxMqR7O4PlFOtmDE?=
 =?us-ascii?Q?sQT6CLCZiugMKgns3Ls+xYrTr2K799lbMdn7/JHUnmy2/L0j2FvoCwNNY1Mf?=
 =?us-ascii?Q?5kgL39oQiRRYWbl2UDjM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b401b7ce-85ec-4acb-ae90-08dcc9bb7f5a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 12:50:31.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_055042_167648_F0A9E8DB 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, Aug 29, 2024 at 02:31:52PM GMT, Thomas Bonnefille wrote:
> Add SARADC node for the Successive Approximation Analog to
> Digital Converter used in Sophgo CV1800B SoC.
> This patch only adds the active domain controller.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 891932ae470f..da1ac59e976f 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -133,6 +133,28 @@ portd: gpio-controller@0 {
>  			};
>  		};
>  
> +		saradc: adc@30f0000 {
> +			compatible = "sophgo,cv1800b-saradc";
> +			reg = <0x030f0000 0x1000>;
> +			clocks = <&clk CLK_SARADC>;
> +			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +

> +			channel@0 {
> +				reg = <0>;
> +			};
> +
> +			channel@1 {
> +				reg = <1>;
> +			};
> +
> +			channel@2 {
> +				reg = <2>;
> +			};

I think it may better to move channel definition to board file.

> +		};
> +
>  		i2c0: i2c@4000000 {
>  			compatible = "snps,designware-i2c";
>  			reg = <0x04000000 0x10000>;
> 
> -- 
> 2.46.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
