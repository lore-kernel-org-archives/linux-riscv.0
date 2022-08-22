Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9505FC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 21:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1+bHkeadihov/TSSCGHk2X4OTb1qz/faKf9Ow4cYic=; b=JO+M/fleNKgiNk
	nxkWiIaLJBj8SfPPr+rDwz57GrEeUpYcA4icy+pkfm1hYtZ11ig9Zp/JYGg54OLy0RSn8FX3Mw4b4
	TccAiRLDymzdeT0puI5fs6joTxjcEJNPY771/F0WAkxg33Q41RJso9Ji/7peX2tL7zI2X0YhARRAN
	AOqoxcUQ3RRNhBaxOpSm4VmURZ4Po2ecNvsrYAA1/jsoe87hFfszHxnuXZ5GFR+Tu1LVHhSukKsqU
	35obmVDMG6Y+jktOW+ntJWlAyxaasrL8Pv9MQHTHphgNyC4gBbbGFtgv3yMYRdwLs1JH02kKePKei
	chd+zsDRLihWvnolSeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEa8-00EpoC-Ac; Mon, 22 Aug 2022 21:03:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEa4-00EplO-Pb
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 21:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661202212; x=1692738212;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aALuRz5/WauLEvIhCOcq1HwkYLwGqa6jvQDZ80emWxc=;
  b=vpcM6LkrbZOLqCET1EbcrCrY7oqsCvJjAj+lb4xA8Z20+5HmY2h7fZNS
   Q+JNZuS5lCkwc1q7hbMdYeVYxVIBEzSQpLfX7oFYmsqgGXVoQFtMSPZE0
   gzTy2eLQKIfJBbcDE07VqJsH2iaLZIJ6y7Max/KsO8Bcdv+560ZmWwyZd
   zTitYZ0U8FEvKysSHoe2OKn9vF551ZNkaw1Ay7DMrY3JHDC+IdDDHFjmh
   ZYshP8IiBzkT7CTQl67bdJomA8PHZQ+6E/ER1XCkgG+H0QiaJkYbAA8ua
   L7XwuM7SOkTQ19661fjzbO0l0GXB02KvvLSCS6q92UJwGrxqYTkHMy0OE
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="177436902"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 14:03:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 14:03:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 22 Aug 2022 14:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRs50APmHj0oNC31CJ/NWWUh+YTVL2qkmZyConUvHcvZ72u/IJf8XRTzVLoh3wOTI88i9ZSEYmoWGd2AcsQIBf2F1eww1n+RZlI5QhFzrlVE1hIpuYS+GeU0yr4mWKIa5HWcoIb73ehuSGFD9mXHiqMrJ/jJvo7MW6ZIYtzsCbSdkynY+2PFLqLxZgeCkPf+CvZVLJuzmkiJT1TINcJtiCgskRnWUpvbRPzw35QxJKMdvFsiUW5b+2q3ogSIakBV2aQRngM1DlCsB+rIF5y3KgoWagmvlJfDOFhR2qU7PUrXreT3EvymV916g7qYzwrpd5ocI0qRernvmpNB6sUoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aALuRz5/WauLEvIhCOcq1HwkYLwGqa6jvQDZ80emWxc=;
 b=A6v/kg10ZshgXv7xkA3/dPuu0er2TpXXDksg5BaHCnv942jXfbWCgKspudBu04OJ2w9CTyf/jFmSOxw0JuL9paxw7Aa2DqGZ/ZVlUMlC2U2hT+pf/KUmMEWiba99R6Sc9WbRY/ph2TPLi8BhMMlKMoxqq7o7dnDlI9vRpSPC4gl7wim2BR0sYS+CuOUCJ77Tj1dCcK2YgSFTluK3znhMbzYrsODp9l5VkrKLejYcjWKT9my/qsIpH6BxMGCaiEky+dMukbhlh5nqpToUISzEG2Tzomu/ITHbcfboLF50s1Rxjwm4eR7jlMK3CXvN/8vuxzJVESORZ/kWZQROU/3d9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aALuRz5/WauLEvIhCOcq1HwkYLwGqa6jvQDZ80emWxc=;
 b=Xdk0ioBdjgS2gMqMXKjksFFxb3cYA9Z9vpD46bb91DYkOmtauDe9xSIN3FQIeLgjCNJhz8QN9q++4YtoWSwAJOlmKkEtM+vRJfEGzi+dSCJvAscE3V19yGmIbcBPi+8P7yJtNlo7Au94n5Lme9WE62fZ8eQyNWdRGZv4Y/WAyv4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 21:03:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 21:03:11 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v4 2/4] mm: support Svnapot in physical page
 linear-mapping
