Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0569DC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4nqr10rkGpMT1M3h284k1m0zruk9om67jdaZlZ7WgM=; b=MmzV6DWhJUUhYF
	1+XqkhhLXuBx4lxFnNmwC2qGbHdnwr6jSMmI9rbS6mBeDGnu6A6HDsfmiHUdLGwY/J4Lvm4u0qciV
	99xYZPhvqERR86n/wwrxsSy/UyUNvQqb1bGebZAupwAN43SQlwpGMMKlSnZPaqc8NtF9yYVtnFOKz
	WEa+nxpUdcc0UChKIdW30Gk+pAPOMegNCtZRTnI/hHHqfbIN/Y3igHb80MqtDrL/fk4tuchl2Ob4d
	aakvayNcwb3W2mrnCLJOfZ8LxKl6OyhqQtgk63ZSArD8yRNpPpSExbrpX/n2lTAkXSvMIatzKQnL3
	lZMbYfDhTgdBVcZuEIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESOA-003C65-MV; Thu, 21 Jul 2022 09:22:34 +0000
Received: from mail-tycjpn01on2072.outbound.protection.outlook.com ([40.107.114.72] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESO7-003Bx0-OX
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 09:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRgKW4HMJ2qZBOeQklS1Qcn1Q6L9Dh5fTagx82Jjk2VAjHEbVxib3Z3Gy+/adVaW3VlEwBiBlt/ca+lJVmeAapuAOFif+ZKolfQ2Tx4UCECTvm3pE+sh9Ulnh47e7OO+M63PqgvTvKS+qlDzetzL8UxgZJgzQOTF5X5AZODOqDhqJCLSJdhh4ASCAYY/d4mupWAEjJ2vJXBPiAA9qc/WT7+LJL0Vp8aVJyAt4DkPmY+nBsaBEUGCMzlQV//hkryu1ug1qMF6Sq64UGWom4xdBN0N3Ev7851GYfGuGVh9TyijyQNTrV+H65Dr+D6TLIz9CItcMtjLDRH/h4mIxm7luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvUnVYm/DKphsRzH/Emgk6opogzL4UUrmrlpm/+zPMA=;
 b=Q6WLeYn04EiyYzGiGVOO3Z9LTyLhJ2CqfhyKW+MzChInBIUYTn55K1+AGlHNF7SsTArCiDSfzq+EPrlrA98J8cETZdUY0+agK2jUvgt4AfCMeKpo5LYwbSUtcQNNPBTAkQqR15pimMyeTncktRv4m54nRQjBHgybIannHf1CFFELe5m+TO8rKL8UfP1Cijsgav9Kgol1H2DJKdumojGYJ40KMwd+17byNT6eYHyNBEMHOUTfPxdWOrNFUEbjAA0XiGJmZQBti933skbCGj1YJZDn0qtxq/LvLLAl72jGsUMlTjhTcwTJXn1aZ/NAqZCjybrL5Yl8F54ZLvjojSvT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvUnVYm/DKphsRzH/Emgk6opogzL4UUrmrlpm/+zPMA=;
 b=UjBpoZLz6gR9zr4yH/vcg7ianeSDWAirZfnRd6F487iWnaaH4OADaz/OHIpzTMEKxfKJjvRBRsRpgdoPKl3boOezX1WJ3b3baf1NAqxL7OMq/foqNmEeyCwDVRCqzCg+JCdYHnKepWjbX49DcJKkAFQ1+sY5frOfHsGj5gwT9+c=
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com (2603:1096:400:cc::9)
 by OS3PR01MB8859.jpnprd01.prod.outlook.com (2603:1096:604:151::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 09:22:24 +0000
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::7c2f:2e0d:ff2a:b7cc]) by TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::7c2f:2e0d:ff2a:b7cc%9]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 09:22:24 +0000
From: =?utf-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+44CA5LiA5LuBKQ==?=
	<k-hagio-ab@nec.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Xianting Tian
	<xianting.tian@linux.alibaba.com>, "crash-utility@redhat.com"
	<crash-utility@redhat.com>, "mick@ics.forth.gr" <mick@ics.forth.gr>,
	"guoren@kernel.org" <guoren@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hschauhan@nulltrace.org" <hschauhan@nulltrace.org>,
	"huanyi.xj@alibaba-inc.com" <huanyi.xj@alibaba-inc.com>
