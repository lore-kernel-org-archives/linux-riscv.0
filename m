Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A148C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvgDu8QrX3tfLIY8xjtuXmuYoULcU84Qmyyk2yYisoI=; b=XE8LDZjyyRsjh1
	Zs1NcaJf2Vsshg2OumK7gwjsj3BAN2dbvffA8XAOwZG8aomLcFvSVigXUJ2VGrYCGR2WhKSuRp6Ap
	Xjvic0WbQbLESAxRnmGsOahaEjOdJRDoLLahILcZG/earNuUcC7aOkGaSbXsyRCXAKtP40JkU33mu
	Utyo8ngSDOcwn9fAmwQ+yIPnf1FXHWfu3p12Y6QwWNIg+DBGkw85TWxMueZDi+rF7UJbIN0Gg/8tg
	T5HBvTGELiJgZ43B90bO64qB0Trnm+NtHyztAC91peUjR5xTNvloEXvk9KymdnXN0QK8p7RAKkrGO
	901CRytpaD0e75x2stTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtSK-00BvNO-Fo; Thu, 14 Jul 2022 07:40:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtSE-00BvJQ-Ls
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 07:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657784410; x=1689320410;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6bDaa8rgfxPp1dYoAhelThidf19eHcMl65gOVWO4Wqs=;
  b=Lj217l7Kw2r9GEKaP1bC8KPNf9TnvVZ6/a+NGlJhw/LENVPt3DZOJWj4
   yJ85et1Hg522YfkdwAlTKcKaBIQULK5w5L+ZPaRprAsKdJfC6CbW7IR8a
   JouuJMj//aPeCHNZI/6hT1c17yeEyhH2quOhro4hvGVYjhhaz+7gkTAFI
   INFrfB3/adQ66BZ0Zu79yEpLvKREIMfKeRw4yTc9JuTZ7cI3R9ZvibkjQ
   AveMzvudGFV84BUXyNAfXXv0boIuILtVLRWxGSU3d8g7qeQ44c0Gfvzx4
   ur2Fcroz2pT9FF72BHx3qw52D/F7t/CoMgvSqiMR9TsioRJipZX1gSs7U
   A==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="164695364"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 00:40:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 00:40:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 14 Jul 2022 00:40:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y01AhNDC5FS0lwzlZVR/ZapbupTFRcviAahd0/h5bBK2kyLWUoG4wsKHu5i439sBzc9XXW7fIB1iO+NCYpzAYe7X0giNe72Mz0QMDmwLGbsbV4Q17hMN15UbbBSBLdD8nzu3ZmWcTZFX0IQBYuxhxrhEQjZ+Bvxh8f4s2WVCrcReStcVF4AoT83I8VNO0YtrrjYqYrG67y0BgSCE4WmFyQqdwi0ovxVsCSP895pQMuGoEESsqsBkHWlB6sExEDBOQvdxHYJBCe0TUqwh39Gv3FW9SRXE7wMGFdiPQ0wDn/JVjjMwydf8QGHg1MGLBya1+BJ5YOfhFlRqIAk1Li+4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bDaa8rgfxPp1dYoAhelThidf19eHcMl65gOVWO4Wqs=;
 b=LgTLObig65VExW+F+0QfXIpsPVcbU6SNLTBr6TpRfR4RhLbZ564BLBW6/k/HAEZ0V684ycjQiW7Ns29lz+3dtr4rw6avlLfzmV66RAYOUlvJKyXfloEHgqvyzAv5EUqecIvbJPMNiTPrnJNzHQ5vDn+PDc3TNL9JzQlx13KnVrDctL20xZRjuIjFZbEj0KuZCf6QMmBDjRJ2DDOZi3mp/bVMYx63igKe5qAk29rdo9NS/CFEI6uhpbkAOu6eYUl8MqsZpH/Eq6HNy+WMA/upXPc/2Q5glsokPZ2pIi8/VjU1u1njbRtMiAjQL2ApJDoyNRawhojaEEE7CFCWrchsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bDaa8rgfxPp1dYoAhelThidf19eHcMl65gOVWO4Wqs=;
 b=lrq84BjDEu+O8cgfuoUh1CeIRaBj6wxiRWHEWp7udlyckCDiDAvuA/ULDAJ39RY/97/VmZS3WG0s9o5mwYDY1Xd0ZezwbDvGFIebZXg0Bp9FGC02GPDQtC5ppFq5D05pTUrHuWa+MJdE42itacPbQQ9m/lGpra1t68M9p8F4Nnw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 07:39:58 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 07:39:58 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@sifive.com>, <linux-riscv@lists.infradead.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<sudip.mukherjee@sifive.com>, <jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] RISC-V: Declare cpu_ops_spinwait in <asm/cpu_ops.h>