Thread-Topic: [PATCH v4 2/4] mm: support Svnapot in physical page
 linear-mapping
Thread-Index: AQHYtjzHUuHlRKcrcEW6tytqLI7S9K27aLEA
Date: Mon, 22 Aug 2022 21:03:11 +0000
Message-ID: <a8a8bab0-2230-d7a0-c093-509b6c81ac26@microchip.com>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
 <20220822153413.4038052-3-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822153413.4038052-3-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68b0e03b-fa7a-42ad-8810-08da8481b8e7
x-ms-traffictypediagnostic: PH0PR11MB4950:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LDXk/pTQ99xm+U0Iy7zMXbkAknr4kKZM+413zyaKF/QF3lGlezznsDNbe0TexHHALqmn6En/YMw5t1YXVmhEBRnQEo+oXS8/QGx7lFInaRlvFFPbtSxuOHFuh/g7dIw/YWb0OgcthFojjbAAeeV957OwYmuuDq7zjVUFFzDHsF5QwgJy5xxN3U/AnduwbiaNl9cprOZ6tafF5BHTXDvZLdSmWrg6JQTcyJHo8QkydlfsbPQZBsDomuNf2NKUvIjbQjbE+Yplh2GmTkPgWOzKSVxrb/EQY7qa/YFKmJMOqmmW0km+GW4VN4oR3POzj7zP8e4zcOU9fEAz+MV5OheaNRUl5Rp+JTIEZ0NwnGxnqAK+63ZVf+r7wXdSr+DnMinziJ03CopOOnlqWs32vH+r1ui7qhx3+tyMAlyQiYblDfB5PHOWHckoIbWWh/bCiIG6+HmOPzgAU4D7VygK9lj33IjaYxOMgeR35+pABJKG0CEdsimkTjr7SxBJcnatxb7i4vopvLCgfct8g3bTx0BuxfM4iCZEdUC44zOxeEIc8BoKt4MGHRJ8m/Fjxta91ILJEVqII16gWcBnaK+oPw4YQR4hbklcdItg0ZN7wpS7UIvyX+lHC/hDgfWVb3tzVwQXni1Yp/awoIZ64Wj3Mtr1YHJPyb13pC8F7A+on1EBXP2r0etEZHfd73lywy+uKFeDnVIivoRf32G7iloazLdR8Jf4wDe7pHafNqnqLktLVwvd7+kW3TdPgFR/qWlyKQBwzoX2K2/72dCg9AglGveoG9yeKHS0CIxtCvSz/HwBo1t0tlsBzGcvehZmoZvpN+ubMo4PgVBVkN2JXtBVLVTLWCpYIF7L3aIky+5SAsDBcqs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(366004)(136003)(376002)(396003)(6512007)(26005)(6506007)(53546011)(478600001)(83380400001)(38100700002)(966005)(186003)(71200400001)(6486002)(31686004)(122000001)(41300700001)(2906002)(8936002)(5660300002)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(86362001)(76116006)(91956017)(31696002)(110136005)(54906003)(36756003)(2616005)(38070700005)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHpQNCtPY2c3cU1XSmVxcEFVaDlEN2lUOUs2ckkyNXNBZlRRcnFaaUh0MERw?=
 =?utf-8?B?NURKb1BCQ1A1Mng2SlAyS1VqalZQQ1VUVHR0YXhqeE43YzlKeHArYllqUEpq?=
 =?utf-8?B?R0YyUXdjWWppR1hOalZISHFia3dPTEVjaGJBcG5JTWdJZXdmYU54eWI0R3B1?=
 =?utf-8?B?azZwaWwyQUF5WVdXM3NvdDg2OFlYUHNld0RNK0xOcS9UZnl0bHRCQ1VhWTkx?=
 =?utf-8?B?SWhMcTZJVHROd2pxQmZjbHpPOUJJVmtwZCtFY3YxWHZtTk4rcDA0cW1LZEFO?=
 =?utf-8?B?WFprWTREaVAwbHZmbnVqczRRZ0o1Q3V3N2lJREZDdlNzZ29wMU5hWVZoTkxq?=
 =?utf-8?B?N2pCS21VRFJ2SzQ5NnVPczRYckZoa2ZDZkdCSERSWFRzUHNmN1YrYktpR0Rp?=
 =?utf-8?B?bVNqRmsvT3djeVBCNjRWNjNDeTgwZUc3aUY3LzBKa0gwKzUyMGd2dlJSRkQ0?=
 =?utf-8?B?T0xTVFgrRFJuMW83ZWRoYnhjUDhyaHRQb2IrZkw5bjIxRVRGOFFqTmhhZmU2?=
 =?utf-8?B?ZGNmMkI2eEVxVnpmWWJSL2lhR3pEcTlIN2VRZmRiZmFhdFBjdGlGMXIzaXVx?=
 =?utf-8?B?Q3psNXlrblFlMVZwTE5lVmJjUUJ2bUZvdldRd1ZoeTBuUld0STB4R3dBcFZB?=
 =?utf-8?B?bTFiSDJTUWdVK0lTVnB0R1k5VzRxak1DRWVjd0RsRGE5bC9jYlZvc2FoRGp6?=
 =?utf-8?B?ZHNYeTBhYXNLOGtEaFpuSTArYkZnR1lHZ1VlWEVENFpsLy9aVkFzMWVRRkdP?=
 =?utf-8?B?SC9Mci9qYVcyQVVFalIybjlRenZNdUxLVkpPcGdkbGkwMUtrT2R2eEIwQlRO?=
 =?utf-8?B?b2dOOFF1b2cwY1YzWlJqOWpWajlBUmFwSG4rTGNqUENVSnl1RVVYdHNHTW1w?=
 =?utf-8?B?ZlBNc2krOEpCVDNuVmptK3E1NEdEeSsrNnkrWUtIc28zaU5rOHBiYjA1aDFz?=
 =?utf-8?B?SktGWitnTVZxSjA3RThJcExyWUM1ZE1zY2ZEQWxRRllCZWh5OHhFSmZwWUc1?=
 =?utf-8?B?ZDlraTQrQVp1cEk1SGZUUy9uRmZRVnhRQnZ4cjlreGlIQUF2cytPbkx6cWJO?=
 =?utf-8?B?b1I0RDg4Um9DNlNYRGZodGFsNXAvRXJwU0R1Y0dDcFQxL0V3RllPQ0RBenQ2?=
 =?utf-8?B?RFJSV0VodW80SzAvZkpyaENGQjA1NkhQRWpOWG05MjVwaENFczk3SUxjWFph?=
 =?utf-8?B?RHNHcjMvZkxETVArQXYybUVZd2tjeldQeFlROUY0VTErVXRzSUcrQjNlbkxE?=
 =?utf-8?B?UnA4V2ZvdjFrQVRadDRmSlFWdUluQWZ2WTJQc3I4Q0V0YlpNTDdzNnhtVlA1?=
 =?utf-8?B?RHFYTFVUK3l1VEdvMDB6VlJkRTVHeGFVcnhyMlZsODQyTHA4RTN0YTlmRld0?=
 =?utf-8?B?NVljNi9yUUZwSkZyL0xacjVJZWs0SEF6Q2RmYlNOaFVuTXVBOHJXZkYybVJv?=
 =?utf-8?B?eTJkTWdDSStOOHlMWFJNY0tJYnE2TDc5T3c0cFVLUEVRUUh5ajRhd2hHTEQz?=
 =?utf-8?B?WkNvaDkvNGVDQzJsS2xySFA4aUJoTklmazBObElrT1hyU1Z0bVhMbzQyUkdZ?=
 =?utf-8?B?d0g4c21OL3oxblJnaTNUcmQ0UERwWG1kSnBpRGF5emUva1BZdEczVHRjTHpj?=
 =?utf-8?B?SjV3TS95UnUrVXFvbEIzM25hcHV6OVhrOFNBdjZrZ3lmdmdPSENBTktzc0NP?=
 =?utf-8?B?Yks5SmR5b29Qb0YwMDhTSmJnbVcxcjFtb1FlNFBRYjc0M1VvMlZlNEhLNnhq?=
 =?utf-8?B?RzV2ckhrMUNzOHpwRHdaRFluQ0VRZ0kxMDYzeHczaU55U010K3U4NkJ6V215?=
 =?utf-8?B?eVUycldxSVM3SjdpakZNRlZXRG0rL3o2OGRNRXVqTW1zUUIwZGZaM0NIMEd0?=
 =?utf-8?B?a2w0R2pQenF6dXNCOGgzUk56Nmxtb1dleTk2aytoelJYWCtkTWhabGpVR09P?=
 =?utf-8?B?aFJub21ZWUVrRmlocXV6UlFyZGYxSlZpWHU0RVg0R1dsN2RhY3BQYkFxMUhv?=
 =?utf-8?B?TE5kTzBBY0VVMGE5d2pLWFJwTEUrdy9MQTkySVhSL1VUYmRZQUh0QmloT0s4?=
 =?utf-8?B?dWpuWEVQUlJGdEZ0Q0VQSGE0OHE1UkZBd1E0WmJlUHhsUEloUWdaQnBhRHEr?=
 =?utf-8?B?c2VPTVJHa1VvbkpXVTQ1OE9YdGNFTjl4VGJ3clh6cVdETlU3ejNrMEJoL0xj?=
 =?utf-8?B?N2c9PQ==?=
