Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0A1C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1cqLS/smCE94Qua54xAksmfRkrzW2GFWODVuCbnO/I=; b=329DI6WDI3yMEZ
	7yUxfRidePQwiYW7HqaOeK5TkevKS08qmYlE2m8sa1Lu3zyTXe82c6kuSJu0Wa4ceNCxhn3OMJrGH
	JukHjG41eV0tRe94P0OvdTlm2p9uYqvSLQgLu93EOvgYmPdO2OzzAiKgnMS/+Rc8ZoJj9MCOU+UFh
	PTfrl5KpvTLodiPiCWfeAzl1xAy+TMvo8M2Hcx0Mxxn3faCqfDNX/w9BDCe3sU5PgNDJkaFyky5st
	xKTFJKcd3TMFH+NSw1+xdJw5CP1GupETtUCpg2eq5unkJTYe3NiK9gxqGIbPg6Kv03HC22rztIC6Z
	54Xcdan6HGlDj8/5kfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMLq-006nEa-AP; Thu, 08 Sep 2022 18:34:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMLm-006nBc-R4
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662662047; x=1694198047;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=WpNBB0mNH759eu18Cp65fXQey7sw+vHUobWLStXXQ5g=;
  b=s94quO+xo1QuNPBEe6uFNTIW7uQYjGa1HTGhVYP6owTbY8InfjzkXZM0
   +0sRCqBLqR7rHarA6Ud7DViwW0NwkMzyqczs3S1K3vstV8k8bZ3t33BPN
   YYZQ4LmXnZXqZn+So2gWw7pyP8VBZni0NHpA3RxNBgIjh6rv+qRR6Ah7O
   ynW/Sjw0xZD9B0xmfEEDg0+Xp8YZ/WTuEhwDIKMD48ouu9G5Vb1i1OHE5
   HQ33CQNmqNmYMbpKgGyndQBpxd9S8FBI381BY3/jgC3OmcPBZd8oylPxm
   weQyfYn56WUeRcS5CYU6lIsdPnWS+pgRS8D+1CskrA1iNQYOAAh7S+ZI7
   g==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="173014858"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 11:34:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 11:33:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 11:33:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEta2lqTgYxfp6Jq+0Roob5hniMncgP5pZFeWY1JexVlHMAanoup7f3RxytOOTY27JcVpmvucsg3fLRAs63i/pmoto3fvb4G+lLTXRnBJ5BZw+DSESVXXlibh+z8BRaT3nWGzOch88wOLMS6tu6h6/uRceqbjFqbb1zcO2OXiVOaIG2M8pdEgnKmIXVHMsGfsnOMk5g8yPVY/9bi0npbG+eT48yESqarfDULUi1SPqzCtM6P9mWZ+I8Cy4Atqq7+0jLGJgvyB+j4S8JUz+9p7mO1nP6ONCwEFHhZjhfBtBezZDGdU1/St7+77QcuV3niko2ZaXdAwccyMY8pj29H6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpNBB0mNH759eu18Cp65fXQey7sw+vHUobWLStXXQ5g=;
 b=cr7TIwqBabCb6QvJJOKylWGs/Z7SGwo6AChJ2gPBgpVo4lqnC9DT3vCkrLqNJxlE+FuQ05JUgZuonxgXRlpUSTR4XsdBpmCkoQt4SfyOMsCDXMH2Ydkucc52fD9Mijxs1/Zn4XiUvwgjfGIx4c/ED1iEfIZ+UvJOXSagKDVZk7iYO3IFFefTxyAdIKQ3NzxZ/j+KCVZ/uvnGa0rWMCUfZD3lObE4z1ZpYovaWJ9LfHuN5e7QlH1UKVhp39LAdmuMZ/hwi2fYhWPMQf2HAoG/Yi6P6JkyyWXjLi0Aso7KAsTWrLfssDV1oFTaKVr3+8+JtZUF+L8XX3cKt66LMsN6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpNBB0mNH759eu18Cp65fXQey7sw+vHUobWLStXXQ5g=;
 b=pWmTRFrE8fUsU1hFPBLEUUwonQMF4MLbY+xcKp6ouUhnjTA1wqfBzVqQhe+YVERyh9Fs6k7IXA+aFttvjKljrritShfAWiK0jj+rwtTr+FNjez3M34Ew+EHvfISGpjIWQn58Iigbo+OjC6WEH+TegJN2RDorOblufWfxNM0g+Kg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 18:33:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 18:33:52 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] soc: sifive: ccache: rename SiFive L2 cache to
 Composable cache.
