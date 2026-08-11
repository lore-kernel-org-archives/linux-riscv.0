Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503C1C5B572
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lm4gaRrQimBXa+F2r5OSX5lcMt5mcgOWYImBKktC30k=; b=VDgRrn8EGuAE5n
	SXyu48YbsMNGgnxPmGg8zfP4DQS7azM0wYLi4QEAJXZ9050OWzFGm9ZMsPtLasz6cyPnn3iJf4p0m
	QrjeyNif4o2/IQq3c/OgnZK8TX8fo30JU36YeyG7GdtLL8eVaRmnzinXEJZlVIQg0yX1uQMzfW64b
	kQyQU+pNSET9FGRjsfNs/+tIK+b4Wog8KZwKWxRmMSKPjI+kXkx4CQYFxd4y+ROs84/2MJv2EaA/L
	fnu+Ek6/+4alQqkiMu3NUwV+KGrdjNS3OmYXHc3bu4Axr6x+7yPjNZZnlyC771rtrPI/Xh8Fs7Wjd
	hZeAqNQKXl9whvxGTAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr8h-0000000EkaL-0TPY;
	Tue, 11 Aug 2026 18:23:51 +0000
Received: from mail-westus3azon11022100.outbound.protection.outlook.com ([40.107.209.100] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr8e-0000000EkYm-2A5O
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 18:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpjWKlwSY8uWtPPnYIzneBua64DR+PxrotE43AadeuqLMw/EsYLM06/czYaDry3WzLllbZgn0i+YJYCvDZpCqhrAjxM3Cza9DxmdUBY6LabveRDhJL8zxt+zo4Djq5GlwxBv1RSQL+Hj1wCYQsZ7QJCDO5OSzyJCCVJPZa/j+Dy8HQwk3+LkNCC7118ZHa8LW9l/tqAoWQn9uAZ7r9bjGM+0ExDtvhFyjDMlNEpxmbS+NTU3FK6C06hS/t9nExgji+t+4KVKDKMZL8UbTUJnW/5ga+k0ErnO4uBdgJLtu5fLqPTuaO/LvVxNWcdVof/cKZQ4ei3JM7uyqox6LRWoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS97OSE+0pBr2ZpnrIn386t62mD2FLQ2QdLtWDTmpSw=;
 b=MY8w5papvLkD26/XEnj6rNzF2zNd7YU0CxeHqooBuMwQuojDZJFnV6jtI3hv5JCKkJDQsoR76Tb8T4CAMp7pj1haB8wN5T22e9GOjPwJPhigLtbVucsTf1CBYwrNpwm1x0GSKx3M+zKEingLA/CnGpAIh97w1Ga5ansgpQF/eIgElNVVBU/vVsusWZG9tBlwT++TrOyHGg2QS+XYFP5tyrcEG4d1iIAVlSoXnzT9oGjWk24A+ot0ewTBmb33RQ1XXB/UdAJPmpvt6SECrJAWpl7LSmL20SaQGQTDnOhlmtLIhjQ1PwUQnGPBxOSQVIimOFv0UVI9sCw4uL+12EjNUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS97OSE+0pBr2ZpnrIn386t62mD2FLQ2QdLtWDTmpSw=;
 b=IAmXo19i8a8FRyUhYA9hclU8mlZO1OV4/J7nx/cJJ9JptmpyrScRlF0BCmTDDAMEQdB4Jby3I2y+XPMObmz9m9/OC08Px1OQ+YmVm0JIp4Dk6KpTG0w/fCTuJJ7JCTorTD8sV1yhLLVcXb0jEW0SW6LhDybBAwdv6UPUuQYvuuJKFVryzcR403E+TI1Y7IBnmygMOAQIrs6TfW5BOxQFliiZtVuAgsZ3B8/Mfs3XvfyUDp0qWRGbazLf04MKM8uaUJjduEoIeiKvT/v+3rWDrIfFrK06GJGE18UnDzcpBKLr+qCkpweyTTCOwzL2GdZCdJ6/N7n29MZyc/mJlCYFrA==
Received: from SA3PR04MB9001.namprd04.prod.outlook.com (2603:10b6:806:398::17)
 by BY5PR04MB6453.namprd04.prod.outlook.com (2603:10b6:a03:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 18:23:41 +0000
Received: from SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196]) by SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 18:23:41 +0000
From: "Ousherovitch, Alex" <aousherovitch@rambus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Krishnamoorthy, Saravanakrishnan"
	<skrishnamoorthy@rambus.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Herbert Xu
	<herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Shuah Khan
	<shuah@kernel.org>
