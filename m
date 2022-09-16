Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C8ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LDVfnwL8En3iFKPa8gGNEAMVE8QoQIZyxg7f8zhEig=; b=kcK+TOvZE79Dtu
	EwPYFTHS6BLsRQO0/biZotWJVikzX2yrdIxZMDT/uCYgENVIVEWPl8YgW5/V1i/PS4R0287pXk8tG
	zq2pwBsu2SgPlFs7wKaAD9lr/8/z4ShPRzGdhOKMtBg009WASDPjpuIVtSIihPHpucDOJxyje2ASw
	KJIRVSkZpMO58vjalZ2fuQScjCVTihj0UUhIaNgXq8W36xfUObuuNeqXvgKxthv9+LOr+vnQSm/oX
	EFTA8dHkXXGE+X5M56clZTbALtMahdMPEoVCTuTifZLxiWOeWDaK5pKFIHDfflcnhwt3GmaW7Lx97
	SleEA5IvgIP23LstSgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC5q-00E1Rv-Av; Fri, 16 Sep 2022 14:13:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC5l-00E1OJ-NY
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 14:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663337597; x=1694873597;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CwqPfFKjN6ZUajt7hzKOpkUmGpsG9NrCRF4mlbaW1LU=;
  b=YueXYzXGjgo1XgdUDdAea/oB16k+yUS3qQIN325okRroy5ZyF22swQo3
   du81V3Q9V2yru6NbKXVJ7yib0jJUt34zEPgmpBX6UixsQeRFmrH9rIYmB
   H3lNWYTtDSxg40mJ/ceh/FVYPEncE3GqKolJ0bJHwuBj3ZXyXqtb0nTsE
   JPpWqCfPTxVVudiVXAsqdBumJKi1V9bUbkXRWOQ1I2mWIcZbCQltetXGn
   lwLBmIp5ltDdoBAkSuamMWfzIKVTdhwju/mn6zB9xGeLUsD6zwUAWS67J
   kCUNr4z89DmmK2zFVSDbQLHNV2DpeT/JAlKXai/WMl6OFhzmSxFbIo35N
   A==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="177517290"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 07:13:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 07:13:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 16 Sep 2022 07:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+QahrZ1QmZPc2sYqgr5zkKETCOZnN9JP8ypDuAYE6njel1OFEN0C0O16anEyL0KaMRC8BfZmpA880thkLlfZb2bccoPpKmJ4xAN3cVsdrq4oKNXNbpYhgL7SB6KeiTXRQTSlibDEvDLqxQqgJNJvgs4L/n5ShPFAV7qbF4w4SU9ATn4SHSTFpZOGQ3eZGNdHdSU0klPBnOeDX3mn/nLfRZfoWFq91qAfrZ2i7Xa4JHlsWv31KE74d3Gfi6WaFOfQ6Oqvafp5OBj36GlZWyW6kBThBG+uNyB/Hlsdnrsm/54yeac/YkuJ9A5Mg0S2FfHpEZX/tb6zkoS6hPlMLACBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwqPfFKjN6ZUajt7hzKOpkUmGpsG9NrCRF4mlbaW1LU=;
 b=QLc5Hh9h2nIc6wHlJVictaDYovuyggdklD++dralF6NxQ9RZzgbPkd21BzM0ScQSRffOoOZ686GwR8DpBqjykA1E/TQNaBGTaBsao3G+Cn+vLrXO4IZ99y4Dwe3axldRs6K1lhCWvGlfmnqoEyOxQxem0FUqkxE+gFs9xwzRksaSLGpMrgnw5jJ4/fClW5zwo78+4LPRHV1ZFjEQlTkflaxQW9IJgv6TyR1u4uxK/ZvhCwq4PkSbV+sBLctDjZ36TTxPKR2lynNgpuZDy+QklUKA18UNYr1WWTkWLC3pUgrblAjHeYAr+/M+voC9ubDBsrIykXlvroVHtwcrXpHf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwqPfFKjN6ZUajt7hzKOpkUmGpsG9NrCRF4mlbaW1LU=;
 b=qOGnK3kCReMmbnvkmhDCOYmyRIKnCjr1O5D8+2wszzuCd4MOrnEl6cv/VB9XDcLwIEb8booRaByKOxbz8c4t6F+jddql4MiicTgZ93oCMmZOPkcjTKf9oYqUlgE6vY1yzitjWAFkJHyHLSw1u0PGxg3fACJKFGhN0FBBcyFHFic=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 16 Sep
 2022 14:13:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 14:13:07 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Thread-Topic: [PATCH] RISC-V: Add support for Ztso
