Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0062DC54E68
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjy5xvWGjbqOb3HkRuYFs/FevzmwaTsKR5vGjG6wX1g=; b=UOi7Tc2cOfoFH4
	t9SZOCv2Yv2AQr2R+mSFUlgGbjxcfOapXybjQomz3MkAB9GarNhVFOJkTfNicQDJ264TUmiFOxqPJ
	jbnGaj312j5EmCUVbGJMyOd+8mPRzh3GUXA+mw0REWtPwk893spuovShhESrypUugtAxuEvg1+mab
	1OY4qHpvOmzKBvgH9lz1JDRnQ9BoO45UGlA+0AZUx8rOnfN8xg/cxYpTSQ0a/N/8jcFpF7+5uNTEe
	X7BOKNWTclVn7OU6MZzZPV9PfJB6nndO/dzO8MdDX6IrZ+PzT0B2PDsoXOWgGEmgfUMWamQ6UqUh4
	W5GnqHv0Q1Y2iZvxSnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkwn-0000000EwIl-0Vcu;
	Wed, 20 Mar 2024 01:40:53 +0000
Received: from mail-sh0chn02on2070f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::70f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkwj-0000000EwHA-0E79
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 01:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNF8GoqFIX15ZSexKH6fkTMoET9oIx2WoJ0tOH4OM7aSYyJQ+zVvcON7AcJmvIp24NdpNnA+GOl0OwSIaSVQ5JCfPKialqdEFj+Zkk9ZOdNXV0bE4w9InB7ILUlxOzxfqQDnuDwwXPa+NHCPvhhuAxaDLB2Nf6f7j5Tu26cyaNxG7PPqt1/roradQCUWThByFc7F2CZJ5hxM4SeOZanfzAsCsXseUtgPrGEnahlQ9wm/agGgHewM1wKIiOCAE9CGvuiErFvPbFEXLlI1xSOc30mHkk+rkqG+//VnwCodUh0fMeBCDDuSD5JCQggHTtn0R415tW3Qzm3/rvcIPSvaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji4G6WJiRciEtTcEumluS0p+oMwy+SSd75AaFCh3prk=;
 b=W6I/YNv3ljnzu3ejaQvFJ2RM17CyDdIJMBVjgwr/ngrCPFuAzz7XiZerFyMPN/zu/jXf8aVLzC610Ntqd4HZ/4daIOZhNfqnuEoQfcQRTx+29biCCoCYUjSykLkfEK3sjaBFhS/W4ccJcBsTkC559wa3f/n7EB40VZw2belmckSTFsaS+XwyYbejhv/2zdf4HGu8LKpSw1IAKCKGGNJYGc9NChiDo9PQSi6WV1Ec4B3NLz63UykvmMOt0WDs5oRoBBh/SEFWrU5uZeDpnLHYTHnBl9Uqgp19DInyzigYFFwidjN8baCUfz9hjCaEe7Z4o2p5zDiHcU78401USw2x0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::14) by NTZPR01MB0970.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Wed, 20 Mar
 2024 01:40:32 +0000
Received: from NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 ([fe80::199a:2ff6:e892:d78b]) by
 NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn ([fe80::199a:2ff6:e892:d78b%5])
 with mapi id 15.20.7409.010; Wed, 20 Mar 2024 01:40:31 +0000
From: Ziv Xu <ziv.xu@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHY5IDIvM10gY2xvY2tzb3VyY2U6IEFkZCBKSDcxMTAg?=
 =?gb2312?Q?timer_driver?=
Thread-Topic: [PATCH v9 2/3] clocksource: Add JH7110 timer driver
Thread-Index: AQHaeOFWmdS9e7PKwUSp9ygLXWFgIrE+unIAgAEiXwA=
Date: Wed, 20 Mar 2024 01:40:31 +0000
Message-ID: <NTZPR01MB098638E8E9C1199AF8E5FAE2E133A@NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn>
References: <20240318030649.10413-1-ziv.xu@starfivetech.com>
 <20240318030649.10413-3-ziv.xu@starfivetech.com>
 <20240319-vivacious-anointer-cf790d8852c1@spud>
