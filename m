Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C63C02192
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 08:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkFjN9kvZh5ncMJpJyoDbi64UeCIvR0m9m5CLY3xL9M=; b=j3Et6IbIv3N1y1
	cL+IoVgoM/MG0/5xjXdJmzlOX2iHZEh+P0nnY1DXY/uRNK4jN4bwMBBvnwXSk899KcSMMWRiUsLJ3
	g69nDXm+PH/ZoNgJeQqiXq5O+uYEwv4ZArfnAnqb73pVjMqmu0UPBAZLqlcN7xNGL+vfYPMpP/4cj
	S2b5cCfSi+Yx51enBEnKhV52Vje2XiFtvzEHft0lM0c/2ixRsC5KGL7ou9eou83I7lZeGawig8//0
	3Jhcp3RWvYgaHvgu4BMcvdoH1o4RjvjPuEKlfZSB6fDJ0j0VPaYWZjyM3qaFnccvMqLCXGAcnYtcL
	Q897phiDjRnOkdUfGjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJYI-00000008mjQ-2Rxb;
	Fri, 07 Feb 2025 08:17:30 +0000
Received: from [2406:e500:4440:2::71a] (helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJYE-00000008mif-2cWc
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 08:17:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFjECRSvNyJQ3D27aPVL1f+Ntiry1r085/SvZHewQ5qE1sRvTOO6P6Iz8IygeHQRQqpCLsprv7gbjrWZv7F6+CQnjmV/OYYb1Qeoi3i2F/ZVoVPZ7dqVJk6XwY7nbWbw4ZIreKLvB7kAC/LVn7WpJBDCi8Yrw3cHzk9VReHjjefRQzvCwL1E4EEAeb8iMqgVNNHTlWue/XqQn2RPuQFhrN0oH2vQRVlg/4zmlK0N+WaOBmAtVg/DVOIY/arJTNzakoVpZg+HfQcnE6gzTMBVoIAAP/3H/Njrq4B7WxEQAYq66A/HusITJ1me7pKbrBQIrIMsDQ4CsB8FYbdfh8tm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0rM/AS4+qv8czsYdxrIZ0r246fz0tK7/tfEuW7ZELU=;
 b=dQ66oDOX7Ykm92QI68YHl66sB3+NcKS4rH516QhRrcY4mJF8OIpsMnUAiZhmQsUfPf57sWCtuTDp5kPJjzH7VFjo76p6cEInCoagiA5IAjhYGOaH5E/WNmmo8y8seIScNx5yblr0CrOb176rnkpQ7YvjuGQhk2qFyA+LLSbUqEQDRPQCa5DmLiL08f3n1Ggw7S1EMGzpQxzy8HV5yA8RU+2U+UQt/XxlpnblqUGfHuvElvgG2XHoSft0pAHAHJMO88BP8DzHZfevBjsZKOGBCVOfaqVp2P0mHKPbfPRaNrYcRUvUAth6UnxeyP25eMUs8v1xsFJXA59jxJ99ad++MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1209.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.14; Fri, 7 Feb
 2025 08:17:04 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%3]) with mapi id 15.20.8398.013; Fri, 7 Feb 2025
 08:17:04 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Minda Chen <minda.chen@starfivetech.com>
Subject: RE: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Thread-Topic: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Thread-Index: AQHbXuxdxuZNa36t4UObgTOkoTzN5bMKL5KAgA0EEvCAAHAkgIAOOMkAgBRM5SA=
Date: Fri, 7 Feb 2025 08:17:04 +0000
Message-ID: <ZQ2PR01MB130736F5C893337606FD6937E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
 <20250104-mutilated-unpaved-008eebdb200a@spud>
 <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
 <20250106-suggest-waltz-47d7f7760069@spud>
 <ZQ2PR01MB1307A9E106AE06E144875D6EE619A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20250115-bunkmate-reluctant-a9bad52d8a04@spud>
 <9d4783b1-3dfe-482c-a963-ccc66c9b0f1a@freeshell.de>
