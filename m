Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F3CA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixo3FSM7yatUbP5l8NUx5JETRbBd6D6z0Bh0OhgBEFM=; b=mzvetZzCM2vDOE
	7UfMe5eMXRkB3WnKaa4BOZYCgeCXK8oa/yAFyTu6JL79ZjSYGonlEnpq1lsB/ZtqrEcy0tNERo6fd
	edPV/iZqvPCbLGHf6O6tJeAdYVy8Xh1DvomTdt6l5zPE9RlL32yGSM5V38KHmq6fKlQL4U8SRCd93
	5UwXUorWdpOmlFZ/Zgtv3csD59iUTZSkI6aRwQ9OJjWQraSHLlnuEfLq3RrT1S39TvI3isAApI0Wj
	Eh+2OCxb5Xlyh2W4B+TeUFNgbV4xiljAsWHXiBuHA5/gri5SV7N+1gYmuH18Y9zwg4Xhi1k9asBgN
	x6T6pPwofGeTL3AcNkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMXN-00000001rJ4-2FA9;
	Fri, 22 Aug 2025 07:50:13 +0000
Received: from mail-bjschn02on2118.outbound.protection.partner.outlook.cn ([139.219.17.118] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHHg-00000001FBL-3vuf
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 02:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoJCk7JmXMu0Fyuaornn7NkhfH3EgFJIqfPyjTrjHOsqnUMqmvzdtoUJuxRcAO2vTw5qLN6bNu7HZWDOfM0pSRno2wc8CUs3k1Vd2T6KFII6yOS/6C89PAs0eHHqLoEnYEJSgeSnQhw9L8Ij4veWOOt8JR5EsUZk/ji5oFqB+5b7nDQ90G/DhVa/AlN+JrV/QTJ+eubUbluM/U0jJB1Hmu+mvLIkFKjozKhFKVEEjmhfpbPS3nYpHQVB7pN+XMbqY2tk1x63TG1XtxVrgNW5x8waUPkFb/QjmwYTSaZ94GMDSNv+I3G6xF0pACT/ui1moFz1sSUWqsjXxDJZqJXXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkGugi36vkKwmkDtB8Dk84tdNc0FOy9r8GBmyjQVdA8=;
 b=Q7hYzDOqmFQgr2o5vfv3ah4224aPx0Boo4OGSRqtZgDrSHw/aFpMMhcGysrZS+Gu7DQzNsszC3O++Bpt4hRCaXFTRvdrte0m+ouHBNZkpTqAeQ/dhS0pIsUnu/QmnKTW+aw3NtHEZE1f7gw+bQDxdt/15x4ZSq7K4JUs+vwIeZfb+QdYPgUQx8F12P8W1p5lv3JNv+JVtCxs4YwAKKVf4QCKkyosgyOsmsxbWCH06G4DEWm3k7jjEgP2FDFk9pPoduUTVQLrPZc5J8a2WQW0sUgy4gjqR4/hyPj2v8/eRbo/GgfvwNyll1tlsCHTp6Hje7c7EqsFnNQuKcJo8y9ZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1323.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.29; Fri, 22 Aug
 2025 02:13:35 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9031.024; Fri, 22 Aug 2025
 02:13:34 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC 3/3] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
Thread-Topic: [RFC 3/3] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
Thread-Index: AQHcEoPTVFgiZ2cNsUahDKGHWBxu8bRtJRKAgADI63A=
Date: Fri, 22 Aug 2025 02:13:34 +0000
Message-ID: <ZQ2PR01MB1307E45973922C6C3BC31A7FE63D2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-4-hal.feng@starfivetech.com>
 <c1396997-fa92-47cd-9bc6-8dcb67e87eb8@iscas.ac.cn>
