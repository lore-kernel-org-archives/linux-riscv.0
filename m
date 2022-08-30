Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FD2ECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeYYzwm+wG9fj4OxVS0I3FBsLH5HWwH59/2x2GL9Dq4=; b=OrF4Aha0/Fx3Mj
	ebmBJ1bbIqOj/YW2q7+djMxK5cpV+MomUKAGRE9y4xr0LtHEZesqdzgKAQYvgkmlCvGvRJ07VZYs+
	+eX1x4B3YmSciKOP7myufix/uYZEpM9ZbeI9t0OIALwDgvL3YAXGVIM2VpkVikje4FuvOl+fSxAfg
	uS9MEGWFlKNyuCm9wrmabQOiO6MGTKz4CLlu4QUNo2yBJyHeWWbggQ1rF9ok8334jv50QfqveMXO1
	IQDmfhcaNiOR8BeShrzE1QnQ0OK5Rw0m3enNIc4OEChr/40yhicdlBhzmVO44oSTrMpkwwqzyFIYL
	jPzGlARQfPvU0NlAPwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0Lu-00GpaU-Fu; Tue, 30 Aug 2022 12:28:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0Lr-00GpYC-4H
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661862499; x=1693398499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l+DOTxKIGtAvtdqKg0MYGZU9Ak/bOfzkaLeDwHnuqAA=;
  b=cT2dnZ8wPDwpIcJjp2CUH+K/1RTvHXqRNCqJqwxgo91T+m46aL+H1kxG
   BGOrXrZbtScD0r85ZP/dLEjMHG3nDQB0hfgKkUMGleg919APjSnrqsODO
   dj1ANHgi93XwKCPGhBg1u4Axzp/iHJBbYcr55+KIJg0VTVVJFWIBnkmI0
   1E7Fdf49d1aumN5H8UXNrdnQa2gpQFQFWmNN9b+9zIVK24yr/hoqAYZ+S
   wJPFiedGgm2CKi16K4p8PWFLjtBglqdrYvEKnvIFJsAiO2E4VrXLQfNpE
   AXwGgnBtXKba8uvG4OuSGh6LZ7AfT6y96lwBzZyo6BydA+8BS5IcymMbC
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="178431197"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:28:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:28:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 05:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jri5WDL0Zr7yJz09vC71abz43FzMa8VQyyFjPJTAvqmWo9SH3Uri/FAV7JMHqTPN+glnXV8r2k9vtE0c0GuLtdAFlTEF+MJGvf4RgvGJngjnwTONsZTv3mYPb6xteorLxdUj+iDtIkHZ2MdBv1EBqINnTD/0212ViRP0n/QKpSPuZZCtQiU2FaFa5ymGqyMeXqb6g6ojVj6ntmb3DfVWGMGR25y9BBE3eHBeKmCvdR2A7qltaFHvbGE0JO7/x0xz817YhKa/6olvcXUxsRiIRYLp/Btg41K5PKTAr9Y0wKfnmxV0su7vpyRv5d9cNBxNkpVBRspN2kcrwgiNz6YHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+DOTxKIGtAvtdqKg0MYGZU9Ak/bOfzkaLeDwHnuqAA=;
 b=XBZYzcy6GKZJ8NMGI3JR854miQO1b4EVplrmCbRRdFSRc/EPPVAAdf8tVykDRxY3WLiqVUoetdbbPT9mQMzNi5wRJcpLqPoiEXKCKYHUY9/5a2wbXpIl1P14vT8IuSCEMfVKXVkdeTgUxEqnpMBqj/ODEcAz7ArhLAcXYuOuVVK45OR6DXUgGs4WWsNxg/RxPVTXvGw7aXye56nqojwnGO783e2RmpYjplioL0D0uSBrTWrq40cxif4DMESu4d2J2oiv9l49CAdlLMGC/C44fZViypu8tAW+9tjkr1FlggB4WfWGP+RBR6mq7Syxzstt55DRyHX4hfbh8IvDFPwraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+DOTxKIGtAvtdqKg0MYGZU9Ak/bOfzkaLeDwHnuqAA=;
 b=CGdiE+KwYezUSHjeQORqHIiobYUTvEz6CbTk3HCU+pa0EhJjgoU5hPiw0EBBqCaNJHKh1SsAAe9QEeS+pbIC57KVAknrOxa+M38ryxMm+L8tPj1iFbIqeIDz3dq3/OHEWvGULCI0BQi3aHIczR1Xr7BGGDS0AIQOrVmNtgOP5bo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB2043.namprd11.prod.outlook.com (2603:10b6:3:e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Tue, 30 Aug 2022 12:28:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 12:28:15 +0000
From: <Conor.Dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>, <Hugh.Breslin@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Claudiu.Beznea@microchip.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/5] Add PolarFire SoC Fabric Clock Conditioning
 Circuitry Support
