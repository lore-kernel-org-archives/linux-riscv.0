Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBE8C83012
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:23:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC69208C3
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0D61McYE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JzjIWgFH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="rzwxWigY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC69208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cM8gaQuouf37U68aeFX8GKGYzSuVpRkzkNT3XOCgcrg=; b=0D61McYEsx0thCm5maxK/LdO5
	4Dw3+pQjTKdYFgahtXb/kpsGWAhF4mNXxijyS0M7ud/IwYFjN2vA6KZfYcmtqLyrI6O14sZUXAywY
	7FRRdh7xU9TRMEyX5PpCv+RK1/d6tZURlySIaOpl45gwm1UabjUlOhUIlv+jn/L1PVD+/YMs5FE+7
	Fop5hwC09iw9Tcm07Gw5zXLxX3iHoN8AhOtjni+uzzT7Q8IBKO+FztZNwbFjOLi9fF48qH8/u96fY
	MnZWMO/sqdhZNURT50EVll9W2GpH7FpmWFRJHxcrRADYNUs0Co4JYE4pmf5nOxTHlqoVIXoxeni0l
	5tJV1xFGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khq5B-00042y-1P; Wed, 25 Nov 2020 08:23:21 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khq59-00042S-HK
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 08:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606292599; x=1637828599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GH40gUjsDaAUM4h3eOTmmqmDxXHZ9y53Y50Io+K0n64=;
 b=JzjIWgFHeE9ByiZBD8unaye6illD4Ez86w0ImTT3g0XW6/wG7VvwnQDS
 /ny1TOAd/LKpdj34mza/Qdc7EDi1QTGR877VqkTFxrRYMmnvVin2en94a
 7zkXvHlmxbjhyDW9ZEWo2t38FSs+86i5M3/Q03HQQjJVK3CcanqNxhCXu
 stsL5/+mYnTN/svgXALQvGLt9q0WIdfI/eEdJw/Nhqub+4+lPTHGmbgeT
 YWDPSUUacl3Y28yex17E72ieJ7tFhcDpWDgph6Jops6//VWXCL5vIxRjA
 rMIIK4By2/QU5Bu5+aChAOeQQTihNuDUgUZ5xJWZHl+AS58qHNQkcaKss Q==;
IronPort-SDR: rYTz8LKAegkNdQwaf3rUBHMDXQSR8FHdxytdgfJ3pzt+1cRRqw0PgOViwWuIVKxmNo9u9euB0v
 5JKIVWh+JZd68g8Df8O5pcBNmMxvtFrSHq6fp0CPr5apaS7noncfXO4wsHS2ul8w0jJrUAHCG9
 rQwohDZr3pQWKokbtQOkRPR9JoFFMl7hv6+2mAos8mjoKX6S2IknC7bAMXzDuGXvXnmVWNUJ7R
 mSyV+bh+BUK6dFLeRnR0M+yYPh5W8wWSCBy18+DpCHqrJouhi0BZafDQJ7niBei0Z5599TRDsa
 8Fk=
