Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A369CC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjBItf2Sd1MPiwMBEcb4E9/VFwznDeXlj8GT/XLi8XQ=; b=0mMQ8BVilR4ZRa
	CUJY6IJHoRKXcnHxVI+RQOL4xUlrxLBb2yLgAKgTGIrKlnYPFKZtwzhNUoV2NfXDTDcMZ2EvsaDwR
	gNA8Z08qSTNLvU/fD8ln8gQH3Bfe0PmFkO0DxPNrM0TSlRRWHY5u5p2FTxS0iCC3wz3Ei66+pXnhM
	m/pG7mYNjjf3/NUN82AhaNcCHiGzAa7SvcM9r9p3Qx7szmOjUODW+Zfj6Zb1IeR3W8dVoYFdtDXKE
	3i389apGjWuWlt53mDFv7wlCkunrhlXCoiIxSNR2ucpkVf/Bo4IssBgNgBKnwp6tVv0BvpCELKjIH
	jGtjVohX6GTprGdP+e0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGI8-0032a5-Cf; Thu, 08 Sep 2022 12:05:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGI4-0032Z4-UC
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 12:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662638752; x=1694174752;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tO1NgdDllzZ9bORM5IcsssBAUO166s8MsLoeJc3I9LU=;
  b=FrbYwp2XFgJ+wJGchJ6NBVoILZk+5OBVKDkH3ytj5tSobyyeAz01QZ2v
   Pmdm9f+eENG8uji6jr/4kE/y5FOxxzMHtj3CzZW/3xj+4DWsTMLfZXAsf
   H+052B2gBJQuJbkk1Ow1TSwLdDmO9DeOU+8oeWZEz9vxmDPsUVZsNvb8P
   tdhqR4FGJGHa2ImQabzvM/O/ue9YRounQ0OlPC8nPJPvnghWxWuYBOV5C
   ouVZJqvZdNwBWuQ488T2TDHXiNp1onAB+6idR+9wHDRtSWbl9rCUqmdfD
   NVl5cCoQQQSQ9QlHCGcilq0bs5khARDKy8F89umMdfEvf7GfvgzhEUHf3
   A==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="189956732"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 05:05:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 05:05:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 05:05:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYhy8EDYIjAt9sgsQoBL7vUUeOwJr7btPxsIs96FJPaf8C22zaLNh4jvYJuy/VMTovcP1nxWElWftaQSFdisBAyoNYOpkqsv0VDcjw5Q7DoWToBbwRogZ/3QymE3otfs8a4KfJVTcaAnDXahsATdViufSHnm8gaV9i4hBep6MmB9aGirIcNUiyXnC5h2/fm869C1kd3AGCkgeViR/tMW/5hnYkanbbZA62N7kuAb6OMkkire34md4lWtecxzMs3hSBLab8O5h//korBNFv36O5i65FZS6olKEWBcODnvbTFDeaQiAZbiiA0chi+FzIrJdgqul5V0wowrC6RxeYgh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tO1NgdDllzZ9bORM5IcsssBAUO166s8MsLoeJc3I9LU=;
 b=dvFHsqhjn/FwwkHXuYVYuW3cwMlG2ggZff4XAoV4AVOv3pkTzSQ83Im3m9AxHyJNsHe1lNRs1xswcF+cdNAkGjd4zw7c3cmb/Q9/fJ0qa3f7g1jIR+EjbhWxX45X8edh5Wp5gzFaH71Sy7Rd0feZOhpadMnFjMiU7QcFkuLvvsQ/7dv6nsO6y5N4OAJZsJI0x3AXMt50ATFKZytHT1pUR5n+xmdbXMxKL3gzv9XUJSt0V0U0/T/s1ysHpcIU2z1ljSswa0b3Bxw3LfugMVLgIN3EY2QBxI6dM8e6FFFKRmvNRsfgDQWwXdMFtoR+VRHq3l87FJw0MoZRU1m7uoeioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tO1NgdDllzZ9bORM5IcsssBAUO166s8MsLoeJc3I9LU=;
 b=V/+qKLWUVJuv+WacGgX23vATTZPrIk17jwW078up5kmx/wBxo9InXAElm6GqVava/oAbJbq2FbRcuTF6p0sWatURV8HNWP8BcCRyiIwbNTL3NLXXSUuqSFPWP2zrWsq/qec9iYriwB3edXQDzLuPt6BNUcMZYxjY7SzKP1aSKDc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6675.namprd11.prod.outlook.com (2603:10b6:510:1ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 12:05:37 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 12:05:37 +0000
From: <Conor.Dooley@microchip.com>
To: <Shravan.Chippa@microchip.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Daire.McNamara@microchip.com>, <Shravan.Chippa@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Cyril.Jean@microchip.com>, <Lewis.Hanly@microchip.com>,
	<Praveen.Kumar@microchip.com>, <wg@aries-embedded.de>,
	<Hugh.Breslin@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 10/10] riscv: dts: microchip: add a devicetree for
 aries' m100pfsevp