Content-ID: <A6A81ACD175D7F46BD16D5B8F10196D9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b0e03b-fa7a-42ad-8810-08da8481b8e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 21:03:11.3863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSvPJHl0RP0Ftla1oyixADblmGwbrzLM8AXV3NqnVWjuwrrzzrdWStFJJozRlMDOvNm1jRuUt73hTBQKvQxI4xgPnkCUVsjA+wXQyGftKpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_140332_873644_9532B900 
X-CRM114-Status: GOOD (  27.75  )
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

Hey, 
Couple questions about some things that caught my eye.
Mostly beyond my pay grade here though...

On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is powerful when a physical region is going to mapped to a
> virtual region. Kernel will do like this when mapping all allocable
> physical pages to kernel vm space. This commit modifies the
> create_pte_mapping function used in linear-mapping procedure, so the
> kernel can be able to use Svnapot when both address and length of
> physical region are 64KB align. Code here will be executed only when
> other size huge page is not suitable, so it can be an addition of
> PMD_SIZE and PUD_SIZE mapping.
> 
> This commit also modifies the best_map_size function to give map_size
> many times instead of only once, so a memory region can be mapped by
> both PMD_SIZE and 64KB napot size.
> 
> It is tested by setting qemu's memory to a 262272k region, and the
> kernel can boot successfully.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index cedcf8ea3c76..395fdc922e9e 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -25,6 +25,7 @@ typedef struct {
> 
>  void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
>                                phys_addr_t sz, pgprot_t prot);
> +void __init create_linear_mapping(void);
>  #endif /* __ASSEMBLY__ */
> 
>  #endif /* _ASM_RISCV_MMU_H */
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..37e6f7044ef1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -292,13 +292,16 @@ void __init setup_arch(char **cmdline_p)
>         kasan_init();
>  #endif
> 
> -#ifdef CONFIG_SMP
> -       setup_smp();
> -#endif
> -
>         riscv_fill_hwcap();
>         riscv_init_cbom_blocksize();
>         apply_boot_alternatives();
> +
> +       if (has_svnapot())
> +               create_linear_mapping();

