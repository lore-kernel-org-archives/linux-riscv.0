Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFD6C54E5D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzoLjpwZvgWc5dJTBHScx9xB3i5Hxazcmv9DMB+zr54=; b=42py9oTueKEGdzTZ2HHJna1I/Q
	wzL0ZwinpFQjS1hs8euZwEIYa7TSlRDAumt9awb77yCrDfhaH9YjJhVab7C71KZUEj02BBJ2fuYNf
	JV3Mzr1ZU5quylNmhFVd8FmOj/GA78ziBOTcW2Eqst9V3tWgNvMlVRrMAUBfQvzpSA1W0ogErWYzv
	8gt6dwEHtX7mIYActyIisSYcr2kEuDwwSNzPsB4q/j+MsCQs8Ba1x5hg9CGqNCt5F62n+abw+CvTx
	rLEcWFltvr7wOhPpob/L4CLICxF7q+TV+zfOLUY+L/vVPZllF6I8VoG6NVMVz7S9kpRXBtOIrUcwL
	Df76l3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkvEd-0000000G9bD-0Cg7;
	Fri, 15 Mar 2024 00:15:43 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkvEY-0000000G9Xy-2cuL
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 00:15:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlVg8bEqBX7Cbgj6RUmqXrQf6atlrjeAYjw8EPxNJllwLdL3L5xkIVB/K/I2GpqXKdqUT4ssXKPKjTHqD0vXRaJMNrAaDoutWGWS0cIv/WZI6V+PH6FGQ7+u+6NsBjrKpFYfz96OayS842h8PBjeIlRBGqRd1sF3m81yDzIG9aAQqOgTQCzW+ePayQc2ei/vha8Uj9aVZd5/MnskWHvn00F7QhyGGc2BSkjaW6DGb1MWhSdse0yjCrP/euIC0im3bunFfy8EEVB6CclgZrWVtNhfh06qsG4a00kMWUSSjz7+qRkP35eus4i9ojxm+5aEaW4hRJ//hSlODR0YSJvdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSdnMYZVynHK7TuLc1rbW8uELtIsmLS/7kKo6zbSiDw=;
 b=BnfqHnDVo/YX5Yv4j0IX8nzhyycYj1A43cOiVkna+Wsq3W6/+pqHWR8+Gepu/XqZlZsMUuAbqnAqzKok4Qw/qWjup9bnD/E3Y6tfJ1ZQc+r8wjTWKwrZ3HXch05ft4nK/HQveZzOSvL9a7UqRryj1PPRj3Qy6WClvgJZrGBRS4Sh+VaWIdi+tp0R1nmYtdIv+nkmDrX3O89tciiQzMOalTXuurO+zaFvxzJME8iCvCJ5UXQIVvCDHVCRxidVIgJuIRxgNjDHvD0jj+vZVtC8XzDnikG7aZB0lxmLLoLYEkXUL9IMXbP1vbtyupbaPfkeWq3p4Dy9tYGuwDPa3ZG5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSdnMYZVynHK7TuLc1rbW8uELtIsmLS/7kKo6zbSiDw=;
 b=DfhVS65GCGzgNSij9jxEF5CeIgwC3rQhfvkq0upWMGI79Sqg4oDvB6LA5QtICjiH73/X8gbHoim0webUlt13twA/78hHY1J0JGyWVSEd8pwpeoIQFZ71MfaJjD8Ze3MYbAwSFT6wYOu+UjpifRSlwbZDRlbtR0KYxUovZXoCXGBUU5/MQgFH0UYkFrl/rKvmamI/H4+PkbAZ3uA5xN9SG+hF+JUT0lpc0IAucOSCZ7Rncqn8GwfT0+Q68I8XmO7XgTQ1+ErJp4atm6AV22KcHTX2WEbuAcciGYx+S0YKgPXgGaA4SI6wFOgbKRLzUIt5N5BY8LTlLQUB146y+47deQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0455.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 00:15:15 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::64a9:47d2:ce4e:b84a]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::64a9:47d2:ce4e:b84a%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 00:15:15 +0000