Thread-Topic: [PATCH] RISC-V: Declare cpu_ops_spinwait in <asm/cpu_ops.h>
Thread-Index: AQHYl1INpttuBmQK702NiyS3F7cEjK19ez8A
Date: Thu, 14 Jul 2022 07:39:58 +0000
Message-ID: <9d5803fe-b879-14b7-aa8f-77b2df1e5c9e@microchip.com>
References: <20220714071811.187491-1-ben.dooks@sifive.com>
In-Reply-To: <20220714071811.187491-1-ben.dooks@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a382f63e-be28-4993-e1df-08da656c0d68
x-ms-traffictypediagnostic: PH7PR11MB5793:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VnbEu7D4gUr8pjBi/5e0zkV54ClHcYxgFZG1fWdzg+zzniEEOLvwiNdF7ZHsoOc/iz5poLzSVR4mCoWUwc/hqWA1Oi8GNzuYPQN6zuU4rJsZJHsk9JCk3UQzMkeyFZUM+c9YRPaZz506ACJH4xy1M8xFYqF+4XyCkCto6t/M9pxE8jbtJ42biP4UtkVIYLvtIOBw/kC6u5eJDYsqnBuqu7Ug9EdzU1RserKHsCD7/ZHhA65lT8AuHOAeits0wc7zcNgm3mwYrKEA0oEasdjqb2O7CHJl5mpUqd/lwk6ccOT5yb0XpbIjhD4+i5G+9oKThj9knBP4JENZK+TKId3E2oUxygcw2FaDreOBHK5Rx5A6HmZ7gLB626zVzPi1YbttYitoxQR4AWbJ2gbeu0M7kgZqWlzyF/2YKqN4noQ/peDK0huojTx9c4OTDziGxhgmkkxCM93RJlWjb5VSBfU3tE2F1KDp2sgb08Zi2e/iXicRynB5gUFms5y2D/xSjeH0HvHiIrXWrBDO0QO2VuzbekdNcDTPz85CHEiOnES8LfvTDUPWuRXIbRV1OiJXX3DvVYlxbinLe51sglF5elyxjc9pUFHof3ZgcUX28aIMQ04CEEYlDsUPW+7PVzh6mklXLrab9T0yQDx8hd65/nxoL/pDtj7IIzTvGaeefjK41X3KDbLmKuLj9R/r0n3U9vOF4Vtt+tUR9sHssHDOZXG2B5m85XD1vInhXKo2ykMGkjuRp0HXcutwQXBG4et58i/6M0Bnj10kVE8MAxVQxGHa0clfo8lftcVXqvqUJGXowoGUTHq9pzAhXZ9tnVClRTV0I4Khn8xgbgQhZS4NerJufzoDKqfgfB+n3A+vrgDv22NZ4ggXBoG/Ig6BEmQDa/fcAUcJS+TFYyrQZGPNLOulhmB8iTMH9J4YBVyUga5jM3o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(86362001)(6506007)(966005)(8936002)(110136005)(54906003)(31696002)(5660300002)(316002)(83380400001)(6486002)(478600001)(186003)(2906002)(66946007)(2616005)(41300700001)(36756003)(31686004)(6512007)(71200400001)(26005)(38070700005)(76116006)(66476007)(66446008)(91956017)(53546011)(122000001)(66556008)(38100700002)(64756008)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1AxbnNwNGhmTE5JWGVqWC91NEVWVXJRN25mMExhOVVWZ042VVJPSzYxRkVY?=
 =?utf-8?B?WWt0OEFvanZlM0JXSVg5ZUxHVXA1YXE3TWxOK3RtREJjVXRIZ3VrVUZLbWlJ?=
 =?utf-8?B?RTNzbG1WUmJxMUdpY2hYNXJ0Q3BVUmlUbnRsYlcwc3pEUlhJWmNOSlBueWNX?=
 =?utf-8?B?anYrU2V2WnFwZFRCTDR5QjZnUUJzOWdvNjBBNUpMN0tDcy9OQkdJd3lmVE1K?=
 =?utf-8?B?TEJHeVMzb21HOUhpeXdmTERqTTA1WVdxTEs5TU0yK2JDUEhNZytjeWRLRUg3?=
 =?utf-8?B?TWRyNzJzcWsvd0dJS0JMT2NhdU00N05yVmNHSnlyUHpKSklVQmFEeWFkSDda?=
 =?utf-8?B?UjYyMmR6RERKSXp2WXcwWUJnV2Z5dDF1Wk5xVkV5Q3RkdW5zSEtvNVhsODRH?=
 =?utf-8?B?NExPeUVmL0JabWVsbmljOUgvWHNkZnNvRUdPeGRoVDZmSis4bWt3VVVsSzE3?=
 =?utf-8?B?b1h6MHVPV3E5aG1WTmdmWXFxT0IxS2ZxNk8xS21iMjF5VWpKbFhBd1cwOXZS?=
 =?utf-8?B?dWRyandLV3dxS2hNMjlsTmJ2UDB6Qkxoakd5MnljR3RZays1Z2dEMGRZdk0r?=
 =?utf-8?B?YUlNSmtYNG9aOVU0cmw2WXJKMDY1ZUNZaU51bXBiRGpFckc3dEkyMkV2VUFJ?=
 =?utf-8?B?dTFFS1pSR1RITncwQU9ZYUxCdDJyYkluelVldTFkWTYzak1HYVBIbFU2OEZt?=
 =?utf-8?B?YjFiRlBXVEtRRlZtR1gwUnhtWDVNM3VTMHJuOThXNitrNTVNMG1RZWFQWHRC?=
 =?utf-8?B?QytNVGN4QVQrQ3lVQTd2azVKSFNaWXF2TVk1K0JNcHZqYTljUkxqRXJhcUxi?=
 =?utf-8?B?RkZOZk1Sb014MW9wVzVKRU1hV0gyYkE4dG93dnFTd1NOT0d2Tzd3aHBXVWhm?=
 =?utf-8?B?VHNTREtER0xDbDRTVmk5QllXM3BMRnBPamFZR1B3WG1rNEtBeWtkSU8wZmRI?=
 =?utf-8?B?S25FUVhCN0VDUXNQUzdQSmc5MmtnS203Q1N4MzNqd05TTTVEUjJGVW9RVElX?=
 =?utf-8?B?U1ZnaWV1NFAzdVgzU1p6SnVKb2ZmZDNGSTRCOERmSDdrbXNmeGtqV3djL1VM?=
 =?utf-8?B?eWcyTFdLdiswbVMrVG1hMy9OeUF6OHpSQ3Vxdit5K1hhZS85bFdKdlN1WDFp?=
 =?utf-8?B?aCsrbTFmOTV4ekVvazJVZmF6aU9pVWtRUW1Wc0JiTEphSmJnRGZhMHFyRHNz?=
 =?utf-8?B?YzRjVWhRM1ZZcysxNGFDTXhlKy9zUVFDVHowYU1oekVPSkV2aDh4akNLZzFO?=
 =?utf-8?B?RkFZeG91aStaaTdtNnRuQUlMZDJRQjgvYjgra3VHSE5uWWRwc1FHWElLNXFZ?=
 =?utf-8?B?bkM5eE1RaENXTm5lSWFySit0QzRwMjhENUVsSS9zQVhoeHkwS3N2eksrNzdo?=
 =?utf-8?B?REtCY29KK1BPdFAzMUpBa3dSSERWWXBrcW9FcGJWMEF5R2pLVitRNXBrZXEx?=
 =?utf-8?B?Rm5yZ0F3c1FsalZ4dmxkTzFOVkljRnlKZTRBLzJ2bjZVdUwvbTBuTGlmV1BO?=
 =?utf-8?B?N1VSSzc2MW9JbDBCOGlVZllNOTRnd2dPY1NlZjEwSk9ENW4vN1ZPeEFxQ2Va?=
 =?utf-8?B?QlV2eFJCRXBIekRURE5XZUZwaWVPR0M2d0hrY0poSVVnVGdtZVVFajY4Njlt?=
 =?utf-8?B?Z3ZPak04Z1RRVFNkSU5FaXhEeDFWdWNySzBDTDdFeTdUUzNLY1VCc1Q4REFZ?=
 =?utf-8?B?eVhMRjlDTEJtNzNJZ0tmdVRtd2NCTzNGeTlCYW5pUEU4ajcxMDVmR3Q0d3hh?=
 =?utf-8?B?aVNBQklDN0o3eDFINmYvQUxBNSs2WmVnUWkwcVlhNzVoOGdpMys3NDk5eU9C?=
 =?utf-8?B?cnlBajBLS0NHalRGaGwzWCtYT0hYRHBlMU9KcFAwSDdtNFRVMzdDaGVjWUlG?=
 =?utf-8?B?blJDSUIvU0ZqOXI3ajVDL1l4eWdoWDdock42V1ZYd2N3SGhDNlR5QmY2bGpB?=
 =?utf-8?B?RXBoUHFmbTV0QzF1bzdXOUJhekh1T0ROREVMMjJDZWlzbXozZ25NanNhS1dV?=
 =?utf-8?B?dGJpVVkxNFNUaUYvS3o2QlFlK1Z2SFpJK0ZZaTBQck42bnFrUVpOK1Q0eTRW?=
 =?utf-8?B?bG5FSE9lT2RJMmFFZ0pGZ3FzL3o1S1Q4bnNnb0lTQkFNMjZiQ1AxNXdqTGE2?=
 =?utf-8?Q?MgiSO9PynjrDgXc97r0w5MvqM?=
