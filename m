Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F408C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcOxJuH/hf9Y2NE2Atvf7GGnoNifSTrNszlMVVfvVvE=; b=KMSJBz0sH8ora3
	tRLsjHGjT7RYOT27Oy51fyg5MIzm51gh1ubNwwDzDl3q/y9uBi4GmoHxEbtb3vor9sgAalLoRtTRb
	QDkCJoUW9uUJejEpRtfuoaDNN2gYdxMk4lifz6SC7WaRkuIYueCv68LaVjEPDC/0l1MwhxDqki/uf
	dKEyrmuZlhHJ9TQTPrGyaX8RJ/kttdZI2VMcKrpBUf7PPlryntWuGp0e5DUNpm+o9BShANlQyQzU6
	iD4pFBs8VlQlt1vb1YBxOfwtEII1E6qiadUTb3+LFF4Aw6jfIDRYzYYeHnO8rWQq/5hxJeQ+NdE/4
	hxhxb0QzeGpMm89QZlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkAd-0000000CrlR-2slO;
	Thu, 28 Mar 2024 07:27:31 +0000
Received: from mail-bjschn02on20700.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::700] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkAZ-0000000Cri6-1TPD
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 07:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW9Ixru7sVm/IlXNQQ7JxITPX1rXXnIEaBWvf8K3dBuVPQIMuOr9czMlUXxaMJUFUwOxI14a5ASmUGRMw8eEeBtzg7/49rAZEqqXGMWDE5hv1VIlmKRjQSQCYXnIxUzl48s5809kN6HOTd9DOvoGoFxwSCQNsxzTAJVaR1BlvpdWJzBkp/NRS3IFXdTwblPDtp16ujIiNNKELx9SijjnCTyd8FIuGQOVyfT65KcMQvf3UQ5l1LHJnf0KPtiRJF/cActLAcYFu2tv84+HgPiz2KJzznv7MRVfXIT6ZQaq5zGt/AJ8uZVTV9T9ll/CqFMyd07du+YshQrv1tzlk/SAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdj/pzZtu70tO/Z2iv8jCQ2zDljbfH0KCkpILt/9UZY=;
 b=Aa2H6lEx+AXoEHSKlPihp2rurzeuXgS3lHBD8QhPtZZ47h6CgvzaSh3xNim1sF5fwz4VqzGpf9h/pb4V1RE8xXNDUq41C2T2yOXLc4xWhWcf0DyFljr2OxEFYq4dfUGOXal0IIfvGHP7Pv9dqP/aIIqa8m2+5u03gqIw4n7QLgEtGtK2+WmkcAsISVA0Sh3eZHcFTD8al6L8kKDahflg2vZpu8yOLy7jMXvUl+2qFjIv4rtMFMRD4vbTt4YdcDdMv1KJAcGyfWCmlBMzBLoReruz6El+1Ql3K4LltXNCSrfzO85/1pQCb3EdBB8VAfnAnLiKl5exfgzNgqeakoSFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::14) by NTZPR01MB1049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 28 Mar
 2024 07:27:05 +0000
Received: from NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 ([fe80::199a:2ff6:e892:d78b]) by
 NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn ([fe80::199a:2ff6:e892:d78b%5])
 with mapi id 15.20.7409.010; Thu, 28 Mar 2024 07:27:05 +0000
From: Ziv Xu <ziv.xu@starfivetech.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHY5IDAvM10gQWRkIHRpbWVyIGRyaXZlciBmb3IgU3Rh?=
 =?gb2312?Q?rFive_JH7110_RISC-V_SoC?=