Message-ID: <MA0P287MB282221F8E750206EA615B3CEFE282@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 15 Mar 2024 08:15:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: support SG2042
To: Palmer Dabbelt <palmer@dabbelt.com>, unicornxw@gmail.com,
 inochiama@outlook.com, arnd@kernel.org
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 Conor Dooley <conor@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Paul Walmsley <paul.walmsley@sifive.com>, p.zabel@pengutronix.de,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski@linaro.org
References: <mhng-3e62b204-0a40-4356-888f-060c0515c286@palmer-ri-x1c9>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <mhng-3e62b204-0a40-4356-888f-060c0515c286@palmer-ri-x1c9>
X-TMN: [58n8lBTyyaG4AaD59LRZhPXkncGQOVkq]
X-ClientProxiedBy: SG2PR06CA0251.apcprd06.prod.outlook.com
 (2603:1096:4:ac::35) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <54b50eb7-ebc0-4890-976e-20061c904f8d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0455:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f16d24-6b54-447e-707a-08dc4484fd19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: or1Fqj/Re25C51tOvMh1IAAH6KAsmNEeo45rL2DzNv75I9kC4pt6XSaz8OfHVEI8EAuzMMK0gBIVML9eodzB/Mimg6Y3Txs/7MtK7fVvMWYTxxUNTeY4Js2E2njph4dYUab5jeXEFKCqp6xegEObkrtaln+NFbKt8YG+W4KamKjlgsHg2HKImtySOtRFne5AhvkGDAe12fhc3dYh5ZZwZAhCoRYskzB08mnOz13uvssHzlzNjIzrBOQwVHlURtWkz6PhdWeSdIsr5Ylp8dQHeL8pP9WwaLlKOM8yaN+Ef5be0xE+DXCKJsOPgLmlS3svAZL2H7xbIsubEudirYjTPHjTdz+NI4HIJCCmxeDP8VaZn2YVelVAWMXKpkrne/D9vcYJG3UjvbapcTp1ioGD7hx+ztZahzZRhg7I6UoqZhByDhK6ycPfOuD3hIVJvqH9FI1IXbrz5uGJzXgyZpmhHHzS1k0C2PBE+ZZvsFOn6Adhg6RR180X6RBJlPKGvt1ahOuuYhJ/hZUZ3DqeJ3TSstiEoqlgstJybyOZYjDYY+HJN2YDr342Yp64JKB7dgD3Fp4uEfGUf0UsYb1ax34IbKgNJ8f77J+wEQ5ZKx97XDCw3nrm3dOLNHDzbbRU8IsjusIWfr8Gdc0cRVnhNigV4d/X48lrpr2um3wW7E4foX0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnVhQnZseERGVjdQMEVDQ09Vc1NZMDJjeVdaMUUvQ1JTSi92Z3M3NllKSHVm?=
 =?utf-8?B?S0FYdW1Hdzg4ck9oekJkQms3Nk93RHJmSXZRa0gxOFRjTlhhZ25idlNFQzVF?=
 =?utf-8?B?N1NHbXM1T1F3TkJQc05ZSEw2WmZmUUVRKzhpYjJFbS8rSzJNTUF6S3dVanM5?=
 =?utf-8?B?WHp3ZVovTzNmRlhxdUx6S3QwcHlLa2pwSzZzMm9OOGlQVTZwd0pQVVMydHQw?=
 =?utf-8?B?a3hHcEV1alJxa1BHd3BKOERlQmdlSmlKc0lwRWZ0cURkMlVpR25ZQnlWQkpt?=
 =?utf-8?B?dFlGNGk0aFZmM2dDK1JYNzN6cTVBdkFDcEJIRWd5dlhaQU11Um9ld1hSSkV0?=
 =?utf-8?B?emdGeFo0T21vNDFHdjU4M05LNk82U1dOYjFJWlVPRlprVGZlRmhaV3FtUHVx?=
 =?utf-8?B?QmUxVlhCTThLdmRFQWk1VHRZUS90TkRLTVNKOEIzbTlJeUNsaEFQeGNMcW5q?=
 =?utf-8?B?QzZhUEFKRkNwMllaTkdNc253cCt0NjIwcGg1SENyM0RQTEhmRnMzSGN0R0hZ?=
 =?utf-8?B?bjQwWUI0RDg4YWZPZW1CV3BZV2pkaDRwRUlFMXh1WXVJUitCZVNYQ25uUk0z?=
 =?utf-8?B?T2xVMTdodVhTWWZmOG1xdDRCR3ZETnRwLzIxUllscDZRWjZiVXYwOFRzakxU?=
 =?utf-8?B?dElWZkN4QldLdk9FdG82SXhXNmNsTkxNSFFZL2xyVUx5c2lya3hNUmgyakVj?=
 =?utf-8?B?akhKUnFDb3B2WTVkMkxURnVwazB2a014VW1qUmZGYnd1ZzBNY3BQMDd6M2xZ?=
 =?utf-8?B?ZVBQQ1g1YkUxenJ3ZlY5Tlc0RWloRzBxWVBmdnRhblRvZUpJdFczcGN0bitw?=
 =?utf-8?B?bTNidmRlUVhUZG13SW1GcmJHNW9ZK2dUeW5TdG43OXhlRjBFZUtmSXFTT3A4?=
 =?utf-8?B?RzA3elFZcGt2dllkc3ZzdW9GeGppbW9Zd2swZnZZSmY2aXBNWXFVUzJPemwy?=
 =?utf-8?B?ajNsTFV5ZTk3bHk3SHJOUlcxRm85dW5MZkM3dHVXamNrRGxXYTlUdE9LQXRq?=
 =?utf-8?B?T3k3RXBieTR3QkNUelJibXM5ZnMveUsweGRINFlkVEVJUlBOS210VG9xdWh3?=
 =?utf-8?B?dnpRQTNJdGhwblI4V1d5RkhjRFBPMU9CVi8xUnRLVGNqWk5ld01JRWR3NU5y?=
 =?utf-8?B?Ly85SzJlRHZ5RmdNbVd3WVFQR1diUjN4SEhraVRObWY1VnJqSVlIM1NZNGtQ?=
 =?utf-8?B?N1F0a1JnSkd4RGpZSXNIR2hMNWJYcTNnb3ovWjdwVHorMUNHWnhkRU9sNHlr?=
 =?utf-8?B?S2ljR3hJVHhkUm5TK29GZkZRTnJQd3RxWktnbm4zUnFhNnNGVCtTejJaZGNJ?=
 =?utf-8?B?S0dxamFoZXMra2VMOENxOXMyNTZPcVJrcGVncHpYY2lXdXBzR2pKT1VWNjFO?=
 =?utf-8?B?ZTVabzNJdnYrZEpaMHMvdENkc1p4aXEyQkRESmpwNXFwdFJjWmhqU0NYeFBl?=
 =?utf-8?B?UEJwdlBWNSt0dFZrUHhvTS93UnR6RE02Rjh1c1M4azhrWVpDRzdOQ201ek00?=
 =?utf-8?B?eklWWFVhUWR2NEpNcUVEUlRGeThBb1hsKzJLckRycjU1MUtuNy9vS0hIQWYw?=
 =?utf-8?B?UXhGSzJvYUt3ZlpDOWtvbnFuNXRTelRhVUdXSUVSS255dzJXUVY2V2pYY2pl?=
 =?utf-8?B?QnV0aisvU1JIZ3pmQkZ3cWJOamVjWVZaU2E4UmxFaFBYYWMrUEFvaXN5Zysz?=
 =?utf-8?Q?3Y9t7wJug20z9FT81HPG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f16d24-6b54-447e-707a-08dc4484fd19
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 00:15:15.5213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_171538_900382_A5B3F417 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjQvMy8xNCAyMzoxNywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gTW9uLCAyOSBK
YW4gMjAyNCAxNzo0OTo0NSBQU1QgKC0wODAwKSwgdW5pY29ybnh3QGdtYWlsLmNvbSB3cm90ZToK
Pj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Cj4+IEFkZCBi
aW5kaW5ncyBmb3IgdGhlIHJlc2V0IGdlbmVyYXRvciBvbiB0aGUgU09QSEdPIFNHMjA0MiBSSVND
LVYgU29DLgo+Pgo+PgpbLi4uXQo+Cj4gVGhpcyBpcyBub3cKPgo+IEZpeGVzOiAxY2U3NTg3ZTUw
N2UgKCJyaXNjdjogZHRzOiBhZGQgcmVzZXQgZ2VuZXJhdG9yIGZvciBTb3BoZ28gCj4gU0cyMDQy
IFNvQyIpCj4KPiB3aGljaCBsYW5kZWQgaW4gTGludXMnIHRyZWUuwqAgTG9va3MgbGlrZSB0aGF0
IHdlbnQgdXAgdmlhIElub2NoaSBhbmQgCj4gQXJuZC7CoCBJIGRvbid0IGhhdmUgdGhhdCBpbiBt
eSBmb3ItbmV4dCB5ZXQsIHNvIEknbSBqdXN0IHN0YXNoaW5nIGF3YXkgCj4gdGhpcyBwYXRjaCBm
b3IgbXkgdGVzdGVyLgo+Cj4gSSdtIGhhcHB5IHRvIHBpY2sgdGhpcyB1cCBpZiBmb2xrcyB3YW50
LCBidXQgaXQnbGwgcHJvYmFibHkgYmUgY2xlYW5lciAKPiBzb21ld2hlcmUgZWxzZS4KCkhpLCBQ
YWxtZXIsCgpJIHNlZSBBcm5kIGhhcyBwcmVwYXJlZCBhIHRhZyAKaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc29jL3NvYy5naXQvdGFnLz9oPXNvYy1sYXRl
LTYuOSAKd2hpY2ggY29udGFpbnMgdGhlIGJpbmRpbmdzIHBhcnQgY2hhbmdlcyBmb3Igc2cyMDQy
IHJlc2V0IGRyaXZlci4KCkxldCdzIHdhaXQgZm9yIEFybmQgdG8gc3VibWl0LCBhbHRob3VnaCBJ
IGhhdmVuJ3Qgc2VlbiB0aGlzIGluIExpbnVzJ3MgCnRyZWUgYW5kIG5vdCBzdXJlIGlmIEFybmQg
aGF2ZSBzdWJtaXR0ZWQgdGhpcy4KClRoYW5rcywKCkNoZW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
