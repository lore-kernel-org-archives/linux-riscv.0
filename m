Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC0CD4F5B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 06:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SmQ/XCqdvBXRiyS0ZQ03vvUCWep7ncqXhehs8jBx0Q=; b=VTRVCDukFURHvT
	Z4eeYVina5Y+45f7zYURbC2JvCRCvmkbwCpWN7vasVBvJBFfDa+hTM+XTh5pjXCyyIvHwPq3YToZT
	Iw4kJrdOKqbzoqqVYWiovJ2yRTlrEhbarii9tOyPuwp20FlJmsWIRbhwe4CtrxCxU3OaiWg+xGYXb
	tILRQqSjUIQjUJIFW/7ix0nuA19w9EHrNKuq21HPAYxzbBi1zNq/zSiu7xo/PS4ykRkjAbvT2jWU0
	dufFd+aCGh+mfGw2nB6ypw+LT7YGRG8tx2BkrQdZF6W+7t7YT6vka6WkOm3Dtb54PRbEU1gMNQNGP
	6zaY0vR50nCECnrdTL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJfh-0000000A0Kw-2f0w;
	Fri, 22 May 2026 06:47:49 +0000
Received: from mail-bjschn02on20714.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::714] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJfc-0000000A0Jo-1w38
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 06:47:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfd3OeZe2ICuuFuX4Di4WxO6PLx5lChqe4drEYEhQfwk86Wv4RfohkHuDEzJyLcINl6huxBWIzv8nhzJT/jaRh1oVr+dU/YdAr2X8abIYdZHv6mwCUGzarQ86n5P5zRa1rez7egEBPmwBYXtFWpE6Mpha+E98XzmJiUYxk0u8Q3GCw/RO1wTybfOcK4pLivwscajcpaXfmiskjEbUvEE0Mz43aFZOYNRWDaDUkIUiMx5gTCNmJw3ddhb8zzy2j1VoFnpqXDdSHJ2oj4J3ozajuuaMtu04MS9xAmZoVLgWl/S/KroCOYTnk/jKzPNT89sZy7RwFrmdDWp8tgNkcimxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rzg8TpAHWg7cIZ9qyH3c3x4sHXgrNC+3tiN9KFNW6k=;
 b=g38fqaBqIilEoSqPWxhRcS6ithYGKTXJcI3eseENringF3RYHI8c4z9Z/AMgSpblyJDnM13rWPJshMNn5Ol1Xrmr33Heo2n6Wh88BYZikhbjKCyqiXh12TtX5kc9geT//etBobp8AAYDcdVQQg37pfjRE/jPC75V/9ZNA+sCFUs4RI7xuq2ceW1VWWsvVrJhvSIh2Ysnd4hELyfjgxhk1PSxQdX7rohuy7UlVK0TSEcflHJlGPqtIz5mPSIp4S0/qNXBhoRXq5gFtASvAP/Sn2s3Rr5vIrssB4HybI1zQJ/BLjxG0TxvX2HH+jtBBH1In9e71GLJTYa5VpSLPl7L/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1340.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 06:47:30 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%4])
 with mapi id 15.21.0048.016; Fri, 22 May 2026 06:47:30 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v18 2/3] riscv: dts: starfive: Correct pwm nodes
Thread-Topic: [PATCH v18 2/3] riscv: dts: starfive: Correct pwm nodes
Thread-Index: AQHc5C5T9NgT6hO6HEiFtrligTX8arYPD9IAgAqViHA=
Date: Fri, 22 May 2026 06:47:30 +0000
Message-ID: <ZQ2PR01MB1307EC9C21268E1030AA168EE60F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260515054723.25024-1-hal.feng@starfivetech.com>
 <20260515054723.25024-3-hal.feng@starfivetech.com>
 <20260515-dandruff-outpour-7b3b6b5480db@spud>
