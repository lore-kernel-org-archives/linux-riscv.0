Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC887C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sD3VGCcMkuHwbzKHtOqUi/Hn2ueJWsetWtoMljU43e4=; b=ly/3E7R+sXctZ4
	ejwrv4PKoeKoTCbWnZ1MY8QpqWZ0Y6e1VekaVNKyRh8Gbj1XbMga+ENePorNGUo08BadEUOVqJDYA
	yBpXhg1+K9LDAQz2FTQrlfTtdypu6rWfhqKSirA+XnQ9gkyvSsr8sBj1IP8dE+G3MNKomVuxWH4JG
	IIh7Ak95Xqb1Sp3foyak9WhpxYcf3web8T5ae55kvTMa4qqhSIZ+I1aCYf0k4nEpqXwQdhgnB4s3p
	2hWj8PHExNt7Nen4z/PaNSoXK8NRdWVCDnVBDwZ2w9ABuYQcT4ULC6/OyuKW89Mzn9OJE/xWgdruH
	KMS31vT0IQTdjPjsZ3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmAZ4-009cBd-Mh; Wed, 04 May 2022 08:40:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAYg-009c3H-8z
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 08:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651653631; x=1683189631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qziebw3aMQVUJCxDi09wZhHU5h5/+qZQE5XAwXHwOWY=;
 b=UWerm8Q17+oxbQdp5xxHYkSw7s2LPqu+zRiYMEapYm9BVo5g1+4B8ZeO
 gOa+9+qxyu/nrRsriZfeauGYmfpsyFSswRTbYUYe2IcpDdpSGzz3ybiZV
 hM2lRP+mQAlIGnNPbpd4RdeFRQgGApnrQIAWt1E+sd4B9sSxrPvhWE4aR
 0CPHway6C3B51UKHkor4A+TITZCv1HiIWF63IyUuC/WCnR/FjiKsRUxIv
 OponH04cq1P2R+lLCQNx2QhpdZeT9XJ7vAVsmKEZ0RU2FB2mQMGtM4Nsb
 oyXo53c9nRB3p/9m218faTo6DXX1OLY80IS6i7I+LN/QwB4JeOLRtiam2 A==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="162269399"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 May 2022 01:40:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 4 May 2022 01:40:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 4 May 2022 01:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+mUVPvAbs8m2PG4Mq3jFlqYUk6PRmw9rQVjwYaadG2WutouRYdI5KE4MUtJLCkTTO3pyO9RgOPJv/ewUivoDLxvGXSzscAJxoE6xIaNPTJdhgqFh4TGW4UNti/en9HGgNJkdpwmvWP6gjMOmdBoKmdNV5ibwrFM020X3Ff3Cfvj6N4R04tFe70sQl+Iu6JOlKqExVYYM8Qh2JzlrNPInxuRCVs7xnEtCJuyqxY2ABzsPwVORxIZ0asXnoolRgAuhnjWnlqX/DcahuUS4+7cM94sbHK4f7xiic/3NSBZFC9wlcC1FJ1PQ5CAHH7N0YlT5JHwF6uksItH4A75xf+s1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qziebw3aMQVUJCxDi09wZhHU5h5/+qZQE5XAwXHwOWY=;
 b=EZH/HdE2GUTjKVZuBKYvO9J9IIimonBSI2a0/4w+3NVVGMAtglkrI5m00VgMLwwuksmOW40O2XHpDBF/NvfdSo7FVzbmDwoFtp4eJo1yJ7CMoMA7DPx5T7URMRY0q6SrmvO+mJv6uIGAdjIH8/EdXQqVE6CJFL0R39SoBc1scmao+7g0Nsgd7FJq2LapFWqvxQBNB+2KXAR5HYdFeK8J97sHwWgeIkj7pbGY3MN3+Lq1PUzWUg3gSEjOwSi3KYl4byOrp8CHid1EFuYNNCAi5VsSXszik0qxgzMueq9clpHTP1e6jZNN7BPUc6YpDIoDZnCu1FTiIKFW/FKBTLDYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qziebw3aMQVUJCxDi09wZhHU5h5/+qZQE5XAwXHwOWY=;
 b=FuZQ5RZBl+t34AqBjGD3wb1BLVn7YufAbUgik6nOvTBCGkrdL2P+0J8EQ6Fev3boJrtfelpWcEgGuUzgzf1c6ak+bqdllO/flWPlPcrwlsKh9gA/ylknlfatKDVe5kzO9mfBbt9etAwanCx3pS1wxkDBEGUVKsBLccJzwXq0yjc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB0016.namprd11.prod.outlook.com (2603:10b6:301:63::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 08:40:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 08:40:16 +0000
From: <Conor.Dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>,
 <geert@linux-m68k.org>
Subject: Re: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Thread-Topic: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Thread-Index: AQHYPSMB0fElgzWzO0GEtW3rBppjp60OqsoA
Date: Wed, 4 May 2022 08:40:16 +0000
Message-ID: <cad04bc5-ce7b-d7db-f967-8b2bb67897ae@microchip.com>
References: <20220321125855.3227057-1-conor.dooley@microchip.com>
In-Reply-To: <20220321125855.3227057-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee6e99c7-11a6-4311-3c8a-08da2da9b6e1
x-ms-traffictypediagnostic: MWHPR11MB0016:EE_
x-microsoft-antispam-prvs: <MWHPR11MB0016BECA076B2374F240235F98C39@MWHPR11MB0016.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HGBG1eNH+Tq/im2BqxwcomSUE+hACMpZiDxR4L6eMP6kF9JKzBW9DOSmez8VmYPTpILHhbOmNgqSynWkce525HXPYgC/abcoIQFEgilYuTPkSOFfsXq4ZZ87yhrfA+O/QqxNu16IGuDWVZgI1NGqX5m6vwNNdrMmeDWsjUe/6rMo7/GQ6Mj7wbiBjj+jdGW4Gh6FWFeYK3/7cjxk4ltzyzP5dE/ezhgpFjr9Ossyzmy5RwicOZeTvfj2U91g++5UEB9fBRD/xwBCMh8gbH9/TWlMeEiVSYp5PjF6w3TOujaTtGUW4WTV+TUxhwnWnDL3CV5+qZlpHnaRYjHfLt8lCOuu8+6XiiN/Tqdz6BiFSgqoGvaVLbNYhFybnc6f33x8v26QeT1v7bQGJA/M9I+sTqilx/pwfaEkjgz7Vkf6qxCOSTMkonTdGzwsA4FNBN0ick7PaLra/tvb9TGBs9c/XuYYxGkRsc4wL2gpuFJEGBO2aj8WZyBWGlGVRdbddAtezCzfl7fNXWXKYVTxTInpqfyuHyXn4Y85m09SwobzIv9Bo9Ma7yCOijkOCLbVdzJu6jB8jArppn7EJza25+G2HkCHB/O881CdqkDh0UvcrqQcI2tdOhkEZy3UiytHow25fec0ePuSy1LL4gqlWK14PD16lQH5c4rVVKJ3rMGSUAzmhOCrUw/ftB7DZMnpuep+Py2FvvA59Jb9Duh8cpCCf7gKiuKnpLEMetELzI4WVUoz7/IgGVJBTbzter3reooFT+06HU4718HfMetcyL69pSeWx9pdy8yCVsDe9Yv8htvozKegzw5U4uHyxot6VVjJPVctOanZSGJYs9fdd18CxJPz6NGBnawmGh3BNbxoK/k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(54906003)(36756003)(71200400001)(6486002)(966005)(38070700005)(38100700002)(2906002)(6506007)(53546011)(122000001)(316002)(31686004)(30864003)(6512007)(26005)(2616005)(4326008)(8676002)(186003)(5660300002)(8936002)(91956017)(83380400001)(66946007)(66556008)(76116006)(31696002)(110136005)(86362001)(64756008)(66476007)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTdhUlVYTVdiRzZQSE8wdmFyTm9ReHhBUmtVd3FCWEJPdzFmY1p0STRnb0gv?=
 =?utf-8?B?cXV6TUpCR2RiaDRyTmRTcE9YN3Z4Z0lEYWlUQlpzbjJnQjRaY0dSRHltNFRS?=
 =?utf-8?B?N05aVFlqNDIvMkk2YSs4Yisrczg2KzhIUG16aWE0ZmZLRXIxQitxNE0zVVUz?=
 =?utf-8?B?emtqcVpDOXNGcENxYTBZbktGQ2s5Z0ZWR0JjOCtkQmlpNDNGQ2hPcHRXS05z?=
 =?utf-8?B?QUZhb3p1MjlqV29pUkc5NldWQ1FMaHduUnFmVVZkdzkrZ3RYaEtmVkd6OHkr?=
 =?utf-8?B?ZEsxTFl5TUZ2OU4yZHdLbWhMMThXcnFCcEFNWHZMeG9OVEV0TWlZYWo4K1hK?=
 =?utf-8?B?Yzd0OEgxenVOc1R2YTZ3MU8zUENaMTVEQVBkMG10RHBFdzUrZWxsQmpSbldi?=
 =?utf-8?B?RTdGUU9QRmxadkNNQ0lHSFZlM3g4N1B0bm9UeUtLZk9sYnd4RERXRTZuM25T?=
 =?utf-8?B?b3VvN3lFeU9OL24yTTdpL21RTC82UnNXQnY5NDNJM2EwVUVMclVDU2Nicm5o?=
 =?utf-8?B?UkdhTDA3ejhxM0JhUnU1djFkU0xsdDFJQThWSUhMM01FT1JkdnVXY1B2WnBZ?=
 =?utf-8?B?cnUxeFl3bVlDckxwSkowdUV6TzJkVjNIL2RJdlVaTE9IQzJaMTYwSkJxaHU0?=
 =?utf-8?B?WWxBQmVjSnpSdkptL3p3MnIrTjA5ak9BekoyRXBXa0lnZ3prSGVpTEx5UXJ4?=
 =?utf-8?B?RXIweEZqT2pjQUF2ZjVyMlluQWliZCtiT3o1NXZUOUVESjJOL05UWEN2dFRP?=
 =?utf-8?B?Yk9LckczSnc1S21TNmc1ZVg4RVR5a1BsQ0dVa0tjZG5MTmdkR3ZNTTlyd2hh?=
 =?utf-8?B?QVk0QmYyU1RPdnl4TUluTnNlcjVZRkllOXh1WFB3MVU2RDhjTTYrOG1xSVlh?=
 =?utf-8?B?UWNKVnJQV2RueTdnZGxkMXNlaXZ4ZCs1bzlGV0NGUUNuVWtvSG5vcG9haTRs?=
 =?utf-8?B?em5Ec2xhTDJzR3NXeCtVemxZaTREMFlVUkVWSzRpeFBzVzd4Sk91YU5tQ2Vr?=
 =?utf-8?B?UW5KUCtuWVB3N2tvR3l2YWw3QW1zYUlHaGxzTThTM2JoNDBPR2s1eFlWVHJn?=
 =?utf-8?B?UHV6MVF4NHl3eTdtUHVyOGxnK3cxdEZuUVhkT0wwSkQ0YWpENURvaU4zNXor?=
 =?utf-8?B?T1lzQ2JyUC84SFBtLzVrSmwzcEJOQ2d2cUYrck9vUVpCNWZUQlBIL3Ixekhq?=
 =?utf-8?B?UU1XZ3M3c1VIM3RSM203aThzMVRjSjdvMUUvVzk0RG42UVNkQ3RmVTZhdDNS?=
 =?utf-8?B?TGs1OWtaaHFaWTJXWlhhSWpLUFVlTlgwU2c0TVlCVkw0WllHNG80Rm8xdms4?=
 =?utf-8?B?YjhDRFQ5N1V1WXhPNEVobUIxL3JqSzllamhOWXRzS3VwakNHa1lCRzBqNzdT?=
 =?utf-8?B?RDRiNlVJdHJZSWRVT2ZnQ2VFTG1nMTdnakN4QlF3NGRmTnJIeHJwSnVZQXVK?=
 =?utf-8?B?NDNiL1ZOZG96VHB0Z1JPdCtveGpwK3F5THY3dDV6RWpJWFpHU2s0elRuNTlp?=
 =?utf-8?B?RmxuM0RxelRCUnpmU043TnFzd1RxWXNPU3BNbklpekpQeVpqaHhnaWFXRjBk?=
 =?utf-8?B?QVUwamdiK1ZhdUtJU1IveVlBWUhTanIvUDFaODBlTURSQ1kySkFnNitmNXM4?=
 =?utf-8?B?ckFWdkIyOVhmM2wxRDRYZlloN1RvODVUVlpzRFdlYWJyV2t1bStzei9Gd1V5?=
 =?utf-8?B?cC9KRFpOWVZpU0dka3QwYWNNMmlIb1FXdUVEVzRNRHhHS0w4OWdNSEZWUUxQ?=
 =?utf-8?B?VE0vSTNQRDNzdUJnazd1SzAyRDhDNmdTdE9SQVpnRnUyY3FRK28za2Q4YTVp?=
 =?utf-8?B?SlhmM0R5UDQwRjNUQnhBell4MlpSQ3NkNDEvdzE0ZmVSMERETGc5VWREMVFt?=
 =?utf-8?B?cm8vNE9XZ0ZEY1ZKYjFwczU2UUVtaWpuWEY2emNra1hkbHNvdkZJU0VMa0R6?=
 =?utf-8?B?R0U4Ty9tOGlmMTBMUmZ1VFFoWTA0b0tMbWM2SFRsZklLbmRkYmpjOHFqZU5N?=
 =?utf-8?B?aEs1WmlyejhUbFFudys2WW1sN1llMWtyZmFZNHQyU0hoSGdzSjdDdWpuR1lD?=
 =?utf-8?B?WXNQd0dpUmFiLzR2NkRteC9qaDhCVFE4a0QwdiswYUpCeHNLZ2NQVkhRQ0FP?=
 =?utf-8?B?cy9PWGFpYW9hc043UDRiWG11Nno0RTZyTmoxdVpmVGI5MGtLMGU5Q0VPVDR1?=
 =?utf-8?B?QmR0YlhIL1h2MFp2c1pOS3J5WG56a3o3aHp6c1JPMmFyMzg5Z0ZoN3ZqYTVJ?=
 =?utf-8?B?Y1RHRko5NUZPYUVpRVROUlcza2hDQkVEMS90VnM3cHFOaUZVMWhNU0sxRFdQ?=
 =?utf-8?B?bHF0N3BSRTFnRmJRVWpRMkVyZFY5VnhLRGQ4RU9vTTNkYjJMSU52YVRHNUNa?=
 =?utf-8?Q?VnHJtlr/1jTsfftI=3D?=
Content-ID: <E597629399D80D46A1E6AC45644A1A20@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6e99c7-11a6-4311-3c8a-08da2da9b6e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 08:40:16.6970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoSzKfvRZMq7VG/6RNgyD3xONf00I9KrONHu262l6PhTABFd2Ok9V7a0DjE1r9JZIvxYsZaJEr0XT68IkSdTreV8Vv/kM+zrGHUoE4X6l9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_014030_433402_407FD8B8 
X-CRM114-Status: GOOD (  25.12  )
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

On 21/03/2022 12:58, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
> 
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes from v1:
> - Use byte write and read functions

So it turns out that how I made this change, which worked in my
test app, has issues.
I will rework and send a v3.

Thanks,
Conor.

> - Return IRQ_NONE and don't warn if not this drivers interrupt
> - Add a clk_disable_unprepare to avoid leaking a clock in the probe
> ---
>   drivers/i2c/busses/Kconfig              |  11 +
>   drivers/i2c/busses/Makefile             |   1 +
>   drivers/i2c/busses/i2c-microchip-core.c | 486 ++++++++++++++++++++++++
>   3 files changed, 498 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-microchip-core.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..3d4d8e0e9de7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -781,6 +781,17 @@ config I2C_MESON
>            If you say yes to this option, support will be included for the
>            I2C interface on the Amlogic Meson family of SoCs.
> 
> +config I2C_MICROCHIP_CORE
> +       tristate "Microchip FPGA I2C controller"
> +       depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
> +       depends on OF
> +       help
> +         If you say yes to this option, support will be included for the
> +         I2C interface on Microchip FPGAs.
> +
> +         This driver can also be built as a module. If so, the module will be
> +         called i2c-microchip-core.
> +
>   config I2C_MPC
>          tristate "MPC107/824x/85xx/512x/52xx/83xx/86xx"
>          depends on PPC
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 479f60e4ee3d..75869b189e43 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_I2C_JZ4780)      += i2c-jz4780.o
>   obj-$(CONFIG_I2C_KEMPLD)       += i2c-kempld.o
>   obj-$(CONFIG_I2C_LPC2K)                += i2c-lpc2k.o
>   obj-$(CONFIG_I2C_MESON)                += i2c-meson.o
> +obj-$(CONFIG_I2C_MICROCHIP_CORE)       += i2c-microchip-core.o
>   obj-$(CONFIG_I2C_MPC)          += i2c-mpc.o
>   obj-$(CONFIG_I2C_MT65XX)       += i2c-mt65xx.o
>   obj-$(CONFIG_I2C_MT7621)       += i2c-mt7621.o
> diff --git a/drivers/i2c/busses/i2c-microchip-core.c b/drivers/i2c/busses/i2c-microchip-core.c
> new file mode 100644
> index 000000000000..ea434f39e0cd
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-microchip-core.c
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip CoreI2C I2C controller driver
> + *
> + * Copyright (c) 2018 - 2022 Microchip Corporation. All rights reserved.
> + *
> + * Author: Daire McNamara <daire.mcnamara@microchip.com>
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + */
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +
> +#define MICROCHIP_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +
> +#define CORE_I2C_CTRL (0x00)
> +#define CTRL_CR0 BIT(0)
> +#define CTRL_CR1 BIT(1)
> +#define CTRL_AA BIT(2)
> +#define CTRL_SI BIT(3)
> +#define CTRL_STO BIT(4)
> +#define CTRL_STA BIT(5)
> +#define CTRL_ENS1 BIT(6)
> +#define CTRL_CR2 BIT(7)
> +#define CORE_I2C_STATUS (0x04)
> +#define STATUS_BUS_ERROR (0x00)
> +#define STATUS_M_START_SENT (0x08)
> +#define STATUS_M_REPEATED_START_SENT (0x10)
> +#define STATUS_M_SLAW_ACK (0x18)
> +#define STATUS_M_SLAW_NACK (0x20)
> +#define STATUS_M_TX_DATA_ACK (0x28)
> +#define STATUS_M_TX_DATA_NACK (0x30)
> +#define STATUS_M_ARB_LOST (0x38)
> +#define STATUS_M_SLAR_ACK (0x40)
> +#define STATUS_M_SLAR_NACK (0x48)
> +#define STATUS_M_RX_DATA_ACKED (0x50)
> +#define STATUS_M_RX_DATA_NACKED (0x58)
> +#define STATUS_S_SLAW_ACKED (0x60)
> +#define STATUS_S_ARB_LOST_SLAW_ACKED (0x68)
> +#define STATUS_S_GENERAL_CALL_ACKED (0x70)
> +#define STATUS_S_ARB_LOST_GENERAL_CALL_ACKED (0x78)
> +#define STATUS_S_RX_DATA_ACKED (0x80)
> +#define STATUS_S_RX_DATA_NACKED (0x88)
> +#define STATUS_S_GENERAL_CALL_RX_DATA_ACKED (0x90)
> +#define STATUS_S_GENERAL_CALL_RX_DATA_NACKED (0x98)
> +#define STATUS_S_RX_STOP (0xA0)
> +#define STATUS_S_SLAR_ACKED (0xA8)
> +#define STATUS_S_ARB_LOST_SLAR_ACKED (0xB0)
> +#define STATUS_S_TX_DATA_ACK (0xB8)
> +#define STATUS_S_TX_DATA_NACK (0xC0)
> +#define STATUS_LAST_DATA_ACK (0xC8)
> +#define STATUS_M_SMB_MASTER_RESET (0xD0)
> +#define STATUS_S_SCL_LOW_TIMEOUT (0xD8) /* 25 ms */
> +#define STATUS_NO_STATE_INFO (0xF8)
> +#define CORE_I2C_DATA (0x08)
> +#define WRITE_BIT (0x0)
> +#define READ_BIT (0x1)
> +#define SLAVE_ADDR_SHIFT (1)
> +#define CORE_I2C_SLAVE0_ADDR (0x0c)
> +#define GENERAL_CALL_BIT (0x0)
> +#define CORE_I2C_SMBUS (0x10)
> +#define SMBALERT_INT_ENB (0x0)
> +#define SMBSUS_INT_ENB (0x1)
> +#define SMBUS_ENB (0x2)
> +#define SMBALERT_NI_STATUS (0x3)
> +#define SMBALERT_NO_CTRL (0x4)
> +#define SMBSUS_NI_STATUS (0x5)
> +#define SMBSUS_NO_CTRL (0x6)
> +#define SMBUS_RESET (0x7)
> +#define CORE_I2C_FREQ (0x14)
> +#define CORE_I2C_GLITCHREG (0x18)
> +#define CORE_I2C_SLAVE1_ADDR (0x1c)
> +
> +#define PCLK_DIV_960 (CTRL_CR2)
> +#define PCLK_DIV_256 (0)
> +#define PCLK_DIV_224 (CTRL_CR0)
> +#define PCLK_DIV_192 (CTRL_CR1)
> +#define PCLK_DIV_160 (CTRL_CR0 | CTRL_CR1)
> +#define PCLK_DIV_120 (CTRL_CR0 | CTRL_CR2)
> +#define PCLK_DIV_60 (CTRL_CR1 | CTRL_CR2)
> +#define BCLK_DIV_8 (CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
> +#define CLK_MASK (CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
> +
> +/*
> + * mchp_corei2c_dev - I2C device context
> + * @base: pointer to register struct
> + * @msg: pointer to current message
> + * @msg_len: number of bytes transferred in msg
> + * @msg_err: error code for completed message
> + * @msg_complete: xfer completion object
> + * @dev: device reference
> + * @adapter: core i2c abstraction
> + * @i2c_clk: clock reference for i2c input clock
> + * @bus_clk_rate: current i2c bus clock rate
> + * @buf: ptr to msg buffer for easier use.
> + * @isr_status: cached copy of local ISR status.
> + * @lock: spinlock for IRQ synchronization.
> + */
> +struct mchp_corei2c_dev {
> +       void __iomem *base;
> +       size_t msg_len;
> +       int msg_err;
> +       struct completion msg_complete;
> +       struct device *dev;
> +       struct i2c_adapter adapter;
> +       struct clk *i2c_clk;
> +       spinlock_t lock; /* IRQ synchronization */
> +       u32 bus_clk_rate;
> +       u32 msg_read;
> +       u32 isr_status;
> +       u8 *buf;
> +       u8 addr;
> +};
> +
> +static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
> +{
> +       u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
> +
> +       ctrl &= ~CTRL_ENS1;
> +       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
> +{
> +       u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
> +
> +       ctrl |= CTRL_ENS1;
> +       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static void mchp_corei2c_reset(struct mchp_corei2c_dev *idev)
> +{
> +       mchp_corei2c_core_disable(idev);
> +       mchp_corei2c_core_enable(idev);
> +}
> +
> +static inline void mchp_corei2c_stop(struct mchp_corei2c_dev *idev)
> +{
> +       u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
> +
> +       ctrl |= CTRL_STO;
> +       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static inline int mchp_corei2c_set_divisor(u32 rate,
> +                                          struct mchp_corei2c_dev *idev)
> +{
> +       u8 clkval, ctrl;
> +
> +       if (rate >= 960)
> +               clkval = PCLK_DIV_960;
> +       else if (rate >= 256)
> +               clkval = PCLK_DIV_256;
> +       else if (rate >= 224)
> +               clkval = PCLK_DIV_224;
> +       else if (rate >= 192)
> +               clkval = PCLK_DIV_192;
> +       else if (rate >= 160)
> +               clkval = PCLK_DIV_160;
> +       else if (rate >= 120)
> +               clkval = PCLK_DIV_120;
> +       else if (rate >= 60)
> +               clkval = PCLK_DIV_60;
> +       else if (rate >= 8)
> +               clkval = BCLK_DIV_8;
> +       else
> +               return -EINVAL;
> +
> +       ctrl = readb(idev->base + CORE_I2C_CTRL);
> +       ctrl &= ~CLK_MASK;
> +       ctrl |= clkval;
> +       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +       ctrl = readb(idev->base + CORE_I2C_CTRL);
> +       if ((ctrl & CLK_MASK) != clkval)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +static int mchp_corei2c_init(struct mchp_corei2c_dev *idev)
> +{
> +       u32 clk_rate = clk_get_rate(idev->i2c_clk);
> +       u32 divisor = clk_rate / idev->bus_clk_rate;
> +       int ret;
> +
> +       ret = mchp_corei2c_set_divisor(divisor, idev);
> +       if (ret)
> +               return ret;
> +
> +       mchp_corei2c_reset(idev);
> +
> +       return 0;
> +}
> +
> +static void mchp_corei2c_transfer(struct mchp_corei2c_dev *idev, u32 data)
> +{
> +       if (idev->msg_len > 0)
> +               writeb(data, idev->base + CORE_I2C_DATA);
> +}
> +
> +static void mchp_corei2c_empty_rx(struct mchp_corei2c_dev *idev)
> +{
> +       u8 ctrl;
> +
> +       if (idev->msg_len > 0) {
> +               *idev->buf++ = readb(idev->base + CORE_I2C_DATA);
> +               idev->msg_len--;
> +       }
> +
> +       if (idev->msg_len == 0) {
> +               ctrl = readb(idev->base + CORE_I2C_CTRL);
> +               ctrl &= ~CTRL_AA;
> +               writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +       }
> +}
> +
> +static int mchp_corei2c_fill_tx(struct mchp_corei2c_dev *idev)
> +{
> +       mchp_corei2c_transfer(idev, *idev->buf++);
> +       idev->msg_len--;
> +
> +       return 0;
> +}
> +
> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +       u32 status = idev->isr_status;
> +       u8 ctrl;
> +
> +       if (!idev->buf)
> +               return IRQ_NONE;
> +
> +       switch (status) {
> +       case STATUS_M_START_SENT:
> +       case STATUS_M_REPEATED_START_SENT:
> +               ctrl = readb(idev->base + CORE_I2C_CTRL);
> +               ctrl &= ~CTRL_STA;
> +               writeb(idev->addr, idev->base + CORE_I2C_DATA);
> +               writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +               if (idev->msg_len <= 0)
> +                       goto finished;
> +               break;
> +       case STATUS_M_ARB_LOST:
> +               idev->msg_err = -EAGAIN;
> +               goto finished;
> +       case STATUS_M_SLAW_ACK:
> +       case STATUS_M_TX_DATA_ACK:
> +               if (idev->msg_len > 0)
> +                       mchp_corei2c_fill_tx(idev);
> +               else
> +                       goto last_byte;
> +               break;
> +       case STATUS_M_TX_DATA_NACK:
> +       case STATUS_M_SLAR_NACK:
> +       case STATUS_M_SLAW_NACK:
> +               idev->msg_err = -ENXIO;
> +               goto last_byte;
> +       case STATUS_M_SLAR_ACK:
> +               ctrl = readb(idev->base + CORE_I2C_CTRL);
> +               if (idev->msg_len == 1u) {
> +                       ctrl &= ~CTRL_AA;
> +                       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +               } else {
> +                       ctrl |= CTRL_AA;
> +                       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +               }
> +               if (idev->msg_len < 1u)
> +                       goto last_byte;
> +               break;
> +       case STATUS_M_RX_DATA_ACKED:
> +               mchp_corei2c_empty_rx(idev);
> +               break;
> +       case STATUS_M_RX_DATA_NACKED:
> +               mchp_corei2c_empty_rx(idev);
> +               if (idev->msg_len == 0)
> +                       goto last_byte;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return IRQ_HANDLED;
> +
> +last_byte:
> +       /* On the last byte to be transmitted, send STOP */
> +       mchp_corei2c_stop(idev);
> +finished:
> +       complete(&idev->msg_complete);
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
> +{
> +       struct mchp_corei2c_dev *idev = _dev;
> +       irqreturn_t ret = IRQ_NONE;
> +       u8 ctrl;
> +
> +       ctrl = readb(idev->base + CORE_I2C_CTRL);
> +       if (ctrl & CTRL_SI) {
> +               idev->isr_status = readb(idev->base + CORE_I2C_STATUS);
> +               ret = mchp_corei2c_handle_isr(idev);
> +       }
> +
> +       /* Clear the si flag */
> +       ctrl = readb(idev->base + CORE_I2C_CTRL);
> +       ctrl &= ~CTRL_SI;
> +       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +       return ret;
> +}
> +
> +static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
> +                                struct i2c_msg *msg)
> +{
> +       u8 ctrl;
> +       unsigned long time_left;
> +
> +       if (msg->len == 0)
> +               return -EINVAL;
> +
> +       idev->addr = i2c_8bit_addr_from_msg(msg);
> +       idev->msg_len = msg->len;
> +       idev->buf = msg->buf;
> +       idev->msg_err = 0;
> +       idev->msg_read = (msg->flags & I2C_M_RD);
> +
> +       reinit_completion(&idev->msg_complete);
> +
> +       mchp_corei2c_core_enable(idev);
> +
> +       ctrl = readb(idev->base + CORE_I2C_CTRL);
> +       ctrl |= CTRL_STA;
> +       writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +       time_left = wait_for_completion_timeout(&idev->msg_complete,
> +                                               MICROCHIP_I2C_TIMEOUT);
> +       if (!time_left)
> +               return -ETIMEDOUT;
> +
> +       return idev->msg_err;
> +}
> +
> +static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +                            int num)
> +{
> +       struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
> +       int i, ret;
> +
> +       for (i = 0; i < num; i++) {
> +               ret = mchp_corei2c_xfer_msg(idev, msgs++);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return num;
> +}
> +
> +static u32 mchp_corei2c_func(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm mchp_corei2c_algo = {
> +       .master_xfer = mchp_corei2c_xfer,
> +       .functionality = mchp_corei2c_func,
> +};
> +
> +static int mchp_corei2c_probe(struct platform_device *pdev)
> +{
> +       struct mchp_corei2c_dev *idev = NULL;
> +       struct resource *res;
> +       int irq, ret;
> +       u32 val;
> +
> +       idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
> +       if (!idev)
> +               return -ENOMEM;
> +
> +       idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +       if (IS_ERR(idev->base))
> +               return PTR_ERR(idev->base);
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return dev_err_probe(&pdev->dev, irq,
> +                                    "missing interrupt resource\n");
> +
> +       idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(idev->i2c_clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
> +                                    "missing clock\n");
> +
> +       idev->dev = &pdev->dev;
> +       init_completion(&idev->msg_complete);
> +       spin_lock_init(&idev->lock);
> +
> +       val = device_property_read_u32(idev->dev, "clock-frequency",
> +                                      &idev->bus_clk_rate);
> +       if (val) {
> +               dev_info(&pdev->dev, "default to 100kHz\n");
> +               idev->bus_clk_rate = 100000;
> +       }
> +
> +       if (idev->bus_clk_rate > 400000)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "clock-frequency too high: %d\n",
> +                                    idev->bus_clk_rate);
> +
> +       ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
> +                              pdev->name, idev);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "failed to claim irq %d\n", irq);
> +
> +       ret = clk_prepare_enable(idev->i2c_clk);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "failed to enable clock\n");
> +
> +       ret = mchp_corei2c_init(idev);
> +       if (ret) {
> +               clk_disable_unprepare(idev->i2c_clk);
> +               return dev_err_probe(&pdev->dev, ret, "failed to program clock divider\n");
> +       }
> +
> +       i2c_set_adapdata(&idev->adapter, idev);
> +       snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> +                "Microchip I2C hw bus");
> +       idev->adapter.owner = THIS_MODULE;
> +       idev->adapter.algo = &mchp_corei2c_algo;
> +       idev->adapter.dev.parent = &pdev->dev;
> +       idev->adapter.dev.of_node = pdev->dev.of_node;
> +
> +       platform_set_drvdata(pdev, idev);
> +
> +       ret = i2c_add_adapter(&idev->adapter);
> +       if (ret) {
> +               clk_disable_unprepare(idev->i2c_clk);
> +               return ret;
> +       }
> +
> +       dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");
> +
> +       return 0;
> +}
> +
> +static int mchp_corei2c_remove(struct platform_device *pdev)
> +{
> +       struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
> +
> +       clk_disable_unprepare(idev->i2c_clk);
> +       i2c_del_adapter(&idev->adapter);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mchp_corei2c_of_match[] = {
> +       { .compatible = "microchip,mpfs-i2c" },
> +       { .compatible = "microchip,corei2c-rtl-v7" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
> +
> +static struct platform_driver mchp_corei2c_driver = {
> +       .probe = mchp_corei2c_probe,
> +       .remove = mchp_corei2c_remove,
> +       .driver = {
> +               .name = "microchip-corei2c",
> +               .of_match_table = mchp_corei2c_of_match,
> +       },
> +};
> +
> +module_platform_driver(mchp_corei2c_driver);
> +
> +MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
