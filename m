Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D5AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 06:24:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB996503A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 06:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB996503A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vLrJGvCQ2O7Tw2bIgfitr8oW4v+EmwCC1I+Q7AhSWHc=; b=WUUCtGwgWDPrSOWXLqOGvxunG
	x0eLnl0utVWAECOkfu8mQZAiI0a+E3F2l+53J5i4enUtRF2iEyaNiX4pQc+XOgeRUDUK650TJMhgj
	uverAKYNTHKOz5eUrDMqBXc5fGIY9Covt1i7eFvbVvs7tN4EeRzjGSMcvCx/TLC91mbONlGyemE0I
	/s5bIRdx4Bum/nGTDqCwZHQ14vVUlFIwBy7sRWvQeqZGwA+L+ewiodvPCExTL5D7dzE9XIRB/vkeL
	i7usKQR24VgOOBnczZVTVqeGa+axDHYs/2Rt61lecb3Sawkaha2FsDhGuVIJpQVjrlQqlk9u/y5Xz
	oxsRIdENg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM387-00HWIh-5n; Tue, 16 Mar 2021 06:24:35 +0000
Received: from mail-eopbgr100106.outbound.protection.outlook.com
 ([40.107.10.106] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM380-00HWID-Lp
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 06:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5/IISIhGtgmnKaWJ8z1ADomKnrCEuTOKI2Ha9KNxDLrEbN15MxRKMpJIHX1p3iQw+RwAFNdTbvHWbNxwBOfcm0330jSAYS07CfrpQtOTtXfNygN/MsP7IaHNfQzQ+YcSWimaNoRe14RX2J2ZP5PZj/MRrikMF6kAMthNfqOe6QT8kqa79Q+01SKd7y75ii4mAOy8QXutY7xl8ec04hWFq8VmFCX8MJyWSCqh8TtEph9lC/xbfVe47ZdpneDs5QfRNCofFC8UT7LBGg2TaflbpCd51wELn51uxU78pBtC/s00BYT/flB0sHbUAp3izJzNecstAqK72+plYI9mBQ9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuRomCl4RI7Q+vM7GcQASpjxotpf8aJ6LZ55K+wiPWc=;
 b=XU/MkpRKgRVG89vEFmgt+rhN0JlM8yFxroAIyYd9wnE6zFwHJYLjEXKDuCbzLkyVgBrp9UyfI9IeV2qmCufVByf0lUoG0m9h/DD5T6rGsubhwGQo01mQ/FZ5+JOMgg2e/3SdDVB6pG1s4awio+WVID6rOlWxVoOTzrSvBdELn5jHi+M5CCv+N3/n889tL/3k65QcWl2hBPfmzYcF77ZiAKYkNxRc8awIwr8zZMRKbo61nwxpKVTavrVfEbv0Y29dp58ntRzI9eCxIiOFJhw1W9YPQBK+QlpUmrm8rHtzDkdjj+XCRM8OMC/3bcOmjtye5o3Qwvy7tClQePm1u2pDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuRomCl4RI7Q+vM7GcQASpjxotpf8aJ6LZ55K+wiPWc=;
 b=tb+i6BFQJO8vs7aMhlbzoKkqGwYsR/yqi//l88LayAIS8+7biWYuXyKGLL+udL6Zm4afX5N+bYc0F6ih8kEWUF0uPgDvvxTjgFndoOV/qsqzZJGRVxDiGGkS8YZCtvEwCR3yFsaO0ABc/ZW6i6a8kT4OUzJSVseH+MTTgR/K3PA=
Received: from LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:70::17)
 by LNXP265MB0026.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 06:24:26 +0000
Received: from LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b41c:a69:d728:ab27]) by LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b41c:a69:d728:ab27%7]) with mapi id 15.20.3890.042; Tue, 16 Mar 2021
 06:24:26 +0000
From: Gary Guo <gary@garyguo.net>
To: Nick Kossifidis <mick@ics.forth.gr>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] riscv: enable TIME CSR in U mode
Thread-Topic: [PATCH] riscv: enable TIME CSR in U mode
Thread-Index: AQHXBLDR5Yqy8lCLB060sBcPScA/H6p0MAUAgBIf0TA=
Date: Tue, 16 Mar 2021 06:24:26 +0000
Message-ID: <LO2P265MB074925F26234B27EF0D96D0AD66B9@LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM>
References: <20210216221208.2860-1-gary@garyguo.net>
 <e50f40a65f10e40c8d601791c0856cc6@mailhost.ics.forth.gr>
In-Reply-To: <e50f40a65f10e40c8d601791c0856cc6@mailhost.ics.forth.gr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ics.forth.gr; dkim=none (message not signed)
 header.d=none;ics.forth.gr; dmarc=none action=none header.from=garyguo.net;