Thread-Index: AQHYvn61IrK+ZLFpoUqIjb9+jSm7uK3h6UGAgABFtACAAADZAA==
Date: Fri, 16 Sep 2022 14:13:06 +0000
Message-ID: <62ebd7c7-e911-7163-7899-290499e1689d@microchip.com>
References: <mhng-b0281abb-e0db-4cbc-a38e-e87aa26a26de@palmer-ri-x1c9>
In-Reply-To: <mhng-b0281abb-e0db-4cbc-a38e-e87aa26a26de@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SA1PR11MB6781:EE_
x-ms-office365-filtering-correlation-id: 2dcce3ac-ef1b-4909-d07b-08da97ed93e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 983RN8O0VxhYElKbEMvAR/MQIs0uWQDkaDbG81XFrjJQTe73dwcC4+BKSYPpOZ1LYRf4kJtRT5oHLqBoLm+flxI6Q+9Yly+kskG6Q1EDyPdLAqnYnhw5P7CMRDXjzPebtPc4cZIcV0elCVkibLOmpoPLsy7aAvBrHZpxH2ATRD6HcVijPN/0S3/lpYYrN8bYyM73u7itjUMrkrd3LgEVmhs1odYfxj+n8UH2tbjwyLrVh2VGe9M1Ko5NP/oKuOpNYpLPGtdhwxh6STQnd9jKDnxO23/FwE/kngSlapWGRZdVhdaXpysDturzGICV8ur2UHpAu5pQ2bOygshE2tO4J6Co3RlN+OIxRAy/joMUKgBJx2Vc7jAG7tsKCJm7yylxceWLSgTMjrAVZAizYpGoST5kTdpx6ZpwshQy89CJyb/P+X0ABqRv8jb+XkwxJHQ+a6Yj1jX97uQdyn5MHBO7lBrybHfTnesSEqBleE2tra4PsuyKMIHWS7UmXFad3+pG8N6iI+kc7WNCGZjetxbTFeQ0Bm4UHb9fAgzsrczDCRNgX/m8j4dIKaP77gf/OaUUHcpCcylA2z1+bF6lT13+UFw13HZeRHoz51Oxhgb13T20VqnXJzDohQsss80Wemeh0moSd4Wgq1c+HdnDObP1g/5zY1ggQ0XNF4J0qamksyBA47q1AE54cQIaninZseqT90tebdHKdftCJlWRQQazmIxQxMuheXwCtd3hvH3Vm14SuDvv1I74LayoTY+qrWv8A4zynbVO7oAK4Byb9tqIHVYP7ypGxgL0uUsktfKcevYo8ExvZBOuPChAYQMXUVVgCXLkNk53LLZpqwR2cfN4bw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(2906002)(36756003)(8936002)(66946007)(38070700005)(31696002)(122000001)(8676002)(76116006)(86362001)(478600001)(31686004)(6486002)(53546011)(64756008)(38100700002)(6916009)(66446008)(2616005)(71200400001)(66556008)(26005)(4326008)(91956017)(66476007)(316002)(186003)(6506007)(5660300002)(6512007)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akZNc3lIanpNQktxdnhGWHJMeGs4RnEvOWVQS1hXbFVXUnVZMGVnVklpeEpp?=
 =?utf-8?B?VTRmUlkyUDJvMzJRNEl0cVVpQ1ovYVdudjVkcEFlVmUxaWYyaUJXSFgrWHYv?=
 =?utf-8?B?dE11alhSVXNscldFSjM5bG9KY1JGcklrSEUvTGJ3alR6Y21Ha00va3dUeVBh?=
 =?utf-8?B?TTFHbVo2cWdCQlNRUkJ3eDAraDhpcXhYaG5UYWJscmhGTUZGTkxwVlZCd2Nr?=
 =?utf-8?B?ZXA4eWFySHdZUEZaYjhvc3lxZnV4aXgyclhMYnZlcmZxdnRTWkJBY2pHV2E4?=
 =?utf-8?B?QkFWUkc4Yml5dm4xVEhxT0ozU05ZTndNYzJUeWN0QllvdWJBdStFdWJja1Na?=
 =?utf-8?B?cEFVVzR2emt3UzF0anV5VnMvYjZHYXZaRno4NGQ3cVBrb0F1Z3FSQXJEVVNO?=
 =?utf-8?B?YlR3QllMTzVRVmNLcEo2ZFdwaFBMY2VqTGZPckNoY1Bic1FzdnoxR29yT0Ew?=
 =?utf-8?B?NzR2cGZiT3k0SUoxYXk2NHg0YzlKZWRMSmVkUnBuN0pVL21RRG1SSkF2YXo2?=
 =?utf-8?B?TThzY3gvS01CQVlDenFteFdscEEyeWJJT0RUZ0xZVFVtSFVqMUovZTFITjho?=
 =?utf-8?B?b20vcjdScnI0WlFSWE1rRU1pSHBEZ0Z0TVhNTGJvMkx4RVRIMUlIVlRlcUVp?=
 =?utf-8?B?MkVSeUFMemc1TndXZUxrSWk3SFJaUi9KWTVydlBZam9ackZCdUlRNVA1K2t3?=
 =?utf-8?B?eTB6SDFPTlFsRDUyU2hlc280bFY4UmRsajdtc0I1eU5acGpEVDR1RExFWWtI?=
 =?utf-8?B?REN3MXZKQmFmMzJIMHRwNEwzT0tSNVhZRzNoQTR1NW45d1lLMXpxUXNvSnpP?=
 =?utf-8?B?U1IveDFJaXRlbDE3SGllK1JPb3M2TmFKaHM3aGxUanFKaUdlYytuT1FKU3Vj?=
 =?utf-8?B?dmtwK2FJTnNPR1FNTHljeDRRQkRRL05jdWN6ZGZMc0IwL3BScmxlOTEreVJ2?=
 =?utf-8?B?WmxmY0hqNTBxRHFscm9ZcVB6bS9BSU8zeUVML2RBbzRrcjNIR3FTTUFWSFBj?=
 =?utf-8?B?RlhScXVWK2pvdzNFU1p3RjdLOUdnRFVkVmtsYWFLZzg4bmFYQXluL2loMHc5?=
 =?utf-8?B?TGxCUDFTT1VHMVV4aWNCeGt3b215NzlPTlV4aGlVVlBqY1RRQXM3UzZpUCtZ?=
 =?utf-8?B?YmVDNldtWkNLYk1LVy9yR0VUS2o4NzgvQVNxSy95TnpFUXhRbk5EOEZnT1A2?=
 =?utf-8?B?SHU4bEVtd3hEckxEZ1dtQUZIWFdZbkc2VjBUOE5XYklReURsd21PcEZxWGVz?=
 =?utf-8?B?UWNvOVRzcW9uLytJM0tpQzBIb3lpMlpweWRZdGNwVkNRMWtUbm9LZXI5MEpV?=
 =?utf-8?B?S0RQV2hFUXVLV0VvOEJFN3p4SWlWNlZkZjRYN1o3SU1kSUxiUFBnbHk0cW04?=
 =?utf-8?B?WXFVN25pbWxSYnJTRm40RlZpajF2c0I0ejJmbzk4KytOV2xjRU1hTDd0NUU4?=
 =?utf-8?B?ZElXRmxLc3BoTWpZbmRQNkJaakRwVlRJdGN0cjYwL1RNZ0F2akdsUVVRRk0w?=
 =?utf-8?B?ZStHOEpXNjR2WVY2T2twVzZsRFRRWjd5R2RrZmhmb1hUNDdlZkpPcUFNKytn?=
 =?utf-8?B?N1BEQ2tXdEFzRTNGLzlwVE5yS2tYWExFV1I5eWJ5TENCdVFwdkVTRTB4RGdW?=
 =?utf-8?B?dXpjYk1uSUNZcVZMa2hESTRBUGZmNXNwU1cxK0k0THNEa3ZhMEtQaitiRmhM?=
 =?utf-8?B?Z1hrL0FxK01RNmJsZUdUVFJQL2dLb1dES3BINjdXZjN0azdKeVdJTldaU2ZN?=
 =?utf-8?B?c2tPekVWZ0hyOGRqWUVaZWh2R0s2RXV5bnFPOVpoK1ZPSjI3V3lCWFNRaDZB?=
 =?utf-8?B?WFgydXF6bGZQOEZqMEFxMXgyRjJlRW5paHRTWDFSWGQ2N2R0L3ZzQWlEYUZS?=
 =?utf-8?B?YVhFOUVrdTBjK2RCWHV6Sm1jVU1UbTF6Rnc4U0lGWTFkc0Q3OGpXMTVyL1p3?=
 =?utf-8?B?MXBaZklXS242UVBjQXc3YVZyaWdKNGxHZTJyeklZYmVITXdGZ0JNRENyZEpO?=
 =?utf-8?B?dEd5MFRWYzd1b0UycHFZQnhyQ1A3MW9qZUdjeWswMng3cnVUSWxITFdwZy9h?=
 =?utf-8?B?RFFJdHlLMXhOc3dCcTFqNnZrczZTcjVMYkNVY1NiWnA5eUxqZEpxYlhGZHlJ?=
 =?utf-8?Q?g5H65DV693JD5Eejo+WUWQ4yy?=
