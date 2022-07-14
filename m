Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC026C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2OPKEnUR57/s1sna73WNDKc6PCrKq3wpYwUr35wEJM=; b=gUfDZrC37svHZW
	PXp1lrN1g5oR1+4PEkDIFNU5ERiV6hLrpzqzUFQ+MXOyVnHaWyzjiFVErHcK717NzduwOlHnL6do6
	r4YtxY7UIcis0SEWYiVDdkNekB4K/x66M1Hak99Fl2nayjEp3I7WUnihzyFXJC2gfhRxfIC3eUI2o
	GH3MLljqDh6PY5cyWBmcmjeCGXHrcsxDS6i19aN0svnde/xVR3sq9yVDIHvhDhzdzgCnlfVhvEQ73
	pMiYryytFQYQDCuKJE1JWvPcYY2yNI1AfoPqd2Fs1bCt7vNI6WchDjVGvC4Msi0ZSomOZC+ENTN6p
	QTG52yqicB7U8kKlzqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzfD-00F7Sq-My; Thu, 14 Jul 2022 14:17:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzez-00F7GL-2F; Thu, 14 Jul 2022 14:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657808264; x=1689344264;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=q91PePa7u5Ov1oPdd1gp0xpdb7VrUejHUIMW/yAE37w=;
  b=PdpP8yrZvPjjd6sc0TN0RLWUMM6jqu0dTgHuWoZBQbIDFpYxF/SkVjtt
   weRbrz2D50TwwoHRl1OfPmw1ezFT9Oh4XfhzdIwTBW3VMz90agemCnB9S
   TqkobQDukWwt5eNtqIMifpTvUbQ1ij51/7Jl5rnlkjiXENuziHCI4rHMJ
   FQxDVULfLBrDcgK1ipBxAqjLgNNfVP45QesK3kCgQ/qkqvBECQHjmsoBN
   W6cJWFmAL4AdX9eBDAufJiN23Vhp3z+JBbPDrVCvSHRxIkRV3QosgILuP
   azYdKDNoICVq2SycOfclkBkU/TA7aBbkUWsYtQ1a4EJw2M/ZhMFDV33sq
   g==;
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="182180235"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 07:17:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 07:17:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 14 Jul 2022 07:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey+uYY1lYooxtz48ZAJwVa69fybOnvcT5kioMqNwmwS85eOILFCzU/qSqVi4ThFLHq7QyieQa4Bq7YtN7EEMxNDdee1rLUeuvZNYOo6Q4tRu+V+iG/VwFd6zw//2yYOnkOlTYiJf21zqPFjbhGfe/o76kOA6/Umrv/SKCYqg9bHMldmOB3gGMWyqlP8oYBhy9190/IwLHOOyXQ66tImyDm6O4GOsTZCBzKOchZFZKVXrEFj9HxgWtw1iIr1g7KBC+lFgU3FvwKbZzCy8cVm4ba0di5nh5fxHADMTJ27BrwkWRPCC8DHnDJgoU9RnQXzNUjbfJAlgxjKa2GQmtzKTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q91PePa7u5Ov1oPdd1gp0xpdb7VrUejHUIMW/yAE37w=;
 b=NJXB3aWqavB5g42DneUzwQOySLl0O8tFo2NxI9u5ICEqZF66TG9KMLheVZQ9NOdh9Dee27kpXPHz8+q3lQkuQUiWreiu17qQKl1vhuvvQdQWXPvhF/Lxl9kjizuwKnSPRsjfa1Ill6bGXDJBG59EHVnmHo57aY8bNJUhdSZdmJDRIaonFfJDaCvvrksR5+Ct+JNgIbBPxhWr0DCEWUtErvdN1LVLSBAYhn5Snp5Ztc35qc4uTbPX1F22hPBXp+2hnkz9N4PzWYyC2w5Bef/lZ+N+DwgmWrJimAVumWh7Vzy3YEuibIUe+IQSq6SI8D3m8wZfOPfO7MDnKm4o79Jlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q91PePa7u5Ov1oPdd1gp0xpdb7VrUejHUIMW/yAE37w=;
 b=svlrlcDij0KyKjFypluDer6loqrBZxkd2ATuErXmdKDXAQs4t4E8+Ast9LOcKML0BU45ndE0Dr4Lu3T4ZjGr5aMGRJ2s4wO2YIzXkhW5yEz3t8DKKN3bcsFqNk+HKQwTsiJjqHDpGJWn/GVtLG7B3bNTjNqeG/mpApZyyZDZNqI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 14:17:33 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 14:17:33 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>
