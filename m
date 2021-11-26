Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC06C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVSLp+d5kPpEAuw81qD8IWivRSgZLz6T4CiAvWSfT6k=; b=tT/IfAVtZrFf3E
	EcH2IqvJpW5VYFoYR9Gfcbr9PPYvQECHAyfj9xsTnCqrMi4+v3H2PBRyLbkHo3A0yy2JpCA6Zz/g4
	rEndyKa0PSqL+TbxTR69RFu4D6fvj2L3ES4cQ9VVySMMEqzl6/Gk6DPB4ojr3oAegnKfUsEncTBlc
	h05AXNmAOZF4grzve1tJ35k8fbLLPtUBD0foChaxWWAXI7LAwIoS0UT8QeUY500sldr9MVx/kt/TR
	fJTKiK9uMFvpJBxMWUCp9HNWJCBY5s3jAajAroBSsbfYAe2I2SgWHggDfon6VNg6Nr0HzUuue49yY
	VXGdrB1YhmbCxbQaQCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqWoK-009cY8-AB; Fri, 26 Nov 2021 08:42:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqWoG-009cWo-9V
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 08:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637916140; x=1669452140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bopoAHdyS+UMVLVxC4y85PglAuL3qHZLeb2kPBiYvK0=;
 b=cz07dsGJaZ4MQ/cO8VwflqksznimdX/nJdNqLVnLfgG1UxvmrGQ+g8A5
 er7h8i752Zv2HmkDPW+f/Ze1ObcIZ1pyrCSh1ATHV9McdHdWI/p8ChVYa
 KWZHuvLyJfz1umURGiJYv2Mp5Xd0jOikmRDalIGbRJZIa01J/l4eDL9ol
 M7U7DQDNGzNFdcrHmRyJ7mkJh26hVsO2fbpiNz2DrCbzIRp1XoRgF9Kpd
 PJEidW2quN7AVXUiIWRgLYYTKgyH8aTc9o19ODo+QL7vXa5IBsAHe9/91
 hHioXQVJLH8iYWwGqXPaw6Tg2K1Ur+kbEiIMgE0kqZ52haT9pLkz97Rdv w==;
IronPort-SDR: NJyClYPg1e6XQD3TMl1u+vDzywtKiQzdA8OcRr1wN9jCe+I89PjPylxY7N6pm8w6b2tQ8hX9T8
 gPYZshWD5Vnc2QHdX7LAtomm4g1y9O4Z/Rbne0KLmvfJeYM22rPVyh/pt+HMc/rUVemzmmjitN
 pAiAHvlvVpLFyAwG0A6aOPVLkFyTy4eXlcFcgH/ItrL2QcU/N8anwvaJq0A7faynS1YoGiyzXE
 GDlH7chZ1kl6jbIeiuUjxOQfYPyZG4PJLPV6YM+jJESK91fhx4Bnrqoo20qHjWyCyQ2hzGREp6
 gFS79Y47aZD8RnBdo+zdbAhh
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="77658126"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Nov 2021 01:42:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 26 Nov 2021 01:42:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 26 Nov 2021 01:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM7YMTlDoX8Hwpvgn8JMeWcoQDVD7N6HaMVBOuv7ffcA8Jvo8AvhoSGkxpP9i/TIaBokSEzd9H6szNgoopBeGujmzNpNi3yUEicTWWYNDGB8YjvBBuB4Mzzb/A/Az+jhDp8feOxXmVjeQ+JdzJzhS24SZk/mK15WSu9Vkv4D+MOUiTfB7HggwFJrxioODeXyVhFzaZBb4a2RcPZR7PMytdpNhWU1aCIaVmC74QHPjdSCaYttgxhAwAPWG89SfYdEBqSqYD15VEuu+gDJ7kTv8EWvc9YhpnHQF0r9hNRkMVPKP39hZ5vEx4HACTvhP04+1It0hYvzl+E9VCZF6Jbx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bopoAHdyS+UMVLVxC4y85PglAuL3qHZLeb2kPBiYvK0=;
 b=dJDZyRSJCsOIPBVi+30ex41UDi/BLswCQvEa7/UCqbbmwphxckZdVkNF0f5NVjxntcValvR8JYAg0BCy/1X+Kz9HIYUZmlp6s7iHvPR5p/A54X1ss3xaVKg5rVer3IF8r+ZL5Ks5DG6Q3/Ae5PVCUX69FRp/HkivHygb2pBPqSPm750BnwQaho3EYfZhe4RpKO5kXad/j6znK6kelAql4dcdWpsbL7tIgUqAzHNr6rlRSTa5ZeFHL4iji2DP2NtF/exXTFEymdMBAY56s0QWXNBh2v+kiT7TNpFfTNo3LF3z/b8RCqMFjmi5DnMSXnfFi7+4vXWWP+QuOSlssipTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bopoAHdyS+UMVLVxC4y85PglAuL3qHZLeb2kPBiYvK0=;
 b=jJHXRpZzmwGooQefQtgj7EWEK+NTgOYXITKXj1PUar7nqDDFSWfZrjKb+XCTTbQr4uRxrk914YOZQ0Jex7hXcq93BSrIvEgtVXUq8MKahmA4m389chb/uZpnYc/L9aIgO+UWX/ctCi5+jOEdUJFshxqFKjW5CHTcGxKMqWp+SQw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1551.namprd11.prod.outlook.com (2603:10b6:301:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 08:42:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 08:42:11 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <damien.lemoal@wdc.com>,
 <Lewis.Hanly@microchip.com>, <krzysztof.kozlowski@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/9] riscv: dts: microchip: Group tuples in interrupt
 properties
