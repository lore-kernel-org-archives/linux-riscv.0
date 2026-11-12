Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F43606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zL6ABIuN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=htecgroup.com header.i=@htecgroup.com header.a=rsa-sha256 header.s=selector1 header.b=WoHyZ8W9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YfBkbQX4Dl5oNI3kpHGQYARlxrkTuOl/l7wtFrZ2e8g=; b=zL6ABIuND5pkoC69rbiIyDMNAL
	HQJCMW2s8m5eiJDwfm01g7E/bD94Pe+wRzmmM4wP90784aegMZLFJ2BOiZwLjaKMRDqtXsZz+99iE
	3qVGyj54fRUP+juDJ9MJUTD74I20yTeuvzjyV9ypSLHSayPFWCxuoonQVcC5yMb2tfN4ZkVRvumvT
	yusSr/VxsjCGhgcgMIh/IjORT724TyyEkC6KmIgp8b7+aieTpkS6pCBUfnam2nYkXjsJ7repRBvsV
	gBdWJ99MFXofGLSupF0yg6Daxhhd0PimrCJUpT1wnaFPPz1k01kRdfh4TVtJ76SMpV2cALcMV0X8C
	3LqeFIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRX5Y-0000000AWCw-29Fa;
	Thu, 12 Nov 2026 15:51:48 +0000