CC: <gregkh@linuxfoundation.org>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <ionela.voinescu@arm.com>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Topic: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Index: AQHYlr1LjktvAhTwm0O5ibr9nGIi2q19638A
Date: Thu, 14 Jul 2022 14:17:33 +0000
Message-ID: <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
In-Reply-To: <20220713133344.1201247-1-sudeep.holla@arm.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a7657e9-0b29-45bb-b25e-08da65a39867
x-ms-traffictypediagnostic: SA0PR11MB4685:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUVpmOwecdkz2/LSEor733YWy+jXJATJKVIKg8Dr7e43iwkNlDX8DQM1YXzQBkYiPxpzkscz+9CjuHF820V1YnzeRShQD1V76Dc+8MSCWxxJmBX3kjCI/9GyUdGwP5Om4J7+av+X1SUymxdyQ4SGRvG6ri+tu/RWCRmzq0/LaZ3w0E5pw0NikOz5YweK3Pb51sJCtZyGfXALCEkAawIEQ0BBtYYhbKaUgcSJYWl4w54phetXIOMz+Ule9ZlvgFLCmBXWQ4Y+2QV28jZdvLDc+9HMo8pAf1W5/AN7srniSX+tJwXR1IWnlWAzx5PfhTymFS0yDVqtPhP0QdkFZy2CFiYsGQWfk/hOq/Nus4Sw2YNMOvTfgp9xerUXLxC6xBOUjHoviZIR4vi0ZCnNv4PoS+6V93xeXfrR9Vd07734w37izAhKze4NN98nvR5DjF5wxKJv4GnG+DOaANe1W0FF1e65xbMGJDuGW7MGvusVAY+r1k6wT5VVK2TCLega50bKV9a9xkdKMEMZijEU1QJ2qmrrw+7OUTnMtFbEa4iKIfaP7Cj6sKhyK4hrH/Ncn+M09fIKvEdsgzi2ZF2JgdXyeBTXesUQRJukDACbR+Psh3atsg9IwawS5s4vzhb1aAWg7iJtwbhzL2PbZHkJONomy2Fl3mWdOAeR4Z1O0R79Wz4e7t6wFo1ElklHQS/qyUAmFGP4XWXuwQXzlm+E+gbM63lNFpPlnKjvtaH5YE//uEnmLUoYR5kpKIAZdZYAetzDO0vMgHRySqtWmajd8dWxExRUk6Ar9X23EOHO6bzrc41oB2D3Esgk7eTYAFBrN0PB11UYLImdwhsV1Wrgmc38l02Xw5cUBQSu9lv20T2UuudXatVsEUI9+5qPkHurC/xA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(39860400002)(346002)(376002)(186003)(91956017)(4326008)(83380400001)(110136005)(8676002)(64756008)(66946007)(54906003)(66476007)(76116006)(66556008)(66446008)(6512007)(71200400001)(36756003)(2616005)(41300700001)(26005)(31686004)(53546011)(2906002)(6506007)(86362001)(31696002)(122000001)(38070700005)(5660300002)(316002)(6486002)(38100700002)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUVFZGhidVFnaTdNd1cwdVFoYS9mMVVVVHE5OThrenNxcGhCcWJnZHdqVFFE?=
 =?utf-8?B?NWtMaDRhdzZwQ3pXLzFyUWlZc21RUlk3TEd3ZWJXT1FmTG8rSENpTTAxeGlF?=
 =?utf-8?B?ZVZzcWgzUE43Qy83RzJRNisydVJaZ0hXbllvVlV5eTUzZmY4S1JWTXNzMTZH?=
 =?utf-8?B?d2ZGZ2U5eUorZE1rc2N1VG1VbjdaMkxpaVRYbElXa2RreS9oc3IxUFJoeDQw?=
 =?utf-8?B?ZHdpR3V2TjgrVDdIdUQzMEZBbkdEZ2gvcmRIRTRhTDZHbmFQU1ZOZlcycHdv?=
 =?utf-8?B?aFN1b1ZkaWZ2Q1lTWXRBVVVzaXB2OFJoMTRONFlGWGRFTmw5WndzUnBWYjNQ?=
 =?utf-8?B?SnU0bURyakMreTdYZDd0QkJPVk9oRURyU0pXeHZSUjVaaG50SFZvODRrM0NY?=
 =?utf-8?B?aWtmTmhsMU9PQlFoSW5PckQ4QmxySWptNmg1RU93ZlpGWWtCTk10c2Y5Mmkx?=
 =?utf-8?B?aGhYTWpPZ0h1clZVajhXYnRmMHQzWHdKYkZaaER1djJnTDdOdzYwUEJEK3NE?=
 =?utf-8?B?bXFnWTBSM0IycHl1S0UyK1NRUmdaR2QwY2plMVRVY0YyWFRaMGtUYTZ6MmtB?=
 =?utf-8?B?dGlmZjhtZVVyUFkwOGJxUlRGSmludUxPWWhWdnhaaUJIMWlkZUloTmpwVWxp?=
 =?utf-8?B?ZkEramRaUzBFS1BoQlNFQUdFaVEwbWZ3YlFUMHdzQkh2Uy9MQjd6N1ZaQjJD?=
 =?utf-8?B?aEZkVzVvaG02SFpRaGYyellLSUZxdG5BQ2t4c1VKdmt5QWkvMjhYQXFnZXE2?=
 =?utf-8?B?aUNqTFQ0aXFEK01vUWhDNm02VHQvQzNWdjZLSllJRm8zOGFmMm9ROU5RU0pm?=
 =?utf-8?B?bDhkMmtUOXZqaUNtS003M2pLOEhTcktpMDNWS2dMUTZVWTNES0w2YkJYQ001?=
 =?utf-8?B?MEVxbUJHdCs5YjRGbjVrSTdRK0wyS2pyeEt4dm1nK1BVb0Q3Y3dKNzRNRTZZ?=
 =?utf-8?B?QS8xb3VxK3BwTGUwTE5IU0dnakpRRTQyWFVaM2pIcU9yOXVBYXNFM09JSFhs?=
 =?utf-8?B?TU1QTEJnUWFmcGE2ZGdZZGtscTVKUkJwWldJTWEwR2Njd2QwUW1BMHdTZ3Mv?=
 =?utf-8?B?SHRZdklhWVljWWoycVhPU2VHenlPbksxdVBPTHdZNU1TdzloSlZ1TjNRWVBr?=
 =?utf-8?B?Y3o5L1d2c0NZVE0zVEtjS25UZzY5L212TjNMdlJsSE1JNFplUW9aZnk4R3FT?=
 =?utf-8?B?WUdXUlhVYWNCOVArWmdPZ05kMktpb25IWTEvVVlJT1VUWFdPM3BHSWRhTjZ1?=
 =?utf-8?B?RXdWbzF5VWFWVHdMM1dtZmdjdHhVQnQ0S2E1L01SWmZyRDd3Z2FueUdRV3h1?=
 =?utf-8?B?RFdTcWFaUzBWeEZqV2YxcllQN1FWZk1QY3dvZ29raG9NVWdaN3ZmRUphZzVK?=
 =?utf-8?B?KzhBVnVUVjlhQjFJd3pPZk9sZjIwOURXcTNnUHdBTElUa3QxMW9nYUpFQmgr?=
 =?utf-8?B?TW1vSk4reGxQaW5SVjEzV1RVVVpISzlmbm9VTzhLNU54SEZvWFlsRWJvdVpn?=
 =?utf-8?B?dWV0eC91QXo2cWcwdFE0MTdvaWxtblVvNGUrSy9USTJIMDdWYnZiOS9JT3JO?=
 =?utf-8?B?bGM1MTgvUjdoSHkzQy82Z2lvUUdYNXNsYXFnNmpYRXZvT1BES1ljVHo3Qk04?=
 =?utf-8?B?OVF4c2FIOHNXczlLd3dRNGFFWHpUNGkzd2FCNnBPZEVaT1FTWGMzSWZ2OUtQ?=
 =?utf-8?B?QzNLUEtwSnVzVEN2TmZyT0MraEhidHpzSXh2ZFBpeWFxRDJERm1saklxRllx?=
 =?utf-8?B?UEg2WUVWajE1eXBXNExXSzhiWmVWTnpoTldrcGgxK2ZpbHkyMlB2Q3dubjlu?=
 =?utf-8?B?eXo1QnJuajBvbFk5Tmk4QXR6Q1FJQTN6N1FOOGJjajkrSVBhMjY4eWNYbVVx?=
 =?utf-8?B?M2x6MmdEQ2xRYmlwVER0QjNMekVBTmE3RFVKS3FXdzhqb3FIRWxHSmNoNDdJ?=
 =?utf-8?B?OCtpSVJFMi91andkNmh0UWN6MGFONUtEbUVVNTZ6bFFXK3Bzamc0MDJQQTRO?=
 =?utf-8?B?TjVQWkhOUzdwcTlwUWovcGtobXBKVVc2U1l0TmJHY1lVWGRkNmRDV0U2Yy9j?=
 =?utf-8?B?S2NjbnE5QW4reUwva3ZLeWdTL0pqRG1zczJhNHVZVE9KQ29PWEZkZUd2UzdY?=
 =?utf-8?Q?1CHGbpuCvoC+OepqhP5e7Z9cp?=
