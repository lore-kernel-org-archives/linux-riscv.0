Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84092CA9ED0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WA210+PnlfRwnBgmNwKgX54QQN3kIci9ldGPm1B5Tbo=; b=v8XT1x777cMSmK
	wM5uLOicbSGqzbJgoAYA8WckscuhVuDz5QhtrA3z6Lqy/lqFbw7tYInOk3kniJ/TiEeDk8KxkoTCx
	Gd3I98Tvvz+jkCnBR9ZgQH/8Wu82MsL+8go9KLOPrlWlsZiP4b1I2rvzccgN9BIhUWf4jCcMGpAfV
	38NwIBcZMyt6Jfjr9N3ZYThe1o5kOrsE8f+qwLNPCffiSxrWho4n333DmHLQ/N3WhZn1P1WHlBzQ0
	dsWCCuTbRfPC6ZnKY06l9UyaWYuErBWPd30qe+43rbTzlESK73lry1BG+sy1y+8xuv1RCeguDDHoM
	KD8jZz0Ls/q0kaAvZuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGV5Y-0000000C19b-1iMZ;
	Tue, 13 Oct 2026 05:30:12 +0000
Received: from mail-sh0chn02on2126.outbound.protection.partner.outlook.cn ([139.219.146.126] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGV5U-0000000C18j-1gFx
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OavkdwEQ8O2iSG+SO9XrCB+QHNoT3MmLfbyTXYV2Xjbzi8UWSUJRSwbYgp8QVz0lzo4IxuB7scgaTY8LNfZBSzCpQ3UMsDqpl8mo4/eFpIU1SfOhyrVLl2UATVrgwvj66Pabh8GENY8xw+42+ZOZCAOzObaHbzuYsCUk42fYclQck9gs1XCt4+S3c5e02DbYdjb1golLC692LITApZE9ePd03UuoGVkriRNsSAjCNdtu4UIf2f9dYdvuSrsoih8RN4VGhv3phQgBT1CQ0dbKdPImnx9+Mr4rA8QZ2ZAvoJy8C0FLdFNkzURJe05VC0ZQr9gddpA9inbJss39OzfnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/Tcqq+Q1dy5TsFndErGVwLS8DLLHx1/q0GNJt/upgw=;
 b=VWyogXUiWYwOiIYwYCjdOSQNGBaoqYiqdXpQpjlgUVRH2TNkKs00xbkXR4CygS2rORGw3vUzvOYsgIkdNtkshjKxNITGL60Oo8f/TvUATwkj8wWH1iiTUjuAMG6Wr+uCX7+Ausl0DWl+4+kUZsWxkbRXBMtjB+tLBAd+xozApu9GGyIKu9l/5ZL/A5H3OWGl+i5sOq1a1s2RXDmoLbUKeC4V17Q3ixUtvp9dFtTGVFYlaQMbyTi+KXwvjozUQqUiUC0tjbEpXnbOJt7zIXSXxYbyQzMzvKpiWDkhbRKVlpbSug2DYpsxrNfE3hi3J0V4RNivkc8Jli7rQuUIClxQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1300.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:29:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 05:29:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Topic: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Index: AQHdVyFHfUH4Tl4BA0S8azUC8I19Q7b5uLaAgAFAu0A=
Date: Tue, 13 Oct 2026 05:29:44 +0000
Message-ID: <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
 <179180050742.66744.1321848308971146208.b4-review@b4>
In-Reply-To: <179180050742.66744.1321848308971146208.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1300:EE_
x-ms-office365-filtering-correlation-id: 16767fb2-fe0a-4877-9b27-08df28eafcfd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|10067099003|3023799007|261009223027099003|38070700021|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: rYD2K2GumGRYBghKpMLxxavlwuk5cHwtYna/3aMgFwd/uBMEi84oqOa3PqVbAvyDym8stRXYbGEdm/IrA96rrqmsCdjrZNpVdRyjsWXi4hQGDYEMi51vlqL28syBINPEF4OcRg/m2GR6aLa2ansomPEFft+FPwSSc9IKIxf3EAHveddZ7jgyUBnEutQszkffR8HWPqsMdpUUMfNd7GYQ/qpLZ07sQuUk25Vfc5TwWjWHqcJSiekDDgWWfskZqXRKqvhHwjtejF2fBsXKr9k7SIFKeC8w+tv5gMPEb2XJlUOkqCeOxHcaA2NFJch7Xbrm4l3kEPHSpsHx0PjbtYHx6s6L424YLy4ELV+Hrdrb7vkudD8+ePVtXNp7gyib8ipZmglcTJdLbdoxJee3ke8IohSQ/VLC8K8f4+gdz+DeIVdLH9eMp9WU5ubm/ArjKONNFbFbcl9AJtL5QbIajvTU4PdEh0/+QeRDvw1CfyOrygbcVYKGm+BxgopTMC6keEMejPEg74K0nzU3TBOovWdkKyjkgx/i4WmB0y/v5tafrW0C+fNUzh4bqCrL2Dntutps
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(3023799007)(261009223027099003)(38070700021)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVhMbVEyQWNjL2VETUcrMVloU1UvQ0ozejYvek1EK3JwUWVGNFJRQnNoMVVF?=
 =?utf-8?B?aDByRSt3VVl2b3VUS1pwU1pVaXZKUmMxOHl3UXZma0hiYVZ5a09PL0RqOTAx?=
 =?utf-8?B?SWIzeFdaTFJ2cEhIS0NoV2pOUkhnM1Y0OUNialRjM0wvZGEyWU50R3NaRnd1?=
 =?utf-8?B?K0V0clRKRUVMOGlVYXRNdnBPUzJPUDAyc2drTXZwNjZyeFljNFhBeFpUaE1S?=
 =?utf-8?B?eExObUlLbHZlWTJnY0tXdnFWT3J5SjFydy9TS2o1aFB3eXZ1YXhDNW5IcmRW?=
 =?utf-8?B?b00wOXBwQzhmQVBveWF5dlBWcndVanRMUzdEdVVrZjh5eEZOMVdGU1crWGFv?=
 =?utf-8?B?T3NqWUJaZk1TTmcyeW5jeTJ2dm10dFM2QWgzbEJ3eGhUL1c5ZkhJUFJ1WlN0?=
 =?utf-8?B?ajZqUDhOQU45Y203a1Rpb3RjYzFBWmt0OWZPYlMrdWZ4V2ZVZmZUNmUvQk5B?=
 =?utf-8?B?RlB1Tzk4M2Mvd1BxMjJzUVpxL1NkNVF3TFhsYzlHQm5HK2ErZlF4R2FBNHVs?=
 =?utf-8?B?NHRETmM3TERCdXcvMVQ4d3BGUTZFVCtwSnZVTmJpeTkvR29sN1dZc2lMQ3RE?=
 =?utf-8?B?WUJ0bklkRWZDS1UxZ1dqc3ZjRWRUZzBsdEVETzcvSFRmMHBGaWdVa2pvRlR5?=
 =?utf-8?B?QmFzZ1dkZ05ZWEtBTG5mcEpaTVdndjYwcStoZDBIU25XVUt4bDRsa1QwOUpF?=
 =?utf-8?B?VWJ0SkRNeTZzM0Ftb2xFaDZTUEYwY3ZoSWlQRFpOL2NYOHlibURsdnlSM3pN?=
 =?utf-8?B?K0l6Z3Q0Zjc1TmdhS25HM1lUQ1g1NVo1VHRVNVdSVVBEemNiNGVNRnN0eVJU?=
 =?utf-8?B?a01LTk9BQnNQekVwUDMyU0FtUitSa3pINCtXSm9tOXBKM05ub2VBSzhBZEpw?=
 =?utf-8?B?dUNhSFBNbEx3bVRrcTdVVDNqVTZqUHBuQUVZa0pMdU4wRW1uQXlmcEtUU2Js?=
 =?utf-8?B?aEdldXdmS3pleDhrZkplMWtiNTRuTXZmamFqQ2RuUG5lKy9zQTFPMXl1UUt4?=
 =?utf-8?B?bnZEcG8xOVduWWxkdGR3aXJBKytnbmhwTzNtU1FZYlN6VWN3bm9RYngwVlc5?=
 =?utf-8?B?bzlITjExQTVrSzRiMFRhcUZEck9VcXFuem9OV2dUKzVmRXNRclR3cmRiTVFx?=
 =?utf-8?B?MmtQazdmWVI4MFIwSHQwaU1CaXZxbUFRalBvSE5EOENFNllpUmlFb1N3SVVn?=
 =?utf-8?B?UDIxcVZqT2FucndLRHFzTTRWYmFzbktaV083eWpvWUZtRG9MRnVSbCs2ekpv?=
 =?utf-8?B?SjYyQkZQU3luMEhRZlFPYWNTM05WbENrU3FPVE5TT1hJN2lOUitDL0FiVlFj?=
 =?utf-8?B?cGJKTEwrS0VqcUZWd3cvUk5FQmU0MnVTeGNBb0Y4ZW1uaWcveVhYSndlQk51?=
 =?utf-8?B?UWJ1Mk5JdGtvTFpKamdxWHFubXFWUEM3TkRzenJ4MUYyS2cyMnU4a29JZFhp?=
 =?utf-8?B?OGYrRXFULzJVbldlQ0VSRGZYQVlTTWdxMHdRYmVtT05KK2YyVW9Edmk1Z01B?=
 =?utf-8?B?RU5EL1cwMDFyK25qcnlGdEtOY2RjYVNkbFhSV0dodW5GK3FHVVloaytDTmI0?=
 =?utf-8?B?RHlJRHU2RHAvTnZvS3k1aUJ0bHl0ZEkxc05hUTVBQzFDRkF6QjBUcTR4V1JY?=
 =?utf-8?B?cHlIdjMyNzlIUDFQbkpyT1dwQ3hCa1RnOFcyeGJKaFlFeXRBdjdBdythMkNM?=
 =?utf-8?B?OXVnZVZSSFVzOUhIT2U4TWNZNi9HVDNnK2luUUpOOG10T3Y1Q0pRNjBnWTk4?=
 =?utf-8?B?N3czZjBUK3F2MlVuNXdWYmw2L0JPQWRlT2ZrSHBMUlUwN2RPYW52NGpscHl2?=
 =?utf-8?B?WDFFTHcyai95K1RYVVZ0OERCUEZsZmNicDZTczZlZnNBMzEyK0dZYk8rbjZO?=
 =?utf-8?B?UW51WHg0S1J1cnFmTjRXTDV6d1MweFhGaGdvZGExWDBHdGNJejZFczdMaG1P?=
 =?utf-8?B?dFNZMmN6NkxZYTZwNUtxQ2lhUVloMXdNQk5LUGZFcWsvdFpXZ2dPdS8yMldw?=
 =?utf-8?B?M1MzcEZOYm13WUljUHQ5MXJqbWZxbm5mallLTXRITXBGMHBaWWhRdVhJUkFH?=
 =?utf-8?B?YTQreXBMZzhGbXFoSmNhYlVFdHVhOC9xZHU1cC9aekljbXlJN3BSWkhpNm85?=
 =?utf-8?B?ZUMvY3JOQXNOZGZPVDVrOUJaam8xNlBXaGlsbGx0L3YxM29CMVRpelVBbkJD?=
 =?utf-8?B?Q0FnYjNxdm1FbzZMdnFxYm91Qmo2WjNzclIzcndtZXlPMS9TMEczUUFYN2dv?=
 =?utf-8?B?Q3FuMGlEUS9LVTdXTTg5ZDNoODA0UEtYUXowcElVc0JubzRMSWpkQ3ZRejJp?=
 =?utf-8?B?c1ovdVJwOFJYbnpzRnUxZWxGbTIzOTVqVkhZTlNwUUVMaTY3VGRwa0dIODN3?=
 =?utf-8?Q?d+R1tTZYIQ7JNGh4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 16767fb2-fe0a-4877-9b27-08df28eafcfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 05:29:44.1250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTfJjRMcai2ooMc7yOLxhXtHfzeAZuYZkR1nq925WSct2nT2tJgTgIxS2k0Qn2NrgM3WpcaDlX3L/aYpuAl06J18MDZL3OuvGkIKAX0QTkkW9JZeUI8sOF+02wENuK7Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_223008_600462_56317BA0 
X-CRM114-Status: GOOD (  28.18  )
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

Hi, Jerome

> > Add support for JHB100 System-0 clock generator (SYS0CRG).
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |   7 +
> >  drivers/clk/starfive/Kconfig                  |  10 ++
> >  drivers/clk/starfive/Makefile                 |   2 +
> >  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
> >  4 files changed, 175 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 66d6c15f1dd2..dff8b819f83e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26217,6 +26217,13 @@ F:
> 	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> >  F:	drivers/phy/starfive/phy-jh7110-pcie.c
> >  F:	drivers/phy/starfive/phy-jh7110-usb.c
> >
> > +STARFIVE JHB100 CLOCK DRIVERS
> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> > +F:	drivers/clk/starfive/clk-starfive-jhb1*
> > +F:	include/dt-bindings/clock/starfive,jhb1*.h
> > +
> >  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> >  S:	Supported
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index 51716655554f..cd5b7754403e 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
> >  	help
> >  	  Say yes here to support the Video-Output clock controller
> >  	  on the StarFive JH7110 SoC.
> > +
> > +config CLK_STARFIVE_JHB100_SYS0
> > +	bool "StarFive JHB100 system-0 clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select CLK_STARFIVE_JH71X0
> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> 
> just imply RESET_STARFIVE_JHB100 ?
> 
> It can be disabled if RESET_CONTROLLER is not set, so it is kind of weak
> already.
> 
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the system-0 clock controller on the
> > +	  StarFive JHB100 SoC.
> > diff --git a/drivers/clk/starfive/Makefile
> > b/drivers/clk/starfive/Makefile index 199ac0f37a2f..d2ba83d7d02c
> > 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+=
> clk-starfive-jh7110-aon.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> clk-starfive-jh7110-vout.o
> > +
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> > new file mode 100644
> > index 000000000000..edab54f228ad
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> > @@ -0,0 +1,156 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 System-0 Clock Driver
> > + *
> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + *
> > + */
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +#include <linux/init.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-starfive-jh71x0.h"
> > +
> > +#define JHB100_SYS0CLK_NUM_CLKS
> 	(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
> > +
> > +/* external clocks */
> > +#define JHB100_SYS0CLK_OSC
> 	(JHB100_SYS0CLK_NUM_CLKS + 0)
> > +#define JHB100_SYS0CLK_PLL0
> 	(JHB100_SYS0CLK_NUM_CLKS + 1)
> > +#define JHB100_SYS0CLK_PLL1
> 	(JHB100_SYS0CLK_NUM_CLKS + 2)
> > +#define JHB100_SYS0CLK_PLL2
> 	(JHB100_SYS0CLK_NUM_CLKS + 3)
> 
> Does this mean that if the you ever find out you've forgot an internal clock
> (which does happen fairly often) the whole external block will shift ?
> 

Later, I will introduce the following macros to define the external clock, which can avoid this problem.

#define JH71X0_EXT_CLK_FLAG	BIT(15)
#define JH71X0_EXT_CLK(_n) 	(JH71X0_EXT_CLK_FLAG | (_n))

> > +
> > +static const char * const jhb100_sys0_ext_clk[] = {
> > +	"osc",
> > +	"pll0",
> > +	"pll1",
> > +	"pll2",
> > +};
> > +
> > +/*
> > + * Regarding the CLK_IS_CRITICAL flag:
> > + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running
> whether
> > + *   or not a consumer holds them, such as the bus interconnect and
> always-on
> > + *   blocks. Gating them hangs the system, so they must never be
> disabled.
> 
> PCIE and USB are critical below and do not appear to meant this criteria, yet
> they are critical too.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