Thread-Topic: [PATCH v4 10/10] riscv: dts: microchip: add a devicetree for
 aries' m100pfsevp
Thread-Index: AQHYw3TW0pnsugvpR0mwdYiwn3LqnK3VZX2AgAAKIIA=
Date: Thu, 8 Sep 2022 12:05:37 +0000
Message-ID: <f5eab239-3814-c2ce-e0b5-42397e8c1755@microchip.com>
References: <20220908111712.665287-1-conor.dooley@microchip.com>
 <20220908111712.665287-11-conor.dooley@microchip.com>
 <CO6PR11MB5604046550E3D74CBBC8E94681409@CO6PR11MB5604.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5604046550E3D74CBBC8E94681409@CO6PR11MB5604.namprd11.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|PH7PR11MB6675:EE_
x-ms-office365-filtering-correlation-id: d804685d-5e69-4bb3-8e32-08da91927113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KKGI6JmO6J6UMhz7aVPTo5vaWbmXZmofx34WCXq5iU60A/pZ1fSdOwaL8aHehqfJtTr8OiSKiShF00TdqrmYJGuneqkbsB108eVI3JH/1U+nLDLPVB2GDjhkW8baxhkW3txqcEEswg0PYtlW2eSWkNCGMlx1m7/asWpgCF8RMqUHqGUrteJ9kQq0PrAmE85xtcFBKuhnMIhGH/kVS0tsvu267dYYETREk1rpZ5lQWhA3C/tLd08vtyQj7rElW1ri/Y/MOeZpH5UGT5N26VZoRyz9ciz7hesMmWXGam9cpQwPmyEWtccMfjJ3Bl3iTICKO7/FSciOgdHo05FcFi+HHoIprMLWAzOre+ENf3NOrRnRpodMK65ez243Pu5cS0XQYS1R3T15urIJWncNsVLOaJG3/8a9d9ARW7M9uZcgf1qs5q5JYBPIHkdkeucUccmJ+9biDv33rvGe4gh0OmmgRzjXeiqfdUCqrX03RESlREbr934QS+ZtsBlKy6NhO34AEnepV4FRocA9nWxYRGQlROmvD4LysVJ4CiGmrf+TKL20pQIJcuWB7DdEJVTsjtgbLpL9jHjlAeOEiiKR28wMMTtnciX1iT3kxVLDs/ifZvAkyS0NDRKImySttX+TD/lwEg2iryAgvGWZEpqH8QoSPWT27j9yX0AULt6Eu2N/m26ivoGBACXvTJasWgSHDcQIxPSU07LdcAF6/71/AGvmbzWpaxScW0wE+dKNR0MH23CKwAU96k373P2S7QDx/sQa6S3xeHh9TgLuWN/FuigmXd0IUHT34Gn/vvAMTKSu3dj+zT5oopapgG9bBrVjUFIt5iJYXpdhgoEuZIDzwJayBCwvo4N7Zm56/fEk5Zvi5My1enZ6Wgg0M9+GT93oJ1T+SNcb8wftCZ8AMwSspnNxcg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(376002)(136003)(366004)(5660300002)(38070700005)(41300700001)(83380400001)(86362001)(6512007)(26005)(6506007)(38100700002)(53546011)(122000001)(84970400001)(31696002)(2616005)(186003)(31686004)(91956017)(36756003)(6862004)(4326008)(8676002)(66476007)(66556008)(64756008)(8936002)(66946007)(54906003)(71200400001)(478600001)(37006003)(76116006)(966005)(2906002)(6486002)(66446008)(316002)(6636002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2RsSEhnZmI2Y1pLRXo2NThNWjEwVHFhcm93QUFUcWdKMmNIdVFWQ3EySGdN?=
 =?utf-8?B?TjB2SlBUSVVkZjR1K3pmQms2M2JFM2M1eWtuaGtqWFkzWW9MSXozN2xaL1FE?=
 =?utf-8?B?Z25Ba081QndMUnl2bkZwaHZHT2dFNW8yVWlzZTFwYzZCL3hwMFU3ZTVHUzA0?=
 =?utf-8?B?a1BCZGJYdDZPY2hCT2QvSXlZRmkxdHd0S3VQMSsxRGI3TEwvTlhydGdYc0Iz?=
 =?utf-8?B?bk9HMDJaK0FUSllOajhIWVh6dTB1TzcvdWpXdmlpci94Q2JMWkdNeDRHeTBH?=
 =?utf-8?B?OGcydUNlSytsM2ltbXNsRTNVTFlVL1YyUXpQWERXZ3hPTmdKOXVZZDhrK3h4?=
 =?utf-8?B?UjZ4OTdFZllzOFV6U1pwNkY1N2tkdGJlMHQyWGsra0JqOWJtczM2aEF2bUky?=
 =?utf-8?B?Q2RkODBPVFgrUHFVcEptc3JKNkxYNWpZdm5XaHlpUE1BeTRpcDM4RzRUODNv?=
 =?utf-8?B?WUFGanZTbmpQZ0o2TGVGMXRZRkJhQ1JqOVpicUJCTzBuMDV5MXNzL1p6OWU3?=
 =?utf-8?B?SlBzM2wxbDBZVHJEZ2N4SldEeTZpSmcrN096b0JyRGdWOWxpQWEyRHJLZC8x?=
 =?utf-8?B?bXVqVjdMWjl4TWZ0clA0WFZPbCt1ZXh5elhYQ3JLektpb3A3eEJVcmVUNWJh?=
 =?utf-8?B?blpjcCtOY3JQMjNSS2NvV2xhbjdOdjR6RXFzTm1wK1JnbVZVMXlKMjNvOGJS?=
 =?utf-8?B?dTUyaHI2WFR0d2VPcEVaQ2hPSFRacFVSaTQ2dUdHZjhKSUpYUEFicDcxYnhr?=
 =?utf-8?B?MEF4ajdpSjAyTGRoY0dja2cvelRmUi9kTVNhdHFaNGdJcW1KUXcvTy8wZEds?=
 =?utf-8?B?R0lacjJNOUtyQUp3aDFiSWhOclZHWU10MzRJTURwYll3d1RPL0VqV0dvbUVN?=
 =?utf-8?B?NDJPSGdCaDNLekJYYTBzUk1BNmlJMVlQbTFRY0xkU003a1QyeGpMN2U3WTBv?=
 =?utf-8?B?di81QzFhdjJRS0I4TkM5MHR5SnUwQmZQa3ArV1dUK2xHK2w5YzFKbTYvNWpQ?=
 =?utf-8?B?bnlvaHZhUnJuNXR5QVg2Y3ZiVUNITHRqUkJFVWdKMERNc1EySlArOER6Zjlz?=
 =?utf-8?B?VEhIcC9Xd2lxOUQzODJYajRSUThseEs4TXczak1Fb3VyN1FHSUFsVDI3eWkv?=
 =?utf-8?B?YzcwWlUybFBVYXhJeUt5elV0S3NtdkVSbi9hajlvL25iSmdscXluWnU1T1dT?=
 =?utf-8?B?WjJJc292NklUdytoNDJkWVFoWTJ2RjNxS3ViZkwvSnVrWXc1Nk4zRFFudGZ3?=
 =?utf-8?B?dW1uQ3ZpejlyaGpLNkdVeU9CbWxCWkczb0dlSEZjdTBOMWk5alljNjhQSzMr?=
 =?utf-8?B?NmpFQWxEb0NoVEh1MjI5QytnRndBWktQUC9ESHhISWsyODAyc20rcnVOaUYv?=
 =?utf-8?B?SDlxOFN0NWNIT21ZQUsvVjFvd2lXa01SeUhobHg2VlIvN0IyTGRwc1h6MGc5?=
 =?utf-8?B?aWg3SjhVeWZrTjBML0dEN0hrVjFZSXVzRHF2ei9nckJlekQxNHZDamNzTFJv?=
 =?utf-8?B?L1o1SUlJM3BVQjkySzIwN1kvdzVpd1VpS1Y1OXNuQ1FuZVdvU05TVWgvbC9r?=
 =?utf-8?B?cTNQdnVQUWtFMTRuMFR1NmUxU1g2YzU4K0VKS0pkYTBDSU85N3ZqZ1NFQzky?=
 =?utf-8?B?SnlZaFRKNEZ6b2tJR3pNZ3pHdG5wM1J2bkVxM0hQSDYrWVVFRGR6ZGpja2tH?=
 =?utf-8?B?UWlkTTdCREk3dVNBYko3TGYxR043RGtKR0wvclhCMm8zOTQrZWt6OUtYWWlD?=
 =?utf-8?B?cWUzRVUyVUwxTUN5UTlJN3dQQzdjaTlKaDZoS1JZRmN6SmtZUGw5MTk4VEpi?=
 =?utf-8?B?QTBiNUR6NHE0NlJtQkNOS3ZqaCtna2tiYWFvdG9MRmdLYlJ5QjdBQSs0cGdQ?=
 =?utf-8?B?clF3bUNEOTlOU1c5NTFMNUczTUhyZENlNGxMMmcwTHhXWjFiVGpVZmFzREw0?=
 =?utf-8?B?Z3ZNaURqakpBZTlrTDRYU3MvbDBDYndkV0lKOVV6NHlxazJIV1NHSGtORGRU?=
 =?utf-8?B?a3ErUjRjWjArK3diT2RId0NBVlVTS0dLMDMxMEl4aEhMTi9kendGaWlwcWtK?=
 =?utf-8?B?SFpScFgzSDFjN2FzNjMza3dQcktXK0paQkEzQ3N6VGtkSlB4c3ZMcitOakpU?=
 =?utf-8?Q?Ea7A7xJNdg9HdbagVDtetI6e3?=
Content-ID: <522A16105D92F249949C351160618558@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d804685d-5e69-4bb3-8e32-08da91927113
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 12:05:37.4082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7Iw15OTH5YpGWdT4JFh5dK3jSlRORF4tFLUZrNRIgmgnzNQBMULBPVP+c/BzWZJGRUasweYHW+TvtyTXlEbWljeajJI7FYhzJTM9sU6Bc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_050553_005073_32AFAACA 
X-CRM114-Status: GOOD (  13.12  )
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

Hey Shravan,
Please don't drop the lists etc from CC.

On 08/09/2022 12:29, shravan Chippa - I35088 wrote:>
>> -----Original Message-----
>> From: Conor Dooley <conor.dooley@microchip.com>
>> Sent: 08 September 2022 04:47 PM
>> To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley - M52691
>> <Conor.Dooley@microchip.com>; Daire McNamara - X61553
>> <Daire.McNamara@microchip.com>; shravan Chippa - I35088
>> <Shravan.Chippa@microchip.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
>> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Cyril Jean -
>> M31571 <Cyril.Jean@microchip.com>; Lewis Hanly - M34782
>> <Lewis.Hanly@microchip.com>; Praveen Kumar - I30718
>> <Praveen.Kumar@microchip.com>; Wolfgang Grandegger <wg@aries-
>> embedded.de>; Hugh Breslin - M31864 <Hugh.Breslin@microchip.com>;
>> devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Subject: [PATCH v4 10/10] riscv: dts: microchip: add a devicetree for aries'
>> m100pfsevp
>>
>> Add device trees for both configs used by the Aries Embedded M100PFSEVP.
>> The M100OFSEVP consists of a MPFS250T on a SOM,
>> featuring:
>> - 2GB DDR4 SDRAM dedicated to the HMS
>> - 512MB DDR4 SDRAM dedicated to the FPGA
>> - 32 MB SPI NOR Flash
>> - 4 GByte eMMC
>>
>> and a carrier board with:
>> - 2x Gigabit Ethernet
>> - USB
>> - 2x UART
>> - 2x CAN
>> - TFT connector
>> - HSMC extension connector
>> - 3x PMOD extension connectors
>> - microSD-card slot
>>
>> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-
>> m100pfs-som-mpfs025t-pcie-serdes
>> Link: https://www.aries-embedded.com/evaluation-kit/fpga/polarfire-
>> microchip-soc-fpga-m100pfsevp-riscv-hsmc-pmod
>> Link: https://downloads.aries-
>> embedded.de/products/M100PFS/Hardware/M100PFSEVP-Schematics.pdf
>> Co-developed-by: Wolfgang Grandegger <wg@aries-embedded.de>
>> Signed-off-by: Wolfgang Grandegger <wg@aries-embedded.de>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

>> diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
>> b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
>> new file mode 100644
>> index 000000000000..184cb36a175e
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
>> @@ -0,0 +1,179 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Original all-in-one devicetree:
>> + * Copyright (C) 2021-2022 - Wolfgang Grandegger <wg@aries-
>> embedded.de>
>> + * Rewritten to use includes:
>> + * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>  */
>> +/dts-v1/;
>> +
>> +#include "mpfs.dtsi"
>> +#include "mpfs-m100pfs-fabric.dtsi"
>> +
>> +/* Clock frequency (in Hz) of the rtcclk */
>> +#define MTIMER_FREQ	1000000
>> +
>> +/ {
>> +	model = "Aries Embedded M100PFEVPS";
>> +	compatible = "aries,m100pfsevp", "microchip,mpfs";
>> +
>> +	aliases {
>> +		ethernet0 = &mac0;
>> +		ethernet1 = &mac1;
>> +		serial0 = &mmuart0;
>> +		serial1 = &mmuart1;
>> +		serial2 = &mmuart2;
>> +		serial3 = &mmuart3;
>> +		serial4 = &mmuart4;
>> +		gpio0 = &gpio0;
>> +		gpio1 = &gpio2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial1:115200n8";
>> +	};
>> +
>> +	cpus {
>> +		timebase-frequency = <MTIMER_FREQ>;
>> +	};
>> +
>> +	ddrc_cache_lo: memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x80000000 0x0 0x40000000>;
>> +	};
>> +	ddrc_cache_hi: memory@1040000000 {
>> +		device_type = "memory";
>> +		reg = <0x10 0x40000000 0x0 0x40000000>;
>> +	};
>> +};
>> +
>> +&can0 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +};
>> +
>> +&gpio0 {
>> +	interrupts = <13>, <14>, <15>, <16>,
>> +		     <17>, <18>, <19>, <20>,
>> +		     <21>, <22>, <23>, <24>,
>> +		     <25>, <26>;
> 
> Commented bellow...
> 
>> +	ngpios = <14>;
>> +	status = "okay";
>> +
>> +	pmic-irq-hog {
>> +		gpio-hog;
>> +		gpios = <13 0>;
>> +		input;
>> +	};
>> +
>> +	/* Set to low for eMMC, high for SD-card */
>> +	mmc-sel-hog {
>> +		gpio-hog;
>> +		gpios = <12 0>;
>> +		output-high;
>> +	};
>> +};
>> +
>> +&gpio2 {
>> +	interrupts = <13>, <14>, <15>, <16>,
>> +		     <17>, <18>, <19>, <20>,
>> +		     <21>, <22>, <23>, <24>,
>> +		     <25>, <26>, <27>, <28>,
>> +		     <29>, <30>, <31>, <32>,
>> +		     <33>, <34>, <35>, <36>,
>> +		     <37>, <38>, <39>, <40>,
>> +		     <41>, <42>, <43>, <44>;
>> +	status = "okay";
>> +};
> 
> Same interrupt numbers GPIO2 and GPIO0?
> 
> As per my understanding, GPIO2 and GPIO0 are using maxed interrupt lines
> Only one bank GPIO0/GPIO2 can work in direct interrupt mode
> other should be in non-direct interrupt mode.

