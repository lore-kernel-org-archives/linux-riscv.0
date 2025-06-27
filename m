Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0578EC7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yw0DpODjRTp+vJ5kNFSdnr0LtDOGx1Ykz0BtpRCbceY=; b=bSUW+CdANay29p
	qZxi8eTMESpzpgnZwfXqM2lbx164CHJsEg4cP74JOL5UkK8DSvE8rrv5Fr/QbEd05sxmBpsPqy+tr
	3Yy9k9CL9LWWhtJatAm3I6yYb2kOOwE0hXcU9/Yw3jaGq8rQdb7VjiH6lmgjvNu/pSSKbVt+aOr0v
	7YXB0fzuGusYtKmxThKfjm0plpoy0esgrhY8CEifqI1T7ArEcvxOREkg8zkpP9xZsuXF+zJgL9SEc
	2hUCW9HJ9pzMyb7EDUlr9S5ZeKlH1EjgxzqOSKKNTI+ITqsU2LVUGDJOvzZZH/YXKCxWpZKfHNr3j
	/XHZJKOjAk3PuLnI3v+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4dq-0000000DynM-19V5;
	Fri, 27 Jun 2025 08:41:02 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4do-0000000Dymv-1sAd
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 08:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvBb3thhfTVqHc2UKkO/3x4GZjTO4GA3X5C+C/DMq+H488iZSvCGFQ/b8l/5FmSzZYKZmypQt0ud+TTxWJLUM62lx8gU20qvoiAF9I8uk7i4kMnVW6ZwwUG4DYE3/bSDNOjG9OS00B7V5FTtSbBur30ZQwgtktpCqZxOTeOZzegk3udzcF22xHNxb8mhH9i9dIL+NaGf74LkBbQu7SCerZ0crYDITeuNIlidiPtY2soiJ21ejE5Ok+EjRbniAetvWU6O9Z1L3jAibEStZKye2+y21xMWNfNfEpS+4dd8PJezax9MpM5T/nyr3L/s1hIhRF9tBwcJL1+WAyKXoMzYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKxOMd9tsLpyXBoLHg3EIAZSCPmE+PQ5QKmJogRouAg=;
 b=bbkfUOZgeiSaM4cjcDAG9aesser46iJGhvLpTZbChGqgTpSWX1YQ5lRI52sXdmXB6VMTvJDoms4dTYuNU9l9CLNodkzsxb0iVm2M/qbSNTRbPcwIUcq4OqumkfEyFSO3k3rcmG3qFS/PXPXnpE4oK9PNVtwrewOXxl9Zw5HEmyah9dIYGBQkQlPlmUMjvFoyjfKvviIyfKSfmZqQrZhnApA3bYgWT59XS6Pfea6xSbJ8zu8Dv/KlrcHL6Pwqbf1x3+Vn/1ypcvbgnF80XkbXbdJOIPBpShpj7VwtlahkDK2htT70GLa+8ReTSkmM0ZFFXkdVIMHVPSSVqRNyvwlkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKxOMd9tsLpyXBoLHg3EIAZSCPmE+PQ5QKmJogRouAg=;
 b=mZaTVEeKtBnbPSGuc/jxaLRw89qetbBbLz8UnJuALSb0clHxSCVf1XG5wgjJ8G26tEMV/PzseBehZ0FHyXXY6GDRK4x/W/tCLQKiFRMkWQWK/w+UKtfIhONqwQBvRh9tsoo6e/nz9h8HVEmdUJ2BMZ3tMsE0WjEyhv0dZdoISZvvi6OCDkYPMwz6KE4biua09AYLN1tcdAFA7XDspyvwNGe627BAUPwx6uyQlntrZd6J/8RSb3dLKlTTsIDVSm3otmIkLCRJjcLpXiHEkN3fRi1diGS5bcl1biUCMlLpT2XMGGIamYAYhpcHqBj1nKjnr4Nqas7LLTjuzVc2hkrpYQ==
