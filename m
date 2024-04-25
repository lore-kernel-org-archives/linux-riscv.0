Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283EAC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVfZvUIu1W45ro0KVZ4PRySBFU7yXozB6E4gM+eywvg=; b=fr5ecUXHbagI/s
	QruXiaEoMn8owIy0SU3kYIkx3A6XkeCtiVAv1wToDzVpSBGWbV0bmTMTBRFL/Uc70uMInHmzTfFXW
	hIXGuk/WjFB+q1XG6vwnXNnByja/A/kv7b5vAj9324dAX5sinZvsmyyhCNg2hUA0MtZFPbr+0yDjh
	MD2lMY2E28FROoJG6lvF/mm9Sx8jV6+jMHgN8GNjuuvZrFvt3SE17rcvnJ8bxbp+rnowXit1NPhBb
	ZUIpCyxSBDumXnf4P6yatGVIVepfgqtf9npISsYJh0UHP6+9Y6od4PGJTnDGbuMMJ8tQO/7fw3CAB
	RhSAj/yiqsnvDYSJTRRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv5p-00000007Y4N-1Cx5;
	Thu, 25 Apr 2024 09:08:37 +0000
Received: from mail-bjschn02on20722.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::722] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv5m-00000007Y1q-1fcK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 09:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQ0Y77D4Q5b39j+dwwu7fXQsFIm/ak0vL7hQEXBLDrL+6G0CM6eoO/yePzoZNyGFicQ9fwBQXm1aF3LNFvEYyhF0w9Jz2tb4ftPKIdnhMbYBU1QyUPXqL2xZCfEoiZql9sd8pQWSg8tchXdhimGm+KbXAKVjwqcr3Ib1p9AQtb5xFvHNZ0aKobslZ2Q5d1HF1vfTaCCcXDN2n6hbK83kYeG+5jazdVr4nT9TDnIv9CHIZljtSFJqv+oAUPce5tdnMDtmxR9OX8d10Ab4/QKbqIci4Zyi3MBOsa0Fno2w8XmK21RoCPhU2+z2dncB8LFUdXpC7uOxm+59D5GLA3l+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkrlDEOdCdv02uY5YzsN7twTCir4pdnjca+sqQJd08E=;
 b=ddbJ3QevVzxZ7X0kKei+Mp+jW1a02qxFkezg9UHuamikywy0IA+9IIkZmEd3x/lUnSpfdcnUuXZRn/TO0hSq+u7zxZFAjnGWtQ5osAP4bn4e4GsF7KRzYjUA8FnwJ7Dr7GlOdo+fliVKNbniaunjv7WF5NVunj271kttCw8LJ0v/COBswhPDwZ4pgL1f0HcTKRaQNPdRnHdKRJYh2IUV2lW/s5U5DH0plIfQw2ndEVx7Yh+2xxW2oLD+WOoI/zeEtqejYVn/K/I7nIjR0M64bIll04Blt7FFYIJ6HoX54SZSx860M8ZDcIWB7ww5Pq7hKmVwTWgJtQXUOug68opswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Thu, 25 Apr
 2024 09:08:19 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Thu, 25 Apr 2024 09:08:19 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Alexandre Ghiti <alex@ghiti.fr>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Thread-Topic: [PATCH v4 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Thread-Index: AQHaiveiGH+bVC0OIUmk/t+RfIuugLF39x6AgAC7tCA=
Date: Thu, 25 Apr 2024 09:08:19 +0000
Message-ID: <NTZPR01MB0956902DF5CB459302BA263F9F17A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240410033148.213991-1-xingyu.wu@starfivetech.com>
 <41835766-b7d7-4f81-aca7-4a8136ba9971@ghiti.fr>
In-Reply-To: <41835766-b7d7-4f81-aca7-4a8136ba9971@ghiti.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB0985:EE_
x-ms-office365-filtering-correlation-id: 1acda268-120e-419f-8476-08dc65074044
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2x5JhL73xGoJGo4hbMCfo6P1/rDivRFOItKfIvnhF1aMBatzZBwcRHu7tqIrI1pIfp7IYShb+F0oYObsM8OG3j3J+W74J+hk5UDUvZngvk3LNrBi3NE0hLGPHiYd++gOWs30jh75mLJDJIBzPIPfUGc9Ue83JQTS8auGTijxZx1WLR8LWVWxCruvUlidzV2N9JHin+aH2SV/S8ceyF3XkH/Ga6JCYI19bcnbPyY9/a05LN6nYSLVMO8/cZv4DmGLsLK+4wckq28bNSfS6HKicspPyustJWZLmE0pajSDK+JZiN7WhC3HssHizPqIm9tpJOksRdVKajW8uHn4owqqy1C7leyEBgnoK+fOwzriFZR6Vbdb2lW8m3marD97Hqud2NDeJQYKnnKAVXpKsea+4FLQVTcj3vcuKITf3tK4fyrAbGpaDtxKWdIMe3RgTlduGe5u9kIPOJhzHSyRymRvf8lheiMJZI6fMo6EMld5v/SkCZhX1yYmU4oSkLFD1SXsdbiL+RyqHDdQm8bZ9OF2vWfYNUal0UGH43ZBzdFCGK08WH15k4soMHPkA8vPFCXAMmUki2nitpWcNmPg4ceP47GhNwKeeRdZFJi4Hf3e81z0oJEl8jyTh7sFpOGtnN3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(41320700004)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkkra3VaTnFNTjRTNUFhNmRHM0E2eXZmc0VpekVoVEYrMzRnY2l1cXVOT2t6?=
 =?utf-8?B?SFFvVjJqV0RoWlpKU3F2NUw2VnduY2VhRmUxTTlJWVNscWlVNTZoSUZTck5k?=
 =?utf-8?B?QjN2MzZZM2ZSdko0c2MwSlhXMVFYN2hpMVExWk1sMkRVT2JrdmZoRFk4V0Vu?=
 =?utf-8?B?YWxMZENCdFJzQWlVQUlCWjY2OUNSNktIVmFuWGJCclFEUDg1NExIR3NKZzlR?=
 =?utf-8?B?aFZyZXBIWmJLOERkK0tiMjgwSmtnaWFZamtqSGthZ2VybkY1Vlo0cVlkNGhz?=
 =?utf-8?B?cERlZSt4bkIvMUx5ZkJneUlCUVJIeE1oS2F4bTlvbW1UcjF6ZzhJcjBQSmhn?=
 =?utf-8?B?VWN6VnluSDJjNWxrOEtTOFRPUU0yR1lQekk0VGhNSUh4NlRXRXdwc3lKRlZV?=
 =?utf-8?B?NzFhK2NnV0NMUWlrcVhlaU5PZFEwSXpBNVlTYW1LcWpqY2lQNjB3OFpJWEVH?=
 =?utf-8?B?dlZPODgvVTY3QkJtMXBnbko1aDR1MzJ4aXpkM2VmQ0ZBN2ZhdkRCMVZ4OHlI?=
 =?utf-8?B?UnNYcEtyemhvTllyMWt2ckdSanhaNDhUdnpqZjVCTU5LRklLL1dsOUlXN1R1?=
 =?utf-8?B?WmtyUFBkS3FaemMwc1h6ZU9rckUvUjZ5V3lwL0wzdDUrMlhhYXNiOXVNVlVP?=
 =?utf-8?B?QS9BQlYrbDgweGFrb1p6VTh0ak5pczZReVJ4eS9rVm5TZkdQM3ZIN2k5aEZS?=
 =?utf-8?B?c040M1RVVDlCcVZJTnR3dTNncFhsVjZHN1pocDQzV0NPd2FtemNRa21WUm4x?=
 =?utf-8?B?SWhNNHRKaWNnV3liOVZWZ2xWa25UbUs4WDRmb0VBNEUvaHNVdHdzRnNoYUth?=
 =?utf-8?B?TzByU202NTRPcGJuSXVkN3F1OU1SQ2RIYytVYUJVMnJOUDFVUlUwYVhreklU?=
 =?utf-8?B?RzFEa3JIQXMvUjR3bGZRVGp1SWE5dTc2OW10NEFMcFJ2QS9CR1QyeHhXdSsx?=
 =?utf-8?B?eUkzdlh2cTJ0ZmtEa1Bmd29qUEQvT2Q3Q0NpQUFOaGZtT21lMnY3WHZDNEc0?=
 =?utf-8?B?WFVFV0s3Z1VKY3R0ODAzQ2dva1Bqa1RVMndKcXpOcDQvQnV1clNkdWlrMEdG?=
 =?utf-8?B?WU9OZEtIV3ZRNk92aTJoNW4zMkFQR0laN29pNG5UQXdsM090MUJqcGk3WW5q?=
 =?utf-8?B?M0tnbk1zZXFtL3A4MmkydXIvVGdhMldJSm5RalNSbkpJT3hmOFZQTzU0R1BJ?=
 =?utf-8?B?OTU4N3UwYUhyVWFQWnFRYUN3ZlVyMlIyZWpjVG5KV3dwY05SNG55Y1BDQVBa?=
 =?utf-8?B?dittUVpMRG0yc3FwOFBDTzd5eVFwNWZkL0dqSis1cTlKWkd6a0tIOGt1V09Q?=
 =?utf-8?B?aFFRSmx3MHdTeE85UlRhNzEySWp4WHpHYmNzWUNSMHhVUDZ2cXU4YS9ZM1l2?=
 =?utf-8?B?aUhmMURMZlVxZHpyMzRrR1diREowdHoxQjBpVUVsRTdZUEREM1dxc21YZUR2?=
 =?utf-8?B?UFdlSDRKWW9MTytpSlRtc3BHUVJsVitoRWR6eXNkdUk3NFE2M0FpelJiTmMz?=
 =?utf-8?B?T29vZnZmOG9scjVkM0k0ZWFXS0NuQUt2cDNDYzNLc2RYTll0MjV6U1EvV0ps?=
 =?utf-8?B?cEgrOC9UWXd5SVZSajZ1bjdrREpnZkk1R3N2a0VhYWUrZmNhei8rSWxsUkFE?=
 =?utf-8?B?NUVsSmlLeEoySExhTDVZbVl5K05FREx1S1VVU2hKbURUK1JhakZVVVF2NW1a?=
 =?utf-8?B?MDRhZEVZYWpTcFdCNFI0Ri9OcW4xQ3dEMVgwcW5seHUwdTFzZitJRE84K0h2?=
 =?utf-8?B?YThJc1VKWTdQWUVQcjN3SDFGclZBaUI0UGxPUk5QRjdvejFRNmdQZXhFNDBE?=
 =?utf-8?B?cUJDR3NORFVPWVQ0Uzc3a2YyOHBLMm1ZdmppcVN2clhSNitCdmxRNWNEb2RZ?=
 =?utf-8?B?KzFybnQ2K2FRNzNyMzFuVlVPUGdUOUFNTnU4Y0hRSmFRY1JZQXR4eGltZk05?=
 =?utf-8?B?QTlsYkR0NDBTMTJhVEFCVWNONXVNT09SZ0VRUzRnbVBjbDRaUDRGSy9Odmp4?=
 =?utf-8?B?V0pPM1FKYlpQS3FFZzEwZEVBMXBSN0VLM2ZSekFrRTFPR1hyL2pGMzZBcjJO?=
 =?utf-8?B?RXQva1lWTGJWMlpBbUU4SWxKVzJFcW9jczN1dzFvWCttSWRDZG1MSEJtNElm?=
 =?utf-8?Q?SBtmMjsrgRYk8Vme6I9NF/uXr?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acda268-120e-419f-8476-08dc65074044
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 09:08:19.6843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IYoLAtJR23Y8Rf94nZlWRe9rvKDewQ7ArOgXDdips/O61sQ8FVQbl/hNiCLE8btSEdzKRH+ghDVEcFngsvu6XQj7ond2P8Ns3W6nvQCnpHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_020834_487518_A610B7AA 
X-CRM114-Status: GOOD (  26.47  )
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

On 25/04/2024 04:32, Alexandre Ghiti wrote:
> 
> Hi Xingyu,
> 
> On 10/04/2024 05:31, Xingyu Wu wrote:
> > This patch is to add the notifier for PLL0 clock and set the PLL0 rate
> > to 1.5GHz to fix the lower rate of CPUfreq on the JH7110 SoC.
> >
> > The first patch is to add the notifier for PLL0 clock. Setting the
> > PLL0 rate need the son clock (cpu_root) to switch its parent clock to
> > OSC clock and switch it back after setting PLL0 rate. It need to use
> > the cpu_root clock from SYSCRG and register the notifier in the SYSCRG
> > driver.
> >
> > The second patch is to set cpu_core rate to 500MHz and PLL0 rate to
> > 1.5GHz to fix the problem about the lower rate of CPUfreq on the
> > visionfive board. The cpu_core clock rate is set to 500MHz first to
> > ensure that the cpu frequency will not suddenly become high and the
> > cpu voltage is not enough to cause a crash when the PLL0 is set to 1.5GHz.
> > The cpu voltage and frequency are then adjusted together by CPUfreq.
> >
> > Changes since v3:
> > - Added the notifier for PLL0 clock.
> > - Set cpu_core rate in DTS
> >
> > v3:
> > https://lore.kernel.org/all/20240402090920.11627-1-xingyu.wu@starfivet
> > ech.com/
> >
> > Changes since v2:
> > - Made the steps into the process into the process of setting PLL0
> > rate
> >
> > v2:
> > https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfive
> > tech.com/
> >
> > Changes since v1:
> > - Added the fixes tag in the commit.
> >
> > v1:
> > https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfive
> > tech.com/
> >
> > Xingyu Wu (2):
> >    clk: starfive: jh7110-sys: Add notifier for PLL clock
> >    riscv: dts: starfive: visionfive-2: Fix lower rate of CPUfreq by
> >      setting PLL0 rate to 1.5GHz
> >
> >   .../jh7110-starfive-visionfive-2.dtsi         |  6 ++++
> >   .../clk/starfive/clk-starfive-jh7110-sys.c    | 31 ++++++++++++++++++-
> >   drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 ++
> >   3 files changed, 38 insertions(+), 1 deletion(-)
> 
> 
> I only took a quick look so I'm not sure: does patch 2 depend on patch 1? In that
> case, I think the Fixes tag should be applied to both patches.

Hi Alex,

Yes, Patch 2 is dependent on patch 1. If patch 2 is applied alone, it does not work.
I will add the Fixes tag both patches.

> 
> And as this is a fix, will you respin a new version soon for 6.9?

Yes. I will send a new version of this patches.

Best regards,
Xingyu Wu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