Subject: Re: [Crash-utility][PATCH 1/8] Add RISCV64 framework code support
Thread-Topic: [Crash-utility][PATCH 1/8] Add RISCV64 framework code support
Thread-Index: AQHYmlGj4powNYA/NkqxPO0QiH0HAK2If98AgAALNgCAAAcMgA==
Date: Thu, 21 Jul 2022 09:22:23 +0000
Message-ID: <199e3091-de32-8a9d-bcd2-7684bdaf44a2@nec.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
 <20220718025346.411758-2-xianting.tian@linux.alibaba.com>
 <8f6d9af6-36e0-1fe4-17fa-ef5f04130619@nec.com>
 <c8fa1471-a6dd-9357-484d-1816c903dd4e@canonical.com>
In-Reply-To: <c8fa1471-a6dd-9357-484d-1816c903dd4e@canonical.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fb7dcac-3f3c-4733-a83c-08da6afa859e
x-ms-traffictypediagnostic: OS3PR01MB8859:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ceqGebClR+AB43Y5M6xJIJbcd7W4MnSKC9l+0RmZaqMEfJXajZQdrQzY9DBFG+hwICwTKOvAwh+6krCnUROAsPdBt7SxksG0nJZj2U70/ehLJ0hJ3jlvMeo/q4f+5hg9ROrGz1YNfWZ4Am+QEaBLisfPMmDpKKNGnjao0iYn7DLV/GzL+8ghooRc/LHxn5WUO3NkIgno1/2tamSUgR/LHCIVSU0nY1zQzldHtiD8sQoZZyxwzE6cXYakkN4Zf9NHhg9TX5AKe0QzgVwWhrXaAMlr+Ct2aHr9AOI6hFJWOR3gsqZbhKZrfHsakx66HD4znTkGG1PAYctL8viKvv2V3LqbuhhuXjVDtiyXAlRrQPYoW9XH98MBsvh5k81wWRcAbbyhe1yln6rrpE5Bh7qdfcmwFfaq/rzEOqfcS6hHMmjWhRJlSy29Kejg0gejwl58C4m1z21PeEZoX/0SUXQL4vqTSeT5c5SfIWYB+J0+5r7Ezx9NKjc7AepAnVYxY24X962exDDCvenAfs9CJrIAVSYlMakFsCKHtKUuspws1bOmFRYkqWSYBJ/42NBa2ik7CKE4T0ydQgMvScXeWa6Fw8ISJjLdxsYfS7awjHub9HgHlBE495JvdOfg/h5oIEPqZCgin5jSkX3u24whhiP9H3jeaeeq7cNfOIV8D0X0IS1I5znUDirbwkCtlYvDdWXog//UKnUX8BVw7weBpESctU68sQWrBOZLEkIBJgxGnn6WtFbzzhsAwb/gO8WUfsvnw7LnZF70rs5WJtFTHmxYS3Vt6HGjEGwaHD/LlGoCho/wnJJJxs5B6dji5+do2MSWNT+PdAJRXOeSEa6/5olhRw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6777.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6512007)(2616005)(186003)(36756003)(316002)(66946007)(76116006)(66476007)(83380400001)(66556008)(82960400001)(5660300002)(66446008)(4326008)(8936002)(55236004)(53546011)(6486002)(26005)(2906002)(110136005)(478600001)(71200400001)(41300700001)(6506007)(8676002)(38070700005)(31696002)(31686004)(38100700002)(122000001)(86362001)(54906003)(85182001)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VkhWRjhMclhrN1NCVEZ4VUMvdnhxMFJDNU5TV0ZVMStGUkVEYitUQXJxcGc2?=
 =?utf-8?B?ZU41azkwVWdtVW9aM3Fma0FHSytGcTRraW1XY1VyRGtuRit5YWV1V045aExP?=
 =?utf-8?B?cVB4cm94QllCK0ZoS2hwWitFc2RnLzBwMFd1RlJLbmx1UnpwK0Q3S3JaZWdq?=
 =?utf-8?B?cnlzbERiTzBxU3Rmd2VNU0U0b0dIS3BVMlZQS2QzKzVDd3ZpUzdlOGVkcVRY?=
 =?utf-8?B?cjFjWkdaZHNlMmF3MkhRVlE5bGlSUlF5VldKWU8yRC83cEkrd3V4UTI2cDlj?=
 =?utf-8?B?WnFDa2dCaklUYVIzRkFsSjFTbFdEdlp0MVhoNHRZNms2K1l0cVFOQzBRTVhZ?=
 =?utf-8?B?bmg5SlhSUjZYMHovaElvVEZrWk1VMXp4ZHFydEU0Nk1EVXc5MmM2NDVEa2N2?=
 =?utf-8?B?RkhpdCtnSjhHb3pYSVVZeWcrS3NZMHppUFQzRHp3U2V3MCs1c1VYZFdNcE1v?=
 =?utf-8?B?QWRuak1NM1E4UDJ3Vk1pazl0MlBnaXgwODRKN2VSNzBSNkRkRTEvVWUrWVVs?=
 =?utf-8?B?NWRwQkJ3MkFWNzRhQ1RZY1AwQ01PNVVMdWE2TmdYYnZhTS9aZUNrMFFIS0xQ?=
 =?utf-8?B?OEtaQy9rQ09vSUlGU2doVThobG5hZ2t5VE1aS2grSGdKclRlR3ZhS1FOMTFK?=
 =?utf-8?B?RCtEOGFhNWFaSm1JUVF5YUxnSlZKY0lBY2tORDVLeTZYOVJueHhOdjdVTDJ3?=
 =?utf-8?B?T1VyMDRmSmZUVnUrY2FIdms5WmRzb0RvZHBtOFBjMHJObE9ySDhkcmxHK1ZV?=
 =?utf-8?B?UFVBdGMyQUdQajZKWHlFY3dnaHU5QU4rdk02K0k1Vkg1NXRTK1YxdUZuQzMy?=
 =?utf-8?B?ZzJKZTV3ZW80NXhMTDBrTHBQMXBnZjJIaFk2T1lTMU85OE5TU0VvZmtqRUVz?=
 =?utf-8?B?TGJGYkw3MUl2bjZNSWRYYlRLY0FaR0lHR25ZWm1WTEZiUzVVYWsyemdTYVNk?=
 =?utf-8?B?cTdTTHJ1SkxJYTZBOW5xUGVXM1daSEVUV25HK2NYNmRDU21KRVpPRVpBNlpa?=
 =?utf-8?B?Y294Z0Q2MFBFZGV6T0xUUUkvQWlndUdZaU8rdTY2YTcrMWhsNTVzVzloMFlZ?=
 =?utf-8?B?L0QydW5WVENUTEtMQUExcndiTmVFRDBpeW0zRkNtTXUyb2VoV28weGFkakFn?=
 =?utf-8?B?ak5pRjlFMGNSZUhrYmZnUHU1K05aVFpkSGd3bldKSWE3SCtHcEJYZzBqb2JX?=
 =?utf-8?B?TURXeEt1OG9RcnZyeXM2V1pSb1RnY3B2dUZMMmpYVlc4YTF6TExHeXZzRTEx?=
 =?utf-8?B?WXljSWFLNUwrbGRmOFQ2cXlZbkczUWh2Y2ZIcmRLWWE5UUx6WUJkVGZOMGha?=
 =?utf-8?B?R0NKQnN5a0JSOHBlSVcyYkVmcWRCRkx5N0hFNXUvWG56RjlTK2U2TnhNVTJZ?=
 =?utf-8?B?NWhrdGVISldXWnZNaXRjQjV4YWJCOTFPOWpuSTAyWHY3aUhGbXA4eSt4SS93?=
 =?utf-8?B?UmJJNXE5NmQxZDFaTHp2ZEFHaGhjNXJVNkUyQnNzWTFiNkRIdThaUWxCWG5B?=
 =?utf-8?B?RmhQbkNhMXRMMDN1TFAyYm9BZ0h2N2tEZ1I0RU15UGdxWUpmK2tleGRCclRJ?=
 =?utf-8?B?WlpNa2lFYzlpUDhFalFkUHVDR0RlbkdwRnFPR0ZBTTVqS041dk1IYkhpRnNN?=
 =?utf-8?B?Z1pTU1JzWG9xdlh6cThwM2lmeU5jaWYvSkdldGw3UWd3bitMVHF3TTFhYk9E?=
 =?utf-8?B?YkZDSk45MFRaVnlUY0FxMWRRL1lGcEJEZGRqZGpnYWNxMkhLbXpsRk5VY1Ev?=
 =?utf-8?B?U29IZ091UC9JUm8zQjlmdlRsWWt0ZnZGY0ZuTkxKRTk3QnRiNnRYcVhVUlIr?=
 =?utf-8?B?NUduYmRzQWRiQkFlYzhTSHJCK1JsOGhsU0R2bjg3TC83ZmxzSCtkR2xEb1hR?=
 =?utf-8?B?SGRZOVpsdVcvaitrd3puUzc2N1dUcUZOZDBEbnVTMXJnSkZJaDU1WWpYcml4?=
 =?utf-8?B?R0taMzhWcDVRbVFNZ2kzaGhlWVowR09OSk9MYnJGN2VuQk9hTVFCenFSK1M3?=
 =?utf-8?B?aFgxdjJPTEhZSW9LY09kS2tkaC9WY3cyRU9xc2RFMmpGUFZ2U3FpWlhOTE9a?=
 =?utf-8?B?N01kTDJMaWtiOUdrMmlSTDJBOTVUZWNtTmJLdU12M0RXUE85Z05ha25ENS9M?=
 =?utf-8?Q?aaNIV4+htQIMJDnIfHlpPIQj7?=