Received: from AM6PR09MB2296.eurprd09.prod.outlook.com (2603:10a6:20b:49::18)
 by FRWPR09MB8190.eurprd09.prod.outlook.com (2603:10a6:d10:179::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 27 Jun
 2025 08:40:53 +0000
Received: from AM6PR09MB2296.eurprd09.prod.outlook.com
 ([fe80::eb0d:36d4:bbb6:d662]) by AM6PR09MB2296.eurprd09.prod.outlook.com
 ([fe80::eb0d:36d4:bbb6:d662%4]) with mapi id 15.20.8857.025; Fri, 27 Jun 2025
 08:40:53 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "ajones@ventanamicro.com" <ajones@ventanamicro.com>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "conor@kernel.org"
	<conor@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Thread-Topic: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Thread-Index: AQHb5dxjaqbHoDAWk0qz9dJPHr4eTrQVK5UAgAADr4CAABUIgIABblaA
Date: Fri, 27 Jun 2025 08:40:53 +0000
Message-ID: <b579eb63-c465-45df-9558-a11c02fdb02b@htecgroup.com>
References: <20250626-af013235ad8d22421b2fe5b1@orel>
In-Reply-To: <20250626-af013235ad8d22421b2fe5b1@orel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR09MB2296:EE_|FRWPR09MB8190:EE_
x-ms-office365-filtering-correlation-id: 3967cbf8-cbd1-49cf-5e55-08ddb55653ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YTYweldSWDhGeWtjR2ZjT0hnYlFCNk8vYkdScXNPN05XQnI5ZVU0M3FvSHZO?=
 =?utf-8?B?T1NnNytmbmxHZXAweEJoOVFCLys4UkJ0YUNEanQ0TS9YcXFaZDJweUd2RUVw?=
 =?utf-8?B?ME9IYTNoU2J6Y3ZoaVJRN1U5ZzVnWWVVRDVkY0V3T1VoZldSOHJQWlRsT1ZM?=
 =?utf-8?B?ODhHVlBiWklXT3VlVVFFV1ZwQ2p2bWgxQS96OXpKUlZzSXdtQk1xWVdSOU5X?=
 =?utf-8?B?UmdEbW1zaEQ3VEF4a04xTW4veTR0V1ovUDVnRGVDOUdubTh2QVorbFB4MlYr?=
 =?utf-8?B?Z2JnL3NlL2dISzh1Vk9jMStyUkpDU3VPN3BBV3pGU1hQN0kwY2g3cTdhL1hn?=
 =?utf-8?B?WmM2c3hCTGZsZUZuOWVLOVlrRVJOUHIxWHl5RFFya1cxVFEyczdUbG1TbmxY?=
 =?utf-8?B?VEEwMXo2V0lGQUxGdjRXRGRxSWpibkxieWdzcjZnWXpuUnZxVnJ0TU8zOUI1?=
 =?utf-8?B?dmlPanBmd1l4N0plN0pvemVmdmt5QXg5a1A1L3UrUjcwcko3MXUwSFRmd2ww?=
 =?utf-8?B?Y0FhaXlTYTRtTTczVVR2Z1YyMXBGakhNL0J3dnk2eE1TMkIzTFpDZG1ZdUJQ?=
 =?utf-8?B?N0FuWXFZTVFBNm9hSHU5RmZTbUsxME13WC9NbFhkVU05ZExkU05vV2x0U0Jp?=
 =?utf-8?B?NjYzVmVRaWNkdWdiekY2d3BNS3N3alhXOFdFa1luOGQ1eDlPaWpjWHpSMUd3?=
 =?utf-8?B?NmZUWld6eEttdlZwVmVqQlhxK3dtVUdoSWVTVWl4bHo4bWh5eUZSLzAvUlJB?=
 =?utf-8?B?dDd5VHFKN21FNkpHQ0xVSTlnSHdvck96K1NSTkRKelY5b2liejFmZitQV1lR?=
 =?utf-8?B?enRrdFg3RlJSM2ZwckdxTnI5aUJTTGh4elROSWlibm4yNnB4WTJEVUhNdDhS?=
 =?utf-8?B?QVNJcDY4cWU2VFVyRkZiRU81bzVKSmZqcVZFNy8vd3ZOTGlkYyt1NFVudjdF?=
 =?utf-8?B?eGJSUGtCbFphMU10d0doeFpWaTJoYTd1TXFNdnVkblZFZnRPTnBlcElCNExV?=
 =?utf-8?B?aENmODNrMUllMUNZbWRrR3djSWRTV2p4V3YrVVp3aWE0NmRtOGRNdWZhQVI4?=
 =?utf-8?B?SHdBVi9tY3cyTDFVbGphM3YySjdUQnprem5rbWhLeHExT2ozbDMwajBrRkVE?=
 =?utf-8?B?UG9LL0VWV21lWXRJb2VaRWh0T1FjTndxS3YwQlhYcHhGSk1yZ3hweEtRNmtv?=
 =?utf-8?B?b3U0Q3kxN1lJcE9OOHBJMU9XaHJTT204ZzVVNWxtNjVBQ1ZESjloNmRaUldF?=
 =?utf-8?B?TFdNZDVqRHE0eFk5eThGeGlML1d6VnVoRjJyNmZxZ1oxUnhSU0ZQRm96L0pE?=
 =?utf-8?B?OXRFcmtOSVVuaE1lTjg5NU9sQmFOV1QrYmx0dkVibHFOTTVqYml0d3dCTHZL?=
 =?utf-8?B?S3Uzd0dENHRXdFlJNThXMXlOWnlXL2l3SzBUZlcwSzJ3YU1EMHNTY0U3bTEv?=
 =?utf-8?B?SkswY3J0V3FDTm1SRTI3dFFTTGU1cjcxb3Mxbis3dktIVkNpU294ZTA3Y2pF?=
 =?utf-8?B?WmFMVTlDNU1IUjB5U084aXkwdDB2Uys1Z1ZMUXV1REtxRGJKM1YwR1ZTWTdT?=
 =?utf-8?B?UkYvNUhJRDV4dGVrdWh6K2xmWldaVFA2c0VSeHpFOXBqVmRwV1ZrcFpleVdT?=
 =?utf-8?B?N3N5b09RN2VxZzR5Vmw4VVFoK2NrekExaU9lcDNMeFM5ZVJlMnlpd2MyUFJz?=
 =?utf-8?B?QjFSQ1BLN0FJb0ZYUTByNHJMVG1BTThRNjJGWFVtRTF6bHZ5MmpVOEgzV29x?=
 =?utf-8?B?ZzNkTUdNRlpJWlJjYVpkWUtCUzdka3ZtdW1OcGhuMDU5RlhsM0NYUG45b0w1?=
 =?utf-8?B?VzNSZ25kMnAyYlVhQWVNcTQ3bG5NNVhNMEF6YUhRc3B1MlJWOEFWcnFHaEFJ?=
 =?utf-8?B?dXc2ejFBQTZJUm1BQ09mV1c0UVdGMGVxdE12V2lac2R3enZYYzJhMENqSWpS?=
 =?utf-8?B?MGRGYlRLUWo1VjBNT3lLMExreGxDRmR0Vzk1aHJGNTlmL1RNemJyM3RZbEhz?=
 =?utf-8?B?SW1wdzJzRm1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR09MB2296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmppVkVvRW5EZmxJSFA4N2Q4N1M2d2cydnVBeFFvay95VFhoQTMxb1pDVmlD?=
 =?utf-8?B?M1ArUGdtQ1Z0UkNrTkp3MFpGaklLVUowQ0UrU3p5YmhoT0lkWEtYbHpOblJZ?=
 =?utf-8?B?dEhWaFl3dEtpa2JVZVJsTWFNcFNnVTFCSm9mNGhLblkyQndxSFVqTkZRckxE?=
 =?utf-8?B?bUR3czdDNXM4ajZhT1g2VXBwdHZ5RXNWaHVoUFYwbm5DLzROL015ckpkdTlT?=
 =?utf-8?B?MWk2RlJWRUp4ZWpKeHByNEtidmRrNUFPalppVHRMemlOUS8rWG5wSnVWaEs5?=
 =?utf-8?B?K3N0eHBHcVliN3VGY1ZXV0xqUVRYVWwza1haT1p5U00ybmNHbDhOTXFBWmNJ?=
 =?utf-8?B?L3JJYVp5VjlmWUU5cjFqc01Cd0lNR3NmTlpMMUdOWVRSVEcyR200QWNjMCt5?=
 =?utf-8?B?QWZmczJ3RE9OTzlYNnJsZDVEMXc3NGt6SHFTWHkyRkdCak0rU0FPV1VRYlpI?=
 =?utf-8?B?ckNJMGhrTnlXSG5nNXh2K29zdDI3UDNkOWZXWUF4cFU0LzRERTZnaUNlRENj?=
 =?utf-8?B?ZE5paFZWR2o5ZXNWZTdlSjZ2UHViVE4vejJmNUdwRWNFOGtVS0xlWVpXV2R3?=
 =?utf-8?B?SjBRWFgxbHhFSHpkQThqaEMxZXhQZXRBa1lVUzBMUXZHZG83ekxnWnRXaWQw?=
 =?utf-8?B?eUJON05ZRUN3YUlua1ltWjhUTkI4a29SMGJsZ2g4MmJIRi94QUc4QXdzQ3pT?=
 =?utf-8?B?Yy82Z2VwdDZ6ZXp2bGFMUjNOWXhtV2dVV3lKNHFRYzdVV2ZRYnVKSmgyQlV2?=
 =?utf-8?B?QWpiRDY4dDFMS0lla0pHVEJQNlVzRVhyT0V3dkVpZFJNVlFJSmxWa0cyYVhI?=
 =?utf-8?B?dGhuOG1Ucm44NnZNU1BzcFVJVS83bkVSMmZ6YmhKcWJGM0pOMjlJUnE0b0s5?=
 =?utf-8?B?OG1HVUtNY3VuOTQ5LzlMSWRjWXdremJiMTRCRnkycjFjQXpSckRnN0gxaVc1?=
 =?utf-8?B?K2hvak5vQnVudVNmR0NRNFh6L2dNK21kWDNUOWNNTXF3bUdGYTEzL2FSV1VQ?=
 =?utf-8?B?YjJwT0pnVWRNUXpEektuNnFpVWNHemp2bDJsWnhmNVhrcXFZYTAyL0wzVEQx?=
 =?utf-8?B?YVhTcnJoWDV1ZEdZc2lTT2JYZnl3NjM2eWEzQTBsbm1QU1h2N0VNcGRzdUVk?=
 =?utf-8?B?RVpzeW9qNDlSd3AyaGRMb2ZHWTZxSHd1Nk8xeE12czRuTHAvZ3VTZ3FaTlpK?=
 =?utf-8?B?NyttQzFCY0ZabnFjTDkzQktZQXYweXdzVjIyUkNZaEtVTElKeXlIV1dpYUgr?=
 =?utf-8?B?OTVISnZrQkRGa2FTM2haTUFUUC9uY24zL2I2dTVlaXVSb2RWcGJZMXB1OWc2?=
 =?utf-8?B?aXFFNHlsUFh2a0VSRDJVcWVLOW1lcXdNdlg2NUsxWHFtOXdXSXVwVC9TMlY3?=
 =?utf-8?B?cS9FNnBqblhsWHR4bGg4R24vOGlFWmVXREM1RVpTajhqZ2hLUFZMSmZqZkV6?=
 =?utf-8?B?WW1xTndjS3dNQi8vRDhyYVJacWgxekR3YXNHOUVmeDI1dlQvOE9GZ1lDcE91?=
 =?utf-8?B?R29KYTFySHhiL3dIZFIvUmxFOVY2aFBhZDZ5eHk0OSthSmFRbTYzbS94Mi9V?=
 =?utf-8?B?OEpoWHBSclUvZ2VIZ3YrRmxzK05EeDZoUUhwWk1IRFpmVStSWDNEbkc3UGE2?=
 =?utf-8?B?ZVBpMUE1WkNGRzhIQ2xWSnc3RmlCT0Y3T0lxOVFOMzZINiszbzcvWlFYcEU0?=
 =?utf-8?B?bzVHbjBDQ3V0cjM0OE1LWDRSd2tQaysxK0tETDNqTmhsdHo4MGRuY25BdEtp?=
 =?utf-8?B?V3A4RmE3Nk95b1g3Z2kwc2VocVRKWnlhT2dvVHFaYlFoYm1qaWl2T2ptWjF0?=
 =?utf-8?B?YzltcWpyZ1lHRDVJeEkySTc4SHhQaVdpdjBDNnhHai9nUEhLUUtHNTRjWHlj?=
 =?utf-8?B?bTBnVS9yT05MSGowakxJZmVudGhreHlPRTVoZFpMMHc0MERHSzZWMEJzL25S?=
 =?utf-8?B?V1ErR0tiU0lEeFRyZUF4M1E0Q3NTdmpnR2hnYWRmMlVCM0YvRmM3dlkvY2lr?=
 =?utf-8?B?cithTktad1NMT21jRHI4REgvU1dmUlV0dngzZm5CRm9uYTFsU0I4RGdaNGph?=
 =?utf-8?B?UTl5VGdSSU1YRG9JZ0IwWkVVMGJIRC9iT0Z4R2hCcmRqTmlkUFR0QklQenlI?=
 =?utf-8?B?andDeXRuK3dGSWRjTVFHbjJKeVRpTW10TlhTMkt5U21LNkY1OEpmMitRRFky?=
 =?utf-8?Q?ESnNVe2Fw1xMZOl6EdrjEgo=3D?=
Content-ID: <4332AD80B8AF124E80B110471B3A8A5A@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR09MB2296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3967cbf8-cbd1-49cf-5e55-08ddb55653ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:40:53.1717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANUU7/gWXtr313lc1ul6ze40BD1kFuAFPvZFpOUWKzz6ooYpTs7RtWEEe0kwAVTnZC90dSrqpChrafwFs7r6iFA/Ismc5scwtPkrFpFpD1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR09MB8190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_014100_673288_80635312 
X-CRM114-Status: GOOD (  24.42  )
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

On 26. 6. 25. 12:49, Andrew Jones wrote:> On Thu, Jun 26, 2025 at 11:34:21AM +0200, Andrew Jones wrote:
>> On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
>>> On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
>>>> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>>>
>>>> Use the hwprobe syscall to decide which PAUSE instruction to execute in
>>>> userspace code.
>>>>
>>>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>>> ---
>>>>  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
>>>>  1 file changed, 17 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
>>>> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
>>>> --- a/tools/arch/riscv/include/asm/vdso/processor.h
>>>> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
>>>> @@ -4,26 +4,33 @@
>>>>
>>>>  #ifndef __ASSEMBLY__
>>>>
>>>> +#include <asm/hwprobe.h>
>>>> +#include <sys/hwprobe.h>
>>>> +#include <asm/vendor/mips.h>
>>>>  #include <asm-generic/barrier.h>
>>>>
>>>>  static inline void cpu_relax(void)
>>>>  {
>>>> + struct riscv_hwprobe pair;
>>>> + bool has_mipspause;
>>>>  #ifdef __riscv_muldiv
>>>>   int dummy;
>>>>   /* In lieu of a halt instruction, induce a long-latency stall. */
>>>>   __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>>>>  #endif
>>>>
>>>> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
>>>> - /*
>>>> -  * Reduce instruction retirement.
>>>> -  * This assumes the PC changes.
>>>> -  */
>>>> - __asm__ __volatile__ ("pause");
>>>> -#else
>>>> - /* Encoding of the pause instruction */
>>>> - __asm__ __volatile__ (".4byte 0x100000F");
>>>> -#endif
>>>> + pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
>>>> + __riscv_hwprobe(&pair, 1, 0, NULL, 0);
>>>> + has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
>>>> +
>>>> + if (has_mipspause) {
>>>> +         /* Encoding of the mips pause instruction */
>>>> +         __asm__ __volatile__(".4byte 0x00501013");
>>>> + } else {
>>>> +         /* Encoding of the pause instruction */
>>>> +         __asm__ __volatile__(".4byte 0x100000F");
>>>> + }
>>>> +
>>>
>>> cpu_relax() is used in places where we cannot afford the overhead nor call
>>> arbitrary functions which may take locks, etc. We've even had trouble
>>> using a static key here in the past since this is inlined and it bloated
>>> the size too much. You'll need to use ALTERNATIVE().
>>
>> Oh, I see now that the next patch is handling the kernel cpu_relax with
>> ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
>> a syscall inside cpu_relax though either, since it gets called in loops.
> 
> (Another follow up to myself...)
> 
> I guess with the vdso cached result it should only be a handful of
> instructions, but it still seems odd to embed a call in cpu_relax.
>
  
Hi Andrew,

Thank you for your comments!

> Thanks,
> drew
> 
>> It'd be better to just call the standard pause (0x100000F) even if it
>> does nothing. Or maybe there's some define that can be added/used to
>> select the correct instruction?
>>

We did try using an ifdef/else in v3, but since that would have to be marked
non-portable, we decided to go with a hwprobe call. 
Since the MIPS pause should behave as a nop on other CPUs,
would leaving both the standard pause and the MIPS pause calls be an acceptable solution?

That said, I am not sure how this would behave on future MIPS CPUs in case they support both encodings.

Best regards,
Aleksa

>> Thanks,
>> drew
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