Received: from mail-norwayeastazon11023118.outbound.protection.outlook.com ([40.107.159.118] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRX5T-0000000AWBu-3oUn
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 15:51:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFQjYR9IO2yTlyTNrZZefyDKpeOLZ+0F5h4EY7QXF3Z/pPwZc/wdwq04fiteQCL4ro/SN913ttmpgZEmF0xPbZncAgzilK5iVgWjl0PQ8URyAPjaTLh9yCdffiaIGImPsmX9ocfVKaF7/6LNFlC1EGXK97rvJ4norUK8HM0D4TQlwXGXQgRklQXxuVWuCBBTj0ycbxHZ7N6nQOvbOMHNM4Ye8gdGnZTx/DdvXpcmz+W5PrwaVOXspLily3lE/13n1+UStFUHki9d6owvLX8I1QkgGtq/ngHnv0rzcwg5WYP7g2xMA7fUo7HGzpAParXdYbqWB+ECEmgFwKR0UeGwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cG+fkKv/SnyVehzUt0wDIGIvyrN0MNADD00XoizUHD0=;
 b=aRQ8Vvl3HOmyt/Yy+XfL/TS8MjeN/DsKvhFA8athbEBlZ4XekzwPUt7xk89EAmBn03m/YBZm1jW8X1Kenl06R7kLBL92uVSzgFNiF6l7NLQ+6+Qt9EfvQsPAFyOelmOiIQU6XM7qRO/Nu83lFdDue+Xre71AFpa3yqLD9XP0sGOjuTRUtt2ot5zQqsN/kIJDr5qHBb3hH2bcgmGC8v07a0a3T6ynM+/K5dIncrcbg37F/DK9iFjQzEQjb0u4BCOnAWfivdMrUEWfdrv9OF/IaLd62VSRwDVugmR5XFj1Ro8s8k6hX3ruu5KOqt7fk3yIHxjQqGPmv4HK/RlpEI8CwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG+fkKv/SnyVehzUt0wDIGIvyrN0MNADD00XoizUHD0=;
 b=WoHyZ8W9J8iXUkqHzhi6qkyjGFTeLaECgjzt1TqejfNmfwXSo+HSdKDqjgah5lqPtL47PG/bcC0q4hVzi37Vvjrq7ZhUWcHb+22qeir/j5NLBYIjG88qpQtLglo6kjX/8lH5nidK3PcAuRWKf1+IIyFpmlFn1sAUX+SrxIYGtFW7TFaXoVh8rV63xOmxz1jsn0pgccIsFW2Qkp/HFBcCYL78I2sC1LWTUjRKZ76FgH6TLMZpMLHsHq+bh+i7iCxJJlKSK/b3saTtR7OLc2M5XkCjzA6+D3C+mRj5K106lCWClJNP6BBg5gniIyF7PrFItGslbwWtmGCk+C0XQmVqJw==
Received: from MIWPR09MB510283.eurprd09.prod.outlook.com
 (2603:10a6:290:de::18) by AS8PR09MB5854.eurprd09.prod.outlook.com
 (2603:10a6:20b:573::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.14; Thu, 12 Nov
 2026 15:51:37 +0000
Received: from MIWPR09MB510283.eurprd09.prod.outlook.com
 ([fe80::b132:b89e:3800:bc14]) by MIWPR09MB510283.eurprd09.prod.outlook.com
 ([fe80::b132:b89e:3800:bc14%5]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 15:51:37 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "palmer@sifive.com"
	<palmer@sifive.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"pjw@kernel.org" <pjw@kernel.org>, "radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Thread-Topic: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Thread-Index: AQHda6WlvwfN8s5mzUCrb+uxiI8exrcc4xMAgAvM64CAAfQbAA==
Date: Thu, 12 Nov 2026 15:51:36 +0000
Message-ID: <066f69f8-51f0-44e2-afae-1889b952eb4d@htecgroup.com>
References: <20261111-underage-distant-87bff35745b9@spud>
In-Reply-To: <20261111-underage-distant-87bff35745b9@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MIWPR09MB510283:EE_|AS8PR09MB5854:EE_
x-ms-office365-filtering-correlation-id: ab9a9b25-3e19-4129-36a2-08df40d4d592
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|261009223027099003|56012099006|11063799006|261026121527099003|10067099003|38070700021;
x-microsoft-antispam-message-info: Pvf7Zz8BhzkzrCH77loVSNDIjVRE1PGhvpBaXlryQEvBmyeherYW3qAWpuDRLV0yasef+dSRTgi7xVmThdtNS8/47GdChCZM3gxS/pfORSqNNzWmb5pxqBpZ1Eq/0Ozl2DXTS2jnw8K10rsJAaYqVOVYd0A48FhHH8fxBAqZzgSmarQpAJG3EmbNyVPPLdc9cqJtD/l/22ADIsMHVzGn15IIb2t6qKbo7Wt88mCO13cxlybCrSAigCTY41lxkhnxnG5V6zhf1nbqnx7JKXsR/SeFckkf+4zYDZsxR7vmed+5dawnyFoMwkgVfX2UCMqAmKEh8X1BwB8PynL2/FPT5qJoHBxvHXOPq5Dh6E3bmTXKvymNwQgvl75ZouHrzXL45jH6OI0BY7Bi4tGqez9MNkHp7ilJ3jt8mKsWCPVJImAYhSADjhQAjUwMt8UBuACiohZ4liT5oTxZaSzWE+KnwHkc00BVyYOWXf73ukQPOerJjh68AoTrMYFHi+Xb59dAzmYrZYu1Xc8KefLzDuxR2GAWthcmdNlseIgKmP1GA2YPZF/tqDAsjIFNtWLW6zLrJzkZBVruyRLI0ew5a/zdxbQ3V2lIS1AZwa//epmOV51GjaTs3DuGgIYVkTMLxKZWgDfo2zr02UXx/RQhWy4XPAyFIWs1VNIt/K8XxROpHqk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MIWPR09MB510283.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261026121527099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkJTd2dCRTg5Tk0xcFo0enAzOG9lUGZ0anhWeU53ZFhTUWV4bENlOVhMcmg3?=
 =?utf-8?B?UjF0ejFmamhsUDAyZ2dJenY2UW1TZHA4LzVkNjFrQjZHK050OHBqZTlTU216?=
 =?utf-8?B?c2dsbnJ5dkhHYk9rRE1UV2dFVy9heEFUam1KUmVJU1k0T0pSZit6bFNPL21p?=
 =?utf-8?B?Y1NaeHJrRFV1T2FwdzFScVJXQS9RNVZUWjU2cUFlL3ZzaVZsZUJNWFdZQVND?=
 =?utf-8?B?Z3FBa0kwMWFLVFp4eldJWTZpUk93aC95eFNzKy9ESnlDYWt4N2FCM1FDcDd3?=
 =?utf-8?B?ejlyU0tWWmJUWW9zR1RISHBTaTJkdVBrK3BFbVhad2JmVzVhK1dMczh6aVRv?=
 =?utf-8?B?UndyT3FvdFVxYTJWL0YrOE91NTRZQ205Wk51WFJ2Ti81TU9GMkRQRlc2OHB5?=
 =?utf-8?B?WWlRalA1Qzk5QllWWDd6T21oWVA1SFRTN3FkQyt0a0xqYk5HWlg2N283Vzhj?=
 =?utf-8?B?Vkhid0EvTEF6Q0JsZnRQenNiaDJOcktlR3V6clNENlJIQzJ6WU1vdzJ5Ry9R?=
 =?utf-8?B?c0w0OHBCYXBhbS82T1A4NVQ5SUNRRC9pYVhMQUg2Y25obzE1RmF5OVZ6ZkYx?=
 =?utf-8?B?ZDRaVTZjeThlNDdhSitNN3RQUkxVRlBkdjBDR0x4MGRJbmE3Vi9Wb1YrOWRh?=
 =?utf-8?B?WGtHUS92dWQzMjdQaXVsNTEzMXEzanRkL1JRWTY0NnoxVTQyblJYTFljL1ND?=
 =?utf-8?B?ZEdCVG1TVU5iSlRKelVzS0FDeDk3elhidkJ0MXVMRVZTZ1JuY29CM0FYODNa?=
 =?utf-8?B?VXlDNVhNdDl6MUdmamhEQVB4di9RRjlEb2dkTFdyQkJMcXJzU09jU1g5UFhB?=
 =?utf-8?B?S2Q2ZENNemFaY2ZIMEFKaTl0TkJPRHYwNytjWktGSFpnR05IUVhweHZUSXh6?=
 =?utf-8?B?QXlSNXEvcHhlcDhTMldFZllORGd1T05ldExVK0tSTTJ5dXpmUnVYZGphbTdk?=
 =?utf-8?B?SHJrVEVCU0gwNFpGNmpWOSs5T3lkK0dGT0VBRm40WjJnOHRxZU5iWW0wb2pt?=
 =?utf-8?B?MzZsR3d5N1hmSmhQOXdGdDdGRnZyTTBDbXp2MlNTYWlGVnJGNVRLeGJ2cXRv?=
 =?utf-8?B?UTBXMXBPMVhvaFFmQ2g0WVhRRmVJWHV0L2R5aDRWa0xVeGhWU3hiV1VPMmNI?=
 =?utf-8?B?dFdlQkxjQjVvY1lPNEN2U1dEZW9qR3FMbzFydnhraHhaYTBFcC9EWld4ZWlx?=
 =?utf-8?B?Z1JsamtjbE9rc3BVV3h1TXdXZ1dEa3A2U3VsbmNEZ2dHc2gzRlRIU3l1UEtK?=
 =?utf-8?B?L1lycFhPVHJJUlljYXJIMkNNc0hWQUVjQnhmTERVTENYUzJVekdsaDE3WVgw?=
 =?utf-8?B?R3BPMzFjaDEyY2NzUDhHMWw0dEhyeFg0VjBrb2RRT1V2dDdmK2J4UlJlbHRk?=
 =?utf-8?B?aVNSUDlnZ0s3YU9XQkNoNW1qL3JaOEdHbTZxR0M5Q09HWTRJeEhpZUZ5ZUhG?=
 =?utf-8?B?M3hzQnlLTTZkT3lDa1oxVm5FZDlFRENBQXVnT0FrSWEzbzlOcmE0RU5LSlMr?=
 =?utf-8?B?bFUwa0hkZnZrZ25HUDVuNTkwOU4wZzVRdCtLSkhpMUlPdkVtdjdZL0hObThM?=
 =?utf-8?B?dkJxbXhQejFIMjlBdi84VGRGSXowSkVHdURZTHdlN0I3VmtPSlBqYURJeitZ?=
 =?utf-8?B?Q0hNUlJuSHF1MTBjTjB5SFNRTkFUV21BdDd2dnB2TUl5ZEdCcFRhMk5JQ2ZT?=
 =?utf-8?B?Q21uNFFISzNpUjY1TUxWc214ZlhqbnJPc0FXRk9rcGgyZFRjQ2RYMUhBN0Fi?=
 =?utf-8?B?VWhxRU8yUFdLQUlZWnc3V2VCM3ljQzBiMVpoWVFnV3lSYkNrcVR3MXVUbmQv?=
 =?utf-8?B?ZTlLOGdreldpN0ZPcUx5UWxDR0UyVEx0THZHSEZJVldyVDdHUDZaRzh1NEJo?=
 =?utf-8?B?NWFJbzRLMmNpTVJ4U0JKTU1DSXJTUEYwU2hlYmhrZ0RoaXRoSXVUMURzTXZT?=
 =?utf-8?B?d0JzOC9IMUtwdzhEZ0JPM1IzYkFlV3FtRjRPTUcvOEJ1RlNFTXVpeGprSEtF?=
 =?utf-8?B?b3Jwc2IxVTRUc1NOOXhVY2lzL21QSFVYbTMvV0o3WEJQQ2VWK3RWYjZqQTRS?=
 =?utf-8?B?TzN1cFpzYk9mOExmeGlCNTFsaUFnZXBpS2Y0TTdwdXVxTjM4TTNTdkwrWUVT?=
 =?utf-8?B?V0M4QmlGU0hXWjZJUEhhQ2VUS3ZHMXA1dmE4cnJEbUxLUCtnTGNkNnV3RzVW?=
 =?utf-8?B?dm5nRC9zeE50S2NtSm5aUytQdmVyUUQ5cXF1dGZlcVhRSUlBYWdkdSsxTVQx?=
 =?utf-8?B?OE1WbWFxMm1EYjR1WUk2Zno1VE1LVzl4N1pxVjRIcE5iSWJpK2xVVlR3TEZB?=
 =?utf-8?B?eU9rc2tWemhIaUdicEFDa3ZlNXQwUTB6SGJHdGZ0eWhJTm1CSW85NTFIOTJq?=
 =?utf-8?Q?UnIDDGuOOoJdQLd8=3D?=
Content-ID: <43C82DA38DB77346869BB761922741C8@eurprd09.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MIWPR09MB510283.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9a9b25-3e19-4129-36a2-08df40d4d592
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 15:51:37.0055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hM+e6fOCuDDT/kmSxP15+Q4RIAOT+UOAtWg356H4kwMH1m6jpq79dDrEOydSbj9NXFKmSV6/1VdaryoVZ6K7vi4QweuaBv10/ftgM/xSH7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_075144_405936_244CB36D 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

On 11/11/26 11:01, Conor Dooley wrote:
> On second thoughts, we probably need to be careful about the reg
> ordering here. This binding has always required that mtimecmp be "first"
> because it was the only let me rescind my ack for now and think about
> what the correct thing to do is...
I'll send the v3 with the enum approach you proposed in Joel's thread [1].
Also, I'll be changing the compatibles from gf,mips-p8700-* to gf,p8700-*, as discussed.

Links:
[1] https://lore.kernel.org/linux-riscv/20261111-paralyze-ellipse-dfc194dbe39f@spud/

Best regards,
Aleksa
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