CC: Alexandre Ghiti <alex@ghiti.fr>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Wittenauer, Joel"
	<Joel.Wittenauer@cryptography.com>, "linux-api@vger.kernel.org"
	<linux-api@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: RE: [PATCH v3 11/19] crypto: cmh - add DRBG hwrng
Thread-Topic: [PATCH v3 11/19] crypto: cmh - add DRBG hwrng
Thread-Index: AQHdJd2McKY5TZ9ZKEyR3JOvtdiCxbaYjcOAgACjaKA=
Date: Tue, 11 Aug 2026 18:23:41 +0000
Message-ID: <SA3PR04MB9001AC1DB7241932BA70FFA5D7DD2@SA3PR04MB9001.namprd04.prod.outlook.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-12-skrishnamoorthy@rambus.com>
 <8f45e30e-bed0-4e01-994d-40929dbf769d@kernel.org>
In-Reply-To: <8f45e30e-bed0-4e01-994d-40929dbf769d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.11.2.117
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB9001:EE_|BY5PR04MB6453:EE_
x-ms-office365-filtering-correlation-id: 395cdcfe-0f31-41ca-8669-08def7d5abb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|38070700021|921020|10067099003|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: dM2lKCkyWJ49AZhg8MMqs/hv9OwK7vSTxY6saZpCHdxGnYfCQ6Uj4PMx+QJVr8x7LEQRL61FosiwEzqnVM+vsgYMqn798yHYL1QiWT/W8V563Qlbtzqvmnbo+6Xbt2ItG4b4s3NHuMXjPup8haqbaQ5JSE+vmdXry1w/Z6wGnXZcL7IuiI0LvDdaxE80CtNMnQra63JKX7acHpj19aHzL3NSa7FMs/MP6ulOQAw2XT9gUjfgWUvjbsRh1Pu7ALZ1uLjCLlnUpaI7XNlcyTlbwyoPM8cRsWOOVJIqhpF+5R0Druj0wWWUzujbHS7hQpUqrTxj+VbzpCqJTJbqly3RLXD9qgHyY8vikZr0PgufcmLCB9PY2J36TUvUaYqrpNaneEnvQmGZo2AnZpAgzaLdzy3XXw6b5vrVBbv5PW8g7u2RZYANh20CoG7F1w8GW5lfMMrxwl01i1eUJAMtlCqJfr8FGPTr5b97AvqY3FvCMm2c/xIt6yW9Mfw0MYrCOKLBsia1JjEMqJgUqzKP2JDRn9G41F7Y7Bk3wQuCiXUjYJIfK9Bl756hzujwsxf7gaoBsAtjHc68eUAcE5m0sc/81yuIGHNwMHPodhshn8MTmF3Aa7A2nLcGdLNxmm2PviIaa+EtGQmt56X8AQ6UjrwBi3e6sSPZGn1Ste3qgkR3f7LEOKYo0TkJnbGycKWOUQOhRMagPuo1hayOOmh18ZkDlx5pBr+XMHQIqybtKMcho1mEApKA96Rj2K02z7RqYaV1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB9001.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(38070700021)(921020)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmlCdEYxQjB1aUc0Y29IcmY5ZWUwSkJsNnU3UUNwR21CbGoyNGJWNkFYSVhZ?=
 =?utf-8?B?UVZQYmFWR0lxZjRnRkF0ZFNHK2lWQnE0SlZHaXBFYlpYb3hUTzZOUnV3cDJD?=
 =?utf-8?B?RG9wTm1LVkNEUFoxcUxidmdOMXZiM0pHRjZFRTlvcmtvSExBY0NFcGRTbkg5?=
 =?utf-8?B?SloyanRQOFpSM2NsMzNKUjFOSjJBamNuaHovVk9aQ05CUnAxcDgrTXBqWi9z?=
 =?utf-8?B?MnI5SUVIbWNoUmtmaHVmbnRoMWdCbk4wY0kxS0drc0RJci9wMFl2UnZDT3l1?=
 =?utf-8?B?RmMzczE4V3BlamJQTkVmaWNnU2FEOHNBTGsyYXJHWVdQTFp3ei8waUNOTmN5?=
 =?utf-8?B?cFlNb1NhaTM0SHVWUGpmK1p3ZU96aWhMRDU1dmk4SUhYRFNUdFJUeDBub1M0?=
 =?utf-8?B?a2FvSEMzaFR5OTl6SjhsZzJoaXcvOThVMWEwbmNCYmtkZ3RuTUxTcy9Zc0VR?=
 =?utf-8?B?UGxTcXA5b1ltTlU4aTgxM3phTjZOTXY3RXlYLzBZNkxCN3o1bmFHNy9xa1VK?=
 =?utf-8?B?M0VFbEZTY1gzMW5vbWk3WmFaSEtKWGRtZG5TeHJMNWtma21oREFaeE15cEpB?=
 =?utf-8?B?UnIrcEtuZnMyVnpIYk0xUkxSWXdab3pqSVRja2JkKzdBL09QQmVveUJNWkM0?=
 =?utf-8?B?S2hiS1N3SWNFU0JDNmJvdjZJYU0xMVFwTHNsNFlDWjk1Q2lyMjFPZG8vdFhD?=
 =?utf-8?B?MWg1K1gralpvaWgwa3FmeFR3a3ZXTGNZZHhzQmlFcmt5N3RzV3Q4SlBTbzlk?=
 =?utf-8?B?R0pkYWRPcG1WVTB0ZGF2RFEwRENDNDRSMFFOd0JXOWZWY3ZlbmtPbXpmVjlN?=
 =?utf-8?B?RzdxWnZlUnFIdFdqcGloejYzV2NkdkkxRENFM1RudE5jdC8rcXY4RFBabS93?=
 =?utf-8?B?MWpNN3ExRHVvN2p2RmpobW1QYUxpOGgrZjhQMmUrWHREeU94U2VIcURxMy85?=
 =?utf-8?B?ZXBNYTN6YVhQbzB2ZlBOMzlidHJiNlZOcTBMV0djVWEyM2VMR0tVaFNQa0lR?=
 =?utf-8?B?MjBkYk5tZHkzNTAyUk9WZ0JrbFpuUVlJOUpwQkhrS1IxcittcnJObTNTZ3ox?=
 =?utf-8?B?dW90NmVqdEhCU3M0Y1pTUTZaSHU5NU0rTTc5SDdrY0R1ckY3THptY0VkL3FM?=
 =?utf-8?B?NzAzOFh2Zmt4NTh0c1VRY0xXTTZ1TCtyd3pBbGJOamFHdzJ4aFpXZ0I3NzhP?=
 =?utf-8?B?QTVoaVd3c25kekNaaVo0MDVEQlVzYU9GeWdDQUZrZnV4M1d5VkhoS2pvY21Q?=
 =?utf-8?B?dGpMOFE0WThZWkQ3eGxnYllDYjNtZzJocDFqMEhqWkdSeXJzZ3JUNUlhaGRo?=
 =?utf-8?B?ZjdjQ0tFczV1dW9PdnFaOTdlem1RK1lOZHFGck1OSkpwV2FGQXhHLy9BTE5i?=
 =?utf-8?B?bzFtVU1TcnZPRmpFdWJ2TVFVamUwcW5XVWxYRnJpSFlrMEJ2bUdWVG00ejJa?=
 =?utf-8?B?TXRCZEVmZVZKNURwaldST3dFQlRNTVUrcHFJMEdkdFVkS05TQkIwS2FUai9r?=
 =?utf-8?B?MHpWbWRFdWlRQmtmamhyb1FOQ0dyMHN4NTlZaE0yNnlzYkpZeUkxbU0rMmY1?=
 =?utf-8?B?aFNseVp6YzdpYXM3eVFqUjE3Z1I3dmttUjhWTVpmTlduTlJ4cWhIOVhDYVhQ?=
 =?utf-8?B?QURoUUFXRWNuaDcvU3pGRXFBbWpsSHE1MnhTd2FYbXZRdU1McG9VYytOZTNF?=
 =?utf-8?B?aUplS3ZtQXhvM2E5OEw3OG5iOVRTM1Zxemw0NTRLMUI4K3REd0QvOURCeEtw?=
 =?utf-8?B?RHF6NXlXbEpubjU5cDJwM1JiNWNKaUI4RTg4Mk9RbWU1SzA3c1VIa1RHRGxa?=
 =?utf-8?B?ZlZFOHBpdmh2N1hXaTFNd0VzZUdUbExnNmpYd0YvSnFnS0pjN21iNkFTUEdx?=
 =?utf-8?B?NW13elZnTlJ2bkhacmdURFVtbnVPSW0wQ1RFWVpSMkV0N2hsTW5VQ20zQVNq?=
 =?utf-8?B?T2R5aUVSRWxXS1R0Yk5TOFFyWWVxYW8xZ2R0UDJNbWRyNytQTjdFeGxRZUJV?=
 =?utf-8?B?NThUT245Q25keHduUW45b3R0STJmSDEzYXVoSEIzT3IyUytZa0JwSFlYbHQy?=
 =?utf-8?B?Q2NWU3VWR24zSlZyL0VnTzNNcWpRbUsybHFCZnUzajNURi9IckkrcHcrckFZ?=
 =?utf-8?B?TkpjWG1zZEc3SGpHejVDTUlmM25xNW5heWp1eFlzWHpiTzlScm83NnViWWg5?=
 =?utf-8?B?a2JTM0hRN25ja21SUlg5SCtHVUprcmpHM1lTRk9Vdk50N1l5QzJ0Nm81K2Jq?=
 =?utf-8?B?a1owS1RFNi9QMVEwWE9nSHE1ZXlhcE9DZkg5UVo0UEV2aTUxaHB0dEVobjVZ?=
 =?utf-8?B?MGJpYXgrVWF3c2Y3Ykw4dzNPZlprSGNNRmlUWm5OSGt6dDY2Yk91Zz09?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB9001.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395cdcfe-0f31-41ca-8669-08def7d5abb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 18:23:41.3924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9IudZ+EY1ry1TORH7VeIedT9qFmy0fdFKdpKMXg8H3FI9q8YFSc7GlqB22DeF4s7tfwStBuITl9zMsDxNt0BZOGn5lwOR24qehR4DUsIWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_112348_554548_6846B351 
X-CRM114-Status: GOOD (  10.03  )
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

On Tue, Aug 11, 2026 at 10:38:13AM +0200, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +	dev_info(cmh_dev(), "rng: unregistered rambus-cmh-drbg\n");
>
> So every function has dev_info?
>
> This is one of its kind driver, because I never saw so much of spamming
> dmesg. It should raise eyebrows of your internal reviewers, therefore I
> insist on performing reviews on the mailing list if you want them to be
> tracked.

We will remove the dev_info() logging across the driver in v4 (the same
cleanup as on patch 02), keeping only real error paths. Understood on
on-list reviews.

Regards,
Alex
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