Content-ID: <1425F1DA07868743A1905C1B6EFEBAEA@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6777.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb7dcac-3f3c-4733-a83c-08da6afa859e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 09:22:24.2013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cH0OGN5MepDXA/v4KPdZ6djXQM1r83emuitc6zwZcy+I2ichuj7z6VWAD/smsxQ3zP2sn08POHxDqm5jVahcJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_022232_257027_839294D7 
X-CRM114-Status: GOOD (  12.73  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMi8wNy8yMSAxNzo1NywgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToNCj4gT24gNy8y
MS8yMiAxMDoxNywgSEFHSU8gS0FaVUhJVE8o6JCp5bC+IOS4gOS7gSkgd3JvdGU6DQo+PiBPbiAy
MDIyLzA3LzE4IDExOjUzLCBYaWFudGluZyBUaWFuIHdyb3RlOg0KPj4+IFRoaXMgcGF0Y2ggbWFp
bmx5IGFkZGVkIHNvbWUgZW52aXJvbm1lbnQgY29uZmlndXJhdGlvbnMsIG1hY3JvIGRlZmluaXRp
b25zLA0KPj4+IHNwZWNpZmljIGFyY2hpdGVjdHVyZSBzdHJ1Y3R1cmVzIGFuZCBzb21lIGZ1bmN0
aW9uIGRlY2xhcmF0aW9ucyBzdXBwb3J0ZWQNCj4+PiBieSB0aGUgUklTQ1Y2NCBhcmNoaXRlY3R1
cmUuDQo+Pj4NCj4+PiBXZSBjYW4gdXNlIHRoZSBidWlsZCBjb21tYW5kIHRvIGdldCB0aGUgc2lt
cGxlc3QgdmVyc2lvbiBjcmFzaCB0b29sOg0KPj4+IMKgwqDCoMKgbWFrZSB0YXJnZXQ9UklTQ1Y2
NCAtajINCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW50aW5nIFRpYW4gPHhpYW50aW5nLnRp
YW5AbGludXguYWxpYmFiYS5jb20+DQo+Pj4gLS0tDQo+Pj4gwqDCoCBNYWtlZmlsZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArLQ0KPj4+IMKgwqAgUkVBRE1FwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPj4+IMKgwqAgY29uZmlndXJlLmPCoMKgwqDCoMKgwqDC
oMKgIHzCoCAzOSArKysrKysrKysrLQ0KPj4+IMKgwqAgZGVmcy5owqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAxNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0NCj4+PiDCoMKgIGRpc2tkdW1wLmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDExICsrKy0NCj4+
PiDCoMKgIGhlbHAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4+PiDC
oMKgIGxrY2Rfdm1kdW1wX3YyX3YzLmggfMKgwqAgMiArLQ0KPj4+IMKgwqAgbmV0ZHVtcC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArKy0NCj4+PiDCoMKgIHJhbWR1bXAuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPj4+IMKgwqAgcmlzY3Y2NC5jwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDU2ICsrKysrKysrKysrKysrKysNCj4+PiDCoMKgIHN5bWJvbHMuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxMCArKysNCj4+PiDCoMKgIDExIGZpbGVzIGNoYW5nZWQsIDI4NSBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+PiDCoMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCByaXNjdjY0LmMNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlDQo+
Pj4gaW5kZXggMTYyYzJiYS4uNTRlYmI0MyAxMDA2NDQNCj4+PiAtLS0gYS9NYWtlZmlsZQ0KPj4+
ICsrKyBiL01ha2VmaWxlDQo+Pj4gQEAgLTY0LDcgKzY0LDcgQEAgQ0ZJTEVTPW1haW4uYyB0b29s
cy5jIGdsb2JhbF9kYXRhLmMgbWVtb3J5LmMgZmlsZXN5cy5jIGhlbHAuYyB0YXNrLmMgXA0KPj4+
IMKgwqDCoMKgwqDCoCBrZXJuZWwuYyB0ZXN0LmMgZ2RiX2ludGVyZmFjZS5jIGNvbmZpZ3VyZS5j
IG5ldC5jIGRldi5jIGJwZi5jIFwNCj4+PiDCoMKgwqDCoMKgwqAgcHJpbnRrLmMgXA0KPj4+IMKg
wqDCoMKgwqDCoCBhbHBoYS5jIHg4Ni5jIHBwYy5jIGlhNjQuYyBzMzkwLmMgczM5MHguYyBzMzkw
ZGJmLmMgcHBjNjQuYyB4ODZfNjQuYyBcDQo+Pj4gLcKgwqDCoCBhcm0uYyBhcm02NC5jIG1pcHMu
YyBtaXBzNjQuYyBzcGFyYzY0LmMgXA0KPj4+ICvCoMKgwqAgYXJtLmMgYXJtNjQuYyBtaXBzLmMg
bWlwczY0LmMgcmlzY3Y2NC5jIHNwYXJjNjQuYyBcDQo+Pj4gwqDCoMKgwqDCoMKgIGV4dGVuc2lv
bnMuYyByZW1vdGUuYyB2YV9zZXJ2ZXIuYyB2YV9zZXJ2ZXJfdjEuYyBzeW1ib2xzLmMgY21kbGlu
ZS5jIFwNCj4+PiDCoMKgwqDCoMKgwqAgbGtjZF9jb21tb24uYyBsa2NkX3YxLmMgbGtjZF92Ml92
My5jIGxrY2RfdjUuYyBsa2NkX3Y3LmMgbGtjZF92OC5jXA0KPj4+IMKgwqDCoMKgwqDCoCBsa2Nk
X2ZpeF9tZW0uYyBzMzkwX2R1bXAuYyBsa2NkX3g4Nl90cmFjZS5jIFwNCj4+PiBAQCAtODQsNyAr
ODQsNyBAQCBPQkpFQ1RfRklMRVM9bWFpbi5vIHRvb2xzLm8gZ2xvYmFsX2RhdGEubyBtZW1vcnku
byBmaWxlc3lzLm8gaGVscC5vIHRhc2subyBcDQo+Pj4gwqDCoMKgwqDCoMKgIGJ1aWxkX2RhdGEu
byBrZXJuZWwubyB0ZXN0Lm8gZ2RiX2ludGVyZmFjZS5vIG5ldC5vIGRldi5vIGJwZi5vIFwNCj4+
PiDCoMKgwqDCoMKgwqAgcHJpbnRrLm8gXA0KPj4+IMKgwqDCoMKgwqDCoCBhbHBoYS5vIHg4Ni5v
IHBwYy5vIGlhNjQubyBzMzkwLm8gczM5MHgubyBzMzkwZGJmLm8gcHBjNjQubyB4ODZfNjQubyBc
DQo+Pj4gLcKgwqDCoCBhcm0ubyBhcm02NC5vIG1pcHMubyBtaXBzNjQubyBzcGFyYzY0Lm8gXA0K
Pj4+ICvCoMKgwqAgYXJtLm8gYXJtNjQubyBtaXBzLm8gbWlwczY0Lm8gcmlzY3Y2NC5vIHNwYXJj
NjQubyBcDQo+Pj4gwqDCoMKgwqDCoMKgIGV4dGVuc2lvbnMubyByZW1vdGUubyB2YV9zZXJ2ZXIu
byB2YV9zZXJ2ZXJfdjEubyBzeW1ib2xzLm8gY21kbGluZS5vIFwNCj4+PiDCoMKgwqDCoMKgwqAg
bGtjZF9jb21tb24ubyBsa2NkX3YxLm8gbGtjZF92Ml92My5vIGxrY2RfdjUubyBsa2NkX3Y3Lm8g
bGtjZF92OC5vIFwNCj4+PiDCoMKgwqDCoMKgwqAgbGtjZF9maXhfbWVtLm8gczM5MF9kdW1wLm8g
bmV0ZHVtcC5vIGRpc2tkdW1wLm8gbWFrZWR1bXBmaWxlLm8geGVuZHVtcC5vIFwNCj4+PiBAQCAt
NDM4LDYgKzQzOCw5IEBAIG1pcHMubzogJHtHRU5FUklDX0hGSUxFU30gJHtSRURIQVRfSEZJTEVT
fSBtaXBzLmMNCj4+PiDCoMKgIG1pcHM2NC5vOiAke0dFTkVSSUNfSEZJTEVTfSAke1JFREhBVF9I
RklMRVN9IG1pcHM2NC5jDQo+Pj4gwqDCoMKgwqDCoMKgICR7Q0N9IC1jICR7Q1JBU0hfQ0ZMQUdT
fSBtaXBzNjQuYyAke1dBUk5JTkdfT1BUSU9OU30gJHtXQVJOSU5HX0VSUk9SfQ0KPj4+ICtyaXNj
djY0Lm86ICR7R0VORVJJQ19IRklMRVN9ICR7UkVESEFUX0hGSUxFU30gcmlzY3Y2NC5jDQo+Pj4g
K8KgwqDCoCAke0NDfSAtYyAke0NSQVNIX0NGTEFHU30gcmlzY3Y2NC5jICR7V0FSTklOR19PUFRJ
T05TfSAke1dBUk5JTkdfRVJST1J9DQo+Pj4gKw0KPj4+IMKgwqAgc3BhcmM2NC5vOiAke0dFTkVS
SUNfSEZJTEVTfSAke1JFREhBVF9IRklMRVN9IHNwYXJjNjQuYw0KPj4+IMKgwqDCoMKgwqDCoCAk
e0NDfSAtYyAke0NSQVNIX0NGTEFHU30gc3BhcmM2NC5jICR7V0FSTklOR19PUFRJT05TfSAke1dB
Uk5JTkdfRVJST1J9DQo+Pj4gZGlmZiAtLWdpdCBhL1JFQURNRSBiL1JFQURNRQ0KPj4+IGluZGV4
IDVhYmJjZTEuLjVhYzViNjAgMTAwNjQ0DQo+Pj4gLS0tIGEvUkVBRE1FDQo+Pj4gKysrIGIvUkVB
RE1FDQo+Pj4gQEAgLTM3LDcgKzM3LDcgQEANCj4+PiDCoMKgwqDCoCBUaGVzZSBhcmUgdGhlIGN1
cnJlbnQgcHJlcmVxdWlzaXRlczoNCj4+PiDCoMKgwqDCoCBvwqAgQXQgdGhpcyBwb2ludCwgeDg2
LCBpYTY0LCB4ODZfNjQsIHBwYzY0LCBwcGMsIGFybSwgYXJtNjQsIGFscGhhLCBtaXBzLA0KPj4+
IC3CoMKgwqDCoCBtaXBzNjQsIHMzOTAgYW5kIHMzOTB4LWJhc2VkIGtlcm5lbHMgYXJlIHN1cHBv
cnRlZC7CoCBPdGhlciBhcmNoaXRlY3R1cmVzDQo+Pj4gK8KgwqDCoMKgIG1pcHM2NCwgcmlzY3Y2
NCwgczM5MCBhbmQgczM5MHgtYmFzZWQga2VybmVscyBhcmUgc3VwcG9ydGVkLsKgIE90aGVyIGFy
Y2hpdGVjdHVyZXMNCj4+PiDCoMKgwqDCoMKgwqDCoCBtYXkgYmUgYWRkcmVzc2VkIGluIHRoZSBm
dXR1cmUuDQo+Pj4gwqDCoMKgwqAgb8KgIE9uZSBzaXplIGZpdHMgYWxsIC0tIHRoZSB1dGlsaXR5
IGNhbiBiZSBydW4gb24gYW55IExpbnV4IGtlcm5lbCB2ZXJzaW9uDQo+Pg0KPj4gRm9yIFJFQURN
RSwgcGxlYXNlIGFwcGVuZCBhIGRlc2NyaXB0aW9uIG9mIHg4Nl82NCBiaW5hcnkgZm9yIHJpc2N2
NjQNCj4+IGR1bXBmaWxlcyBoZXJlOg0KPj4gLS0tDQo+PiDCoMKgwqAgb8KgIE9uIGFuIHg4Nl82
NCBob3N0LCBhbiB4ODZfNjQgYmluYXJ5IHRoYXQgY2FuIGJlIHVzZWQgdG8gYW5hbHl6ZQ0KPj4g
wqDCoMKgwqDCoMKgIHBwYzY0bGUgZHVtcGZpbGVzIG1heSBiZSBidWlsdCBieSB0eXBpbmcgIm1h
a2UgdGFyZ2V0PVBQQzY0Ii4NCj4gDQo+IFNob3VsZG4ndCBkZWJ1Z2dpbmcgb2YgYSByaXNjdjY0
IGNyYXNoIGJpbmFyeSBhbHNvIGJlIHBvc3NpYmxlIG9uIHJpc2N2NjQ/DQoNClllcywgbXkgY29t
bWVudCBpcyBhbiBhZGRpdGlvbmFsIHJlcXVlc3QgYWJvdXQgdGhlIFJFQURNRSBmaWxlLg0KRG9l
cyB0aGlzIGFuc3dlciB5b3VyIHF1ZXN0aW9uPw0KDQpUaGFua3MsDQpLYXp1Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