Content-ID: <06468411A62C664689DB5E3FCF8A9B8C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a382f63e-be28-4993-e1df-08da656c0d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 07:39:58.2041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JIBna0SWrrYTA++ndexjmJjky/Bsa7uukDUD5jjVl8851wLSSZIHr63AGh3d6RAGGErrjae9gSo6hmXzoQ+KweI2R0m5QHK7rPS9ebjqNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_004011_068415_03554C10 
X-CRM114-Status: GOOD (  18.44  )
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

On 14/07/2022 08:18, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The cpu_ops_spinwait is used in a couple of places in arch/riscv
> and is causing a sparse warning due to no declaration. Add this
> to <asm/cpu_ops.h> with the others to fix the following:
> 
> arch/riscv/kernel/cpu_ops_spinwait.c:16:29: warning: symbol 'cpu_ops_spinwait' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>

Thanks Ben, clears the warning for me :)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>   arch/riscv/include/asm/cpu_ops.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
> index 134590f1b843..aa128466c4d4 100644
> --- a/arch/riscv/include/asm/cpu_ops.h
> +++ b/arch/riscv/include/asm/cpu_ops.h
> @@ -38,6 +38,7 @@ struct cpu_operations {
>   #endif
>   };
> 
> +extern const struct cpu_operations cpu_ops_spinwait;
>   extern const struct cpu_operations *cpu_ops[NR_CPUS];
>   void __init cpu_set_ops(int cpu);
> 
> --
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