Does this now get called twice if has_svnapot()?
Once here and once in paging_init().

> +
> +#ifdef CONFIG_SMP
> +       setup_smp();
> +#endif

Are there any side effects to moving this down?

>  }
> 
>  static int __init topology_init(void)
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..f54c3991f9ab 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -373,9 +373,21 @@ static void __init create_pte_mapping(pte_t *ptep,
>                                       phys_addr_t sz, pgprot_t prot)
>  {
>         uintptr_t pte_idx = pte_index(va);
> +#ifdef CONFIG_SVNAPOT
> +       pte_t pte;
> +
> +       if (has_svnapot() && sz == NAPOT_CONT64KB_SIZE) {
> +               do {
> +                       pte = pfn_pte(PFN_DOWN(pa), prot);
> +                       ptep[pte_idx] = pte_mknapot(pte, NAPOT_CONT64KB_ORDER);
> +                       pte_idx++;
> +                       sz -= PAGE_SIZE;
> +               } while (sz > 0);
> +               return;
> +       }
> +#endif
> 
>         BUG_ON(sz != PAGE_SIZE);
> -
>         if (pte_none(ptep[pte_idx]))
>                 ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
>  }
> @@ -673,10 +685,18 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>  static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  {
>         /* Upgrade to PMD_SIZE mappings whenever possible */
> -       if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
> +       base &= PMD_SIZE - 1;
> +       if (!base && size >= PMD_SIZE)
> +               return PMD_SIZE;
> +
> +       if (!has_svnapot())
>                 return PAGE_SIZE;
> 
> -       return PMD_SIZE;
> +       base &= NAPOT_CONT64KB_SIZE - 1;
> +       if (!base && size >= NAPOT_CONT64KB_SIZE)
> +               return NAPOT_CONT64KB_SIZE;
> +
> +       return PAGE_SIZE;
>  }
> 
>  #ifdef CONFIG_XIP_KERNEL
> @@ -1090,18 +1110,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         pt_ops_set_fixmap();
>  }
> 
> -static void __init setup_vm_final(void)
> +void __init create_linear_mapping(void)
>  {
>         uintptr_t va, map_size;
>         phys_addr_t pa, start, end;
>         u64 i;
> 
> -       /* Setup swapper PGD for fixmap */
> -       create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
> -                          __pa_symbol(fixmap_pgd_next),
> -                          PGDIR_SIZE, PAGE_TABLE);
> -
> -       /* Map all memory banks in the linear mapping */
>         for_each_mem_range(i, &start, &end) {
>                 if (start >= end)
>                         break;
> @@ -1111,14 +1125,25 @@ static void __init setup_vm_final(void)
>                 if (end >= __pa(PAGE_OFFSET) + memory_limit)
>                         end = __pa(PAGE_OFFSET) + memory_limit;
> 
> -               map_size = best_map_size(start, end - start);
>                 for (pa = start; pa < end; pa += map_size) {
>                         va = (uintptr_t)__va(pa);
> +                       map_size = best_map_size(pa, end - pa);
> 
>                         create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>                                            pgprot_from_va(va));
>                 }
>         }
> +}
> +
> +static void __init setup_vm_final(void)
> +{
> +       /* Setup swapper PGD for fixmap */
> +       create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
> +                          __pa_symbol(fixmap_pgd_next),
> +                          PGDIR_SIZE, PAGE_TABLE);
> +
> +       /* Map all memory banks in the linear mapping */
> +       create_linear_mapping();
> 
>         /* Map the kernel */
>         if (IS_ENABLED(CONFIG_64BIT))
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