Content-ID: <0817EC7AB79DA2469EC47A83C1011F24@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7657e9-0b29-45bb-b25e-08da65a39867
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 14:17:33.7041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCsgNT7NLBr2IQccgCsDs9EN4qzafhvBH/5bIHCbRMliDqaYQgMrwwBgUSSrf+sOJUlDvp5SzU7zb9xEVXivCEexUwisoNLss4ei5QQDeB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_071745_168843_E109DD2B 
X-CRM114-Status: GOOD (  25.31  )
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

On 13/07/2022 14:33, Sudeep Holla wrote:

Hey Sudeep,
I could not get this patch to actually apply, tried a couple
different versions of -next :/

It is in -next already though, which I suspect might be part of why
it does not apply.. Surely you can fast forward your arch_topology
for-next branch to gregs merge commit rather than generating this
from the premerge branch & re-merging into your branch that Stephen
picks up?

Either way, I tested it directly in -next since that's back to
booting for me today and ...

> init_cpu_topology() is called only once at the boot and all the cache
> attributes are detected early for all the possible CPUs. However when
> the CPUs are hotplugged out, the cacheinfo gets removed. While the
> attributes are added back when the CPUs are hotplugged back in as part
> of CPU hotplug state machine, it ends up called quite late after the
> update_siblings_masks() are called in the secondary_start_kernel()
> resulting in wrong llc_sibling_masks.
> 
> Move the call to detect_cache_attributes() inside update_siblings_masks()
> to ensure the cacheinfo is updated before the LLC sibling masks are
> updated. This will fix the incorrect LLC sibling masks generated when
> the CPUs are hotplugged out and hotplugged back in again.
> 
> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> Hi Conor,
> 
> Ionela reported an issue with the CPU hotplug and as a fix I need to
> move the call to detect_cache_attributes() which I had thought to keep
> it there from first but for no reason had moved it to init_cpu_topology().
> 
> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> cpu in the secondary CPUs init path while init_cpu_topology executed
> detect_cache_attributes() for all possible CPUs much earlier. I think
> this might help as the percpu memory might be initialised in this case.