In-Reply-To: <20240319-vivacious-anointer-cf790d8852c1@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0986:EE_|NTZPR01MB0970:EE_
x-ms-office365-filtering-correlation-id: 33ecc868-642d-41ab-820a-08dc487ebae0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TKKi2nfgO/GNTWzgIkVnXgE7BufNH7KbdeFxZd97gzbu65wJsGFfs95POS+dY1TFTNx9NOk4FBkAGAY6VWtfi+binyMX0/CQ3s9dZAsm18qYGesqpg5v2znEHqyQmUpfbevlKQlLIU9+syqktkqnIIhoU5CbPoELABlJdVZcsfuZjPna4C7qp/s358nTvXBnSXQW9VUn2KNt7203da5408Xm4JXry+fXBo49yQIXbzaijsczdgm3Kwu4Ur8k55XikUDh3qQj7EZaWBUrpjVujiU4vBXla2CLcda3WUG1H3P3CJ+c3VRBXAIxWsNMCCF/N4EtzgvUpZXWXXMTMGNNoE4ZDDqr3OfF9X6Oj3/C+eFmbHU1pwn7zhfInVwSPRhosgjTVPvIMz3LuN4dOnRoP7JPTzHwfGfgC6GT0oM4YzEyOlp5fIRSDa3SqGjbO2OCqPX7IW7UJ0m5m44MPj2Hz68PK93pOUaNsBRP8h+L0MbhOXaHpL1Iivh+U0te5szx/yemwiCzLtfgMV42NDQoTXNG9hSq95e842n1QxTc+j7ZjEreUK8th1GrCCmmyrftLEjRmNlJ8p1ns5sxtFPpgbAAnG+MEIQ0b7t50pNF6OYy26M0/08xcbJ622EcUent
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(41320700004)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bFJEWWh4a3JNTG1TdXExUFRqUG9uZ1VxR244RXYxWUluOTQ1b1Iwd0NnTXda?=
 =?gb2312?B?VEZSZGpFcXYxakQ0dk16SkszZjB2K2QyeGNTQ2JEK0kvVDV3R1NlbG9LQjF4?=
 =?gb2312?B?YjZJRG9ubC9lUjM3d0hYbEtmREdWdnpVTXd1MktoSWF0NmZJbUk3MjB4QUdQ?=
 =?gb2312?B?c0cyKzUyNm1RQ3QrVkswbzZBNzIvcjIxNGx0QmdsWVdoRHRFZ1JUMnVRTWhx?=
 =?gb2312?B?VTFKQ2FYajVmQXhlMER5U05pZ1p0WlZLUFYzTnpSSHczcWlKWSs4TXczZHNU?=
 =?gb2312?B?alRqeXovdWMyQkNHUmhPSXkzY2E2eUFDUk14aStVVjR1QTVnYkdiL0lqVDB0?=
 =?gb2312?B?ZTR1a3I5cUJuZHZrZ3N1YUJRSHFzdkRvbTEvdGR5ZzJwaFZid0R4cDV4eVVl?=
 =?gb2312?B?NHFSN3hPbUFCQ0l5aFR4TmowZWcvYktiWEdiWXQyRE5Lb2E3MmdRcGcvQis4?=
 =?gb2312?B?bkZ0aXVvYnp3QXdIQkk0dXhHWjBqbWZwRXNpR2VsSnF1ZzNONDhVblhnSVg3?=
 =?gb2312?B?VHl3aWljTEN3OTZvVkxCKzhFYldxa2NqUmdDcjBRNDVVaDJlYStSY3cxR0NF?=
 =?gb2312?B?MlZGYnFNUGpFS3MvVzFyN09IWEVuSzFpRmdGOStaQTFuZmNsOEFDeENGU1hM?=
 =?gb2312?B?ZFd5d015MFZBVDA4UENhZVdVZ29JRUdVZ0pwTU9nRU8xWlY5cXluT2RYN1pZ?=
 =?gb2312?B?cURwZkt3MWkvSERYZUFwWVpHUCtGWjJaRzZveGJWTitQVUZRcHp5Nm9VZ29x?=
 =?gb2312?B?OEorOFVnb1VPVFIyb0ZZem1OQ2VVSTRoVXpmRWNuYWtyU3VNQm1wTlNwYS8y?=
 =?gb2312?B?dGphemxrMkp3ZStOeGNIRm53VkNzZU4xV2ZpUnN0YnBlTTlUbnZXLzlERGpP?=
 =?gb2312?B?aFFkczYxS3JIQXRMdCtrWGpYQU5aczNIZkRRMUE5K3RWUVg1aGpscDBDREtB?=
 =?gb2312?B?WEtxbWlZOHozYktsSzRkbGJBT3d6M0dvdlAwNW5XbnlVRlFuMlI1UWQ2Tzlm?=
 =?gb2312?B?RW9zaHd4NnJxeXo4V2EzUzBTczF1Z3NQWGc4cVlqL1JvMURBNjJTeGxMS3JP?=
 =?gb2312?B?NUZLN2xEMFFuSEFJR1VNa3hMZ042Q0cxRXlwcUZhbGpLelNmMnc4TTdWTFZC?=
 =?gb2312?B?d2UzbkdnTVhJTmRWQ2Fpc3dIWlQwYVc4NERoNFpNenM5YXlRK01kcVl6ekNY?=
 =?gb2312?B?eTJWQjkrR0cwWmRoUlZOSERJQUlWdXZpbXJzMzBvanh0ODR1TkxDZDZJZzFp?=
 =?gb2312?B?VzRNTHZ5Y2VyZWE5OHNHcityeVF4MDVrM1dDOUFaWEF4eG9zYzgvZGN0SXRF?=
 =?gb2312?B?WHdhY2g1azhzV1VDYmlHYXIwclA5aWhpYjhvN3JMV3A0Vk9rZ01MMVI0WCtX?=
 =?gb2312?B?Nm9IUitzZWdONjNHUzhrT2MrUUN6ZkRyNjFUNUZVVmVBQ0QzMHBkOUlzbDR5?=
 =?gb2312?B?STZTQkxISlgyVTZETVliekRnOGxBR1laTjJuQmRiU2FqdzRkWitrdlVJMEhQ?=
 =?gb2312?B?L2VaZkt0MmpTcFRSOHVWVG0zSCtIOERGVG5VMTdrcUxVQ2hkMGptUlJORWtB?=
 =?gb2312?B?RE9QZ0hzUEZ6VURNQXBTalNFVUg1dDczdTRkYWUrRGFaN0E0NXVaODVZN1RZ?=
 =?gb2312?B?TXZkR2lCb250blRpQzd6Njlac3lzRTFmN2dZTFpwZHFOOFNhSzRiU0tMVXBN?=
 =?gb2312?B?cXFUTkFPaE9tNHFBeUFSZkdlYnhBakltZENHTjJ2NHRwM2d2L2RoclVZZUI2?=
 =?gb2312?B?a0ZSbEdSOVNmcTVnbStydXFZdnlxSnpDOW1tSldhZUtJbzlzWGRna2ZuUUR2?=
 =?gb2312?B?dkxlR3FxczE0N3lFYVNxRjBDaUVjb3docGYybzlrNzdvek5iNXIwR1VMUUdC?=
 =?gb2312?B?VTR6cHhIZzVzRnU1ZHNLWnZXVTNZdkFvZnk5MnBUTWNhK1NZQWoyanREenVu?=
 =?gb2312?B?dXlHUFZhbFExd1Bzb3plalpzcmtaelpVU2NCWllrVzRRMFpKdUpaWGZpa3By?=
 =?gb2312?B?amdWZ3g4TVBKTWdnZGVhT1huMFdTcEhtZzQ2dFNKaDNyUm5yK2FpUzRFOXdy?=
 =?gb2312?B?WmUxaDI4VUw3bGxEa0ZZeUZpb21tSFhHRmZmQ0tTK3NYMnlZUVQ0UHNtK1Ar?=
 =?gb2312?Q?7qP1ApZelkC0k/aI2JV/vrd54?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ecc868-642d-41ab-820a-08dc487ebae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:40:31.8075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fKLoi+p63hes18a5ouCinqxy5fpwsLgjqg1kVTW1uoaeHSEPOSxVb3c+5pn5MTwwNGcGp1mglniemQVwdLKreg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_184049_193567_6E20B6F2 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