Thread-Topic: [PATCH 4/9] riscv: dts: microchip: Group tuples in interrupt
 properties
Thread-Index: AQHX4hGOIk/aasNjyEiJtWEkmS5c5awVf0EA
Date: Fri, 26 Nov 2021 08:42:11 +0000
Message-ID: <be6a6a8e-0642-80b8-5503-cb4d059ee278@microchip.com>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-5-geert@linux-m68k.org>
In-Reply-To: <20211125153131.163533-5-geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7f97867-58b3-4e90-60b7-08d9b0b8a3c4
x-ms-traffictypediagnostic: MWHPR11MB1551:
x-microsoft-antispam-prvs: <MWHPR11MB155199855A6B870EE35F4FED98639@MWHPR11MB1551.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7FaHR3SZhcocSxapOsAf5FqhPAhYygs60yQHmKdqwAPoT1+IEq6jhRDKf1B2kbllUr159gU1KI6Guoe1l5/1q7mgTAAHGj0sha5kBA1ubSmXY5LY0ZiW6F3Bt9bmk+J7mLcKEYzNYuRfJOlkBRU0BzElIs3vsnitZeRyjhTmPQAZ8/8Vc8nBTkp6NBHP2MUT5k8Z5F0UCa6M0iYVBDQ/WuGCF9uXkuE5uFZMLAAJ6r74bY9Wvr3kuLp15bIraV3Bl8IRWT49386OJhDtOqCsy8FZ8zKe08qtdorK1n1ztFOKfXZ207brYE7/c2GVXVcB+4Y8NCcimVNgsWTekM/XkgwUfr5KUraIRnmi0y2MLhT0ne7BR5G4nbkoO6hLiTJ8vcHPI66oy/pLsc1fSAo7WAlX08t1V0wkDcTSpD2aPXPCt/wW/QxCFFIAhAfomTXsOdijXF7/0gMNgWbiGUoE15MamEd9FvRTz0sCtBrx/d5pSa8To39AzCj4vc3YhQD3tYF/SdgSmRKsVKkNIktb3w+lnANJAC1Eudhd/hHcoQFAJsrHzjgynlNWwSarMsbK+XH9JncJSS6U0F1wW7JZFDiwj0rX8C9tZ5k6P7/3AivJXOLX1u3nbinKorCgd6SC2wVJT1kiVTSq+ebYhhFcBYypGwq4IqFIBU5F1KqKHftlg/V/cGyZ3/Ap5aiwLgThCUusQkSlE8e72uPYCNkUIu8XCrIckJh9jHB0jMcNkaSoxNBrT8HxoSlz/3xafqsSN31b66YMNhWS+RgftLmZLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(186003)(31696002)(26005)(122000001)(8676002)(36756003)(71200400001)(54906003)(53546011)(6506007)(38070700005)(6486002)(38100700002)(86362001)(91956017)(76116006)(508600001)(64756008)(66946007)(2616005)(31686004)(66476007)(6512007)(4326008)(66446008)(66556008)(5660300002)(83380400001)(8936002)(110136005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW5nUXFuNmZOZDJYSE4vZUpHaU5pd3V4bXZtSFdVUXM3ZU9NM2xnczBPVk42?=
 =?utf-8?B?Wm1VS2hlVTI4MS85bXdXNWlsR2k4dmYrS0ZIK09aMStpMXZGSlVSb0lZYjVo?=
 =?utf-8?B?VkRxUmpKNlE4WUpBL3pIOFdmaEtrK2VjS1kvQ0k4eVI4TWY5clllMkdMKzFL?=
 =?utf-8?B?RFVBaGIyTTY4UkV1TUNYUk1rT3VaOEhmVVYveWNZRUJsckUzQkUwL0wxMndK?=
 =?utf-8?B?UG5BTVFNVVJZWTRSQlFwL285ZzIzcWJDY3YrLy81TXRlNjQ2U3dKZmpxZDJj?=
 =?utf-8?B?MXZKc215WTdSdlNPV3FnaE1LNDN6a1dLSEJhMXhPUkhqWHJVNXQwZ3VjMnVD?=
 =?utf-8?B?Q2dvQkhraUhyNFdHL2dMbmxaTENNTmxTbWxtdG1vd05zQmpMcmRkeDAvK0Fn?=
 =?utf-8?B?NzJpR0FqY0dTNFJmcVBQQ0R5S2p4aEozQ0dzZlQ2RmJTbXJkcHJSNlUrelJ3?=
 =?utf-8?B?QTlUeGFCTit2dDVneDVaWFo4MERWNFVSSFV0RXZqcFVMeGtRV3ZCdng1Vlkw?=
 =?utf-8?B?Ti9oaTlQWTJtSUx3eTdWK0VXMnUrRFg4aGhHOUJ3TnF2NDl1TU4xZ2g1QWFL?=
 =?utf-8?B?aG9BLytuLzVFTm1TK283TVNiVjVsSzQ4OVYrSzErWnI4aHBCSVR5RFVaaEdZ?=
 =?utf-8?B?NTFqdElIRkU1T2k0MHVkM0xWc2ZOL01EN0tiRG40S0xJQ3FIcGM1UFJHVG42?=
 =?utf-8?B?QzAreWhxUUNXbFFjdlJnK1RtcjdxQndIa0pBVVpLbUtkZy9UamlsdjhlWFgv?=
 =?utf-8?B?akdOYWkza1JTWXpMcVF5dTk1TjBlYlR3Q2pMdmhyNWtWV3NCUTM5YWZmNXRW?=
 =?utf-8?B?Sk01bkd6cCtnL2EyVFhXbzJYaE9hWExPZ2JHKzJTcEpHQ0p0Vk8zOEJidXdw?=
 =?utf-8?B?L3Z0eHJwbW1reG8yUlZqdzIvYnJnZ01WMVRFa0ZHMXB2VWxCVVJ0Y0ZCbGNC?=
 =?utf-8?B?Q3Y2UHM1czVnYzRDZFA0b21abUVRSWZmbjFpVUIyazRPeWc2bWFzcURlRDhI?=
 =?utf-8?B?MVA4TmpjZlBGVXpZanU0OWtiM2w0cDc0VERKcG5hVFBnQzRhM0QyMXd5OXF2?=
 =?utf-8?B?L0xjaDlwck53aXBpZmxjY24wOHdRRk5NTk1nY1FPWTV6M2tpZTM2UDJzS2Fx?=
 =?utf-8?B?R1hReVMrMkEwd2dOSjhKSnpFblJCRFB6OThwNjhvTm54RFhJeStsa3RHeDNJ?=
 =?utf-8?B?N3AzeEVUZ2N3UmFRMlA3MG0zWGJCQUh1dXUxcXBieEpLbFpPZHRiT0M0K2lB?=
 =?utf-8?B?eTJXRmhhdjdpNHJEamkweVI0eGdhQW0yQTEvTUYvS1JQRFk4ZFdpOVlOa3d0?=
 =?utf-8?B?MVRNNFR0OVBlVHlHOGUrTnB5UmE2Rm8yM2VPbDVPdDVOek8ra2hCeWZOTnQy?=
 =?utf-8?B?Nmp1b3NXUkNjTS95bGtyaDN4N1pWRHY3dmFPWTkya1hpYXdFRjFNQmRUODg5?=
 =?utf-8?B?UE5SMG1UTEZBZkNEeVV0cDdPRWhYSmtsUXFyV1RtNXkvaFpIU1cvZHVlakVh?=
 =?utf-8?B?amladmJpZUc5dHE4WkpESWMwS0E2Z0V4cjZoVUtweFpXRzZSS0s0ZlVic1E5?=
 =?utf-8?B?blJuc29TUHVrMS9JbU5zd1BaRGxrMnNIY1pSM0xRQzhuSzlVZ3owTy9yQnJm?=
 =?utf-8?B?NndyY0NUV09iRS9qcDlJNWVpamRkdHJlVVVFY3JjdTZ4SmtSNlkvSUpGV2dw?=
 =?utf-8?B?VzZxWEpEMEY3SVp2Q1lxL2w4RXZ3cUNlQnZPWmFMZUZ2T0dtZXJMK0RuK2tL?=
 =?utf-8?B?M2tmdUxqbmtGanVKbjYxaE90Y2RmOVRvYmNnUzNMdFlxcitRUGVoR0owUHZ1?=
 =?utf-8?B?OUR3Z0F1QlQ4bnFSTjlCU0VEL0oxZng3YU9md1owbjZxR0sreWk1L3JSWVgv?=
 =?utf-8?B?bFZWYTc4b09VYXBiTXRFM2FSUGwvbWUvK21aNDNLYlZQcTNDZkdxd2xud25V?=
 =?utf-8?B?YjlDUVdSU0RPbUwwdStRTkhyTEdoWXowS0lNM3J2TEppK2dCTWRGNml5Tm1I?=
 =?utf-8?B?Y0UxY2dZUlgzaUdBLy9FSEhSOWROWGJZZFFESElXQTY4emhGd2R3clZvOXNa?=
 =?utf-8?B?U0hnK0s2c0dtRG9CeU5jL3k1NmVzbG5aRU5tallJbDRhTWlIcTJjbXZuSVIv?=
 =?utf-8?B?VGprSHpoazMyYlRkTThBNHJ5bG0wSlhEYUV1KzBjbDF0TkdxT2pzL0k3S2Zx?=
 =?utf-8?B?M1diRDlwb1hCVlFlbklYUzBMNzNqM1hsMUlWTkRRdkhTREQ3RFJCai9jUms4?=
 =?utf-8?B?akVLRnNDcVJpSUdVZWxOQmZmRjlBPT0=?=
Content-ID: <6A533BB72F891C4AAC786A5FC2746CB2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f97867-58b3-4e90-60b7-08d9b0b8a3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 08:42:11.6388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bb0cRFoZacsz5t5dxkA7yGQKGwrUR40ury9FYTWSMCfw06v65mnVgoJBGJLtJNK2cTuGjVSKP3P9+7ssQxUmusbQukX3gB5oXY0e5E9syg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_004220_549057_5CBD808A 
X-CRM114-Status: GOOD (  15.45  )
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

On 25/11/2021 15:31, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> To improve human readability and enable automatic validation, the tuples
> in the various properties containing interrupt specifiers should be
> grouped.
> 
> Fix this by grouping the tuples of "interrupts" and
> "interrupts-extended" properties using angle brackets.
Hi Geert,
I notice most of the icicle kit patches in this series were feedback 
items from you on my series. I am assuming your intent is that I drop 
those from my V2 (which should've been here by now but other things got 
in the way) and base on this?
Thanks,
Conor.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 31 ++++++++++---------
>   1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 794da883acb19256..d91226bfa586cda7 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -153,18 +153,18 @@ cache-controller@2010000 {
>                          cache-size = <2097152>;
>                          cache-unified;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <1 2 3>;
> +                       interrupts = <1>, <2>, <3>;
>                          reg = <0x0 0x2010000 0x0 0x1000>;
>                  };
> 
>                  clint@2000000 {
>                          compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>                          reg = <0x0 0x2000000 0x0 0xC000>;
> -                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> -                                               &cpu1_intc 3 &cpu1_intc 7
> -                                               &cpu2_intc 3 &cpu2_intc 7
> -                                               &cpu3_intc 3 &cpu3_intc 7
> -                                               &cpu4_intc 3 &cpu4_intc 7>;
> +                       interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +                                             <&cpu1_intc 3>, <&cpu1_intc 7>,
> +                                             <&cpu2_intc 3>, <&cpu2_intc 7>,
> +                                             <&cpu3_intc 3>, <&cpu3_intc 7>,
> +                                             <&cpu4_intc 3>, <&cpu4_intc 7>;
>                  };
> 
>                  plic: interrupt-controller@c000000 {
> @@ -173,18 +173,19 @@ plic: interrupt-controller@c000000 {
>                          reg = <0x0 0xc000000 0x0 0x4000000>;
>                          riscv,ndev = <186>;
>                          interrupt-controller;
> -                       interrupts-extended = <&cpu0_intc 11
> -                                       &cpu1_intc 11 &cpu1_intc 9
> -                                       &cpu2_intc 11 &cpu2_intc 9
> -                                       &cpu3_intc 11 &cpu3_intc 9
> -                                       &cpu4_intc 11 &cpu4_intc 9>;
> +                       interrupts-extended = <&cpu0_intc 11>,
> +                                             <&cpu1_intc 11>, <&cpu1_intc 9>,
> +                                             <&cpu2_intc 11>, <&cpu2_intc 9>,
> +                                             <&cpu3_intc 11>, <&cpu3_intc 9>,
> +                                             <&cpu4_intc 11>, <&cpu4_intc 9>;
>                  };
> 
>                  dma@3000000 {
>                          compatible = "sifive,fu540-c000-pdma";
>                          reg = <0x0 0x3000000 0x0 0x8000>;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> +                                    <30>;
>                          #dma-cells = <1>;
>                  };
> 
> @@ -264,7 +265,7 @@ mmc: mmc@20008000 {
>                          compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
>                          reg = <0x0 0x20008000 0x0 0x1000>;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <88 89>;
> +                       interrupts = <88>, <89>;
>                          clocks = <&clkcfg 6>;
>                          max-frequency = <200000000>;
>                          status = "disabled";
> @@ -274,7 +275,7 @@ emac0: ethernet@20110000 {
>                          compatible = "cdns,macb";
>                          reg = <0x0 0x20110000 0x0 0x2000>;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <64 65 66 67>;
> +                       interrupts = <64>, <65>, <66>, <67>;
>                          local-mac-address = [00 00 00 00 00 00];
>                          clocks = <&clkcfg 4>, <&clkcfg 2>;
>                          clock-names = "pclk", "hclk";
> @@ -287,7 +288,7 @@ emac1: ethernet@20112000 {
>                          compatible = "cdns,macb";
>                          reg = <0x0 0x20112000 0x0 0x2000>;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <70 71 72 73>;
> +                       interrupts = <70>, <71>, <72>, <73>;
>                          local-mac-address = [00 00 00 00 00 00];
>                          clocks = <&clkcfg 5>, <&clkcfg 2>;
>                          status = "disabled";
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