Thread-Topic: [PATCH v3 2/6] soc: sifive: ccache: rename SiFive L2 cache to
 Composable cache.
Thread-Index: AQHYw5GLSuwf3vpMk0+woCQmPL6nIa3V2/MA
Date: Thu, 8 Sep 2022 18:33:52 +0000
Message-ID: <ca7d8e75-1823-05d9-6196-1d0ae14e2ec9@microchip.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
 <20220908144424.4232-3-zong.li@sifive.com>
In-Reply-To: <20220908144424.4232-3-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CO1PR11MB4915:EE_
x-ms-office365-filtering-correlation-id: 1a94ce92-e506-4837-5b11-08da91c8ae19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q5Ausmg0q18xSoneWff6JN9LY2ffofVOeVm2p87E9FNKC6Ss7VyaRpfmblXM1XCHVtRg9BZIjJJxeOjsfgXJz8vPAd1EJ3AktWnowDSt3ttzAwwgHBuhql1WkBun8Uy8RvK0dt4p5uFmeceBmE5spaK6d60o6Vw0SmYFjbMvQXSv+VwyVeaZTHuxsxCZ27qpn6HsvL15cTldpppl5f4OCrQBa2GM0XiOkO6aoduZSDBs041/mAB02ImqgcHcM8DoL+LuOgefUwSplhoau22ytemWrCmZ0EZ8z6+MrNnvUh/f4tWc04yd0Dsmd1OiojFGu5Zq5R0wBGjRtVDW8gm6uQbCuOTK9Ymzq3GWeOU+yiW+7RiVL7G8guske5ANbR6fTG4Y6sSXEIYOQ58Bo/CkFW6ZOQsV8IZ61GNE56FJto2fcSLghoqzoh+fflkzC7OktLcxDgFvk+7GaurAY58H6jmPAMHPx1D+fBG9XjsvCpEk6nAWUGrPv+Sd1IPV7fHZnEDBZO2D4KXba1R2SrIUZjAIZ07tWmkMBzCP3eUwu7pOMgD1fYt3B0pRG6WhVPHCFVZLsuCPUzWW1LlZOTRj8g9GYf6YKCQFxfmaiZHyt7JJEOXO6jKB54iAAd83SXYD/83PYwfz4DcldAKQy32xSLZnTuD+K9xxMHAEOhbvbb2/+IFPDTTrSrwmSs7Q84EY15i+XuYMmZLkifa4yCsT0RPusyq5S/n6SEpoB0cO5TGCx70DRZJSBGmiW1URFmOrfuXoIaO5C757lUdn+EZa8Q0JUjg66UH7kBpFCSHN0mOH4xoT+hbSRyEnutyiU3nknal2SR0TtBiQR9uhAyw3wo6ginbTuh1dfvVHTy8taGw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(396003)(376002)(346002)(136003)(39860400002)(366004)(91956017)(36756003)(8936002)(76116006)(7416002)(66446008)(64756008)(8676002)(31686004)(2906002)(110136005)(66476007)(316002)(30864003)(66946007)(66556008)(5660300002)(71200400001)(41300700001)(53546011)(478600001)(83380400001)(2616005)(186003)(6512007)(921005)(26005)(122000001)(31696002)(86362001)(6486002)(38100700002)(6506007)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUJ3cnFiYTVXSklralVJV1V3cG92MllzT1lnbE4rNkw0d0VLbTM5VG9xWk55?=
 =?utf-8?B?UjR2OXR4TVRiZnVkN3Z1aEZVVkRkVmt2UFdZb2VMc2x4eTlSSDMvLzNKNTda?=
 =?utf-8?B?eGVQenhkVkR6anVBWVFrNjltQ3lXWEdzNVNWYUJuTW94cFVBYWs3VXJoYTFa?=
 =?utf-8?B?OGl4dC9uVCtwNDZOcGJSTmlhcHZ5LzhoM0ptNE1lWlZJRmQxdk9CNzI2VVZs?=
 =?utf-8?B?K3hJNTZPSURoRDlPY1RETjdvVUdsRnF5Zk9lQ2I2M29nR3VKS0Eya3Ftdm9I?=
 =?utf-8?B?VmVBWU91STg5S0ZlZG5uS2o2RHBET2RrclZuS09BeXNMbm9UQkh0SEZrVW5D?=
 =?utf-8?B?SVpNZVg5Z2dYMmtYLzArZ2hpTDh0OC94WkN5eU9SNk1JcXpIT3k1eTlJajI5?=
 =?utf-8?B?cGUvVGREcTJsNXh2WUVtR29NU0hRUDJpRFRMSkhoUmxxUEtjajdweVI4L2Yy?=
 =?utf-8?B?WU9FWkhmWEdmbzVDOHNMV1BhUmFWZDdBVHMzdWRRNWVPL2NYb3NRSXNOSHhX?=
 =?utf-8?B?ZWZ2bXNwMU9rSTZLU1ZZNUgvQWFwaWtrSUtKTVAzNXFZTEdyQk5NRHpwc2Fr?=
 =?utf-8?B?UWRXdjRKTGxNeEJJSjFPcG1JeW9MZnpjRTBTUk1ONE15ZE5vY0lOSXZUejM1?=
 =?utf-8?B?d1FoM1loZFVIaXNOL3dZOHh3UUYrdUNUMmlvMUM5aU51elJiL1l6dzF4OUFR?=
 =?utf-8?B?cnJqZk13WDdZMnhtSkJ6b0hreko1MGorLzBkUG9saXZiYlpsT1ZtckVvS2E1?=
 =?utf-8?B?bS9iRjBaRksvZWRaNXVmVE5zc1o0UnZ6VWFrS2M4Y3BuM1BEWEZSUmZQdmlW?=
 =?utf-8?B?U1hUMnZoOEpSeFlsaUJCTDUxazlnMmVVbXhlYjNGaVF5Um9NYzF2SlYxc2V5?=
 =?utf-8?B?ellvOHVoSm51ejB1ZWJzblk5WDVST0UxRmZsRDdvckpDcHFIQ1NCT0ZZNkNt?=
 =?utf-8?B?V09GeWo5SWNjUXNYM2tlWEJ3R0hsN3d2bWVveE9EbTMzS09tVWJEcVZiZ1B5?=
 =?utf-8?B?VVp6ZXBtRzU2eXpUMU1qc21MQnI4cVJqbi9mWkpKUXlLcHVwRUNBOHdweTRv?=
 =?utf-8?B?bzVnQVFmNVpkM2hkNVdDM2h1c2JNUGFKcThVNTMvN2hoclpCemloeEx4YVRU?=
 =?utf-8?B?bHdrRVZQL1NPV2NxWCtyUWFHOS9icDQzVWtpR2Q0RmFiSHY3YlZPQTJXMHNK?=
 =?utf-8?B?Rkw5WkkxbWRtK3M0eEs4dDNsYnVzZXUwWG1YMkJKSDRaM1N3SkZSZFhWTk4z?=
 =?utf-8?B?ZVArYk96TkJCRnFMZUhkZ3l3djVNUXRaV3lwbzdPUkJCSU5SZFZQTHZlelp6?=
 =?utf-8?B?MktFR2dRYi9wS3dINWFIV2xsSFdsZDE2MytscTc0ZVZzRCtWcWwwYVV5RlFl?=
 =?utf-8?B?ZEV0MDNLWEpGWHZMWXNLWlNjYVpzMVZPV1ozdFRQQVU1OTB4L2Ntd09XZVVz?=
 =?utf-8?B?SC9DU0N6K2R6TWVwRDk2bU9tVFlZcnorcWFqNURXS3lRZ3REcS9uZXBOWG9o?=
 =?utf-8?B?Y1BHU3JqNE1kaFo5TVRsSFByM2N1a2haSWtMZVpPQzRpZFNJeU5NRTJhdVNQ?=
 =?utf-8?B?b2xkMEFzYW9xTkdwTHROK2RIajFKc1dqMDlpalNMT1g1WStQdks2YzVnSGp0?=
 =?utf-8?B?RHBLV3dUOTcraWVnMjZJTGJwYkhlUTNrWWo1dzFTd0lFVFZETHlEZHZHajBO?=
 =?utf-8?B?dExML2FpWWhFN243YndoMDBrT2p5Y2lFNmdRbmMrd2lucEdYa2FScSs0REgx?=
 =?utf-8?B?cVFDdHZ3WEdqMDdlL2VqenZSVVlGR0FJRHNDdThYTEVQeFMrMm9zckZRTXJH?=
 =?utf-8?B?eTBkOWtrY050aEtyMXZPRGRJRUZFZEM4eng3UWVxV29uUTZBTEJHeGkrNk05?=
 =?utf-8?B?VEpuWm9DcTNBQWdCejIyTFYyYnlOdy9NQ2UyNUJKU2o0TTJka3NXTXZpUzM5?=
 =?utf-8?B?OURkUE9RcjZyOC9MSjllNmthamdqcjVrR0VvNlFLQXdVRkh6d1VkS0VnbDlC?=
 =?utf-8?B?c0JPT3J6NHRxejR4azAxdHpDZDlJckVkZVc0STRPbVl5NFR0cWJJekxaVHE5?=
 =?utf-8?B?SG5UUC9nM2VWMkVwR0FXQzlPZDZqMWNwMWdwUjRvZzJYOFVqcTJiWCtOZE1a?=
 =?utf-8?B?Q0krM0hKVWt1dW12RTltRElzRVEyZGt4Y3VvM25VK0JpWEZOMTVsK01IZjcy?=
 =?utf-8?B?QVE9PQ==?=