Thread-Topic: [PATCH v3 0/5] Add PolarFire SoC Fabric Clock Conditioning
 Circuitry Support
Thread-Index: AQHYvGsBwsWIhQ+jCUSS/IGObfwRE63HXwkA
Date: Tue, 30 Aug 2022 12:28:15 +0000
Message-ID: <23085a41-eaf5-2f36-17bb-afc6d2a53d66@microchip.com>
References: <20220830122023.2204485-1-conor.dooley@microchip.com>
In-Reply-To: <20220830122023.2204485-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73620e62-43bb-414a-89e3-08da8a831cf1
x-ms-traffictypediagnostic: DM5PR11MB2043:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwXZ8DXi2sxU8USemO/0ujSezx6BE3kjpp4mBZVyLC/n/xnpBJTd1OI/q8JtesmUHl7cXwyFqyzibepXfD32jDfMy6FCCQod4jtT/B9M7Kt+QwJTbxngnGHA3+jrP/xfr/XrDJ0g8e51RHFg4zNYW+tV7I3a2KDJml5VwcVhxFvfQM0T0/bXpTHi1saGtVWHP0SwzPoU3vcAuAFugDXhnqZKFzyB+G97oQCAU38lIN3pJZv0pugg5pDSbaAarUOx3jG0SUlxQ3BOwwlPG5fHjUGzWIMd6GshGUX2SaqhcidnCDLS/jD698yQB1liPpP19F/QXeUiQMi9LA9OYKqM3xdc0EvMJuQYLkCir9Wzz6xZrS34XFZ4B1B+VHLw4gvKQ1EFUPQFNIWtf7bToZHN8ObaJyFDsSDXxWPnkYufRBJM3X7ZcrouWxypwjAgrR4GQHI822BgAbhkNxwSj+iZP1Rlgd7w6uuyDrBDdmiym4GB+V3FFxThspf9plI2x8svZkfwLudMcg7qbddHhtqxxG7zHKT/8+8boodhP0lOLiMkhG3Emi8vPTvnuUtbjAh/JsIxa+ZjeGhi0bORB3PmHNAvgsRoCrVr1wmk1E2BiLPjr+w244mB67YzMr5GnjzsQve7nsWCYxGnyjXNL4vN5eZm24OHgPsyyWQaXklI24Od211LQbmgQs+MPwcfYs/iCc6/xhgSyQRhEn4RdqMqB+fD2TVhauUGpCDCruI/OaoLXrX5OxgWMBSIo8juD7Qh4Xm1LyOQF2cPdWFYs4PkRx9ocqlg/9v8VBlhPjHawVjpOb2rC1qO6fkLm+x75iXsynYg8zqKYP4B792oIsB5/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(31696002)(186003)(2616005)(26005)(316002)(71200400001)(6636002)(36756003)(6512007)(83380400001)(2906002)(6506007)(53546011)(66476007)(31686004)(86362001)(38070700005)(76116006)(122000001)(110136005)(41300700001)(7416002)(8936002)(6486002)(38100700002)(478600001)(91956017)(54906003)(5660300002)(66556008)(64756008)(66946007)(4326008)(8676002)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0kvOFp1WmFDNncya2ZaUWk0M3dQNzBkN1JYQVFHUTRGMEZXckRma3RPS2Nk?=
 =?utf-8?B?QS8zajlaNnJMdE1iSGpJS0FKbndkYXdKNkRVYnYwSkFESzRWVEg1aldDbHFG?=
 =?utf-8?B?dllqWUc5ZGl1MVB0K1FmMGNJdkgxMDZMd0R1THpDQm5ia2ZIN3BJZXFvOVhR?=
 =?utf-8?B?Y3J2T090NmhXRDdyT2pzM1psUWFEVXVNVGJUbG9zbi9BYUp6Q0w2enJydHdt?=
 =?utf-8?B?WEpFOWdxSTFxMHMzcHVyRUF5UGhiZitveUtER3poWVNJYTlPM3gwVEhXcXRT?=
 =?utf-8?B?UERxUCtQOHh4dCtLRkhJL1pNNUFuN1N1STVRWmFlNm54RDRRa0RTcVVhYmd1?=
 =?utf-8?B?Mnc2cUlXR0JReHVQVG11bVppVTh1VjFLY1ZIc1J6eFVGVUZzejJjcnBvbFNn?=
 =?utf-8?B?bGxOY1Jvb2o3Q01Ya2lrM2ordjJYOWxXM2JRSDkrVmtnS0U5eHBuaWNPdzkx?=
 =?utf-8?B?b2NOdW9haUhHcmxQMVEvdVhMOUppVnBQVSt0VE15bUoxS0RNeFE3YmJNVVVK?=
 =?utf-8?B?NU1nVWluemhSR1hzTlovc29TVVVXSzVHRklFSDdPSDRFRXJLa0JBVlVnVGwr?=
 =?utf-8?B?cFdCQ29nUEIrZnlrekEzc3hwb2dpQzB3cERhdEtBSXV5bUp2MzhWTGt0SzM1?=
 =?utf-8?B?ZUNmdlVzanIrOGM1aVRHb3JaM3lFY3dWbjNWdnk4NFB3RzhNWjFOZmkrWFFI?=
 =?utf-8?B?bHFzTzZ1ODFzblJxQXhjbG9hSlRSRjE2T1N3ZWZjUEYzM1VOYm1FSUU2Nll3?=
 =?utf-8?B?RkkvZWRUNG5Dc25FN0p5ekFaMHhBekYzU1lHRW5NVHdlMWVSYTVBaTBDSTZs?=
 =?utf-8?B?aGYzUjVGNkRjcFZlT043N1lNWVJDMlVIUTZoNU4xeTE2ZC9HOVhkd2t3MU1m?=
 =?utf-8?B?M3hLZnVTQ2R6cVAwNzFJcTFxbDllSnA0Nk9wTmRzZEJ4c1Z3ZFFJN0MyVlhq?=
 =?utf-8?B?R05aSGtZNG5EN0ZnaUtWQmdvL08yMzJyY3BTclVoR1RUWEh5WTVKTVJ2ME9l?=
 =?utf-8?B?OVBtT252SVRsMVlDVHh5UmdQYjFOTk1rRDEwK3gxMWNVaGtsbzJqQ2VUdktx?=
 =?utf-8?B?M3VHL1FjM1BLWWxpL04ya0RoNytTaGVtQjgvUEl2WENCNTNlUlVubHpRUGR5?=
 =?utf-8?B?STNNbHl5VzJIcHBmK3cxczJRaHFKL2tWcU80MXV5ak1xUVBMWVFLVUpGQVZK?=
 =?utf-8?B?YUZ5ZE5DUlR0UVB1R2JEaDA1NkdRMDdUb0xMN0xNSGtsclUwQ2tqckJlNWVR?=
 =?utf-8?B?M3RLa2NyYmF5Tm9JaTdMRy85UHRDZU9TU1dnL2tKYmE3b0prd2wrdnFKYmxy?=
 =?utf-8?B?eW9MbmxQcnd1bmRFU1FOR0hocjlzNEJiSFBHb3g2VlZSdzE1dUZURmVkWHJZ?=
 =?utf-8?B?SWNDK2REV0liQW9LdW5EaTBRKzF2UE9YU2M4THgza3RuanhNZnZBZ0p4Um9h?=
 =?utf-8?B?aUVmZzR6SVRIbENaeHRlZGVCMHRQbTgyNE1IVmlkQkVWNEw2NzVURUthMkpC?=
 =?utf-8?B?cUVrNWdFVlNyNXdXVG5nelVCNlprTFQxMGNWYmhmRFVZM3pLOCtJMVRON2lT?=
 =?utf-8?B?aHhRNk9taFhKZ2tYZTJIREdhSE52OXFKZlV3cmtBZUpEbFBhQVUvWGZJWjEw?=
 =?utf-8?B?ak5zY3BFeTdGV2tkZlh3bVJKTFFScGI5YkhBTTdYMlJ2OEZwR0VCV3A4eVly?=
 =?utf-8?B?bWtOTkRXTEJMMXVNNGY0Ly9udlAxeEpPdTQwaVZCWWNkRWVHVVBKbm16MU1Y?=
 =?utf-8?B?UFpnRGN3UWFxV2xBbGdDbEx1VGt2SjlITzFyNDhuN1JidEhVUkNNVEEvKzBV?=
 =?utf-8?B?UDhMb0VGRUdMRUFaS3JHekpySDFzdGFWZE13WWF4T0pOSWVKMG1rVTR6SW9w?=
 =?utf-8?B?NHRjOXBjSzlva01LeUZnZ25qcmZZUzRpZWp3Y3ppWnl5NnoyU2xoYnAxeGhZ?=
 =?utf-8?B?Y1Q5bXlDeVp0RFlaT1lCY2JNVzBlbXVVK1dua2hhd1d6YU1DZkZtUWdMRHJR?=
 =?utf-8?B?c1lUTnNHODJ4dFlXY2crR3VFeVRPV0tSWHVqbUgxZmdBQkg5aGhzSXJQTWJQ?=
 =?utf-8?B?NFVSM2d5c21wQzBVMHRUZCswUVFaOEZhVVIveHUrQ3ZPbEV3OW5SZUV6cTI4?=
 =?utf-8?Q?A0u14h6HyUC8I7N0rx9Hm4lvL?=