Thread-Topic: [PATCH v9 0/3] Add timer driver for StarFive JH7110 RISC-V SoC
Thread-Index: AQHaeOFVWs9vQrp62USTWSA+i58p8LFMz5wQ
Date: Thu, 28 Mar 2024 07:27:05 +0000
Message-ID: <NTZPR01MB0986A4F77EF371F7CBEE3A51E13BA@NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn>
References: <20240318030649.10413-1-ziv.xu@starfivetech.com>
In-Reply-To: <20240318030649.10413-1-ziv.xu@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0986:EE_|NTZPR01MB1049:EE_
x-ms-office365-filtering-correlation-id: 2e9660b2-8c25-4f36-3932-08dc4ef877f0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tyq5C4PcmfWGylseA/mbM/E9E066bviC710KowwXNisnRV77/zTJ3Si2VAyiFvkVxTAYUqzjnh6k4ACJLBHj2glT7IQ29C0Op5SLagMWDSJvft0YrgjbMsGTzDHVx52ofDv8IXI5Y1dB8lVZYj7+02VUnm/RPW09up/wsJb57cgEFlA0/8f0bwLF/wWz8DBXDK8lRGw99TlYtyyYukjQtxGrat0StooWlne4kuUOUUl/sKtZSk4nlwm1PcRCwzkCkOHiFlNzA7L0RnM2BEj8GjSklHTu6FLZZAeDb+kWsY69hwtXxagHWw4uDYnn0TuDrPd72i9xfrL7i3kWf/Nb4svKgp5E2FQm32XSJc6f8Tq3/cdYM8Gs7ETWtdiue4eG2RWD4r736jvJ/yHNTlQ2bFlfMILJmD7jXWrj87qDQgDviVkRCDu8Q+V9eqfKOsvW8msRb4XTiPpkAZ4kgmtUbFowgXD05O6d3LNa62XM5R0teidXonF1MJ9MGHl4CJyQurlMQ8+1g6mBiPfumzVso2fWimvQAwt6aihxH9um+ioE99WY6EJkNDazuo3SgJMeTppaNMoqlRxhH1W2dR3vDxyNUUX/ahykguwGKJshp3tj+38DJRuEFpbUnumVEyrK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(41320700004)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Zmt3NkJkY3UvSWdCYnlYNGhhZ01DYWZrR0xMNlN2L05lS3FkZnI3OExHekhw?=
 =?gb2312?B?K3V2aklNT09kQldWM2JHY2JHYVdWVU5tR3hVSy8wWVRrMzhaK1I2T3Z2OWpn?=
 =?gb2312?B?V0p6ZDIwVUdJZXhKQUxnVXlBU2FqNDFQeGNLZ1ZGVDEzVmF6R1JzUityVmEw?=
 =?gb2312?B?WjcyYjZKc2MxaTl0U295dlU1MlQ1R2dDWFZXMlZkN0twbjRXZjZFNmYyb0tQ?=
 =?gb2312?B?dGZVS2JoU09DQk56UVBrV21NQzNjMytGbUFNRjJtejh5ZmtWcGhzOHlMZS9l?=
 =?gb2312?B?dkJZcWdCMllEYTBJTmFseGRKRXVqeEhpb2twQmlPVDg0MXRldGlhOW9iVXZB?=
 =?gb2312?B?QlgwVEJaOEtwMy9CdUw1ZXlsQ0sybDA0OURMK0pHaUU5Vmo3WVkxejhFeXpr?=
 =?gb2312?B?Q3BPTjFhcXE5K1dCeGppaDhYYStVMXUzWlQzNThKNWY1eWZTeGRDL1lncm5N?=
 =?gb2312?B?Q0R6Y0hXYUtoTWZ1ZUZlVUtvK05nUUZWa2NrUFUyYVc2ZXg1OTJVbmdwMDVO?=
 =?gb2312?B?Qy9NbytNUGtoSUxsbFRaSSt3NlkxbC8rUSt4aGNIOUtJanNHU3V5K2YwZ1Br?=
 =?gb2312?B?U2JvNGhxU3VEZDVRZnF6Y01RUjhQOXFnUjNHdHl4bTVuU2VYOFQrNk05cmV2?=
 =?gb2312?B?QVJ2ckxNa1Z0em9DbG1WSnh3QkJKVEhnT0g1VUFWTlNIY2ZTam9wNEh6eEQy?=
 =?gb2312?B?OWZIZnBPNll0RmNPSytsQnZMelRhTFk4TWdsaWtWWjIreVJBc25YM2h4ekRx?=
 =?gb2312?B?NS9UYzc0QWNpdUNZN01jN2xGYWNJSGlIaStxNHpzMTZxcTVoOUswbElTV1Zz?=
 =?gb2312?B?bW9GOXhpdkppb2hvcWJldjNrVUVnMS8zL2dZWkVQUU93VWVINE9CRU5jejdS?=
 =?gb2312?B?VjdyV1FTWWp3blJYZ3ptODJFTXJHa2htUTR0SGxTbzdDdjBaZHdaUlNCOVNQ?=
 =?gb2312?B?MUI4WU5xVjJHNEkxblJqbktGYVc1aVdiWEpPMVo2VHNLV2tUZnc5eVZGeHdu?=
 =?gb2312?B?TEF5ZUxCc003bjNUUmR4aktuU0NpVVc0dnowU0hpcGRGRGJuM0ZSTHVoYW1C?=
 =?gb2312?B?VUhrRmlaaXJIYWpmaHVJcXdhS2FndXhKU1BYek9PcXNQMlNxZ1NqQ1FzdEhp?=
 =?gb2312?B?T0dQZjQ1eTNLaFJhSWhjdGFMRTNnWm1iQkRqTXdoZHZwTURsaXBsb2pCcUM3?=
 =?gb2312?B?dGZBbHlnS2w4MjgvaHVnUTZUOUdId21BTkplWGo5OFZsTFNkMEZNdDlPTHlq?=
 =?gb2312?B?UFp4R08vSjFZTUhmcVpSSmE4dlVXYkU4OEFMNXE3VTRwZTFaeFhBUW5uMDBp?=
 =?gb2312?B?TnlSVTBWcGpiTW82dFB4OVkyZFZGWS9FZlMwY2lGTndiRFA0cmozTXhiQ2Fh?=
 =?gb2312?B?SGRjaGtXTkE4d1NkQnQ1eHZVak1WdUE4MXpQRHJlSmYrZGx5aWhtclJQV01h?=
 =?gb2312?B?RnErZFFRTW5QL2pJd2lpQjJrdmJBSUlIVUNpbXBBVXpHdEhCNkRDYUU5UlhL?=
 =?gb2312?B?dnlvNDhLQnMwN0VRRW52THV6bHdZZzYyeStUb0tZQk5oMEp0RUQ3SVBadzhB?=
 =?gb2312?B?R1lZNWtTTWE1c0pqUnhKbWdPbmU0WmZiOFZ0aXpLUTM2bnZTTFYvQXQ3Ry9a?=
 =?gb2312?B?MlR6U2RUZEFQUzR0ZzRGRkFJeVF0dE5VbFVBNGdCeGpFc0J0anh4UEpRR2Rn?=
 =?gb2312?B?SHo3WTRuSXVUSXgvRldBbWVSM09sQ1JMMnZiTGlyZVFoYzhBZmlWaDJwWFFw?=
 =?gb2312?B?QWxmcG9vVi9hc1gvZGpYV2dnWTFhNkVoZ3B3WHJ6dVIvYUwxSlpwbDJRSmhQ?=
 =?gb2312?B?b2xKckkwdU4vNU41bmYwOG9pVThMdU92RzNPRCt6dkZlNFFIOXZDR2puNVFn?=
 =?gb2312?B?YjRKUCtFODlGVmgyNnRhRm5SbXJML3lCTG83dXJYeWZMWjZyaGdFSVNwOG5s?=
 =?gb2312?B?bWp5aEI1a1VjR0I3MjJGbHZjSjh3RFZreHRxdFNkWGFwOWFxUDMrM2pDbG1p?=
 =?gb2312?B?QUpGbUsxLzZ5TnBBYnBDd25RQ1VQRDlCZE5mNVRMcEt5MVo2dTFka2xDY1pJ?=
 =?gb2312?B?UERTYkltT1hKOU5QR0o1Y09jM0dCT04wNzJWV1Y5QlkxbTlyMi9WUVBoc29D?=
 =?gb2312?Q?Ljq9luB7Y8RMMyEtJcuTlMmMh?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9660b2-8c25-4f36-3932-08dc4ef877f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 07:27:05.0727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yAlrzW3hqetvUYt3veVQ6BJEdCCgOvVhbNOZSafUmaYNFoG0r/h2uzg5PSfEx7j2jv0fombJXcmEkMjq8P76jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002727_422214_FB12A0FB 