Actually, we are now worse off than before:
     0.009813] smp: Bringing up secondary CPUs ...
[    0.011530] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:274
[    0.011550] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
[    0.011566] preempt_count: 1, expected: 0
[    0.011580] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.19.0-rc6-next-20220714-dirty #1
[    0.011599] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    0.011608] Call Trace:
[    0.011620] [<ffffffff80005070>] dump_backtrace+0x1c/0x24
[    0.011661] [<ffffffff8066b0c4>] show_stack+0x2c/0x38
[    0.011699] [<ffffffff806704a2>] dump_stack_lvl+0x40/0x58
[    0.011725] [<ffffffff806704ce>] dump_stack+0x14/0x1c
[    0.011745] [<ffffffff8002f42a>] __might_resched+0x100/0x10a
[    0.011772] [<ffffffff8002f472>] __might_sleep+0x3e/0x66
[    0.011793] [<ffffffff8014d774>] __kmalloc+0xd6/0x224
[    0.011825] [<ffffffff803d631c>] detect_cache_attributes+0x37a/0x448
[    0.011855] [<ffffffff803e8fbe>] update_siblings_masks+0x24/0x246
[    0.011885] [<ffffffff80005f32>] smp_callin+0x38/0x5c
[    0.015990] smp: Brought up 1 node, 4 CPUs