In-Reply-To: <20260515-dandruff-outpour-7b3b6b5480db@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1340:EE_
x-ms-office365-filtering-correlation-id: ea7b53f8-51d1-48d6-367f-08deb7cdfecf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|56012099003|18002099003|4143699003|3023799007;
x-microsoft-antispam-message-info: 5JkXtA4diRyTbZ7ZbozQV6EJaWHdlob9krJBmPw8lc76qxO5AsjQyC0itxV/BeAKr+22xD64nkTTF0aNUYdFwjgpeXb548J5zRpM7QI9g23sHz4Cz04ob/QH07VgD9RBPHMrTZm0jJus7+PtKJAKq1gDXu8CGWuTqQT6mD1mcYWJNKM6p5wjFT2Z1E8uLWycG/iBXq8kbSu1vbo7qcz/f7n/vyt2dWDpvYp/e67ImO90YzPJu5U0WXIUmBoeJ6N5eCVI+JKJteyE/zpMAHhVPEnD26GZ3nP/mI2xCL4EcxMynHxXHYBU0SIqvMKr8zXupk49tBX8La2DwGR2C3pnAeqXTO6qklMO0cBfC77vtmC1qHTUekOi99wwujH9D+4Ul/7S+y0K4SsqeaRArzoFvw7HJ8HYyO0tR4h95ZT+KsQBt1pJBePa9ZXBKP/sE+po4KZxz754Bk7Zetr7Fdh2bm90QVf/bzpE6n/O9l3HkCTLK53LQhS8tirgvTdcVB8uNb2zCYeNTSmJ0NOH/08W0JqcO/r3OJlZGJNIEpBgm2DLuo5adfrPIJ/Qw9yAClp1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003)(4143699003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVVYcURzLzlEdjV4VEErU1BKbGszeHFtMGMvRkJDTTVyOTllN0RML2dVc0Nx?=
 =?utf-8?B?dlVjb3lSNVcrcTluam9EUlF1T2FEVGs4NDhBOW0xMmt0NjdHK0phc25Qb0tY?=
 =?utf-8?B?VGlENERiTGFuNitKbExEdTJlMFh2NEVYcHF0QTJwNEY5MFNxWEJEb0owY2lq?=
 =?utf-8?B?dHgzVHQzbDNtbGNoSlhLaldBbStiMDFmQ0ZqN1A0Qkc0MmFhWHZpV1hHVVBP?=
 =?utf-8?B?bDdrYmcvczBRUjloUW94UDB5ZkdjZkIvNUtBcnhXOENFZVk1NGR2SWx5VGRo?=
 =?utf-8?B?anhiaExib1BqSkdZcmlBdFMwQmNhbGJQcGY1ZFZmM0psNTFSOWhhKzJuUWNi?=
 =?utf-8?B?WUdwZ2pKTmV4czU3am40VU4zUWdnS0IwYmc1ZTRvNzlVdStZLzJlSVhCNW9m?=
 =?utf-8?B?dmlUejNzaVpWa0xaODB3MEVoYUVtdjZWRmxGWHYxemJoMWJOV2lweU1VQVha?=
 =?utf-8?B?S0xoUWp5T3pXeG45S0pXV2s2L0Y0YU5mejBLQk9zNGlPTU4vU0xrSU81MTd3?=
 =?utf-8?B?Qmt4MmVTdnQ2Q3p2bjlleXlHVHllbVNyT1RtSjF5WkZHaEdYTGJCcFRqVDVR?=
 =?utf-8?B?aG1EM1Jndi9peS9wNzYzNlhOcGpJL1ZKZ0NnS3AxTkhtYVlMUVJvMzdvdXlr?=
 =?utf-8?B?aCtSK1RiYTIxNitpUDk3MmRvTVYwYmNyZWkvc2ozUWQ1Zy9iRHVZWjB6cUNj?=
 =?utf-8?B?YWMyK2dWUjlvNHgxT3BUS2JwNzNqeFR3Ni9ZYmE0cnpyOUU1UUw5VEM4ZTJL?=
 =?utf-8?B?MnlKY0pJMTlxaG1xOEpESmx6Y1F6YkViT0tvWE43VmwvUDgrempaQ1hvbU1k?=
 =?utf-8?B?Z00yZDBWc2FORnNoTHJldkFnY2tjR09yUVlTTE9uNkpEbzRrdmF0UmhmaWw0?=
 =?utf-8?B?blNjTkVrN2t1K1ZNS3NjdmhoRFQzWW9oZ2FMTTdFamlBR0pJQ09kQjBIL0ZX?=
 =?utf-8?B?by9vbVlzT3dlZTRTeFQ5aEFjZUtvaWlhcnlyTG92NmhDejJIMUhLL2poQ0d0?=
 =?utf-8?B?NGhIek9BRnFRclhWVjdzUmF6SlRKeWJWVXYzM1QxQU5KcitJNTFOMXRTQTl5?=
 =?utf-8?B?Q3B2MTg4QWNqTzBheTZkL2kzZUtETTNJUHhtejdMaWllUjcvaW8rMW9veGRx?=
 =?utf-8?B?dFBXWlFnWEw4bkhaWGNtdlNlZVE4NmVnSWIzOUJTcVNkL0FGTTZ3eitRTXkx?=
 =?utf-8?B?OVllS3pJckdnMnlSajhiV2QyWmRDWmp6RklhZzREWGRnSGNnb0s4aURYWTdE?=
 =?utf-8?B?Yk9BdWhzeFkrZVJSTXNvRTdiZTd2WitxV3pRY2k1eDhxc1NsdThFUG5VRjk1?=
 =?utf-8?B?dEQ0Snk3c216VElhcXR1Qkc4MlpYRXJuRGg1MG9qbWlHc2MzR1NHSFZkeVZt?=
 =?utf-8?B?L1Y3U0tiV2xYN05BdFFkNE50ZC96NW0rTTc4aFNQakJQQkZlMnlCbmdnWStj?=
 =?utf-8?B?WitqQlIxc0ZURWdua2hvNmgyWmg1UnNSNk9yNHpLV2ZzYi9RL2lRWVVLOEdi?=
 =?utf-8?B?bk1lY2tjUm5Od1EvWVhyOEhpTFEycW9pYXNhcnFhRHExL2dDeGJwYUNmOFEr?=
 =?utf-8?B?WmlUdEhiU1lRMUdzWlcrWEkxWjJHc2l3Y01RcklyMXV0dVk1SVl3RTZFejU2?=
 =?utf-8?B?bkxUaGZnUTBiVldCMTBLSjlQd3RwbU9veW16VjFxTXhPc3VZMXNpTUI1bEhE?=
 =?utf-8?B?cFlDV2hmbTZodTE1Y21OY3BvT0dsRWtDb0hPWWdjNEZ4bnRnMTVzbnJNSlZS?=
 =?utf-8?B?MmpLaGlEbmtkTGVIM3o5Sy85ei9lTXFyUTgzOHQwTFlCUkZUeFdKZDQwTHVy?=
 =?utf-8?B?cGVCVVdWV3p2V1k1N3I0a2syU0FZMUs4eW5NYkVSajJhZWJZSzhPUm5wOFky?=
 =?utf-8?B?c1JiUW5NQkh6b1grNlZhMnVXSVh2d0pieXp3RTVLZlFHay9DQisxYnlPSU1v?=
 =?utf-8?B?Qk9XWW8xZlRxUnN6Y1d3VG1NRkVVcFcvRzFnSGc3ZmNVbCtlSVl6K1VxNWh4?=
 =?utf-8?B?aUFTMlZzUG1wV3EyL2J2TEc4WjRSNHlVdS96ZkxmODdHLytNVWE0cHRnRGI0?=
 =?utf-8?B?M0hsNDRsdTVBdktmU1ZuaUU4Y21DaDI5aXR1RHgrM05QakQwNW1OaDJPek5W?=
 =?utf-8?B?UlpudExjTUxTN1JrOFFja1BxckM0T2J5Zld0WklDNm5leTNXellZSTE5ekdw?=
 =?utf-8?B?N013ZW01MXdoU0JydzliZG1pblpqVTUvcStPYndmQUZ0K1krVDREZjlkVW9L?=
 =?utf-8?B?QkdpMllQNlQwYjhnaysvdmtpRTR3MGdXT3U2eWREdVVDREExL2RXUGt6NVhi?=
 =?utf-8?B?WFhwT0U4cHlaenJiek5xK1hUWC91Z1hWTDdqeFFHMDIvdkl5Q1A2dz09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7b53f8-51d1-48d6-367f-08deb7cdfecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 06:47:30.3910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDI1gT3eL7smlkR5hon2WWjGBTKB59Gilc7uvX/Oh0i5Z27N401aaUYBdZmNcNPO3TbtyskTE0isVbReLvSjmXgGNAa+Wc1Zv8T1n1AleYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_234744_507679_DE7B0FEF 
X-CRM114-Status: GOOD (  16.96  )
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

> On 26.05.15 21:10, Conor Dooley wrote:
> On Fri, May 15, 2026 at 01:47:21PM +0800, Hal Feng wrote:
> > Each of the StarFive JH7100/JH7110 SoCs has 8 OpenCores PTC IP cores.
> > One OpenCores PTC IP core can output one PWM channel.
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jh7100-common.dtsi      | 28 ++++++--
> >  arch/riscv/boot/dts/starfive/jh7100.dtsi      | 69 ++++++++++++++++++-
> >  .../boot/dts/starfive/jh7110-common.dtsi      | 27 ++++++--
> >  .../boot/dts/starfive/jh7110-milkv-mars.dts   |  6 +-
> >  .../dts/starfive/jh7110-milkv-marscm.dtsi     |  6 +-
> >  .../dts/starfive/jh7110-pine64-star64.dts     |  6 +-
> >  .../jh7110-starfive-visionfive-2-lite.dtsi    |  6 +-
> >  .../jh7110-starfive-visionfive-2.dtsi         |  6 +-
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 69 ++++++++++++++++++-
> >  9 files changed, 200 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > index ae1a6aeb0aea..85106545090e 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > @@ -199,13 +199,23 @@ GPO_I2C2_PAD_SDA_OEN,
> >  		};
> >  	};
> >
> > -	pwm_pins: pwm-0 {
> > -		pwm-pins {
> > +	pwm0_pins: pwm0-0 {
> > +		pwm0-pins {
> >  			pinmux = <GPIOMUX(7,
> >  				  GPO_PWM_PAD_OUT_BIT0,
> >  				  GPO_PWM_PAD_OE_N_BIT0,
> > -				  GPI_NONE)>,
> > -				 <GPIOMUX(5,
> > +				  GPI_NONE)>;
> > +			bias-disable;
> > +			drive-strength = <35>;
> > +			input-disable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +	};
> > +
> > +	pwm1_pins: pwm1-0 {
> > +		pwm1-pins {
> > +			pinmux =  <GPIOMUX(5,
> >  				  GPO_PWM_PAD_OUT_BIT1,
> >  				  GPO_PWM_PAD_OE_N_BIT1,
> >  				  GPI_NONE)>;
> > @@ -359,9 +369,15 @@ &osc_aud {
> >  	clock-frequency = <27000000>;
> >  };
> >
> > -&pwm {
> > +&pwm0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pwm0_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&pwm1 {
> >  	pinctrl-names = "default";
> > -	pinctrl-0 = <&pwm_pins>;
> > +	pinctrl-0 = <&pwm1_pins>;
> >  	status = "okay";
> >  };
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > index 7de0732b8eab..4629e9747307 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > @@ -360,9 +360,72 @@ watchdog@12480000 {
> >  				 <&rstgen JH7100_RSTN_WDT>;
> >  		};
> >
> > -		pwm: pwm@12490000 {
> > -			compatible = "starfive,jh7100-pwm", "opencores,pwm-v1";
> > -			reg = <0x0 0x12490000 0x0 0x10000>;
> > +		pwm0: pwm@12490000 {
> > +			compatible = "opencores,pwm-v1";
> > +			reg = <0x0 0x12490000 0x0 0x10>;
> 
> NAK on the compatibles front, but this also looks very suspect, given the size of
> the register regions, but I think it is actually correct.
> You need to explain why it is correct in the commit message.

OK. Will keep the old compatibles and explain the change of register size in
the commit message.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