In-Reply-To: <9d4783b1-3dfe-482c-a963-ccc66c9b0f1a@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1209:EE_
x-ms-office365-filtering-correlation-id: 343cd4b9-2f68-4dc4-e6db-08dd474fce19
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|41320700013|7416014|38070700018;
x-microsoft-antispam-message-info: peWXKXwBGnn2kBm5lTjvUSvbsfEBQNMl6iPA1UId4nEYEUtIKAPvb+pQBNIn2MoUw6r/UBwgvjSEb7rzm5y4CjITX6uQkAFVlIgDdMENkATYfhqBC6v1xkJ44oikmMa+D2XDEaBEVAaUO3Utvvn6YE+GqqSwGD4xUfdBD0VobenL6I4siHwz33swByOZLxORY9EJo2wZtqz/re+zDpMfUWKyrQ2qzW9lyvm+VXdWGoQ8txjEbCF06dUI6G/CLSfsXHyg7LgLATPkRXcPjk86O47pV5e0QJbnKGJxK9SAMnL4fvOUmoPzwN74NTc+/LC09IzUGHuKYrVXSH6QjY0EIfc+1OjyRlcsMk2TMD2eVLVeHHgv4tLm3P/uLNLuV2kkujdiTYIBaDPfCg/gRwp/oWRRy4kkcFYuWnKLvB9s/ybI0FO4NOiWfFYciw8VCgef00NyzHTvbVIjAuWNME6JfdJaroD4uEF96frOAYUJa73owX3VML9NTo8rtIwp+MdKP3ml9+8kapBweM0D/vbf/J13ST64xiQjk6M6gEkYQ1GOPhtsF30ht1CiSEc+kN59W223eoh9ikH0m6FcwxwbHyqY7mLcQ6MvVCQr6AfDCSQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk9MUzlicmxpc1FSUTZ2MnhSMmROSlhlOTBzc3ZEbUl6RmNRNVZCWXRMNjNB?=
 =?utf-8?B?NHpkVWlnSGdYR2I1RHJZV2h4Skp6a1prM2tsUGFrOHg4QncwM1poZDJ2L3dO?=
 =?utf-8?B?N0RxTFg4V1hDeE5wZnJPdTRJZGJXRDRaa2M2eHVGOW5haFBXVzdMcDNmcjhx?=
 =?utf-8?B?UXJpbnowRDJUejFhdEw2Q1h5S2JSdlFJM2lvR1p5Vkh6RTF3MFVsdnNSaXpX?=
 =?utf-8?B?M0E0ZXpoSzB6bjVGWlEyODZ6VE44Rmd0UmVISXMyL3lvMVNZZ2RySjhhUXBn?=
 =?utf-8?B?eUFJcGZEVmxzaUt3aHVDMjBEQ3c0L0IyQURQa3Q0eitGU1lpZHlNS0lya1hz?=
 =?utf-8?B?TnJwcVZFd2Z3YUtpOC9ndjUrUEdHZ2l6U3Y3c0dCTURSaW8wRWN2aVViVyt1?=
 =?utf-8?B?eVZuakZqaDRIUGNJdm5EdzBkRTNPeThaUTZxYTBFQVhzZEJyM05za3JTTEx5?=
 =?utf-8?B?eHpTaUYxME4xb2pXcEM4UGVhMlRNU1l2VjVjMENmbkNjeUxYRUx0ZENjQVFX?=
 =?utf-8?B?T29DTFBzVFArNkp5THpGYjlFYTlHVTg2UTFLY0l4T09hUHRLcTFzazBFZThI?=
 =?utf-8?B?cFZMQTVUeGhLbUtOUDlPcCtzVFZOSGJERHh4SlJUR3Fhb0JIRjFBMGRuUmRm?=
 =?utf-8?B?dGZlYmRWcCtuL3Q0OU1RSVFVbG9kNFEvRXpUK1k0elc2MVY0ZHN0SWpzaDVn?=
 =?utf-8?B?TXZVcExVN2xiaDFabkxmT2JmQVpINXkrNDJTS0dSdTAvL2NXcHBra2RVQyt6?=
 =?utf-8?B?bDZlYzdQMVB4ZG5wN3BhenJYc244SGF0RzY3Z3pvTHNKWW9xRE00dlhBZk5i?=
 =?utf-8?B?aHRSK0FjdENIRFM4YjYzWFJXMm9ySEVvaEZHZ1UxQUlxMmx5RTEyaGFocE1D?=
 =?utf-8?B?dktuZVNVN0Q4MjdPZ0lpVVQveng0MWhrenNRdFVnUnU4OEJ0YnhlVklLZGdk?=
 =?utf-8?B?QzZaeHl5eTN4U0J5Wm9zU1FZUXkrVVpVUXJqd0h4ZXJNWGVTdnpFREJkQlcw?=
 =?utf-8?B?N0lLQS9zSXBhek95ZHhCUURLNHVVSVBJM2JodU0vV2dEdjgzblkzR2lzeDQ4?=
 =?utf-8?B?b3pNNkFPdndydVZDVnNib3JIYTBVbFRrWlpBYW1BOUsraVNsZENnNDRrTkpE?=
 =?utf-8?B?a0s5NmJXc2ZNZUJGbkQrcmxNb1BURUVkTWxVYS9VZUE4cmxZN1hpMFFVN3NI?=
 =?utf-8?B?eDlzQS9TWFFxTnY1cTJXNUhkUDM1SmR5d3lJemV4VCtwblpGbXNaME91ZW5r?=
 =?utf-8?B?d2FrWFBVd1JqdzFqRnFwSVIxd0pnVDVkN0tBSkF6QkJienRDUHkwK0xLREd5?=
 =?utf-8?B?d3l0Z2FHS3pIVHVpM3NDajgwNUY1WFpnd2x1ZkxBQm4yVVF1dElqUzY3S2N4?=
 =?utf-8?B?dHhvdE9HcGJFZWZOeXA0Ukhra2lUaXFMOU01MVRLU284WTdHVUppRThCWkFo?=
 =?utf-8?B?ZFlTbllteEIvLzk4cVZzeVpuN2pEbE9wWTRVYnNzWlNpU1VBM2NLeXI3cnFJ?=
 =?utf-8?B?QWpHNVdBcmdrWGpYSG1XNHJRZkF2RGxaTFRYeUZCYnI3UjVlbitlSGk0K21E?=
 =?utf-8?B?UHFSSkhSNlE2WXRzRzJNYnNXcUsxaC9XNGt0bmJhWCs4TEJTd1YrTWFCM2hs?=
 =?utf-8?B?T1VLZWM3WEVYWXZxNnFVUStYNHN2a2c4Q0JqaDJWWnJ1SW5mK09oVStPSnhi?=
 =?utf-8?B?WGMrYnczV3UvUFc5NllNeWhLVjJ2MzU3R3pTQjB2dTM2UWdNOTlla2VETVNW?=
 =?utf-8?B?dXUwN3piVng3WGpHRzR5bDNoaXdPYXZDaUxIQmoyMFAxeHNKUHdWb01KQmZp?=
 =?utf-8?B?bHVFMzNQTGhTclBsLzRsd3NacGp3ZVdYSGVZZGw2U0xTZzFhQ1lzZWp5Zyti?=
 =?utf-8?B?VHhQNGdPb1FoUDRSaEw1N1Fwb3owR2hXVjNsbFdRTzE2R0hOSGUyTnN0TlZY?=
 =?utf-8?B?WjZaeXp4WklLaHJEM3oySWFoT0IwTDU2cFRVVlQ4MG04U3NuWEdoa0NZclBx?=
 =?utf-8?B?RTF1cFVRSjZtcHFsUzY1enJ4Z2ZKVHFrNUlkOEZmeDhSYWsyMlZodVVKZ1R5?=
 =?utf-8?B?QVZLaml1QkNvVlVGb0pvanRjaXZ4SUYxcEN5QnhZMHZodVcrNHNIcjEwUEQw?=
 =?utf-8?Q?vtSQ2zXeR9dcOvoDvaDVTkhsR?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 343cd4b9-2f68-4dc4-e6db-08dd474fce19
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 08:17:04.1871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bNxvtWK5OdeM5ZsbmzD3Al9Zj/Cf0D5ohXTrX+/Rs1FkjvtPz6GaAGvV8ecjamaJ5QMgx/eveiuHGP9bOKfjD5fGo4nFRYXFFzxjOOnoJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_001726_820675_9E6B2537 
X-CRM114-Status: GOOD (  40.26  )
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

