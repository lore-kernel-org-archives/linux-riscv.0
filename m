Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D58AC52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 01:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIn/KTv88/czdWbfWqdi8IzpqdExx7S1lIAdmf2spmo=; b=dmlEB0Dbgq+2yFOyb0nX+QkI7U
	MQtdl3dHAlexW5ic7Fu+BTT8dBwohf2pIKqY28Nezha2b/HF/1NQ+6sPRXUpMY+QB/mSVXVZJF8Lh
	Oz7RDTfKiwS5yeYyM28HFAuwr98ZoSKHypPRz0hCX33gNMt5ij0y6ShS9xV3Bp5K3mJ2hTSBt1rql
	KLsy19MC+wmBecWaFWK8HGN+z7DvTDVlEolFuToMxUTIGX+VKQkvx+ISKPrJ/K7KXc5KbQkp7ff6O
	DqtokX16k+/uT/lMfFSptDlLF4Jr+t7OT4qGombjC+0Erwl/knj3AqrkHkaXylTpQ3d3EJpxSRk53
	9bsWGIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgck-000000021GO-2eP3;
	Tue, 13 Aug 2024 01:46:58 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgcI-0000000219o-42mP
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 01:46:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1bg5AMiraMI6BFDUUV8n6y7zRIpukV1qCA+qIh/kf+Uu5sY1P+6s5CeN0WopiTKMQ6W2I/xM9HFt4Y+Ca3H/85YIY2D1S8Yn0L0E88B+rkBjj2ZowSn86dHCC5fHNL7IFaJOuNZNwsKQjJoA0+ieVq/7VFCali34QoYlIT1xEcCu15XZZ4vzP9szuNu41kGgku2bgmLtFtpnDw86q1D8HXU90x20RD83erA0m7X3FhQNsTZbs+jFdy3/hVv2TGgRdkj8BR3Q9gXQaldIhEX6Yk+WEmUUs/7eSDQ/MT8TIbvQvKFRoOYgOPSUPm1YhemGxj+Nvc7Q//XGgNQWPyz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJlmn6F10TNmKwGnc+65yRhDwq7XYwowVxeZl0RtuLw=;
 b=jVf9VkEzBimoS6a895U9M0D5MwklNjIjSaykkD1uJum37StnEvmrNxn0bTD2ezmViRlcSJIUsY0cN5OS2YJnZW/eNzj4v22ZfUULBfA/oXJS67LovC4tI5BBjOn2lPw1Zs5mGP7hhiwIHr8PRFOOAiMrKRlR61Yp/lmGsLoRzL2mA1xOa/RrPlcV8hCM1oe91yIt2jncmz7cIak/W88WBQNz6Z9XFzZ5JN4DbMTXFpahajdabgFa82DFAUtJ5Um0/sz7rY0uBdQ1IwOdFjazBhOSO5ST6TxVNTVzFUjQtqEoNO92Z6AoYquvqJE5BZdpDAOKXzNyDSgat6BhVxQuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJlmn6F10TNmKwGnc+65yRhDwq7XYwowVxeZl0RtuLw=;
 b=L0HA7CRZ9t+3qzg/Q2Pl5Ivi/0OhPJ3GZsLIdUtMFX/ooQfnGoTs9Inl2T2h32seRZ3227M01sSu3XqiBYGTGXK+HNjIaSnZeamdTxtkKsdCMuP6nhyN5cACJDqF32E3Rzrn09JUvsCrw3Qyipd/S2Or76gHlvrMmXOQcFpgxxZp0CnpRWrT2eA2Ps4siaewd9p4vslJINxUQD1euPFJxosJ2//undB+eSbGSrVNG1IVz1LzaWb1QKft0ZuN7na9FJREpwTprjpi4U2yQPGA0tjSvyHwjUqXO05QiFzTrfqlcUMX3rUt5GtK5ad8qpUzQTU/7Rx5Wga4hfyS8o7zUA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0320.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 01:45:59 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 01:45:58 +0000
Message-ID: <MA0P287MB282209542C6D70839466B733FE862@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 Aug 2024 09:45:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] riscv: dts: sophgo: Add SARADC description for
 Sophgo CV18XX
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
 <20240812-sg2002-adc-v4-3-599bdb67592f@bootlin.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240812-sg2002-adc-v4-3-599bdb67592f@bootlin.com>
