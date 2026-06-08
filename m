Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8039CD8C92
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwoez/gUMbszP0tNKPzWF7W4DBku70KhdMy2HhySbvw=; b=2ZifqKMbqtCZ6w
	hOyeUp3GBfbzg/V1gJ9DXaXtAUBzdO3TWthfLGGrqzRDTtk0p5fromnRpTPTBIOKjK6+Lnm6/hrpp
	YEB32+QMzRVasqZy1bBbOQieKHOdvZOuBoJ4+Nflpc1hOslV6NxTvBIL/n2LiiW7t7gYer8xw8yv7
	HjoXOWEkLc2HpKIgI9S4raR31rbBiU8EA5ZZw9d0rOqaG6hRQYod5MRI7au+gW/vWNSXwu7vVrhop
	xLYAs6USSZu1O+p6UUwS60lPHmlgoR42sv+CBe1Z3BndcDH6FShBjrLyKfoLKIFiMCDEzc0E/L2tz
	Jp111tVaJr8hiYhSuh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbeu-00000003vmZ-217S;
	Mon, 08 Jun 2026 15:13:00 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWber-00000003vll-40RM
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 15:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKYhzgLHHZ9v9GRAPVEGGTxYvZhfDCn7w1VxQ/vIFRFgdXF6/DPK7IzpoxGvpj3CHBFhZnK5cQXoqTQoJCq6IhNXhojRvdRzOqlGTg0SWMaKjyZ8J8XnvJQeTR1ZBXlRN0NlwtS9S88s6/uTJxDVXcOg6ep1sCvDTWmsDE5CgauSGFVGk7SZo+T2hNSsevvNIBluVrupYSRzpZJxTWZMfHrf1Y2d0H89CUsVGIBV8PTFI2krt5eFus3aHV6ayzOnd3mQUhhYmY0p/Q2aXICPZnBQ8nj+Ob3TxCc+yBFEKossiUiUj+uo4GaZ3VnRn8Z0x8PHjmRyscVae3RrimfBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9qnNACnqe1cj4vwVNZUXh7zy4Guh2X3WoITeNjhYT8=;
 b=i1lopcDizVtSdgEJ6HTMQM50I8I7AtT3milrqrSg34at0h7moVJ1ktOyevpUV2g4Y7tXzMddg1Ojos7znRrwNvWlq2GumpduIJa0TZPdHP8NRb4AdMGclpgTA0L2coE++2hJcNMw3juQreMtjlBGRjcaxJpBspP5G/DhUXzPIQAFxKIrG3HaXa1UL6WOJdXexdsP8YrUmQUs5OHjoInI6s+dBGILpjDRsPxXTxcUy+fySIt0Ggj07ebgQqPcuuXMeiqFbDclcc4G0keoQu4VehErPBeJlYQBsOZ/XDtBmF6XJqt+4iV/Dv83/KHzGo+902wosl0hKSfDIJaj5cls+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9qnNACnqe1cj4vwVNZUXh7zy4Guh2X3WoITeNjhYT8=;
 b=Dj3jQJ7IFSPiw1QpXmtWD6mGjsyVp6CEARpxFpB4UhYY1u+z0BMJpR9jrv4G8ZO0eg+QkF/ENW2obl9vx5Zk4aYpU53UHoj6a4kXVkiRajQbDim7xgfnUvVKgGdXcBigE65sYKwIuzln8ZliJR6eKK+zDl3IgoEL0UILVxLzNpIzFNJsyYD/YK3L/XXarHkKx6lKPQ0F+3LDHoGOBoyUVyFcjbr12sB3mu4mFMZQJ4RpSdUjvCQw/A4PIp9kkgdCElmmJZ73Dx8DeaMdDctzm9Vq0NAazXL1uChaD4hBk/V+J6mCWefBc2L50rj010ZIMI8edMVJgr+847SyDdefWA==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by AM7PR09MB3926.eurprd09.prod.outlook.com (2603:10a6:20b:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 15:12:48 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:12:48 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "macro@orcam.me.uk" <macro@orcam.me.uk>
CC: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, Aleksa Paunovic
	<aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>
Subject: Re: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Thread-Topic: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Thread-Index: AQHc4TShRVA0u1oQIEC9XFnIF1W2R7YMSXOAgAqxjYCAAv0RAIAa+AkA
Date: Mon, 8 Jun 2026 15:12:48 +0000
Message-ID: <e964f45a-7f6a-4fb8-b9ba-b79dae6d687c@htecgroup.com>
References: <alpine.DEB.2.21.2605221220540.1450@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2605221220540.1450@angie.orcam.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|AM7PR09MB3926:EE_
x-ms-office365-filtering-correlation-id: 97768de0-0263-4b95-5386-08dec57066c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|11063799006|56012099006|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: gn/DvFcYELGQ99xVJFzVdANOv7lxztqk1RqMrA3aC+CPoxi7MErYx0+jYTy0KI9gtw+I42RM6oLXrKZ9XCHXBfXtTBVCywEDm3PCKsORQfvRASKy/zfq8uBspwa5fEozJL8QNT4ehA/rVnSZODIkO2an3FEdi42r+UV20GYxotoMRsSY5m9s7Ewy9Vs4PgUfzZ5bhfmwpCAqK5uHBxIk/e6mrXs1618YCyL+O5tnxeJEPsjSTgGJYzjEKLZMhPYhQxok7SUj3M3BAhBNHFqTbkHe9/ssXchPhFpJWW+rM4NBdKP+fUZz2NSBHGGYRMT1VnN2cK71XQweAVBv/7aBKu+42vCxKGym+6xs/By2lhlVtF6YMfpgZ2pY8vImdmFgzjoD6nia6zWPfi9ElDxdBWyVVOeVIZvoOKNqfTOTnHm+3yexbPFmtpvmamFKBpWKwvSNmglagq5Bzdxoqz4FjmdNQqGnGj3VLtHAK9dB6MyqqG8vf3jVhRjkjZa7jSMyPK+u0L8wIYMgIvY3HVOOq83xuR5sy7iNTtSfTd1QdeojMhb08E74oNLSpiJVeCVqKSDb/mNypjKMN+rnGFfUUehB0U5FrJin8pxPa1/mXIWWj3i+bEQy/Rj/pvLNR8pJQLSDr+yJSZFD5FJN9CdMe8A+Lsa13Fl5IetV9xCi8M10UMQSdR35DATDCpmMCeBCxMYkoKNxw7KrjbCDOUBGJFvYkBA61Md7Dz5PVLOlnIDH98uSHY1Hab2Eimc/Ew0+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUNlNlBvd2JtWDM0L2JsNURFclIvR2JzZ3NzdVV2SjJuY0tFazlaeVZmNnpq?=
 =?utf-8?B?bURuN0lOcmdBQitEdHE3aUJ4R1ZXczhTTzkvc2RpeGdtNnVtYmVmY2RsSGc0?=
 =?utf-8?B?Umt3RkYvY0NiS3VzRlpNdU1MenU0ZjhGV0VBc1FudVRSeXNKWTdaNnJ0b1N6?=
 =?utf-8?B?d3JoUEJoTTIzVjdqUGkxMzVuVkxxVklHOGRQS0RGVy9ZMTdwMlk5UUpTZHh3?=
 =?utf-8?B?K2lkaEx5UTJ6R2dadUFrRjRheDlEbGY1SGRRL0ljMmhOajVnaDR2SnNUUXdS?=
 =?utf-8?B?S2hmOFFkZUJKREhIL00yNU1xY2ViRS85ME44L0pXakgwQnZqek9GRnFudXFK?=
 =?utf-8?B?K2tSVWtwejhHR2hDUVcrSGpTVzRJcWJ0U3h1UkNkT2x4eE0zbnFNTnJUTW5n?=
 =?utf-8?B?Yzl2R1gwME9ia293cXc1UEw1d01QS1kwNTkwWXNuVzhxbFd3TUVZWU9BaFpI?=
 =?utf-8?B?TkxZaXFyMEFkYTZ2MVNJbUd3azdpeTJlMnVZN1VXNlBXQWpzMXlMLzRoMXhX?=
 =?utf-8?B?QU9WS01MTDBCNlRSeFg1Wm1WT1A4Y1FnMi9nWnk2aUs1SnZOWGtEa3k4VGJx?=
 =?utf-8?B?RXBSQVdJWUFsc2w4TERrdGNxWDloaWwzNnJyTlB5ZlFDbUtHU1h3VXViRHVr?=
 =?utf-8?B?K0d3b0h5Qk1EeU5oMTV0bEFoTWp5WFhFNUw5VXVoS29aa3pwanphWEdJMEhV?=
 =?utf-8?B?Z245VkR3c1Rod1dKeTRINlVUaGJVWHBHVWU5ZEtQN05leC9ONlVrWTAxT2FV?=
 =?utf-8?B?azB0Rlk0aXdDekhsWWhxWnpRRG5Lc29GbkFidkVYL0tYRWJzYUpPYTlrTWpN?=
 =?utf-8?B?Q3ZGOHBmNTZDU1J4SFhheFFpRUJNeHR2UWhDK2FadjVOQlhiSG10WXNmZDN2?=
 =?utf-8?B?NDFyVU1qb2dZTVFVVUt5dzIyRGxUL2JZNm9hNzI5SFRxd1ZFUjdXa1RzUGQw?=
 =?utf-8?B?UFJmanlTQXBkRWJpbkZLSzRhTHBFNHhsdFdtOThVcGluMFA0SThrNjVwNldP?=
 =?utf-8?B?Zm9FWnVlYm9OTk5kMjhMYzdmWGlTRlJiclh0OFNZSWtkT05DMmlEWGJFNUlG?=
 =?utf-8?B?M0tOTFNhYjgrK1daQVFIZ3pSMStNSEcrUDB4N0x6bmxTRzgvNGdJNXV6anNR?=
 =?utf-8?B?SWdFVWZEWVo2N0xBcnZGZnFyV2VaVVE5QVNqeUxDR09IcGpCMklnWHpHMSta?=
 =?utf-8?B?bDlQRml0eDVRd0lPRWRhZnJCQzNhV2FFTXQ1UWx0b3JvbzFZSWp4TVRWLzdJ?=
 =?utf-8?B?OXVCeXdNbVZlditRRmJSMWdZQlRiOG9YTTg0MlBOS0QySmNhSkQ4UnFneFJX?=
 =?utf-8?B?VURpcFppK3VnOC9oUmVyeUw3VGZjY1FPWVE2VURNUUZBSXExVjB3bUl4NEtv?=
 =?utf-8?B?MlJGQkViQm1ocTVDaTBvWStzdiszZlJLZm1TSEN3VnYyRStOZ3hpOUlpcEFp?=
 =?utf-8?B?emNkdHkxTTlYZWRibVZOZG8yamJubnFXN01tL084azM3dUlJV3RUeGdmcDlQ?=
 =?utf-8?B?MER2Z01PcU0xaWVkQktFRnNub2FVQVpGNVc2R0dKSWMrWkw5aGllMVQ5T0l3?=
 =?utf-8?B?MHVNTmM3U0xEV0V6RWU5UDNZK0o3c3FzMkVNQ0JHbHEwV3V6SDQwb2NPNm00?=
 =?utf-8?B?R3QyUmlSRGZ1c0ZUZ2hqS04rUExhRGtzd1k0b2IyckwzUzRkNExNOUdValFI?=
 =?utf-8?B?K2Z0NG9Jbk9UYXN6eGJxRzBiMU4xV2NlM2g0ejhRZ08yYWsrdUh2TmNQVVMr?=
 =?utf-8?B?MTdpaW5YL2FrT1lhMDVJdURReW9hMTN5ZGZOY1kvYlFOc2FiYlF6WGJqajNI?=
 =?utf-8?B?THgxeDN3VnVWNk9XQmE0ZGUrTGxhQzdpZUJKSWs5STZyWnVZN0ZzaTNSb2l2?=
 =?utf-8?B?SVpDOGlCazBpK0dtTmwzemJrOGU5Z3ROQjA1V3IyU3pVVERiY3NGOWJ0eHJ6?=
 =?utf-8?B?N3p0amkwMkNaaW1pbXFhZnNnOHpCQm5CaXJ3STFtalZZdEV1b1hnOE1RNFdO?=
 =?utf-8?B?b1FRSTFvSzJLTFc4bmNJR25veEloUGw3cjh4K2YwTndXMTdvc0NSKzVFRjE1?=
 =?utf-8?B?WW9nand2VTZkZndMc0tmaXNOaTgyQ1FCZ1FtemZQM2tWQjBSK2tlTVdHQ2tZ?=
 =?utf-8?B?bGNjd0VNemZoN2plS0VndjJ0UUY0NHoyUHV2aUZTOXphRmEzRWRqcy9VbjBM?=
 =?utf-8?B?dTdBU1RseEJnYW9EKytHbkROMEZlSWJNdFl0L3JkM2lrQTBXbEFIUnhmRUd1?=
 =?utf-8?B?cVZhZjR1M0xNaUt0RkxJUjNDOWdhZVkvMEtoMUVUR1JFejJYNml2MDRzczdZ?=
 =?utf-8?B?K3NhMGhNem0zZ3NoMU9EbVgvSmxicUxYT2hxT21Yd3MrNE15a2FUOUNqSzdU?=
 =?utf-8?Q?hM0EEw5RA9UiobijyLI0WitFG+alnaBU/TNOR?=
Content-ID: <95767F217F82014D9973EDBB830C9812@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97768de0-0263-4b95-5386-08dec57066c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 15:12:48.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 239sRYi4G3+Q9dhigxUkS4XwJfI5XhBZnrI9gFebPhOOYcvS+WijMkMziihGep5wM8FQzCTA6oTjYH8GPir4b0fZjg7qRHydb/uVQLOvt1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_081258_015113_DDDBB985 
X-CRM114-Status: GOOD (  10.90  )
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

SGnCoE1hY2llaiwNCg0KT24gNS8yMi8yNiAxMzoyMiwgTWFjaWVqIFcuIFJvenlja2kgd3JvdGU6
DQo+IE9uIFdlZCwgMjAgTWF5IDIwMjYsIEFsZWtzYSBQYXVub3ZpYyB3cm90ZToNCj4NCj4+Pj4g
VGhlIE1JUFMgUDg3MDAgaGFzIGJ1Z3Mgd2l0aCB0aGUgV0ZJIGluc3RydWN0aW9uLg0KPj4+IEhh
cyBNSVBTIHB1Ymxpc2hlZCBhbiBlcnJhdHVtIGZvciB0aGlzPyAgIElmIHNvLCBjb3VsZCB5b3Ug
YWRkIGEgbGluayB0bw0KPj4+IGl0IGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbj8gIElmIG5vdCwg
Y291bGQgeW91IHBsZWFzZSBicmllZmx5IGRlc2NyaWJlDQo+Pj4gdGhlIGltcGFjdCBvZiB0aGUg
YnVnIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbiwgd2hlbiBXRkkgaXMgdXNlZD8NCj4+IE1JUFMg
aGFzIG5vdCBwdWJsaXNoZWQgYW4gZXJyYXR1bSBmb3IgdGhpcy4gQnJpZWZseSwgYSBXRkkgaW5z
dHJ1Y3Rpb24NCj4+IGFmdGVyIGEgbWlzcHJlZGljdGVkIGJyYW5jaCBjYW4gcmVzdWx0IGluIGVy
cm9uZW91cyBhZGRyZXNzIHRyYW5zbGF0aW9uLg0KPiAgU2hvdWxkbid0IHRoaXMgYmUgcmVjb3Jk
ZWQgbmV4dCB0byBhY3R1YWwgY29kZSByYXRoZXIganVzdCB0aGUgY29tbWl0DQo+IGRlc2NyaXB0
aW9uPw0KPg0KSSBhZGRlZCB0aGUgZnVsbCBkZXNjcmlwdGlvbiBvZiB0aGUgaXNzdWUgaW4gdjIu
wqANCg0KQmVzdCByZWdhcmRzLA0KQWxla3NhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