> On 24.01.25 18:46, E Shattow wrote:
> On 1/15/25 01:35, Conor Dooley wrote:
> > On Wed, Jan 15, 2025 at 06:33:08AM +0000, Hal Feng wrote:
> >>> On 07.01.25 04:08, Conor Dooley wrote:
> >>> On Sat, Jan 04, 2025 at 01:04:30PM -0800, E Shattow wrote:
> >>>> Hi, Conor  (added CC: Minda Chen, Hal Feng)
> >>>>
> >>>> On 1/4/25 10:33, Conor Dooley wrote:
> >>>>> On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
> >>>>>> Replace syscrg assignments of clocks, clock parents, and rates,
> >>>>>> for compatibility with downstream boot loader SPL secondary
> >>>>>> program loader.
> >>>>>>
> >>>>>> Signed-off-by: E Shattow <e@freeshell.de>
> >>>>>> ---
> >>>>>>    arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++--
> -
> >>>>>>    1 file changed, 9 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>>>> index 48fb5091b817..55c6743100a7 100644
> >>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>>>> @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
> >>>>>>    };
> >>>>>>    &syscrg {
> >>>>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> >>>>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> >>>>>> -	assigned-clock-rates = <500000000>, <1500000000>;
> >>>>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> >>>>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> >>>>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> >>>>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> >>>>>> +	assigned-clock-parents = <&pllclk
> JH7110_PLLCLK_PLL0_OUT>,
> >>>>>> +				 <&pllclk
> JH7110_PLLCLK_PLL2_OUT>,
> >>>>>> +				 <&pllclk
> JH7110_PLLCLK_PLL2_OUT>,
> >>>>>> +				 <&syscrg
> JH7110_SYSCLK_QSPI_REF_SRC>;
> >>>>>> +	assigned-clock-rates = <0>, <0>, <0>, <0>;
> >>>>>
> >>>>> Why is assigned rates here 0s, rather than the property just removed?
> >>>>>
> >>>>>>    };
> >>>>>>    &sysgpio {
> >>>>>> --
> >>>>>> 2.45.2
> >>>>>>
> >>>>
> >>>> Assigned rates all zeroes is how it is in U-Boot. Removing the
> >>>> assigned-clock-rates property as suggested does work in U-Boot and
> >>>> Linux both.
> >>>>
> >>>> For context, U-Boot fails when replacing assigned-clocks to
> >>>> JH7110_SYSCLK_CPU_CORE (500MHz) and JH7110_PLLCLK_PLL0_OUT
> >>> (1500MHz)
> >>>> from Linux. So I tried to merge all properties together and in
> >>>> testing then U-Boot failed (or I did it wrong). However replacing
> >>>> the Linux properties with the U-Boot configuration (above) on Linux
> >>>> does work for
> >>> both.
> >>>>
> >>>> I do not know if this is correct but I can test any suggestions and
> >>>> report if they are working.
> >>>>
> >>>> Do these changes make sense? Are there other variations I should test?
> >>>
> >>> I'd like the commit message to at least explain why these clocks
> >>> need to be set to zero (I assume that means disabled?). Maybe the
> >>> StarFive folks know why it is required?
> >>
> >> Here "assigned-clock-rates = <0>, ..." means skipping setting clock rates.
> >> You can refer to
> >> https://github.com/devicetree-org/dt-
> schema/blob/main/dtschema/schema
> >> s/clock/clock.yaml/
> >
> > If you check the wording there, it says:
> >    To skip setting parent or rate of a clock its corresponding entry should be
> >    set to 0, or can be omitted if it is not followed by any non-zero entry.
> > Since all clocks are being set to 0 above, we should be in the "can be
> > omitted" case for the entire property, no? That would...
> >
> >> Linux here setting JH7110_SYSCLK_CPU_CORE to 500MHz and
> >> JH7110_PLLCLK_PLL0_OUT to 1500MHz are for increasing the CPU
> frequency to 1500MHz.
> >>
> >> VF2 u-boot is still running at 1000MHz now. You failed to set
> >> JH7110_PLLCLK_PLL0_OUT to 1500MHz, because CPU power supply
> voltage
> >> needs to be increased before running at 1500MHz.
> 
> Conor / Hal,  how does this work:
> 
> Are these the minimum and maximum values for CPU frequency, CPU CORE
> and
> PLL0 OUT ?
> 
> >>
> >> I think a better choice now is changing Linux device tree as follows:
> >>
> >> &syscrg {
> >> 	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> >> 			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> >> 			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> >> 			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
> >> 			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
> >> 			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> >> 	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> >> 				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >> 				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >> 				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> >> 	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>,
> >> <1500000000>; };
> >
> > ...make this one a reasonable change...
> >
> >> For u-boot, if there is no requirement to run u-boot at 1500MHz, just
> >> keep &syscrg {
> >> 	assigned-clock-rates = <0>, <0>, <0>, <0>; };
> >
> > ...but not this one.
> >
> >> in u-boot device tree. If we need running 1500MHz in u-boot, I will
> >> send a patch to implement it and then &syscrg{...} in u-boot device tree
> can be dropped.
> >>
> >> Best regards,
> >> Hal
> 
> Hal,
> 
> What voltage (and speed) has less heat output?
> 
> I think it must be configured to be *reliable first* as it is pictured being a
> developer board on a person's desk (with no extra accessory - no fans,
> heatsink, etc.) and for example doing work as of a Linux kernel compile with
> using all cores.
> 
> We should not force a configuration that will fail for the common situation.
> What voltage and clock speed is the best for continuous reliable operation of a
> JH7110 CPU with no added heatsink or fan and at ambient temperature?
> 
> Does CPU frequency range need to be given in devicetree? Can instead this be
> done with userspace tool or Linux subsystem at runtime?
> 
> The thermal dissipation of JH7110 CPU will be depend on the board layout and
> physical application. So, my opinion here:  I think any minimum and maximum
> CPU frequency limit that is given by manufacturer recommendation of safe
> continuous operation is okay for dts include. If some part of this frequency
> range is not reliable (from undervolt, or overheat) then it is a "no" from me in
> Linux and in U-Boot. The fact of failing to boot (in U-Boot) because JH7110
> CPU default voltage is not high enough for 1500MHz operation tells me this is
> a wrong idea or there is missing code in U-Boot to select a default sane clock
> speed and voltage.

CPU_FREQ is enabled in Linux, so the CPU frequency and power supply can be adjusted
automatically. JH7110 CPUs frequency can adjusted to 375 / 500 / 750 / 1500 MHz, and
the CPU power supply should be adjusted to 0.8 / 0.8 / 0.8 / 1.04 V respectively.
Please see node opp-table-0 in arch/riscv/boot/dts/starfive/jh7110.dtsi.

Please don't drop clock rate assignments, it will cause CPUs can not run at
375 / 500 / 750 / 1500MHz but 250/333/500/1000MHz. You can modify as I suggested above.

For U-Boot, CPU_FREQ is not enabled and CPUs are running at 1000MHz. CPU power
supply is 0.9V which is the default value. If we need to run U-Boot at 1500MHz, the
CPU power supply should be changed to 1.04V first.

So I suggest

Linux:
&syscrg {
	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
};

U-Boot:
&syscrg {
	assigned-clock-rates = <0>, <0>, <0>, <0>;
};

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