In-Reply-To: <c1396997-fa92-47cd-9bc6-8dcb67e87eb8@iscas.ac.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1323:EE_
x-ms-office365-filtering-correlation-id: 7d8027b7-fda7-4560-0d71-08dde1217fa2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: k1ODaHAaXu3N+2Qw6s74jruJaGXkQb9hFufsNuNgkPHbNAn11GvDTEWlyBO4+gc5bX0oqxtz1Kl1LjN0LuSMLQiNQGN82sUbZ8nZzMSnqFDIuhkjekEd6RuRyLU2+6Ctv6Rll2QnUQEQp5bnzC3NCiiVFQRFvwrhWqpwZCy/psZT7MI5c+gC8RiOuBM4awDs065J0l04YT9EfpDzBa3vtkz6ca5pBSXRZvDmsKjajFLZRidy3yciyRsHt2uQz047HO0Fqqdfzg1m4MQ3rLL3SABM93RB0QZ5Y3RpI9CZ1SdGhPqTmlA1bK+6aFAKXqyTycrAhMy4naHQgQ9thPtr2nXqcD+XDvCIjEUwwNb2m8122ZP8qsS/mCRjQ+DWGm3VvHhf5E9yBUMS5utv2ouQG0ErbulNOp7kwNtnltSBA/TiqzsG+ltQt/Kn84cdp7xl3haunkk+GI5KkqRusFTFVDhFL6XLlIYpTCN4U3/BULpnFle6VcnrLmKiSOG2XbcCOHym3VAQ9LtmqEOVOuRA4IFSzbAFa/EXghcx1gBKSyI9yMwNaHa0X6Fql6sJDJ1jjAm0qOeWAKOj+bOqMWhnVNctSqmkw9iXcb9EZR79rKI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlRhejdXbVpNam1qWmhScXlqMjdBRm5NMVp1bTZKUmtUaWY4SVlBUTkzMnVQ?=
 =?utf-8?B?bW1NUGxBa25FNVZkSWNjaFQ2L1RadmNqOWhRd2JBQklYb2pmTU40OVMvNFFr?=
 =?utf-8?B?ZlhZUWl1T09FVmxTTFdxNERiMnBNcFE2Nk9oNnk2bnFsb20rT3pVaVNLVlhE?=
 =?utf-8?B?VjJNS3kyUWxwMnhJU09zOURuc3dvNXBNaTRaZEhRandpZUVDOGtTcW5JYVNL?=
 =?utf-8?B?ckIwYkR3NG9vbmsrNGV6MDRNbzJRcEpqWG5jOVhZWlBBM0RWZ094VmpvcEYx?=
 =?utf-8?B?SU9WbTMwRTZzeFdvdW9CbWpyWWFXY2oxY21jRzBIMTdUcUNOSTllZDdYenVS?=
 =?utf-8?B?V2YzTWt1bkJZNmtLSlM5UFNtbEZGM3RQeTBaWW84TThpSGcxV3RZTXJNV1FD?=
 =?utf-8?B?aTZFZDBieXF2UkpXczMreWNuekFqLytKZVo0SHJwZm5UNXl0WDBjY0ovTk96?=
 =?utf-8?B?Q3Z6c1Zwb3ZKZ1V3bUNORU1nRElDM2Z1Z3JLVTYzNnlKMVEzNzMzeGl6UXl2?=
 =?utf-8?B?bVFzTERJanc1ajZJU2NkdllpUmtqY3duTTlaUFpTNy9POTNLemRWSXhyaGFF?=
 =?utf-8?B?TmwzUkhSNndlalhmOHZ3dXZweTFpaThYbjdydFIzWklQYWtaVTlVUlpicUo3?=
 =?utf-8?B?empSdm9VNWM1M2xLMzNaOFBUV1pZNlBya3dMTzVIbDBpSDBHWi83NUVUWCtC?=
 =?utf-8?B?TS9aQ0hxMmdSREhITHZBSjBOTkhBakJ5LzM1SWo5RHJ4aUpUZXBQb1dTNkx6?=
 =?utf-8?B?dkJzcktncks5clRTeFVZR2d3MnFYWUJucVQ1L2NJYWxqN1RrTS9xZ3Z6Wm85?=
 =?utf-8?B?cFJXQy9GeEoxMFlUL1NacEtBckpka2ZJZWRHWENSajdFckdBd1BvTndoVGlr?=
 =?utf-8?B?UW9TeElXYXFUWXQ2clF4YXYyOTZHeWlhSjc5YkR3UEZ4TGgyT3RDcGp1bTNL?=
 =?utf-8?B?RS9FbFZjUEdvWkRvdWNXVU95Q05XUkhzZGxnL1ByWnRId0dzbDFhMlkzMzl0?=
 =?utf-8?B?QTdSTjlVZVRMNWU5Um8yU0ZuN0hRb2RUZWJIUkJEM2tRejA1NktUTXVOQi9I?=
 =?utf-8?B?SG1BZ1VQY0hsNk10MmwwUTNMbkt2dy84QTBBQ1M2SklXM2VRb243UStmcjNz?=
 =?utf-8?B?QzRVZzFTenFMa1oxT3VrMkIwQUFzTUFvd1dyLzZZNC93YzB4ai9BTWFyVldi?=
 =?utf-8?B?VzlSbG01azhHelRmMHZZNFl2Mk4wMC9xVFQ1WWJmblloUDkyT0FTcy9JTWVo?=
 =?utf-8?B?WlEzVDl4aFZ6OGNtRUdkc2hlZFpETjRxY2QyS3pCL2lwUXJKcUkwM09KRW9J?=
 =?utf-8?B?cG02S29TSGt1UCtxUFZCVGNMOFIvMTBZMk5rOHZINHNFUEx3SVpUd2l1b05v?=
 =?utf-8?B?MHRrRGRrWTNmcDJ3OFpISUlPSlFtSDVKV1FvZTJMU0dVY2JwSUROV2lTdDlp?=
 =?utf-8?B?cjVMWmlPQVErd21HazR3RmxOaUkzY0VUV2NjMXZ6L0dxTjFRN2h2VVRKbTJF?=
 =?utf-8?B?V1BKbmQ5WjgvWVUrS09Jc3dXY2l0Y1dJeCtpZEs2ZWJhakxkODlHanV3Uk9N?=
 =?utf-8?B?WjVxeU9rdmtFQTJqMG9pUHJnR0grcDNSdEgxODVBWlFrV2pxUk5IZ01tZmxs?=
 =?utf-8?B?c0ZTZG01L0NhRUExdkRTYzNnTHFLcWFjblZYUG9QdnNreEFXdUtrVkZFL2NM?=
 =?utf-8?B?dW43SXBvNFQ4UVZUTS9raHpGWWk5YlRnbGFWcC9TSVdyTUVzVEJnMXpZbDg1?=
 =?utf-8?B?MHdHQmJWWVFaWVh4K2JlbFZ2WGJITHRGd3VaUmg0Q0hseEthNmhPTlJ5aHFN?=
 =?utf-8?B?UmNyZHdCbE5rZHNTR2JWdWJmQ2R2V3VlOXlWRE10YjlKZ0FlWW82NUsrOXlj?=
 =?utf-8?B?WGtFTmRUT3lER3NwQ3ZOQXZaVU1OR0hRU3dGaGNPdlN4dHRRek5hMUs4ck9H?=
 =?utf-8?B?bkFlNGdMdUkvcUxJT0U3Vzh3NlpVa01ROUxGUmlEVnZ3aVlDYlFFbzl4bWk2?=
 =?utf-8?B?aUtpRm9rODIvYm8xeER6VXVIMThBUlFnNGVOeDJOTnhVRFBTVTNTZllzc0xo?=
 =?utf-8?B?R2EvWC96cUhScWJDV3g4cTJpaHJuVGxQMlNjN2JTQkFJK29nNnBRNENTMTVn?=
 =?utf-8?B?cnhod1pMZ0dqQTZmOWI1d0NIditXZ2dYOEd1SU1BVm9Ta2w0NVZoRzlrSzBN?=
 =?utf-8?B?cnc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8027b7-fda7-4560-0d71-08dde1217fa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 02:13:34.7715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPcFiY+rlmdrTSMWykSUzViZfjupmnQvo3ysl7obSpaJQ0WItS8mRT90ZhRRQp0gzHiDrGHpd/CBrxJx41+/FeGbSamCPJng39/OEH72ilA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_191340_978166_755FC33C 
X-CRM114-Status: GOOD (  11.88  )
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

> On 21.08.25 22:08, Vivian Wang wrote:
> On 8/21/25 18:09, Hal Feng wrote:
> > [...]
> > +++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.
> > +++ dts
> > @@ -0,0 +1,152 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>  */
> > +
> > +/dts-v1/;
> > +#include "jh7110-common.dtsi"
> > +
> > +/ {
> > +	model = "StarFive VisionFive 2 Lite";
> > +	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s"; };
> 
> Might need to add starfive,jh7110s to:
> 
>   drivers/cpufreq/cpufreq-dt-platdev.c
> 
> So that it can use the opp stuff here:

Good catch. Thanks for your review.

Best regards,
Hal

> 
> > +
> > +&cpu_opp {
> > +	opp-312500000 {
> > +		opp-hz = /bits/ 64 <312500000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-417000000 {
> > +		opp-hz = /bits/ 64 <417000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-625000000 {
> > +		opp-hz = /bits/ 64 <625000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1250000000 {
> > +		opp-hz = /bits/ 64 <1250000000>;
> > +		opp-microvolt = <1000000>;
> > +	};
> > +};
> > +> [...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