X-TMN: [gJT4VGyvkTv+P8e0GBmTkhc70VVrVgZF]
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <d73fd0d3-f484-4124-9136-581fb68c4c52@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0320:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ec3dd9-9ed4-47b1-f354-08dcbb39adb2
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799003|5072599009|8060799006|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: UAubTVQ4rRVYBb+TAKUq5Co/jOxYLPPjLiUfvaOuoH7e94Ov0E/sBQ33Vg5pVQ8qO9NTzERYOFbk+Lrj7NST8VjtMb1vw1LdsbZWmNoZtgtOlGFAnjnhBlzWnkIkvnaOA+Gyp4qrfzC5emle0SU3LThXmGUJJ+sjDYzkSZKzMqF19DwbfChOTz+l8qtIrZfJm3ofSo9TTWEgFaC+XnNakZz74kNdJGUvuKGMx1raoRs+6lfJgQlwKVbAeYHkmA1SWiJDfN2TBZLS4L0vMpIRlj8IctzGLxTlOMBWUOvFi/5D6RhPrRIpNFdUEzr2erNKvCUoJk+9n3Lx9dkdj5pwjmvfmiy2KqRHWy0pqtgEueY+b1qiM2qUGlLdRqvmmawE0uLZpxM6QgQWYczf3Q8PT93TGWXOGElAB8NGKyAmUre7FPy/TP5GXifTvAUp93kJ4ElvBOnAknforDyKFG8W3/HZZHtIyX2lyqMn6LB9L9nx0UQxXtM9loFfn63lt8ME/m63QGMV/ssJ5yq0kKiDIHxdM14RXnMRSSpnlCTwY5tiRDSPrx+Pnydo+OZ2q4UmWiEJZtuExIubgPcNHL2MKvrRF9WECU3n7AmsDn0hln21jM2ifPPM1emOEk+xqcAEvR1pNPfTPj9zfVlRedfjYSefSXwZupAdFao4LmAIpi5HjFGA6sk9HJNr6vEkNJnJTuPvfX+7F/SKtChaLyy6kQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVyeWIzY0VCN1lvbzhta1RvU2Q3dGI2czJpb0tUclNoUExCaXBLZkc5L0Ju?=
 =?utf-8?B?YUxmNDlScWx4MnV6Ymc1b1YrSFJ5Wm1ZMkFUcUt5WFVQRml4ZjJOOUhMQis0?=
 =?utf-8?B?Vk42aTJmVlN3NW5WSytwSkNnZjNFYzN3aWlUWDBMTTE4bkZOaEJzdVlUd01Z?=
 =?utf-8?B?VUVhL3lNU3dpZnZCWmJ0ZE1lRyt3K0tFMkliTlFRTTlXbXVzSXo3UWVtOUgr?=
 =?utf-8?B?VlNVQzhSUDJrbjRJYlFQMFB6YmdaU3FLNlhFenZUcEdsckVlQzY4VDlON0Zr?=
 =?utf-8?B?MzZKMnNRZTEra0lueW00Ky9VUVlaS094ejNhVmg4QTNvcmJYK2hZUzFMT1Nq?=
 =?utf-8?B?NGVYQVI4VStsakgvdG4vcUkxRXM4OGUxWTdTelM1UG91ZENIcWRVSnpJbjM3?=
 =?utf-8?B?dU1LTTJhNnlYM3hiWWVBc1dZVFZUK3JuT1ZTMk9rOTlSMnpyUjIvOHlZaXAy?=
 =?utf-8?B?S1M0cFNPVXhNSFRVL1EweGxHZGpvOFhuN1d6eWxFVXdPb1JRUDZlQXViOFNF?=
 =?utf-8?B?TFJNaU5qdGd2ZnNWa1VkVUswS21ubC92NzdTSEpmeWV2R3NSVkdXNnVwYWgr?=
 =?utf-8?B?NXpGdERUaWFaUS9rdXNxYlRFbDZLTmRhZnYzaXFiRVlhd0tSMGxvNDdQelc5?=
 =?utf-8?B?U1NTSlNlMEdZOFVtanBBRGtEWXdOaWh1SGtWdjEvWTJ4SEdrdXVsVXE2VUZP?=
 =?utf-8?B?bkhxcjQzOTVsREVOMjNjMWV0VkoyeEFoSU9KN2ZGaU9DU1JheklycGlzdWJn?=
 =?utf-8?B?MENRWEU3aTd6ZE15am5XczFtVVQ0Tm5ZN0Q2WS9BQUpVbXkwUHg4b3pMZXda?=
 =?utf-8?B?dFFBbW9wOWlodkYyRGx3UUJtZlorZGlWWEZmbnhUTGxqaGtFYTM2Qmk2dnhG?=
 =?utf-8?B?NEx1RTZOZzVjV3I3UTRLR3lXdHp5QW1naXJETkwvQVFURVhCMW9FcVFWOHFi?=
 =?utf-8?B?aDVxQUI2TmVSd0g0U1hKa1N4SlNudjRjYWpsMStzaDJPR0VQN1ZDTXN2UHlp?=
 =?utf-8?B?bjhiVTVnQlMvOEtmNVQ0ejRsaUZ2TDd2aWJGRVVFdkk2LzB0ZkpTd2F5d0lu?=
 =?utf-8?B?Zzh2Q0ZJLzNITEk2YUpLZlB5VkloYzJhMHg5U3A4NXZYVGZhNkhkSXJPcm5n?=
 =?utf-8?B?VU9odzZmclloa3l1Y2xualc1ekU2b3FYU3RoUkt3OWZ5VDZKNlpxS1Exby8w?=
 =?utf-8?B?ZEpzRy9FUlkyMHJTaUtINWtBL1p4MGN6c0ljSXZLWkhzRUtzUk14cG9HRFlE?=
 =?utf-8?B?M084dU54NUVsZWpNbnhDOGV4aXNTSVd3ZWR5SmlLZTJjUEV0Ynd4a1pqWXJ1?=
 =?utf-8?B?VTdMeXZUeVlBdWNUaEhGN1JhRkM3b1R4emNiamJyVmhsMHBxSmJxdGRiL1Rk?=
 =?utf-8?B?d3N5RmV2aTB6Uk5OWWRPdU81SDYvOTZQeXJNUzR0T21UbnBwUHU1R0lHSVMx?=
 =?utf-8?B?aEdYQ1RhUXF1V2svQkZYS1BiUllMY2txbWRPaTJXUEpJWFBVdWNxdlNZeFU1?=
 =?utf-8?B?U2U4ZWtURUZnaVYya1lSVzIxWU9rTENWVVltSVc0azFUL3J2bUdmMHV6RGZv?=
 =?utf-8?B?b1hyckNvcGpndWErUnpNWmo3R3F3MHN0ZkUyZnhrOWY0M3BhdVpnTVdpSTMv?=
 =?utf-8?B?WjZ1cDRtSFJnWUhqL1Y5VFBLZGUvVEFtNTZhYkRXelluZU1NYURWVXFjTmNm?=
 =?utf-8?Q?f7W36wLMVe3/cftRvMI9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ec3dd9-9ed4-47b1-f354-08dcbb39adb2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 01:45:58.3261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_184631_049022_DB1CD1FB 
X-CRM114-Status: GOOD (  13.01  )
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


On 2024/8/12 23:00, Thomas Bonnefille wrote:
> Adds SARADC nodes for the common Successive Approximation Analog to
> Digital Converter used in Sophgo CV18xx series SoC.
> This patch adds two nodes for the two controllers the board, one in
> the Active domain and the other in the No-Die domain.
Where is the node for the No-die domain?
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 891932ae470f..71a2618852fa 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -133,6 +133,26 @@ portd: gpio-controller@0 {
>   			};
>   		};
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
> +			channel@1 {
> +				reg = <1>;
> +			};
> +			channel@2 {
> +				reg = <2>;
> +			};
> +		};
> +
>   		i2c0: i2c@4000000 {
>   			compatible = "snps,designware-i2c";
>   			reg = <0x04000000 0x10000>;
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
