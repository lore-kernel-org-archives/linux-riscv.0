Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAF7CF6499
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QVSVTfv9aFYr1qB25JO+JSYYFXord1W1/QBlzgNV5lg=; b=qwzfxz15EjqHYt
	vAPGMpMmKO85bfaG/2FWGG8crZoGmreaJu4kkq2I8riArLSrrX5Wzf3QlmIl+QUE2F7ce5TE0qb6C
	RUz4926PYdiwAhBoBkyJmbhvOdNvUaTU8eqsMbLqwCYmM+OthjFvD/FYAR61nfcUmT5z/usrRTkUS
	MCzx78okGfmLqAKS7BQYS3QzpyEOhEAmar466AyGRs1FFzeQ2sw0mfLJtYokijfYy7uAKiSMU6zwW
	JP5GRPMnjoY5PSbmSPKkOof9J4p8edgx8fmLob13TWMonOK+x/IhqXrSKkXAARWr8m37h/cZalX8w
	TVVKchZFN0GO4GSuucNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sutHl-0000000ElJw-1HcN;
	Sun, 29 Sep 2024 12:44:25 +0000
Received: from mail-co1nam11olkn2080c.outbound.protection.outlook.com ([2a01:111:f403:2c16::80c] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sutHh-0000000ElES-0Kb4
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 12:44:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULcsT/VN3UJAEyJDsSU85kvdAjy/0H/qdb8YDNtD7rN9L7R+D5w0FJ5MhJyG9mpKIK3E+eNhuAa46Tu6trhZkjhj5hfKnWYzn8eV4NaHUv1dxxKVa6TMBkzDfxjGVfALa9WWZ9fWTAJmpBcQ4u0NAbblw64vvLepnCU949aNuwywSfZOTP56AGwgWOWTiLc4fOTAhMXSQfFYLXZMk2G/GywL4kUBwZbELxaSzOe9Ug0L1D7SaSOePML1w9adTISjbQvYQit6sViSBIxf3J8AIrRDvxqDRMyJImzfKtB1JNVXqd2uSUg+EYSLGsgjGmDrJImn797bG/HT4RSg43RhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK9pD9dA/UMuLshJX9bm1k+TiVPLjcCvgt2nzEM2On0=;
 b=w577RBccFo1ZVTiARgu6+d/7YwG4s0tCc8ccxjYGOQaov+5gN5P8dza4uBf2Uid2ewF03nz3zRD/Imz6FlvEOlsV5klf5w0Kijgxa0olXhJ/xpq+zPR7AOiCNx28oLjcBV+Tad3jX+G2Rc+o7aRvqzebZZiSgTzU1GUct5/MHP+jQ8HXSLY3gw3FJ2qtBJ5uJemYOSpnlCSy976IWtHtnCG9mF9RT3GP2qc86GVPOeqwBA8m6J9vLqDKpyRUpq6lLKTcFS65QU3E1FSG1ilc9i/E1+eS1JxNLO3kMyk5id349NApAJMdaiuXn6V1sZrIcMDGqrVr6J/ps+TOSgej5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK9pD9dA/UMuLshJX9bm1k+TiVPLjcCvgt2nzEM2On0=;
 b=EpXb7mLa81BqBXMSwV4FPWggf073TH4yC5/y+SisnuDL47LPIfi8AnYbUujseHGoDgboNuAJWTjtOS/IWmXNb3otfyFht19pOtPE2se1HDplgi/SBcjj68sxySh5dYNcryE5TEHOm93h6DHHOSEOsyrVOnMnB/m+yxVagD48NLWrE+CD6pKcxBz3X+7WrUd4HsJRaPI3Zxvb2ocRJY4fGzZYrpYSxh9NOefovhq7xjYV9tGuO093YB7v7La4rr8938bBx0KHZ9FK5WAuy7vHQTXHvXWEcSeozM9azpgmdIjcmRcOpp/OLOqVVQidAee8aC0DsISl7UPEdRK73o/1uQ==
Received: from CH0PR20MB3932.namprd20.prod.outlook.com (2603:10b6:610:d8::9)
 by IA0PR20MB5705.namprd20.prod.outlook.com (2603:10b6:208:437::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Sun, 29 Sep
 2024 12:44:08 +0000
Received: from CH0PR20MB3932.namprd20.prod.outlook.com
 ([fe80::f1b8:f67:339b:8e13]) by CH0PR20MB3932.namprd20.prod.outlook.com
 ([fe80::f1b8:f67:339b:8e13%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 12:44:08 +0000
From: Aoba K <nExp_0x17@outlook.com>
To: "charlie@rivosinc.com" <charlie@rivosinc.com>
CC: "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "conor@kernel.org" <conor@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "evan@rivosinc.com" <evan@rivosinc.com>,
	"guoren@kernel.org" <guoren@kernel.org>, "heiko@sntech.de" <heiko@sntech.de>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "jrtc27@jrtc27.com"
	<jrtc27@jrtc27.com>, "jszhang@kernel.org" <jszhang@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "robh@kernel.org"
	<robh@kernel.org>, "samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"samuel@sholland.org" <samuel@sholland.org>, "shuah@kernel.org"
	<shuah@kernel.org>, "wens@csie.org" <wens@csie.org>
Subject: Re: [PATCH v10 00/14] riscv: Add support for xtheadvector
Thread-Topic: [PATCH v10 00/14] riscv: Add support for xtheadvector
Thread-Index: AQHbEm1FbzdD9GcS4Uub6j6FPFxzJA==
Date: Sun, 29 Sep 2024 12:44:07 +0000
Message-ID: <a1f41f92-6bd0-48b6-a931-e7ad7aba18cc@outlook.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR20MB3932:EE_|IA0PR20MB5705:EE_
x-ms-office365-filtering-correlation-id: b444aba2-c96a-44ec-6e4d-08dce08468d3
x-microsoft-antispam: BCL:0;ARA:14566002|8062599003|8060799006|38102599003|19110799003|461199028|7092599003|15080799006|102099032|10035399004|440099028|3412199025;
x-microsoft-antispam-message-info: G5EoB1JQ1dWx6ULgBfNljYsad2rCscBLQAPtZ9y8dRl3zOWeup8vLHFbOxadvibfzH7todwMsmXajxkcoKBUQ3IWdIHvgtKffRY5+P/rG2S1IChvksaW8UVigeD6iRSNK0ZEv82fCF0a6mLFbsWfYLI6xPWyjdF/9Astp8dAXuokZzXH3xmsvIOWGKefL12lDO7fxBi4Ty61yJaWEk76i4DwKhYV96wf73eLl4n2E2a3pU+f50k8rltHKqX1DNncGo7BPY7qmplpuY/VCFbpIXo0W4R1VpmWjrWLHIjnt+usfTBM+z+qLMwx1OQIYLfQMOkXUwVOVVZjXyFSQaSKG5kzL/Pbnm4sIHo0NXtascFL0OE1ZIMimQj7iCvJB/jN5vF6jfL9glNm3HUdbA69csMOZfudjMPBhh1K/5i6m+1o+BK+PajubBI12FxAEANvF53gBdiOs8A31jY/kip7pvN048d5Roinp74CLr60n6kL/Kj+7qWRJxXCtJYm8Z5bW4t33NUKQ8syfZ4Ygl7cl2v8f1dzF9J78qkHczbHK7c1dc0UBDFGGCZFmfwR0StEhmb13ail43abqGmg4x1KR7+JVGJS128cSASkf/rFFKmspq+N9LtgaXiDI1/iZ6iSUQSI62McDOdwRnao2CS/ON27KYoaA64yUy2Bqo2nia1oNi+xjn1oTCwWTNu8tSRVPKW+sUwKzh8IkTUZhYTCdRwMvNZcbrg/HNduhf8m0x/YjI1wncbTKQ2uqUGiPBwo31ETEv8ZuA9jbHsERLBEA/Bb9weCFmTg8DTVOK7rkxoqphL1MC28YM72HigJEO4EytoflRVQ8oTX1yqBoLm9q42MY7G+oD+U0nZrgVUrUfM=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2diaXlPSGdDM3FFV2hjS2ZkaThFcnQ3QW8xR3BXQk55OFZOK01wVTBRK0Zk?=
 =?utf-8?B?Y1hRaFNLNllsNDlyQXhoQ1l6dnhYTmFmSFB2LzltZGRyTUc5ckVRdnFOTi9V?=
 =?utf-8?B?bks4eXZac1gvZHdkcnlsa2xoZ25Sdmk5clNiTlpNaG1EQ095bGRYWFZpa1hj?=
 =?utf-8?B?bXpzd1FONTIzUEtpaDllS2hVYWlJc1RJZkpMZTFKQ2E4RHp2SGtUZlY5amdt?=
 =?utf-8?B?YWNySklTWHlNaTZHTTdNWE1ndVh5N1hhVEdpNjdRQUgxMEZPMk9vZFRrbmZP?=
 =?utf-8?B?N21ZNk90dnNMVUVkQkJ1V2gzVXZYNVVoeHpxVjlibWdnSVViNHVpd3BQa3FW?=
 =?utf-8?B?NzVyYXBLeE1VMElXRkI0b3lPbXA0VmFPQU42azgvcXg0UDBSVTVkN01Ic3Rs?=
 =?utf-8?B?TmJLRGJwY2p1cW5MQlg4aUdHY21aYTBOWWRtbXNCVUxTMDExODZHVDl6Q3F3?=
 =?utf-8?B?QW9YMjFUUWJLUDh6WUJUb3dsY3o5WEF2ZzRVd3FPTG5jQTh1VFVKOStzenJH?=
 =?utf-8?B?aENjRjZmMnljVHkxL1JXRytKS091RHVpdS9NWitOUXV4V3I1QzBweWNwdklS?=
 =?utf-8?B?WC9ENGY5NVF6RGxkdExnR2laVXRvcWNGaXBrV08vVVFyWGlMZWpYMURaQ21C?=
 =?utf-8?B?Sm9PV1hRYVRzbklFVU9mcmJqRVlNNUlDblZadXRKWXZJZzI4bFVBTWpoVWQ0?=
 =?utf-8?B?Z1RlNk5uSTBhL255TURTY0VlOEtGVU5yaGdpeW5mRlFpeFBkNGdwdnZUUWc1?=
 =?utf-8?B?TFNLblc4eC9iaEcvY09ZWWpDelJhQk5VejBva1ZNb0Z4UE1XeDF6WVdyamFr?=
 =?utf-8?B?TkNWVmNLbFZIaXZCczhlWkxuUXpKYURPYzRjTmJFdlFYWGFpS1QxRW9TNDM3?=
 =?utf-8?B?c0RyUy9YejJDN2xJN3prQ0dyNjFVZU1ySWQ4Uy9oWFBIMTQ3aGVuTmZRbDB4?=
 =?utf-8?B?aFV5bWpBMjV1UFpsVENrZmNFWTZ6WFluays3clZ3bWRlMlU2Um9ROURpckJ0?=
 =?utf-8?B?aTF0WDJ2eTRCQWhWTGNSb3QvYTI1UldRY09MSXJ0WnhPQ25rdDJqVHhySm5X?=
 =?utf-8?B?NVFSK3p6bGNEUXdZVUxJZ2NIVTY3QW5CUC9KRVREL3k3S3pKUTBXZ2w2TWpI?=
 =?utf-8?B?UVFrM01mWGZ0ZHB4ZTJ4VUlqSTVWVVBmNm1zcmw1MHRPV25ZNnVzQTE2MmlG?=
 =?utf-8?B?NnFCSEk3a0trZENKbHp6MlhYQkRsT2cvS2RkaXZxUHRsR2dDdTRWekZDZ3ZM?=
 =?utf-8?B?WllHVFAzL0xXL3kvZXh1N0w0WVdMK2IwaFZqWFpzZXBjVFBEU09VenBrSUpI?=
 =?utf-8?B?YUpGemhXR0h1TmFVN3dtRCtyY1JkWFY5ckRybnVyNmNGdlkxSzl2U1lMM2Nw?=
 =?utf-8?B?Y3dzcXhkeGlmdTBYTW8zdUc3K2pYaXFWQzNVTTNuRmNvQVRPRThuTnFyT3Qw?=
 =?utf-8?B?TVJZbVBPSjJGR3lYZGgxYnByTjR1ZXpmQks5QWZxWTdNSmVuQVQ1L3BOakVa?=
 =?utf-8?B?T2pFZVhWblhtb1B4QUp2VSsyMldYaEZiSU1XUnhOVUdkNmtXZTNPVjhZR2Y2?=
 =?utf-8?B?dmNVWmJlY2xkZXZIMHNpeUFHVnVJejNtUjRHMFRmTWNEZ1drdXcwSFdYY2tu?=
 =?utf-8?Q?KMCCtv4TrLFbGeaU9J0DIdce8KSDB2tkxoJKnLZEQfyU=3D?=
Content-ID: <6487AC2D11AF5346BFE8F7280100128B@namprd20.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3932.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b444aba2-c96a-44ec-6e4d-08dce08468d3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2024 12:44:07.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR20MB5705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_054421_633679_6A231A39 
X-CRM114-Status: GOOD (  12.33  )
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

Hello Charlie,

I've been working on bringing up the Sipeed Lichee RV Dock
(which also uses the D1 SoC) with the kernel patches you provided.
The patches applied cleanly to Palmer's for-next branch,
but I've encountered a couple of issues:

1. Skiffos Compilation Error during the compilation process of `cgo`:
`unknown relocation type 17; compiled without -fpic?`
Unfortunately, I closed the terminal before saving the full log,
so I don't have the complete details, but the result should be reproducible.
While this should be a SkiffOS issue, mention it in case SkiffOS is the method
that you mentioned for bringing up the device.

2. Image Building with sehraf/riscv-arch-image-builder:
After building the image, the device failed to start at an early stage.
I suspect this may be related to incorrect RAM size detection,
as the board only has 512MB of RAM.
Interestingly, the vendor image reports 1GB, and the Sipeed website also states
that the Dock has 1GB, despite there being no extra memory bank present.

You can find the boot log here: https://fars.ee/bdYk.log

Any help would be appreciated, and big thanks to your work
to make the efficient part of this board to work (again)!

Cheers,
Aoba
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