Yeah, good spot - this cannot be correct. I had a look in the HSS and there does
not appear to be anything setting the GPIO_INTERRUPT_FAB_CR for the m100pfsevp
target & therefore would be at its default value of 0 - so GPIO2 should be using
interrupt 53 for all GPIOs.
Thanks,
Conor.

  
>> +
>> +&mac0 {
>> +	status = "okay";
>> +	phy-mode = "gmii";
>> +	phy-handle = <&phy0>;
>> +	phy0: ethernet-phy@0 {
>> +		reg = <0>;
>> +	};
>> +};
>> +
>> +&mac1 {
>> +	status = "okay";
>> +	phy-mode = "gmii";
>> +	phy-handle = <&phy1>;
>> +	phy1: ethernet-phy@0 {
>> +		reg = <0>;
>> +	};
>> +};
>> +
>> +&mbox {
>> +	status = "okay";
>> +};
>> +
>> +&mmc {
>> +	max-frequency = <50000000>;
>> +	bus-width = <4>;
>> +	cap-mmc-highspeed;
>> +	cap-sd-highspeed;
>> +	no-1-8-v;
>> +	sd-uhs-sdr12;
>> +	sd-uhs-sdr25;
>> +	sd-uhs-sdr50;
>> +	sd-uhs-sdr104;
>> +	disable-wp;
>> +	status = "okay";
>> +};
>> +
>> +&mmuart1 {
>> +	status = "okay";
>> +};
>> +
>> +&mmuart2 {
>> +	status = "okay";
>> +};
>> +
>> +&mmuart3 {
>> +	status = "okay";
>> +};
>> +
>> +&mmuart4 {
>> +	status = "okay";
>> +};
>> +
>> +&pcie {
>> +	status = "okay";
>> +};
>> +
>> +&qspi {
>> +	status = "okay";
>> +};
>> +
>> +&refclk {
>> +	clock-frequency = <125000000>;
>> +};
>> +
>> +&rtc {
>> +	status = "okay";
>> +};
>> +
>> +&spi0 {
>> +	status = "okay";
>> +};
>> +
>> +&spi1 {
>> +	status = "okay";
>> +};
>> +
>> +&syscontroller {
>> +	status = "okay";
>> +};
>> +
>> +&usb {
>> +	status = "okay";
>> +	dr_mode = "host";
>> +};
>> --
>> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