X-IronPort-AV: E=Sophos;i="5.78,368,1599494400"; d="scan'208";a="157906195"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2020 16:23:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCvNIlzJ/Yj05XKQq6dIyobOi26LRC+aFOee/rD0PiaVcgLx+vZXjx9dw/zCGq9O4V3YsmGIuRAbzmUSMve3Q71/cQ5tu9Zi/3h3huELu3BEsV2I2N1w9HuQubulrOeI12m7a0Y0smD0E7dZv7ik/aA4opio8LBLADXF2oJ7VjuJIXQUCH8/Fpwz1ZsJsA9t1X7IYcMg7v3ncvbsjNLgrxiZCBFPOsnCGwzjHDJktGU4p7YRoSHAVvy6C7Pg3kMTK8BLi971/ht1AlA78dY3ycisDi8u2njtQqGTaFVUJRQxB9Wpn7PMSMvfOH2OLkQMV7g0qxKuejlsT8B0LMeavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH40gUjsDaAUM4h3eOTmmqmDxXHZ9y53Y50Io+K0n64=;
 b=SGhJlpuMItoY8PIr1gVvz7KQHb+TRfzp4LY7QVM+z8pZFpBWPfOYkfBTMwlNtzsUvxGhlvrvDqPCsuwRaXjFWeeAF5rXAN52uuAAN4sP5VboALKACt+ybNZPhzf1+8hGFf/J7XzW+wtbgrpNdUaruKVRtpwKGdLiXZQVO9D+CbAki/upAdDC6L1X8QmJyyY7UWJyw1JMcHpLnblpnUVCD1WSbWjZQByJZojovLCM93hTmFhSxr9f63chQEQm1Bal0Hyb5XyoogMA1Jikvw2MvpPAo2aEySA3vyNRUgegUR1Sz19WW+GU+lIF1dTUGztf/UOtoDkaEa6TVrAZYI6QFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH40gUjsDaAUM4h3eOTmmqmDxXHZ9y53Y50Io+K0n64=;
 b=rzwxWigYEtMtgh6/wBFbES3YF435rq49suptyHTtYYgYqsC3tB4p8hFls/TU48eYgJJZJ6I8uIJXUH5p6iWizf1pNTAEQSYEbZ1Q5J/B71J4/iXS3KooTxt3Dw79kIUTxRwzOR5O/TaeEZJFtwl13ptRM1vUVH2j0FbIkmBZWu0=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7126.namprd04.prod.outlook.com (2603:10b6:610:96::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 08:23:12 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 08:23:12 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "geert@linux-m68k.org" <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Topic: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Index: AQHWwpO1HQiFqsmnr0WJzbSNTitMeanYgm6AgAAA1oA=
Date: Wed, 25 Nov 2020 08:23:12 +0000
Message-ID: <2cdeff2f8c483b83879e46786169b79497b03492.camel@wdc.com>
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdX7FvJAPtGaAa1=V3X-LVA9oB+MK7GNg02pj5874MMLVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX7FvJAPtGaAa1=V3X-LVA9oB+MK7GNg02pj5874MMLVQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d6cf9fb-b3fb-4e6a-fcbe-08d8911b59a6
x-ms-traffictypediagnostic: CH2PR04MB7126:
x-microsoft-antispam-prvs: <CH2PR04MB7126CE03D5FAE6E625B21438E7FA0@CH2PR04MB7126.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MysTP8gClybzf9uNmEsEkPKVoi8UyNXkYhdWnq7Q9j86YwSqzAq9nf1qxzN7VoqPJ43pd4gvPGSb5y5lPGt8USxfnxEvKlQgJazzuxhyyLpkXdu7FuljD77zOdNNwcBRqTH0BnMbVBfwmeELOOBpnCQmD1Vkkotmv+k+UxsuZ7JyagRGEsDLrQpzE9m6iwY2tJ0iaG9QaLHG4MBr2WaYCEo4VZZVwfhJvOS/9jdNw0oWxPBz7EfjT7EeX0Y5y+YCU0YK3gVceTTFH/a8mf9EITkNoWvZ1yDEtxDE23FoexhxrJz0C6oyEwMkD07dt/D5hBKWK5l4llgnvReyg1ZDxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(2906002)(6512007)(478600001)(83380400001)(4326008)(316002)(5660300002)(2616005)(8936002)(86362001)(186003)(4001150100001)(6506007)(54906003)(6486002)(8676002)(6916009)(36756003)(4744005)(66556008)(66446008)(66476007)(71200400001)(66946007)(53546011)(91956017)(76116006)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aXpjUXRBcXJPcmNQd1M1ZEYyT1RPQll3amJ4amV1S2VxOFg4Nk1jK3RQRnRz?=
 =?utf-8?B?WTNmMENzanR4SXJBdDdxcTRoSXlXU0FiL1lacHRZTFhSeVRUNlFvM3BjWFFQ?=
 =?utf-8?B?N1FWcDBCazkxYU9RV0xUQlk5SmxhNlNIczBldjU0ejBCNlg5U0toS0NORkdB?=
 =?utf-8?B?cGRMZGQwVU95dFYyZTlENkt1ZXNpVm1zMmI5Tnp0RzNmUmlwenJIcXZmMnh0?=
 =?utf-8?B?L3hRVUQwUVN4dmYwQ0VldVE0TVB2azU4VGhsRDdPWWRHYi81VXNRRm9VWUlt?=
 =?utf-8?B?WDFwK0RHcFE0Y253blIvVU84MllIU2NpUFJQWElicDlrYi9kTkl0VHE0SlEy?=
 =?utf-8?B?azBBVkRwNTFjaktaM0RTY29UZThSVFhIMnEyUTJReWx0dDBLOVlRbE81Z1Zp?=
 =?utf-8?B?alFNS21uTmtGbTBJRytHQkFtSU0rbGFySlM4WStTQUJPMkM0aXR4WFc3cS9Q?=
 =?utf-8?B?b0FTbUhUZHUzd2ZFUTRaaDMvUEdTTGgvYXR6SHFERDRwRU8zZWZtSXFId0xz?=
 =?utf-8?B?WVhVUWNkY0lQL205cEJjdi84L3R5c1laOXZ5T0xxMk8xYTROWmpVeWVVbVdt?=
 =?utf-8?B?aDRqdVB6c3pyLzJQajE2bEVyK1lKLzBwby9oUHBMaTNxWEZZOHVNZ2NPSm85?=
 =?utf-8?B?aWF5dzBKMWhJNnlqNCs3aDJkNlQ0U0N0L0lsY09tVDdPY1EwMVVUY3VYMTJF?=
 =?utf-8?B?RnEvcVl0MWFNeGpmQWo0ampVN2JiOWZhd2tTZ0JBTmFWYzV1SVl0d3lMcE9F?=
 =?utf-8?B?YlMwcTdnMHRxcm1YdDMxWW5RR2FNQ1pCWWsyZkU0QlA3NjJNSjFCTEpLTDd5?=
 =?utf-8?B?ZWZ2SnoxbHBPT2FLTGxrSU5NemRrV3F3ZURKc2VQbHhTUk96ZG9WT0pFVWs2?=
 =?utf-8?B?cXV6dktYRDRnOWhzUGdZeE9UMmRKZVl1WU9tVFdUKy9vbnJtYVlPZEkzSjE1?=
 =?utf-8?B?RFhRQXliRHg2VE1SbW44aysrVzk2UFovSHAyYkFRWkRmZmtMSzkvWmh1MXhV?=
 =?utf-8?B?SDNPNGQyeG01TGZrM1ZlVDVvdko4ZzU4ZjljZTRMMEU5NysvU3V4UjU3K1Ra?=
 =?utf-8?B?d0hYU0wvaTFyQ0EwZlE3Y1M5QW9TOG9BK2QvVkpoeS9QU1phRFRqZmV3eXBO?=
 =?utf-8?B?MDZLZHBIcmN6TlNWMDk1d2VQVzQwRmZtaXRVWk00OVpWbm5WMHJ6Qm1tM2FE?=
 =?utf-8?B?c2ZNS0V4SmlSN3NrRlFEVDQ2eTFzNXEvdmtpMmxaSnY3R2o4dFRzNkE3SWFE?=
 =?utf-8?B?MXVmVXdJcjA1NE1CT1ViSjVadFlpNFhsdkdkcHEyVVZ3VVBBUDBLNEVrLzFK?=
 =?utf-8?B?bGRzNU9pc3hvTUZHRHBpVFZ1MzhFemlGbHMvaitPT2FpZ05JY3VReldVSEFH?=
 =?utf-8?B?aDJDUFFNK3dSaGdGazRiTThWU0E4dVZjM08rOGJiVWNvTkJCMVBXUHhHaDZx?=
 =?utf-8?Q?t8Xh/rK5?=
x-ms-exchange-transport-forked: True
Content-ID: <67A03975B9C7EB49ADE9FDBE7E729781@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6cf9fb-b3fb-4e6a-fcbe-08d8911b59a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 08:23:12.6369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tB5GGYML1hdB1T3vXYe2CW/goCmqMvQ836NYNxkJcGIQiyrRo78xgPk8KPfnFJgjXa7gWZEdDCcJC616l06HXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_032319_786679_E9F8254E 
X-CRM114-Status: GOOD (  21.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIwLTExLTI1IGF0IDA5OjIwICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhpIERhbWllbiwNCj4gDQo+IE9uIFdlZCwgTm92IDI1LCAyMDIwIGF0IDc6MTQgQU0g
RGFtaWVuIExlIE1vYWwgPERhbWllbi5MZU1vYWxAd2RjLmNvbT4gd3JvdGU6DQo+ID4gT24gMjAy
MC8xMS8yNSAzOjU3LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gPiBUaGVyZSBpcyBu
byBuZWVkIHRvIGVuYWJsZSBWaXJ0dWFsIFRlcm1pbmFsIHN1cHBvcnQgaW4gdGhlIENhbmFhbg0K
PiA+ID4gS2VuZHJ5dGUgSzIxMCBkZWZjb25maWdzLCBhcyBubyB0ZXJtaW5hbCBkZXZpY2VzIGFy
ZSBzdXBwb3J0ZWQgYW5kDQo+ID4gPiBlbmFibGVkLiAgSGVuY2UgZGlzYWJsZSBDT05GSUdfVlQs
IGFuZCByZW1vdmUgdGhlIG5vIGxvbmdlciBuZWVkZWQNCj4gPiA+IG92ZXJyaWRlIGZvciBDT05G
SUdfVkdBX0NPTlNPTEUuDQo+ID4gPiANCj4gPiA+IFRoaXMgcmVkdWNlcyBrZXJuZWwgc2l6ZSBi
eSBjYS4gNjUgS2lCLg0KPiA+IA0KPiA+IEluZGVlZCwgbmljZSBzYXZpbmcuIEp1c3QgdGVzdGVk
LCBhbmQgYWxsIGlzIGdvb2QuDQo+ID4gDQo+ID4gQ2FuIEkgc3F1YXNoIHRoaXMgcGF0Y2ggaW50
byB0aGUgMiBkZWZjb25maWcgdXBkYXRlIHBhdGNoZXMgb2YgdGhlIHNlcmllcywNCj4gPiBhZGRp
bmcgeW91ciBzaWduZWQtb2ZmLWJ5ID8gT3Igd291bGQgeW91IHByZWZlciB0aGF0IEkga2VlcCBp
dCBhcyBhIHNlcGFyYXRlIHBhdGNoID8NCj4gDQo+IEZlZWwgZnJlZSB0byBzcXVhc2ggaXQgaW50
byB5b3VyIHF1ZXVlZCB1cGRhdGVzLg0KPiBObyBuZWVkIHRvIGFkZCBteSBTb0IsIGFzIHRoZSBm
dWxsIHVwZGF0ZXMgZG9uJ3QgcGFzcyB0aHJvdWdoIG1lLg0KDQpEb25lLiBUaGFua3MgIQ0KDQo+
IA0KPiBUaGFua3MhDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdlZXJ0DQo+IA0KDQotLSANCkRh
bWllbiBMZSBNb2FsDQpXZXN0ZXJuIERpZ2l0YWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