x-originating-ip: [2.99.171.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4275e622-416b-4478-c3c6-08d8e8442622
x-ms-traffictypediagnostic: LNXP265MB0026:
x-microsoft-antispam-prvs: <LNXP265MB0026F3419F04D3D7FCF44003D66B9@LNXP265MB0026.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fhptfpm4WTW49iM23XQjJXd+JE5unFj8daoAk1kTrQrkWi6hTKgo0phLKBDIDzxbM6b8lYaTgyxeLdj7ijIu9yZ26Kdul15j/ir6UFZLDwXsbjvEtY9Hg/UAAtCozz7KIqkijH+vhMwo4l/qYeEHEsvzzFb4NfOuwpQaBe38vEHNPuculII8oNSWO6OjGstN4oD9xwYXNaFYWisMTbwMdSCI5S4fhK+KVbIPUBiKYTT87aGmajiTaRnzgWVIBf0WwCE/T+kCNvPSr9Izun5o4+gpbmfAlICAUk6/GBfdTbODbS84eMJ2n4ZxJtCoJkUa3AzkJrtEYfnFLaPRL5assTVndgOOqfPRuz2QXKyLxoHWUVNKryhTmp8eoNyBGUyWTU8sLEz2Hy2e/0EqTlhynxEUiRTYb7nRFQ0mfoey7+Kc++G6oe4OxnjiKx9vW853ULDZlfEuyjtEepGXpqBhuzIc5JbmDbhrPD29fMxZITVHXseUcNEmSWhVGsNrJGtWi7UadQ0VV8IV1oh8HVafKv54y1F/jcttv16uIJ0W0llIikwgOslMJQMKSxkxvNiD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(136003)(396003)(376002)(346002)(86362001)(83380400001)(316002)(55236004)(478600001)(52536014)(71200400001)(66556008)(66476007)(64756008)(8936002)(6916009)(53546011)(6506007)(66446008)(5660300002)(76116006)(7696005)(8676002)(9686003)(4326008)(55016002)(2906002)(33656002)(26005)(186003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R0R1My92VHU1dnJma0syNGJnVGhncUJ1R25VMUIyMkZxc1NTc2FRM0NZckRH?=
 =?utf-8?B?dlA3ZUYyWHhkemF2WW5yNnNsWksrNVRkNzRoSTJKV25Jb1JORExSNGhaeEpu?=
 =?utf-8?B?d0RtWXRUalR2RkFxMlJuclQzMU9xYTlZVVdDdm5uT0dpR05JQUFYZDZubE9B?=
 =?utf-8?B?dTlQcXIzZHhsY1NweW1pcFM4d01jeG54Rld4N3hBak5RVkVUVU5veFFTTHo4?=
 =?utf-8?B?WUdPamRJYkdMVWRzR3RyTXZFU29MaEliTEQ1QnpqWnhkQ0E5OHRMNW1reGI4?=
 =?utf-8?B?ODM4bVo1SzZiOThTZEc0VWtPbmRaTUJFSkhPaEFRZDNyM1RsZ2tEQUZaQXRH?=
 =?utf-8?B?L25IU3JOZ25qVlFjN1ExTmJBWGtUZWNqL0hHZ0RpSEV3YTkrNHZtaFlKcmdp?=
 =?utf-8?B?bTc4UmpTQTk4K2NzL3EzU1FZMSs2cm5LTXBFUWlGTGd5cGw1UmdGTXVRb3FB?=
 =?utf-8?B?alJtWm1lc0RFa1hhYzZJWUFRU25EdzBWVDZNUnd1SmdQTmVwYjBuQkxNK3J2?=
 =?utf-8?B?dHh2SmtXZ2orT3UvbFd3Q0FUYitUUEdzUkFWcDFUUzFCRUZzVDNxNjdlazhJ?=
 =?utf-8?B?NUZsVFZwTk1LOTAvTlBqOVUwM09sK1g1N3EvaGZYR1pzak5NYkR1YTZuMnZ0?=
 =?utf-8?B?eDVCNDUrWC9nZ1VWbG81cERRWUdWYkZ2eFBDMVd3SjZEQmVwR0dNUzlScGxK?=
 =?utf-8?B?SkY5eGZLUmg3U1pFaFlheWtyd0pKVVV5RjRRa1pmUGowT09PSXlNUUVVRE82?=
 =?utf-8?B?cVVYWFlGQnd5M3RqTXlxMms0eVVUVUlmQ2JNYkJUM1lFWDJnWW9sTEE0NTRF?=
 =?utf-8?B?NXZrRXg1NmJPSEZBUFFnMzBYb0RlWktIMlM1Q2FoNzVzd0VvaFFEclZlN2dz?=
 =?utf-8?B?VmwvNzB6dE9Ranp0c3VMSTBGM3JuWnhYWUYrRHZkSmNoVE5WcXhrdmFkaHdR?=
 =?utf-8?B?aVlIZlJyTUR4QU5ObEhvdHdKR09UbDJHWlkzeTk5RUdsdERMTTkraVB5TTBo?=
 =?utf-8?B?Nmw1VldBZkd4NXpDUFVtTkhZZ3Vsd0ZoSitwSUlveHp2ay82Qlh1cHVldEtD?=
 =?utf-8?B?Q3BHWlppVm1icGV2TFpiSUlUVW5MM2lDUTRGd1RjL3BJenBQTmVSc3BJT01H?=
 =?utf-8?B?NUpsVFRrWkcxcXp2eG9jQzF1ekdmNWpNYWc5NS9LRnZVVHEwZXp5Z3hYcElZ?=
 =?utf-8?B?YkoxckZqMEhkS3ArWnFsTC9UeFpXRTFJOW5Uc0Z1bTJ5OVhuMG5MRTAzcEdU?=
 =?utf-8?B?SkNPOUx3RWhWV3N6cHFwT1dYUTAydjl1NUhTNVhXZFlTUE4vUUZQTFEzenBr?=
 =?utf-8?B?TllTUVdFYjVERkh6aEF5Rkk4RlJKZTZFUEVjQXZTR05IWjdZcThjSUhETitD?=
 =?utf-8?B?OHFhYm9MV2NaU1pLd1JDdStqbnFhUHR5UEptek9LZXhPTmlXbVgwUVVsdHJZ?=
 =?utf-8?B?STNIZVllUUFKS1VGbUdkaE8rb1lzM3BNYWxNd1RuaGp1V2tRb2F3MWpnODg3?=
 =?utf-8?B?S1pLK3RJUVdrbURzOW4vbldLM0lXczhWM2tHWk1VZXg3a3pOVWhmUVNNN0J5?=
 =?utf-8?B?SkdCU1I4KzVaMDRxMnJxTTg1QUpTUUpITjZxSm01eUZGaStMT1lhZGNyYitO?=
 =?utf-8?B?dHVhNDZBWVNHRFJQZ0tMU0I3N3dRQkZEVFFlMHlramxhZkNXdm00d1dLZnMx?=
 =?utf-8?B?VGhxVlh4ZUNITEcvdTJkT2dCNzBHYitkYnp1d3RwWUZPc1VaSHNvRGFsMFQz?=
 =?utf-8?Q?t8C2cJfXU2Pa8eMU4o=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4275e622-416b-4478-c3c6-08d8e8442622
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 06:24:26.6905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJOKRvuU7tmA9a8lFuuZKMwjBJ+ZR58ZpxPBGBPzlJIN1HASVDeJjEoOkWLV/qNh4CvrgzKyxLg11U7JgHIwlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB0026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_062428_894535_70DFDF04 
X-CRM114-Status: GOOD (  25.10  )
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

SSBkb24ndCB0aGluayB3ZSBzaG91bGQgbGV0IHRoZSBmaXJtd2FyZSB0byBkZWNpZGUgd2hpY2gg
cGVyZm9ybWFuY2UgY291bnRlciBDU1JzIGNhbiBiZSB1c2VkIGJ5IHRoZSB1c2Vyc3BhY2UuIE5v
IGNvdW50ZXIgc2hvdWxkIGJlIGFsbG93ZWQgdW5sZXNzIHRoZXJlIGlzIGEgcmVhc29uIHRvIGFs
bG93IGl0LCBsaWtlIHRoZSB0aW1lciBDU1IuIEFsc28sIE9wZW5TQkkgaXMgbm90IHRoZSBvbmx5
IFNCSSBpbXBsZW1lbnRhdGlvbiw7IHRoZXJlIGNvdWxkIGJlIG5vIFNCSXMgYXQgYWxsIChpLmUu
IE0gbW9kZSkgb3IgaGF2ZSBvdGhlciBTQklzIHRoYXQgaGF2ZSBkaWZmZXJlbnQgZGVmYXVsdHMu
DQoNCkJlc3QsDQpHYXJ5DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBOaWNr
IEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiANClNlbnQ6IFRodXJzZGF5LCBNYXJjaCA0
LCAyMDIxIDU6MzUgUE0NClRvOiBHYXJ5IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4NCkNjOiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSByaXNjdjog
ZW5hYmxlIFRJTUUgQ1NSIGluIFUgbW9kZQ0KDQrOo8+EzrnPgiAyMDIxLTAyLTE3IDAwOjEyLCBH
YXJ5IEd1byDOrc6zz4HOsc+IzrU6DQo+IEFmdGVyIGFkNWQxMTIgd2UgbGV0IHRoZSB1c2VyIG1v
ZGUgdG8gdXNlIHJkdGltZSBkaXJlY3RseSBmb3IgdGltZSANCj4gYWNjZXNzLiBUaGlzIHdvcmtz
IGlmIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIFRJTUUgQ1NSIGFuZCANCj4g
dHJhcHMgdG8gdGhlIGZpcm13YXJlLiBUaGUgc3BlYyBob3dldmVyIGRvZXMgYWxsb3cgYSBoYXJk
d2FyZSANCj4gaW1wbGVtZW50YXRpb24gdG8gcmVkaXJlY3QgdGhlIENTUiBhY2Nlc3MgdG8gdGhl
IG1lbW9yeS1tYXBwZWQgTVRJTUUgDQo+IENTUiwgYW5kIGlmIHRoaXMgaXMgcGVyZm9ybWVkIGl0
IHdpbGwgY2hlY2sge00sU31DT1VOVEVSRU4gQ1NSIHRvIHNlZSANCj4gaWYgaXQgaXMgYWxsb3dl
ZC4NCj4gDQo+IFRvIHByZXZlbnQgdW5oYW5kbGVkIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
b24gdGhlc2UgcGxhdGZvcm1zLCB3ZSANCj4gY2FuIHJlcXVlc3QgdGhlc2UgQ1NScyB0byBiZSBl
bmFibGVkIGluIFUtbW9kZS4gRm9yIHBsYXRmb3JtcyB0aGF0IA0KPiBkb2VzIG5vdCBzdXBwb3J0
IHRoZSBUSU1FIENTUiB0byBNVElNRSBDU1IgY29udmVyc2lvbiwgdGhleSB3aWxsIA0KPiBoYXJk
d2lyZSBjb3JyZXNwb25kaW5nIGJpdCBpbiBDT1VOVEVSRU4gdG8gemVybyBhbmQgdGhpcyB3b3Vs
ZCBiZSBhIA0KPiBuby1vcC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdhcnkgR3VvIDxnYXJ5QGdh
cnlndW8ubmV0Pg0KPiAtLS0NCj4gIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8IDYgKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGluZGV4
IA0KPiAwYTRlODFiOGRjNzkuLjVhN2E2MjE5MDM0MiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvaGVhZC5TDQo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUw0KPiBAQCAt
MTkwLDYgKzE5MCw5IEBAIEVOVFJZKF9zdGFydF9rZXJuZWwpICAuYWxpZ24gMg0KPiAgcG1wX2Rv
bmU6DQo+IA0KPiArCS8qIEFsbG93IHVzZXItbW9kZSB0byBhY2Nlc3MgdGltZSBDU1IgKi8NCj4g
Kwljc3J3LCBDU1JfTUNPVU5URVJFTiwgMg0KPiArDQo+ICAJLyoNCj4gIAkgKiBUaGUgaGFydGlk
IGluIGEwIGlzIGV4cGVjdGVkIGxhdGVyIG9uLCBhbmQgd2UgaGF2ZSBubyBmaXJtd2FyZQ0KPiAg
CSAqIHRvIGhhbmQgaXQgdG8gdXMuDQo+IEBAIC0xOTcsNiArMjAwLDkgQEAgcG1wX2RvbmU6DQo+
ICAJY3NyciBhMCwgQ1NSX01IQVJUSUQNCj4gICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfTV9NT0RF
ICovDQo+IA0KPiArCS8qIEFsbG93IHVzZXItbW9kZSB0byBhY2Nlc3MgdGltZSBDU1IgKi8NCj4g
Kwljc3J3IENTUl9TQ09VTlRFUkVOLCAyDQo+ICsNCj4gIAkvKiBMb2FkIHRoZSBnbG9iYWwgcG9p
bnRlciAqLw0KPiAgLm9wdGlvbiBwdXNoDQo+ICAub3B0aW9uIG5vcmVsYXgNCg0KU2hvdWxkbid0
IHdlIHVzZSBjc3JycyBoZXJlIHRvIHByZXNlcnZlIGN1cnJlbnQgc2V0dGluZ3MgZnJvbSB0aGUg
ZmlybXdhcmUgPyBBbHNvIE9wZW5TQkkgYXQgdGhpcyBwb2ludCBzZXRzIGJvdGggTUNPVU5URVJF
Ti9TQ09VTlRFUkVOIHRvIC0xLCBkb2VzIGFueW9uZSBlbHNlIG1vZGlmeSB0aGF0IHZhbHVlID8N
Cg0KUmVnYXJkcywNCk5pY2sNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