Content-ID: <47F2B252C757414DA2067543F443E907@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73620e62-43bb-414a-89e3-08da8a831cf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 12:28:15.7130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/J1Pko5hHJX+/Lfr0KtEK6+qpRirJT7xA68c05mUI5N1/oKVLQFMs/Mc7GkTHUi2xW6TirNem5YsD6VnCY03b3KJqVyIQRprR25WDmdfNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_052819_242725_39F77F04 
X-CRM114-Status: GOOD (  15.28  )
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

On 30/08/2022 13:20, Conor Dooley wrote:
>[PATCH v3 0/5] Add PolarFire SoC Fabric Clock Conditioning Circuitry Support
> 
> Changes since v3:

woops, I forgot to increment the version number!
I will resend.

> - return devm_of_clk_add_hw_provider() directly in probe
> - add a `hw_data.num = num_clks` that got lost along the way somewhere
> - mark all output clocks as CLK_DIVIDER_ONE_BASED
> 
> Changes since v2:
> - Removed the unintentionaly leftover clock-output-names
> - Dropped the riscv/microchip dt-binding update. I am moving it to
>    another series so that another series for the dts, which is likely to
>    be applied first would not depend on this series.
> 
> Changes since v1:
> - Stopped using the dt node name to generate the clk name. Rather than
>    use clock-output-names etc, I just opted to call each PLL after it's
>    individual base address:
>    cccrefclk
>      ccc@38100000_pll0
>        ccc@38100000_pll0_out3
>        ccc@38100000_pll0_out2
>        ccc@38100000_pll0_out1
>        ccc@38100000_pll0_out0
> - dt nodes are now all called "clock-controller"
> 
> Conor Dooley (5):
>    dt-bindings: clk: rename mpfs-clkcfg binding
>    dt-bindings: clk: document PolarFire SoC fabric clocks
>    dt-bindings: clk: add PolarFire SoC fabric clock ids
>    clk: microchip: add PolarFire SoC fabric clock support
>    riscv: dts: microchip: add the mpfs' fabric clock control
> 
>   .../bindings/clock/microchip,mpfs-ccc.yaml    |  80 +++++
>   ...p,mpfs.yaml => microchip,mpfs-clkcfg.yaml} |   2 +-
>   .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  27 +-
>   .../boot/dts/microchip/mpfs-icicle-kit.dts    |   4 +
>   .../dts/microchip/mpfs-polarberry-fabric.dtsi |   5 +
>   arch/riscv/boot/dts/microchip/mpfs.dtsi       |  34 +-
>   drivers/clk/microchip/Makefile                |   1 +
>   drivers/clk/microchip/clk-mpfs-ccc.c          | 290 ++++++++++++++++++
>   .../dt-bindings/clock/microchip,mpfs-clock.h  |  23 ++
>   9 files changed, 453 insertions(+), 13 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
>   rename Documentation/devicetree/bindings/clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} (96%)
>   create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c
> 
> 
> base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
