Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED83CF64A5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inqrpaAlnnFLnjXjnu8d5vxN2V7y1tNwxWs45ON/e5U=; b=M3Pju3Zqezbc8H
	yiu8BW9VmCkQyWVMt3sWJ0K68P0kkGV5VjsWgJWy5Ph5OPZTcw2k24I3cISlPzcsnGpQmfm/dYhvU
	6JIK2Isxuwx1vjYqG67fujioqkBc1ITtgcRQfFs7VVSfdaLCBBK1yy5trrhxWCcYgubet2/zAiVoh
	R1l3lyr2stcHosB214uHHChgvaO2b9zax1xc9jMDogPCVqOmNu7lzcAXskgrrnoTM3fk7noGdJVpH
	LviJhOPRBjYEaHjSWAjagg1W8gPqyeAITbMxklOVjf8jRKN1Thu+oEnO+CSHNSscHZeXWM6UjA3U+
	zp5ftQvThJuLuD52J9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuYs-000000060Ht-3qUb;
	Thu, 20 Nov 2025 02:38:18 +0000
Received: from mail-bjschn02on2107.outbound.protection.partner.outlook.cn ([139.219.17.107] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuYq-000000060HB-1Lb1
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 02:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gcwv2o1y/aXrN5VeoLsxubJuDfPnw0L9pK/XP4og1gYlOCwHGMB4LoZIpACb5IEhLUoX+VSHNvcv20t9IlcPYIZJUquMKRWm5G9Z6rAHQWbZCfmUJLPqArRGhyAr5EGjOA/6QMk9iJy1m/PHOo/dXt4DBA26T8PRXZxjepPHYhBHrxk45PO7jzJoRu4+goV4A8aoQFP6cuuNLHUyXGf6fIDLGgPJrxAp2BNklog6Oqbs375jmtKYtH3RITUM+m8JGzn/s9TckuTYOHhoVX56o8/F0qQ0j32W3HgrvGnhEMv3VeUKruQkj9dXhx92bO90BVf+oaG9b+NFg1rQJjNaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTMd2g4iZz3V2h7W3RyDkIf0jC9SPuuN0uyq7ylPRs4=;
 b=FaL6dv7yngh4r1bOen2rOM+/cp14VSKH6QQuWaHS+quDjqz/COeu9hnCBu08CRUvRa5sTzMxW//RvwDESfAsHD66vw+7AHrEOegU0YH2YXo9fARELTjMcPZhBojY7JiyYNET0CpU1iymCfPjJruFD45p0e79V3bwA4FeSHfVtcA9ZdGnDu8Z8qr71e3xVun9Um+UGOB065BH3xXQWByP9VkYSESHf9JSC3mcs8cWaKscb5/ejZTSvFiVUk9Jj3rjBh8k4IaRwEJCKno2VvpdQsKizvP39vqHDvqqAw/JY1R5wg/oznVnIhtN4EWp8Xt8NpvpIYDk5OTPXGyOo26Y5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1257.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Thu, 20 Nov
 2025 02:38:04 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 02:38:04 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>
CC: E Shattow <e@freeshell.de>, Albert Ou <aou@eecs.berkeley.edu>, Bjorn
 Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Thread-Topic: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Thread-Index: AQHcT8yr76WB0y2LYU6wjdN+ecXGd7TvGAmAgADiXSCAAHpnAIAATH0AgAM44ACAAnXysIABCekAgABDeoCAAWPeAIAA74wAgADZdKA=
Date: Thu, 20 Nov 2025 02:38:04 +0000
Message-ID: <ZQ2PR01MB130738275772B0AD73099EF0E6D42@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
 <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20251118-throwing-marina-14a87d65465a@spud>
 <CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com>
In-Reply-To: <CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1257:EE_
x-ms-office365-filtering-correlation-id: c534e303-35b8-4a06-5bff-08de27ddd4c8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|41320700013|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: u+DAAEvnLmZKXtlAIieA756E9S7TCeX4jpFjGzgqkWJNaNXVCc1GPmrAv7Q3gNPfwp3xTefw3tuNljzlwOgtztXrL5B6GlZ4tUDLO61EzT17jg3zcgI/iMUG/8OxzvattdI6C7q3ItkI/rPXQWGKe1SfyCLlIimkcKiiEpDimeiEtfLX9KftRzeixfrc+mHNpZTueVyG6lkxHbOQHKS1Rlye0GhAxzZGTlGYrhOEHOjdi5tnrRMkmV1eaTPQQPIBz1Id+A3TYO/UhBITRIYjWJM/ENipszSBao2v9WZ97J7nXLWBP2ljxbfbDpumhGMbkJCzzn93KQYdDlYJyYxAJn0iKY8cs2IcaC2NO8+TRkK49lSbgEDAnwy3x2F0C6k9whggs/J31N/ZLQQscEiNb3BqsLiwun+zv8K/vHJ8E1Uha/XN/R1Pgd2dxkR2VwNIt11uSNcxAh4aWvR8yxReXrxPxEp/re7SLPEvSvbaLwQO2QZleL9G5lhjNZH9F/rYccBO8DtdnvJhSp+lPWi4Z4g2gfTqPkGj1J6el0bZReGyjYHtXel15RR0U4I8v35CPx29t6h1j+DSORz74ShOrMsNxz3F8uPAlUcNBhXGSDY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZklIOWs3enhmMXhLcDQvU1UxbnpVcXFtT0R6VVE5eStqbE1PUEJ4Um9aSVR3?=
 =?utf-8?B?aUZ0ejZLK3htYm94SE1MOUNUVmozQkpJdVNUQ0Q1L05JWSs2amFJNlZCNWZ5?=
 =?utf-8?B?cW1qSnNkc3g1bkIyQzltRHJvZWRRVVFETkkxVFVTUDlsd1ZpY2hHUVhVdjF0?=
 =?utf-8?B?S1BSRnBvWU9MM3FOL0IrU090MmoyKzN6Y0ZvWEl4em9pQjh0SU5RODV0ckQy?=
 =?utf-8?B?aGNJMzVwdlE0WjNndVNvUnhHeWNEaFBDVDR6NnNvTXo1ZG5takNGVzBSdU1w?=
 =?utf-8?B?Yi8zSnFXTnNKZWNBbXRIWmRabW8yUkgyRU5IVWhuVnpwME0vYTJFQ05hcGZW?=
 =?utf-8?B?RnUvdzB3OTZRSUR0TzlUQlZFQndOd3h3YXpWM2NzYmcxQW56SkxiQTY2N3Q2?=
 =?utf-8?B?ajN4UlptU2RIeGFNS3cvUGQxcDhnRDVkMjF4bFhBRW0reGFGS2o4MzFDeTFB?=
 =?utf-8?B?K3RWSExtMTVlUk1lQk5ydnVlbGowVjZVa2lXZFRWdUxVZ1RrcUNqQzBZN2Nm?=
 =?utf-8?B?bFlaanJTZ1JhcFIxeU82WDFsMWxLQ3FaL3NUT01SYWNxbHRIaFJPdW1zMzF3?=
 =?utf-8?B?cTkwdWZZVW1IYmNwdjN5NFBTT2dMaXBFQ0pseVpCcFlWT1FmRzA1eCswQUNV?=
 =?utf-8?B?N3lxS3BUN0VsYkhOeEwwV1lzdWlPckRWTFlGUG5zclRBRFpPQXA3REV5eGRk?=
 =?utf-8?B?cEs2aCtwQzNsdGk5Y3UzQS94RkRJb29XQ1BiYjNpZE40VStEbTBibVFIN0VQ?=
 =?utf-8?B?QkMwaGpjNW96aGxqUjNpZ2RWSWJmbTRkU2tWQzhDaDVpRUVybktISnpNYW1z?=
 =?utf-8?B?aXJDTnprSjB2VWpPUlBjdGd6NUxyL3ZjNHhkcU8xSld3QmZVZDNISVVtQzBS?=
 =?utf-8?B?dHRYdFRRbUtmaHBJYnpSbE92NHFUMWF5aXhEaXB2cGI3b2lYd2ZzK1Y0dllB?=
 =?utf-8?B?RlpDakxOSCtqNnFScnZQWjR1L3NIVTVTYjJWUUNkTFBnR20ydWVNOUx1MDAz?=
 =?utf-8?B?UjMwRHp2ZDlxdzdLdWIybU14ZEdVQ2RUUElYdHJXVHhpbGdlRnpvRGFGa0h5?=
 =?utf-8?B?amFnZXB0eWZSU1VsdXR1a0xSb3NDdjJrR3ZKbXZtV2lualdUdTZ2c3Y0NGYw?=
 =?utf-8?B?SHhsV3UxTmVtM0QwRkd6aGplMnNCV2ZId3BXajUycnExRkJpbVFoWTNycncw?=
 =?utf-8?B?a0xCUVVRYVZkVzdtL2JZR1poR2lVU3RBVWlKc2FHK2ZGWE9DeDY3SUZzQnhD?=
 =?utf-8?B?dmlyMDZaRHFrcWZmbXJRdUJ6RkVybGFUbnJRekRKREo2ZkhEVU5jQWo4UkpK?=
 =?utf-8?B?Y3RTZURqNFhHR2l6aDRkRmlZRkhGYS9Bai9qU2NvcDUxWmxjL29Pak9zSHNZ?=
 =?utf-8?B?dFBRVWtDcEJVSnVsVnZoOGhvV3o0a3ZXZ3FNdGIvVkowbG9sYUpJUWdBUCta?=
 =?utf-8?B?S3AxYlhMMDMvb2NJNk9qN25ES1dETUJHNVdjelRZbkRMN2xsWStaeTRaSzlP?=
 =?utf-8?B?MW54WHFzNWxOdXRpd1BrdUU4UW9abjlVVmo1ZEx4YzRuT1RJZVBNNlR3OWpR?=
 =?utf-8?B?NVdWM2VCZkFqNUhJNG5tR2FNR2tnb21weTczazcwWXdkTkpUZkI3S3RTdFpm?=
 =?utf-8?B?U0RLdm1SUEE5S1JNY2U0ZnhIeVloSXhxTW45K21CRlJtL3FaYUgyMFlSOFBU?=
 =?utf-8?B?ZzZkdmJWUjI4SjEyWmZJM2tQTy9LbVZONzFsOGZUSzdZd0xLcTZWTnFLTGZv?=
 =?utf-8?B?aXpoN3JaWitXamR5STN0cERMTXBVeFArMzJoN1VYMURHWkYvdkNJSXBRWElj?=
 =?utf-8?B?R2tzNldqTUZrRDhnbTRJVzhDcnpyQlJjcWFzSlAzYkpLT0lFRXNlTm1QM0Uv?=
 =?utf-8?B?TWNVM2F2S3JzTStRb3I0bGJhVGZWem5udUl6KzU1akNWTHRDNGxDWm5hbUlQ?=
 =?utf-8?B?bGZKaEVvc01OdVkyWGFGcEE1dkhMWU5lcTBkekpsanp1SUhFYkFXaDNmSkF3?=
 =?utf-8?B?T1BVWlBiNER1SlZXQmVlMzViK21pSGgvY2lMbGN0T2hVUnJJTTFoNmEzaXla?=
 =?utf-8?B?VzJOK3Y3bVdaZFp2YitYS0FaUnJGVElhUE5GSFppL3pIdjVLLzRQVUdGRy9v?=
 =?utf-8?Q?u5Xgvwj4LFGiQr+mAKXDdXTUr?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c534e303-35b8-4a06-5bff-08de27ddd4c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 02:38:04.4139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcsC+8nWsUAjQ9pDs4IpR46OblirW51+b6LJtthc4e7aieRe9gbqbKAmMfrU++fBKvDkHENKhB8Ug5m8Kn742yihl8BLluMpI6qlwvZ8y30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_183816_365372_5DD3A653 
X-CRM114-Status: GOOD (  40.00  )
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

> On 19.11.25 21:28, Emil Renner Berthing wrote:
> Quoting Conor Dooley (2025-11-19 00:10:08)
> > On Tue, Nov 18, 2025 at 02:12:58AM +0000, Hal Feng wrote:
> > > > All,
> > > >
> > > > I repeat that the suggestion was made months ago (by Hal) to split
> > > > out the OPP tables per-board from the period of time when I was
> > > > complaining about 1.5GHz JH-7110 operation pushing TDP into
> > > > over-temperature thermal limit on Milk-V Mars CM SoM.
> > > >
> > > > Whether or not JH7110S is a new compatible should follow
> > > > precedence in Linux development. JH-7110S is evidently the same
> > > > tape-out as JH-7110 and however you deal with that in Linux is the
> > > > appropriate way to deal with that here. Selection of OPP table for
> > > > correct operation will be determined by bootloader, where, it is
> > > > demonstrated by patch series sent to U-Boot upstream to be
> > > > selected ** per-board ** based on EEPROM content as if it was any
> > > > other JH-7110 board deciding dts based on EEPROM content. Given
> > > > that it is the same tape-out I do not find a valid justification
> > > > for a new compatible in the stack of adjacent software besides going
> along with some kind of marketing-driven answer about whether or not this is
> a new SoC.
> > > >
> > > > What I care about now is that the VisionFive 2 Lite series is in
> > > > good enough shape and there's a possibility to act on this
> > > > months-old suggestion to split out the OPP tables which as we have
> > > > confirmed the JH7110S is the same SoC as
> > > > JH7110 it makes a lot of sense to do.
> > > >
> > > > How is it supposed to work for binned silicon in Linux?
> > >
> > > Hi, Conor,  Emil,
> > >
> > > What do you think about this? Hope to hear from you.
> >
> > Can someone just give me a yes/no question out of this thread? I'm not
> > really immediately sure what's being asked of me. What exactly do you
> > want to do with the opp-tables? "Split out" isn't super clear. Does
> > that mean into board files? I am guessing it does, since you're saying
> > that a particular board cannot support the 1.5 GHz mode. It's not
> > unusual though to use delete node for unsupported opp-table entries,
> > could that be done instead?
> 
> Yes, as far as I can tell we should be able to just add the board description like
> this:
> 
>  jh7110.dtsi               # JH7110 SoC description
>  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
>     |  |- <VF2 boards>     # Final VF2 board descriptions
>     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
>     |  |- <Mars CM boards> # Final Mars CM board descriptions
>     |- <other boards>      # Other JH7110 board descriptions
> +   |- jh7110-starfive-visionfive-2-lite.dts
> 
> and have it do
> 
> &cpu_opp {
>     /delete-node/ opp-375000000;
>     /delete-node/ opp-500000000;
>     /delete-node/ opp-750000000;
>     /delete-node/ opp-1500000000;
> 
>     opp-312500000 {
>         opp-hz = /bits/ 64 <312500000>;
>         opp-microvolt = <800000>;
>     };
>     opp-417000000 {
>         opp-hz = /bits/ 64 <417000000>;
>         opp-microvolt = <800000>;
>     };
>     opp-625000000 {
>         opp-hz = /bits/ 64 <625000000>;
>         opp-microvolt = <800000>;
>     };
>     opp-1250000000 {
>         opp-hz = /bits/ 64 <1250000000>;
>         opp-microvolt = <1000000>;
>     };
> };
> 
> This seems to be the minimal amount of changes needed. I looked through the
> latest OpenSBI and it does match "starfive,jh7110s", but it treats it exactly the
> same as "starfive,jh7110" and Hal have not really given any other reason we'd
> need new compatible strings.
> 
> E: I know this doesn't split out the opp table like you suggested, but I think
> that can come later if needed. Let's just start with the minimal amount of
> changes to get the VF2 Lite supported.
> 
> Hal: Do you think this could work? You might need a patch to move some mmc
> properties out of jh7110-common.dtsi

Yes, I will send out a new version with the file layout above today. Thank you.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