Content-ID: <907EA569024B8A42A24E7AACA36382FC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcce3ac-ef1b-4909-d07b-08da97ed93e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 14:13:06.9970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSLJlrOdxJaJPdEB1cvYm6J1Z/6y+4d7cD1iiCGo2dnlzbmaaUztJZRIMc4KHQkQo3cCyl186/0Bb9kHu2YJ61d+ZK9lOG0Va2uuA5lBstE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_071318_139446_6C9941F9 
X-CRM114-Status: GOOD (  14.41  )
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

T24gMTYvMDkvMjAyMiAxNTowOSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gRnJpLCAxNiBTZXAgMjAyMiAwMzowMDoz
NSBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAw
Mi8wOS8yMDIyIDA0OjQzLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IFRoZSBadHNvIGV4dGVuc2lvbiB3YXMgcmVj
ZW50bHkgZnJvemVuLCB0aGlzIGFkZHMgc3VwcG9ydCBmb3IgcnVubmluZw0KPj4+IGJpbmFyaWVz
IHRoYXQgZGVwZW5kIG9uIFRTTyBvbiBzeXN0ZW1zIHRoYXQgc3VwcG9ydCBadHNvLg0KPj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+DQo+
Pg0KPj4+IMKgIC8qDQo+Pj4gLSAqIFRoaXMgaXMgdXNlZCB0byBlbnN1cmUgd2UgZG9uJ3QgbG9h
ZCBzb21ldGhpbmcgZm9yIHRoZSB3cm9uZyBhcmNoaXRlY3R1cmUuDQo+Pj4gKyAqIEJpbmFyaWVz
IHRoYXQgYXNzdW1lIFRTTyBjYW5ub3QgYmUgY29ycmVjdGx5IHJ1biBvbiBub24tVFNPIHN5c3Rl
bXMsIHNvDQo+Pj4gKyAqIHByZXZlbnQgdGhlbSBmcm9tIGV2ZW4gYmVpbmcgbG9hZGVkLg0KPj4+
ICsgKi8NCj4+PiArI2RlZmluZSBFRl9SSVNDVl9UU0/CoMKgIDB4MDAxMA0KPj4NCj4+IE15IG9u
bHkgY29tbWVudCwgYW5kIEkgYXNrZWQgdGhpcyBvbiB0aGUgb3RoZXIgcGF0Y2ggdG9vLCBpcyB3
aHkgaXMgdGhpcw0KPj4gbm90IHMvRUYvRUxGIGxpa2UgdGhlIG90aGVyIGRlZmluZXMgaW4gdGhl
IGZpbGU/DQo+IA0KPiBJdCdzIEVGX1JJU0NWX1RTTyBpbiB0aGUgRUxGIHNwZWMsIGFuZCB0aGF0
J3Mgd2hhdCBvdGhlciBwb3J0cyBkbyAoc2VlDQo+IEVGX0FSTSwgZm9yIGV4YW1wbGUpLg0KDQpS
aWdodC4gSSBkaWQgdHJ5IGxvb2tpbmcgaW4gYXJtLCBidXQgSSBtdXN0J3ZlIG1pc3NlZCBpdC4g
VGhlc2Ugc3BlYw0KcGVvcGxlIHJlYWxseSBoYXZlIGl0IG91dCBmb3IgbXkgT0NELi4uDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