Content-ID: <62412CFB906D78469A02724923065680@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a94ce92-e506-4837-5b11-08da91c8ae19
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 18:33:52.6574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZBAJjViFPNPIkymdm6+1cCm1Fm+C9C792pedz9BEWvLgMRV/8+2nzFffNQDuvn/5DIuM2jpA5g8FjZseRqPnFMLy5o4Zvo4jC38ztBxo+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_113407_006294_0D36EAAE 
X-CRM114-Status: GOOD (  22.38  )
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

On 08/09/2022 15:44, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Since composable cache may be L3 cache if there is a L2 cache, we should
> use its original name composable cache to prevent confusion.
> 
> Apart from renaming, we also add the compatible "sifive,ccache0" into ID
> table.
> 
> The sifive L2 has been renamed to sifive CCACHE, EDAC driver needs to
> apply the change as well.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>

SoB chain here is odd still, if Greentime co-authored they need to have
a Co-developed-by tag.

Otherwise:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  drivers/edac/Kconfig                          |   2 +-
>  drivers/edac/sifive_edac.c                    |  12 +-
>  drivers/soc/sifive/Kconfig                    |   6 +-
>  drivers/soc/sifive/Makefile                   |   2 +-
>  .../{sifive_l2_cache.c => sifive_ccache.c}    | 174 +++++++++---------
>  .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
>  6 files changed, 110 insertions(+), 102 deletions(-)
>  rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (34%)
>  rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 17562cf1fe97..456602d373b7 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -473,7 +473,7 @@ config EDAC_ALTERA_SDMMC
> 
>  config EDAC_SIFIVE
>         bool "Sifive platform EDAC driver"
> -       depends on EDAC=y && SIFIVE_L2
> +       depends on EDAC=y && SIFIVE_CCACHE
>         help
>           Support for error detection and correction on the SiFive SoCs.
> 
> diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
> index ee800aec7d47..b844e2626fd5 100644
> --- a/drivers/edac/sifive_edac.c
> +++ b/drivers/edac/sifive_edac.c
> @@ -2,7 +2,7 @@
>  /*
>   * SiFive Platform EDAC Driver
>   *
> - * Copyright (C) 2018-2019 SiFive, Inc.
> + * Copyright (C) 2018-2022 SiFive, Inc.
>   *
>   * This driver is partially based on octeon_edac-pc.c
>   *
> @@ -10,7 +10,7 @@
>  #include <linux/edac.h>
>  #include <linux/platform_device.h>
>  #include "edac_module.h"
> -#include <soc/sifive/sifive_l2_cache.h>
> +#include <soc/sifive/sifive_ccache.h>
> 
>  #define DRVNAME "sifive_edac"
> 
> @@ -32,9 +32,9 @@ int ecc_err_event(struct notifier_block *this, unsigned long event, void *ptr)
> 
>         p = container_of(this, struct sifive_edac_priv, notifier);
> 
> -       if (event == SIFIVE_L2_ERR_TYPE_UE)
> +       if (event == SIFIVE_CCACHE_ERR_TYPE_UE)
>                 edac_device_handle_ue(p->dci, 0, 0, msg);
> -       else if (event == SIFIVE_L2_ERR_TYPE_CE)
> +       else if (event == SIFIVE_CCACHE_ERR_TYPE_CE)
>                 edac_device_handle_ce(p->dci, 0, 0, msg);
> 
>         return NOTIFY_OK;
> @@ -67,7 +67,7 @@ static int ecc_register(struct platform_device *pdev)
>                 goto err;
>         }
> 
> -       register_sifive_l2_error_notifier(&p->notifier);
> +       register_sifive_ccache_error_notifier(&p->notifier);
> 
>         return 0;
> 
> @@ -81,7 +81,7 @@ static int ecc_unregister(struct platform_device *pdev)
>  {
>         struct sifive_edac_priv *p = platform_get_drvdata(pdev);
> 
> -       unregister_sifive_l2_error_notifier(&p->notifier);
> +       unregister_sifive_ccache_error_notifier(&p->notifier);
>         edac_device_del_device(&pdev->dev);
>         edac_device_free_ctl_info(p->dci);
> 
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index 58cf8c40d08d..ed4c571f8771 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -2,9 +2,9 @@
> 
>  if SOC_SIFIVE
> 
> -config SIFIVE_L2
> -       bool "Sifive L2 Cache controller"
> +config SIFIVE_CCACHE
> +       bool "Sifive Composable Cache controller"
>         help
> -         Support for the L2 cache controller on SiFive platforms.
> +         Support for the composable cache controller on SiFive platforms.
> 
>  endif
> diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
> index b5caff77938f..1f5dc339bf82 100644
> --- a/drivers/soc/sifive/Makefile
> +++ b/drivers/soc/sifive/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> 
> -obj-$(CONFIG_SIFIVE_L2)        += sifive_l2_cache.o
> +obj-$(CONFIG_SIFIVE_CCACHE)    += sifive_ccache.o
> diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_ccache.c
> similarity index 34%
> rename from drivers/soc/sifive/sifive_l2_cache.c
> rename to drivers/soc/sifive/sifive_ccache.c
> index 59640a1d0b28..949b824e89ad 100644
> --- a/drivers/soc/sifive/sifive_l2_cache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -1,8 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * SiFive L2 cache controller Driver
> + * SiFive composable cache controller Driver
>   *
> - * Copyright (C) 2018-2019 SiFive, Inc.
> + * Copyright (C) 2018-2022 SiFive, Inc.
>   *
>   */
>  #include <linux/debugfs.h>
> @@ -11,33 +11,33 @@
>  #include <linux/of_address.h>
>  #include <linux/device.h>
>  #include <asm/cacheinfo.h>
> -#include <soc/sifive/sifive_l2_cache.h>
> +#include <soc/sifive/sifive_ccache.h>
> 
> -#define SIFIVE_L2_DIRECCFIX_LOW 0x100
> -#define SIFIVE_L2_DIRECCFIX_HIGH 0x104
> -#define SIFIVE_L2_DIRECCFIX_COUNT 0x108
> +#define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
> +#define SIFIVE_CCACHE_DIRECCFIX_HIGH 0x104
> +#define SIFIVE_CCACHE_DIRECCFIX_COUNT 0x108
> 
> -#define SIFIVE_L2_DIRECCFAIL_LOW 0x120
> -#define SIFIVE_L2_DIRECCFAIL_HIGH 0x124
> -#define SIFIVE_L2_DIRECCFAIL_COUNT 0x128
> +#define SIFIVE_CCACHE_DIRECCFAIL_LOW 0x120
> +#define SIFIVE_CCACHE_DIRECCFAIL_HIGH 0x124
> +#define SIFIVE_CCACHE_DIRECCFAIL_COUNT 0x128
> 
> -#define SIFIVE_L2_DATECCFIX_LOW 0x140
> -#define SIFIVE_L2_DATECCFIX_HIGH 0x144
> -#define SIFIVE_L2_DATECCFIX_COUNT 0x148
> +#define SIFIVE_CCACHE_DATECCFIX_LOW 0x140
> +#define SIFIVE_CCACHE_DATECCFIX_HIGH 0x144
> +#define SIFIVE_CCACHE_DATECCFIX_COUNT 0x148
> 
> -#define SIFIVE_L2_DATECCFAIL_LOW 0x160
> -#define SIFIVE_L2_DATECCFAIL_HIGH 0x164
> -#define SIFIVE_L2_DATECCFAIL_COUNT 0x168
> +#define SIFIVE_CCACHE_DATECCFAIL_LOW 0x160
> +#define SIFIVE_CCACHE_DATECCFAIL_HIGH 0x164
> +#define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
> 
> -#define SIFIVE_L2_CONFIG 0x00
> -#define SIFIVE_L2_WAYENABLE 0x08
> -#define SIFIVE_L2_ECCINJECTERR 0x40
> +#define SIFIVE_CCACHE_CONFIG 0x00
> +#define SIFIVE_CCACHE_WAYENABLE 0x08
> +#define SIFIVE_CCACHE_ECCINJECTERR 0x40
> 
> -#define SIFIVE_L2_MAX_ECCINTR 4
> +#define SIFIVE_CCACHE_MAX_ECCINTR 4
> 
> -static void __iomem *l2_base;
> -static int g_irq[SIFIVE_L2_MAX_ECCINTR];
> -static struct riscv_cacheinfo_ops l2_cache_ops;
> +static void __iomem *ccache_base;
> +static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
> +static struct riscv_cacheinfo_ops ccache_cache_ops;
> 
>  enum {
>         DIR_CORR = 0,
> @@ -49,83 +49,84 @@ enum {
>  #ifdef CONFIG_DEBUG_FS
>  static struct dentry *sifive_test;
> 
> -static ssize_t l2_write(struct file *file, const char __user *data,
> -                       size_t count, loff_t *ppos)
> +static ssize_t ccache_write(struct file *file, const char __user *data,
> +                           size_t count, loff_t *ppos)
>  {
>         unsigned int val;
> 
>         if (kstrtouint_from_user(data, count, 0, &val))
>                 return -EINVAL;
>         if ((val < 0xFF) || (val >= 0x10000 && val < 0x100FF))
> -               writel(val, l2_base + SIFIVE_L2_ECCINJECTERR);
> +               writel(val, ccache_base + SIFIVE_CCACHE_ECCINJECTERR);
>         else
>                 return -EINVAL;
>         return count;
>  }
> 
> -static const struct file_operations l2_fops = {
> +static const struct file_operations ccache_fops = {
>         .owner = THIS_MODULE,
>         .open = simple_open,
> -       .write = l2_write
> +       .write = ccache_write
>  };
> 
>  static void setup_sifive_debug(void)
>  {
> -       sifive_test = debugfs_create_dir("sifive_l2_cache", NULL);
> +       sifive_test = debugfs_create_dir("sifive_ccache_cache", NULL);
> 
>         debugfs_create_file("sifive_debug_inject_error", 0200,
> -                           sifive_test, NULL, &l2_fops);
> +                           sifive_test, NULL, &ccache_fops);
>  }
>  #endif
> 
> -static void l2_config_read(void)
> +static void ccache_config_read(void)
>  {
>         u32 regval, val;
> 
> -       regval = readl(l2_base + SIFIVE_L2_CONFIG);
> +       regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
>         val = regval & 0xFF;
> -       pr_info("L2CACHE: No. of Banks in the cache: %d\n", val);
> +       pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
>         val = (regval & 0xFF00) >> 8;
> -       pr_info("L2CACHE: No. of ways per bank: %d\n", val);
> +       pr_info("CCACHE: No. of ways per bank: %d\n", val);
>         val = (regval & 0xFF0000) >> 16;
> -       pr_info("L2CACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
> +       pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
>         val = (regval & 0xFF000000) >> 24;
> -       pr_info("L2CACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
> +       pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
> 
> -       regval = readl(l2_base + SIFIVE_L2_WAYENABLE);
> -       pr_info("L2CACHE: Index of the largest way enabled: %d\n", regval);
> +       regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> +       pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
>  }
> 
> -static const struct of_device_id sifive_l2_ids[] = {
> +static const struct of_device_id sifive_ccache_ids[] = {
>         { .compatible = "sifive,fu540-c000-ccache" },
>         { .compatible = "sifive,fu740-c000-ccache" },
> -       { /* end of table */ },
> +       { .compatible = "sifive,ccache0" },
> +       { /* end of table */ }
>  };
> 
> -static ATOMIC_NOTIFIER_HEAD(l2_err_chain);
> +static ATOMIC_NOTIFIER_HEAD(ccache_err_chain);
> 
> -int register_sifive_l2_error_notifier(struct notifier_block *nb)
> +int register_sifive_ccache_error_notifier(struct notifier_block *nb)
>  {
> -       return atomic_notifier_chain_register(&l2_err_chain, nb);
> +       return atomic_notifier_chain_register(&ccache_err_chain, nb);
>  }
> -EXPORT_SYMBOL_GPL(register_sifive_l2_error_notifier);
> +EXPORT_SYMBOL_GPL(register_sifive_ccache_error_notifier);
> 
> -int unregister_sifive_l2_error_notifier(struct notifier_block *nb)
> +int unregister_sifive_ccache_error_notifier(struct notifier_block *nb)
>  {
> -       return atomic_notifier_chain_unregister(&l2_err_chain, nb);
> +       return atomic_notifier_chain_unregister(&ccache_err_chain, nb);
>  }
> -EXPORT_SYMBOL_GPL(unregister_sifive_l2_error_notifier);
> +EXPORT_SYMBOL_GPL(unregister_sifive_ccache_error_notifier);
> 
> -static int l2_largest_wayenabled(void)
> +static int ccache_largest_wayenabled(void)
>  {
> -       return readl(l2_base + SIFIVE_L2_WAYENABLE) & 0xFF;
> +       return readl(ccache_base + SIFIVE_CCACHE_WAYENABLE) & 0xFF;
>  }
> 
>  static ssize_t number_of_ways_enabled_show(struct device *dev,
>                                            struct device_attribute *attr,
>                                            char *buf)
>  {
> -       return sprintf(buf, "%u\n", l2_largest_wayenabled());
> +       return sprintf(buf, "%u\n", ccache_largest_wayenabled());
>  }
> 
>  static DEVICE_ATTR_RO(number_of_ways_enabled);
> @@ -139,99 +140,106 @@ static const struct attribute_group priv_attr_group = {
>         .attrs = priv_attrs,
>  };
> 
> -static const struct attribute_group *l2_get_priv_group(struct cacheinfo *this_leaf)
> +static const struct attribute_group *ccache_get_priv_group(struct cacheinfo
> +                                                          *this_leaf)
>  {
> -       /* We want to use private group for L2 cache only */
> +       /* We want to use private group for composable cache only */
>         if (this_leaf->level == 2)
>                 return &priv_attr_group;
>         else
>                 return NULL;
>  }
> 
> -static irqreturn_t l2_int_handler(int irq, void *device)
> +static irqreturn_t ccache_int_handler(int irq, void *device)
>  {
>         unsigned int add_h, add_l;
> 
>         if (irq == g_irq[DIR_CORR]) {
> -               add_h = readl(l2_base + SIFIVE_L2_DIRECCFIX_HIGH);
> -               add_l = readl(l2_base + SIFIVE_L2_DIRECCFIX_LOW);
> -               pr_err("L2CACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
> +               add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
> +               add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
> +               pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DirError interrupt sig */
> -               readl(l2_base + SIFIVE_L2_DIRECCFIX_COUNT);
> -               atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
> +               readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
> +               atomic_notifier_call_chain(&ccache_err_chain,
> +                                          SIFIVE_CCACHE_ERR_TYPE_CE,
>                                            "DirECCFix");
>         }
>         if (irq == g_irq[DIR_UNCORR]) {
> -               add_h = readl(l2_base + SIFIVE_L2_DIRECCFAIL_HIGH);
> -               add_l = readl(l2_base + SIFIVE_L2_DIRECCFAIL_LOW);
> +               add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFAIL_HIGH);
> +               add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFAIL_LOW);
>                 /* Reading this register clears the DirFail interrupt sig */
> -               readl(l2_base + SIFIVE_L2_DIRECCFAIL_COUNT);
> -               atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_UE,
> +               readl(ccache_base + SIFIVE_CCACHE_DIRECCFAIL_COUNT);
> +               atomic_notifier_call_chain(&ccache_err_chain,
> +                                          SIFIVE_CCACHE_ERR_TYPE_UE,
>                                            "DirECCFail");
> -               panic("L2CACHE: DirFail @ 0x%08X.%08X\n", add_h, add_l);
> +               panic("CCACHE: DirFail @ 0x%08X.%08X\n", add_h, add_l);
>         }
>         if (irq == g_irq[DATA_CORR]) {
> -               add_h = readl(l2_base + SIFIVE_L2_DATECCFIX_HIGH);
> -               add_l = readl(l2_base + SIFIVE_L2_DATECCFIX_LOW);
> -               pr_err("L2CACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
> +               add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
> +               add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
> +               pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataError interrupt sig */
> -               readl(l2_base + SIFIVE_L2_DATECCFIX_COUNT);
> -               atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
> +               readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
> +               atomic_notifier_call_chain(&ccache_err_chain,
> +                                          SIFIVE_CCACHE_ERR_TYPE_CE,
>                                            "DatECCFix");
>         }
>         if (irq == g_irq[DATA_UNCORR]) {
> -               add_h = readl(l2_base + SIFIVE_L2_DATECCFAIL_HIGH);
> -               add_l = readl(l2_base + SIFIVE_L2_DATECCFAIL_LOW);
> -               pr_err("L2CACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
> +               add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
> +               add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
> +               pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataFail interrupt sig */
> -               readl(l2_base + SIFIVE_L2_DATECCFAIL_COUNT);
> -               atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_UE,
> +               readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
> +               atomic_notifier_call_chain(&ccache_err_chain,
> +                                          SIFIVE_CCACHE_ERR_TYPE_UE,
>                                            "DatECCFail");
>         }
> 
>         return IRQ_HANDLED;
>  }
> 
> -static int __init sifive_l2_init(void)
> +static int __init sifive_ccache_init(void)
>  {
>         struct device_node *np;
>         struct resource res;
>         int i, rc, intr_num;
> 
> -       np = of_find_matching_node(NULL, sifive_l2_ids);
> +       np = of_find_matching_node(NULL, sifive_ccache_ids);
>         if (!np)
>                 return -ENODEV;
> 
>         if (of_address_to_resource(np, 0, &res))
>                 return -ENODEV;
> 
> -       l2_base = ioremap(res.start, resource_size(&res));
> -       if (!l2_base)
> +       ccache_base = ioremap(res.start, resource_size(&res));
> +       if (!ccache_base)
>                 return -ENOMEM;
> 
>         intr_num = of_property_count_u32_elems(np, "interrupts");
>         if (!intr_num) {
> -               pr_err("L2CACHE: no interrupts property\n");
> +               pr_err("CCACHE: no interrupts property\n");
>                 return -ENODEV;
>         }
> 
>         for (i = 0; i < intr_num; i++) {
>                 g_irq[i] = irq_of_parse_and_map(np, i);
> -               rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
> +               rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
> +                                NULL);
>                 if (rc) {
> -                       pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
> +                       pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
>                         return rc;
>                 }
>         }
> 
> -       l2_config_read();
> +       ccache_config_read();
> 
> -       l2_cache_ops.get_priv_group = l2_get_priv_group;
> -       riscv_set_cacheinfo_ops(&l2_cache_ops);
> +       ccache_cache_ops.get_priv_group = ccache_get_priv_group;
> +       riscv_set_cacheinfo_ops(&ccache_cache_ops);
> 
>  #ifdef CONFIG_DEBUG_FS
>         setup_sifive_debug();
>  #endif
>         return 0;
>  }
> -device_initcall(sifive_l2_init);
> +
> +device_initcall(sifive_ccache_init);
> diff --git a/include/soc/sifive/sifive_l2_cache.h b/include/soc/sifive/sifive_ccache.h
> similarity index 12%
> rename from include/soc/sifive/sifive_l2_cache.h
> rename to include/soc/sifive/sifive_ccache.h
> index 92ade10ed67e..4d4ed49388a0 100644
> --- a/include/soc/sifive/sifive_l2_cache.h
> +++ b/include/soc/sifive/sifive_ccache.h
> @@ -1,16 +1,16 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * SiFive L2 Cache Controller header file
> + * SiFive Composable Cache Controller header file
>   *
>   */
> 
> -#ifndef __SOC_SIFIVE_L2_CACHE_H
> -#define __SOC_SIFIVE_L2_CACHE_H
> +#ifndef __SOC_SIFIVE_CCACHE_H
> +#define __SOC_SIFIVE_CCACHE_H
> 
> -extern int register_sifive_l2_error_notifier(struct notifier_block *nb);
> -extern int unregister_sifive_l2_error_notifier(struct notifier_block *nb);
> +extern int register_sifive_ccache_error_notifier(struct notifier_block *nb);
> +extern int unregister_sifive_ccache_error_notifier(struct notifier_block *nb);
> 
> -#define SIFIVE_L2_ERR_TYPE_CE 0
> -#define SIFIVE_L2_ERR_TYPE_UE 1
> +#define SIFIVE_CCACHE_ERR_TYPE_CE 0
> +#define SIFIVE_CCACHE_ERR_TYPE_UE 1
> 
> -#endif /* __SOC_SIFIVE_L2_CACHE_H */
> +#endif /* __SOC_SIFIVE_CCACHE_H */
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