X-CRM114-Status: GOOD (  25.68  )
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

> This patch serises are to add timer driver for the StarFive JH7110 RISC-V SoC.
> The first patch adds documentation to describe device tree bindings. The
> subsequent patch adds timer driver and support
> JH7110 SoC. The last patch adds device node about timer in JH7110 dts.
> 
> This timer has four free-running 32 bit counters and runs in 24MHz clock on
> StarFive JH7110 SoC. And each channel(counter) triggers an interrupt when
> timeout. They support one-shot mode and continuous-run mode.
> 
> This timer is used as global timer and register clockevent for each CPU core
> after riscv-timer registration on the StarFive JH7110 SoC.
> 
> Changes since v8:
> - Rebased on 6.8
> - Improved the cpu hot swap startup process of the timer.
> - Modified irq request timing to prevent sleep.
> - Deleted clockevent suspend and resume function and these
>   operations are included in cpu hot swap operations.
> - Formated data structures.
> 
> v8:
> https://lore.kernel.org/all/20231219145402.7879-1-xingyu.wu@starfivetech.co
> m/
> 
> Changes since v7:
> - Rebased on 6.7-rc6.
> - Modified the Kconfig file and added selection in SOC_STARFIVE.
> - Used the timer as a global timer and registered as clockevent
>   for each CPU core.
> - Dropped the timeout function in the interrupt handler callback.
> - Changed the way in the functions of jh7110_timer_tick_resume() and
>   jh7110_timer_resume().
> - Dropped the registration of clocksource in the probe.
> 
> v7:
> https://lore.kernel.org/all/20231019053501.46899-1-xingyu.wu@starfivetech.c
> om/
> 
> Changes since v6:
> - Rebased on 6.6-rc6.
> - Used sizeof() instead of the numbers of characters about names.
> - Added devm_add_action_or_reset() to release the resets and
>   clocksources in the case of remove or error in the probe.
> - Added flags to check each clocksource is suceessfully registered and
>   used in the release function.
> - Dropped the variable of irq in the jh7110_clkevt struct.
> - Dropped the wrappers and used enum definitions and writel() calls
>   directly.
> 
> v6:
> https://lore.kernel.org/all/20231012081015.33121-1-xingyu.wu@starfivetech.c
> om/
> 
> Changes since v5:
> - Rebased on 6.6-rc5.
> - Changed the number about characters of name.
> - Made the clkevt->periodic to a local variable.
> - Dropped the variables of device and base.
> - Used clkevt->evt.irq directly and dropped the extra copy of irq.
> 
> V5:
> https://lore.kernel.org/all/20230907053742.250444-1-xingyu.wu@starfivetech.
> com/
> 
> Changes since v4:
> - Rebased on 6.5.
> - Dropped the useless enum and used value directly when writing
>   registers.
> - Modified the description in Kconfig.
> - Add the reviewed tag in patch 3.
> 
> v4:
> https://lore.kernel.org/all/20230814101603.166951-1-xingyu.wu@starfivetech.
> com/
> 
> Changes since v3:
> - Rebased on 6.5-rc6
> - Dropped the useless enum names like 'JH7110_TIMER_CH_0'.
> - Dropped the platform data about JH7110 and used the register offsets
>   directly.
> - Drroped the useless functions of clk_disable_unprepare().
> 
> v3:
> https://lore.kernel.org/all/20230627055313.252519-1-xingyu.wu@starfivetech.
> com/
> 
> Changes since v2:
> - Rebased on 6.4-rc7.
> - Merged the header file into the c file.
> - Renamed the functions from 'starfive_' to 'jh7110_'
> - Used function 'clocksource_register_hz' instead of
>   'clocksource_mmio_init'.
> 
> v2:
> https://lore.kernel.org/all/20230320135433.144832-1-xingyu.wu@starfivetech.
> com/
> 
> Changes since v1:
> - Added description about timer and modified properties' description
>   in dt-bindings.
> - Dropped the 'interrupt-names' and 'clock-frequency' in dt-bindings.
> - Renamed the functions and added 'starfive_'
> - Modified that the driver probe by platform bus.
> 
> v1:
> https://lore.kernel.org/all/20221223094801.181315-1-xingyu.wu@starfivetech.
> com/
> 
> Xingyu Wu (3):
>   dt-bindings: timer: Add timer for StarFive JH7110 SoC
>   clocksource: Add JH7110 timer driver
>   riscv: dts: jh7110: starfive: Add timer node
> 
>  .../bindings/timer/starfive,jh7110-timer.yaml |  96 +++++
>  MAINTAINERS                                   |   7 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  20 +
>  drivers/clocksource/Kconfig                   |  11 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/timer-jh7110.c            | 345 ++++++++++++++++++
>  include/linux/cpuhotplug.h                    |   1 +
>  7 files changed, 481 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
>  create mode 100644 drivers/clocksource/timer-jh7110.c
> 
> --
> 2.17.1

Hi, Daniel

Could you please help to review this patch and give your comments if you have time?
Thanks.

Best Regards
Ziv Xu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