> 
> Anyways give this a try, also test the CPU hotplug and check if nothing
> is broken on RISC-V. We noticed this bug only on one platform while

So, our system monitor that runs openSBI does not actually support
any hotplug features yet, so:

# echo 0 > /sys/devices/system/cpu/cpu3/online
[   47.233627] CPU3: off
[   47.236018] CPU3 may not have stopped: 3
# echo 1 > /sys/devices/system/cpu/cpu3/online
[   54.911868] CPU3: failed to start

And this one confused the hell out of it...

# echo 0 > /sys/devices/system/cpu/cpu1/online
[ 2903.057706] CPU1: off
HSS_OpenSBI_Reboot() called
[ 2903.062447] CPU1 may not have stopped: 3
#
# [8.218591] HSS_Boot_PMPSetupHandler(): Hart1 setup complete

This is the hart that brought up openSBI so when the request
to offline it comes through it causes a system reboot haha

Either way, I think both imply that the hotplug code on the
Linux side is sane.

FWIW Sudeep, if you  want to add me as a reviewer for generic
arch topology stuff since I do care about testing it etc, please
feel free (although for the sake of my filters, make the email
conor@kernel.org if you do).

Thanks,
Conor.

> 
> Regards,
> Sudeep
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 441e14ac33a4..0424b59b695e 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -732,7 +732,11 @@ const struct cpumask *cpu_clustergroup_mask(int cpu)
>   void update_siblings_masks(unsigned int cpuid)
>   {
>   	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
> -	int cpu;
> +	int cpu, ret;
> +
> +	ret = detect_cache_attributes(cpuid);
> +	if (ret)
> +		pr_info("Early cacheinfo failed, ret = %d\n", ret);
>   	/* update core and thread sibling masks */
>   	for_each_online_cpu(cpu) {
> @@ -821,7 +825,7 @@ __weak int __init parse_acpi_topology(void)
>   #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>   void __init init_cpu_topology(void)
>   {
> -	int ret, cpu;
> +	int ret;
>   	reset_cpu_topology();
>   	ret = parse_acpi_topology();
> @@ -836,13 +840,5 @@ void __init init_cpu_topology(void)
>   		reset_cpu_topology();
>   		return;
>   	}
> -
> -	for_each_possible_cpu(cpu) {
> -		ret = detect_cache_attributes(cpu);
> -		if (ret) {
> -			pr_info("Early cacheinfo failed, ret = %d\n", ret);
> -			break;
> -		}
> -	}
>   }
>   #endif
> --2.37.1
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