DQoNCj4gT24gTW9uLCBNYXIgMTgsIDIwMjQgYXQgMTE6MDY6NDhBTSArMDgwMCwgWml2IFh1IHdy
b3RlOg0KPiANCj4gPiArc3RhdGljIGludCBqaDcxMTBfdGltZXJfc3RhcnQoc3RydWN0IGpoNzEx
MF9jbGtldnQgKmNsa2V2dCkgew0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwkvKiBEaXNh
YmxlIGFuZCBjbGVhciBpbnRlcnJ1cHQgZmlyc3QgKi8NCj4gPiArCXdyaXRlbChKSDcxMTBfVElN
RVJfSU5UX0RJUywgY2xrZXZ0LT5iYXNlICsNCj4gSkg3MTEwX1RJTUVSX0lOVF9NQVNLKTsNCj4g
PiArCXJldCA9IGpoNzExMF90aW1lcl9pbnRfY2xlYXIoY2xrZXZ0KTsNCj4gDQo+IFRoZSByZXR1
cm4gdmFsdWUgaGVyZSBpcyBub3QgY2hlY2tlZC91c2VkLg0KPiANCkkgd2lsbCBjaGFuZ2UgaXQg
aW4gdGhlIG5leHQgdmVyc2lvbqOsdGhhbmtzLg0KDQpCZXN0IHJlZ2FyZHMNClppdi54dQ0KDQo+
ID4gKwl3cml0ZWwoSkg3MTEwX1RJTUVSX0lOVF9FTkEsIGNsa2V2dC0+YmFzZSArDQo+IEpINzEx
MF9USU1FUl9JTlRfTUFTSyk7DQo+ID4gKwl3cml0ZWwoSkg3MTEwX1RJTUVSX0VOQSwgY2xrZXZ0
LT5iYXNlICsgSkg3MTEwX1RJTUVSX0VOQUJMRSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+
ID4gK30NCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
